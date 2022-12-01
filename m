Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A11CC47088
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 08:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WOeFuUzcolWHnZuc7pdP9VxPOXM1oDwP4XAacQirfk=; b=VdNpJpqDi8a0q4zY7XpQUH5LcB
	Q4/1IYfU5kp5LSQFw6s5tap7QpbCnfej6lbtQXAuecED9PWSLTcb/lZKXSVM81YBgrRvlL3uUtQRr
	M0s+BKXlNBK6tLbYjluI75zVG30731/ZUeMGUV4VNFO0/omtFTEI/PLaqgM5MbWU3eKR/yxcOcngJ
	NTib/R2HmTG5G30LRtZFghVWHqlzemE+jE3ioYw2IORv2YIfqiuZnr6SJoibzBvwtEQ1nnPZkZv5m
	DMIcwAaRnDNxjMw/B+8RptpnCDeW+AqLo+2FDZqTDSynCirMYB2GHmjozPMFIcM27DAiMinZVefAS
	w9C7+ydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fAK-005yzg-OO; Thu, 01 Dec 2022 08:43:32 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f9X-005yWt-0g
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 08:42:44 +0000
Received: by mail-pj1-x1031.google.com with SMTP id cm20so1238289pjb.1
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 00:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WOeFuUzcolWHnZuc7pdP9VxPOXM1oDwP4XAacQirfk=;
        b=Db38O9+lHRZcLVg6Gbmwkz4xrvTz6HETUHmq8LkST7DxaWmHW8hiFgaJcnDpokbDcd
         HkWqdpu6rZKau4iS4Tj0gu2ffXPotKHe3uk3GmiiO7OK+GCSwDXx1EqCZ5ZovhHk8GSU
         HIsmrI4RclhucCrtNGW8OWPxuNtI3F4nE08vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WOeFuUzcolWHnZuc7pdP9VxPOXM1oDwP4XAacQirfk=;
        b=FB15Fz9owEgnQ7LbpD/YoXeWTLVUXt2Gs2B5qFcEwlVi8CIUVZLDh+a+jcsXrYDpUg
         STVtjn1Y3Wh8HTnoupj7a1H5bm0HESzLpupn0kX+c7TQoa9TiFsjzYPThmwylSHMtomY
         X7Wprxs0gU/oU5ppunsg77rDoZkxGooAg2ACBpu1o0dm5u6Y/85/K3p5LGqXir2fOWr8
         z5takN4RuZTz9DZMHCdMNYtxDxM7drDJ56SZMmJ3t7WSxg6goJfNlEMPqmS1jsjcSNef
         iVv64aNz2PUSFzvqY1JsutsREF+7SxJBcQSZXyiZsBMome93QFW1lQVm4siKeqJHeslN
         oCsw==
X-Gm-Message-State: ANoB5pkO8rl4d5SrFCaGeUZgto0lJ3nkeB1IO3mSPTpnZRObsQJVGPUD
	C7cBa9wd6J/zhx2iTW554Oo/pA==
X-Google-Smtp-Source: AA0mqf41cigCeKSKmoN4bvphHgVPZ/wH2bU7xeJPntvphumOR1EcxVdeLfSSCX1ZL+sef2jSk8zT0g==
X-Received: by 2002:a17:903:4051:b0:170:f343:ba14 with SMTP id n17-20020a170903405100b00170f343ba14mr46469201pla.70.1669884159302;
        Thu, 01 Dec 2022 00:42:39 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2416:fa4e:4eeb:fcde])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902690500b001708c4ebbaesm2932293plk.309.2022.12.01.00.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 00:42:38 -0800 (PST)
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
Subject: [PATCH 2/4] arm64: dts: mediatek: mt8192: Fix systimer 13 MHz clock description
Date: Thu,  1 Dec 2022 16:42:27 +0800
Message-Id: <20221201084229.3464449-3-wenst@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221201084229.3464449-1-wenst@chromium.org>
References: <20221201084229.3464449-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_004243_086638_490787FE 
X-CRM114-Status: GOOD (  10.67  )
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

On the MT8192 this divider is fixed to /2 and is not configurable.

Making the systimer block take the 26 MHz clock directly requires
changing the implementations. As an ABI compatible fix, change the
input clock of the systimer block a fixed factor divide-by-2 clock
that takes the 26 MHz oscillator as its input.

Fixes: 48489980e27e ("arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index fc39ccc0d4bf..ab4d4f605493 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -29,6 +29,15 @@ aliases {
 		rdma4 = &rdma4;
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
 	clk26m: oscillator0 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -534,8 +543,7 @@ systimer: timer@10017000 {
 				     "mediatek,mt6765-timer";
 			reg = <0 0x10017000 0 0x1000>;
 			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&topckgen CLK_TOP_CSW_F26M_D2>;
-			clock-names = "clk13m";
+			clocks = <&clk13m>;
 		};
 
 		pwrap: pwrap@10026000 {
-- 
2.38.1.584.g0f3c55d4c2-goog


