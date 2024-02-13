Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F298C48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 05:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYXdB3+zSKU+ziwTscLVWPyxXG/8J4FJdNu2+Hvv5wQ=; b=Q5A6ahV9LQjYdt
	tJ4d3QVGl7z39nMVgaW1sVGg0KdMsQM/7TAFJfLLnEGKtSk27KtawZsWaFeLMy1kl4qYfB0Vy5POE
	bRzc6voBFFTvORO/CWfVwEcPHedaMNeJmfzW5CjBukCQx2PAztPprRpsDa8n0wpx79nWupkK8955U
	XklG9AF7LKZnpLm8uOc9PSmNl12OY1CUVPAllBzBwOzgSOs3DToFVZzPQ+GkW9qIwI3a5i/AxG0q5
	t9RQEvdkOv+E22HLAUMNbG5+c+GHR+EVdTkbrTPP81lzakeiGlAQarfZWYZMez0VuemaQvnzA9jxe
	bYdMp7eMi5npj/ugj4Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZlUm-000000080i6-0jxC;
	Tue, 13 Feb 2024 05:38:16 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZlUc-000000080eI-3Ogh;
	Tue, 13 Feb 2024 05:38:08 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a3566c0309fso476278666b.1;
        Mon, 12 Feb 2024 21:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707802685; x=1708407485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYXdB3+zSKU+ziwTscLVWPyxXG/8J4FJdNu2+Hvv5wQ=;
        b=mnPZ8v507VPWX/8d/SnaBzKArEMiPvDmXCoyDFuJ2I+qBjvbntbPU+eJ9E2jNIW8QD
         /yInY0Yk+96Xb+zEu4ZDlEjSgAQWXYFViZdBdnNOep6g1nNiJAnSQopEaq3yBOfCM2+p
         h07xfW+VrkjSBJsI1MQFmerdahdPXXy5/etEtDXise32P3LdZ1qtNii2USXP/YG5uOY1
         eQ3sL4NhnZx/9VgXVa0wqx3yRnKv1oVpvw+I1qctB0qyVwOZKWYnxXwOBprjF7TXa5eI
         ruGlacijLFS9CqWA6bFycaB+97rIjcwEAFKwFN9I4tnIemSZ9fcBwMKOG6SXngoivmvz
         NqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707802685; x=1708407485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYXdB3+zSKU+ziwTscLVWPyxXG/8J4FJdNu2+Hvv5wQ=;
        b=tNHIBEEhDF44In9XPSrJtN22EyXXPR9VLgNW7zjETybxXwvZdogYUzwH5nDlEZap7A
         cWPtjamJg+xodJtmR/Cz9/ydngk1DOG773ub6WHcDGPBp9ZuyzW3fgpjHXK3PmCtojeV
         M9+HqmTx4RRHqQHzXPcky2bEZGX0fSbywv/d5GPlkvF/1DZr5GgRoKgerL/vbL2+CHC3
         omarlezuOzQ0xpYFpI5ssox2DvfUTVXTgC0ESMsgHFneNMn7LUBlY+v3kHPpxWKkxYvF
         bYKO+t6FwZSXlQjYS+VjoZTQU0ZrFj9CsBFXLDZFny3GCHq6HqurolKG6GmkqSGVZgVj
         R6FQ==
X-Gm-Message-State: AOJu0YxfviO283p2ATil16vwj5zxRVlqbDrHCpSSd6ixHvY9HVnK8XxK
	W02bzpaTlxX25yH4rlZ/JtspTmeuMY6yQv47RNEIczhun1BlZEqA
X-Google-Smtp-Source: AGHT+IH1RI7+JKCAoucQct5YWa3nTZGYqSTFR3J5hmCbgkfu3eIRUhtFS0zPvYnp2GIoXhZ46YJTvw==
X-Received: by 2002:a17:906:370e:b0:a38:215c:89b with SMTP id d14-20020a170906370e00b00a38215c089bmr6335504ejc.73.1707802685274;
        Mon, 12 Feb 2024 21:38:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzK/M5LmqBMpnrz+fUmQDlVL/XtC8+joam+QwRswGCuUyU/QeYQCN4iLP1hFPuUSg6PROoJPLn3bJTpX3G8I9WqT6JK0YduVZTZnfAVw6sJ26y5el3AE1I/bQXS+sT54F6pstFw7Z9PWC/jZHRRfsT7NF/3R/xCClupGPJm1R8qebInSfQTnuFRsjxyESbyWuvqRk2g9afuq3AdbDCy+8nV7uKOO595E+yrGpMvEHEU2nMNT/K7sAZA3BzEvx5h2nfTlcELq+2J/nhNMDlItRjinHMhzFDYncAqUzlN0e4PuEW7w2tY5kPvekWofxTxZysfu66X9m0ZQ/aRn9s1nuV6zHm8nb3GvlWOvS5Zm0fxZ85Atcx5Jj0c5Fg+q12QdK3DT2ZO5DWcx/3wyLMdUUesBRKwFWO/IAdJki/QqSINXqmMUo6lgCJvj8RnDvgvTO6jqoXLZzvKHx4YLP+7B/5tP8MMvHL+/zqtFEegDlrIKJqFixrRaX92wB5WTQ2eKCF+vuzOtfyyVwxjGY2UGY=
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a3d125b9c0asm16659ejc.81.2024.02.12.21.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 21:38:04 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 3/3] arm64: dts: mediatek: mt7986: drop invalid thermal block clock
Date: Tue, 13 Feb 2024 06:37:39 +0100
Message-Id: <20240213053739.14387-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240213053739.14387-1-zajec5@gmail.com>
References: <20240213053739.14387-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_213806_880519_818CC04C 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

Thermal block uses only two clocks. Its binding doesn't document or
allow "adc_32k". Also Linux driver doesn't support it.

It has been additionally verified by Angelo by his detailed research on
MT7981 / MT7986 clocks (thanks!).

This fixes:
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: thermal@1100c800: clocks: [[4, 27], [4, 44], [4, 45]] is too long
        from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: thermal@1100c800: clock-names: ['therm', 'auxadc', 'adc_32k'] is too long
        from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#

Fixes: 0a9615d58d04 ("arm64: dts: mt7986: add thermal and efuse")
Cc: Daniel Golle <daniel@makrotopia.org>
Link: https://lore.kernel.org/linux-devicetree/17d143aa-576e-4d67-a0ea-b79f3518b81c@collabora.com/
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index f3a2a89fada4..559990dcd1d1 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -332,9 +332,8 @@ thermal: thermal@1100c800 {
 			reg = <0 0x1100c800 0 0x800>;
 			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&infracfg CLK_INFRA_THERM_CK>,
-				 <&infracfg CLK_INFRA_ADC_26M_CK>,
-				 <&infracfg CLK_INFRA_ADC_FRC_CK>;
-			clock-names = "therm", "auxadc", "adc_32k";
+				 <&infracfg CLK_INFRA_ADC_26M_CK>;
+			clock-names = "therm", "auxadc";
 			nvmem-cells = <&thermal_calibration>;
 			nvmem-cell-names = "calibration-data";
 			#thermal-sensor-cells = <1>;
-- 
2.35.3


