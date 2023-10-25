Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9876BC25B47
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bac0cPNtRqeMT6ltBwYDY11vruRiib1jT+EBIKA5buQ=; b=ICcFyxfOSuyk10
	i5IFFt5f+DLjsoFHKw0ok91pEmKsWUm3CALk1aKPafEnMNZSDSfif0MxRBrMRA/LWKmby/8I3qKyN
	Odzq6C51CGYP1+OCQaOli2Nf2HSUQL9jGmVr6pvvkyJnF/p0MSVowakDkFbFSXdGXP/1EZB7s+IZq
	ZghlYNl0O/X5zKcFheITUl0etH0EPxUyxPMUhfaW0V+YmqvTKHwLjH6+Vzl5/+fdA0zBkdxLAG9jh
	vHutSB/PpgglRigPO9L/v0GvPnBphiUrc+74OLR7XqHzJB5TAh7r4XFMad0XxbXh9ifJYspRLQ0ZH
	Pb7ZWQjFp1m+XZj1cpDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvhNG-00CksL-0z;
	Wed, 25 Oct 2023 17:08:54 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvhNB-00Ckp9-1g;
	Wed, 25 Oct 2023 17:08:51 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 968DA3FC25;
	Wed, 25 Oct 2023 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1698253723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bac0cPNtRqeMT6ltBwYDY11vruRiib1jT+EBIKA5buQ=;
	b=Gql11qAG1rQf0U7yBatwmKbA0iV7KgSvliP/+cIz3IjPjCEw9PeyUftMorgZD/fAvWB9tR
	3P/01PexfIvBZs58mWou57ZQL2KYJ8I9f6szVIN3hj5o7Azquh6RKbmFP7p5ylTJDIjHOd
	mkfvTt/wEds8iweT4efe3s/NGU/fbGs=
Received: from frank-G5.. (fttx-pool-217.61.159.50.bambit.de [217.61.159.50])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id DEE393608ED;
	Wed, 25 Oct 2023 17:08:42 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/5] arm64: dts: mt7986: fix emmc hs400 mode without uboot initialization
Date: Wed, 25 Oct 2023 19:08:28 +0200
Message-Id: <20231025170832.78727-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025170832.78727-1-linux@fw-web.de>
References: <20231025170832.78727-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e843dea4-707f-44c8-985a-73ad6095ed42
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_100849_746689_30CCED5E 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Eric Woudstra <ericwouds@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 24eda00e320d..77ddd9e44ed2 100644
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


