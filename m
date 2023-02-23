Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1343C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ux2XCuCi78DmCxhmj2ukCazKOuQq87GMBp4lF8TlRzI=; b=DnRn9KQ38rGNuGCYoUl3f/eMI3
	Wb/St9Koc8AVQPpOqMju05FYqpwBPNvQCBnq0V4/zfn5W8p+0xK+ghOqbmsUciOOlcXKoq1J1tQ1H
	RGnr7oKKStDTbW4D9P7fzgazo3PKh32gFsSiqYjGOf/RrxBankLFmeE0zDnLWKOawiVXLLv9WFLT6
	eA4anwsY8oDMKpxKTt7naxkBybxOvDxd1OQSrsuolIUUQoCU0RBQ/o3ks7kp/s3DkfQiNYkk7rNV9
	h43CwPOM/E9DNWmZ71pWvb84oHqWjD2/W7qDBUMrHTHRHMv2S+Ry3F/mYxyJeBDLWWvFc0f+/KtU9
	ch0I7p7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBlp-00GTuN-IH; Thu, 23 Feb 2023 13:36:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBkQ-00GSxU-BY; Thu, 23 Feb 2023 13:35:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 849BC6602208;
	Thu, 23 Feb 2023 13:34:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159295;
	bh=dYSlQLXMyB6AD5hy1+lsca8EHSPk5mj7QuNmBK+ZBoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGiXI4PexxD/JDfciqJmMleb9tUNND4UDMfKXb7gr+GV9mJ4UeWxUFvWgwbXc3xiE
	 mLw9wEN0gS2VSpf17qZOpU0jYnEIps5xluIiMRlV0Vo0wUISCL33Jhwhfasa+u0RYr
	 Z/JCi930T4A4pte/8K4b+1cPA6URW32CJauGvdR8AYcX7ANSaVC2zb1vef9iNdVpJN
	 UlBRkx+8toCzdc43xXxMd3QjDEP37ypIo4EnWA6yNZ2J30W4LZFUWNGmRW21I7txRC
	 RS9b3Fz3UYGn0CouDtWNuU6DKUV3PD30d4PIetfRHOODdro60dWKW8GYu0TNoxV7tl
	 QXMUbDwsiw2hw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 02/11] dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains variation
Date: Thu, 23 Feb 2023 14:34:31 +0100
Message-Id: <20230223133440.80941-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_053458_566763_109A2528 
X-CRM114-Status: UNSURE (   9.89  )
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

In preparation for adding new bindings for new MediaTek SoCs, split out
the power-domain-names and power-domainsvariation from the `else` in
the current mediatek,mt8183-mali conditional.

The sram-supply part is left in place to be disallowed for anything
that is not compatible with "mediatek,mt8183-mali" as this regulator
is MediaTek-specific and it is, and will ever be, used only for this
specific string due to the addition of the mediatek-regulator-coupler
driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 02699d389be1..ac174c17e25f 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -145,6 +145,18 @@ allOf:
         - power-domains
         - resets
         - reset-names
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - mediatek,mt8183-mali
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+        power-domain-names: false
   - if:
       properties:
         compatible:
@@ -166,9 +178,6 @@ allOf:
         - power-domain-names
     else:
       properties:
-        power-domains:
-          maxItems: 1
-        power-domain-names: false
         sram-supply: false
   - if:
       properties:
-- 
2.39.2


