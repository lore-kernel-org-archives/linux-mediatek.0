Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43724CD1292
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 19:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9nv18f42kzTQorTA/a4br9hZIZSA/ELS/8hi+PFA/E=; b=qfqjYC16ZBhsGrFZYs2ZmDTMRm
	L2fw1Sgp++gGexvSlN7eHP2FMFewwcZnBd1V0ksG2dWyOeKZ0Ht1/I7oFD4niXFb0Q6i3elndJIm0
	BoXJVARS470YQVpXdnCSR+Dxd7n5HdltDCV57PzcMSWdYn/EgCnqOdTOSxEB//4cvVzXShb1Qqq6I
	RRKbJGBQiu5gdoRRnpREmyAitTWklJO+jne81gGJpskRQN0F1KvhYk9XCZzCSd8JfZjUFZ8WHqAiY
	FusGBgqOw3eTtscmrdoRnA5ZQVpkwB05saEwXfxBA2btJO0R22S67eef0c74EZmj6kjp0BlcaERP2
	vekvbz8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtv6b-0000000GgpW-2NEt;
	Mon, 08 Apr 2024 19:56:37 +0000
Received: from ahti.lucaweiss.eu ([128.199.32.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtv6Y-0000000Ggot-0rH0;
	Mon, 08 Apr 2024 19:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1712604740; bh=c5gbAFJceJEwIGU1MS4s0Erl9/DQFapiSGt6t0dOuL0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=zQSi9jes9Y9lHDbrkmXQS9eN7i8V0B06Ubwo+7LQRZbTpGhf9iYB8FNDr7gPWB/F2
	 Ew4w62U2JzlnILfdoVGcJszqdzYcDlV1orDlwXoSdxf94zb0WF96xJXdlj3L0+qykv
	 p4Dj6Wxz0yq6Z6QkVpNy37NPNkEVvgVqVJpEdLho=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Mon, 08 Apr 2024 21:32:04 +0200
Subject: [PATCH 2/2] ARM: dts: qcom: msm8974: Use proper compatible for
 APCS syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-msm8974-apcs-v1-2-90cb7368836e@z3ntu.xyz>
References: <20240408-msm8974-apcs-v1-0-90cb7368836e@z3ntu.xyz>
In-Reply-To: <20240408-msm8974-apcs-v1-0-90cb7368836e@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2374; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=c5gbAFJceJEwIGU1MS4s0Erl9/DQFapiSGt6t0dOuL0=;
 b=kA0DAAgBcthDuJ1N11YByyZiAGYURkKjMsa1FNCprHDmKfkt3ev2Ue5X4YgO4Oxqq81emLJXX
 okCMwQAAQgAHRYhBDm60i8ILNqRuhWP+nLYQ7idTddWBQJmFEZCAAoJEHLYQ7idTddWPegQAKAn
 R2QVQhHzSEjZg5LK3C7vZybZaDR+tU/DAr9GdiHo70hLICBlBEBHj9e1JYNE5rL2un8RifS5JeJ
 4EL+YJitzxTLkt/K4a2RJwtF1qMLIJH8v1HE1+zr2kUisGnG4v+gCVbvhV3R0y16aOVwCAiBPn6
 T8t4Hg6urzCalNON3xp35HcLd5n3en4TJUe8/Q4RIS869oZCGfDCUS/DdTyt195JHrpV0RlR6Uk
 W1Bf44/qdgXWpjOUX9tmNkcPK+MKZ45ti4r7JucWN6GFJYB/esEycyD7qNfDCwjnVbAJn8q6f46
 eotFp7movymAe4FxIO8Jy/8TtdGSz/V1ZY3Odv5RI1uI1P/MWmItO1XaiVlGBkLYIRuyCcV2haw
 Q6gYTfHoFUJpILNs/dNBd5+7XEWqwRzTmLv16sMKZfbX+CStlm6+aXrO0zvO3wyst+EwXnKKnw3
 Foc5GUvY3YsSIsmlzWP6YlCb9oDDKnZO5mmTeouTMjGRXbWXyY2ndw1IpT0vaYtncT/Sp2FzdF2
 DNgAEhjoWmP20meemH2DhXxquO57dAbvH2Me4OC4vx/muKrsY59LFs4pB5Bfx57gaHHpt5GgDfz
 1Oe4v1KeAoLYQsahuLb1z2uruaNNb2JxER2qZnNFvkV+fpDuMGk6mYBnzDzIga9BdPaUNa629TB
 nom5U
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_125634_611885_8908A71B 
X-CRM114-Status: UNSURE (   9.62  )
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

Use the apcs-kpss-global compatible for the APCS global mailbox block
found on this SoC.

This also resolves a dt-binding checker warning:

  arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dtb: syscon@f9011000: compatible: 'anyOf' conditional failed, one must be fixed:
          ['syscon'] is too short
          'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brcm,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls1c-syscon', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk356
 8-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62-usb-phy-ctrl', 'ti,am654-dss-oldi-io-ctrl', 'ti,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
          from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 233d9bf42298..7e0224006b1f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -341,9 +341,11 @@ intc: interrupt-controller@f9000000 {
 			      <0xf9002000 0x1000>;
 		};
 
-		apcs: syscon@f9011000 {
-			compatible = "syscon";
+		apcs: mailbox@f9011000 {
+			compatible = "qcom,msm8974-apcs-kpss-global",
+				     "qcom,msm8994-apcs-kpss-global", "syscon";
 			reg = <0xf9011000 0x1000>;
+			#mbox-cells = <1>;
 		};
 
 		saw_l2: power-manager@f9012000 {

-- 
2.44.0


