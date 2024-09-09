Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB4CECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 08:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnbOR5uWec+V2/X2EWwVUqdGkzkWhl7Tog8N2YvY4R8=; b=cY2IN0OEo1r+45cInV5KabvJvn
	6tnjhFsCiE6+vtkOETgUJxf1++Xg9HaBn0bbfTS1VZOLaM8N5tvs7MZSJybfkgS5CAJ2oh4A9V24+
	DAscD1aR/OMySRDff6CSiFhJwOTFNPsXc1SyB2KMx4urid0En7jGire0lnWUP8qhBkSfn6E7HST1R
	mWwoAFzW7v1mMX8sSnaRHGtIqataGTVvG4NKTs8qjj7i8ePwoOn9sP8cNQhFsOReLSRLCks/MbcSe
	A9VP/OX0FHf4S8noWrGOcgCupPaHemh44OsC4HKk5jFB0x/GNeKj/qC0g1cehS3BV034w9CQg81Fa
	hVa4zk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZzb-000000019Rd-34cI;
	Mon, 09 Sep 2024 08:43:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZqN-000000017mP-0f8y
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 08:33:56 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-718d8d6af8fso2257601b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 01:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725870834; x=1726475634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnbOR5uWec+V2/X2EWwVUqdGkzkWhl7Tog8N2YvY4R8=;
        b=AxbXLOVcpTCeXwrOXAMdj+MCqgFJTPOmT0QqiU7POxrk92F5v2B+tI76GFNGLiV4n2
         RcR+KfXQS+Mffm88sTGVr8lH1ai/wbjWwWFWCoB0TVLXrw0wFAApR96V5V/0p/dFMQeh
         6mX8Kmaf++xX8vQpxWivNK+x9fhzluFyRGXK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725870834; x=1726475634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnbOR5uWec+V2/X2EWwVUqdGkzkWhl7Tog8N2YvY4R8=;
        b=wPIY0cDW7uqvj1hquHKIm9NZoRh7eQ8plvI6Wjsh949h/LsQIwV3EyxEMp8ZiTN5mM
         U/ZnD1pTpH0yWdQ5uf/OmrHy0repaoBpHuieYgsVt+BuMtrx/iw/2Rfdd7SGPDCDzYXQ
         YLJgdgKJuQ/ecoLg0nRkh6LQObCtxUfOAgh2558fuXz8Ct7iVQrV1QkZCqTWnrDALJLV
         fFMkGz0xI0qGxtWjjJ3BBvJD8t7JUN0QngplMIEgxlOoVx6ZDFb1iq4hvxAoFTQeAvKe
         n5wTO286YR7ifVdDC0zC7CuNQiKNIoKjIfbsFBshzn8bHkIqpKqHDbMtsFxohu07MF5k
         C5dA==
X-Forwarded-Encrypted: i=1; AJvYcCX5GEy8AV2DhfQrglS99TuXcgua4blM8W6dje/e3TtZofeYPav343pRvRLPzronxgH8l/JQUPNuUjTp0kj4kQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9jwgclh9pO6zvuiEoGw6mumLGYH88zWvWhV7OBc+WWxsobsnG
	sybWQfXZU6/BaIz6Zmm4pXaA+kh7VDLyRWXVqdD8zpzYgKxx+Uwu6lGCExqjpw==
X-Google-Smtp-Source: AGHT+IG/tKtFagM6enobYRRBn21Rin0SunUwGhn1lOEDrVWlTYwstGWs3keYdbE6jgCuB1tmhhttvQ==
X-Received: by 2002:a05:6a00:928d:b0:705:a13b:e740 with SMTP id d2e1a72fcca58-718e404bb29mr11530088b3a.19.1725870833999;
        Mon, 09 Sep 2024 01:33:53 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (30.191.80.34.bc.googleusercontent.com. [34.80.191.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e5982103sm3153558b3a.142.2024.09.09.01.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 01:33:53 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Mon, 09 Sep 2024 08:33:46 +0000
Subject: [PATCH 1/2] arm64: dts: mt8183: krane: Fix the address of eeprom
 at i2c4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-eeprom-v1-1-1ed2bc5064f4@chromium.org>
References: <20240909-eeprom-v1-0-1ed2bc5064f4@chromium.org>
In-Reply-To: <20240909-eeprom-v1-0-1ed2bc5064f4@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, Ben Ho <Ben.Ho@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_013355_206586_0CF6C3F8 
X-CRM114-Status: GOOD (  12.09  )
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

The address of eeprom should be 50.

Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
index 0f5fa893a77426d50c293f780b75cacfe988d866..8b56b8564ed7a25c269f4231ddadf8621aec41d8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
@@ -88,9 +88,9 @@ &i2c4 {
 	clock-frequency = <400000>;
 	vbus-supply = <&mt6358_vcn18_reg>;
 
-	eeprom@54 {
+	eeprom@50 {
 		compatible = "atmel,24c32";
-		reg = <0x54>;
+		reg = <0x50>;
 		pagesize = <32>;
 		vcc-supply = <&mt6358_vcn18_reg>;
 	};

-- 
2.46.0.469.g59c65b2a67-goog


