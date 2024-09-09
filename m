Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D00CECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4nMk71Ror4dDuFejQdNMVkNcSGmGkDbOfs0S0Gk4o4=; b=zy+oMug375ComQYuqOBvE+RILp
	c0BnYtzCJiLQCPh0lUQWzOz54oZOf6xuJoPyuX5EppqZA2cIkBpMaZdFEo+Dv+0ZTXr2nnsyMPsV3
	WTxcrQ2XIVfUTLueb5mJHMzEKvJkvfFFjgHZx7MTZ4R7D1UyNubt+s5L7vlRLI2YruUKPQPqisKm0
	Expg/dZN2i6/F4JNzW6IfJWJaGTCmgNpe9driJmAeZ/54nNLLuC7Nz5OWzC9WtgOl3lvLtm07ifC5
	s9fNIPG9DIT45vYjTSb08AmCxVnfcYw5xNkUJ8fOOqOgpNJhq9FBKlSwwt21cIAE8YQ++J+P4hG/i
	/XQ4WRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snevR-00000002AoQ-0ZYJ;
	Mon, 09 Sep 2024 13:59:29 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneo5-000000028em-0RVE
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:51:54 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a8d302b6b30so8522266b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889911; x=1726494711; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4nMk71Ror4dDuFejQdNMVkNcSGmGkDbOfs0S0Gk4o4=;
        b=gblslyPPfVCEinXV26L2f+MgtYZ9fHje6XMVk5dCOFz5l/b4Gvjbt08ZYo3NDA+Pm5
         uh2soqEob4Ugh9CCdYSdlTq5xTaSJpeDnCWUAa6niSelfgC0txZ9K7WnQ3Asp+s4ybrH
         2BKplQIERgMrVyyozVoACC7hVTU1M8xh+HetCw8FuQgPIgmN3XeTe3kU1kb87EWBnOcC
         s3Pwd4/ZrwJm0VMwVug6cvxx8V76Qh09fpRVbKgnLPD0gh6ExF4w87ZAhl1bXwmNCqs/
         49KYLANW3y9nSgd0rnXMcM5X+QTWiYBGb5v6asL3plza3wJGGbQMUhQrVts3GDtLyvdU
         IvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889911; x=1726494711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4nMk71Ror4dDuFejQdNMVkNcSGmGkDbOfs0S0Gk4o4=;
        b=O7y3PYkl8hSXxBmDMn6gypYoIjDR5qj/U+Yns31LBRX6Scu+/GfA1A02QRTytGkFB5
         qRahLj656A1cux2Xx++VM0uWOUpe8cFWt0kM40YS0mzp7oFbxXhWJ7pCecUwjcd9dfju
         56wsGn2JO3YI2nkoggZOUlVTsujkgYYZYRB0OLouZKWzaj3/26YRdia5wWc+ejQQkFRw
         /Cz9CBq2H9UcSNQMVIZww5HAAApokinSHGi+27sMjUDJazNhW57Hds3KqeqpZdDfeikq
         5/FgpAij80yL8feAazlRf2WhF28STDyEe0TahcBvc0O0TymobFAj2NH2ZHWXVsI3R4fQ
         dP7g==
X-Forwarded-Encrypted: i=1; AJvYcCUwYA3RiyueE6LlxpJ8DtlIoibSkjUHEdb8XcBJrMGIobJh4EhZ4fAq+KNtEvufGXuAynKaawipRvGnztcZNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ70yzjgq+nvcbGYWwGI5K3yQqgGi9A0OAwKiVFZ56lv5gFmqr
	dYKWT+4XWA/68D+3W73NLMslKsUnmC5Hyp/pGfKMdLWCERpOcXiX4JwSHGxrIi8=
X-Google-Smtp-Source: AGHT+IF2PjCN56jaALnPx3R93ZXhQvgFBd1aE1EAodWyw/lW7I8GsseYFB7PzSZqIjBvJb78EvrSWg==
X-Received: by 2002:a17:907:3da7:b0:a8a:81ec:f731 with SMTP id a640c23a62f3a-a8a885c3265mr378374066b.2.1725889911134;
        Mon, 09 Sep 2024 06:51:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:20 +0200
Subject: [PATCH 09/17] regulator: max77826: Drop unused 'rdesc' in 'struct
 max77826_regulator_info'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-9-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=991;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rxHbd8ZN2Gnll5CmN6olaVIKBgECJTgaQrtvW4I7hxI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1gk6LT/h4VMebCtZMbJoCRkBZvx8KAMANRf
 n9s9srNC/uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79YAAKCRDBN2bmhouD
 161kD/9Lp6g4Ua2xpAlNHKFc2J5G5EkSOmL9wRmeRWCqsIzq5Ao0p02ZQ/8kTCNSxibJ8bPQuIK
 m64QJ0LFlP7nWIYw91ctKvfqnOy9UrHRju3r8U7TXRUYNFab/vQ3BrceR6gpzcLhFXvfTX5En9+
 JRGMtRd5J5AiGl5VBp5TIig09DqDdVkFCEpKDBn9zj49laVzNo+V3xue8dnGynTAxW9z2buAKmw
 gMI3QvQEEk3fqKFNxGFJExDUoC6NHK5qBENhj4+JjHPbYN+gS0KSxwYT3EfTxhE6ufKfpoQzaOX
 2bvZ9kMCCaaayjeO4s/J0YlxHCdjAnFy0iTRQ3Q+lWkWbCoYT8KKOU54FAEfvqVZl1M1lCQ6OeG
 lg/enr2QZKSc3XG6+Qld8the0DM7gOehFJyT02OTsv7Q4Mk93qun+f38yHQOuxZxJCcBmIZCRDr
 1udf/OsmXR9Gl0qG/QEslImmSd2+1Kw1McycPnPgPWMGc9hhQtxycEKTzCqDDS/+Pq8rgBZ23em
 Ck/jxoX3WTakTQHwWJBUqXjZzFeBhpEWY+yGphtd7kJMlyHZoHCbUfloX27j8SAas98RNlyQxpM
 Tt5GlM0LkHrEzEyWqRpdSva0G/5/lYGNTKtPDYZWm+xvCXgM4jEa5Zx8VCwN0F7GpxQwPiL9omy
 hTqm9UKegqYPonQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065153_174769_4EA07574 
X-CRM114-Status: GOOD (  11.53  )
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

The max77826_regulator_info.rdesc is assigned once and never used again.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/max77826-regulator.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/regulator/max77826-regulator.c b/drivers/regulator/max77826-regulator.c
index 5590cdf615b7..4b656a694108 100644
--- a/drivers/regulator/max77826-regulator.c
+++ b/drivers/regulator/max77826-regulator.c
@@ -153,7 +153,6 @@ enum max77826_regulators {
 
 struct max77826_regulator_info {
 	struct regmap *regmap;
-	struct regulator_desc *rdesc;
 };
 
 static const struct regmap_config max77826_regmap_config = {
@@ -246,7 +245,6 @@ static int max77826_i2c_probe(struct i2c_client *client)
 	if (!info)
 		return -ENOMEM;
 
-	info->rdesc = max77826_regulators_desc;
 	regmap = devm_regmap_init_i2c(client, &max77826_regmap_config);
 	if (IS_ERR(regmap)) {
 		dev_err(dev, "Failed to allocate regmap!\n");

-- 
2.43.0


