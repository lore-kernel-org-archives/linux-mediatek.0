Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0441ECE57B
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 08:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bi2r6WX0GqMIJ1BBkYJjpIqSyhbsI5xswcDwwNPNShw=; b=Sr+9H/Fj4jwsW9asSDg8EL/png
	ub3ryqz5/jT7pr+7quE4ZelYi0OO9Yfmfqjooc+tpXcJ6clHxlN5IPkIw6yYz2+KU5EVKQW4nJWCF
	lZpYnhoCh9ONfm/DBHRwkhGf76q3YGMdSQOMTHgsxLyy68O5FQu7R8xpxcHg8H1zw4anypFgMGt0E
	ZlpoozH3ZbxmHIZZ6XBeve7EDSS3oprHhg92lAM/LOhrR2zrkcBHtdU24RHN0z36IzK4+VLIv3BOV
	OzchbLwERqXqOJXma8mYq5t2ql45xf/NVCDgCeqN6GuFEXrMGHX4ToBfXfK+4LlUTFQNXxSCn2zys
	fuj9TaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZzc-000000019SU-2wCH;
	Mon, 09 Sep 2024 08:43:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZqP-000000017nj-3mdA
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 08:33:59 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-718e285544fso1234146b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 01:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725870837; x=1726475637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bi2r6WX0GqMIJ1BBkYJjpIqSyhbsI5xswcDwwNPNShw=;
        b=fpbF/Bok/bWAFNjMtfZmbgj58mGeabJ7wt1zAkvzpVyMNcSGZlKK7NTMzqb8jtWRJJ
         CYsYQGZhO+YF0B+lWOTAGoyP6KRHbCEGnxlLVnqR1srj3vX3ZjG8FLFPzf0/5wTCVjpw
         93ApUtr1mzip2cH4mVsnkhZ6v44LT/QWUK9CU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725870837; x=1726475637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi2r6WX0GqMIJ1BBkYJjpIqSyhbsI5xswcDwwNPNShw=;
        b=AYaIInhbE6mNyk7aBoQxfnVNSeSynXNhMXU6ddHZyzOxnxNPkEW9IdptRmjAyxnf1P
         6FAiBW74xQ2EM/S3XXfZ9Q1zn0SdFSzC+k27vISK8EHo6BM2aIM6SQ8Mk05TQsK0z33J
         NBZV98LTGHxd5aekm+zOWj0WMqAhdJcDCnfNBphmrPEHNS54t7i9AqRUVgO88hnpBBxX
         PIVjWEwRM5OTu3f4UQKQdbAiIfKyLbaqnqi+Ct72zELWtyM00s5LJvqFcOZ/D+5nk9oQ
         a5urX7dxeQn7a5utwYtHcCF/Ss8tQo+mMUXgCP6PqNlqIfpGRRnnDBfk/zF3/OAjNTKg
         v8QA==
X-Forwarded-Encrypted: i=1; AJvYcCWl8uIc7q8JdJCSaGfPlug80+cBx1ewZGi/7Yhrw98EtxEpngm63kl3iqQwERc2Eci4ZalL0BqumkNrVJNBZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfsScKCU9BQIHA/guu9takdsV5iUsfU6ebkMjMN3hiSPu5krye
	kmATSUv97HtyRDQM0dNPBfxsZrmZKskZGNxK6AYvCPf18y6gDfDnI91uwvNCZw==
X-Google-Smtp-Source: AGHT+IHZ/SLXalnyKeFyPPv1WuwYsFFb0U4payUyhVaBeoYCkD3ooTxXc/r4b3tJy1LB98veI/zL3Q==
X-Received: by 2002:a05:6a00:92a6:b0:706:b10c:548a with SMTP id d2e1a72fcca58-718d5f06a3emr10112054b3a.22.1725870836898;
        Mon, 09 Sep 2024 01:33:56 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (30.191.80.34.bc.googleusercontent.com. [34.80.191.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e5982103sm3153558b3a.142.2024.09.09.01.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 01:33:56 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Mon, 09 Sep 2024 08:33:47 +0000
Subject: [PATCH 2/2] arm64: dts: mt8183: kukui: Fix the address of eeprom
 at i2c4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-eeprom-v1-2-1ed2bc5064f4@chromium.org>
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
X-CRM114-CacheID: sfid-20240909_013357_985374_FA04F726 
X-CRM114-Status: GOOD (  11.76  )
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

Fixes: ff33d889567e ("arm64: dts: mt8183: Add kukui kodama board")
Fixes: d1eaf77f2c66 ("arm64: dts: mt8183: Add kukui kakadu board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index bfb9e42c8acaa7c2e5515888a77fe97258a1b78a..ff02f63bac29b2c473bfdd90a15aba09c2915271 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -92,9 +92,9 @@ &i2c4 {
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
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index 5c1bf6a1e475865fc0f6187e9733d7d98908797e..da6e767b4ceede9f5258274fbd702c6e6929f515 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -79,9 +79,9 @@ &i2c4 {
 	clock-frequency = <400000>;
 	vbus-supply = <&mt6358_vcn18_reg>;
 
-	eeprom@54 {
+	eeprom@50 {
 		compatible = "atmel,24c64";
-		reg = <0x54>;
+		reg = <0x50>;
 		pagesize = <32>;
 		vcc-supply = <&mt6358_vcn18_reg>;
 	};

-- 
2.46.0.469.g59c65b2a67-goog


