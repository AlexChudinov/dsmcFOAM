#ifndef INPUTSTREAM_H
#define INPUTSTREAM_H

#include "InflowBoundaryModel.H"
#include "polyMesh.H"

namespace Foam {

template<class CloudType>
class InputStream
        :
            public InflowBoundaryModel<CloudType>
{
public:
    // Private Data

        //- The indices of patches to introduce molecules across
        labelList patches_;

        //- The molecule types to be introduced
        List<label> moleculeTypeIds_;

        //- The number density of the species in the inflow
        Field<scalar> numberDensities_;

        //- A List of Lists of Fields specifying carry-over of mass flux from
        // one timestep to the next
        // + Outer List - one inner List for each patch
        // + Inner List - one Field for every species to be introduced
        // + Each field entry corresponding to a face to be injected across
        //   with a particular species
        List<List<Field<scalar>>> particleFluxAccumulators_;


public:

    //- Runtime type information
    TypeName("InputStream");


    // Constructors

        //- Construct from dictionary
        InputStream
        (
            const dictionary& dict,
            CloudType& cloud
        );


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
void InputStream<CloudType>::inflow()
{
    Info << "Just dummy yet \n";
}

template<class CloudType>
void InputStream<CloudType>::autoMap(const mapPolyMesh&) {
    Info << "Just dummy yet \n";
}

}

#endif // INPUTSTREAM_H
