Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673F0C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWSyw7vn1Yd55xL3/Frwm9BLMR0g24cMsEBW/WsgZKU=; b=hdR2sfyV5wxAtUdA02HccMDYe1
	w8MFZpj2v4Ka505tC7xmQvdzcbJGkTEWfrcHottzPhm6MHLZ+y5EDAcTW8izFBGObQdZKu6wt7xAJ
	D17HV/ZqGcSR2IXQJgf/aAFSA/4OrhA2SP4vjfnSDlr3+EpnlUdFS7D7/5ncpW5q4lIQ9m5fGaslS
	xLttzwJI7D6t1piH2uTm5yWu8emb2/y/pC+rVdIdg+GBs/FYXxZDbzr1fbpU3bU7ydA8JLgtYkxYd
	bZyqfcEkxO3c2ZNnX6+Mjbs15dgCtwj1RuGcs11YU6xmhzCGRL9Rhe31xoJUgR7ru+zPEG71r69mN
	H0BQmseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXoM-000ZHG-34; Tue, 07 Mar 2023 13:57:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXdo-000Upo-Il
	for linux-mediatek@bombadil.infradead.org; Tue, 07 Mar 2023 13:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AWSyw7vn1Yd55xL3/Frwm9BLMR0g24cMsEBW/WsgZKU=; b=k6cLGaWLZCUxJ2vBdNo5JqT84q
	dPe2CZ5gP5IKCf2qK+RPRIE6nS6wHBsJP6fV4tK37HoyczLDR6aEZz/qzys0M48XezpNQkX7DOD3o
	/3D7K8Q9E3oYsnqxhq/wJP2quI/tCkUNIs3RKfT8rolVrI8wPyFyZb0Dr1vkOlRkr+/3epEW1bpJB
	Qg2UscZzmAvj13tcELJpr0q0AhXcdvfW2TZRAJZ5aJts5cOS17Nh22hnrHnE9+q8EYDitOEEWIgxf
	R3pvaouE5KeuDZc/nb9WjC8aQeDeBwsHswTO5+l3PzRk/GMjRXJzNtztmCwubiSB3+O3B/7xCLLZW
	HnTgjKPA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZXCl-00H3Aj-13
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Mar 2023 13:18:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so7175721wmq.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWSyw7vn1Yd55xL3/Frwm9BLMR0g24cMsEBW/WsgZKU=;
        b=TyfWNfDFIVwUZA8oaAn+kwe3Lh7boZVu8yZvraaMEMwkHZyuvuhcQBmJ/BUkTJndYV
         johjThg+tk7qIMBPP5T6chON4VStCgsF40Hosigz+e8gWtIowPCZJJyZH3r92JruB402
         hVE+S4oNyiKTRwpOP/8fksFFHIb+kxx4KtiCtQJvynNiJLEngL3SApgtjTcwpT6NQn7G
         EeHSBJlvLGrZvVtTSBJNufjeCuQFW6erC5zB9B1iREiFcg6kGdkUrMmE7xGXt428lUpM
         SU7stmZvW3tQyAZqu22dO1hr20TjnAnZJK+jx8mq1fVVxz6mFQHs7vaD7BdJ5teLD9S2
         FnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWSyw7vn1Yd55xL3/Frwm9BLMR0g24cMsEBW/WsgZKU=;
        b=l0I8YD2ZH1S8FcHqEUT9CYuFo/qt9Qdr+/HOhzRiNhXtsfd1Bmvxw9P9NqCovWBY2f
         AOYu6R0pUBsKl6HZieoH90wkm790Vprt7HWkh32JwHnrpFj5KZRSAh6CnJnHhXkRKvF6
         ZmkFlOVMuf23J7IsdeKD1nbDg+3wYaMyLir9OteoILW1SCd66r/9EWZeJVnXfCO5vSwc
         79IqE5C/84z3EGwKQTIe2iRHDN9vAWZ8TJYbeY47XawX3nnCCdJB30JFeWzRQn+4T6Do
         76tZ+BmxrHwaGZLjmplb1RY6ZvCfnuz6OiQwWvqgcdDpibokb/bG/dUKc5IWTNDSqFiU
         FJww==
X-Gm-Message-State: AO0yUKVybExaVh9ph8H3TMJH1ELS8PrHE/NALzMC1kiBE+I5gWy+SSo4
	4+RjF7gU7BTcqD0OydjMNWA+ug==
X-Google-Smtp-Source: AK7set+Yb3+r4yp9QkoXV628gX8MpWMtrDIiYbBHHYR6YaP4a4bBLJxm0jJb9s3A4rlqKKIhrytsMQ==
X-Received: by 2002:a05:600c:4593:b0:3eb:2f3b:4477 with SMTP id r19-20020a05600c459300b003eb2f3b4477mr11545936wmo.28.1678195089050;
        Tue, 07 Mar 2023 05:18:09 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:08 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:38 +0100
Subject: [PATCH v2 09/18] arm64: dts: mediatek: add mmc support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-9-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2130; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=b/w2WNUqtK9XOnggUHaJqIMMUWpiozZDP8P43Z1auyg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmFy4JhC6orCMChEoIwF/YLwuuJqJQzpRXkhWyY
 8KWIwOeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hQAKCRArRkmdfjHURa5JEA
 C6Xlkjc++w6xtOTyvSysrEiqtVxFkMzX8XyhxnRjDzvfzR85SAIfqY9spKK4vrnAHt1JjW2wpYbLEL
 OP7gZY7I/c/X2BFe1R58H8HL203BSXbsDKGoQamz28W309Jwkj3RBQ0O/LcCwyREPlHrGVsaj6uTx3
 nlgo4lYxsotV97/fJ+BTU6Tu5KqTSlkH0Vc5TML4jFw3cXbKuc/zMF8uJXBwvothDSuH+td/jLZhxS
 wgbcapn1rXK+2aNZCgQBLvsJJUTHNXMLIk4NWGBYS2wUrHIPM9/NN5wtkRrye11TOOMy4Ti0zDO5KM
 HRwXLBGe41fWjja4j3SVNQFjFDFLEpuRPWL4Ajnzqd+114WK6L1P51v24so9hXMfbyZW9F9gKGs1sX
 Pjnhgf1Elv3BFwJU68QM+tUR92hAMhGoYbUtvQbt/cRLDZ956Br5Hv7yLPDo/MME59wQ8tk1xEZCF6
 x23qQtOfnu7aQSo14T5lpcd9fXq9xGG4s3d20u0MzBWEst/FL5HI80O4199JRrouP3GtQ5YTZbzn8d
 55ntQ3Ab1e0DOU4wwsj/VfbKx2ekL3Al66bJNt2WUexSs5hq27UtvUi3Rc6Ta8VXAqYtlW7NTIx7GG
 j5EAqLaEheFtO9mI2IxyzAQFvyhimx2UftqunWyqcqGZCxZtX7lUBdbbyNAQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_131811_486154_205BE378 
X-CRM114-Status: UNSURE (   9.86  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are three ports of MSDC (MMC and SD Controller), which are:
- MSDC0: EMMC5.1
- MSDC1: SD3.0/SDIO3.0
- MSDC2: SDIO3.0+

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 687011353f69..a67eeca28da5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -399,6 +399,45 @@ usb_host: usb@11200000 {
 			};
 		};
 
+		mmc0: mmc@11230000 {
+			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
+			reg = <0 0x11230000 0 0x1000>,
+			      <0 0x11cd0000 0 0x1000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
+				 <&infracfg CLK_IFR_MSDC0_HCLK>,
+				 <&infracfg CLK_IFR_MSDC0_SRC>;
+			clock-names = "source", "hclk", "source_cg";
+			status = "disabled";
+		};
+
+		mmc1: mmc@11240000 {
+			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
+			reg = <0 0x11240000 0 0x1000>,
+			      <0 0x11c90000 0 0x1000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
+				 <&infracfg CLK_IFR_MSDC1_HCLK>,
+				 <&infracfg CLK_IFR_MSDC1_SRC>;
+			clock-names = "source", "hclk", "source_cg";
+			status = "disabled";
+		};
+
+		mmc2: mmc@11250000 {
+			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
+			reg = <0 0x11250000 0 0x1000>,
+			      <0 0x11c60000 0 0x1000>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>,
+				 <&infracfg CLK_IFR_MSDC2_HCLK>,
+				 <&infracfg CLK_IFR_MSDC2_SRC>,
+				 <&infracfg CLK_IFR_MSDC2_BK>,
+				 <&infracfg CLK_IFR_AP_MSDC0>;
+			clock-names = "source", "hclk", "source_cg",
+				      "bus_clk", "sys_cg";
+			status = "disabled";
+		};
+
 		u3phy: t-phy@11cc0000 {
 			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
 			#address-cells = <1>;

-- 
b4 0.10.1

