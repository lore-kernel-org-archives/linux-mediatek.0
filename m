Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB253E71092
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABe5lag05JGrRRfK6Q7TQU2Nmk4xnwbIxqigvQsoK2A=; b=GgyeZZdD5Ccf607jJHFgc0Wi3z
	tBWew+Q5hXgUiQ9sT1z/16OJdw5vNc6nOdYsj9ZNbN3Uz1BNzPmPHfZrONQv2bW1Ym8fB1tvQguUW
	GOUcU3A9v10Q4mgIYV6ABpXMGPMS4FKbjDJrj01rOiBRGkwByukgpS5ex6FSX/JejYwvvorZzvlpw
	J0pGIFZSsimAM3YeWCmlAViMBD/rYgZ9rHNn6PZx08/fK/nb79VY7kZj9NPwLG58ZyS31FXv0o2A2
	UMsBWnVUrlpvKgi+XAo1xtcAQcFwdN56Nk/6gDi4UMu0MyGGVdtpicmp5SWijHw79A816KEBHhc2+
	tSxg2/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjLsW-006RLn-1v;
	Thu, 21 Sep 2023 15:46:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKjj-006Hug-0e
	for linux-mediatek@bombadil.infradead.org;
	Thu, 21 Sep 2023 14:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ABe5lag05JGrRRfK6Q7TQU2Nmk4xnwbIxqigvQsoK2A=; b=T8we0orv7/amfoIF13Cg2NxMrF
	ZSgvZx18iEIZuyBARHLSD1IkwYbP2/5nCPb3yJ78hiKo1d9Q9mKcgWZ3ZtHeN37ACBPoge5+Fa5w2
	TMvmSRqM+e32LJzespeCC+b95dbzYcdfxd/LP+saUkUFooVdYFbR2BtkxgKP07lXTXmUp2nvwnev1
	SedkRH2janbo2lm5rWfkzBxtoZPa+xhmMe82KKMcobP5om7o967sEamZ5fI9YJbM8zlxWPWnMBFBa
	3DVhjF/MVi+WAUVKo8glcSrWdEgtHGcBMXYIs4YkfWP4IZT0xTceQP7q1q4N2wh9QWfhd5k5ETshC
	zg5cPcFw==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKje-00FRo1-1M
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 14:32:58 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99de884ad25so127034566b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Sep 2023 07:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306773; x=1695911573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABe5lag05JGrRRfK6Q7TQU2Nmk4xnwbIxqigvQsoK2A=;
        b=vdy2JnQX8EivC2yRCCRWLsWGFNqUSA6xbY1cNAU2f/GY9NP2bOiogz4qZjlZJ95IwC
         QI2Djb7E5TU08x2BLPBdZnby9fxT/LK06KZM4oS3DIvLGgwbDbWWmXhS8Uc5vIVKw2bL
         2OvMZRxpA5SBdJTasA51cZuXAAYVZQ/xbKbakkFQz0DN4puf5NmYgOuxnDrhuuwv+ZFV
         4nZWT74tFtQh1mmpiGNH/RDSOJ6489G4EtQGjoga1XVRQ3974qgZjhLe/RTD0pZ0XGfY
         JfxXa3PsQkps266Bea+EThKIkMFrt7Be/aptzvvwjG2O6eDkJIeNNDn/u4h8Pe+G4Cd8
         pohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306773; x=1695911573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABe5lag05JGrRRfK6Q7TQU2Nmk4xnwbIxqigvQsoK2A=;
        b=U0OxqmtKt6CKk6U82fNr9ZerhRo63TzgFYc8iXIh2f8zsUsh/V98ZUBPpPtSkrANQZ
         17+nwSLxBMKJyQDRRlp6aYGM2ncQFfyhQVThmYbivRFrehOhldHHpsHUMtxR2hNq2592
         P6BtXZpyMbTPssL1t8mNP6v+Ct8lpaXMA5mW8mXofwwwm8jEHF8j91EnvKzZb/TeQgxs
         95gnDVkt7dtDYdKm/xi/2ojd1/zsDE4PyYHqotmx8gWcWOJJlWAXlQUkMZp9Jj2RVjnk
         O1KMo1pAZIr+WbqPph2Cc3dFHG4jPY5KPFYrm0lgpgTlT5I+QamlXqu2BVlt5y6NN+c1
         ISyw==
X-Gm-Message-State: AOJu0YwvHpqwjzSKvU+eEWdG8gTVL9KRccIcLgSIKOyhGwxKwjvBeE5e
	apkxu4TaRcMe+9BkHpqPIT1SEg==
X-Google-Smtp-Source: AGHT+IGjoyNrvxCOmiRU6T/l2zYW9m8AVBU3LbyVShNlB4GekcqlT9pPNTweRl3dmSDWyO+BQzflag==
X-Received: by 2002:a17:906:20dd:b0:9ad:cb02:275f with SMTP id c29-20020a17090620dd00b009adcb02275fmr5307075ejc.34.1695306773342;
        Thu, 21 Sep 2023 07:32:53 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id lt12-20020a170906fa8c00b009a219ecbaf1sm1153327ejb.85.2023.09.21.07.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:32:52 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 21 Sep 2023 16:32:42 +0200
Subject: [PATCH v5 3/7] arm64: dts: mediatek: add apu support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v5-3-fa6f03680832@baylibre.com>
References: <20230207-iommu-support-v5-0-fa6f03680832@baylibre.com>
In-Reply-To: <20230207-iommu-support-v5-0-fa6f03680832@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=LNi5XTwnw6k3l6Q87CyTgWzrlVLjaNEqurZKDlk2veo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlDFQP6GqJjbLUqKqxj6xy8Bno/ClUvJYLrn3Hmj6Z
 WRq+RVyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZQxUDwAKCRArRkmdfjHURbzXEA
 CtoPjBUH3xYFYAKUMiNcdHOWrnTKIIVSJ1nCZqaEtp4uzw7YjrnDFm97+Xjuu2+We3fpcQh5rfUhYw
 sPyIKuzpBGukYrCyg1cntaJFnWj7zkuv5tm01rIhDSb9cvfIesD6Wgybc4c9xkvuufeAPSaCeamCUz
 6XKAk8oIdSwhXp2ZJEqjCfb8Jq1tq7XbtAU5EsNDm+YQdBRVmTESdE0p0z4fG12A1RSBoHDQkJ8ijo
 P2fbCbDjkeu6h0xg5dMIFwNbJH2JwCr4DraiG6jZ93u22kqyaC/ROO9iQKJgRR/0YB/pCHHP6cV7/V
 OZkxUkgLQaYd4dbZuxcw+30vhbMp3emKzdz79kYDtRtLJmDOhwD1R9BKAcO02Dbk4iw8XoePlfM4Hp
 qfMoX8zqKIVMWXXawqQUW74VBHelwGLmlFN4xEKBpB7G3q3fOr4zYGaVbddNoBC89lqFldbBxyAzwU
 qOQVRnIGbxtDEk3QP3Sl3fUZQR+naiUGD+2aUFpRP4K0yAOTqKgJQY2qtQPEs69zlj+RUH05ssfKC9
 Pza9sw4vljuxaR3KeKHzgsCsf/jmjP7vyPNPyEzOLyosR3g8gUvKKeiFzPQO6jPCpQrjt4ViZkv2II
 L23fuNQtT5JgfO60FwIvZvGiCWxWkrCQ5kc61MjwKwJmFbVD4HU4D8E6uLEQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_153256_029457_64044FB6 
X-CRM114-Status: UNSURE (   9.94  )
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

AI Processor Unit System (APUSYS) is a highly efficient computing unit
system which is most suitable for AI/CV algorithms. It includes one
programmable AI processor (Cadence VP6) for both AI and CV algorithms,
and an eDMA engine for data movement between external DRAM and VP6
internal memory.

For more detail, ask Mediatek for the MT8365 AIoT application processor
functional specification.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index f9cddce5bd9d..c3ad7cbc89ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -615,6 +615,12 @@ camsys: syscon@15000000 {
 			reg = <0 0x15000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		apu: syscon@19020000 {
+			compatible = "mediatek,mt8365-apu", "syscon";
+			reg = <0 0x19020000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.25.1


