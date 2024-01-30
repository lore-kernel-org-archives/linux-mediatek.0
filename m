Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C678C4828C
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+6Wx9J5aShjzPhykV0nGlqV9LZlKecAxr4zjpw6/s0=; b=fuz4I151dqOg09YNU6BkmmDjUI
	Q+vJSs9NeNQRZCnGot1OU3WNzXOLD/J8fbuLCJA7a/q+0fhblhT+IdA2P1B7enFMUjVLSKTjfNfTF
	7dUbO7JWt7dcB1C09QVtLqfC0jTI+G6mf7VcRJuYeLsfDNln5gXD63ZjRdTHLI/cATe+6laDknmxq
	kg4/EdtFAX7VQMELT4m4kTIVjLfdJ1DZBSJqg5PllbUDa8bQGxXU1CdmkhHz5BV+7R7daELvsuE1k
	l8Hvn3nPhyBHggx6KgYLmSCbQeNioCsNeIcPrLqPZiYXIAho7Ggwzy+13GWsEVJQ+nK8JiXy/GDDC
	wmpVmlsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpfr-0000000H5Vx-0Csq;
	Tue, 30 Jan 2024 15:05:19 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpfk-0000000H5OQ-1MxU;
	Tue, 30 Jan 2024 15:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706627111;
	bh=jWgH1wt2P+WmiafYOD6k4YLKcf4liwSXj2vQg8ErA1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ryF5aEf/x2Xps+n2j+YTnU7IF7HUIfbnr6ze5amLT43mqdhzZYE8MwPFrifkQ33/e
	 9Imu3SdRH5rtUod6+Z+ktYsznMCIaEbR9GI7l0SxN4pe8LsVyEz1NiGtbbSbCPheHI
	 OGcsGngxWSm8dcV6kSuyRvMMsdUgAogUqrvoOTtLzKgv4UqFbmFcH1IZawlziI3U7S
	 Fw/CPOILix0aq6Eho7iOGLI06PYLntrful/9GU8KObaoo2rq51/e8tx9l5PKWg92T3
	 Gxos2veMW5CbaoutP7RLL0W/xZJFvAwID3W7e64Hk30L2wlEecDUJqlJ7NdAYa2+4N
	 aPasaoSR39M/Q==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5A5553782079;
	Tue, 30 Jan 2024 15:05:06 +0000 (UTC)
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
Subject: [PATCH v3 3/9] drm/ci: mediatek: Add job to test panfrost and powervr GPU driver
Date: Tue, 30 Jan 2024 20:33:34 +0530
Message-Id: <20240130150340.687871-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130150340.687871-1-vignesh.raman@collabora.com>
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_070512_704796_5AF7459B 
X-CRM114-Status: GOOD (  17.03  )
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

For mediatek mt8173, the GPU driver is powervr and for mediatek
mt8183, the GPU driver is panfrost. So add support in drm-ci to
test panfrost and powervr GPU driver for mediatek SOCs and update
xfails. Powervr driver was merged in linux kernel, but there's no
mediatek support yet. So disable the mt8173-gpu job which uses
powervr driver.

Add panfrost specific tests to testlist and skip KMS tests for
panfrost driver since it is not a not a KMS driver. Also update
the MAINTAINERS file to include xfails for panfrost driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Add panfrost and PVR GPU jobs for mediatek SOC with new xfails, add xfail
    entry to MAINTAINERS.

v3:
  - Add panfrost specific tests to testlist and skip KMS tests for
    panfrost driver since it is not a not a KMS driver and update xfails.
    Update the MAINTAINERS file to include xfails for panfrost driver.
    Add the job name in GPU_VERSION and use it for xfail file names instead
    of using DRIVER_NAME.

---
 MAINTAINERS                                    |  1 +
 drivers/gpu/drm/ci/test.yml                    | 18 ++++++++++++++++++
 drivers/gpu/drm/ci/testlist.txt                | 16 ++++++++++++++++
 .../ci/xfails/mediatek-mt8183-gpu-skips.txt    |  2 ++
 4 files changed, 37 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d959a6881f7..bcdc17d1aa26 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1645,6 +1645,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/gpu/panfrost.rst
+F:	drivers/gpu/drm/ci/xfails/panfrost*
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 0cd44e6ea18b..e153c5a7ad80 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -299,6 +299,17 @@ amdgpu:stoney:
     DEVICE_TYPE: mt8183-kukui-jacuzzi-juniper-sku16
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8183-kukui-jacuzzi-juniper-sku16
 
+mediatek:mt8173-gpu:
+  extends:
+    - .mt8173
+  variables:
+    GPU_VERSION: mediatek-mt8173-gpu
+    DRIVER_NAME: powervr
+  rules:
+    # TODO: powervr driver was merged in linux kernel, but there's no mediatek support yet
+    # Remove the rule once mediatek support is added for powervr
+    - when: never
+
 mediatek:mt8173-display:
   extends:
     - .mt8173
@@ -306,6 +317,13 @@ mediatek:mt8173-display:
     GPU_VERSION: mediatek-mt8173-display
     DRIVER_NAME: mediatek
 
+mediatek:mt8183-gpu:
+  extends:
+    - .mt8183
+  variables:
+    GPU_VERSION: mediatek-mt8183-gpu
+    DRIVER_NAME: panfrost
+
 mediatek:mt8183-display:
   extends:
     - .mt8183
diff --git a/drivers/gpu/drm/ci/testlist.txt b/drivers/gpu/drm/ci/testlist.txt
index eaeb751bb0ad..772fc025b1f8 100644
--- a/drivers/gpu/drm/ci/testlist.txt
+++ b/drivers/gpu/drm/ci/testlist.txt
@@ -2959,3 +2959,19 @@ msm_submit@invalid-duplicate-bo-submit
 msm_submit@invalid-cmd-idx-submit
 msm_submit@invalid-cmd-type-submit
 msm_submit@valid-submit
+panfrost_get_param@base-params
+panfrost_get_param@get-bad-param
+panfrost_get_param@get-bad-padding
+panfrost_gem_new@gem-new-4096
+panfrost_gem_new@gem-new-0
+panfrost_gem_new@gem-new-zeroed
+panfrost_prime@gem-prime-import
+panfrost_submit@pan-submit
+panfrost_submit@pan-submit-error-no-jc
+panfrost_submit@pan-submit-error-bad-in-syncs
+panfrost_submit@pan-submit-error-bad-bo-handles
+panfrost_submit@pan-submit-error-bad-requirements
+panfrost_submit@pan-submit-error-bad-out-sync
+panfrost_submit@pan-reset
+panfrost_submit@pan-submit-and-close
+panfrost_submit@pan-unhandled-pagefault
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt
new file mode 100644
index 000000000000..2ea09d1648bc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt
@@ -0,0 +1,2 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
-- 
2.40.1


