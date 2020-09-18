#ifndef INPUTSTREAM_H
#define INPUTSTREAM_H

#include "InflowBoundaryModel.H"
#include "polyMesh.H"
#include "constants.H"
#include "tetIndices.H"

namespace Foam {

template<class CloudType>
class InputStream
        :
        public InflowBoundaryModel<CloudType>
{

    const scalar sqrtPi = sqrt(pi);

    //Name of dict with molecular abundances
    const word componentAbundancesDictName_ = "componentAbundances";

    const word moleculePropertiesDicrName_ = "moleculeProperties";

    const word massDictKey_ = "mass";

    // Private Data

    //- The indices of patches to introduce molecules across
    labelList patches_;

    //Names of the molecules
    wordList componentNames_;

    scalarList componentAbundances_;

    scalarList componentMasses_;

    void checkTemperature() const;

public:

    //- Runtime type information
    TypeName("InputStream");


    // Constructors

    //- Construct from dictionary
    InputStream(
            const dictionary& dict,
            CloudType& cloud);


    //- Destructor
    virtual ~InputStream();


    // Member Functions

    // Mapping

    //- Remap the particles to the correct cells following mesh change
    virtual void autoMap(const mapPolyMesh&);

    //- Introduce particles
    virtual void inflow();
};

template<class CloudType>
void InputStream<CloudType>::checkTemperature() const
{
    const volScalarField::Boundary& boundaryT = this->owner().boundaryT().boundaryField();
    forAll(patches_, p){
        if(min(boundaryT[p]) < small){
            FatalErrorInFunction
                    << "Zero boundary temperature detected, check boundaryT "
                    << "condition." << nl
                    << nl << abort(FatalError);
        }
    }
}

template<class CloudType>
InputStream<CloudType>::InputStream(const dictionary &dict, CloudType &cloud)
    :
      InflowBoundaryModel<CloudType>(dict, cloud, typeName)
{
    DynamicList<label> patches;
    forAll(cloud.mesh().boundaryMesh(), p){
        const polyPatch& patch = cloud.mesh().boundaryMesh()[p];
        if(isType<polyPatch>(patch)){
            patches.append(p);
        }
    }
    patches_.transfer(patches);

    const dictionary& componentAbundances = this->coeffDict().subDict(
                componentAbundancesDictName_);

    componentNames_ = componentAbundances.toc();
    componentAbundances_.setSize(componentNames_.size());
    componentMasses_.setSize(componentNames_.size());
    const dictionary& moleculeProperties = cloud.particleProperties().subDict(
                moleculePropertiesDicrName_);
    Info << "Create custom properties of molecules for molecular inflow: " << nl;
    forAll(componentNames_, n)
    {
        componentAbundances_[n] = componentAbundances.lookup<scalar>(componentNames_[n]);
        componentMasses_[n] = moleculeProperties.subDict(componentNames_[n])
                .lookup<scalar>(massDictKey_);

        Info << componentNames_[n] << " : "
             << componentAbundances_[n] << " : "
             << componentMasses_[n] << nl;
    }

    checkTemperature();
}

template<class CloudType>
InputStream<CloudType>::~InputStream()
{

}

template<class CloudType>
void InputStream<CloudType>::inflow()
{
    CloudType& cloud = this->owner();

    const polyMesh & mesh = cloud.mesh();

    const scalar deltaT = mesh.time().deltaTValue();

    Random & rndGen = cloud.rndGen();

    label particlesInserted = 0;

    const volScalarField::Boundary& boundaryT = cloud.boundaryT().boundaryField();

    const volVectorField::Boundary& boundaryU = cloud.boundaryU().boundaryField();

    const volScalarField::Boundary& rhoN = cloud.rhoN().boundaryField();

    forAll(componentMasses_, componenti)
    {
        forAll(patches_, p){
            const label patchi = patches_[p];

            const polyPatch& patch = mesh.boundaryMesh()[patchi];

            scalarField mostProbableSpeed = cloud.maxwellianMostProbableSpeed(
                        boundaryT[patchi],
                        componentMasses_[componenti]);

            scalarField sCosTheta = (boundaryU[patchi] & -patch.faceAreas() / patch.magFaceAreas())
                    / mostProbableSpeed;

            forAll(patch, facei){
                const face& f = patch[facei];

                label globalFaceIndex = facei + patch.start();

                label celli = mesh.faceOwner()[globalFaceIndex];

                const vector& fC = patch.faceCentres()[facei];

                scalar fA = patch.magFaceAreas()[facei];

                List<tetIndices> faceTets = polyMeshTetDecomposition::faceTetIndices
                (
                    mesh,
                    globalFaceIndex,
                    celli
                );


            }
        }
    }
}

template<class CloudType>
void InputStream<CloudType>::autoMap(const mapPolyMesh&) {
    Info << "Just dummy yet \n";
}

}

#endif // INPUTSTREAM_H
