Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD96ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 13:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UF9bSlgTrHZXU2jrr9w6XSPWJzUj9rf6ysrOlqPBLlQ=; b=h2yO5DiV0cTkSgmTODf3/pyd4s
	L6mjlg0Xmr1dmp/8i7F1ligf0fUcphySk5hoFzAZWmf9M96xndlRFczFsA5DowIxZvDkOG1bjm3rK
	wJqHcLEaarfh2jzJ6QH367zmANibP0+ouf3Rj5wpnR0fYwQSZRLQaOUAA7ZNELeJqwPYD7YDOPTCl
	dE0FOc4vPYu7VR/ce3gHoWZXk8y+SeqNYP7Nujz1dx/YyESNt7y6Dzr6Ke724gpluIgCNGXjMGksr
	MEi1k3bJUothwTDhYiHnKyB8JlMrHrZNVQ2ERdO/5e4nI/7JEXudGw/RZUwyk40eZrIXWe/iTbcJV
	04ct3CIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneqF-000000029O9-2Y0d;
	Mon, 09 Sep 2024 13:54:07 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snenw-000000028Ya-2x0V
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:51:46 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a866902708fso26992766b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889903; x=1726494703; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UF9bSlgTrHZXU2jrr9w6XSPWJzUj9rf6ysrOlqPBLlQ=;
        b=lHCcRbtxSJBi+mZUpJsxo9mFP6EXRHJV9ApB08pBTDZ82E7860bfW02sWPOgSYbmF1
         iyulh5BHNAhku1lIrzndGZe32iKvBJDxffJ0nL2fxt0/XLUS5LCNMTOJxHV0R1tO3ttL
         jTu17XFJXxwBBSG1Dp3Sx0WcosBPB8fz/QCs26KxXpfgvHXzDgmpnSzHJcWGtkKTB5Ph
         CPZHAiH6PCHu52WTgqrdK4P0nHQhGBbf68IeI+UHkrxIXn0cv8B6WoE+LozT9tz8Frsk
         kxM5ytXFVJTWQTfUVNLwUvoQcnEgckM43AjZmaW1a9phrwiEiTQW9+2qIEBL+q1q97fU
         cR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889903; x=1726494703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UF9bSlgTrHZXU2jrr9w6XSPWJzUj9rf6ysrOlqPBLlQ=;
        b=WVy5dCAhXrnIwFFn7VSnVfyVTd6f7UfLuZSiBXuwvTyDOA2+rM1GMVfA7QxzcxdoQi
         Mr2JWQT12YfSUd+V0iSmSQAc2ae8iYtwwJdz5aen/TbIYtLBRAjPezDCXjDoH180dKbp
         fjaYhEB8Hk5x2Lgs3Zu2zR4DLA/kAcBg8HekbV7HeSUPeWKlA+tjnVzKjWEAI4xF3nJC
         cc6MtlngsPgGm6PUkbCXSTKVkZ6V0090eqI0vTpkG2x4sNhTZj60PCaD6nHy/BszIvQ9
         8V1kcaTHkrwapJkoVpdAMuOXeuwuqpTGkdkj0QekWDeNpypyxrOwruCLxEGzF0OxRqi5
         BYdA==
X-Forwarded-Encrypted: i=1; AJvYcCW/4Iu88qQm02wiUE9Tc5bkvDQF71OXHTJ/lgjsbUgVGj1EDBa1/IJCb2rjrv/FjB+0pTQzud9BAP/d0SDxCw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy37pZazgJYhZ2itsthxOQN5Dm5oUifyOWLEti3h7cJQQSw719e
	MqeOxmb9LEmSTkRfE1PXBJGJr20L9VSc+v8EeyFJvdAFU5Js4fP3nWtcLqgKh/E=
X-Google-Smtp-Source: AGHT+IGzPvI+dNamtmIacGvq6lHaBkBbNG8nqVfsI23RPlJzpDknyE6uAERdml0EtHCTzcwGG+S0Tw==
X-Received: by 2002:a17:906:4789:b0:a7a:a3ad:6007 with SMTP id a640c23a62f3a-a8a888e03c9mr343909266b.8.1725889902504;
        Mon, 09 Sep 2024 06:51:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:14 +0200
Subject: [PATCH 03/17] regulator: da9063: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-3-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cimxQ+TX+25hf08Y2OSBWqQRlO/c5kpOqNI/3js1eFk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1aJDym6wmOtLH5Qt5LKDk2N02AojxWKhz4K
 7VClE9YY1mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79WgAKCRDBN2bmhouD
 12+rEACRykGfztQAt5gbTMUTMyMn8xzuTgPdLneI0nYl5JLT+jE8VkvDxZUmTJ2z13t8uTC3sS6
 D9bTzkZna1q7VwPTVYPz4XAqUSsY9/vStht6IJ8I2/V4LQgW4XoI9ZT4qF6g2jw8p7GmAd3yLVx
 sCxAXAcXG2wRZLDTJc+4eebjeJt5UiETDtn3kl7N0jPEnMUjtAKtDiyIvOKorktNw3zeNhoS5Qs
 BhmS+DVSniKZ91YA2Pkx1znNJW+jcDa5LZecJdiZN71cq/mLhvY8IocBaxs9fA1KLHOQXsXyEDc
 ZI6qtIb9uSSyuhUtFIlkUiCsmDucfrqqz4HD7fudjO7qs1hcqVPSEHt0oXIIHfJ8FznXbE/gAvl
 vvKdRnxXMS+kdFTdo/PvN8mw7sQZAM7JxrJ/v4/tKxz5sEyPLUfWIN8hMGb0wZbo+2+GioGiXYH
 h97DafFKcVZQaiDlk8Ad8YiT7OrxkuAb/FKyoDLaLyWUMYcjGle3LCDZCz1d0m8lO5qin6wUBHR
 061ZU+JxWdGbU9cVoAJtaTlPfZQPaYxzhrMY8QqQQOLfZ8aAMN81CwMft0d4BDQvdH1r5T8334Z
 L94XDn9LI/rScybEhsQLmyWKku1AtA+JWCuJ/HOsXRm0mLo6PIDyGThxM39q2kJNo6bk1EzZ8Qc
 NsjeJtpj6cfgB5A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065144_936078_1B395FF1 
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

Driver does not modify static data with device variant description
(struct da9063_dev_model), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/da9063-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/da9063-regulator.c b/drivers/regulator/da9063-regulator.c
index 82bf321ae06f..4b5f1d6a4b3c 100644
--- a/drivers/regulator/da9063-regulator.c
+++ b/drivers/regulator/da9063-regulator.c
@@ -715,7 +715,7 @@ static const struct da9063_regulator_info da9063_regulator_info[] = {
 };
 
 /* Link chip model with regulators info table */
-static struct da9063_dev_model regulators_models[] = {
+static const struct da9063_dev_model regulators_models[] = {
 	{
 		.regulator_info = da9063_regulator_info,
 		.n_regulators = ARRAY_SIZE(da9063_regulator_info),

-- 
2.43.0


