Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037EBFED2C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 04:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+7pbEDD3bhMWkuiSNGnd0Fi6nBQlzSd8LprMbyKjjA=; b=XIl36mU97ywweimglcyY3KVGTY
	v0qVIEExlCOPG5FyPx1lGxZkj9PEwz3MH+MNqSr8HKXNFbumj22RGobITyCoADgNG/lderRPF5HKl
	qPy/3hZFLR7BZepSBtcLi/VrPduNq3FJARQK4IcCwk4dKiD4O9BqzaMY6jIOvR+RoyodZ38pkKaif
	JzpNdMYAOvJZw599jxJiJj50sczt0np6TerFBDopwdMViEPJC6iPHLIsqc0GmOe5pRQJxlQP/qNWw
	+F9EN++vD9bFUl3fDNG41MLw/8xO2dQJLyC4HYC9X+D1JZJM4j/0byJARXtVZPK9nJ4h8/gx6WVrk
	ikHHWcLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XT2-0000000DEDx-0B6V;
	Thu, 12 Mar 2026 04:16:12 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XSz-0000000DECc-19p3
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 04:16:10 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35a04d6aeb0so350088a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 21:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288969; x=1773893769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+7pbEDD3bhMWkuiSNGnd0Fi6nBQlzSd8LprMbyKjjA=;
        b=VGPYeigPFX3d0oYHNyjjrlklFJyiuv7uCh5Zopm/BWg2Okr2HcQ7NFRlMHuW2qHkeV
         skhhqwD1wwYi1HtO5evzXABUjRxH4GX+zEPxzVGmq/6dyQTVbWJKeL9J7W3g3g8MSZ6B
         grsB/nSgIccrnfr8A69vCmr61e+seryqI3rQGVT96/bTPkdlyJFfCfYYtQ5m54wkUjFg
         +CwnArtlUrL0Aq7KxEItDPcFKUWTkVPgUzVhsvLuMv0eyGH5nKWUS0dNEhTWMfDuPiVK
         SlCZ1vEcOBSSSFKmCjArqH8F7qK6MTnsuuoRZlhVDs2Vl37Ks4SvkOBwRyNsgk2BCSRx
         0iaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288969; x=1773893769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+7pbEDD3bhMWkuiSNGnd0Fi6nBQlzSd8LprMbyKjjA=;
        b=k6MgdKW8boV6PHparjVCMqswAgriBAUo+bXoP/cWNb34J8EJU9WvBZ+BxBya8Bs8Au
         PmKDYf0mB7YKS7VPbTgFFItS8IWvWV6dZbpDgplO1BxvC3BxGEQSz4hbqJ6DQxvjXbue
         YfCs3T3SAjn+umuZmxz3p490ML3Pa1J5njK/rAjTLrwN/dYU//kHjykRsn6+rtprimly
         EVssI1wJjvgrz218ag8TS+ELfIGfvdmtvi3zhWSU0VEzQUOskAEhQrP26dmmhHYai8UI
         lpO/g9hnuS8OqrIsCT6jZywZfVfvJdYtZfLsHHFYTtleOlPej4o8aRFpP/eFbAnDOOVN
         fWoA==
X-Forwarded-Encrypted: i=1; AJvYcCVhIeJXwMtBX4ShRnVwXm4fQmxMbiKN7PTUb5gR4OKytUZYDaUKuoTCgaJ29j2OeKtQEDQnrVl3lqxzP0aPnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCv0AoKkETb+bXTVlXXblupnLpvDthIZdTwYlHmmH9t87YX95W
	Wrrt+Re/Y1zNrGY5DQRgEdLvlEaOzI1Xn0TAevF9XsDuGi1tSOst5Ixh
X-Gm-Gg: ATEYQzwi0at+emWJjKkjIyULNzegjszsmES2zIbA/lgwZJHCa5qqILCPWVzMChX3HPB
	tKf8yJoA6FTGnwDoySA46sH+6di+Z0iq/FevYfNfKBofu4l9T2d/tgRL5SaeZADhqcjWtqxscrB
	FoFyoipyDwAH28i2CXwmA82ZAg93sxYN7oLMggu0pDMI0tqh/DPI4YbiuskZxeim+uQZudJWASM
	40dbGdzkrPx/EI1KtJGDR3Hhev6RHPIJF8iTf1pLDtv9T0Vw1SoU86jeRb/I+gSbCKcIsfdPdb3
	s4tZMzdmcjteCUykB3+hUG3HDPKYSV2KYHUDUO9AweGWOqU2rimvRixAc13xPkyyPEin7eZLcCL
	sC+UvBFgiVf9uZDWR6g7n/g40uP1/FvOJjYsm0cJHjmnF+oYqDTUJ2goky1IV1DXH3YKBbL0DUt
	+WEHquOCUAGbSmNprhfo0q3Vbign7BJkFxLAuXcrQTaFMu9k9MH0dKhngIpHz1QvGyWILuoVzmN
	pws9Eo=
X-Received: by 2002:a17:90a:ec85:b0:345:badf:f1b7 with SMTP id 98e67ed59e1d1-35a012cbadfmr4484568a91.28.1773288968665;
        Wed, 11 Mar 2026 21:16:08 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:08 -0700 (PDT)
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
Subject: [PATCH 1/6] arm64: dts: mediatek: mt6795: Fix gpio-ranges pin count
Date: Thu, 12 Mar 2026 13:15:28 +0900
Message-ID: <20260312041533.187553-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_211609_310506_A8A06E82 
X-CRM114-Status: GOOD (  10.98  )
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

The gpio-ranges in the MT6795 pinctrl node were incorrectly defined,
therefore, GPIO196 cannot be used.
Correct the range count to match the driver.

Fixes: b888886a4536 ("arm64: dts: mediatek: mt6795: Add pinctrl controller node")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index ae2aaa51c9ad..134cfa77e3b1 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -371,7 +371,7 @@ pio: pinctrl@10005000 {
 				     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&pio 0 0 196>;
+			gpio-ranges = <&pio 0 0 197>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
-- 
2.53.0


