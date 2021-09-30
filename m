Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDE1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:33:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D18F61875
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D18F61875
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WwtJBmHsUrIs9oxluU+Vxz9OjUs43zfwxdZpdASEVI=; b=X8QC96DcSCR5oF
	hEFYT2eFdvm8+rV60EwQrRygqQScBenpxV1325xv2kpWhHwhOdEGwofiaNaGbzqo8UeqhuFxBAQjW
	9fDtODpGtzq8D9KAQ0WA4NguJF6+aASHezIT6KUur3UQ8xjrBYXjRdvt/+df5XgraPEQiAo+QKjH7
	7+4ZlTaiyUPhB+n/isE3zGHuxr7el7kpkgf1MYTepvL4XSUFw6Evxid83K4uDiC2FJkkZlOTp7dYL
	yO59OckOAU1yttBeBCUz1lpggxn/FGnqlZjqNRFDn0BRxLlme3ChxOt6CZ5lDxWiNiCwnChccNjMC
	xvtNKOB8hjap8zZsTVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVrVf-00DOxa-V7; Thu, 30 Sep 2021 08:33:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVrU3-00DO4F-Ej; Thu, 30 Sep 2021 08:32:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 98E811F449F5
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, eizan@chromium.org,
 kernel@collabora.com, drinkcat@chromium.org, jitao.shi@mediatek.com,
 chunkuang.hu@kernel.org, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Rob Herring <robh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 5/7] arm64: dts: mt8183: Add the mmsys reset bit to reset
 the dsi0
Date: Thu, 30 Sep 2021 10:31:48 +0200
Message-Id: <20210930103105.v4.5.I933f1532d7a1b2910843a9644c86a7d94a4b44e1@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930083150.3317003-1-enric.balletbo@collabora.com>
References: <20210930083150.3317003-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_013203_665302_C3EDAEA1 
X-CRM114-Status: GOOD (  12.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Reset the DSI hardware is needed to prevent different settings between
the bootloader and the kernel.

While here, also remove the undocumented and also not used
'mediatek,syscon-dsi' property.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8183.dtsi  | 3 ++-
 include/dt-bindings/reset/mt8183-resets.h | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 9639ca17638e..9c4158a1057c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1251,6 +1251,7 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8183-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
 				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
@@ -1365,11 +1366,11 @@ dsi0: dsi@14014000 {
 			reg = <0 0x14014000 0 0x1000>;
 			interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-			mediatek,syscon-dsi = <&mmsys 0x140>;
 			clocks = <&mmsys CLK_MM_DSI0_MM>,
 				 <&mmsys CLK_MM_DSI0_IF>,
 				 <&mipi_tx0>;
 			clock-names = "engine", "digital", "hs";
+			resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
 			phys = <&mipi_tx0>;
 			phy-names = "dphy";
 		};
diff --git a/include/dt-bindings/reset/mt8183-resets.h b/include/dt-bindings/reset/mt8183-resets.h
index a1bbd41e0d12..48c5d2de0a38 100644
--- a/include/dt-bindings/reset/mt8183-resets.h
+++ b/include/dt-bindings/reset/mt8183-resets.h
@@ -80,6 +80,9 @@
 
 #define MT8183_INFRACFG_SW_RST_NUM				128
 
+/* MMSYS resets */
+#define MT8183_MMSYS_SW0_RST_B_DISP_DSI0			25
+
 #define MT8183_TOPRGU_MM_SW_RST					1
 #define MT8183_TOPRGU_MFG_SW_RST				2
 #define MT8183_TOPRGU_VENC_SW_RST				3
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
