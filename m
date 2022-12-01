Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07C5C4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 08:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEDSSsGGM8AAJ08Auy3dp0LttRqfjGQgPHRv4DynzpI=; b=opydDQ479SRCI4mugUUzzxk92d
	+UAZnaRAxwDbJo0t7tn99PqI7DgOOFUD8q8ScK5sh0uNrwKgvr4c6Y5LQSM7WrG+1S2V0fKe07IFf
	nEA5dTZMZJE+aEwWfDELGHNtUJme4A6Rch79EtAbyrttW356pjY2OcVioHE0/fPrA+cX7tfFhWto/
	3/Ow05JcGe2bCEbNT0bKZtqEFqL1iKLXCtJLinZ6W0Ool3XhcwzC0kk4bXhbDAkey7A9fevJsZnhT
	1VemtF9k6KZOaAy18LhCqJXeorZUjWplTh8prgjeRIFAAKmVot/9r7m9ZyL4hpaagR6gcP5p+Zip2
	AFSm9U3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fAM-005z0s-Cc; Thu, 01 Dec 2022 08:43:34 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f9Z-005yZU-9A
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 08:42:46 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 136so1090166pga.1
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 00:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEDSSsGGM8AAJ08Auy3dp0LttRqfjGQgPHRv4DynzpI=;
        b=JHG3IJ5JSznG6iCGYmm3FiA0E7POVkCHlHG7XLvYJlBlS8s4Ba6MxkQ6SeLKll4P9l
         ccNoLbhVbNntAuDvg+izoM0R3lAP89T5vwxqu97HmlQ/7dTSiDe7Um1JCRJCC8bohxjn
         cnEn91GHN9Ac1Iio8VqHyRJc+wFgln0Zwh40M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEDSSsGGM8AAJ08Auy3dp0LttRqfjGQgPHRv4DynzpI=;
        b=f4fN1PGsicS7JbKuRGaeHhlXZF09XueO8yNWLAGaFgXjxlh9RnKjM/ukzoCdzudEA4
         kusbHdcXbgBXQaJcTbE/2OjQMo3ThifStwNp72WQntHkZVp2qAF1HB4RN9TkStCohDeB
         gZZlKh3WHltYiYOz8/guAtxr38lsrLb8ltjp1nSGYkpqseFvCae7SIijdvrZQDKvKNWp
         cOhtuVqnmuXB7nmpKYnGhcFtVtc7xnjK2UgibmjhRajOtiBV/pblxiSgd0QnZjI1m4ir
         2vTIvk1t7JtFoysHx7ZdbiHVuDPzlibRAth/bga2xGqxmZ2jDRg6tGJoIH80aZFwdHxM
         EWKQ==
X-Gm-Message-State: ANoB5pk4LIIwQXD1YRLVfvHe/ZGZvtdPpLfPi5s0Xid8p9948YYFjEG8
	98SV4s0wbUfI6oNsKd1OYFeI+w==
X-Google-Smtp-Source: AA0mqf7FyYTwcmw9tGrsj+b4l/tHPqvoUEIpnviYSG3/NSB7K4eKIhAfRVx7XgZPfbPoxY9gp0nx0g==
X-Received: by 2002:a63:da10:0:b0:477:ccac:6eb5 with SMTP id c16-20020a63da10000000b00477ccac6eb5mr30861853pgh.41.1669884161760;
        Thu, 01 Dec 2022 00:42:41 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2416:fa4e:4eeb:fcde])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902690500b001708c4ebbaesm2932293plk.309.2022.12.01.00.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 00:42:41 -0800 (PST)
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
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8195: Fix systimer 13 MHz clock description
Date: Thu,  1 Dec 2022 16:42:28 +0800
Message-Id: <20221201084229.3464449-4-wenst@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221201084229.3464449-1-wenst@chromium.org>
References: <20221201084229.3464449-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_004245_395987_0C61AEA7 
X-CRM114-Status: GOOD (  12.09  )
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

On the MT8195 this divider is set either by power-on-reset or by the
bootloader. The bootloader may then make the divider unconfigurable to,
but can be read out by, the operating system.

Making the systimer block take the 26 MHz clock directly requires
changing the implementations. As an ABI compatible fix, change the
input clock of the systimer block a fixed factor divide-by-2 clock
that takes the 26 MHz oscillator as its input.

Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5d31536f4c48..60e15833956e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -248,6 +248,15 @@ sound: mt8195-sound {
 		status = "disabled";
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
 	clk26m: oscillator-26m {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -705,7 +714,7 @@ systimer: timer@10017000 {
 				     "mediatek,mt6765-timer";
 			reg = <0 0x10017000 0 0x1000>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&topckgen CLK_TOP_CLK26M_D2>;
+			clocks = <&clk13m>;
 		};
 
 		pwrap: pwrap@10024000 {
-- 
2.38.1.584.g0f3c55d4c2-goog


