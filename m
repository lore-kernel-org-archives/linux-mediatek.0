Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4DEC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSlo1e2m7Ke2K3OKMSOyRHyplcIQuLN1nVJm8tk4a1E=; b=RDw0BNQDW6y4theZ1Kxyy64exU
	CInTWmmV2aRNzMjhi2vWKVMzHFwSUWw5NU8a18vcWA5x3ZCWAhrTRzT5lKXAj/HMyV1q1OWn5Cbb/
	bKuQszGkbqhlpEzwo56uTQ4/RFDRglmqr/7TksEpPilcuiVInrnJTKc5QBle1t4yNIrThxq5yrCCN
	NAWW+Fw/Er+tCKFOyebW9skkOrmeO7QzMwALM6C6wXss7PSml0zPQnbnvsmDRA8a7rT5m7nAin40T
	1cp9CiHh/EECoyb8Xe34mYSyqYnsewhnDKBNB3sxMiP2QQ1BvyOX6I9IeaGm9hLj2WwKGwAxyRFlR
	7eTOCuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXFP-000KzI-Cp; Tue, 07 Mar 2023 13:20:55 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXCf-000Jgt-Qs
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:18:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id h14so12092404wru.4
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSlo1e2m7Ke2K3OKMSOyRHyplcIQuLN1nVJm8tk4a1E=;
        b=V26NSnRfYy0bEJfqEtj3y+cBhCuihwvELxCJysKxeq+3ZX5Ot4yQvmNOxIKhqqbrwC
         sLTfngvzoA4xm2tlHyTlSrHnleN2zuXsoZGG7UXgfnemo0L77OPNV3n+yUCAuDaZQfGo
         xl1Shmsi3c0aM6FjgObCH8nMofVRX6VHR0Sfv5SWlB/Uh/MWHpA8deHNcVMNTHPVGxoJ
         s0ZAsNmurcZCo7md9gmi6z0yuSTCezDgBZ8EDuBiwpIAfEi8wzFoN5cX1dbZ/gVJV6Xh
         Xc9NPKEOme6nuL+ojgWAXlBo21ND4U5/FYXrxZurKELYyeGs93PMtOTn2N0hNTVZqeQv
         8sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSlo1e2m7Ke2K3OKMSOyRHyplcIQuLN1nVJm8tk4a1E=;
        b=VdZxYGQcLU3UkseEP5mvmcYXALwpy7tKACmElt/INE/ts/jvfVhsZsHdeQ8w/YNvD4
         WRuV+w5m82oEGHINKptMx/3tkrg+9K8NFuRHZ+ODRArBE0+/L1FBENGZXEBHY7b5MOxa
         VdhB4YVHgp9m7SwqmRLWdm8qCpG2f/zwhcAOcmS3cZk3+jpSPYxGJYHn8dO8T9KEfXu8
         /x5yZcHptWJiP366wSByjmclaf542ejDqHloyUE9BtIhSWTNz6lL/Ys7+QIE5XF01Hcd
         JDCa/qL6Q8Skk/Jg3MHNGnAbDLxWSa52K0pt3HwPge6jiFvKGcPgsAI44MUzkgxgQ99F
         UrLg==
X-Gm-Message-State: AO0yUKW+tJS+wu9zqlt8oCkw2N6ME5wSfmcbp4Np/8tnIq8H033cz8EN
	KLSrcSF0Il0/dThBY0Im/6LOPg==
X-Google-Smtp-Source: AK7set9tRg7wvkjnEcGMWm1r0boGy0+q5bAnyU2il1578JSeyAoAbvAarXIdC+Z9VXZwNKQc1SOIfA==
X-Received: by 2002:a5d:530d:0:b0:2c5:510b:8f9c with SMTP id e13-20020a5d530d000000b002c5510b8f9cmr9206227wrv.52.1678195083980;
        Tue, 07 Mar 2023 05:18:03 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:03 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:34 +0100
Subject: [PATCH v2 05/18] arm64: dts: mediatek: add watchdog support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-5-6ec7cdb10ccf@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=824; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Z/UqSTkIGRrQ1Y6HlUdxbZpWrZA+oIJk7/cS7ZiMbq8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmEjrkc3qFjy86T5HZHhQPLvhBVopc6i8Y+PhhQ
 ZHfcW8GJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hAAKCRArRkmdfjHURb63D/
 49koerVavrJqikOprLvzu20zDC3gNJ9h7Ckxn5/8rue5mpLVz/tM4WgqQa0AgPEz/quEg1xr8q1h+y
 LZJ7tjaKXqCVm2SeUZwWgSPBzjQYoqeerFpWAGr+sM3P3w18FcjXkqfZA5MZmCt+bSTeHvCVGijrRC
 poFlGaILjqEX8wbZrKB2vdyKY8fjJLDmuoKhWVEPmwewrk0yVAxTO5r/86P1t5uj4i/bcgqcAGNk8W
 Z72912ROvV0Fo24sqRV5RgSQayHbeHii+Y4L+OQvDlkNQ6H+wkUidrgTwrF87rwcNcpVNOGyJ8IjSH
 GATlWPXsypoFObuor51+LwcgC9suVksiSLal149xea0CkOFwo8GgTTbaxyr5EoyNEjFxd/ngw3ZLmv
 T5ieiF9WxFPmOzKRe0/V1aJYySo7I9z0RWDBbKZvwwa4WKf/8jPwSvffWCiRhtun1l6VyCGMtWpo9g
 C5raHzomyQ2SoQSUDSsXRS+J6Xn3H58pwI13jEztK7ziEcuQPg1bKLomJErsuU5sHrMVWjJbrIBQ94
 ZRB4E5YTG3/GGkHxruKPn/GO6DW+NFnnXurRWMyMdHhAo6h3tu2pZ4PcWWKIUN53jiZrUwcUY7t4SD
 SN2kg3bS4u71aMPDJRxEjnaQ5VGg4lQG/KGA+iXtupT7O0+vr2h/xM6B0JCg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051805_970167_0AFD6A5A 
X-CRM114-Status: UNSURE (   9.11  )
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

Add watchdog support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 553c7516406a..e018df6844f6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -162,6 +162,13 @@ syscfg_pctl: syscfg-pctl@10005000 {
 			reg = <0 0x10005000 0 0x1000>;
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8365-wdt",
+				     "mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8365-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;

-- 
b4 0.10.1

