Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABB5C38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 07:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0tnr5ZD8EC2va1ebYMWM4ouc4PlgDpshSSnTTqC0Pw=; b=JNE+nvyHe7ZbRU
	68XWHy7xd2tz3PNpGJFoQIK4/vPYrl587W9bZOxi/Jktk3OCjbtoZ0QmGBFDdy2E2zZJGKyjiBoIA
	ZiggNPJ44+4kKwLdkk0iTsdTJAksHNwTIHi6BxSdacwtz+QaMnpKNooZuRhMzKy8W7cUgpqUcEpsT
	yeJEzETebVnr7c5iYa4DJ600FdF1Zsg8b2xh1Np7sVC8ciEBjDT4aEmBVL0AoeXmUguEZAkXV7Y8T
	BOcv5v5IasQh7mJxtkNgRVQVMhR5GCp5k6UgAXMWzcGfsF1Ejg3C/G2v08QZ3mXaDgFazco4A90HG
	MA5uRCRQo5NiPjo9yp9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onEaR-004Cct-Qp; Tue, 25 Oct 2022 07:42:59 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onEaF-004CWR-9g; Tue, 25 Oct 2022 07:42:48 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 7DC3B625BD;
	Tue, 25 Oct 2022 07:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666683765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0tnr5ZD8EC2va1ebYMWM4ouc4PlgDpshSSnTTqC0Pw=;
	b=T6ILDSntEIQG1Lxfaudwh18uKwgDURHsEnVpRrwudk2wmE2Nkv4pRrC3LEClFMoMwqm0hc
	M0oO2pzuiWZ290pHr7+ZhSZS6zoobZ1BARZR9XVeAauja3LOvKGf2ueZy6Jva3oQP4iWjQ
	ChVGPvjSSNCMsG7zcQBx+RTlHoaVGXc=
Received: from frank-G5.. (fttx-pool-217.61.152.57.bambit.de [217.61.152.57])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 9EB97360310;
	Tue, 25 Oct 2022 07:42:44 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v4 3/6] arm64: dts: mediatek: mt2712e: swap last 2 clocks to match binding
Date: Tue, 25 Oct 2022 09:42:35 +0200
Message-Id: <20221025074238.18136-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221025074238.18136-1-linux@fw-web.de>
References: <20221025074238.18136-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 2109dc3c-1eb0-4146-986b-e8934a220a40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_004247_499157_8DBF8EA6 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

First 3 clocks for mt2712 need to be "source", "hclk", "source_cg"
so swap last 2 of mmc0 to match the binding.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index e6d7453e56e0..9dc0794fcd2e 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -766,9 +766,9 @@ mmc0: mmc@11230000 {
 		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&pericfg CLK_PERI_MSDC30_0>,
 			 <&pericfg CLK_PERI_MSDC50_0_HCLK_EN>,
-			 <&pericfg CLK_PERI_MSDC30_0_QTR_EN>,
-			 <&pericfg CLK_PERI_MSDC50_0_EN>;
-		clock-names = "source", "hclk", "bus_clk", "source_cg";
+			 <&pericfg CLK_PERI_MSDC50_0_EN>,
+			 <&pericfg CLK_PERI_MSDC30_0_QTR_EN>;
+		clock-names = "source", "hclk", "source_cg", "bus_clk";
 		status = "disabled";
 	};
 
-- 
2.34.1


