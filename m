Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AADC5ACB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ger2Z8U1lRgsBXzdzavomjDiQueaaZiNkYBOoYjoWjo=; b=dDHzbxMdDhARka
	1PSxzB0e1RzS6OwDW4i6zmJLfKGPsdPQefZId3SIRv6UwEl0Z/TaniX98Lwc94CZP8I0sBOgAGzwX
	DbNIuaY7RGLrC69AM7KWzWBut21kv/N5UA1EtB6b3O9FcPK3n/bfIQr1jfqLoxmLH16SZeSEjjHym
	KdrITSnOkSyjehezj1EUTzj9TW6rXb/TaGvPwkU90AOR6AYX5HoAly1QGEYdPbqmr2DJIPbzVJl5e
	8tkpuAg5yCsHvGSAzv+U84kC8vYfqfgKQKoH1LwgrIpUr21BPDxSPqalEhnIU6njK6HnxjqZ4XIR7
	ZEH8ME7wdeDKP4RZEYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3cM9-003aTj-2g;
	Thu, 16 Nov 2023 13:24:29 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3cM6-003aST-1A;
	Thu, 16 Nov 2023 13:24:27 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5079f6efd64so1040931e87.2;
        Thu, 16 Nov 2023 05:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700141063; x=1700745863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ger2Z8U1lRgsBXzdzavomjDiQueaaZiNkYBOoYjoWjo=;
        b=HHlF1lgS4EJrzdcyLjehq1FcJYCVA/RStiGTBUwko05ZKzDP5da6P684CMllCBczhY
         TjU0sMOXpybxpxNicsWB4bdmEERjh/OpNupRoVhlAoHcd6gN2uWuhSKurQV32tQ7AxFP
         Voh9clR98U0xUGnm8KEbysNr68mDVZ/6+f6c9EQbbFch/PMjDuhZkJqtPy7C2xE+u65V
         xqP9Tpz94TzsnG+Pf1f5JrAZINk5/HQPYCk4rmmWskW2ygiUDrGEzsaxVfqqc9Log7ZD
         ao0gavaP1lIAXNZj0GI3E5xiK4mo2J/42PhUybesUK+TCSO6Y8bSQWc8R3ZygBS4mbn+
         ELBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700141063; x=1700745863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ger2Z8U1lRgsBXzdzavomjDiQueaaZiNkYBOoYjoWjo=;
        b=rQxAhiLunvVeFhlRrPSVdMBYqmMVtEdM+Ure7O7T6k4eIULv5MMC4ZlZ6n8EZTXJkV
         AELPJqXW6BVvXa9XSXsMgJwZvonFIJDOChHYTIi8ghhzmMasRpEhTZ6KCQ0znl3/3V/S
         E9Jg7unQJKEUx2Btp9rd4nQaBnIFNOBhXec/MGS0lCmbkM3Xy5XKpOEx/m0UK8soHjgC
         gLwOq6LXfGowht2w1iEbWSiLR+nK+RIyXPobI/c4EKh32vhvQKFq/s5iaiaaAxImXyRM
         P4+EBOP9NwjYYF3hz718MQXbw7okK3x8JWrS4xAHUk+GG3/Vh8PPpbzGVWft6LD4tKXZ
         7yDw==
X-Gm-Message-State: AOJu0Yzewq6VXqpT3sAqRcSf7qKDhYPqfhukebRdQ87q1t+M2vN4oKUP
	Nql3UD2JHuPZyXiZ9VYoCig=
X-Google-Smtp-Source: AGHT+IFA6hzF3g0U9a9QOrnN8WdEnwPxDn5j5xQTguRSg4pEzZAiAQEqfpdyw2xmT85DAaxpGe8P5Q==
X-Received: by 2002:a05:6512:3d90:b0:507:9a49:2d3d with SMTP id k16-20020a0565123d9000b005079a492d3dmr12924292lfv.31.1700141063217;
        Thu, 16 Nov 2023 05:24:23 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id w21-20020a170906d21500b009b65a834dd6sm8399647ejz.215.2023.11.16.05.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 05:24:22 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: mediatek: mt7986: drop crypto's unneeded/invalid clock name
Date: Thu, 16 Nov 2023 14:24:11 +0100
Message-Id: <20231116132411.7665-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_052426_401986_CF3056C4 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

According to the "inside-secure,safexcel-eip97" binding "clock-names" is
required only if there are two clocks specified. If present the first
name must by "core".

Name "infra_eip97_ck" is invalid and was probably just a typo. Drop it.

Fixes: ecc5287cfe53 ("arm64: dts: mt7986: add crypto related device nodes")
Cc: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 24eda00e320d..017168453ec5 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -234,7 +234,6 @@ crypto: crypto@10320000 {
 				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ring0", "ring1", "ring2", "ring3";
 			clocks = <&infracfg CLK_INFRA_EIP97_CK>;
-			clock-names = "infra_eip97_ck";
 			assigned-clocks = <&topckgen CLK_TOP_EIP_B_SEL>;
 			assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>;
 			status = "disabled";
-- 
2.35.3


