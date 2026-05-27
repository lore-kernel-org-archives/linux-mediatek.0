Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2C3CD5BC9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 10:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uMqAYy/NdQZ0dbTb3sXUqWwu6ba89aldS/C8BcXDmE=; b=vGOvGJ6MVHSA+dE+Icc0XinGee
	FVMRxJcTzlwWLf2BKhF33PapBUVRWx7l1OGZIxSwyZOPf64S4UG3NSsYlbNuZSgcJ1/j/bcef5TDq
	Kl2Fa28zlfwWwsCHu13R7J89BbSefmdJ+cprkhjgQ14cTtsOtcj86kivuMdE7usBhThdc6g2ReZVY
	dbUzxsoPvOVTk3X1175cdkxBOUPNarNKPRYlUH91xrrIJHNoTNUBJGMomPJCLcJQ5hJ9j+vwr8X4r
	MrozImXZdEECTEWzEupKqVcxJMTyRiwSyxW0pFFDJcsq5al5g5xG34DaVv+eYkbaWx6heQ01XQvT5
	caYE5Ohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBo3-00000003xOy-0eQp;
	Wed, 27 May 2026 10:48:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBnz-00000003xLe-0tJi
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 10:48:08 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so6717988f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779878885; x=1780483685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uMqAYy/NdQZ0dbTb3sXUqWwu6ba89aldS/C8BcXDmE=;
        b=LMogHlC24aSnDiy1eI3hL+9Sg8WcT8+pPfskEqQZjBzJ27xs9vSh3EXYHmFe6Z+tfK
         5zgV5VMeeTfTubCOyQTIwvoDBRZqAg6XFMP0gIYeRv6hMvSdNvAkKhDeW/FFMgTHIh3W
         6LQQlYr8XHc9+WMV27hdeKHCh4AHWzsVXJKz9RYv4Vx5u92EhR0fCXUedB++NjlDHwZi
         3a2XJQuk9NuLJN7ZkENgGFKqAff5owwuJaqAzSTNgsrV3JHkB65VzKDHMzGH99GSqV9U
         6fimpnr1DJTfYRFkaJmOeamsd3bcNhel/Is5O39m9j7YMtXqM8ppY23U9GQdfzbEAKYe
         Hmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878885; x=1780483685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6uMqAYy/NdQZ0dbTb3sXUqWwu6ba89aldS/C8BcXDmE=;
        b=Us3wCujIXi6MGD1Z07xDkZRi4Btl8k3lBZwVIA47Q3/WrfOrrSuZ+UFZugt6MQFsxn
         cAYFvFujMrP48PdQgLMHUSy7eC6fyWdbNmC3O8QDgeOU++GfbZPQAvjCLgkoyUNcebbt
         qyaEQUGG2ZecYSvxJyYe5tdAEGs0WJv80A55hC7zq+Rtsqf0d8FZmWAj+NYyyDbLZbKW
         cKS6Aw9o/kO1kCopiNkBzm5PvdBr9telDpJ6pSNoNuQHE1vQERE3pi7KoDOMTzkBVRDX
         2QLGbmZ7btT4+ItUIdbIe6Del9ImJyc0WE8bPnhf/LU/Yedu8cj13VzwsmaQCX+v1DC3
         xFKA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ip4ayK10uZEAj3Sv7sW9EsiuOC13Z6GzbEltnKiGHdXQ0FXGnDyz+l3LOyGYGZT4VyEaR/D0ARpmoFk0W8A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+FpaJzG1T1/uFHwwSk2D5LmTX1Ew/e+P7EDipr+5wKLuIzb0u
	iUAbvjUPHt7+f1Bju8DJcYPNbocfIzEEgiH2DVMEEpz8QXnGp7ZDI3oaGTK27syp6xc=
X-Gm-Gg: Acq92OHyGcBD9LouEsg2rQtsElyseG29Lh9nQRnEG5YEqp9SOLGXcCKg3Lj1vsJBVAV
	jyhAF5rxX4WlhYZHPZxDdFZ8M9a7TcRhi70OnbQZXfsOpJ5zAOfxpprvIm9XyxIKKOXoNzIfpFy
	ZZdraqDytrBW2wtSN2QjV919N/O9Jl3x4k9c0R6DbnhecdU5qi8+2re0GI9nhFv+Lsx+AR8OQi+
	fSHuwaFXxX0kQ27aXbBr2BTTKqFVsjSf+n/BJNmlujQMUdZjI/PpiReINHwe/OLnSaSgMgo3Ka4
	a4hqg9gCJpmNb++niaIfdTqfDVZzgawhYYa1qDZ/R3xL8yDTylfxNulzgTn5TKXjb9Yw+EsgAKc
	4qmqfCn3T1LvkTO2J5ZsOKV/I+AzToImgE0DvZUj2UFT7bO/Czw1D+8W1yYTPlV7E1b0LUhJ3Mw
	vXUJmt2yGiD+dgLwAE08l4ykf/HtL853Plp+9ZXegEJoE45iYUH/pd/9QaJEOHA1r6KkBJSBXoV
	rlk6S7Zyw+nowqtHGtzKoHlbg==
X-Received: by 2002:a05:6000:144c:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-45eb3692577mr37040941f8f.9.1779878885224;
        Wed, 27 May 2026 03:48:05 -0700 (PDT)
Received: from localhost (p200300f65f47db041edccd9970843bb8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1edc:cd99:7084:3bb8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45edb5b1a28sm5195367f8f.26.2026.05.27.03.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:48:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v1 1/3] regulator: Drop unused assignment of platform_device_id driver data
Date: Wed, 27 May 2026 12:47:44 +0200
Message-ID: <613cd1bed263c2bf562ee714595f6d57f442804d.1779878004.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10220; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xYfigDtZq2pBPbj7YsS6TXzKLKqcf4xWEsO/edRfWw4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFsvVAXrNs9XSGlW4W7s3dAE55jD79QBWWREDb SLAmGUEgRGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahbL1QAKCRCPgPtYfRL+ TlP4CACyb9zVjOZFfpcQ0Cx83+n63MR0B5bbBpy4vwgPezWT0D9iDD69hNRRE7NzLHwm2APlysu 64/e2tCsMZUIn8XkEXlf1M6SlPV+KNfpGWSsO98yvTn2x8KyzXtI/jYe/gj8wz+6truOCNakVSr Fnlc7p1pKJRgCwnkuolFL7ETeIN9M38KkpQ9qlJGntqntpEURm2vbDFyG6FJTFfcDJUY89uIpvs BD8wQMDXXPVoeP5XRe6Ou1do4diqWvvcDZt4/dynuQqYlCK1aQfHuInaBxgsTsa35SwcuuIaV7g oUJAFR2Oo+L+qFNKtD9Nj1lMHxGZDvtiYtufMLC1T8VuTqhs
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_034807_313096_E897C7D4 
X-CRM114-Status: GOOD (  14.81  )
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

Several drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments.

While touching these arrays unify spacing, usage of commas and use
named initializers for .name.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/regulator/88pm8607.c           | 4 +---
 drivers/regulator/max77686-regulator.c | 4 ++--
 drivers/regulator/max77802-regulator.c | 4 ++--
 drivers/regulator/max8997-regulator.c  | 4 ++--
 drivers/regulator/mt6323-regulator.c   | 4 ++--
 drivers/regulator/mt6331-regulator.c   | 4 ++--
 drivers/regulator/mt6332-regulator.c   | 4 ++--
 drivers/regulator/mt6358-regulator.c   | 4 ++--
 drivers/regulator/mt6359-regulator.c   | 4 ++--
 drivers/regulator/mt6360-regulator.c   | 4 ++--
 drivers/regulator/mt6370-regulator.c   | 4 ++--
 drivers/regulator/mt6380-regulator.c   | 4 ++--
 drivers/regulator/mt6397-regulator.c   | 4 ++--
 drivers/regulator/rt4831-regulator.c   | 4 ++--
 drivers/regulator/rt5120-regulator.c   | 4 ++--
 drivers/regulator/s2mpa01.c            | 4 ++--
 drivers/regulator/s5m8767.c            | 4 ++--
 17 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/regulator/88pm8607.c b/drivers/regulator/88pm8607.c
index e6c436955e25..969554725a67 100644
--- a/drivers/regulator/88pm8607.c
+++ b/drivers/regulator/88pm8607.c
@@ -371,12 +371,10 @@ static int pm8607_regulator_probe(struct platform_device *pdev)
 static const struct platform_device_id pm8607_regulator_driver_ids[] = {
 	{
 		.name	= "88pm860x-regulator",
-		.driver_data	= 0,
 	}, {
 		.name	= "88pm860x-preg",
-		.driver_data	= 0,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm8607_regulator_driver_ids);
 
diff --git a/drivers/regulator/max77686-regulator.c b/drivers/regulator/max77686-regulator.c
index c7b270fd9e0c..3a0156f4d6e7 100644
--- a/drivers/regulator/max77686-regulator.c
+++ b/drivers/regulator/max77686-regulator.c
@@ -517,8 +517,8 @@ static int max77686_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77686_pmic_id[] = {
-	{"max77686-pmic", 0},
-	{ },
+	{ .name = "max77686-pmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77686_pmic_id);
 
diff --git a/drivers/regulator/max77802-regulator.c b/drivers/regulator/max77802-regulator.c
index b2e87642bec4..4c05cc9c4bd2 100644
--- a/drivers/regulator/max77802-regulator.c
+++ b/drivers/regulator/max77802-regulator.c
@@ -546,8 +546,8 @@ static int max77802_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77802_pmic_id[] = {
-	{"max77802-pmic", 0},
-	{ },
+	{ .name = "max77802-pmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77802_pmic_id);
 
diff --git a/drivers/regulator/max8997-regulator.c b/drivers/regulator/max8997-regulator.c
index e77621b6466c..e48ba694a906 100644
--- a/drivers/regulator/max8997-regulator.c
+++ b/drivers/regulator/max8997-regulator.c
@@ -1152,8 +1152,8 @@ static int max8997_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max8997_pmic_id[] = {
-	{ "max8997-pmic", 0},
-	{ },
+	{ .name = "max8997-pmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, max8997_pmic_id);
 
diff --git a/drivers/regulator/mt6323-regulator.c b/drivers/regulator/mt6323-regulator.c
index b43da848a06e..bac226812b0b 100644
--- a/drivers/regulator/mt6323-regulator.c
+++ b/drivers/regulator/mt6323-regulator.c
@@ -401,8 +401,8 @@ static int mt6323_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6323_platform_ids[] = {
-	{"mt6323-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6323-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6323_platform_ids);
 
diff --git a/drivers/regulator/mt6331-regulator.c b/drivers/regulator/mt6331-regulator.c
index 0059f88c6fd7..eed9dda0481f 100644
--- a/drivers/regulator/mt6331-regulator.c
+++ b/drivers/regulator/mt6331-regulator.c
@@ -487,8 +487,8 @@ static int mt6331_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6331_platform_ids[] = {
-	{"mt6331-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6331-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6331_platform_ids);
 
diff --git a/drivers/regulator/mt6332-regulator.c b/drivers/regulator/mt6332-regulator.c
index 8d8331a2aca5..949fde37617c 100644
--- a/drivers/regulator/mt6332-regulator.c
+++ b/drivers/regulator/mt6332-regulator.c
@@ -402,8 +402,8 @@ static int mt6332_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6332_platform_ids[] = {
-	{"mt6332-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6332-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6332_platform_ids);
 
diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 2604f674be49..f2bb3c1523ca 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -724,8 +724,8 @@ static int mt6358_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6358_platform_ids[] = {
-	{"mt6358-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6358-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6358_platform_ids);
 
diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index af0e0339fbdd..7bda382ddd81 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -1130,8 +1130,8 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6359_platform_ids[] = {
-	{"mt6359-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6359-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6359_platform_ids);
 
diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt6360-regulator.c
index 24cc9fc94e90..ed25e9603b2b 100644
--- a/drivers/regulator/mt6360-regulator.c
+++ b/drivers/regulator/mt6360-regulator.c
@@ -446,8 +446,8 @@ static int mt6360_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6360_regulator_id_table[] = {
-	{ "mt6360-regulator", 0 },
-	{},
+	{ .name = "mt6360-regulator" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6360_regulator_id_table);
 
diff --git a/drivers/regulator/mt6370-regulator.c b/drivers/regulator/mt6370-regulator.c
index c2cea904b0ca..a4ac4a42c108 100644
--- a/drivers/regulator/mt6370-regulator.c
+++ b/drivers/regulator/mt6370-regulator.c
@@ -371,8 +371,8 @@ static int mt6370_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6370_devid_table[] = {
-	{ "mt6370-regulator", 0},
-	{}
+	{ .name = "mt6370-regulator" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6370_devid_table);
 
diff --git a/drivers/regulator/mt6380-regulator.c b/drivers/regulator/mt6380-regulator.c
index 83e50df7f7c3..da901a75137a 100644
--- a/drivers/regulator/mt6380-regulator.c
+++ b/drivers/regulator/mt6380-regulator.c
@@ -314,8 +314,8 @@ static int mt6380_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6380_platform_ids[] = {
-	{"mt6380-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6380-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6380_platform_ids);
 
diff --git a/drivers/regulator/mt6397-regulator.c b/drivers/regulator/mt6397-regulator.c
index 92a2d92f84f9..e68df86ca4d9 100644
--- a/drivers/regulator/mt6397-regulator.c
+++ b/drivers/regulator/mt6397-regulator.c
@@ -392,8 +392,8 @@ static int mt6397_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6397_platform_ids[] = {
-	{"mt6397-regulator", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6397-regulator" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6397_platform_ids);
 
diff --git a/drivers/regulator/rt4831-regulator.c b/drivers/regulator/rt4831-regulator.c
index dfc868a24056..5c47fd57fdef 100644
--- a/drivers/regulator/rt4831-regulator.c
+++ b/drivers/regulator/rt4831-regulator.c
@@ -186,8 +186,8 @@ static int rt4831_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id rt4831_regulator_match[] = {
-	{ "rt4831-regulator", 0 },
-	{}
+	{ .name = "rt4831-regulator" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, rt4831_regulator_match);
 
diff --git a/drivers/regulator/rt5120-regulator.c b/drivers/regulator/rt5120-regulator.c
index f0d3efd160d4..a2a13ce2e67b 100644
--- a/drivers/regulator/rt5120-regulator.c
+++ b/drivers/regulator/rt5120-regulator.c
@@ -401,8 +401,8 @@ static int rt5120_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id rt5120_regulator_dev_table[] = {
-	{ "rt5120-regulator", 0 },
-	{}
+	{ .name = "rt5120-regulator" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, rt5120_regulator_dev_table);
 
diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa01.c
index c22fdde67f9c..8171503861c1 100644
--- a/drivers/regulator/s2mpa01.c
+++ b/drivers/regulator/s2mpa01.c
@@ -367,8 +367,8 @@ static int s2mpa01_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mpa01_pmic_id[] = {
-	{ "s2mpa01-pmic", 0},
-	{ },
+	{ .name = "s2mpa01-pmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, s2mpa01_pmic_id);
 
diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index fe2631378ccd..2794245d4042 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -916,8 +916,8 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s5m8767_pmic_id[] = {
-	{ "s5m8767-pmic", 0},
-	{ },
+	{ .name = "s5m8767-pmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, s5m8767_pmic_id);
 
-- 
2.47.3


