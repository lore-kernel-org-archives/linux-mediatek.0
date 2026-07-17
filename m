Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3237FC4451B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=; b=zF9f8dEkEqkGthQk7UAY+RYrBN
	rCrdDy4m1p8x7km5MBnMiBchJfFpMq0uq1dPkTSEmRGnW52XIHYlSmsy0Cc5INnTNS5fKdgVo+0h+
	9bILV0QEzsC8wCDzyEmVvW0LN1klEkuxj71HAAPi6xOtjs2K932dgmopRyYUiii38wnHpZwZhnaKz
	WZsndfSwslu+yCvBQZNnG4Msljkq8Y3ruzITZmXWFngACWNmt+TnBOfY/b6GaEvApBTY5aoGU+9ub
	Ar0kvww2nqmqPVogkbqlKLEuH3MTy48htW9jvFxFQ81xDWk+ip7rEx+MKWd8kp0rDkomq8MBhtDSz
	et45cbKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldj-00000002lb9-0p4Z;
	Fri, 17 Jul 2026 16:42:19 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldX-00000002lKX-1r1p
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 16:42:09 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-69c7c8accffso11592193a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 09:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306525; x=1784911325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=;
        b=LI6CVSIaG+KpNsNfqqiGQw3JPFAcNBaMSPh6s5tfW7rmsYoNKGE9UM/irhlpA4yM8/
         qEnS/74zPRwdr00/Fw/3XrfI6dPCdkD4YT4WlcLsOK0L/T9KABnMtY39640wDCQXHNJC
         qqmPZ+eeb3Albv7xG64ygEf34NNBtWWoQjlZarb4xeVUzMCR6F+wsXSDyc9U9wDLgfUX
         CRT2YfsBsOSj49AbCLnCOLzM+IqbErUsKOT9pk65o+Kpcp2zyUEWPoGbrVZmaXEnDWOO
         pytOP+dwEARY9g/QLrov72IwMRirxOe1JDRTjni3nNi8NTh/EignIxRgNIpOG2u3c5NZ
         qDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306525; x=1784911325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=;
        b=Lw0CqgRsBBe0vynINL8SNcYUPGS3hSxKI0dTH/vO6LdsfzW9vcqaD+Ec6k9jqOEIen
         tPzFpbDE3xRU8o5HIpyj2RQh8NI9l5bvSehTanNdanKa55lwXAXmqH011fqzWDEY2gOb
         ytxGeniBe8CebV/euNbxiBpm8PoDoDcFeHjQ/CAAwQS2+kOISoekL8j6k3WcNhSpjNFr
         ya77GiPfpDDjY5FEsfKnVNFFOnkRRD+iD+0OwJDMwkLcknXF2ZIIOkIjRhD7epNAxZ+v
         2DYeh3ECIHG29zXEBRfCVVvMzvO+m7LSChEISnSFiOBWO1wZ+TrnYgsjlV6X6UxGTaar
         9W3g==
X-Gm-Message-State: AOJu0Ywhw+wNXAGBwJzrx/rqWkpmAWdRQOT666pI2mSPAJy/yDPp/j4g
	V/mKIlCtsOaAtn9MwtYlMSFQYrDa7A74wKplbDA5tkLd+vltSW6XmfV6+10EUyRl
X-Gm-Gg: AfdE7cm5+u1DH9HQxAln0Ft4n/sris+ac6TSbCLaq1LUg6jalC25PIRSJh6UHyz7/KT
	UeSCanMyFKAy04UyopMR/VA+oGROmTepzrvlcbsOWQnaFoa7MDVxxLL6EQouY8iWyAkiQg1IoZp
	HfswwgP01HxpdP1fo9FwFv1d1M4nynSkkBTtkhLPYBhd9o3z+J/gAdmKWyJXZM/KY4B6DNNVcZY
	g+ZvnlnNBvQTSqZgARRr+j1NTZ+HevrnyLCVo3tcfzslU0QWhLOh8WlDGL3ciWW24z0Jdz25ry4
	qpyWeIThXInSF/8mjDmUnDmGtzOUFcwf9xfs7nU4HTiiS9lD/eeYcaPABrvK5eV47/1E77KeHuj
	rFF5WOqIBSpckgZbBFV9lp1lvV72unfIvI9mhHorttHQfNd9mr618oEEyFQN0U+fZ5O39rTdBDw
	==
X-Received: by 2002:a17:907:a4c:b0:bec:64d4:3872 with SMTP id a640c23a62f3a-c16b46f75f9mr157226166b.24.1784306525446;
        Fri, 17 Jul 2026 09:42:05 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:42:05 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/7] arm64: dts: mt8167: Properly describe the SoC watchdog
Date: Fri, 17 Jul 2026 18:39:17 +0200
Message-ID: <20260717163959.714561-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717163959.714561-1-l.scorcia@gmail.com>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_094207_570091_4A527449 
X-CRM114-Status: UNSURE (   9.61  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..4ebf305c10fe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -95,6 +95,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
-- 
2.43.0


