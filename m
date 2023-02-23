Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BE4C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1/arpsFTNupPbknD64llFhKUm/wlNgsw1KbnSZuMME=; b=hnOMSUdfoMW83oJu/BRcHuc4KG
	fC6Dp1qOe1WfwhYxVgmnxcywC7To87dQLXjslCw6qVlxxNHomlIK5fi8vENp75qYtpAp9yBd3+hgr
	DyWR0NjUSkHBvgkx+IHb55HXdFJXhssuzhfrcR+AXQ4TQoU3s9/qNzxHvZsAWh7gLgnCg3WzyIwiD
	nf3Dt5K6tvDRXySIv93ta2qTzPK2nsAa+2PWEGhzDC10VJCO600/zipnIrl7zUPaiJpaQtstdwRNw
	r5SckuBJZ2F18qKb9gUiYScHM8XVwEKlbV7Km2T0HADyxR/W6nl7jOVnrxeAwRi2P4MNA9FFLHaBu
	GaMGJX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBlb-00GTk6-HC; Thu, 23 Feb 2023 13:36:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBkQ-00GSxB-BZ; Thu, 23 Feb 2023 13:35:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 98B0E6602207;
	Thu, 23 Feb 2023 13:34:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159294;
	bh=DZyb8vw6qbtsYIBlP4pzm++AodTcvCv6AvAETopyIuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NYu03vv1qJuOYlmylMrIAyYrmCCeql0wrQvbiOajOzEtWMk9fe2QClrSXl5UKBq7F
	 gnBv7pcmHASD9KHn9aA8CYcQjSaz5T5fcM+kbDOExSgearlpCRBas/XTGpT5+o/vDI
	 CvVsacZ/DGPBhH6QBAudtY1bmf5NjNlMbNCuF3n8etvKB2aBijiQSCOYMWIYYDpXcM
	 YQbUXF9UpbvdB0vTfPN00MjxPShFufEUoPr9vo+FYil4d5wyB5m69+RwLNIFFLEevV
	 g0Rh0xjEusaGljfQTj3+SHcAr3LYy+s+85UxTjYgeyaUjp2Il2Zg3U7SMHK3y2HlEQ
	 rSJuihO2Whkwg==
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
Subject: [PATCH v3 01/11] dt-bindings: gpu: mali-bifrost: Add power-domain-names to base schema
Date: Thu, 23 Feb 2023 14:34:30 +0100
Message-Id: <20230223133440.80941-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_053458_583108_B4A4E417 
X-CRM114-Status: UNSURE (   9.13  )
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

From: Chen-Yu Tsai <wenst@chromium.org>

In commit a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek
MT8183"), "power-domain-names" was added to the mt8183-mali sub-schema,
but was not added to the base mali-bifrost schema. Because validation
happens for the base schema and any sub-schemas separately, this causes
errors to be emitted when validating the MT8183 device trees.

Add power-domain-names to the base schema to silence the error.

Fixes: a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 78964c140b46..02699d389be1 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -65,6 +65,8 @@ properties:
     minItems: 1
     maxItems: 3
 
+  power-domain-names: true
+
   resets:
     minItems: 1
     maxItems: 3
@@ -166,6 +168,7 @@ allOf:
       properties:
         power-domains:
           maxItems: 1
+        power-domain-names: false
         sram-supply: false
   - if:
       properties:
-- 
2.39.2


