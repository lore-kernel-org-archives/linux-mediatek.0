Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5A1C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 17:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=; b=1He7YH3RitOm2JG1aOC1RZN16L
	9A40bb742XkR56RP8ptNNRk3nCLzI9Yzye5x4BBRMd6o5RFxVmHmz+DRq2xnXpYocSG2XSx+drDm5
	mqaFuqhm/Epj6CRgOfsErxeVCjT6Io7R2wNTOaTIbKxhzztU2nsXZqkkGnshoPjIiVtB3guJnMkMl
	+WIvoUMxFFspwiswI6VaFu+DTT43jwmQ+G+GJMELd6SidXU424NIHHfTvqPPAfh0BzCpTol6oLG9u
	9KrckBfFXmHxHqH8ebQ1wCdK361VhnFTK+DIvy6S9QIzjG+kA8MVXO8ghc4V+nZXJvF9vXtbOsf1F
	9G0W4oww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PLL-0000000DSg6-2lxa;
	Fri, 26 Apr 2024 17:26:39 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PHu-0000000DQna-27K3
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Apr 2024 17:23:10 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-57255e89facso1099246a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Apr 2024 10:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152183; x=1714756983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
        b=kqBWV14AUB2TC1EZz9ihBtXR15hBNbUzcAYYKkGZVMygCwXS/Rlecf3sLBO38Ezx4X
         iUMpntIBy6ObY1kPtuSyKTN8tSWO/lUGfQvDj4hE/2sax4eMAPodpC/9zf+BKBzzByQd
         AGqWPtyg+OVoe7kPYUwG1SRmW9SkmFh8eqnAoxsI6SS8shujSZYo2y7xDPllalsV4+dN
         LymzFUWRx9vMawVIOdrnrccfUskzNgX9duTRbDHlQRb8loKTs7eQ/I6XUMQtLSLr7wtI
         2HCGUOnJqlkTJ8043vulT2i18lRDbQyBadj7RXjStgNib1zngO8P+J419dj/Bqc3eugA
         Rg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714152183; x=1714756983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
        b=a2mEpafAa56CrXqQRziUO7dNX2fyuEkWc6dDu/b9Zh6TGUrIbhJzfos7uPFgILvYtX
         qkLKQ5J0cWRq4oArmWvL0nDEq3rX3PmNU5svwetOoe21CP87FS+oFiwAJUlSdavaL03s
         RmXCn5+kTxloG4yRp46BqKoeYwWIabMEuNPGF5euyhAoOzpEUS9u1qvUqxk5voN58Osh
         uqTAemxWXC9kWBcxRmVSiRjzdxHsI7zETYeRqqGUIY6rZwgGpY/QzRtNJ1r5eUZiTXqX
         SVwCzpXeRv7/6N6E6BRH8eNDBn7fgBlI52s5u7ndLeygPIofAJyMXmoZt4vtoFpV0N7B
         OxbA==
X-Forwarded-Encrypted: i=1; AJvYcCUyPsmbSemlqz/MbEMmAUjW/71cLkNB6B+n93aj7IlB9Iv5Jb/KOQcPfZUW0UBTZCmZl+JiBOG3LtRryxmiceORWJ3Tzaqs2qvwXr4wNlK9Joyu
X-Gm-Message-State: AOJu0Yy/krKnSEjMZuFaiYzXSSHijz0p7pnGy2Y0OSdSOmsN+sdUzlvd
	jmWzwD44bTYxAXDzFPkdOK2Ran1Jq2Mr8Rvgum43PPXlG00juoHx5udL9h1j1yY=
X-Google-Smtp-Source: AGHT+IHHf2XIxcORUWzjtLX1VaD207j1YSFJervSBcjnJPk8N+OEALIdFKf7g6Y8lzNaper92rOirg==
X-Received: by 2002:a17:906:4a83:b0:a55:5e89:a158 with SMTP id x3-20020a1709064a8300b00a555e89a158mr109798eju.68.1714152183470;
        Fri, 26 Apr 2024 10:23:03 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 10:23:03 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:44 +0200
Subject: [PATCH v4 15/16] arm64: dts: mediatek: add afe support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v4-15-082b22186d4c@baylibre.com>
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
In-Reply-To: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=t0tf5ggyvEv3KEhg9dzpup8fwcOHLyJsYbfkqMonRjM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaFSju2HTEJJUlWwHPPq7cLwG3TIXZFwziZS9e
 4Ndyr3yJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURepjD/
 97NUzCvItOp1IP3I06MoHhHvjQUV16QIZ462zo18PKYz6IOSU0Q53W0KrB4Awgr5T3o5wwwQi1w6cZ
 OUV0dR6H58erDJR16xRZk+YWtdSs67XXC72rmHb41qYDwoyHXemShR8E279guAnE7Tbx4ZPo8ACYMc
 3JmtdNg+M+d9Cxjokjl9k3zJ//9MnyNIVzrxwJO12N+Yo6mKuUfDjBVoEPhEi/yeOXcgea8dNL7KHQ
 ZDZhqi7u/iK5mawCxqIVbf72ly2fB7Dt1heFWlYc3qP7IJuTjU6D0vrr1LLOc5SuUV8Rqga7gVXAIo
 mYO9qXOd5JFk2I7y+F2LvL6xYqTgKCjWAc30pH1eBO0Nqab7RjEUh4EJBdnIoa1rbSrt5uF/5S+uC+
 Cwn3Bb1jofzgvU3ty+c7gNN5GTf+j+CQF99el4eZk2IUs9wP+ackEu25Ox/4I+CijWimgylznvh+yz
 A01xh3kn9MI03Y9HebFSM2lHe7iVkz+pfZo/jxAMNifMZsc2OuFTM0//JCutoMpbtfYUSfK59b8e8x
 FvWKt2Q+1DWnz/jz9jVBLrbzrJVhwgF7u4t9TKhZtzqhcDohsrXMw+mkEAMTrSAB4RHtZu8CsH0MR9
 KN+57ulLLxu4t92OP7ZWl3tq8A2QrY96atz2Olvugu76QClJPWJ2XX28O/pA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_102306_837810_A83CC79F 
X-CRM114-Status: GOOD (  11.12  )
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

Add audio front end support of MT8365 SoC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 43 ++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..0051d5613bcb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -2,9 +2,11 @@
 /*
  * (C) 2018 MediaTek Inc.
  * Copyright (C) 2022 BayLibre SAS
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
+
 #include <dt-bindings/clock/mediatek,mt8365-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -813,6 +815,43 @@ apu: syscon@19020000 {
 			reg = <0 0x19020000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		afe: audio-controller@11220000 {
+			compatible = "mediatek,mt8365-afe-pcm";
+			reg = <0 0x11220000 0 0x1000>;
+			#sound-dai-cells = <0>;
+			clocks = <&clk26m>,
+				 <&topckgen CLK_TOP_AUDIO_SEL>,
+				 <&topckgen CLK_TOP_AUD_I2S0_M>,
+				 <&topckgen CLK_TOP_AUD_I2S1_M>,
+				 <&topckgen CLK_TOP_AUD_I2S2_M>,
+				 <&topckgen CLK_TOP_AUD_I2S3_M>,
+				 <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
+				 <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
+				 <&topckgen CLK_TOP_AUD_1_SEL>,
+				 <&topckgen CLK_TOP_AUD_2_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S0_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S1_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S2_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S3_SEL>;
+			clock-names = "top_clk26m_clk",
+				      "top_audio_sel",
+				      "audio_i2s0_m",
+				      "audio_i2s1_m",
+				      "audio_i2s2_m",
+				      "audio_i2s3_m",
+				      "engen1",
+				      "engen2",
+				      "aud1",
+				      "aud2",
+				      "i2s0_m_sel",
+				      "i2s1_m_sel",
+				      "i2s2_m_sel",
+				      "i2s3_m_sel";
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.25.1


