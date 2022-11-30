Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EB8C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 13:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ya6fKg+ST44CcgdMM2x2liWbss4d27nVXgG0v0fjkmY=; b=lyC2mj/hBX6TfpQ2+Oi0Sq1ndE
	s+CnYFtGlBUyskpLf1rGE6JrTzhV6bgtBSOxyXDhaZ7YUQQpJPiwJav13pwdLJQTJIgHKqdSRsZ+I
	CjkuGUzf4f3YqubnD9QctEHPqTNavfrKl4fcSsxUyd+dTwzv/s48aAdEsIJsnhbdp6Un2/lhS1rEJ
	xfLbhA/As65aex+ZxgWKEn0XtCDg8BE4KpCmpURWYyiYY9PrWelORUY47oBqqJb9ssXC22EF9MJe7
	XKOxodPYPFXZISANJGBNsn1STDCGzwgXtCf74P+OeYxNIP6C7vuf3d1m9++/yGTUxi48z9RzORfrq
	bW+66WDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0N4M-00GSjt-DA; Wed, 30 Nov 2022 13:24:10 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0N14-00GRC6-Ih; Wed, 30 Nov 2022 13:20:47 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1p0N12-0006Bf-9f; Wed, 30 Nov 2022 14:20:44 +0100
Date: Wed, 30 Nov 2022 13:20:38 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: Steven Liu <steven.liu@mediatek.com>,
	Henry Yen <Henry.Yen@mediatek.com>
Subject: [PATCH v2 2/2] dt-bindings: thermal: mediatek: add compatible string
 for MT7986 and MT7981 SoC
Message-ID: <Y4dYpoVBmKZSaX2q@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_052046_654760_F1F30C7B 
X-CRM114-Status: UNSURE (   8.81  )
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

Document compatible string 'mediatek,mt7986-thermal' for V3 thermal
unit found in MT7986 SoCs.
'mediatek,mt7981-thermal' is also added as it is identical with the
thermal unit of MT7986.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1: Properly document both supported SoCs

 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
index 5c7e7bdd029a..38b32bb447e3 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
@@ -13,6 +13,8 @@ Required properties:
   - "mediatek,mt2701-thermal" : For MT2701 family of SoCs
   - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
   - "mediatek,mt7622-thermal" : For MT7622 SoC
+  - "mediatek,mt7981-thermal", "mediatek,mt7986-thermal" : For MT7981 SoC
+  - "mediatek,mt7986-thermal" : For MT7986 SoC
   - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
   - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For MT8516 family of SoCs
 - reg: Address range of the thermal controller
-- 
2.38.1


