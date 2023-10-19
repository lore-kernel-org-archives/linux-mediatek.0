Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0F5CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 07:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TE8MF7qBhi5QHO4LbdRM33P18HVjE0D4J/UlPyVhEas=; b=vRxTOwQVk3cJyM5faKFfzvb8OM
	Y8dTVHb63anmsqwb/muR7CaHCao/n4AK8SPt4nOjAISynYSw0mxq6jpJdSEmCUWfhQaiHCtaKdniO
	GyejnSpQ90HxGcLLyd4xQndPcYlwAn6NMmcVKMQKc2fBzdFnHnE8D/eul9ABOCn8sVosK6xlqvycC
	tJR20kOA7AF1vnYmdU5B1e7nW8d0FVNadASUFQhdZ0iYYgbCMtMunRfdbQB8q3hi97SeK+qP79pHI
	eDs9GP8umPMcrMQS+oPU7+SEH2RhFj/aDa9K5xYxdpe7HczyWq6bddjhwsR/fXz35OsPZLmccUI5y
	eHsYEPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN85-00GZaT-15;
	Thu, 19 Oct 2023 07:07:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN82-00GZYA-0a
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 07:07:35 +0000
Received: from localhost.localdomain (unknown [103.93.195.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B29066072FF;
	Thu, 19 Oct 2023 08:07:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697699253;
	bh=35DFjxAotz1IVCItB2GsZcDMQyNA7MbHQR3Htt8pU1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nbAReMsKB3X1LneMPjihBxcf/Yb7zcNIJ+3pD75rfBDPtBVZP7D+f/klvBlsqycvt
	 SILiNS67mA9BDON/3Sqx7MCGGdzy7OBKMx1NrKWQAH9h2dCzaj99A+g3TzY94wye57
	 mkHK9nNDJTMAh7k7jrK1XuObVCRD7wklTl8Cws9fsugii4D4YUGeMPhEWqinJN64Q/
	 KaRAz9/6Ijff1n3uXf4baqy03ui5Ikh78zZcEysO89niCSc2StIks2hsE9f1DpAHSc
	 t5P04JquPu2sJ1bwDq3zoIMe4vJpkgRUa0hjgPkTT3ZKyabeTj4RVDTXigEWFnWSDA
	 hQeVQYygD0Fbg==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: david.heidelberg@collabora.com,
	sergi.blanch.torne@collabora.com,
	guilherme.gallo@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 5/9] drm: ci: Use scripts/config to enable/disable configs
Date: Thu, 19 Oct 2023 12:36:46 +0530
Message-Id: <20231019070650.61159-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019070650.61159-1-vignesh.raman@collabora.com>
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_000734_348349_890638EF 
X-CRM114-Status: UNSURE (   9.79  )
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

Instead of modifying files in git to enable/disable
configs, use scripts/config on the .config file which
will be used for building the kernel.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Added a new patch in the series to use scripts/config to enable/disable configs

v3:
  - No changes

v4:
  - No changes

v5:
  - No changes

---
 drivers/gpu/drm/ci/build.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index b1ea9b458922..614111b7670b 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -70,19 +70,19 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
     fi
 fi
 
-for opt in $ENABLE_KCONFIGS; do
-  echo CONFIG_$opt=y >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
-done
-for opt in $DISABLE_KCONFIGS; do
-  echo CONFIG_$opt=n >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
-done
-
 if [[ -n "${MERGE_FRAGMENT}" ]]; then
     ./scripts/kconfig/merge_config.sh ${DEFCONFIG} drivers/gpu/drm/ci/${MERGE_FRAGMENT}
 else
     make `basename ${DEFCONFIG}`
 fi
 
+for opt in $ENABLE_KCONFIGS; do
+    ./scripts/config --enable CONFIG_$opt
+done
+for opt in $DISABLE_KCONFIGS; do
+    ./scripts/config --disable CONFIG_$opt
+done
+
 make ${KERNEL_IMAGE_NAME}
 
 mkdir -p /lava-files/
-- 
2.40.1


