Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1970C25B79
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 May 2024 21:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mStJOZyJxaV4Sf+0e36HuH21WV0+MF5MEQ/HmeAZn+w=; b=yqi1i4ny9Rt3k2MMyk2dmmTKgx
	iBbw/la2dwBkpSqAqaMuHGPS0xo2uM4ewmuS2GQ8RmXBI40NavSHTLKMERA1ljcCq8XjxE109ldH/
	Oq8pLTAcStl6aJTSutbQXG+ClprEy2kU+QAVKkkqELg0AIo8FaCoU1ZX9LFG79W2hJ483q/fQNStv
	tjqLU8xyborVkVuBn/p1HQmgXXf8lirz7loo9Q7d/CZsrS6En65NayTJeNEUWwc1WZx7h/U5PbAfA
	OxTUXpvg5g85Ny7p+h4FujZ8/c/7lNaUB09tpyuYm7kfMMohSj+ULyeGiYdrKkW5vaDstNEaVJWvb
	tY8CVioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8RLm-0000000AnMh-2ufB;
	Sat, 18 May 2024 21:12:19 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8RLh-0000000AnJ0-3GQJ
	for linux-mediatek@lists.infradead.org;
	Sat, 18 May 2024 21:12:16 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-572af0b12b8so5908564a12.2
        for <linux-mediatek@lists.infradead.org>; Sat, 18 May 2024 14:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716066727; x=1716671527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mStJOZyJxaV4Sf+0e36HuH21WV0+MF5MEQ/HmeAZn+w=;
        b=xZ3gRA+Me8atKEO8xVBBR21rYLChtT00iskEdW1bew75y3hQA1e+9FMx+8QBj4Zrvm
         Sw57Bi6mtuHn+tDOHBGwhD/GSnkLEDXXUeMDsoptK6AULja+0l04PaAcdtvLEpP8lh57
         v33lnA+iXrFGAhHEIbRS+20wKJCgy0RKAB8579to4vqkf05Gu/U84ze5n4NDlc5Hfyho
         Xr77MrZxSbfOqtBHl4sXJ6RzN+t2kr9RpBbeA15TtXJraulHBcfdbzy/cpbQaHd04ZL3
         moOh021zVR+moy5Y++FpkmYDy+3RKYCYOdvF3fNvd5fNV4q57kw3p73jBXrVo0t1jBWp
         c8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716066727; x=1716671527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mStJOZyJxaV4Sf+0e36HuH21WV0+MF5MEQ/HmeAZn+w=;
        b=SUFose2SVWKZ45jsKlmxlnFI4Z8nqwIBQM++8Pdb/UI7Jg+Q4HXojei4cI2bj/xI+0
         PJC/uheW5yqu4ecbmpoNpLqs6DsUsGQX7UKxAnFJx82MN1MxcxNoNruRlfOksdDa8S91
         SqgJ4wldwzNly8yR/Zx7SmZEOmjQdDji3KJHQepxJkOg1FI8vgEYeyfRfncIRi5dmsLi
         7VxRgh3hk3n62CB4T/KxMPdR4OdbapJFTtYGNP4EPfVe6uPLb3CQ/E5JpsTW4vT9qbXd
         9FX+zevPt6v9ffYBRXyol9p4wCdetDG3HHh0f2dVIAGtzpOnmdLBZPnSXPPF1z421h3B
         r4NA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Y7cwPzjgcqdSipIo5e1S5sTjp5L50j+saqG4ve/bZcaA94FDJWyDpKqtlDRnjj7sagbizfZ/zs2O6V7OclewU6KdfeiM6hG6aA9InNnDphPD
X-Gm-Message-State: AOJu0YxgoweRWp9XayFnyOKnEemoxq/SBi7ON5qYc7chHFvjx3m29U6M
	IPp30IIB9G8ZP8Oih1+w/1+zdKFyWfj3iMwN4jMG4DiEJSzu09dY2PWyvhwUtEE=
X-Google-Smtp-Source: AGHT+IFyPVsATNUTmbolTM+aWrNiRvkqe73Bxw0huQJz0whqeZnLtrpr55PPw1QGKoL2hVm90QrNwg==
X-Received: by 2002:a50:d7c2:0:b0:572:68a6:97c with SMTP id 4fb4d7f45d1cf-5734d5ccb06mr16307954a12.11.1716066727539;
        Sat, 18 May 2024 14:12:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c323d3asm13151340a12.90.2024.05.18.14.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 14:12:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8173-elm: correct PMIC's syscon reg entry
Date: Sat, 18 May 2024 23:11:59 +0200
Message-ID: <20240518211159.142920-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_141213_990521_9D1AE0D1 
X-CRM114-Status: GOOD (  10.51  )
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

The MT6297 PMIC has address/size cells == 1, thus its syscon child node
has incorrect number of entries in "reg" property.  Fix dtbs_check
warning:

  mt8173-elm.dtb: syscon@c000: reg: [[0, 49152], [0, 264]] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 6d962d437e02..0e2439860223 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1138,7 +1138,7 @@ rtc: mt6397rtc {
 		syscfg_pctl_pmic: syscon@c000 {
 			compatible = "mediatek,mt6397-pctl-pmic-syscfg",
 				     "syscon";
-			reg = <0 0x0000c000 0 0x0108>;
+			reg = <0x0000c000 0x0108>;
 		};
 	};
 };
-- 
2.43.0


