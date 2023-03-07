Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4E2C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2OOo+pfMehtdt61ClnrNN4eJg07+4uqh4vAlRtdVDM=; b=T9GciuRIKO2EdK6Q7jm46XylW0
	hMKEwzSUCPfmS59W+0sodR3WA0q/sxZYLoxRw8Fln8DVl2aHyoxSM1/rruVqsxExLRJqL35/UjILS
	u2navSCX2TB09EpSpB0HAoapuaf8FsSBWdLp+DfQi6XKjeeRdkHXCUM+J3s+c6nsoC2QKwJZLey7Q
	FNp4iGuH4D+kYuXL7ZOrCRgg6ZJJDfFiCGJ1+g0s1M0VvcdrlLhW9s8jLYfVaqaPWq4yeb6TD18RC
	tmmHwzFQI3OH74xGbDehIhD0OdoaUjfIUbyMUHsu9F5MqlN+Csia3IQUcy8sYRh7nGYnsFLA06+88
	OHm1k3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWdU-0008Rg-4x; Tue, 07 Mar 2023 12:41:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWd8-0008HN-2I
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 12:41:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id v16so12033816wrn.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 04:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678192876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2OOo+pfMehtdt61ClnrNN4eJg07+4uqh4vAlRtdVDM=;
        b=t+iCrtVwYmXqVdAOWAa7/XjG7gzjZ1vHvBnEMS2znGVTMyY/buNzrsP8/TIwW0iy5A
         zjpZ/Lvp96EimEV4FcrjOQkEgmoYTtNy41KE4E0PDzFmlPUwLxzCPIVixOpiCDf+Mqo3
         yblCliPsP5zKKFVn+L22jzucDeSuNs+7PUw8/EbKnbjwLciA6/wzNYulZ4vJsZOzEauF
         bvmrKczEh5fWp+1N0BPnhTsomwoelVr5vpPM/mzppRF9eKGHgEHG2AT3ghasCGIccV3p
         UlFp/JXPaHa87Qe7fW8/uZDcV4CGp4zCzgDEUMI8KMLlT6lpcN1BIkZg8cR7+vM3OKkZ
         aFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678192876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2OOo+pfMehtdt61ClnrNN4eJg07+4uqh4vAlRtdVDM=;
        b=kcFv5m3i+a1HmMRe7UViCMTF2+/fH92/qoR9vJuhn2efBLxoL5My+hZBQiVCZLq158
         yw208ntW7S73kO4skrFHcs1r5aGfDi9vPb490hd7mWeJO1beDP5pyynKdspPEwmOvnh6
         DEIF3dY0KvoPmbVokpImUpWPdwg+2v4NyN1FjC8wcfvzpEfEmAZ+NXYb/59JUZkbIC7Z
         mrnqakjRJQmq7Hi8GCJKGUcxl7FHVW+GwnybL+4mUvh+fmtXo3gOpbBqqXDOnHb5Y5XH
         5p76YxLWMNQxbP6s52h0bVCUJ8hoHsAZarqCZ9NUx7yVIzQc14pBSF2pf6CNBdWaCXFU
         F/VQ==
X-Gm-Message-State: AO0yUKXrh6r+pTQa6h1T17NZI+4EqezJwueL3wPIu4uyO5GM/o4qHWwU
	2Rl7avUKqTswl2hNJj8QdyXxJ7BffQaO6wBvLf4=
X-Google-Smtp-Source: AK7set/+NNqSqU0bfdG9m+kpc/KOAP/7Ta2xFg2yAgQeYkWjx5v4TAuJO8pie/okaqgvHEAPq6s30w==
X-Received: by 2002:a5d:5746:0:b0:2c9:5dd8:2978 with SMTP id q6-20020a5d5746000000b002c95dd82978mr9414849wrw.59.1678192876653;
        Tue, 07 Mar 2023 04:41:16 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id w9-20020a05600018c900b002c5a1bd5280sm12434670wrq.95.2023.03.07.04.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:41:16 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 13:41:07 +0100
Subject: [PATCH v4 1/2] arm64: dts: mediatek: add i2c support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v4-1-885ad3301d5a@baylibre.com>
References: <20221122-mt8365-i2c-support-v4-0-885ad3301d5a@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v4-0-885ad3301d5a@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2699; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=u+MtjyWPgh4jPQn4QvtpwirJ4T/DfAOJHsOpg52IJ9U=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzDqCiWuVUZenZTJHFBYtVy0B5IyQnJXC+uVZ9IP
 OirqWTuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAcw6gAKCRArRkmdfjHURT4AD/
 9wYMx1vHjoOrKmlL7xjPDPSTvpxLJZf/NXsVj37zs7wt+ueBvxUem49Dxy1ChEA0UEip6Tt0x8r4tR
 Kd7nC8peqX2AoLfK7HFkiQ1QL8y1r1WC/IRQZofDQAwri2iN2TcTCaxKBiRttPQikbRycbw6xoR1Rq
 YvotJdmNGUOzxpi0lIURHfkWFSBG/2eNJRAr5cRXrxv1PkgXl7nGSNSNQU10P2pkXTA3+oE2FqxizR
 GGQNhUqN0PSzwnC3PsZomQgFCLnh+jj+yWgk3Ju6jSiDPdWFMYygAH7XiFtSNH6FrlODYqSDUZbiaC
 w3rRYdc25p47Q5W9d48jNpVvVguNx793pdG1Xqig5iYkGOID8+dJkza1mqQDSU/DB+R7PHt2WWxSNu
 kZlpVXSqgijHOqbYEE9jiKLSClpqHuKE10iODGIaYpQfVpCiNXNf+Ejz+iWdvuxguul+ta23esEnMU
 DVx9B5rcigh3xVI3nUOfybn8GqU+MCjHma5+m/bLOmIMHA4Ih3dh6PwT+laGOen53v/mH+jN9R1mLu
 XRcnvzSsk9v+FSW0b+yMeR8+6+mo4kRxtMhSbFho1HDCtbDdtGhcTf3fbHuI9/CfwNwnbAZgwnObPp
 bcLHAx37v+aHN4V1Q4UX8jT4Xe4WFNMj0yiu90hzQaqkKmUG//rn7BJlxAvg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_044122_256355_BB7FBF49 
X-CRM114-Status: UNSURE (   9.38  )
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

There are four I2C master channels in MT8365 with a same HW architecture.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 15ac4c1f0966..b70f4d256f63 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -282,6 +282,42 @@ pwm: pwm@11006000 {
 			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
 		};
 
+		i2c0: i2c@11007000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x11007000 0 0xa0>, <0 0x11000080 0 0x80>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C0_AXI>, <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@11008000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x11008000 0 0xa0>, <0 0x11000100 0 0x80>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C1_AXI>, <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@11009000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x11009000 0 0xa0>, <0 0x11000180 0 0x80>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C2_AXI>, <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		spi: spi@1100a000 {
 			compatible = "mediatek,mt8365-spi", "mediatek,mt7622-spi";
 			reg = <0 0x1100a000 0 0x100>;
@@ -295,6 +331,18 @@ spi: spi@1100a000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@1100f000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x1100f000 0 0xa0>, <0 0x11000200 0 0x80>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C3_AXI>, <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		ssusb: usb@11201000 {
 			compatible = "mediatek,mt8365-mtu3", "mediatek,mtu3";
 			reg = <0 0x11201000 0 0x2e00>, <0 0x11203e00 0 0x0100>;

-- 
b4 0.10.1

