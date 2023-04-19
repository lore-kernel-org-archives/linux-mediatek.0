Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F4CC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 19:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=psFZxbaYCemdb+vmkuoPFFRak2oUUncjuT/T0fG/57w=; b=mMu/0Ga2ZWGpUClI8Ps1DTPTHt
	/l0WN061hfvnjuAfCgfbps5ecckmp/IfBJlF4NiUmKdh4jJc9o3TQoZd0db/Z30EYZ0fvlvMIYIKM
	d/dlUvLn8ewjW8jhkTpBlSeZBxySeyjWeOkyZTno3HKKcI+QkhM0MO5b6Ok10yLnQ9d6u1RZ21q7N
	zCPEbvucjTkZtD/0Swpmyr7Wg36kLinmsYLIQfwhsXojM68BOs0P9kll7JgxT9WZOXXt5ODUUsgqJ
	DPlheJuQRHWSyzzNe4nIV+zn+FQSvhUBIiKox/M4waV7Q3Mz74zk3bvckh7+AYPQq0VcwoP2jeSSR
	dfEfWpRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDIE-006Ea9-36;
	Wed, 19 Apr 2023 19:16:38 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDIB-006EZD-34;
	Wed, 19 Apr 2023 19:16:37 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppDIA-0003s0-1W;
	Wed, 19 Apr 2023 21:16:34 +0200
Date: Wed, 19 Apr 2023 20:16:29 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] arm64: dts: mt7622: handle interrupts from MT7531 switch
 on BPI-R64
Message-ID: <ZEA-DV_OsmFg5egL@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_121635_989474_C39DF018 
X-CRM114-Status: GOOD (  10.85  )
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

Since commit ba751e28d442 ("net: dsa: mt7530: add interrupt support")
the mt7530 driver can act as an interrupt controller. Wire up irq line
of the MT7531 switch on the BananaPi BPi-R64 board, so the status of
the PHYs of the five 1000Base-T ports doesn't need to be polled any
more.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index d583e816684cf..aabd104b12acf 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -150,6 +150,10 @@ mdio: mdio-bus {
 		switch@0 {
 			compatible = "mediatek,mt7531";
 			reg = <0>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&pio>;
+			interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
 			reset-gpios = <&pio 54 0>;
 
 			ports {
-- 
2.40.0


