Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1FAEB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 18:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8cdP6cF+nwTWlyfboIiQYyzWM6TGbsre5s255hDw1E=; b=moql1uR1So5K0E
	YwEU6//z3uUByhJc7tSBuEPUKBE2gBNCb3SSrxTq58hhoUjUVJxqhfLaOMjhI7qvlMB7nGQwUTbWA
	sB87g7ZjOKg4Ry/OJoWQ4hK3wcYR0zwyINJNnlrKnN6Sbg+yy6mUYZ8SbAKJ5ijPCxOTCyh5Y9Atp
	1mEgTwUlggC3wuv4lJ59+7fUdEECKkrw50BFhc7S2G0gSN8JJz3MAqgXz4JgH5XkS4A3qtq7F2tD7
	9GQjt9IsTv5ulKrNiEUGHCGunYiE6E8+0GyRrLWLcE5FN3rO/OYi013a7eb8SLd88Y6VYeR2yCWSK
	SS+2bNEk5U0tic+IaeJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEwcb-001nXm-10;
	Thu, 29 Jun 2023 18:44:01 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEwcD-001nNt-24;
	Thu, 29 Jun 2023 18:43:45 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 92923605D4;
	Thu, 29 Jun 2023 18:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1688064214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I8cdP6cF+nwTWlyfboIiQYyzWM6TGbsre5s255hDw1E=;
	b=OGbX55DGj/xtkG/hWVz4Qo4R1i22zFNmJxp55CTfnwcpyzy+ao4f+YL/q9cUmFsKtmh3WQ
	SfRGV00+DKFU+AFks3cdLH1xvu04AOhJ1j452P0Cwd2PdgQB6gWydKc7cZXbj/KnAUW/gn
	Ox6Nxq39V7ltXPJoF8QFFi+sFdSePNc=
Received: from frank-G5.. (fttx-pool-157.180.227.241.bambit.de [157.180.227.241])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 916DD10009B;
	Thu, 29 Jun 2023 18:43:33 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: dts: mt7986: fix emmc hs400 mode without uboot initialization
Date: Thu, 29 Jun 2023 20:43:18 +0200
Message-Id: <20230629184318.551317-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629184318.551317-1-linux@fw-web.de>
References: <20230629184318.551317-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 79a3025b-a2bb-4026-a6d2-40902656f0e4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_114337_837372_88F5CBB2 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Eric Woudstra <ericwouds@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Eric Woudstra <ericwouds@gmail.com>

Eric reports errors on emmc with hs400 mode when booting linux on bpi-r3
without uboot [1]. Booting with uboot does not show this because clocks
seem to be initialized by uboot.

Fix this by adding assigned-clocks and assigned-clock-parents like it's
done in uboot [2].

[1] https://forum.banana-pi.org/t/bpi-r3-kernel-fails-setting-emmc-clock-to-416m-depends-on-u-boot/15170
[2] https://github.com/u-boot/u-boot/blob/master/arch/arm/dts/mt7986.dtsi#L287

Cc: stable@vger.kernel.org
Fixes: 513b49d19b34 ("arm64: dts: mt7986: add mmc related device nodes")
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 68539ea788df..207510abda89 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -374,6 +374,10 @@ mmc0: mmc@11230000 {
 			reg = <0 0x11230000 0 0x1000>,
 			      <0 0x11c20000 0 0x1000>;
 			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			assigned-clocks = <&topckgen CLK_TOP_EMMC_416M_SEL>,
+					  <&topckgen CLK_TOP_EMMC_250M_SEL>;
+			assigned-clock-parents = <&apmixedsys CLK_APMIXED_MPLL>,
+						 <&topckgen CLK_TOP_NET1PLL_D5_D2>;
 			clocks = <&topckgen CLK_TOP_EMMC_416M_SEL>,
 				 <&infracfg CLK_INFRA_MSDC_HCK_CK>,
 				 <&infracfg CLK_INFRA_MSDC_CK>,
-- 
2.34.1


