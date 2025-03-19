Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5603CC35FFA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Mar 2025 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HICfp25x6A8uBlCw5p5+rBvNZqOl807JCLoXLGdju5w=; b=Hq4TEyePxctYIks4ou6FygNB7O
	sry/nbq15zvZGeapsIUlqipx1+gTYdmsC+/ko8jDEHlGKBKZU8tZknMYB1Dy9m1dENlMrmMOf0A1z
	CuEi0IJxmkFu8lMeR4Kd1tQRwoJbp9nxIOh7Qu0O+9UfBCsZmlkjN6ATkKRTxkFO67vSnx0f82jdW
	MOucmbum+yf2ZhBIfhMg36A0G81Q7W03qgiB1t+4Xti/FDdMYZ8vmVAGmvD/BTslcISNwynStJUB0
	adlKUG26yvJ0q3fh5gFyG5ncDAhJlTBuqlzsg0xm8jwmeWKLHEoB0o6mRAcgFfmaLRV1l867cojW3
	kYPP4LPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuxRZ-00000009jyn-0ny9;
	Wed, 19 Mar 2025 17:43:05 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuxJM-00000009ikA-02Ut;
	Wed, 19 Mar 2025 17:34:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so3757621a12.0;
        Wed, 19 Mar 2025 10:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742405674; x=1743010474; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HICfp25x6A8uBlCw5p5+rBvNZqOl807JCLoXLGdju5w=;
        b=KX5BLNxmaNzgmOa402BbqKfWvNNNjUd3tzH8cxeL1L85ATNzC48CFmjZPR0Xs57Imd
         UfEh0l9xRPsCfsle0c4pTpKFrITtzo8wM1MUSXUcuU0YKl9aMUA8g1YRimlAkONfgOF6
         7mMq9wImdVwLKY5FTyAEvxFlH8g3XqDDOLAG/Hs6Vz3CfgrzL9qmBPKMKVtMCQ7G+O3+
         RCrGCQws6rZBXeUuAGsX3HCZNko4jGjipXICmW2qQ4uSMG78PXOsxABmc8Q8xgBj7z3h
         /6z3bvM0ntapPWzcCcAi5fnKN1f43Mhkam2eVjRFiW/ObUpCe1MTjMRnWtUWp4H14leq
         9GNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742405674; x=1743010474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HICfp25x6A8uBlCw5p5+rBvNZqOl807JCLoXLGdju5w=;
        b=ntkN/AKDUIYh0ek52uKBZE2xFBZkrW/JByrvCEQEt+AOa9SdxgzrBNDPI/9s4+Cnd5
         +IwXK+GXlna53IR5a8y3zJkbOaZlKl3FYz73rSU/sVGmytkc4xgChHVUisnq8et3BdmG
         prb3J+HxVbJI8x2FJQkznI4I1QU0MWd1+OLWEsKIBHqtlCn+EkLOK/Aso4rd93tyZbqU
         WZPKCeIm2mwqz2dsF0OfaPr02nXlOeuTIQxE0JNRB14kIU97SZxcBb6s0dhDt5R+tn7w
         TbbB/IW++8roENYA7XiXSbnq04CwtQNKsE46IMIABWShYGogC12IiEfnB3AQodyyZoWb
         fbkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNl8kvnOxp439CvcSblXf9ECXOyHSfH+jyLZNldU23VzTYSjllxc/K76dUifD0E3pgVjeqTc/yneIXpt+m@lists.infradead.org, AJvYcCVIU9Rga+Jo0NXh76SXk1LLwr11AzVdMx4WssVjujJAjYtK7BpmQ0KyvYgVplc/cfTeqXgsrZyHrZvT/H+NxKY=@lists.infradead.org, AJvYcCXBOtPpnDzFaaBzVB8gPdhCFBVaFX1pzKgdQKDEQPPd0OLWQ6oEeKwt2tK+UvNL7IUJ+j2ZlBAg146jyJllfjY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOQl0lmiWvmeKiQlOAJP7U1RPOtR0hnLGEugGWSHcqqkuE0gwn
	XzbE2U+SFilCVBvMpKLYF0chhSPx6+ofYiDWLj0zpHo5fX70UgRoCoA68Z/9WUhf7zX5vCBoP0R
	L5y0SENzBFpA0l9AbA5ARZTVypAg=
X-Gm-Gg: ASbGncvyvbfnf3cMqkliRlaIfysIegdUt8kdq9U/zlz0cpRj2BkiGNWVU0uByOJErYK
	Z/c0zhg45fcBWP8HDVtgiVRDIgxZuKJmC698QlhrMXdgazQqjIKvDMQy8aTN4fXHgEZe9G+cbJv
	LQtoomFPxIYxszZ8yUfSC5FBS6HXg=
X-Google-Smtp-Source: AGHT+IHzu2e3XxsHC/7/u8CIt5MaZwZv1sD2yQijEy0cXRzLHdS5nTnlJJGE3hIhSh5QLgw2FNKxwlC7bngh5JrlEtw=
X-Received: by 2002:a05:6402:270b:b0:5e7:b02b:381f with SMTP id
 4fb4d7f45d1cf-5eba02bbcd6mr112300a12.30.1742405673821; Wed, 19 Mar 2025
 10:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250314085858.39328-1-vignesh.raman@collabora.com>
 <20250314085858.39328-2-vignesh.raman@collabora.com> <CAPW4XYZ6+kc+Pj61_Kz8-CEy0Aed92XeXDnUiDAEGNBU+SPxAg@mail.gmail.com>
 <38315386-9975-4bbb-91e8-34b872487c26@collabora.com>
In-Reply-To: <38315386-9975-4bbb-91e8-34b872487c26@collabora.com>
From: Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Date: Wed, 19 Mar 2025 14:34:22 -0300
X-Gm-Features: AQ5f1JoPUcAvMrjBsWoRX2_tKLW_5IVh6ZaI7nzG5lkIPL3lBFa4MqHpkPy7Ams
Message-ID: <CAPW4XYY8=CbhN8G7NFe+w9udsTxC=whtTUCzK9-43mvSk0zdDg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/ci: uprev mesa
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, airlied@gmail.com, 
	simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org, 
	jani.nikula@linux.intel.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_103436_071488_4F3F90D6 
X-CRM114-Status: GOOD (  32.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Em qua., 19 de mar. de 2025 =C3=A0s 10:24, Vignesh Raman
<vignesh.raman@collabora.com> escreveu:
>
> Hi Helen,
>
> On 19/03/25 00:22, Helen Mae Koike Fornazier wrote:
> > Em sex., 14 de mar. de 2025 =C3=A0s 05:59, Vignesh Raman
> > <vignesh.raman@collabora.com> escreveu:
> >>
> >> LAVA was recently patched [1] with a fix on how parameters are parsed =
in
> >> `lava-test-case`, so we don't need to repeat quotes to send the
> >> arguments properly to it. Uprev mesa to fix this issue.
> >>
> >> [1] https://gitlab.com/lava/lava/-/commit/18c9cf79
> >>
> >> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> >> ---
> >>   drivers/gpu/drm/ci/build.sh       | 16 ++++++++--------
> >>   drivers/gpu/drm/ci/build.yml      |  8 ++++++++
> >>   drivers/gpu/drm/ci/container.yml  | 24 +++++++++++++++++++++++
> >>   drivers/gpu/drm/ci/gitlab-ci.yml  | 32 +++++++++++++++++++++++++++++=
+-
> >>   drivers/gpu/drm/ci/image-tags.yml |  4 +++-
> >>   drivers/gpu/drm/ci/lava-submit.sh |  3 ++-
> >>   drivers/gpu/drm/ci/test.yml       |  2 +-
> >>   7 files changed, 77 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> >> index 19fe01257ab9..284873e94d8d 100644
> >> --- a/drivers/gpu/drm/ci/build.sh
> >> +++ b/drivers/gpu/drm/ci/build.sh
> >> @@ -98,14 +98,14 @@ done
> >>
> >>   make ${KERNEL_IMAGE_NAME}
> >>
> >> -mkdir -p /lava-files/
> >> +mkdir -p /kernel/
> >
> > the folder is not lava specific, correct?
>
> It is not lava specific. Only the directory name where the kernel image
> is copied is changed and the kernel image is uploaded to S3 for lava.
>
> This is based on,
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/5b65bbf72ce7024c5df2100=
ce4b12d59e8f3dd26

thanks for clarifying.

>
> >
> >>   for image in ${KERNEL_IMAGE_NAME}; do
> >> -    cp arch/${KERNEL_ARCH}/boot/${image} /lava-files/.
> >> +    cp arch/${KERNEL_ARCH}/boot/${image} /kernel/.
> >>   done
> >>
> >>   if [[ -n ${DEVICE_TREES} ]]; then
> >>       make dtbs
> >> -    cp ${DEVICE_TREES} /lava-files/.
> >> +    cp ${DEVICE_TREES} /kernel/.
> >>   fi
> >>
> >>   make modules
> >> @@ -121,11 +121,11 @@ if [[ ${DEBIAN_ARCH} =3D "arm64" ]]; then
> >>           -d arch/arm64/boot/Image.lzma \
> >>           -C lzma\
> >>           -b arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb \
> >> -        /lava-files/cheza-kernel
> >> +        /kernel/cheza-kernel
> >>       KERNEL_IMAGE_NAME+=3D" cheza-kernel"
> >>
> >>       # Make a gzipped copy of the Image for db410c.
> >> -    gzip -k /lava-files/Image
> >> +    gzip -k /kernel/Image
> >>       KERNEL_IMAGE_NAME+=3D" Image.gz"
> >>   fi
> >>
> >> @@ -139,7 +139,7 @@ cp -rfv drivers/gpu/drm/ci/* install/.
> >>   . .gitlab-ci/container/container_post_build.sh
> >>
> >>   if [[ "$UPLOAD_TO_MINIO" =3D "1" ]]; then
> >> -    xz -7 -c -T${FDO_CI_CONCURRENT:-4} vmlinux > /lava-files/vmlinux.=
xz
> >> +    xz -7 -c -T${FDO_CI_CONCURRENT:-4} vmlinux > /kernel/vmlinux.xz
> >>       FILES_TO_UPLOAD=3D"$KERNEL_IMAGE_NAME vmlinux.xz"
> >>
> >>       if [[ -n $DEVICE_TREES ]]; then
> >> @@ -148,7 +148,7 @@ if [[ "$UPLOAD_TO_MINIO" =3D "1" ]]; then
> >>
> >>       ls -l "${S3_JWT_FILE}"
> >>       for f in $FILES_TO_UPLOAD; do
> >> -        ci-fairy s3cp --token-file "${S3_JWT_FILE}" /lava-files/$f \
> >> +        ci-fairy s3cp --token-file "${S3_JWT_FILE}" /kernel/$f \
> >>                   https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/$f
> >>       done
> >>
> >> @@ -165,7 +165,7 @@ ln -s common artifacts/install/ci-common
> >>   cp .config artifacts/${CI_JOB_NAME}_config
> >>
> >>   for image in ${KERNEL_IMAGE_NAME}; do
> >> -    cp /lava-files/$image artifacts/install/.
> >> +    cp /kernel/$image artifacts/install/.
> >>   done
> >>
> >>   tar -C artifacts -cf artifacts/install.tar install
> >> diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.y=
ml
> >> index 6c0dc10b547c..8eb56ebcf4aa 100644
> >> --- a/drivers/gpu/drm/ci/build.yml
> >> +++ b/drivers/gpu/drm/ci/build.yml
> >> @@ -143,6 +143,10 @@ debian-arm64-release:
> >>     rules:
> >>       - when: never
> >>
> >> +debian-arm64-ubsan:
> >> +  rules:
> >> +    - when: never
> >> +
> >>   debian-build-testing:
> >>     rules:
> >>       - when: never
> >> @@ -183,6 +187,10 @@ debian-testing-msan:
> >>     rules:
> >>       - when: never
> >>
> >> +debian-testing-ubsan:
> >> +  rules:
> >> +    - when: never
> >> +
> >>   debian-vulkan:
> >>     rules:
> >>       - when: never
> >> diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/con=
tainer.yml
> >> index 07dc13ff865d..56c95c2f91ae 100644
> >> --- a/drivers/gpu/drm/ci/container.yml
> >> +++ b/drivers/gpu/drm/ci/container.yml
> >> @@ -24,6 +24,18 @@ alpine/x86_64_build:
> >>     rules:
> >>       - when: never
> >>
> >> +debian/arm32_test-base:
> >> +  rules:
> >> +    - when: never
> >> +
> >> +debian/arm32_test-gl:
> >> +  rules:
> >> +    - when: never
> >> +
> >> +debian/arm32_test-vk:
> >> +  rules:
> >> +    - when: never
> >> +
> >>   debian/arm64_test-gl:
> >>     rules:
> >>       - when: never
> >> @@ -32,6 +44,10 @@ debian/arm64_test-vk:
> >>     rules:
> >>       - when: never
> >>
> >> +debian/baremetal_arm32_test:
> >> +  rules:
> >> +    - when: never
> >> +
> >>   debian/ppc64el_build:
> >>     rules:
> >>       - when: never
> >> @@ -40,6 +56,14 @@ debian/s390x_build:
> >>     rules:
> >>       - when: never
> >>
> >> +debian/x86_32_build:
> >> +  rules:
> >> +    - when: never
> >> +
> >> +debian/x86_64_test-android:
> >> +  rules:
> >> +    - when: never
> >> +
> >>   debian/x86_64_test-vk:
> >>     rules:
> >>       - when: never
> >> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/git=
lab-ci.yml
> >> index b06b9e7d3d09..55b540c4cf92 100644
> >> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> >> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> >> @@ -1,6 +1,6 @@
> >>   variables:
> >>     DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
> >> -  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 7d3062470f3ccc6cb40540e772e90=
2c7e2248024
> >> +  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 82ab58f6c6f94fa80ca7e1615146f=
08356e3ba69
> >>
> >>     UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
> >>     TARGET_BRANCH: drm-next
> >> @@ -187,6 +187,36 @@ stages:
> >>       - when: manual
> >>
> >>
> >> +# Repeat of the above but with `when: on_success` replaced with
> >> +# `when: delayed` + `start_in:`, for build-only jobs.
> >> +# Note: make sure the branches in this list are the same as in
> >> +# `.container+build-rules` above.
> >> +.build-only-delayed-rules:
> >> +  rules:
> >> +    - !reference [.common-rules, rules]
> >> +    # Run when re-enabling a disabled farm, but not when disabling it
> >> +    - !reference [.disable-farm-mr-rules, rules]
> >> +    # Never run immediately after merging, as we just ran everything
> >> +    - !reference [.never-post-merge-rules, rules]
> >> +    # Build everything in merge pipelines
> >> +    - if: *is-merge-attempt
> >> +      when: delayed
> >> +      start_in: &build-delay 5 minutes
> >> +    # Same as above, but for pre-merge pipelines
> >> +    - if: *is-pre-merge
> >> +      when: manual
> >> +    # Build everything after someone bypassed the CI
> >> +    - if: *is-direct-push
> >> +      when: manual
> >> +    # Build everything in scheduled pipelines
> >> +    - if: *is-scheduled-pipeline
> >> +      when: delayed
> >> +      start_in: *build-delay
> >> +    # Allow building everything in fork pipelines, but build nothing =
unless
> >> +    # manually triggered
> >> +    - when: manual
> >> +
> >
> > Do you think we could avoid repeating code by using anchor (&) and
> > reference (*) ?
> >
> > https://docs.gitlab.com/ci/yaml/yaml_optimization/#yaml-anchors-for-scr=
ipts
>
> We could create anchors for the repeated rules in .container+build-rules
> and .build-only-delayed-rules, but I would prefer to first do this in
> mesa and then adapt the same in drm-ci. Right now it is the same as
> mesa, so maybe fix this in the next mesa uprev. What do you suggest?

If we just herit from mesa, than sure, we can do this on mesa, but it
seems this could be made here.
But if you think it is better to fix there first than update here, I'm
fine with this too.

Acked-by: Helen Koike <helen.fornazier@gmail.com>

Thanks
Helen

>
> Regards,
> Vignesh
>
> >
> > Regards,
> > Helen
> >
> >> +
> >>   .ci-deqp-artifacts:
> >>     artifacts:
> >>       name: "${CI_PROJECT_NAME}_${CI_JOB_NAME}"
> >> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/im=
age-tags.yml
> >> index 20049f3626b2..c04ba0e69935 100644
> >> --- a/drivers/gpu/drm/ci/image-tags.yml
> >> +++ b/drivers/gpu/drm/ci/image-tags.yml
> >> @@ -1,5 +1,5 @@
> >>   variables:
> >> -   CONTAINER_TAG: "20250204-mesa-uprev"
> >> +   CONTAINER_TAG: "20250307-mesa-uprev"
> >>      DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"
> >>      DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
> >>
> >> @@ -20,3 +20,5 @@ variables:
> >>      DEBIAN_PYUTILS_TAG: "${CONTAINER_TAG}"
> >>
> >>      ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"
> >> +
> >> +   CONDITIONAL_BUILD_ANGLE_TAG: fec96cc945650c5fe9f7188cabe80d8a
> >> diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/la=
va-submit.sh
> >> index 6e5ac51e8c0a..f22720359b33 100755
> >> --- a/drivers/gpu/drm/ci/lava-submit.sh
> >> +++ b/drivers/gpu/drm/ci/lava-submit.sh
> >> @@ -48,7 +48,8 @@ ROOTFS_URL=3D"$(get_path_to_artifact lava-rootfs.tar=
.zst)"
> >>   rm -rf results
> >>   mkdir -p results/job-rootfs-overlay/
> >>
> >> -artifacts/ci-common/generate-env.sh > results/job-rootfs-overlay/set-=
job-env-vars.sh
> >> +artifacts/ci-common/export-gitlab-job-env-for-dut.sh \
> >> +    > results/job-rootfs-overlay/set-job-env-vars.sh
> >>   cp artifacts/ci-common/init-*.sh results/job-rootfs-overlay/
> >>   cp "$SCRIPTS_DIR"/setup-test-env.sh results/job-rootfs-overlay/
> >>
> >> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> >> index dbc4ff50d8ff..84a25f0e783b 100644
> >> --- a/drivers/gpu/drm/ci/test.yml
> >> +++ b/drivers/gpu/drm/ci/test.yml
> >> @@ -112,7 +112,7 @@
> >>       - kvm
> >>     script:
> >>       - ln -sf $CI_PROJECT_DIR/install /install
> >> -    - mv install/bzImage /lava-files/bzImage
> >> +    - mv install/bzImage /kernel/bzImage
> >>       - mkdir -p /lib/modules
> >>       - install/crosvm-runner.sh install/igt_runner.sh
> >>     needs:
> >> --
> >> 2.47.2
> >>
> >
> >
>


--=20
Helen Koike

