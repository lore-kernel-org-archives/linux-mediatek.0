Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C843CC64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WBQ4siMRXVB9SrdHJDrM1tHlRn4OZfx2GTuin+J2Lo4=; b=XD5sE5QzCN1MachP89AAxRG0EY
	uC0HnjfralxiCmBSM34vB0DOqEnl/r3KAcAEI2rAQz/XJzW9IXc1v0fKPsIZ7C11BESMelK1Z+p9M
	9bnD6KDgcbHliw0X/01ctfyqMdZDskQ6Jy/z2NYCFJY/dzEOd5eLBD8pKXn4JeOtu1938+LL8NCq1
	oHAFG1yyjVhJt9UxCdyTsoLHQihSoxnDWwnFFh8WrmpNoeUbrziMqTBWXvuhXyK4A4mn6uKrile3Z
	S6fkUKyWww49mEpV6qIJbhtVn3FrECwh/vgdXGv9mYPQ8mUvxpvZpxMTdhxHk4bhR/JfSm+mmzOjd
	M9I2pyrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxFO-00Cdp0-TA; Tue, 28 Feb 2023 10:30:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxCX-00Cc5H-3k; Tue, 28 Feb 2023 10:27:19 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 31DF46602F90;
	Tue, 28 Feb 2023 10:27:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677580029;
	bh=g3NFpJH4/03P+ic0BhIheOKxhuMMGL+BE+w/2aTRtIY=;
	h=From:To:Cc:Subject:Date:From;
	b=LA/b4pGc1pYewDwhPssPa64PjNlqjxa1iWFAH07T1+oVAmCIJpmHfi2DrgrlXbnLO
	 m1Anv6hn3Fyb3U8XwyXAKrN46v85PD2nrrUSg7sTLnvlwbCt5CWyPKV7TbLw6krpjI
	 6SuFxwHXemINV4Swuufmdx1Mj29/0zebztcOBizo93nt1I1jhZW+jB3O981Ko1Cjyy
	 Z341bJKmyJUQ1I70Ofj/WLt9GsCMMDuh/lZHKayubYicQ30TA0Shz5moJLDEAmWglp
	 pQAWHnK9yBUxgIrNBpgDgqg8agXKBviPVnvO78eez7ZbkbOCO4AeMoryvyhSQP5YIH
	 DJmeqg3wSBXow==
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
Subject: [PATCH v4 01/12] dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains variation
Date: Tue, 28 Feb 2023 11:26:53 +0100
Message-Id: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_022717_346434_31E120D3 
X-CRM114-Status: UNSURE (   9.50  )
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
the power-domains variation from the `else` in the current
mediatek,mt8183-mali conditional.

The sram-supply part is left in place to be disallowed for anything
that is not compatible with "mediatek,mt8183-mali" as this regulator
is MediaTek-specific and it is, and will ever be, used only for this
specific string due to the addition of the mediatek-regulator-coupler
driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 78964c140b46..7e110751353e 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -109,6 +109,9 @@ allOf:
           contains:
             const: amlogic,meson-g12a-mali
     then:
+      properties:
+        power-domains:
+          maxItems: 1
       required:
         - resets
   - if:
@@ -131,6 +134,8 @@ allOf:
             - const: gpu
             - const: bus
             - const: bus_ace
+        power-domains:
+          maxItems: 1
         resets:
           minItems: 3
         reset-names:
@@ -164,8 +169,6 @@ allOf:
         - power-domain-names
     else:
       properties:
-        power-domains:
-          maxItems: 1
         sram-supply: false
   - if:
       properties:
@@ -180,6 +183,8 @@ allOf:
           items:
             - const: gpu
             - const: bus
+        power-domains:
+          maxItems: 1
       required:
         - clock-names
 
-- 
2.39.2


