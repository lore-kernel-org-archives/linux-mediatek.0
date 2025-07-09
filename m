Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB59C83F0F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jul 2025 16:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbTmzkj5bx9hqI1J6tJ2tUhaqDl2dEmQ2iKfN7GUYSE=; b=5BfvOzqBMtW2H8J4o6IPPFLDyJ
	M5gD/FTI0uXd3hlLHfq6Dw9AohLkT+cqNisx1q5n6z2551s8P5eRuxL44q1ZznD/mEI+L8O9msG5I
	g+QJQoJw3B4dOLM7lvK3Vg5IsM+MNFuYDqL6KjLFsuMReDo+h934kfzsFp8L437Lfg/t2CTKjE3Iv
	JsndJRC6YWhXn0i5qH9J6Jdu1ektrAsWd5dN1XWHNBLAYhWYkYDB1BHZkjIPnkUHH0Bh5tF/ftrsV
	n07Hhg91FV396m7CpgN5jKqtGkuU9LAypLMEs4duQfJKjoV9LDYTDieK8XS7m0+lYPjgywUQESvIu
	05dvDLGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXxB-00000009LTg-2OZ9;
	Wed, 09 Jul 2025 16:47:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVx2-000000090dV-0fzG
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso35772205e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Jul 2025 07:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071950; x=1752676750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbTmzkj5bx9hqI1J6tJ2tUhaqDl2dEmQ2iKfN7GUYSE=;
        b=Gl5N3AzwRJi9R0D0gjrUlGicD2Dgw4DHdKCtQayzb5mvxV/rgfUjxCHvQEGRvrFK89
         XGKijOUlq/hKFeM122ivf4I6yuBMCUhrI2fQWrmERXWOznGkYD2eqFPjrLsZ6vNEeMaL
         LVU82OliZfPzimF7+cwQBQUBmoH3OSvGIcm1UDYblbmAMrHKNO6BfU60fgIUq+QAbjRq
         lu6Qge8x+NRHxH7QvML/NoI7YOcVuiDDwwCkjU6JhZ2IuICH6zCNv013x/BDa+g8LjHt
         lbR8Ldq6okuPbwtccdlMdJVSJNaXN7QPdQs9WyFa+O5AIOwWJbn/suwZUpW1lMSRetUH
         QnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071950; x=1752676750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbTmzkj5bx9hqI1J6tJ2tUhaqDl2dEmQ2iKfN7GUYSE=;
        b=QjAVK6rIECgfhdVhP1GB/Rf1PtUo1hKJkWUhrxMxxAz6FqAgsY00CjM7W33dPCUcoA
         vRdk08MB1mQ9SD3fsTR3NfxA//Inxt3Mg2uTJEx56BW3MiFR/kLIXiqva0m7Rc8sOEVV
         w7QC+b76R6Mfh2Bu1d4ooNY5csreXspELH377H0Kcxea0KaW9Adn6YOU3J13G4ADEmDp
         p5jbRetYCRW8+peOKK/aJWWg4g71diW+2R1S2J60pwcauFBSvz8J7OHSeNd1Mwzt5Ua5
         gbCbH/4NS/96F8z2D5Uu6rTsdTcSpPCvDeTh/+pXpuGqsgWFB6X/PkueYDkDOdtz/CTz
         EnPg==
X-Forwarded-Encrypted: i=1; AJvYcCWTFloYI8Zp7ti7HYNMFBPitsjK8w37g9ugWawHfES1xb81TNelpuOyhY2BPjIuhk8s27uWs64AKoHvk0Sb6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxprnL5tCPtlbLznOmsE48w9BNaJfJSf7kv43/WCLHuyqQXsMHg
	wcmjVgywZfiUQvqQRE1+P2cNtutMg2NEUmwv388EVicl1Q4bTf5jgw/6A3jgNkL3p+U=
X-Gm-Gg: ASbGncvUfjKAZtHaHVaHMy5Yd5b92uvg3krJzqpg/uoKjrOnRHDJ8WCywu9ut0URBbk
	yNYVKs4OdreXvQ+/jk1h3n4FXshHhQa2O3Tz8ImsdHIHanGVucC2QNHlyiNn4EDhUGVSspirUiW
	y86P11SDR87ewkvSNAcGoINjUFCOm/bwL7aQ3b9oi6PP9jyziZqT7mQgA4SJZm970YWZ46Qlk57
	/d4s0H3qJ3xR511pZ0f8h8jgPyEuqXUZ2qJUubI56xcSnJkGts3OY0MhIG/OeCQxW2Jg2lRxBZP
	iCljF6qFP04yM2y7zF2GCtOqihMZIGp11FZ9AOkKnF/yNMVEApGGAmE=
X-Google-Smtp-Source: AGHT+IG7dTgqRsBY9IH10Hah+GK6+ws/Aqt50U/XubghXVDr0XTaMm1YapebW+fcF0tbgN/aSQ7qRQ==
X-Received: by 2002:a05:600c:8b6c:b0:453:745:8534 with SMTP id 5b1f17b1804b1-454d5311814mr28438025e9.12.1752071950476;
        Wed, 09 Jul 2025 07:39:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:01 +0200
Subject: [PATCH v2 05/12] pinctrl: mediatek: moore: use
 pinmux_generic_add_pinfunction()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-5-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PaoUd9pQ9Z9p4YRFcKkVOtGOvLlMkYaRSVbJV09EwEk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8GSzBDRg+86mcxYjd4CtCwJciXy5c415gCM
 mNUFmhqAquJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BgAKCRARpy6gFHHX
 cpLbEADMbvWcz55XbVdG30TNx5PJ1L7YL7I/gyTYo7Nr56TDm8bcBW/bGe1Lza3s85yT9b27xVd
 tpRH6IxKjYilWPe8vm++C98rzrKPdf53zin6oXX/o87YG5c6/6JDbgN/pOBwEZg8Eb3BG1Y5JT2
 Tg3+fsnjosmmA73uIMu5HO5ZtBi9qfq9YHb+p3Lxga7djFDCjD//0SGjNRisto/h6/HPfzxzQhK
 A7pspvX9CelxQa7FSn0wZQ1PYgLxKKE94GVq5IQVBRmQw/Bf+VrxSyNTozRSLl0b1TLYa/B1ywc
 1LkTfqqnfB6JHzpPJPTWFj8hSsrdTj3zto4IqyNSMvt7SDeiO9L2/yBF+tJSQdiocF3zBq4uS6j
 j/I/Xz37CiQOXrTSQjs+u/OBTT7+Fy28Nx33YVVoVcxeNKmLu2ukeOz6qY2AK+aLlomnJu9XddS
 CwgJOu2mpUws2Us+eKo+CD1UOG8TYK8kXqxPSWPsV4l54IEpTfPiOuva4DxjqwJ7+cbhgohakWl
 /QNUHjRgM+f5LhtLaBN2/aSoWlUKZL8pn2jmqvrEzuUD+p4gFktdY+/2VJQoZqIgJOyWDGoVqDz
 7gTekXcN/ouYNt3HVWbJuewtoErMvswWBAYa53HIbFq64yiMj5jXWA7a3zyEzgP6Ijff7FV0vdo
 G6TJtHlvpjO0wyg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073912_194252_2D292C5E 
X-CRM114-Status: GOOD (  10.66  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of passing individual fields of struct pinfunction to
pinmux_generic_add_function(), use pinmux_generic_add_pinfunction() and
pass the entire structure directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 827d0f1910310a6717adb4d61c3d395105806501..ba0d6f880c6e1624720f0ed8e7b36e4734dda004 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -625,9 +625,8 @@ static int mtk_build_functions(struct mtk_pinctrl *hw)
 		const struct function_desc *function = hw->soc->funcs + i;
 		const struct pinfunction *func = &function->func;
 
-		err = pinmux_generic_add_function(hw->pctrl, func->name,
-						  func->groups, func->ngroups,
-						  function->data);
+		err = pinmux_generic_add_pinfunction(hw->pctrl, func,
+						     function->data);
 		if (err < 0) {
 			dev_err(hw->dev, "Failed to register function %s\n",
 				func->name);

-- 
2.48.1


