Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1715C83F0D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/ATAoJA1B/BYrlImzJt+hnLQ0qBzgSKQ71TlK7q7Sc=; b=j/YIeasG3LhWUbl6NJMRURI2kV
	f9/6SC61+Agkayl/dIUrPJysrsfmyjvk7ciY8MZCzo47nx9l4Ldb0/xuUS2yL7HNPfOGlFweGDh0p
	sZ/+ZujtmF/Zmx1Nc1KiN/ndpE1jNQdGW2VPUBh4Zwmv/YbQAiOhZnUJkvGMOcMHRNwplUDyY4FM4
	5wmmJHFF/L1RATQ69i3X9Pt9xtfwFxtsc/ClayuDbtfBng7PGucOuaLTpiLQLLzzu5rpTgXMhJNMS
	i/FqTFioDirYSmuqtj76KiBmNKwNFim5Y0CAgOGmzzVwkjan6rKivbbyJ/93ExmobpdARurg1Ejoh
	rwtAQvew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCK9-000000069E9-2Yvj;
	Tue, 08 Jul 2025 17:41:45 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByI-0000000666K-2D0G
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:11 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so772640166b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Jul 2025 10:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751995149; x=1752599949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/ATAoJA1B/BYrlImzJt+hnLQ0qBzgSKQ71TlK7q7Sc=;
        b=Fuv734niB9/2lX+wdiifJn8CfcHwouX/U3eNzxn1VHu4LtG57BbTpBrzMuOcVen8D1
         gDkpPy7d/dnz4mkz3j8urYIWUbmE39jJlV2mF+iLF+QxKUc96VkqO568NPadXXUW2Z+x
         DnOZyEUJBhsBPiWR7e+BIfCIXPH5b6e0I4ILhlwH/N2sAn3yAsJT5iaA/Ui+rYjTB24P
         aTNndSI2tfPImoafB06siBt2hQ2++OIB7EVRlOvUhKQUl+SF9LNv3knkhZyuA5TQzEFI
         7+49JsNwl1e+ecKFR0mJSTs/hAFBdYSTeKGUkfTCNDQsxRaju5/mJoC5xe+JL+vLaDub
         98TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995149; x=1752599949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/ATAoJA1B/BYrlImzJt+hnLQ0qBzgSKQ71TlK7q7Sc=;
        b=D9L9urEYbQ/tTOeQBjkJBa0UpY9VErDcHbVAcaTIWfXgRSCuCvAwBa8fUCRWPArT8Y
         srNbdo33/jHX/6lDNDwkABEczfuOUQQBYT/9HPAmYCIYzE5qcaCxGKghKP6KdNmk5A2i
         JpsMRJ7gwXi1mIBDEcELhuu4x7/3GwF84gIiQ3gbMetH6NHMr9lLQei2xZICbj6TJOWn
         i39kd7jb/5XodpjfL7tekqB9OLNqWDmpnMuZcwDQ/SDu5Vre1HABJOASXCbkU7ReOp85
         H/I/DyR1YvEV/vdTipVSQpeCUx8wmG0KztHuhRMjY69KeOq2Sg9PamlPSDdHZpkfc/M6
         kgSg==
X-Forwarded-Encrypted: i=1; AJvYcCX3T7sJ5G6foRsvpsaIvVqjyuRDaO0CA0I+EFshG+dnpJdaSm0ZZkhdFSe9lzJ962yYfAmjEG7wFMKF8IYqHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+SOM0nnS93WuBZ0RUZQkrQp8t3g6w0pxLVSYgf5jA4qghBxhS
	jIm+sBIFjzhQyZYXGu2u1gl9SB6Ier36S0O3J6SEESjDMkf8rBQtDw/AvtpUDNID1WgB1+DkHy6
	9WMiG
X-Gm-Gg: ASbGncvp4SxqF0HHq+N3t+IrnWEKzB/xYOXZnqZpbLDDA5EV+CWRYekpBMJD/FMS4S3
	CH9yVS9gjfU2rHzXIYs5PFXnFMKab4ReAviN533i0MQToeSLeECkd8qSiNqO1BR8qjxC3PGhAl3
	fccF/S4cRMpv31zkN1gOf0UApdYccGpBAGooTaj3zRAVc8bv8fVNFRc8Z9XDe5PjDjNT9xU5qEk
	AmzxZc1nY2vNFjFzHUb2/6r4nlixYGyAwTrzKigMrLjCx1BtFlE5UZRo3R/IB4GesQfcn+rIc93
	8jQegfXGDAOyBfP6ekWAAVyiBsUDDeMUGWNXgzcKV0cfeptIyTUXItaXzwg4FbbsoxLAr6SiRe0
	CceJFVf7qVj+M5DLwxajjc4hTVqiA
X-Google-Smtp-Source: AGHT+IGucY9wMs7PPxnmYrtor4bXdxwyYwkd/rVLgKZxlKqD6066rMDLI+nsaWmwtsE5QbvvgbtN8w==
X-Received: by 2002:a17:907:724a:b0:ae0:a245:2fef with SMTP id a640c23a62f3a-ae6b0b755fcmr447729366b.20.1751995148752;
        Tue, 08 Jul 2025 10:19:08 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae3f6ac5fd7sm930253266b.103.2025.07.08.10.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:19:08 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 4/8] pwm: mediatek: Initialize clks when the hardware is enabled at probe time
Date: Tue,  8 Jul 2025 19:18:34 +0200
Message-ID: <b207c0aeb73d0da96736e38363640f8bee226014.1751994509.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
References: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=19ZdI8deIAcCXvNH+gETZCD8gWi46FYY73oPnFFbcmk=; b=owGbwMvMwMXY3/A7olbonx/jabUkhozcoM8P/LqPHVqpflnoI/OLM6kmm8ICr5zcuW/ZF/Y2p bwnX7l2djIaszAwcjHIiimy2DeuybSqkovsXPvvMswgViaQKQxcnAIwkQVe7H8FH2UtOf57mYvV lL0HHQtzemub64XUj+z4e8w9unDzX5V/70MusK5l39w0beoMj65168x03mak2tTHMMqWLNTqr1i WWavOk/TTsbJok5iFytuYU3Ifxavjatut1wd1dUp79Ilsvbm42uyo05rbFd31d388OW/ZKMvuvb L6lp7D0r+GRf80fSbz3A2qlvloq+tg7uXDe+3XdK/nXz4dWOZ5JclO3S1Uq2jnhVQVvlUbfb422 1lbX6n4tXl6Qtzfb9u+s7Kv7m50cfFYzKEb43bc8GNE8wPWNz+rl7e26HNk6ngHna8/VPagMGHy troFe0qZxV242jSW1G0t/pyi6fSholvzGPMNh3f5unbqAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101910_564432_244AF591 
X-CRM114-Status: GOOD (  14.68  )
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

When a PWM is already configured by the bootloader (e.g. to power a
backlight), the clk enable count must be increased to keep clock usage
balanced. So check which PWMs are enabled during probe and enable the
respective clocks.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 47 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 8cc61a835cd5..376d059c47bf 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -228,6 +228,49 @@ static const struct pwm_ops pwm_mediatek_ops = {
 	.apply = pwm_mediatek_apply,
 };
 
+static int pwm_mediatek_init_used_clks(struct pwm_mediatek_chip *pc)
+{
+	const struct pwm_mediatek_of_data *soc = pc->soc;
+	unsigned int hwpwm;
+	u32 enabled, handled = 0;
+	int ret;
+
+	ret = clk_prepare_enable(pc->clk_top);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(pc->clk_main);
+	if (ret)
+		goto err_enable_main;
+
+	enabled = readl(pc->regs) & GENMASK(soc->num_pwms - 1, 0);
+
+	while (enabled & ~handled) {
+		hwpwm = ilog2(enabled & ~handled);
+
+		ret = pwm_mediatek_clk_enable(pc, hwpwm);
+		if (ret) {
+			while (handled) {
+				hwpwm = ilog2(handled);
+
+				pwm_mediatek_clk_disable(pc, hwpwm);
+				handled &= ~BIT(hwpwm);
+			}
+
+			break;
+		}
+
+		handled |= BIT(hwpwm);
+	}
+
+	clk_disable_unprepare(pc->clk_main);
+err_enable_main:
+
+	clk_disable_unprepare(pc->clk_top);
+
+	return ret;
+}
+
 static int pwm_mediatek_probe(struct platform_device *pdev)
 {
 	struct pwm_chip *chip;
@@ -275,6 +318,10 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 					     "Failed to get %s clock\n", name);
 	}
 
+	ret = pwm_mediatek_init_used_clks(pc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to initialize used clocks\n");
+
 	chip->ops = &pwm_mediatek_ops;
 
 	ret = devm_pwmchip_add(&pdev->dev, chip);
-- 
2.49.0


