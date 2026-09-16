Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBB0C88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 04:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPjvgmHurA9QB7uZXjAStLUtqAnkSK96qD/+I6+APD0=; b=DJVuVXIMipHu/VQtJ4AvNIZKWy
	md0DBNOhyMSyEE13Cq0niaHAXvHheR6WkIGyPJVRCcbJavnU87lLcQtdZUPONt2mY55Z2UtPdmsD8
	9is+h903mBwho6ORhbUXzUOHo6RVb7ViQgligyTFbjxZAfZwbSQMHhFTBqhywp+U+b5qVu2t0r4Mk
	FWGmYJPkwfvjRgywDWs1p08p3M6mpzrZ5ZIbK5dNbyiShgD9Q+F5UIEJUDnQElRpLjnB71yd9PCHY
	ZOCBFyvOlcpeV/+RRPQ/WvUIFB4MhvTUKKMPcKRR0WD85RKhYjHBJEyZ0+iR+7lGONWruyMP/jFV0
	KNJn8PXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6goj-00000008HRJ-24Mb;
	Wed, 16 Sep 2026 04:00:17 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gof-00000008HPX-1uqD
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 04:00:14 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396cccbba91so322383a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 21:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789531213; x=1790136013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPjvgmHurA9QB7uZXjAStLUtqAnkSK96qD/+I6+APD0=;
        b=lbsUoY6dss6tU+qPbouICBqDbskkS6pH7Ugw6VaqlOWKbH2NE2lyQKkEwXTAWk6ouB
         FLKc3kaMqy1DI3ten5/nTL6Go4hjps5rhgK/qrjAnk33OQGcNDQvjDFundQXeOELqDYq
         /NJgRLKTYUFUg6uXqxh0/SvQn+ECR5Y+YNFB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789531213; x=1790136013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPjvgmHurA9QB7uZXjAStLUtqAnkSK96qD/+I6+APD0=;
        b=D+TSlqg5P1njISmwAoIsdlsDv+8CcnUDdifuziE93c9BFeivcboZrL7F0UYhW0BQoy
         bnVc8fk0h3fNa0q5fYLpO1NxRDpifnzR4kqqYeYf5jWEd3OQzFapqHiJWvtB28FRZl1P
         fI91tTWC4Ddt8d1S6W39BTVSUEbZouW10wBGZ7CQ9u4cYgri/dpxRGDguFGgovdRgNz3
         FeEKWm3RMPNezE9v/8E+h16ApetfCdCa0/umgLCXmJ7AcQLwDDIp/GCQJjkCBKPii4D6
         N/zc/m/Kb+hM3Lvr7wgGsplrHowF5cOkpKIV18hnv0sAcs/ZCemxf9Ht0HZgytjpfusY
         9fRw==
X-Forwarded-Encrypted: i=1; AKwUvBzoc4biziPoliZu9tT88x3dLoYy3jZM0NrGBpaFODw3+oly9thxrnDXvSEz44eOk2LtIPQEQAJD3ymUCuos5A==@lists.infradead.org
X-Gm-Message-State: AFuF++naH3HEsvFuaXLHwKK8REbn/Xv4vNM9iRMbpc/B+oZrWXXQl05q
	FeEY5p26hQ7Y70laETYZTVRI6R67ePCCC1eopaDGo8sJ0Yf3TlUj4TAtChYxREirVQ==
X-Gm-Gg: AYBFou1K1h89LVeNqr/2aK1TGcc5D3q5ob4+5yCMMW7/dQTWXQBMte+/SvDy2eEGKgv
	Dd4/53l0a0ISM3kNx5W9prL/Pk0Q3K4liAhXcKw5d0fEbnfFX0HjYBG4JW6cwBUOQLZU/ppzdxw
	8yJIhqZBQvSVaVky31in5YbK5tl6PvPAFdOMkZ7jqGbbTZXA+4gMwcGDloTnqhZXyVAXBQClDna
	ShcTOqM8d6Ebbyy4AkR5zw4BPYratV74XmUTjBewud6vx5f5MJE1U+pbVr8tKObadZVVsxX0xV4
	g3iU7jRaGe72LyoVIgpGoYZbUO/inSNCewsSO3tYquUk9bH6F3L2Gq95tEVvoPoToBlAAfSBh3b
	s0IpvlKnAZrHOHyc+7Wx4VzW9ukE4ryPWbZs065I0P+uP1N10PQlCpWPL4I2wT6HFAUrEeI8H1c
	KtWaAYGWMCUfaP2kfUD6PWYUWfcSqDPWOgBdL5Pi5b30Ool85vZMHPDwpp2rF7bC/NJYZa4p3pE
	kmknlscS7ye6J5ubd0VeJxfLJAn89FDSClqzz5PUW71wHW7o+1FiD0URg==
X-Received: by 2002:a17:90b:390e:b0:39e:1c03:14c2 with SMTP id 98e67ed59e1d1-39e1e3898f0mr2478995a91.11.1789531212760;
        Tue, 15 Sep 2026 21:00:12 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a3cc9sm2030139a91.14.2026.09.15.21.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:00:12 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH RESEND v4 2/2] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Wed, 16 Sep 2026 11:59:52 +0800
Message-ID: <20260916035953.3111607-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916035953.3111607-1-wenst@chromium.org>
References: <20260916035953.3111607-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_210013_652754_163BD864 
X-CRM114-Status: GOOD (  13.29  )
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

On top of the GPU is a glue layer that handles some clock and power
signals.

Add device nodes for both. While there is supposed to be two different
power domains to the GPU, MediaTek does not have any information on how
this is integrated internally. Assign the same GPU power domain to both.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index e75ed4bd458f..66e68702732d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1002,6 +1002,37 @@ u2port1: usb-phy@11291000 {
 			};
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8173-gpu", "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0x13000000 0 0x10000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&mfgtop CLK_MFG_G3D>,
+				 <&mfgtop CLK_MFG_MEM>,
+				 <&mfgtop CLK_MFG_AXI>;
+			clock-names = "core", "mem", "sys";
+			/*
+			 * Binding and GPU core HW have two power domain
+			 * inputs, but MediaTek does not have information
+			 * on how this is done internally.
+			 */
+			power-domains = <&mfgtop>, <&mfgtop>;
+			power-domain-names = "a", "b";
+		};
+
+		mfgtop: clock-controller@13fff000 {
+			compatible = "mediatek,mt8173-mfgtop";
+			reg = <0 0x13fff000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MFG_SEL>,
+				 <&clk26m>;
+			clock-names = "sys", "mem", "core", "clk26m";
+			power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+			#clock-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.55.0.1032.g73a4cd73de-goog


