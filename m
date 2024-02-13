Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BEAC4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZ9gRGZ8IQjm6p3qMaCBKaHl+F4iXvzIGjyMSMvUllU=; b=wltMLHPqy88/Kdsm13J6F90ED4
	6jevarf75cWD9+AudQHZKuDocccyFvzuUIpmJa/X3TvaPkwaBqT1ZvohmZi9jK2AgUXDuBvI7QIsD
	6ld8qYfWM5s2tP0XeocvE63pdD0Z2Zy5jynUkTnF39muQCa1+n/2axMKeBKYRx50Fjuao+mrI1eN5
	SYSB+viPuZx2QuenuQNikLl92r/J4d5xZqodi7wLY9RFQ+eRHqkp3cF8hEEGJ7cnI7Wjz1CZZpIs3
	N+u4ASAw5YWPrd9tVmAvo9CynkIh/c4MsFoPx/ImpKN5i9n0MTsAZ4jB3HKAGb5cFg3fXcKAlOpQY
	5IqKvsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuJP-00000009euP-1Vxa;
	Tue, 13 Feb 2024 15:03:07 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuJ7-00000009ejM-1LCE;
	Tue, 13 Feb 2024 15:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707836568;
	bh=H/NS1wz5MszGxQxdUf73HQI/xDuCHCwLKSnrFRWGIE8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FMdph/Tfazefc6tQLDDjsOyJotzmOHrI6PRjS2Bqoj6POtkSkpRtye/VeeT74A6jo
	 p2sxF4JcUa8uEAky/PuFY2s21pYfCa5HJhToGfcjS76/WxG8gXE5D3WMCGj0pBH7PD
	 XUBtyMx6D4/rJ8uSs70pIjoviTtbcPvg9SEPQtBvSLohHODJjlJDkv/N6++vv8QIXa
	 i1XVleHx6KfY+IrfXguG/4Tm0B1/T6AzFShqGQpMU0bgU94qoDERMDh7pLVUdTseD0
	 jcDteJKEwVYFwx659jVHVGlzrzG3TOvF4jJyOMCRJv+O7JxAzK0RSJ5nbusjnkpaRV
	 ATrSs9tl2f9cg==
Received: from [192.168.1.42] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B12B63782074;
	Tue, 13 Feb 2024 15:02:45 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 13 Feb 2024 10:02:38 -0500
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8186: Add missing xhci
 clock to usb controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240213-mt8186-ssusb-domain-clk-fix-v2-2-1f981d35f3fd@collabora.com>
References: <20240213-mt8186-ssusb-domain-clk-fix-v2-0-1f981d35f3fd@collabora.com>
In-Reply-To: <20240213-mt8186-ssusb-domain-clk-fix-v2-0-1f981d35f3fd@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, 
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_070249_567976_3932512D 
X-CRM114-Status: GOOD (  10.79  )
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

The mtu3 usb controllers don't list the xhci clock, though they require
it, and thus rely on the bootloader leaving it on in order to work.

When booting with the upstream arm64 defconfig, the usb controllers will
defer probe until modules have loaded since they have an indirect
dependency on CONFIG_MTK_CMDQ, which is configured as a module. However
at the point where modules are loaded, unused clocks are also disabled,
causing the usb controllers to probe without the xhci clock enabled and
fail to probe:

mtu3 11201000.usb: clks of sts1 are not stable!
mtu3 11201000.usb: device enable failed -110
mtu3 11201000.usb: mtu3 hw init failed:-110
mtu3 11201000.usb: failed to initialize gadget
mtu3: probe of 11201000.usb failed with error -110

(and same for the one at 11281000)

Add the missing clock for the usb controllers so that they can
successfully probe without relying on the bootloader state.

Fixes: f6c3e61c5486 ("arm64: dts: mediatek: mt8186: Add MTU3 nodes")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index e0e5721d6b53..8c55b7225cf6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1536,8 +1536,9 @@ ssusb0: usb@11201000 {
 			clocks = <&topckgen CLK_TOP_USB_TOP>,
 				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
 				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
-				 <&infracfg_ao CLK_INFRA_AO_ICUSB>;
-			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
+				 <&infracfg_ao CLK_INFRA_AO_ICUSB>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
 			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
 			phys = <&u2port0 PHY_TYPE_USB2>;
 			power-domains = <&spm MT8186_POWER_DOMAIN_SSUSB>;
@@ -1601,8 +1602,9 @@ ssusb1: usb@11281000 {
 			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
 				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>,
 				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_HCLK>,
-				 <&clk26m>;
-			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
+				 <&clk26m>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
 			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
 			phys = <&u2port1 PHY_TYPE_USB2>, <&u3port1 PHY_TYPE_USB3>;
 			power-domains = <&spm MT8186_POWER_DOMAIN_SSUSB_P1>;

-- 
2.43.0


