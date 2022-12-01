Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47ADC47088
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 08:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sbFnIzF7qvR5A534InqCHDBcQlt3cOWkJpUNrDM5kY=; b=dZTdRxQAvgrwd/Bh6fbRhaetzl
	66dHVONgfSrpdDE2jThKH2Dq8kqm0Ik9cmSTHWgQ4Wzg3Nsk5oLMC+co5N07NJx90reR3esVXhc62
	//d3LcSdzPo+TW6OIxt1JAQ9CkISf7qlZFgeNFbq8fxnN+v2GaWD72c9MH63ZuhcTejcSX5nVFb8p
	ooifxa44M4+JWSS+WAuIdZv0/k8agnxGxjjgmV2wF/owBsjI2td95w071C9Ndm72JTp9+OeBibDCr
	IB74P3lkRvbB8gbBOIvcE5I0ByukQovvWKVOzI9/45lRanygJJU+DKW5CXRfCkHKKlETBADV+FRCS
	8ge9eIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f9m-005yiV-EL; Thu, 01 Dec 2022 08:42:58 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f9U-005yVC-5v
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 08:42:42 +0000
Received: by mail-pg1-x530.google.com with SMTP id q71so1066428pgq.8
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 00:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sbFnIzF7qvR5A534InqCHDBcQlt3cOWkJpUNrDM5kY=;
        b=XDENRWACJueRJJLfr0sZFDJNEVniluetT+EiqOGJ2elV26Aly+mIXeq2OITr5R9kxX
         axPog3rAomaLwvpSkndt+RwSLx2DEPNBuTXQRA38Q0TNG0wjPk9RLElkHAwIgUPgZ+ad
         hJxEa3TL9a97p3SZ8flTXNyyFpZ+zkV7xN/Tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sbFnIzF7qvR5A534InqCHDBcQlt3cOWkJpUNrDM5kY=;
        b=LjYqLWmpqUV56/tuSLOUTS3x5fMrtabi2k4MK7hYFpPUulXR/n87o9/HL6c/T71Bze
         ID6azONIhE/qpbXAnh87A5HbkKy0BvtA1i0RWRlLiC0SdGjOZTJ8zjhG91ui4Wyq/ur1
         684RNh0DBBOBBjd6Og8fzKTwWlrjnsS6EgqsrKpwcUX95SqEcblOlgVG7MkBxpzGi1u5
         KG+hgVE/x1PgORrguawvIqEol0MMIrnMX6Yikc+beybhdAfrftMHMkG3XfbUPBaufrIH
         +SWiPkI7lhm4ebb1pSv+dPI0m9MH7tXzm+9C7wMRcvEjzoY+toV9AnzswX2as1hKYk56
         UfVA==
X-Gm-Message-State: ANoB5pnRgJCsb2rV9eaXaI+hBAqQy2ssp5c+xmFIQ4tdUMfppsm4n/21
	t+mvgy29Tf2mAi2S9jx0ynKItw==
X-Google-Smtp-Source: AA0mqf5rTcAjwUigYrgSRA+tffO2tIneJKwa7IosCaE5clajLMjwbQEUOGwXTJG+yg8z36bdvgBRbw==
X-Received: by 2002:a63:f962:0:b0:477:1bb8:bbf4 with SMTP id q34-20020a63f962000000b004771bb8bbf4mr40359999pgk.19.1669884156715;
        Thu, 01 Dec 2022 00:42:36 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2416:fa4e:4eeb:fcde])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902690500b001708c4ebbaesm2932293plk.309.2022.12.01.00.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 00:42:36 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH 1/4] arm64: dts: mediatek: mt8183: Fix systimer 13 MHz clock description
Date: Thu,  1 Dec 2022 16:42:26 +0800
Message-Id: <20221201084229.3464449-2-wenst@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221201084229.3464449-1-wenst@chromium.org>
References: <20221201084229.3464449-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_004240_280860_537ADAB2 
X-CRM114-Status: GOOD (  12.16  )
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

The systimer block derives its 13 MHz clock by dividing the main 26 MHz
oscillator clock by 2 internally, not through the TOPCKGEN clock
controller.

On the MT8183 this divider is set either by power-on-reset or by the
bootloader. The bootloader may then make the divider unconfigurable to,
but can be read out by, the operating system.

Making the systimer block take the 26 MHz clock directly requires
changing the implementations. As an ABI compatible fix, change the
input clock of the systimer block a fixed factor divide-by-2 clock
that takes the 26 MHz oscillator as its input.

Fixes: 5bc8e2875ffb ("arm64: dts: mt8183: add systimer0 device node")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 19ff1babc359..0cbbaebe1213 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -585,6 +585,15 @@ psci {
 		method = "smc";
 	};
 
+	clk13m: fixed-factor-clock-13m {
+		compatible = "fixed-factor-clock";
+		#clock-cells = <0>;
+		clocks = <&clk26m>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "clk13m";
+	};
+
 	clk26m: oscillator {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -968,8 +977,7 @@ systimer: timer@10017000 {
 				     "mediatek,mt6765-timer";
 			reg = <0 0x10017000 0 0x1000>;
 			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&topckgen CLK_TOP_CLK13M>;
-			clock-names = "clk13m";
+			clocks = <&clk13m>;
 		};
 
 		iommu: iommu@10205000 {
-- 
2.38.1.584.g0f3c55d4c2-goog


