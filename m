Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD92C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 09:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0tnr5ZD8EC2va1ebYMWM4ouc4PlgDpshSSnTTqC0Pw=; b=STgejxNiO94FHD
	WZ1AoUnQ9Om7pHlLJZtX5lEKSvwQ/E8C6zDPv4zaVoLK4BxR8q2quZ6YoabjrANLPg58I93m3z7Ub
	A1o2foK4ngsukGcEcEETIZL0HKxblMxlfmN5AGO0upl5pK405myryykxjqPY/k3Ya6eT6l+JMtQ7z
	PKPcBHwqpYXXoyst6RAfrOFhvcGmNcZiZNo7qZqhEKz9b4ApljKDcUAkoFhBR4Nz+gupoHBYei32G
	nYOWYjLSKlxfb5oIQ1VHd+UGXTsh4nCAD+hlUXyntKQHwvRuP8z4yDOZ1DWhQmbiQO9jnum+C6Jd2
	6AGhFFBXVhlEEINM/PAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omX33-00Eln3-Ts; Sun, 23 Oct 2022 09:13:37 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omX2i-00ElcE-KZ; Sun, 23 Oct 2022 09:13:18 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 036B14013A;
	Sun, 23 Oct 2022 09:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666516392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0tnr5ZD8EC2va1ebYMWM4ouc4PlgDpshSSnTTqC0Pw=;
	b=ZfrEvccQqlzNnYm8CBVY2Eq34a3cobAs9nIc0rTE8eaB4u70Y2CYB8OWtDcHeGsJhxjN/H
	Vsa9BaiZLBht4FpNT9o1cyIwalonYl7QbEHg1OTK79I347WqveI9To6ThwPu0YOflopGTW
	stgGbxDyuXrQsXQydd7Xlrapx3jlVdE=
Received: from frank-G5.. (fttx-pool-80.245.79.234.bambit.de [80.245.79.234])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 4C605100671;
	Sun, 23 Oct 2022 09:13:11 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 4/7] arm64: dts: mediatek: mt2712e: swap last 2 clocks to match binding
Date: Sun, 23 Oct 2022 11:12:44 +0200
Message-Id: <20221023091247.70586-5-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023091247.70586-1-linux@fw-web.de>
References: <20221023091247.70586-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: bcc1623a-d02d-4a77-a063-81744d9b744b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_021316_845715_AB519D29 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
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


