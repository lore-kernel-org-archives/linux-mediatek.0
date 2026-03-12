Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CE5FED2C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 04:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/9M/lTT6d/B4Kv1sMdY42lBtxyscWWx3kEUkACbugI=; b=qNvpVBw8X49zJz9DHMn5EEmDJI
	P+Gf8ecEzhYDiMkll0XSftEvzOl5ZIhnJT8LR+cOkeqSIzC4R6vrdMLyCVCWfcQKvP3PEiINPJx0q
	HpbYzfTLKJFL/HceUi5oezAldhakXWJRZO1G8KCmsmGaBv/LVfqW/HMNEQ7qRFIZpggl4KjUCifs2
	Pu9kf9vPYT8uOBgbki7AerPJqI+warFBM5iMZ9UTRN13f83UhkxcMRExJF5A2Nninm80DepFTB487
	YNYDFrIolo+Vj/nnbthda10hnpvB6HKnUbWFjqjqNVFGqtnO1Fm6J09d9VKWU3/xPf0Kbk5PVXLGL
	kqGy6ofA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XT9-0000000DEJq-1lcY;
	Thu, 12 Mar 2026 04:16:19 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XT7-0000000DEHd-1oGr
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 04:16:18 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35a04d6aeb0so350158a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 21:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288976; x=1773893776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/9M/lTT6d/B4Kv1sMdY42lBtxyscWWx3kEUkACbugI=;
        b=ba5xk7lQDN8HB7kYVpF9XmIN99La02rGhGghpQITvFdgfxyhLOeb8RufsP3iX44aQN
         O7K50SWiBpu04saZnCog5Z+Pz2LUrUgcZkjH5RYBcJCYHdvOsrBDoE4x14sljjP/Thea
         NMAm+zFRP3RofcGvYE7NQ4beMYyJ3p075UaXayGG0i8tos/qfbTV7IuEfwbajkstB9sb
         fnt8nfR06b/rqpS72Q2D7wGd+ojD1TW9pkXiRkaMuUuqAuZJc1aSsLXWu9RGu0RC6WTP
         PucQIhUZt8drNUz+/aKxn5gT/cLSX9vCKdP2m+e/5LpYojDqWVtXvpyNfDardFHEczHf
         UioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288976; x=1773893776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W/9M/lTT6d/B4Kv1sMdY42lBtxyscWWx3kEUkACbugI=;
        b=jUZp3B9XIKHR7jv4BYOp8ZcY3ikxALHT0l1XUkCKNhVWeunl1P7PdiPs11WtAE3q4y
         k0kA5oBw8CTZzZ1TmZIg0UhPzHw4/JHKK+87BFsAO8C4p5geq6TaCvOHo47AtcIHvqK7
         BvCj/HRjGf9wq1I5YZ0pqajxFQtV6/j2WFOGvc5zDTKlH0Os8Q+xL7z6aM/iKTLUgHRv
         FRZJiXqw5jllQN5bY41mQ2whBHT7aq80GC/UVy7zjsYRi+zTaqMdBGW2zV93617J3cj4
         6Zcqmt0bJ8xDSXA8tp09DaNSM7UFq6lyHS6GC+AnIFegJCdGrfl2wKCYdClVzWMa4v9F
         z3gg==
X-Forwarded-Encrypted: i=1; AJvYcCVyjbQSP5EK1ZgGL+ZfvyzVC/nbmjf6FpWbes+JOf5woEvW/ezJHUNbwP1VR4yrgXc+YAZliy8rsVOdMfqf7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyINPq0y/uBbh3daAukkUzOZENzMfxqC7cvWXyQRmJfPaBmZOnG
	z/QuOC9tDjyKudbktrBOopR4g+wvisnXinZ7yK90Os/ZvCl4jfzgVcDi
X-Gm-Gg: ATEYQzyF8vhQIubXR5bUUU2TZ1FKFxQ8uXl9DDTsY5IpHSQr63LIeDJhc6bO1cC6Gq8
	VXcCr7ZzdWsKzEkAI2QaaD8E1b5YMVfe8Lr84wUt/F3E7Ty3aOskhjfjHXJcuPU66ks3pIMjyGC
	iLXm8n4NqSVYAkiurcX59MntYNFqN3FqrUFQgbjCfTWSSiYMCT/+znq0hvFKbzfd0nu0HKYzfI7
	D0cwJBPX5I2EGRjB5UCld9q/NzWoG1BoQQz3fiTVuw/Bfe77Q0HdG3tD8/pam5cLO0npqhsQPdZ
	2C650Z9vpf+RBJ9fmH8GqL2vwzZglXQzU9wfGNQ52m9bQTkI49VDMRnn6zGQv9Tf09TpCx1qNS+
	EYeo3nUaIgloqzJCGviE4VfpDctjDar0MqemM+Tp6Vbrl4IfcTWPYCmp6JlTxZgTNBOk6SXGwa4
	DUz0eXwpP7sbIq/xxmTsEsjCL9Yad0SDc9F0VHUSvzeTLMraugzwS1S06UFy/DRROd44DVB6/1K
	dbI/4k=
X-Received: by 2002:a17:90b:3c06:b0:343:7714:4ca8 with SMTP id 98e67ed59e1d1-35a01201d6fmr4340930a91.15.1773288976536;
        Wed, 11 Mar 2026 21:16:16 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:16 -0700 (PDT)
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
Subject: [PATCH 3/6] arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count
Date: Thu, 12 Mar 2026 13:15:30 +0900
Message-ID: <20260312041533.187553-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_211617_474772_1BB66F53 
X-CRM114-Status: GOOD (  11.38  )
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

The gpio-ranges in the MT7986A pinctrl node were incorrectly defined,
therefore, pin 100 cannot be used.
Correct the range count to match the driver.

Fixes: c3a064a32ed9 ("arm64: dts: mediatek: add pinctrl support for mt7986a")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 9693f62fd013..9ebc196107e5 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -187,7 +187,7 @@ pio: pinctrl@1001f000 {
 				    "iocfg_lb", "iocfg_tr", "iocfg_tl", "eint";
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&pio 0 0 100>;
+			gpio-ranges = <&pio 0 0 101>;
 			interrupt-controller;
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
-- 
2.53.0


