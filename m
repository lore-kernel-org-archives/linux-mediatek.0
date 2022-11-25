Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D64AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 15:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/qGjMKoEF7UDLliJtrbx4rWqxj8RHaEUJHMJYnhdEk=; b=eLfR1bT8dLaW8I0OD9tLTEOdAE
	5KvWpbVOaDWEBMFMvIL9EQfUkHMkxkRw4fndl+HoLHOpilHD3PqFogKeoZ4qdcHpdBkJ0zt8NPD9E
	7B6/tykyxCM8df71ESJbN5bdaMqxKKzhq3PAgvD/85G1SjR5EKCWtx74blK8J33FRyhjHOBgsTlfg
	EWvuJQe6FeYIfoW5UWdM3o7/AbRB8IJKkhAs90LpO6MAzMFCbkIndRd/RuWd/7UOWURpADKMvwOBe
	V9gAxnLYB7WShsoWs/DnphLN1rmdEQ8B8RBCL6yozzRbi0FYDdaZYKsxL5Q2pkWVl5/sYrgAaoKwJ
	UdkySdoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyaPP-00HOd0-F1; Fri, 25 Nov 2022 15:14:31 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyaMd-00HNVo-8q
	for linux-mediatek@bombadil.infradead.org; Fri, 25 Nov 2022 15:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=D/qGjMKoEF7UDLliJtrbx4rWqxj8RHaEUJHMJYnhdEk=; b=VAxe9YojpFqukLHPNWtyPz5fBV
	JT5I1gApYnh9kT8AvbUVJkGb++lK6UOMECJqUIpeLlW7JGbGtacQkkAOtGmCKHsLqRXQ6UnmOqqa6
	Yd41HMe2FgKbvpQffoBg5Sc9fnkbds90AOiVxGPJPDLTcSmHDjpVN4rbb8WrvQzdxb9Y0cKMYhh2O
	vwL2H+UZtIPY2XZeAS7XxjdKa6BVlPDV4AYgwfEyNQmMg9oywbs9fjgrqB7F9knhqMzy7qHk5PZpf
	fCL04lyMiPJVej3SlzZCu+h7d0h8pxX3asP/Ddk/VoM44WmsY98jlZdYh9KhG3FPDzoLN5tcV//2y
	9j9YeYGA==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyaMZ-004Yfa-1Q
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 15:11:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id q7so6297274wrr.8
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 07:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/qGjMKoEF7UDLliJtrbx4rWqxj8RHaEUJHMJYnhdEk=;
        b=FunvwomMzazOiQHP9qjCeutiSj78INhnnswMu9jRrTVOSjAFlaKYxWo7ImMhfIvYZO
         So1dGYemTGTky64QkEVbNSBzkLAh2NBEpvPFTkWy7eeGtd1Mr+8Bo8ICx+AMWjVJeeFO
         YDQc6yIbf7q5E7Pjy1g7sJMPvXCkCU7x/9cAyMd2dMf6yhtx19JaT+f8G2clhIr/rECV
         +VN3ya4t/vxPEUebs7bEXzzMyUjvmVW3OimMLwrXL1dNqY2ovWwUTSccsRwABZCZjphq
         kWwCSdk/Ia7qTa1RnLytfhBgUiJlILGrrn3TOppX1xoJu5AqpbzKv2ukGmrttpYG6GF1
         ockg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/qGjMKoEF7UDLliJtrbx4rWqxj8RHaEUJHMJYnhdEk=;
        b=5BG308NqJq+gLavJ+gat0eNt6mGuLoRLB863dlqSY3glgI4XfCET+8zqOjcuTp8Z2u
         sW6Ch+cKNr+nhv3798j+7VtSb4bGiwPeelUn+uwMAIVstqRRcZSA/M2h+NyJ1uVaMpXB
         XAVRKriD3Ra9MHhbiEUzf8uCJqJNMyjIGshMamjZ+GU0kl9d6c9j1BP+QBvqSLXg8Jhq
         y4Y6mBNkCgHcOgFkdR13H/riQsxEAjtGEzrgPqGWSJFNhjpz0+gA/zjTH9U/MRP0XlHU
         pgfIpCNJY7cyJa/fjNehnff+vpXSQDvpr9deWfT6xIqkUFUMazT061W7xfeZNNrnnk/I
         AvVQ==
X-Gm-Message-State: ANoB5pmcqYXJ6P3rJlSC1rGH9ZJtqAxLNyhk6JO+Kv8hL8X/SreaN9Hx
	pBeqsWKj9kaHmqS9S89NK4rdhA==
X-Google-Smtp-Source: AA0mqf46m5/6QUU4T4g/4nUu+fFMz6S02mOIp/205JUHc3bTBuU1MmMK0hz7g+iGfTFHme0vn5ab2w==
X-Received: by 2002:a05:6000:1d92:b0:241:6e0a:bfe6 with SMTP id bk18-20020a0560001d9200b002416e0abfe6mr15597315wrb.34.1669389088896;
        Fri, 25 Nov 2022 07:11:28 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id w10-20020a05600c474a00b003b435c41103sm11565885wmo.0.2022.11.25.07.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:11:28 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 25 Nov 2022 16:10:18 +0100
Subject: [PATCH v6 07/10] arm64: dts: mt6358: change node names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v6-7-4f589756befa@baylibre.com>
References: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Flora Fu <flora.fu@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=0w3mp8M+1h003hGCAyGu3KsDIgwbdfb6BOTNA6p/zCk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjgNsXiaEwliHNuhNheU+36o3pNrBgk4Gv1o/ishDA
 jjUr+QuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY4DbFwAKCRArRkmdfjHURY0zD/
 4g1XdePNaAEhYmAPAZwxgsV8yEQqZY0CP2rp1y/DApiMmbGJHpJD/BHm3+rHIQgJD2NPuJcqW+LgfJ
 UYy7gV+YrcCu3woZmwQYAjbxDTOPCd/6gtGRpVSPD7I5RX0nHxdvJnXUz7HSx1QT78r6Rk6ZnMc7VD
 4OCSMuLKABzsY+BAqLLYLrZsCh6mc9B1AVpSpS7g/rIlGPHzyZ+Hyh6TMRosMd+4mQAqC8JjD4xuku
 6RegXsvTxn1mFj6gXvtc2Kg6/DIxO03E1il67dA3jbNlkDiCXSIeIPCcn5Rlvd/MmsCpgB0SBEWBiv
 gIuhCJn0/kHPMaGQy8pfuUbYIbBSGQCo6wtYQ/r9iYTbchx4MQrly9NsnfpYR7fC/nAofyU1tZuSp4
 8N3JRmuc7PoMtauy9MeZC34Df6yKgXps32+UUJfd0RR4LvQSgOU+3a8PhNZtgbn9o4R13ki4H3IhOR
 hK/IlfvGj2/gx0rhpTi1pTfhLdDHfXRPrllImPBDnF3cfOTlzM8D02Mt3/pnW9ITCRJbAl0Jo7EI4r
 bu6Ee11cqSZxt7FmEG6bUHQZ2whgnjj2/BBrFTMJbWY22wSTB2fZEtVbTurlX+slo/KRUhuYhmyfp2
 TmVta7emISErzdz9F7YgG5rtKOdfrMANuq89yrx0pI5py+5s9xHqAsttUvmw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_151135_346358_9DD9AE77 
X-CRM114-Status: GOOD (  10.83  )
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

- Change the node name from "mt6358" to "pmic", "mt6358rtc" to "rtc" and
"mt6358keys" to "keys" to be consistent with the generic names recommendation.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index 98f3b0e0c9f6..b605313bed99 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -5,7 +5,7 @@
 #include <dt-bindings/input/input.h>
 
 &pwrap {
-	pmic: mt6358 {
+	pmic: pmic {
 		compatible = "mediatek,mt6358";
 		interrupt-controller;
 		interrupt-parent = <&pio>;
@@ -355,11 +355,11 @@ mt6358_vsim2_reg: ldo_vsim2 {
 			};
 		};
 
-		mt6358rtc: mt6358rtc {
+		mt6358rtc: rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
 
-		mt6358keys: mt6358keys {
+		mt6358keys: keys {
 			compatible = "mediatek,mt6358-keys";
 			power {
 				linux,keycodes = <KEY_POWER>;

-- 
b4 0.10.1

