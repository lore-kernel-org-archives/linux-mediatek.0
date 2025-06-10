Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A53C5B543
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jun 2025 14:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+v15tNEANzRm+7r/NoXuqDH3IXJTclSdS8jb+naQrrI=; b=WjKbXQ+W7J+1rZE+iTjGwQsH1L
	sIuHTQHPJUnSi37Co8C3XR38ahZah8ZYJDZBJni0y5bXxGCBAJjQCefkFrGKWOO9EG7cgrPgNlRMz
	e+xHRL9uENuxmDUy7ZX1QivH04s4UV25tRN6J756GjVnBvNbf7IUb/6sRTaOy4WdfWkl+7VJDwF7Y
	R4VVmxDqgwMFcvUAeft6hM8d+AXwxmUeX/QTk8l/Pxievp/7BiNTAleTg6ATV291EQB87ewD5rbVE
	yZ8zgRK27pciyhp+ANlaMowN/fuG8FTOmjd/8MMTOROMiO2xDRkauNA4xgwJpxHTrG8sKPbKZVQDX
	TTLqTJEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP02e-000000078YC-0dgZ;
	Tue, 10 Jun 2025 14:33:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyEz-00000006nM0-0Gn2
	for linux-mediatek@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+v15tNEANzRm+7r/NoXuqDH3IXJTclSdS8jb+naQrrI=; b=GtBYlrS90A8GiGnUMQnd8yHjqs
	cJMTJYN744pQgkd8tKyk+cRuhFOptlP4mqQXoTlAwXWUXTrJMc7TcDAhQPjgyAHsU2bF4//k6dL17
	+LLP7q2jDOqKT/Sba2hEpDHM/EXBR45M1hs4EaXJ3W5DETj1V37zqGrebSxE02cVpK1v4jOsrWIMv
	06/L9TxnCbkYAc8hUFSTYph8+aQ2Guc6uX7gPll86en0F/cGZ0SWHxYvq8Mr2YCR0dQD4famRRri2
	imwuTYgKHF4lsreHtjhtonp3nmdHDMnhBkFXrSLE/JWL/r7x6stE/tEvw1erPQprU3JDkcxJZ6bSh
	94s+yB+w==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyEv-00000001ovD-3okU
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Jun 2025 12:38:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so2081802f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 05:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559084; x=1750163884; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+v15tNEANzRm+7r/NoXuqDH3IXJTclSdS8jb+naQrrI=;
        b=saS67ZizaIPQikErQnCszPYkdoGPM4BCGUOCCEvBT4mnYwnWBk81+jEiXBjD1+cOih
         ilMTWBnRlvKH+1IPvRbzXogIJxpII+CzhLGvwbknokPQe2363/WJQoasiKrKLNQEDP85
         dPwMGVLhMeUPMrviuwroIAiVk1/gZWxB40MlhWzTRFkGMUD2PlXX+GhRoBr43B+96M/n
         3eW5VScFPLsGjrAa9InfyMfrKxlB23pTp31Ldvbro9d0VsUKAYdnpzgQNaS/xrZ04EC0
         p1blgKAMLTcZKzMeDLFCXojqOzo553PpCc1N/HTcGP+1Ym5Ocevb03zo03cplYetBgrk
         jVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559084; x=1750163884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+v15tNEANzRm+7r/NoXuqDH3IXJTclSdS8jb+naQrrI=;
        b=orcHfOpU7qbApmedybZLjxzqlOoS54Q/k5JfuoXVsPYp9FaEYcctXEhr3838pU8sW4
         dckGyVjvtWWHwNz1NIP4CSabk9F6qpySexDzAS5uX1qqiT5pksm7KwxLLWuyvq4f+LfQ
         +dxhtcckU9MIL512wY14iUrXdMH0N8+walEgYVDev4J6UWPXEUZpAci7pk9qPIhbyXhI
         S42tidzdwkl9b2ZuyHpqbH2dFWNdmTr+bWUlG5XYtd/gXlD9o0NTfotln/nMeUv3cCJW
         lOFxEggejyTK42rZWRdC8IlI95lRvngQi0IJu5ZIUJoDanX5Q0YGtnzY3tOheC5+rj/s
         sSTw==
X-Forwarded-Encrypted: i=1; AJvYcCVzaa4b6U+T9btoq6JobE8LZPqzWGUzqwBFqQXywgLXcT07tjGdQHabF1CIZdihpUBxOaWeIym2DLLGHPy2xA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIk0Mqv+7VSBnpbkGu4RaLrxtYVp3M9zZ+MHpFW7kkFEl23KMM
	gsAaf3l8RoaG28YSg1LMPifpqQu+AR5f+yu/pN2nOWJo47doovpdI/u0zqjaWQwhJpI=
X-Gm-Gg: ASbGncsqjRy0emLkBuw38MnHc6RL50Wx5lTP1o0EQuG2uD50xvbtPrT93Y8NRFWwPgS
	KoJ1EZ7mVHSrb5lFSskr+F4HbXMY4jX/RiQm+BlklLiZkuacVj2r+dYS9Fn9gytEFfgSFwA4PdK
	tNBqeAaOgnJ8VoC8jKR/Drk6w+utuhyaq3NJ/6SsadZvizzzrT+iX61JM2BJWYzHdxHl38AFJsn
	ZjCjjqvJ7T+QsOcCJFxfEEXahhKDIUlVON2VfOcvLmzxZLJFbBaia9QB4VeVLKNv8vM3B9UL72F
	AAEVSc3ztxFmtCTGR7owJsNoiQyPAB0gdbZyMm+01yT1FO2+NosGuw==
X-Google-Smtp-Source: AGHT+IGXM/E446xVdY1FfP9/Um69E9UBtSzy/WmUYaOKdEEtjBVdyfljAEXkdz5bvzeT/0NV6hacqw==
X-Received: by 2002:a05:6000:430a:b0:3a4:e56a:48c1 with SMTP id ffacd0b85a97d-3a5522dee1bmr2326990f8f.55.1749559083748;
        Tue, 10 Jun 2025 05:38:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm142476805e9.38.2025.06.10.05.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:37:59 +0200
Subject: [PATCH 3/4] net: can: mcp251x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-net-v1-3-35668dd1c76f@linaro.org>
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KLDDGKd5WeP1ZH7PFOPPjiypGPKpSmUdnfupIQJn/j4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCcm2R5upegqsW89/iBNvrpgrj3SxMSCFC3Nl
 TOttqE00BqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnJgAKCRARpy6gFHHX
 co7eD/4q7jk4pUE8gWfdeMax9QSwEEkHfhqOylZzhdJH37vjfb5+genXs5+a9aSiMhVv+CUzVRo
 3fzN6/I10/CJqsoImMl+BGSVREdFJcXIVrezmcX3g/CoDU5C5lbMo/PXX/V0c3VycIEYSOm0gzN
 bK8W/frTMV20VkpA9RLNqZEdT5b+3tbAXY3KUruz/73xY8myLP1bsvqIJcSy3+8fpw0XzH6mqSO
 fJ1O+wf69HliyNoYdUIuJ4RNUabK6X3knM3Fq5i2S3Utkpx0QTaAch5ftKvyI82zEjOyyf3B8FZ
 +d/SAeGCuhnoN5mWeVWSPBVUU2N1zxNJPXhQ3Oc1VhFUdWoltDMsO0pAwFzSZbaGuFq2VRW9Mq/
 h2ECjHxSj537C92XxO4LIlDV7LNKSDWKfQqvuee9lOH4H4oqCgfDwoonedPMeoUUJFP2xs80v33
 77CBBKvc7mrkCSwH5ZgVX+ShUZvq6TP2T70qICUOgnQOG+j6Cb/rpEeYI1XdtZqX3MTSCiU+zlA
 Sl6LJqWqF5NCbc5Tp4TbMXJ7p5Bq9ATgsoC5IFpIDbWzAHIYWDpNQRe+dQB+NT2SAGWlct361Hn
 N7MHWvrch2Y/nuHsq7YlV1MgLW8lEFXgpk4FW4tev1/7VTv2SenC2isVuMt0TlfEhDucadN6ghF
 oHodahRBqdw+TJA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133806_048394_2B701692 
X-CRM114-Status: GOOD (  12.20  )
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
 drivers/net/can/spi/mcp251x.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251x.c
index ec5c64006a16f703bc816983765584c5f3ac76e8..7545497d14b46c6388f3976c2bf7b9a99e959c1e 100644
--- a/drivers/net/can/spi/mcp251x.c
+++ b/drivers/net/can/spi/mcp251x.c
@@ -530,8 +530,8 @@ static int mcp251x_gpio_get_multiple(struct gpio_chip *chip,
 	return 0;
 }
 
-static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int value)
+static int mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct mcp251x_priv *priv = gpiochip_get_data(chip);
 	u8 mask, val;
@@ -545,9 +545,11 @@ static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
 	priv->reg_bfpctrl &= ~mask;
 	priv->reg_bfpctrl |= val;
+
+	return 0;
 }
 
-static void
+static int
 mcp251x_gpio_set_multiple(struct gpio_chip *chip,
 			  unsigned long *maskp, unsigned long *bitsp)
 {
@@ -561,7 +563,7 @@ mcp251x_gpio_set_multiple(struct gpio_chip *chip,
 	val = FIELD_PREP(BFPCTRL_BFS_MASK, val);
 
 	if (!mask)
-		return;
+		return 0;
 
 	mutex_lock(&priv->mcp_lock);
 	mcp251x_write_bits(priv->spi, BFPCTRL, mask, val);
@@ -569,6 +571,8 @@ mcp251x_gpio_set_multiple(struct gpio_chip *chip,
 
 	priv->reg_bfpctrl &= ~mask;
 	priv->reg_bfpctrl |= val;
+
+	return 0;
 }
 
 static void mcp251x_gpio_restore(struct spi_device *spi)
@@ -594,8 +598,8 @@ static int mcp251x_gpio_setup(struct mcp251x_priv *priv)
 	gpio->get_direction = mcp251x_gpio_get_direction;
 	gpio->get = mcp251x_gpio_get;
 	gpio->get_multiple = mcp251x_gpio_get_multiple;
-	gpio->set = mcp251x_gpio_set;
-	gpio->set_multiple = mcp251x_gpio_set_multiple;
+	gpio->set_rv = mcp251x_gpio_set;
+	gpio->set_multiple_rv = mcp251x_gpio_set_multiple;
 	gpio->base = -1;
 	gpio->ngpio = ARRAY_SIZE(mcp251x_gpio_names);
 	gpio->names = mcp251x_gpio_names;

-- 
2.48.1


