Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD17CFD35C
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 12:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwwOHHmNfIXkBnfQ+BSyO3zaAGqXbcc9kTes1NzHmGM=; b=K1uP4sosV6wTsH5ny0BrG4anhx
	jBRsRhl7+Q7j+psVP+ESsJ3iwRT5+YNfw9//u1pDLY7QoG2Vh7sPCN7BfCt0mJFYbezFUKzl4iJOh
	Q9LhUqx8EMkI7CthN1o4c0VnOMNbWmh/eq6TdcgbkzF9EUpZ/LUJ5834qtGjSc03VDJOAE0aPjXoK
	pTNe8NriQuJvelyKuiGxiscQiIb7gf4gLOOEEbaq6vs64xh74CL/g8QEb/bGYnLQZLKzPoxfdyYph
	pszAVxAcozg/g+nwyFv/7m7F124Eiq9axoHxHJN5f0dpElOELJ/FB66O7ZcaZkxEZReckKxh4La5i
	0q7slaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEUN-0000000GFAm-3Msj;
	Fri, 11 Oct 2024 12:11:23 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szEPO-0000000GDvS-33Nf;
	Fri, 11 Oct 2024 12:06:15 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9963e47b69so292100566b.1;
        Fri, 11 Oct 2024 05:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648372; x=1729253172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwwOHHmNfIXkBnfQ+BSyO3zaAGqXbcc9kTes1NzHmGM=;
        b=W0uTRXGr22//CcJpDM7JBOyWIrMaDej4ci1FjZ5EA30UWMWoZ3i3neb+lTHXq56OU+
         C1b4Ru+xu6DPVm8yt7/zRfA344+D4dt5IWIn9VU6AkW2J04SFfkDrYuCYk19Hblq1CKT
         vAMT+ClQd998vHoTRMUt+B6ujLpYygTfmeunNwcckMQ1XDjBMRTkCS2AxrQGaF1B2u7W
         7e8iJgl7Gc6CTfjipIAPMZE5qmZwEXUQRfqXam0goo90xQagCwv4J1pVMaiya6ygYbnU
         ExryXBTjI5m3ObswH3PfTVJe1blzigyMWhoJvB56FFhXS+OVUImvKWHLcmaTz8Kv77zB
         PxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648372; x=1729253172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwwOHHmNfIXkBnfQ+BSyO3zaAGqXbcc9kTes1NzHmGM=;
        b=MvpMgWZmAwg91bnT4uzX0cNeu3mSO60OBoF7knQA4mG0c0ku5D3L9M/RL14t1IO3EE
         PsDZImpP+xnQNRt4018TJX8njTPT1X0t6mZv1p+zGFngtHvWa53I/nosank3yL1BmQAx
         R+UKY0tezniTjkE9uQFa4VngmZHQJ0edENYC3fbEN/LUpN0G9iVXWKRjvIb0h0c74yDP
         hqT/Fz3kMlO18slZ72AAhUEn+BPeYjZbedUYj2VOtRKKToRnzeXmC6yU4XNjonaKADD2
         SRJDSvGaZSTpnT0V8MpovTj6ut79kK6WY674cRn3BjLVA/hPVkVJFoiV7IznF2EuTM93
         pUUw==
X-Forwarded-Encrypted: i=1; AJvYcCUuGWQ/h2w2UlTFlsc/fCikwB1jN7/diIwJcutQDwey163/b912j0k/sVLqGtldzBH88qdzMtys8KSq5anpUV4=@lists.infradead.org, AJvYcCXKCGiTqdSNAkyLG1kr6hYTtBDGjPAfem7nNT7AMT3afACdccHxGRc8J3G6ZeifvGbiAy0WwMbqePEJYVwellDv@lists.infradead.org
X-Gm-Message-State: AOJu0YzGJXyF/2IZZddE6rHxkQSEfJnLQ335pwLNb7gHkhVCRoGHSRm2
	6K43hirhLxJP47c1K+E0LqVbw80ByaDWxkZP3zA+ObwroHHvBgkI
X-Google-Smtp-Source: AGHT+IFgVwsuSAq9WEnfhtW5pOGhnuZyyy0168qn0i8pRbiG0OVPCEzP+JXQsY84r1H5fj2P13/ebw==
X-Received: by 2002:a17:907:96a7:b0:a99:446f:1f1a with SMTP id a640c23a62f3a-a99b93ed1b2mr213531966b.35.1728648372484;
        Fri, 11 Oct 2024 05:06:12 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:06:11 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 4/8] arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT bindings
Date: Fri, 11 Oct 2024 15:03:49 +0300
Message-ID: <20241011120520.140318-5-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050614_800324_81A998BA 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add -pins suffix to pin configuration nodes to follow DT bindings
and pass dtbs_check.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 0e9d11b4585be..a786d1d08f683 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -135,70 +135,70 @@ pio: pinctrl@10005000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		uart0_pins_a: uart0 {
+		uart0_pins_a: uart0-pins {
 			pins0 {
 				pinmux = <MT6797_GPIO234__FUNC_UTXD0>,
 					 <MT6797_GPIO235__FUNC_URXD0>;
 			};
 		};
 
-		uart1_pins_a: uart1 {
+		uart1_pins_a: uart1-pins {
 			pins1 {
 				pinmux = <MT6797_GPIO232__FUNC_URXD1>,
 					 <MT6797_GPIO233__FUNC_UTXD1>;
 			};
 		};
 
-		i2c0_pins_a: i2c0 {
+		i2c0_pins_a: i2c0-pins {
 			pins0 {
 				pinmux = <MT6797_GPIO37__FUNC_SCL0_0>,
 					 <MT6797_GPIO38__FUNC_SDA0_0>;
 			};
 		};
 
-		i2c1_pins_a: i2c1 {
+		i2c1_pins_a: i2c1-pins {
 			pins1 {
 				pinmux = <MT6797_GPIO55__FUNC_SCL1_0>,
 					 <MT6797_GPIO56__FUNC_SDA1_0>;
 			};
 		};
 
-		i2c2_pins_a: i2c2 {
+		i2c2_pins_a: i2c2-pins {
 			pins2 {
 				pinmux = <MT6797_GPIO96__FUNC_SCL2_0>,
 					 <MT6797_GPIO95__FUNC_SDA2_0>;
 			};
 		};
 
-		i2c3_pins_a: i2c3 {
+		i2c3_pins_a: i2c3-pins {
 			pins3 {
 				pinmux = <MT6797_GPIO75__FUNC_SDA3_0>,
 					 <MT6797_GPIO74__FUNC_SCL3_0>;
 			};
 		};
 
-		i2c4_pins_a: i2c4 {
+		i2c4_pins_a: i2c4-pins {
 			pins4 {
 				pinmux = <MT6797_GPIO238__FUNC_SDA4_0>,
 					 <MT6797_GPIO239__FUNC_SCL4_0>;
 			};
 		};
 
-		i2c5_pins_a: i2c5 {
+		i2c5_pins_a: i2c5-pins {
 			pins5 {
 				pinmux = <MT6797_GPIO240__FUNC_SDA5_0>,
 					 <MT6797_GPIO241__FUNC_SCL5_0>;
 			};
 		};
 
-		i2c6_pins_a: i2c6 {
+		i2c6_pins_a: i2c6-pins {
 			pins6 {
 				pinmux = <MT6797_GPIO152__FUNC_SDA6_0>,
 					 <MT6797_GPIO151__FUNC_SCL6_0>;
 			};
 		};
 
-		i2c7_pins_a: i2c7 {
+		i2c7_pins_a: i2c7-pins {
 			pins7 {
 				pinmux = <MT6797_GPIO154__FUNC_SDA7_0>,
 					 <MT6797_GPIO153__FUNC_SCL7_0>;
-- 
2.46.2


