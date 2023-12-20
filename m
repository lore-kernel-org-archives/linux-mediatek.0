Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B49C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 12:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLmxzPoEJMTaR5/hFzw/xcnWbeuymljM/HX5YZPmU/Y=; b=TGgb8iHC1Rz9SP0rlVC1X1TMa5
	wBe2mMkxA3bLqFBwIe+WJ09D5KWXDPYjk4C9xSEUDHOITxWjtTA6GmUJC8XQ9gJmenibIQFbaD5tS
	hhkfcSV5rdsCRVVLHXyLYFsivrCGAIlXWXvsnCWCE8Biea6un+OcGGBcAJxfgOAl38zDjc6ECS8tw
	LtDBnVWLB1tQLPKwumP2TdeNWZdrUPR16Tsxm1QRSwKfBzdM14cxKNrWQFMQN+ZgcyUR9L/IPhmyy
	rvw9kvfrUIZTG/DQkeuYKB+Jreika1FJDsyHd77r71LO7BFZ93Q3QTdUq1lk8TwsdR8kIqtZ7cf/H
	oW5eG/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFvQW-00HJJT-2a;
	Wed, 20 Dec 2023 12:11:52 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFvQT-00HJFl-0c;
	Wed, 20 Dec 2023 12:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703074308;
	bh=Oh463TEYwWlMnYER5Qs7j3iFZItrw8O/XAP1/5Xns2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M9b7xfe4SEa6MrlfHuJX3mN4lKOCgV2ixf1mwLt5VLRaN/BYK43jBqAH7+w8nmWLY
	 2DvBlHHU4EdWR19FSey0+CxbzGWZ/bjIcbwpE7/0f0s7/a0GSaoci/WmyFzVX+wwo4
	 FLnzKvpkB3tieXdBNd+Fg+K94ySxhgd/QOKCnygoUl0BpzH2lv6GZ3YX/ZiIQx3YSY
	 iyhWLhAOQyJ6WOCvfbfMpi9q/plT21jiTNdX5ZPRCe2ETwe1QuEX5S2BWNXKHX3yTC
	 iMudimtroNePbPIf8Ea7rD73tbDV6EMtjb14uV1HvsVRO3vJx3DulwmhnSL9nTL1MM
	 6OYrucRAGuGbQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E938F3781FEF;
	Wed, 20 Dec 2023 12:11:42 +0000 (UTC)
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
Subject: [PATCH v1 3/8] drm/ci: rockchip: Test both GPU and display drivers
Date: Wed, 20 Dec 2023 17:41:05 +0530
Message-Id: <20231220121110.1441160-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220121110.1441160-1-vignesh.raman@collabora.com>
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_041149_371143_D46C6BF2 
X-CRM114-Status: UNSURE (   7.86  )
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

Rockchip rk3288 and rk3399 SOCs have a separate display controller
and GPU, with different drivers for each. Add support in drm-ci
to test both these drivers.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 50 ++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 1945c0a70e76..8081925303f5 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -135,33 +135,59 @@ msm:sdm845:
   script:
     - ./install/bare-metal/cros-servo.sh
 
-rockchip:rk3288:
-  extends:
-    - .lava-igt:arm32
+.rockchip:
   stage: rockchip
   variables:
-    DRIVER_NAME: rockchip
-    DEVICE_TYPE: rk3288-veyron-jaq
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
+
+.rk3288:
+  extends:
+    - .lava-igt:arm32
+    - .rockchip
+  variables:
+    DEVICE_TYPE: rk3288-veyron-jaq
     KERNEL_IMAGE_TYPE: "zimage"
-    GPU_VERSION: rk3288
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3288-veyron-jaq
 
-rockchip:rk3399:
+.rk3399:
   extends:
     - .lava-igt:arm64
-  stage: rockchip
+    - .rockchip
   parallel: 2
   variables:
-    DRIVER_NAME: rockchip
     DEVICE_TYPE: rk3399-gru-kevin
-    DTB: ${DEVICE_TYPE}
-    BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
-    GPU_VERSION: rk3399
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3399-gru-kevin
 
+rockchip:rk3288-gpu:
+  extends:
+    - .rk3288
+  variables:
+    GPU_VERSION: rk3288-gpu
+    DRIVER_NAME: panfrost
+
+rockchip:rk3288-display:
+  extends:
+    - .rk3288
+  variables:
+    GPU_VERSION: rk3288-display
+    DRIVER_NAME: rockchip
+
+rockchip:rk3399-gpu:
+  extends:
+    - .rk3399
+  variables:
+    GPU_VERSION: rk3399-gpu
+    DRIVER_NAME: panfrost
+
+rockchip:rk3399-display:
+  extends:
+    - .rk3399
+  variables:
+    GPU_VERSION: rk3399-display
+    DRIVER_NAME: rockchip
+
 .i915:
   extends:
     - .lava-igt:x86_64
-- 
2.40.1


