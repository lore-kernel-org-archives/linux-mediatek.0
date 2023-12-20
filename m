Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24BEC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 12:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJ+cZEFuFqx4kWhMf5QY+43zHcKHOfmDG90zW6HkmyA=; b=QQqf1Vzd9y9ArQIs3XpP8b4Yi0
	t2rCezxtiwuFYW10gUgUiiwVA8wzUMaMkP9GLP2fObtO4bVrd6VHT67T0F9yq/IuG4wSim57aWoqe
	y4GUMWQLw/bF231nBq6HwV3rJLQPWGkbx6RU3rO/AyRYu8QgszUPOSH8pqi3XL2oUrXzY44zu7IFH
	6HrdprSw1obCW/Cmw9Sp5e5y6eI3jZ6NgZLUGqgEuI7d5NeN8KdWcImdn/VJNG/qLO9x7EbJntxu3
	HFPnKSUYZymFGQ0QxjRf+zS21gbhXv0AtQeXyCdGqP7/e+yIMNF3iMB9M6Hpt2pc5JU7XIWkIXSjH
	4xiNeCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFvQS-00HJFt-1X;
	Wed, 20 Dec 2023 12:11:48 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFvQP-00HJB2-1j;
	Wed, 20 Dec 2023 12:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703074302;
	bh=+0AvrTjeqCyyQg+Af9MRsTk9GQX39b2It/8QLf8vlv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HGhCroeInfokeP9IwBzeJjmiyK/ktpDqc9mlDjL4q501VVkIoGY5773j4wlK0ZjrA
	 X7Xc/FA3S0rfuXfEmAEYzzbGSS/LiiWC/NcYsXzWKBx9fjt705dcIsf9rimZo6+0vv
	 +u4j4cLLTJ+YFQ7xwSAAcFzqhkGIguaHGidbLifbaQsgxwbqc1kRnexJlbTC/RDmw8
	 bR/w567GAam4+GlbuiOI25Zl2cNiBd08A23IexJb6zPjET4vGVtF9hzc3b3m9q6lMo
	 mKeC+9PLA8R0rJz2vFIrp+De81nfBQ/CYXymxh77JRNn+WuTGJehGuCzMVRC0sj2NU
	 jhEQcU8D9ho4g==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1C1933781FF1;
	Wed, 20 Dec 2023 12:11:36 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	daniels@collabora.com
Cc: david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/8] drm/ci: mediatek: Test both GPU and display drivers
Date: Wed, 20 Dec 2023 17:41:04 +0530
Message-Id: <20231220121110.1441160-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220121110.1441160-1-vignesh.raman@collabora.com>
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_041145_703599_319B3BB6 
X-CRM114-Status: UNSURE (   9.76  )
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

Mediatek 8173 and 8183 SOCs have a separate display controller
and GPU, with different drivers for each. Add support in drm-ci
to test both these drivers.

Powervr driver was merged in linux kernel, but there's no mediatek
support yet. So disable the mt8173-gpu job which uses powervr driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 39 ++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 2c9a1838e728..1945c0a70e76 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -264,29 +264,58 @@ amdgpu:stoney:
     - .lava-igt:arm64
   stage: mediatek
   variables:
-    DRIVER_NAME: mediatek
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
 
-mediatek:mt8173:
+.mt8173:
   extends:
     - .mediatek
   parallel: 4
   variables:
     DEVICE_TYPE: mt8173-elm-hana
-    GPU_VERSION: mt8173
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
 
-mediatek:mt8183:
+.mt8183:
   extends:
     - .mediatek
   parallel: 3
   variables:
     DEVICE_TYPE: mt8183-kukui-jacuzzi-juniper-sku16
-    GPU_VERSION: mt8183
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8183-kukui-jacuzzi-juniper-sku16
 
+mediatek:mt8173-gpu:
+  extends:
+    - .mt8173
+  variables:
+    GPU_VERSION: mt8173-gpu
+    DRIVER_NAME: powervr
+  rules:
+    # TODO: powervr driver was merged in linux kernel, but there's no mediatek support yet
+    # Remove the rule once mediatek support is added for powervr
+    - when: never
+
+mediatek:mt8173-display:
+  extends:
+    - .mt8173
+  variables:
+    GPU_VERSION: mt8173-display
+    DRIVER_NAME: mediatek
+
+mediatek:mt8183-gpu:
+  extends:
+    - .mt8183
+  variables:
+    GPU_VERSION: mt8183-gpu
+    DRIVER_NAME: panfrost
+
+mediatek:mt8183-display:
+  extends:
+    - .mt8183
+  variables:
+    GPU_VERSION: mt8183-display
+    DRIVER_NAME: mediatek
+
 # drm-mtk doesn't even probe yet in mainline for mt8192
 .mediatek:mt8192:
   extends:
-- 
2.40.1


