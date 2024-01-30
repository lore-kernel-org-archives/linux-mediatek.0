Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E54C47DDB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 15:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSwVggCRvovAd8o3ccnOghhYPqABlirfeP21RrPlXUE=; b=g8m+vNb1ORgZonLGC7oZe+V+og
	H5h/1Qxfijpd8LdJBZ/n2SQwzDgv/fjyojhgbV4H/CIHxhGTEBf4lLWH7AC1ZLCxHcTdoS6QOMu7Z
	NdE/9CVw6WiW0XZJMpYA4nMk2FwApLPx3gQ/r1Yq8imac1Yr6cEDVrRSN8zRbSLY1Mxrh9CkUhBa5
	XrHXkJy18vRsx7EigrOSJrIlIMcGkCT+GSvm1ELvZ76jQ3uOGCUXmo0V73FaxFX/rqiAM0LQzeJGO
	eJXo6I8fUIl4sP94bs+ybpbpjdBF9Hh2geKmtuLudBgfHp2S6arym7L29WitYIO2QcvBU7ZAYghIO
	M3OpMLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpgT-0000000H628-1HAZ;
	Tue, 30 Jan 2024 15:05:57 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpgB-0000000H5mX-2f0f;
	Tue, 30 Jan 2024 15:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706627138;
	bh=hWu7GBYAht/mF2aU5H1CuF3s5mGL5s3hk79b+5cN0Sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vD5RaXJELCvj0/MVsbJmgE8eUKjb5zNkhXCccSWcAnOXDofbLsFPNPLVJzjPPExyH
	 DVPg3MGV2vR/0om6M8dZXfY9BrYjYdN3AiPpqn1s5vKdB6cjQIuCqvjS5ulnEgOs18
	 eO+3Fk6aeRH53xo2zD1Ls/Iz3Z3ubv6SaZYNm41+tu0ilzBxGk53RAXrKhtE+N2KmS
	 o7cVisOBNXh05j+iOV0G7/7wJW9CgqCSrdEZ+27OszHwUnSeSegCBycv77nR2+5puO
	 CQ6sma1zs/W68oWH2mjG//arZYIqW9xCQQmM0ceZix38sQVCNVcOCkg6JOF5Id/Hcm
	 iGT80v82vaZ0A==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A0BCD3781FC7;
	Tue, 30 Jan 2024 15:05:33 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	robdclark@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] drm/ci: uprev mesa version
Date: Tue, 30 Jan 2024 20:33:39 +0530
Message-Id: <20240130150340.687871-9-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130150340.687871-1-vignesh.raman@collabora.com>
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_070540_171390_8570623C 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

zlib.net is not allowing tarball download anymore and results
in below error in kernel+rootfs_arm32 container build,
urllib.error.HTTPError: HTTP Error 403: Forbidden
urllib.error.HTTPError: HTTP Error 415: Unsupported Media Type

Uprev mesa which includes a fix for this issue.
https://gitlab.freedesktop.org/mesa/mesa/-/commit/908f444ec10fe44ae2df004909b2e6206188a71a

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v3:
  - New patch in series to uprev mesa.

---
 drivers/gpu/drm/ci/container.yml  | 6 +++---
 drivers/gpu/drm/ci/gitlab-ci.yml  | 6 +++---
 drivers/gpu/drm/ci/image-tags.yml | 3 ++-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/container.yml
index 9764e7921a4f..1060eb380b02 100644
--- a/drivers/gpu/drm/ci/container.yml
+++ b/drivers/gpu/drm/ci/container.yml
@@ -40,11 +40,11 @@ debian/x86_64_test-android:
   rules:
     - when: never
 
-windows_build_vs2019:
+windows_build_msvc:
   rules:
     - when: never
 
-windows_test_vs2019:
+windows_test_msvc:
   rules:
     - when: never
 
@@ -56,7 +56,7 @@ rustfmt:
    rules:
     - when: never
 
-windows_vs2019:
+windows_msvc:
    rules:
     - when: never
 
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 084e3ff8e3f4..bc8cb3420476 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -1,6 +1,6 @@
 variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
-  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 9d162de9a05155e1c4041857a5848842749164cf
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha c4b32f9e90b7204735e6adf1f60c178bf85752e7
 
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
@@ -26,7 +26,7 @@ variables:
   JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
   # default kernel for rootfs before injecting the current kernel tree
   KERNEL_REPO: "gfx-ci/linux"
-  KERNEL_TAG: "v6.6.4-for-mesa-ci-e4f4c500f7fb"
+  KERNEL_TAG: "v6.6.13-mesa-9916"
   KERNEL_IMAGE_BASE: https://${S3_HOST}/mesa-lava/${KERNEL_REPO}/${KERNEL_TAG}
   LAVA_TAGS: subset-1-gfx
   LAVA_JOB_PRIORITY: 30
@@ -98,6 +98,7 @@ include:
 stages:
   - sanity
   - container
+  - code-validation
   - git-archive
   - build
   - amdgpu
@@ -107,7 +108,6 @@ stages:
   - msm
   - rockchip
   - virtio-gpu
-  - lint
 
 # YAML anchors for rule conditions
 # --------------------------------
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index 7ab4f2514da8..cf07c3e09b8c 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -1,5 +1,5 @@
 variables:
-   CONTAINER_TAG: "2023-10-11-mesa-uprev"
+   CONTAINER_TAG: "2022-01-29-mesa-uprev"
    DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
@@ -7,6 +7,7 @@ variables:
    DEBIAN_BUILD_TAG: "2023-10-08-config"
 
    KERNEL_ROOTFS_TAG: "2023-10-06-amd"
+   PKG_REPO_REV: "67f2c46b"
 
    DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"
    DEBIAN_X86_64_TEST_IMAGE_GL_PATH: "debian/x86_64_test-gl"
-- 
2.40.1


