Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E47EC369C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Apr 2025 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSvrLQBfLq+B4ut1ceVEmi9/bo2rmWrizkJ6hXk1M/s=; b=tFPI0MRB4ytlWz/Z3lSnIzznmS
	DbECed+xeAEC+GlWT8aQTSsBZaIt8jOb/ib9SIbyA8R4lH9nsBPgkU0LvY9Znkpq98XhhEbZzlAGf
	8FScVVJuKGeXYWlpvmRsHs2N6of+nKB4tXfxvJ96QudjLbRTWvVOVSwYCFZMG0J8aZAcHZTUUR6mM
	nxV4f/kJJy2+wo/vNv51m79BylgG+AHTvlu8EiTHkCIL5Q4xP/g5jG/EyktmpO3gHUXi2UQ9mv7C5
	phqUuxo8kMV8eVd1vdz1BciLR0kU0yWu/fub4IXQ5CyBgpuDK1P3JOa92Z6IHZtHPUwKukcJSpCVU
	JoFhI5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Fxn-0000000GewL-0eor;
	Fri, 25 Apr 2025 10:07:19 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Evp-0000000GSaR-46Sl
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Apr 2025 09:01:15 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c0dfba946so1410865f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Apr 2025 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571672; x=1746176472; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSvrLQBfLq+B4ut1ceVEmi9/bo2rmWrizkJ6hXk1M/s=;
        b=3Y82qCAPZakY3IW9ie7EC6NkpHsj3oT2+KRVfFNh/AwaAE6MOyTZ85FfJx3C1SHnqg
         n3P071+H5xrPaW/Vtpg2lFLaoXvHXIsirM3HQ2dKzbsgiFMY9G62tvWym1fful91hXwP
         Hgooc/qW4m2Aqvxhf+X0MJ445H9T65NEZKbPfgYo9RU6q1BR3YJJV1vo0+2j8MpVyCXd
         HAOSQHNPxQk9dItqYzsFAnxJagmU2yQvQVVvZ8tkoDygqI4P39n4oEkSjzoZvUWRuzHT
         E6xyO/gsgYdZP/Cfqcur2LAOGgmc2N/u53/Nj6CScaaq6nx6GKkWlLPbvgJ6vP2r8u+/
         bw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571672; x=1746176472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSvrLQBfLq+B4ut1ceVEmi9/bo2rmWrizkJ6hXk1M/s=;
        b=GoOK4mYk3BPWv9ifAfFaNDTGmhzW25puk6c1ZdVSr47opZpY3c8mCwSlv1VqDoTaDI
         ADVluBl5e7QkcgtlFORhChvfg1LMIbv8NsCphB0kVQl7sGGJB1v6IUj9LjvsWBqIWUia
         f4YRGPGRul9zi8Hlsrp/j3GwMmZ8QfTAa4xAnvVmkwnvn9rLct5W3rzp0pjZGypmuMMj
         LM/8tl5AxeGLU756GvUfT9QClK07MpsoJEO5CJ3xeWUSIlzpBigeFn3YyOwqyhFR0ctY
         zm5lne6zC9UfVLJn1slNC27gsmLOVSBLw5A6R71DsyR3IMuU+B2o6L/Ctspa6eRnfRBu
         ruBw==
X-Gm-Message-State: AOJu0YwA7dQLTjg8HT+aJmt449+QqIEjoStzfHzJz1vy9Y7GijA3hZcD
	5Ja0ZLyE9N4HqFgBszHZE+6Anj0oFaCwmYChM193tPJTrLab8MrbED8R3R+KddE=
X-Gm-Gg: ASbGncuwzJla4CnPUoO6UArQnPkUZVn4EXmLzEmVLt9MElcaztoCHTdd29+mzvyXfJ3
	/uHe1CICdJfXDP+wg/Eph1h7C2o+CN0a6eAYqnaTszsygdXqDvuAg0VlKAlgi768et//t4XeCbL
	is73TNv0fLYjR1MwfgBkxvCa9BHDSLvn/ThKWQ+GzVJ1B8iKViGI3Y90iYbLiaV0aKt3SwGfMkg
	YVnp08Q0bbHat11e9VNWm8x5rcZpL3KSdkIWaMMxi7mVLNHTD0mOMODjltHQiSDA2wU3Xj8cNNb
	OnzuimBWqNei2LB6cVFhhO84SrhHlK4DRA==
X-Google-Smtp-Source: AGHT+IESAKBg/vUZr7+HdyTu7Zt6c8/2gvrqKe9AqCVjAbPvKvH7CRuaevUBHKKYT49ezlwSd/p7oQ==
X-Received: by 2002:a05:6000:290b:b0:39e:cbd2:9211 with SMTP id ffacd0b85a97d-3a074faf2f4mr1109587f8f.55.1745571672261;
        Fri, 25 Apr 2025 02:01:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:01:01 +0200
Subject: [PATCH 5/5] pinctrl: mediatek: common: use new GPIO line value
 setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-5-93e6a01855e7@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=DhR5Cx+h0tuPThTQMfkVBP7GDMglNgqo3TCYghOZtTc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09Q1qfvXLmie8Ad0KxRLSMtwSzORIC9DHLME
 ux5GcRSG1uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPUAAKCRARpy6gFHHX
 cin/D/wN4TReNcVZdJpBQ3ij4ORtqXCjpIzT8TejLJmPbAW7VRLBI73Sot2lYEh6ivMjaPGV+Ez
 ff8t2p6qHWL0XyeySWLjPm6Sa+nVqRjbyFGUOty8iQicWy3VgU0h6OZYaOlbXE3HSchUFE7AuvP
 l/20EdnceslbHDVHXe3uDbsWvxyZn5zCj0Kq78XggHgGsprpI2qVyAFDUBbwaWh+1+myh7YJx/X
 yJvdjTBEdvqoMiqeuJaYhx/t/paIekWXTGSEKqVdHPp1hzb6KRCrycp6u6jzsZvnNsrMKcXHxb8
 9/3Gc6GRcWE7CxSmBqB9B0mJTdhSHRZa3YIRQTpeMxWjxGa30VQ7vMJvHygVdwcFOueRtPlcXZz
 gU7YuuI7Ug885r7Xoodq798CBFf2KN6mjY699nAmfRjbxVv+FxH1WyP0WBmENEtDQ8VHxfPJbgP
 WWvfpj0aKZTuEMTvbguqYDv8tC6fjQApPkWtivimKfsAvwjsxNqFKKgcWTlaNMCai5ye1+WNLlF
 o2XVBinR1y8178arKTT0Sa1lWO97DQwu63sYqqlePtrT+KmXA6ixprYXzYR5iBLI0RZGMNF10bP
 T1xXXdlDIe8hx3XfKDVXoo/cUL60hAqfNjdG3/Z8zF7bbaR3dzsYYEOsDCOqiO/bRA3AGSM9R8D
 Y/dstQRT5IQGDZA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_020114_031117_390AFA1D 
X-CRM114-Status: GOOD (  12.15  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 8596f3541265..de7bebb9a6cd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -86,7 +86,7 @@ static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static void mtk_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int mtk_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	unsigned int reg_addr;
 	unsigned int bit;
@@ -100,7 +100,7 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	else
 		reg_addr = CLR_ADDR(reg_addr, pctl);
 
-	regmap_write(mtk_get_regmap(pctl, offset), reg_addr, bit);
+	return regmap_write(mtk_get_regmap(pctl, offset), reg_addr, bit);
 }
 
 static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
@@ -809,7 +809,12 @@ static const struct pinmux_ops mtk_pmx_ops = {
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
-	mtk_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = mtk_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -893,7 +898,7 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= mtk_gpio_direction_output,
 	.get			= mtk_gpio_get,
-	.set			= mtk_gpio_set,
+	.set_rv			= mtk_gpio_set,
 	.to_irq			= mtk_gpio_to_irq,
 	.set_config		= mtk_gpio_set_config,
 };

-- 
2.45.2


