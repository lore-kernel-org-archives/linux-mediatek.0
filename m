Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4E0C87FD1
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9i6ol6faBtSdDMzeMIR48eb5aPVyBDqUySommCto/s=; b=UfTI4J6PD/ozLh
	a2ZOi/2mykUMDw4dquXhQj+FjnNx7cygbBYzssZlVzacllCVP9JPQtiWuZoeLIu+FEa17BrfrhKn3
	dGhP2rgeWCbZWTjeBIqIOmAb0Cun2BlhVFSUbaK2fHpf2mZpcJ/wlLKCdsP4qReTI3ne/p7ASVrjs
	jEkV3zeJDlcSSCmIRP2uNlo7iAe+lboEB1avd1lV/v2dKDjnnpktGtD1IT5/1Zwhc4N6dccoNO8z1
	Y+2TESusdK1rzZEG0+4yBCcGnHAZoPKEVxdqpaTGqFnsVw3m3BLsdj4IJG8hqRZmcJX2G7IYTr3WS
	Po1gYznlbHjk8swAcLZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesYm-000000076RI-3Iym;
	Thu, 24 Jul 2025 09:48:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerUa-00000006tUd-052w;
	Thu, 24 Jul 2025 08:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346394;
	bh=v0flDi7EoltDZidtFDgX25K3EX5eZ39OLHBODZmt3jI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EOQHw5dWvWRsLrb/IHJ+axQp+71IdF4KUnDviAaWdBxnRKpGGEbDOCcCrSSG1eeZ8
	 gZrYo8iwKvcJvRqGDKk/YQrXncNCKyvnUARhbZg19p4bcISm8EN/sDC7a1ouPyH9QZ
	 KROUGsCGr7HS/s5k8pALlHVoQTFAbDCoHCJQcnxZA6Fx4reWBwXxh35M6eQWOImh7W
	 hUAvXDMOszay6N5G2TNGEbrXStV/Xvn4RpuzNo1AdhXMGGruHKLlJ9s4jS6IaBlKbS
	 Uo+creRPiKwGClnw+2u6A5BWd6fP98m4u+j3JWnhLPL8egE3MK85L+AIGLT/pWURKg
	 OW6B6zxpyaWlw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A20917E128C;
	Thu, 24 Jul 2025 10:39:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 11/38] dt-bindings: regulator: mediatek,mt6331: Fix various regulator names
Date: Thu, 24 Jul 2025 10:38:47 +0200
Message-ID: <20250724083914.61351-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_013956_205554_FA26A634 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This binding was never applied to anything because it misses the
compatible, hence any mistake in it got unnoticed.

Before adding the compatible to let it apply, fix the names and
the node names of various regulators.

Fixes: 6385e21692bb ("regulator: Add bindings for MT6331 regulator")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6331-regulator.yaml         | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
index 79e5198e1c73..6006a973b865 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
@@ -26,23 +26,23 @@ patternProperties:
 
     unevaluatedProperties: false
 
-  "^ldo-v(avdd32aud|auxa32)$":
+  "^ldo-(avdd32aud|vauxa32)$":
     type: object
     $ref: regulator.yaml#
 
     properties:
       regulator-name:
-        pattern: "^v(avdd32aud|auxa32)$"
+        pattern: "^(avdd32_aud|vauxa32)$"
 
     unevaluatedProperties: false
 
-  "^ldo-v(dig18|emc33|ibr|mc|mch|mipi|rtc|sram|usb10)$":
+  "^ldo-v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb10)$":
     type: object
     $ref: regulator.yaml#
 
     properties:
       regulator-name:
-        pattern: "^v(dig18|emc33|ibr|mc|mch|mipi|rtc|sram|usb10)$"
+        pattern: "^v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb)$"
 
     unevaluatedProperties: false
 
@@ -52,7 +52,7 @@ patternProperties:
 
     properties:
       regulator-name:
-        pattern: "^vcam(a|af|d|io)$"
+        pattern: "^vcam(a|_af|d|io)$"
 
     unevaluatedProperties: false
 
@@ -75,7 +75,7 @@ patternProperties:
 
     properties:
       regulator-name:
-        pattern: "^vgp[12]$"
+        pattern: "^vgp[1234]$"
 
     required:
       - regulator-name
-- 
2.50.1


