#ifndef INPUTSTREAM_H
#define INPUTSTREAM_H

#include "InflowBoundaryModel.H"
#include "polyMesh.H"
#include "constants.H"

namespace Foam {

template<class CloudType>
class InputStream
        :
        public InflowBoundaryModel<CloudType>
{

    scalar sqrtPi = sqrt(pi);

    //Name of dict with molecular abundances
    const word componentAbundancesDictName_ = "componentAbundances";
    // Private Data

    //- The indices of patches to introduce molecules across
    labelList patches_;

    //Names of the molecules
    wordList componentNames_;

    scalarList componentAbundances_;

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
InputStream<CloudType>::InputStream(const dictionary &dict, CloudType &cloud)
    :
      InflowBoundaryModel<CloudType>(dict, cloud, typeName)
{
    DynamicList<label> patches;
    forAll(cloud.mesh().boundaryMesh(), p){
        const polyPatch * patch = & cloud.mesh().boundaryMesh()[p];
        if(isType<polyPatch>(patch)){
            patches.append(p);
        }
    }
    patches_.transfer(patches);

    const dictionary& componentAbundances = this->coeffDict().subDict(
                componentAbundancesDictName_);

    componentNames_ = componentAbundances.toc();
    componentAbundances_.setSize(componentNames_.size());
    forAll(componentNames_, n)
    {
        componentAbundances_[n] = componentAbundances.lookup<scalar>(componentNames_[n]);
        Info << componentNames_[n] << " : " << componentAbundances_[n] << "\n";
    }
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


}

template<class CloudType>
void InputStream<CloudType>::autoMap(const mapPolyMesh&) {
    Info << "Just dummy yet \n";
}

}

#endif // INPUTSTREAM_H
