# Contribution Guidelines

As an open-source project, we appreciate and encourage community members to submit patches directly to the project. To maintain a well-organized development environment, we have established standards and methods for submitting changes. This document outlines the process for submitting patches to the project, ensuring that your contribution is swiftly incorporated into the codebase.

# Licensing

Licensing is crucial for open-source projects, as it guarantees that the software remains available under the conditions specified by the author.

This project employs the Creative Commons Attribution 4.0 International license, which can be found in the LICENSE file within the project's repository.

Licensing defines the rights granted to you as an author by the copyright holder. It is essential for contributors to fully understand and accept these licensing rights. In some cases, the copyright holder may not be the contributor, such as when the contributor is working on behalf of a company.

# Developer Certificate of Origin (DCO)
To uphold licensing criteria and demonstrate good faith, this project mandates adherence to the Developer Certificate of Origin (DCO) process.

The DCO is an attestation appended to every contribution from each author. In the commit message of the contribution (explained in greater detail later in this document), the author adds a Signed-off-by statement, thereby accepting the DCO.

When an author submits a patch, they affirm that they possess the right to submit the patch under the designated license. The DCO agreement is displayed below and at https://developercertificate.org.


Developer's Certificate of Origin 1.1

By making a contribution to this project, I certify that:

(a) The contribution was created in whole or in part by me and I
    have the right to submit it under the open source license
    indicated in the file; or

(b) The contribution is based upon previous work that, to the best
    of my knowledge, is covered under an appropriate open source
    license and I have the right under that license to submit that
    work with modifications, whether created in whole or in part
    by me, under the same open source license (unless I am
    permitted to submit under a different license), as indicated
    in the file; or

(c) The contribution was provided directly to me by some other
    person who certified (a), (b), or (c), and I have not modified
    it.

(d) I understand and agree that this project and the contribution
    are public and that a record of the contribution (including all
    personal information I submit with it, including my sign-off) is
    maintained indefinitely and may be redistributed consistent with
    this project or the open source license(s) involved.

# DCO Sign-Off Methods
The DCO necessitates the inclusion of a sign-off message in the following format for each commit within the pull request:

Signed-off-by: Stephano Cetola <scetola@linuxfoundation.org>

Please use your real name in the sign-off message.

You can manually add the DCO text to your commit body or include either -s or --signoff in your standard Git commit commands. If you forget to incorporate the sign-off, you can also amend a previous commit with the sign-off by executing git commit --amend -s. If you have already pushed your changes to GitHub, you will need to force push your branch afterward using git push -f.

Note:

Ensure that the name and email address associated with your GitHub account match the name and email address in the Signed-off-by line of your commit message.
