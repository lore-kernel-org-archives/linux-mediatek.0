Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F09C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 07:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=; b=EefMhpUiOCtV4/7Wns09lk81c2
	MsRDKyn/nVc9gC4+stTVLZpch66UNPAs3JPRz9rC0qWtX/W6fwWjtmxDjrREAnEggXoqpa/f1UObo
	SGyZMpw0LqSFh6u1LaJjoj/um0N5JD3nYrWIs96P+BQC2ut/FsKQaLHzuqOveFNEdLNy+gFDo+vVr
	50sb/uuNzMTkchuDIYXWG7zFwqVqhukXi/4FhGH2ahzDglIPl6W4lr93cS9bw55UdZzWAFodR5Bl6
	EtDsfJFToYJR79eofDyk5YDZQTJmNeP6eeUvWf4FzSZT5iP+eKHx2Ag+rZuhfTHjoKVInwlpBuRYF
	QVBq0R8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1O6-00000001n4t-1QmX;
	Fri, 14 Jun 2024 07:30:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1MO-00000001m8Y-1eZ6
	for linux-mediatek@bombadil.infradead.org;
	Fri, 14 Jun 2024 07:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=; b=PJS3l6SOQXRHdmgUEnQ7B7L1gf
	ZxgJP9MAuGTowf9sU9jXXlvTQBm+WOiW5AVLwckVA/5ClNx9Pe7EcVXWa+pYFV0BNEdsrj8WLk49J
	BxHDu8r3Y10enwzg7YOVCzbKwE6asioEYk4puQwNsoa/uC55/K0+/1KLVnoxXrA58461czbZrkF1j
	VLVRtTuaP0MQvfrUcvjndEuZwrspl3aChJwZau/V94JdBXguiExcQgG49zYjr6ecK7h81YbqrOkV0
	MrNJdVB2rRZCHufXzg1cD3QMYtRxH66xanJ2meW1B7RwgxuZ7DmasCfzK288NTpa3zeeBvyagi3e8
	R0i+2HgQ==;
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1MJ-0000000Gj8P-2jmN
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 07:28:31 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso1993845e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 00:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350104; x=1718954904; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
        b=K2pzA4+Xh2BPTNo3AFdu2rPFoci5GDFjY47HjjgipxGSvv8kJ1RfsM2wU0i6bMCw0P
         KqGngBadUHtn6eUWFA6kNZFqp4lz0dA2G4lukwKZw5BO4ICmGbl9ZcAIBUZdf9kreYGs
         76sJqc9ttd0jPhRucQFh4XY/QSrIBwm0kBrZMjrMv0h68eaMAu7wUOPPjwxvKY1kAq1J
         Os6xY4vJ4p1bikDTzHA21zhJ9w6oxZLxGablzuFHQHxV9oYcr1VH0J1wzb/feOEMmROg
         5m30bDKU7jjKdyYch78iZYcPDdneLg8nldSei5fb6JOzyDgoqU4mjLrHr5za1xuZq82O
         jX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350104; x=1718954904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
        b=SeksW0pd6Hg5w1Y8z3zBeR4Xr8bW4EB9VuJ+kef3mrjQ7Tq/jnT94LImF2t69LLgdu
         ivb+M5BiaFUduFXjt1oa4DeieX+BgPHOyG7mQYX9nzVU1QIZC737VGeHhTJMWeOLtAnt
         xYZpGHrKLjY+o9tqOkuSfwPpXLHP1X9ag8xmCdQ4L7ml+ZsT+7i38v+h0s8zcj5Oz/FX
         YJ+uIzHzFcEsOAOdexeNFWJzTvWes48sJaFG+Tz5pZlt2BQ5NkmwRxnrMW4ewW+GzZ6t
         kVUvws+9WMXttM1QZ2IvpipB2v8yFz+iG0/vqlUPnvuvMhaJDXhBurtfCg656Lfzygot
         TsvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf5C9dlvhqQnczggdsqYGRnPx3kNK0D8TyDDqe6KfD8Bu1jpqOekf5fAvsUKBGjd5qic2OF8R6WpUAM85sVM9ma/Ny8j1FGBvS+HrtwMXYMlZ6
X-Gm-Message-State: AOJu0YyuSypCNRpOxJ3yWMEoqlRQDcLCFzEUoPdgM7a0gHVCJejHsOVW
	RPFtov5JX55LhKA1UK/+7U/GaIozJWkX0+DvbVPf+2L73YlVbefkEcRoYl6cClY=
X-Google-Smtp-Source: AGHT+IGnyuTyl004zNEknsuOkKnFWyFDczGzzd63f7Ew8B3WBH5+1B0Z8HM3W/isRBTFc2QhVm2A2A==
X-Received: by 2002:ac2:5613:0:b0:52b:c0af:6876 with SMTP id 2adb3069b0e04-52ca6e987c7mr985960e87.60.1718350104243;
        Fri, 14 Jun 2024 00:28:24 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:23 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:58 +0200
Subject: [PATCH RESEND v5 15/16] arm64: dts: mediatek: add afe support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v5-15-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D/A8g4JQKGf/bpZClCZkdFBg2gy1TwJe3EHB0N
 zfIyizqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/wAKCRArRkmdfjHURZMZD/
 0U4U3mFaqelf8+oXtjqp6va1E/hhZpK7ad8wAzeSFAimNE5m6rjbrFIu7WQxmMtYUVuFDL6tC5lkfn
 hfHWunT2Pm55GneefMiXpOuK5Zv+9UZfUrkfxXq2nav0GXUpR5J8cI4WM0p4nG/SWpSLXHEOicKOh6
 QCCocL43vKiNyk42G4exPFaShPNfylM8iMhD/c6iH93CcLR3eLYVtnV+UiVKWpPtoIxrpkUxyEpOPm
 Lfa0xZFWClVCEqz+9fH3rIQBGLnwk1qqtd3gYlnk9trSO/bZ5vtluK05KEFkynYi0/zU031UkDZkhI
 K9nGooP7It3JfUaSCCd2V8igTMoHyW4h0QvDYMcWrPu4/7xJoZh3lCtP4vO2sZrbv/mPHIwIeXC2Tv
 Lhha9ERXxtTlkNgPvARVW3MV5JEwYkrqm/J4yuWeqp9mtdUcr51CdbPkxXiGRRRBsksaz9ps0oclPk
 pY8i6w1QN2Q/a8wJntO6vDsRpd2I5evI+GIzzFc5p1dJmNK8hUCublsqjnDt/Gm7kZphssf1MDW4ej
 LtGVuS2jPtGoZPdM6rS0UTZRdqvV7SKdAuf/WDh9uRQ6Gmym3KDz09L3XzXSssFNsB1kPW9q/DnYWf
 Aeln75CpqX3eUtieL8n1LurXJjbM8MNkX6h1qMEA0lEw8JtRQUF4kZSwTVVQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_082827_707190_B69B331D 
X-CRM114-Status: GOOD (  11.03  )
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


