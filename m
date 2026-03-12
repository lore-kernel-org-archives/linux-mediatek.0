Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B019BFED2C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 04:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZ55cAz0uNCrHrnWbm2bWX9AINXdiqVYlgBemqEfZdI=; b=tR573WdLZ3mD0m75f8jYJGVKvB
	aljA4pKlmXAyFvXO1Y3x6vrBwc0lMuSiTVHrw7nKiGOzOyyJbmEcXVOPvfVnDAPE3oTEmACPISpWn
	Y5nEszCZT+7KrgpvxxNP1jFvv80WFTxsrO6D5oDtw63DsqWmfgYfyse03484iMNmY23YV1LR6QI9+
	pZ0CwkJ/ZBWj61USxY97j3q5ZSbY4gR8SDUjy+JAm/nLriASEl1ma8GdSIQT2YFKj0dx/+bydws7U
	1rRGiENWh6XP1Cm3YZU/0ZNNXSW3FQ9e1CRaWH8qQgc1NdNjDs5EqM8loQlSJibmFgWNwWZN5GNxr
	pCVCCGaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XTG-0000000DEQL-3P7y;
	Thu, 12 Mar 2026 04:16:26 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XTB-0000000DEKl-0hiD
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 04:16:22 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35a132767c3so192176a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 21:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288980; x=1773893780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZ55cAz0uNCrHrnWbm2bWX9AINXdiqVYlgBemqEfZdI=;
        b=FdsyjU4+np2LcwliqkNlxXWMUUr/wAn7WdvyaUvxBOhYe/+6PT94z2NqqJzp1W8EL9
         L3G7cAoYQhWktyEjBaGCUiekN8fUf/DGCpPhLbh57cq/e6z/GJSvEfcyUPUtOqstci1j
         NuPP54X3j45Df9ySWXtI0viKf1L6KwNUAU9MbRqa4tFNrsY2Xl28LePF+r8jzWZrdcyB
         zq5y9XCLMmeipCStEd86ZXEUcn4dsZVw4XVjw0RrUAe2Vi3unDlmsECVUl63LyIgSmjE
         i0FjsefgmY4yKWWeK83af4OIuC3tdYdjaOCRtFb7jGDE96pYMB7X8I4iGzyGNTBvts/y
         oeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288980; x=1773893780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aZ55cAz0uNCrHrnWbm2bWX9AINXdiqVYlgBemqEfZdI=;
        b=L++WC19Hgi7VdP8AtXRVk2dxiBs6FUpOYUBNRyfuE64JojqF8NMq5zJEcfKdFOt6kE
         XtEZRLcFug9FGEH2qyHnh+jqvM8TMblL/5fVe/6eqCTlqglGtSpls9Maii9YGXGVVwDs
         UNTLNJLOGVAJHy5+ez3taC+4UWS+twCLtQDGFRw+WtNICSmjas4nVopwTGhsdUURL6tw
         RX5J+MGfMt/URopOxrdkBRN3IYDe1Fn2ve7yCHOJ22L3YjYY6o1EF4G79HGUU4yVVeq1
         ccx4KC4n7FxTHkvUItz3IffJsqUVz5zXG7jn8FIps2CYNwdthIfs8Hlqyr1tC8jiCW6H
         EGsw==
X-Forwarded-Encrypted: i=1; AJvYcCWxp263RIBELhKDvy6CSn2C8gv2KZW7r2JWdV0YdN04udMKNU7ed2EHzbkmcXbLQtfWk34hzAIHrW0eGsxgMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHPF9zJJPpVFbPQEBrZW2hSsG3rS4YT96NPfVXJjs68q4LS0Bi
	pdCcMqrZn2ivOnSw/OBkhUSYqBhbaLXKU9B5Kz+fI+/wtZOKZAMqkh4w
X-Gm-Gg: ATEYQzxODW4Ef740YijB5Krr2RExSHLG499LhzD39mzDJ5FSjIyJffXCO/KJZrdeolz
	9kyE5fs8wqVGzpfm8/vKg3UHYQMeajztchjmdMwiGSuCFg9gE9P+wCnRBUAoDm8+GtuLfA+UCYA
	49FaGhf58UWu/27GAly5pGWUfWtpbDmcbvb6unzu+ywv5WGROKImJkULyQnuQyu8JEMekrIs/Jb
	NA7mprsS3THzEresltrDmKwLZeQ35+sSWP7w85C/IAwlMJckXKPktW4x9OPznUlVYevm1aENS9A
	GUuam0+vItpuRLlioZqRydTnejeVwhiqqEexBvjXoAYWRkbsls2TYjW2INrMZQy3rxZIX+fZMH3
	uP/4YHXdDc6LP2AJ73PS6AadK41HNJnSYaWjjf0It8VryB24hY5cnF2TD2o6FQTgD/WRXzb3c9v
	yRcXBrJ08mQUO6uE3wfIdhhUOZ4ImAm6ucHAMzC9XA13yjC7Bcpe8JCLITm7yg3pwSl14aV/6pS
	LWARfs=
X-Received: by 2002:a17:90a:d60e:b0:359:f4de:8084 with SMTP id 98e67ed59e1d1-35a01323af3mr4560816a91.23.1773288980433;
        Wed, 11 Mar 2026 21:16:20 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:20 -0700 (PDT)
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
Subject: [PATCH 4/6] pinctrl: mediatek: mt6779: Fix include guard comment in the header
Date: Thu, 12 Mar 2026 13:15:31 +0900
Message-ID: <20260312041533.187553-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_211621_697355_BF4225AE 
X-CRM114-Status: GOOD (  11.84  )
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

Correct the mismatched macro name in the #endif comment.

Fixes: 920e469e15c8 ("pinctrl: mediatek: add pinctrl support for MT6779 SoC")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
index 0a48d6686ebb..d9404c9f6479 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
@@ -2082,4 +2082,4 @@ static const struct mtk_pin_desc mtk_pins_mt6779[] = {
 	),
 };
 
-#endif /* __PINCTRL-MTK-MT6779_H */
+#endif /* __PINCTRL_MTK_MT6779_H */
-- 
2.53.0


