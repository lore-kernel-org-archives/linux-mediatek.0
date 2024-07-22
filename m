Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99686C3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 15:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yE/SqHTV1C34nGAmEjO8Ca/17uHkpN6zyQL0nSw3sRM=; b=5C1jBAfs91tTh9cgi6F6g6eaPj
	aZwQzKm3N7qh1TBMCK7sy8X5OcBKNnqUEwtXC8kjjnD1fq1Mf60qy9fwb65wItQm1Qs2q7aCv3t2z
	TuNdOws49D4mbKQacMC0cZPsjmbJTxZj8nibuUgEm4vpx5KO3HehkxgaLN5pPTBbfejpGpGU0xtSf
	kXLvU9RbSS+DFgXcURV3HTejPuIqsdbXJYY1PruZEUPjd9NWK4Mq/uV7btXjtBWoBL0c4M9U70L9E
	9jzu7k36STpistnQvT2i3+98qcpy67cRNnfz4XtCH1nYH2U5DVFuL9wGVe5LCdldjfxQG+tDQWhbL
	YMJSsdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVux8-00000009wiI-0gkV;
	Mon, 22 Jul 2024 15:27:54 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVuwj-00000009wY9-3zMm;
	Mon, 22 Jul 2024 15:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721662048;
	bh=8F8AqL8+uz10xZlIRw115rqKTtHgjwv0e3CayfgJVno=;
	h=From:Date:Subject:To:Cc:From;
	b=SagOMCU94ZPPnQfyFh6zFI2khT9EEF4MUcPcSRe7pwncodoAfwvPKlKTBi9yQAADO
	 phRE4ogpZoaWIS67EqGkT5cXNku33U0qSNmZfGImbPZbAML4kIHwJNdYiJv/JjGnEU
	 tGsAIWVB3mTWMDkEVKAWimvOy9fu90EcHuysvsK7KbThlDu/1ukBj90l1635Ml1Mm3
	 vIu/obugyqQ+s5XoBPIKDEfYK1kY1Wdvat6819IOoa+Eh+tPSVcsJQ7FMhrHq+69Uw
	 5UAvItx7YQNxYN8QhkLjEeThmVHg1IpF9Rrkp45cRHzr9QcHUEDELUHVZzB2XYMjTa
	 6w/ESdtIwWcxA==
Received: from [192.168.1.217] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0CFC137800DE;
	Mon, 22 Jul 2024 15:27:25 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 22 Jul 2024 11:26:55 -0400
Subject: [PATCH] arm64: dts: mediatek: mt8195: Add missing clock for xhci1
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240722-usb-1129-probe-pci-clk-fix-v1-1-99ea804228b6@collabora.com>
X-B4-Tracking: v=1; b=H4sIAD56nmYC/x3MTQqAIBBA4avErBvIQeznKtHCbKyhKFGKILp70
 vJ7i/dA4iicoCseiHxJkmPPUGUBbrH7zChTNlBFuqqJ8EwjKkUthniMjMEJum1FLzeyb4w2Xht
 rHeRBiJzzP++H9/0Af+1nAWwAAAA=
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_082730_172474_EFD2DC38 
X-CRM114-Status: GOOD (  12.83  )
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

Currently if the xhci1 controller happens to probe before the pcie1
controller then it fails with the following errors:

xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
xhci-mtk 11290000.usb: can't setup: -110
xhci-mtk: probe of 11290000.usb failed with error -110

The issue has been tracked down to the CLK_INFRA_AO_PCIE_P1_TL_96M
clock, although exactly why this pcie clock is needed for the usb
controller is still unknown. Add the clock to the xhci1 controller so it
always probes successfully and use a placeholder clock name for it.

Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com> #KernelCI
Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano/
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 2ee45752583c..cc5169871f1c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1453,9 +1453,15 @@ xhci1: usb@11290000 {
 				 <&topckgen CLK_TOP_SSUSB_P1_REF>,
 				 <&apmixedsys CLK_APMIXED_USB1PLL>,
 				 <&clk26m>,
-				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>;
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>,
+				 /*
+				  * This clock is required due to a hardware
+				  * bug. The 'frmcnt_ck' clock name is used as a
+				  * placeholder.
+				  */
+				 <&infracfg_ao CLK_INFRA_AO_PCIE_P1_TL_96M>;
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
-				      "xhci_ck";
+				      "xhci_ck", "frmcnt_ck";
 			mediatek,syscon-wakeup = <&pericfg 0x400 104>;
 			wakeup-source;
 			status = "disabled";

---
base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
change-id: 20240722-usb-1129-probe-pci-clk-fix-ef8646f46aac

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


