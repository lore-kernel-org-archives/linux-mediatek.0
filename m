Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0BCEB64DD
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jul 2023 18:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k0/D6Od9BJ8+b84piDb5tg8kbjMdXggz6hvE4EQ9a9w=; b=WJarVJKTAomSgYgfRTLMxzQsCL
	5ldlEW3razpZ/bAoxLjr/Xntmq6N0v9BZn8wv8H/gsxPGZTTYIxS1cP1Tf5QjSQarunLF+KcAFwCw
	tQVQLgAKvjlEX1JGBDKACmY3VfnNMq9VN8zjpyFeqb4me+N9VexetYq2h46MnU12JX6aE13/ODZ82
	zeGWpllQHVzHjKySXMPBiF/IhDXej67S59hFHZvd3UNQLWGZhyvcaTOTGB4Vj4nU49DEet2BOP+Nl
	8BofI4y7NAwgTu+la4dkRhOqF4urkGMEZc4hrPw8/kQmthtW04O0sY00Y3v+mP6zMYZnuq5mU1/UP
	1YJ5vN1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2AY-008Nuu-1g;
	Sun, 02 Jul 2023 18:51:34 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2AW-008Nsl-24
	for linux-mediatek@lists.infradead.org;
	Sun, 02 Jul 2023 18:51:33 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-992f15c36fcso289200266b.3
        for <linux-mediatek@lists.infradead.org>; Sun, 02 Jul 2023 11:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688323891; x=1690915891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k0/D6Od9BJ8+b84piDb5tg8kbjMdXggz6hvE4EQ9a9w=;
        b=ew8rZyDpE2YyJb+og5uu4u8aMR09sM5walTcl5XWWAdQ3o/Eb8mkU9DlqpyOnXSR3J
         acyiSJPNrNfIr/rXfUM2kPA1lAAZAvs2zxuiN/w/wtGhAWv56Diujr3CLpi/TnqbQpo5
         xFSLQh+5tFzbgR0MQa96de6NpUgeXJZkxcxRxv8ETc/yUBE5pQbN64Z15YjaGVc1F8a8
         qzu5cK4KwMTEb+w+0MtBRtQ/8KYnMyM8z8XNDlXaA1hECvStSv/wqD/XmzMXlFCMaCJs
         PUIDQQtsY8WEWzffkdMQzwserQlC6o8HiIZ/NxEC2M4zCVe8iuqLTvgc7zZBqzuuvc/d
         osBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688323891; x=1690915891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0/D6Od9BJ8+b84piDb5tg8kbjMdXggz6hvE4EQ9a9w=;
        b=hyLLUfdOvthpqSlHwvP1kzNYVbBmUrVsRzIfYC0CIgxqt4RvOT/2J/kLCoyRh4GVF7
         7rmGUnxipNkf6KIAvlhH53v5ni4Op3fhJE9FN9AjF0+7HfQAe4Vbm7I6o1AbdePbEBz5
         fmRCLCm+GDq8ErEFG+Nki7ZGYPKtE7Od5NIcCXJyCRbcp9WrG3ZB7GmK72Nk7wrAfG3i
         zhmmkQRLgn1aPQ4ZIublZFaTs6RkUkLYbx7UIyfPEkx1qPtgB+nCTnh+//CyqqXIEQbn
         5ZLGA3g4322Xvy/G4rt0FNNHb8sn6+XFtj12qLgXeK+YwIM3MXy+jLRNQz/PTnAG0Qe2
         msJQ==
X-Gm-Message-State: AC+VfDyTuVtqA8UdyYsKiVB4LTsBJaZ3c4sxjaAGL+yIlIe+jYmMIYlS
	CNgBm1L5I+QahVOZkmmM+L2Czg==
X-Google-Smtp-Source: APBJJlGeqpgbF2rHnrt+xL1LlnmvAn+UVpaAyDRwPj8+9QmJF7hUYtAi7npeyLqy6MqPn1ZW+091lw==
X-Received: by 2002:a17:906:8314:b0:978:ab6b:afd4 with SMTP id j20-20020a170906831400b00978ab6bafd4mr5473018ejx.43.1688323890764;
        Sun, 02 Jul 2023 11:51:30 -0700 (PDT)
Received: from krzk-bin.. ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id gy18-20020a170906f25200b0099297782aa9sm5343084ejb.49.2023.07.02.11.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 11:51:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: mediatek: minor whitespace cleanup around '='
Date: Sun,  2 Jul 2023 20:51:27 +0200
Message-Id: <20230702185128.44052-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_115132_679437_18C142DF 
X-CRM114-Status: GOOD (  11.27  )
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

The DTS code coding style expects exactly one space before and after '='
sign.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 6 +++---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 6 +++---
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts             | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index e4605d23fdc8..07484c219364 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -385,9 +385,9 @@ mux {
 	i2s1_pins: i2s1-pins {
 		mux {
 			function = "i2s";
-			groups =  "i2s_out_mclk_bclk_ws",
-				  "i2s1_in_data",
-				  "i2s1_out_data";
+			groups = "i2s_out_mclk_bclk_ws",
+				 "i2s1_in_data",
+				 "i2s1_out_data";
 		};
 
 		conf {
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index dad8e683aac5..a885a3fbe456 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -311,9 +311,9 @@ mux {
 	i2s1_pins: i2s1-pins {
 		mux {
 			function = "i2s";
-			groups =  "i2s_out_mclk_bclk_ws",
-				  "i2s1_in_data",
-				  "i2s1_out_data";
+			groups = "i2s_out_mclk_bclk_ws",
+				 "i2s1_in_data",
+				 "i2s1_out_data";
 		};
 
 		conf {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index b2485ddfd33b..937120f3ff59 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -79,7 +79,7 @@ optee_reserved: optee@43200000 {
 };
 
 &eth {
-	phy-mode ="rgmii-id";
+	phy-mode = "rgmii-id";
 	phy-handle = <&ethernet_phy0>;
 	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
 	snps,reset-delays-us = <0 10000 80000>;
-- 
2.34.1


