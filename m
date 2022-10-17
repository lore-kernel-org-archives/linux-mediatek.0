Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F34C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 10:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRhkmMdr4kbCCbRWT2nxseEW8IW5jbRk7B4fVTibJzo=; b=hrdpGcaxQVZwgQ
	Kzn2UBONlx3GTrF4Mq+SFRSY2Mlhi/OEnU8MkViQXdGiB4O63PQ2DUtk1rVgdIgW6+vUYjYTTe3VM
	xPMq69OzvD/9I7lYqIz+8I6RsVhr0R59/LXpDRC+cLBuHqenoBg+Z4kllJGx2Ufnw0pb0RwLckxbq
	4xEtsCsdoDItur94zPaOZB7RzjTEc9lWOJyJX1Xb21hxk1nCcvnTS2pYkO649w9R7pjNEVFx5tPbT
	5eNu9PAN/5YX538CyCSo86f7qtx6AeNGxNLaRLommBbQoym2qPCrRtRpL4bYLO/c6ubgt8f+nk8Fj
	gCUgqyfFp+5s+DBxWYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNav-00AOxB-Oh; Mon, 17 Oct 2022 10:43:41 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNZJ-00ANAp-Sp; Mon, 17 Oct 2022 10:42:04 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout1.routing.net (Postfix) with ESMTP id 79B3E40544;
	Mon, 17 Oct 2022 10:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666003320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uRhkmMdr4kbCCbRWT2nxseEW8IW5jbRk7B4fVTibJzo=;
	b=CPUJvv//lfITZyJ3h2TOmcYP06VH82A3WnrTVmBE1RDxsohCQfYS/q5NWXx2jP2/S6KLPx
	t+aKoAypT6G5OGzS55hJmmCgsOMae4rpPll8R4BW2Yasw8whysfF84bt9VmqdExRBvTcSp
	w+jzwfEJEj9RCDjOWD1WKJo707Atty8=
Received: from frank-G5.. (fttx-pool-217.61.154.127.bambit.de [217.61.154.127])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id B6ABE406D6;
	Mon, 17 Oct 2022 10:41:59 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v1 09/12] arm64: dts: mt7986: add crypto related device nodes
Date: Mon, 17 Oct 2022 12:41:38 +0200
Message-Id: <20221017104141.7338-10-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017104141.7338-1-linux@fw-web.de>
References: <20221017104141.7338-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 4f24e7d5-e179-46df-b3f0-0312d410deba
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_034202_094009_9211C178 
X-CRM114-Status: UNSURE (   8.86  )
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
Cc: devicetree@vger.kernel.org, Vic Wu <vic.wu@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

This patch adds crypto engine support for MT7986.

Signed-off-by: Vic Wu <vic.wu@mediatek.com>
Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts |  4 ++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 15 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts |  4 ++++
 3 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 1a6ae2f05afa..7e339f5ded59 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -43,6 +43,10 @@ reg_5v: regulator-5v {
 	};
 };
 
+&crypto {
+	status = "okay";
+};
+
 &eth {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index e48846e18b04..aac129c6f295 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -206,6 +206,21 @@ trng: trng@1020f000 {
 			status = "disabled";
 		};
 
+		crypto: crypto@10320000 {
+			compatible = "inside-secure,safexcel-eip97";
+			reg = <0 0x10320000 0 0x40000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ring0", "ring1", "ring2", "ring3";
+			clocks = <&infracfg CLK_INFRA_EIP97_CK>;
+			clock-names = "infra_eip97_ck";
+			assigned-clocks = <&topckgen CLK_TOP_EIP_B_SEL>;
+			assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>;
+			status = "disabled";
+		};
+
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt7986-uart",
 				     "mediatek,mt6577-uart";
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index cd1763fa7f19..a98025112b5a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -43,6 +43,10 @@ reg_5v: regulator-5v {
 	};
 };
 
+&crypto {
+	status = "okay";
+};
+
 &eth {
 	status = "okay";
 
-- 
2.34.1


