Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2860CDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 03:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgAq5Lql16tsM/TLRsAZnhGDl+XMwLQCvyjYhsWrztc=; b=rhzkzL9n1cGjnN2g8MAHJzhUYG
	lC5sWpjY9NdfLlZ9ZPVWHAklugdz/SxcuQMqyPZCsNRDJD2TVJyRujCv19m54pSOZQFMTbNsTE4Zp
	Zehquyiy9xUlMHPXQb1ETlIRFb0o3w11caTt0ofVJbMojPqDO3SFhP0rEUHy/Om3EeQsH3gX+796z
	BAsh5igd+kqYrPXpu50zlHhXE2ND3gyxWPCPQ07+5wFvbFCCbopQbNCtzR1OBSKSA5DvTmJ78slHI
	L1JRrbvYsosvYUpgedrmTCGzR0HK/Um2q2PdPU6kd7RFeosvlNQ32C5T4i1dOQ26DVku/UNQGkh4N
	IB4GD3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtgOs-0016md-2D;
	Fri, 20 Oct 2023 03:42:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtgOo-0016ko-2Y;
	Fri, 20 Oct 2023 03:42:12 +0000
Received: from localhost.localdomain (unknown [IPv6:2804:14d:e646:872b:8302:9b9b:d59b:1681])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4FEC6660734A;
	Fri, 20 Oct 2023 04:42:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697773329;
	bh=Ra4SYnnrvudeuTZYuBGT55bgQEN6QNJrjAurGFGlPcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j8khpEhxiss4625Lxvb1U5GHwcBA+qmgqRJqTmZeZdRsp2Rf0xI9z8G50aa/dLOUU
	 akwiuG2fskpMnkmitCn7sU2kva2ZUMaprW718ymaAYKQ1hnM3ltZQ+P8p9sb6tyspU
	 ALVnRLC1m6EeKHApuZ2JtiCJbgEXFnKQjqNdCWeGh79+zwMQ6UMmHGjc+DDfaUa7w8
	 XQafdfdy+Z6YyCoA18hi4MSSRwZTwyIZXir8B5OrL97503rXsxj8i8ZEK81t5AeMZw
	 vyydTtb9/b6FiscoTaXA3xbu1Sz2d4yK6zv8RQE4JeJY2h8RkS28tGPgDm2IjUFCyc
	 1cf1g3vKrks9A==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org,
	Helen Koike <helen.koike@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robdclark@chromium.org,
	dmitry.baryshkov@linaro.org,
	vignesh.raman@collabora.com,
	sergi.blanch.torne@collabora.com,
	guilherme.gallo@collabora.com,
	david.heidelberg@collabora.com,
	quic_abhinavk@quicinc.com,
	quic_jesszhan@quicinc.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/9] drm/ci: uprev IGT and make sure core_getversion is run
Date: Fri, 20 Oct 2023 00:41:19 -0300
Message-Id: <20231020034124.136295-5-helen.koike@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020034124.136295-1-helen.koike@collabora.com>
References: <20231020034124.136295-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_204211_088292_8175AB37 
X-CRM114-Status: GOOD (  16.86  )
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

IGT has recently merged a patch that makes code_getversion test to fails
if the driver isn't loaded or if it isn't the expected one defined in
variable IGT_FORCE_DRIVER.

Without this test, jobs were passing when the driver didn't load or
probe for some reason, giving the illusion that everything was ok.

Uprev IGT to include this modification and include core_getversion test
in all the shards.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>

---

v2:
- fixed typo in the commit message
---
 drivers/gpu/drm/ci/gitlab-ci.yml  |  2 +-
 drivers/gpu/drm/ci/igt_runner.sh  | 31 ++++++++++++++++++++++++-------
 drivers/gpu/drm/ci/image-tags.yml |  2 +-
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 51b1af77b04f..ade6c65a1945 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: 471bfababd070e1dac0ebb87470ac4f2ae85e663
+  IGT_VERSION: d1db7333d9c5fbbb05e50b0804123950d9dc1c46
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.15.0
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 2bb759165063..2f815ee3a8a3 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -20,11 +20,16 @@ set +e
 cat /sys/kernel/debug/dri/*/state
 set -e
 
-# Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
-if [ "$IGT_FORCE_DRIVER" = "amdgpu" ]; then
-    mv /install/modules/lib/modules/* /lib/modules/.
-    modprobe amdgpu
-fi
+case "$DRIVER_NAME" in
+    rockchip|mediatek|meson)
+        export IGT_FORCE_DRIVER="panfrost"
+        ;;
+    amdgpu)
+        # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
+        mv /install/modules/lib/modules/* /lib/modules/.
+        modprobe amdgpu
+        ;;
+esac
 
 if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt" ]; then
     IGT_SKIPS="--skips /install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt"
@@ -48,6 +53,20 @@ fi
 
 curl -L --retry 4 -f --retry-all-errors --retry-delay 60 -s ${FDO_HTTP_CACHE_URI:-}$PIPELINE_ARTIFACTS_BASE/$ARCH/igt.tar.gz | tar --zstd -v -x -C /
 
+
+# If the job is parallel at the gitab job level, take the corresponding fraction
+# of the caselist.
+if [ -n "$CI_NODE_INDEX" ]; then
+    sed -ni $CI_NODE_INDEX~$CI_NODE_TOTAL"p" /install/testlist.txt
+fi
+
+# core_getversion checks if the driver is loaded and probed correctly
+# so run it in all shards
+if ! grep -q "core_getversion" /install/testlist.txt; then
+    # Add the line to the file
+    echo "core_getversion" >> /install/testlist.txt
+fi
+
 set +e
 igt-runner \
     run \
@@ -57,8 +76,6 @@ igt-runner \
     $IGT_SKIPS \
     $IGT_FLAKES \
     $IGT_FAILS \
-    --fraction-start $CI_NODE_INDEX \
-    --fraction $CI_NODE_TOTAL \
     --jobs 1
 ret=$?
 set -e
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index e1b387581c11..7dd3f995f8a2 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -4,7 +4,7 @@ variables:
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
    DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
-   DEBIAN_BUILD_TAG: "2023-10-06-amd"
+   DEBIAN_BUILD_TAG: "2023-10-08-igt"
 
    KERNEL_ROOTFS_TAG: "2023-10-06-amd"
 
-- 
2.39.2


