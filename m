Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73665C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 15:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wK0CnlZOX9M/iM8SewTczZ0sLEDRfVMf5U5O9npWUVY=; b=pIHdn/rz/u57Y9nyONs3yrlSzI
	emEzLuwxgdXKv7fNSzkZnwqxEaqvlFbI7tU0xQl6vI2HLoiVdB6C8/vxGaukKPbZl5tEzhkBv/xxS
	NlQhYIdSGd6DgeqtDkhnQN51W3gryx2eBnuc5UhMMxXS3QUE/41G4qkFe7pY5z88Z9EbmO1jFNFSW
	s+WnmPRQF4rALCzPgn8uDeuLSWnz5auLTR27Km0W7oy//65N6XNhahqklhWcl4SzpsNGKKE6QvlXE
	Iw3G9a4eLu4NA+WGDC6BPp4wC5yjrwyz5iWWbai3hmQ4h/VaP78TfHE+pZSVttMzrTSzbFe0eGkTq
	ZJBnXFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02zM-009tRs-Gp; Tue, 29 Nov 2022 15:57:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02yx-009tEh-Je
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 15:57:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so14731475wma.1
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 07:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wK0CnlZOX9M/iM8SewTczZ0sLEDRfVMf5U5O9npWUVY=;
        b=JZYlyDFZIHL8IN5vKdYIEr5dUASpUp0vEDyjxnBcVUE74KxJZvLGc1l+HVVa4wxmQc
         9RV2HD4J/oDUTFKz85hFMmcASWjWIc4NncKVFMQc3hR6E6fja7s50VJDzGAs3wiR45Pa
         VYacBV16Jar0NvqE0Oji7OGdx8w6cvkQNLPnrpGiA9cTRLynX+C62BYesPjRzAqd3W+f
         xzhA/6YGBZ18DYTMnkGFsIDBEOpUO+ZMib3SdBkjB6pNDyogEMjT7bJ+ylbAtikRWr+1
         N92X3Z1AVQv11/tUukZ/8PmpZ4JP9jRn3A3Hs787C3texHFYFsPSbW9k8npA8RVzpQWs
         d1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wK0CnlZOX9M/iM8SewTczZ0sLEDRfVMf5U5O9npWUVY=;
        b=t5VcvixGaMQmhNQu0kRaeEi9sD5mHslbPCGv5AIte9hNLu+4YnjrY2l5w4Bk7Nu/U1
         60FjmnEbX3XaFQUFGHnC2dLp/fYLCWpHJMv6bh8j1vLgMnvZao29ZoNZlkkP+A6m+KEX
         BWpiM786PSy9rAGhUHXo+nkTMm4UwOIr6CkFdE7ymI4AywknQlJHud6z79mDRyl6VdPd
         XpHILExAw3UNdArQN+3g6gjz0Khp6NuuYyRDU0W7kGDtBqExkx55IgsCiSqmSWAH1+Eh
         HlDjhBOR4eZMpYNy1C6T5Fsf1fP/W6Xu9/oqWSsPBYI20LJ97Mo9iFkFvmLj/iO3wzWs
         R9sQ==
X-Gm-Message-State: ANoB5pkBSsuI6qmuh3U05rU07eWyV7UQXdUvmH5Y1WWQdyvukKjADtN0
	ldOseyEPdHJKbPc8fXZY0DjYvQ==
X-Google-Smtp-Source: AA0mqf6PuzacnzmyesbE6G1qQRnWsrIiu2CVIsNSFXBXVf21Oc/ouJD0AhoC2g+HlvFkvpsbuMRu5w==
X-Received: by 2002:a05:600c:92a:b0:3cf:69d4:72ee with SMTP id m42-20020a05600c092a00b003cf69d472eemr28401740wmp.122.1669737431630;
        Tue, 29 Nov 2022 07:57:11 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f2-20020a7bc8c2000000b003cfb7c02542sm2601550wml.11.2022.11.29.07.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 07:57:11 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 29 Nov 2022 16:57:05 +0100
Subject: [PATCH v7 6/8] arm64: dts: mt8173: change node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v7-6-477e60126749@baylibre.com>
References: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Fabien Parent <fabien.parent@linaro.org>, Tianping Fang <tianping.fang@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-mediatek@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-rtc@vger.kernel.org, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Fabien Parent <fparent@baylibre.com>, linux-leds@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=sciAdvxNeIHiHj/noxHzFC381BQRCLfnWiRAfVX/Ztg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjhivPlrcjP7DysJg2iocsnLcP01P6bHyqXN9tUGhS
 kubYFiyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY4YrzwAKCRArRkmdfjHURevgEA
 DA8oW2+nxfgPT9x8H9Bn4iUpI7bpkr6XZ99iu7hXpzTRIlGEg8U2XCyw+BrT4hDzCodYnUCtWnu846
 QEPZCcrbCbZOD3rTa+3zC/DdkEWWkYrRDiKoD1FEyVBJ19v72revWuJ5oJIkNRRacwK3FY04vxHna8
 a9NFhD0UaMvj49AYSoFAvu4Z/JBtmqXHhfTsXTzOAcpoS45vt1CiTL6Z+SelAsEX9+gMMb8OZNr3em
 UlmJmaAsVn9yEFqxz1IoR8gBJKrEMZXWYYOXtbPASyezGBx/VBXQZU3aTOxH7xRyTxfWHbAFjmKjCX
 jkN6QGK/Zb9sml8JPQQrW5ttJS9dzl7afKbWM2Tr0crppiHlJXjIlpvVFkdeTM8G4owMRkk0PZZhtI
 EpHPPeJeIuBkJpYyIE2pzAbGXK5v6DjvBJviOoIl5loMeKQM3uy6XrtxFbiPOFF9XVI+SfQIkIkSuk
 lFUbVksNCfloxBbqA6XGeHmlTSmG72+tWeN1yy0M7evha9O9rHQ2uW6zXWqE85kd2OJiBiwJr/jGds
 7JUKyqg2XxFbRFXqsFkXGBMGLDRmeQaR4b8A1kyTA36UDHhpppjz1r7H+hKVVCjTa9ixlykag/cSGR
 nlfwFnv+PmQEmaqe5uNy83u0YLnSHr1HeBji++LkIRKFDu6X6A9IYggPHpIQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_075715_883398_C4E6DEC9 
X-CRM114-Status: GOOD (  12.20  )
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

- Change the node name from "mt6397" to "pmic" to be consistent
with the generic names recommendation.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index e21feb85d822..a8f5c48e1782 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -913,7 +913,7 @@ &pwm0 {
 };
 
 &pwrap {
-	pmic: mt6397 {
+	pmic: pmic {
 		compatible = "mediatek,mt6397";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 0b5f154007be..755df5694234 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -300,7 +300,7 @@ &pwrap {
 	/* Only MT8173 E1 needs USB power domain */
 	power-domains = <&spm MT8173_POWER_DOMAIN_USB>;
 
-	pmic: mt6397 {
+	pmic: pmic {
 		compatible = "mediatek,mt6397";
 		interrupt-parent = <&pio>;
 		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;

-- 
b4 0.10.1

