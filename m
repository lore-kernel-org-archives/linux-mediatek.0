Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E12AFED2C8
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 04:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J243xpU31bBbVlACRT5AgcKckiL1IQqdWNfb3EEgNIU=; b=CzyggSY3m4pMjZSCmwT7cfXFLs
	rUlUy5o5j8AczYd2AiBfnQTnMJ1rOoc+VpF5qZeyFGW4y7v2KF75T5hAkP7Bu6GnraN4u4EUlKZ0D
	TDINyloh+PKkaNcPrO4ZrhoT/MaC3cINT4AivZVuzFfEd1gYhiIWX7kVbSQaIhNjrOElKbl66l7iT
	zOHK/0YKLuynfYQPSd5TALkVMdrgABkt81jQ39g0OvKe7vNYKOxLdAIgq1/eH1sRdv41YO86+mdls
	sAL2Msq6sSSm/jEfB/4rqc7cdRqKiGidS9Brl4M6RyMH6mLicz0QkNz9ssJWKAWRQ7h1du0viwsZH
	S9YucVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XT7-0000000DEHp-0jb9;
	Thu, 12 Mar 2026 04:16:17 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XT3-0000000DEEo-21D0
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 04:16:15 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3598b95ad7dso426325a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 21:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288973; x=1773893773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J243xpU31bBbVlACRT5AgcKckiL1IQqdWNfb3EEgNIU=;
        b=cAZg4PL84yysFvxSrrmaXyAgsVjlc8MhLV4lJaN2WaBgEvxLJsKDdPFAKCnW1IThg4
         yYedLBPLvIKwq7AuYCmJKvKnx/pCvhs4bNla7YQsm9BZ/5KFI7dvx7EkI7zinV68Rxny
         myOKzfduVg6nEuG0L3TRBJZO5Im6QCAfM4NNUaF40DwRhCGhtnZCPpzgtvhIs+3+fimu
         3EKjKH7lncXGOx+SaY6NSQY7Ton6i6CuiI2EwcrC1+/FF3SF7aDaqNI1fCYgb06oDRZG
         e1rBov50tkbABl2dOoBqVF8I8cz9bg7KRNHfBuTN+SG+x63JkxoHwe8AYgncV0A5nGc+
         RXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288973; x=1773893773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J243xpU31bBbVlACRT5AgcKckiL1IQqdWNfb3EEgNIU=;
        b=FkTRDTlz4F11ZAG1Z7dERUH3CKYYs6a5xGhXTCTyjNVbjoEkWEl07aN+QRUBQ1HlWz
         Nkfldinh2EiZ2JhrQ/qKRFABUrBkFq7/poHxtiFsI2X3oFmKRqdmwvxlUv9mwBsRoI8W
         Zqmj9u98j1tQyJNq9ZQ2a8kyeSHNkMO1FNu7/1lS+SW/orhxbtLDCQYBGTCQb+Aw4Aja
         M7afryMZRJE3Jm/CTUT/q85cJ5XjgiqYIP5InSL5IEkt7qfZq1opCdpATKoKjTmRlecs
         7fDOTCu05CQAMFiImKP+2k4y6uRsQY+PfV/ZJbIcmXCSkVuFKE26MEOE1bHv8EbDoUNP
         ipZA==
X-Forwarded-Encrypted: i=1; AJvYcCVgUVFFKlRGOZJy48OegsWW0fZcAZhRou8OsRU6ZZ2ZZUOaGrIyvT71xORwDVpjeN7ZZbb50z5rcVsmID42ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy66jo1qMlVOrPP0MZkzjVYGFSHbrjpCi+UXgv67uN5tyVUoCkk
	3UxxQLNDpKkVVu1odCycM71X8hJqjfuzykbCYCdBqtvMbJLQo29FA1OT
X-Gm-Gg: ATEYQzzlA8VrE/7bSRTUgpU/wwhsK7w+LEa+71KGs5FrtNFa5rPJVLev1uqNRgJbUHB
	OJK/FJneKWP2DinkDaISPmhyvd4cmsgM9zpcuFxxTfyfDGrh9AVyRr1kFDYjdr9+0j7ry/xWVq2
	PPzRXHw01IYNMeIWLIr6FliTyU1u6QU22O9S4IYb/GWQro8EXEQ9X+Nw7r8HeWYHxatSnh3J7Np
	SWYb+ta7q/9dXoxSNKHLkL+0lQoZROvMTgOiCdoGYgjIDTv52EpAzCvenrZddm37+RAbUU1IR3D
	ztLRFp54N8031lu8+vKm8lgULx0X/0BIkYKoQA7No2ZtNVUMLiUJrZr46zWuPSHo+6+4JZes2p9
	JsYZtKd0fXt/cWYnhcqT2FKHL4wiKw0Xod0x6qLU6j1efX8hMnJ8/B3jjNxqPxR7kJk/bwzDWx7
	MG0jQe88CU8yDoZcxUf8p+MiL61J0MYfnDogPmCc8E5QCjWoHDzy/0NMeiIYYQ0YfrLBuNrjz4E
	9AR6aM=
X-Received: by 2002:a17:90b:1e10:b0:359:f69a:f7b7 with SMTP id 98e67ed59e1d1-35a012b3820mr5127239a91.10.1773288972604;
        Wed, 11 Mar 2026 21:16:12 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:12 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linusw@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	hui.liu@mediatek.com,
	nfraprado@collabora.com,
	linus.walleij@linaro.org,
	mars.cheng@mediatek.com,
	andy.teng@mediatek.com,
	hanks.chen@mediatek.com,
	sam.shih@mediatek.com,
	rafal@milecki.pl,
	ben.ho@mediatek.com,
	erin.lo@mediatek.com,
	zhiyong.tao@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 2/6] arm64: dts: mediatek: mt7981b: Fix gpio-ranges pin count
Date: Thu, 12 Mar 2026 13:15:29 +0900
Message-ID: <20260312041533.187553-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_211613_550857_98FC225D 
X-CRM114-Status: GOOD (  10.90  )
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

The gpio-ranges in the MT7981B pinctrl node were incorrectly defined,
therefore, pin 56 cannot be used.
Correct the range count to match the driver.

Fixes: 62b24c7fdf0a ("arm64: dts: mediatek: mt7981: add pinctrl")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 4084f4dfa3e5..1bbe219380f9 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -332,7 +332,7 @@ pio: pinctrl@11d00000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
-			gpio-ranges = <&pio 0 0 56>;
+			gpio-ranges = <&pio 0 0 57>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			#interrupt-cells = <2>;
-- 
2.53.0


