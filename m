Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD77C7115A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jun 2025 07:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Prze7KarTtiEr9ULuOe3gPur17rt7b2Vlkz0iOaKSnE=; b=bRcLcOT/16r6NZgBRRnHBvHEi2
	gMkKLlvXPXaQgfV7RSKzdNDPdrBpgEz01ZXdE9osoc/WZ9STmQR1nTzHczi+oePPSI0bGWq2a2fkO
	6xg8DXxSrtM46gkwHm0u0miugGLPu+DLuSRzzz/cmcu87SrWDJlDz/m5cVcr3q1wipnTWO1bndZrk
	ZNdpTdg+c75MbV8yg7zQftrRmXyPqy6fGmFTsupNBnlbYXZgI/dBg2kUrVep6wreealDq2gsIaoik
	hQz8xMtdXJMYRpk1tNGXhARpmRcJ9AdAsgM3G0iI8gYAA88doaPonfgRDbC5MOsfwTvuRfs+JWwkv
	KO3q81iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4S0-00000003fUX-2p0N;
	Mon, 16 Jun 2025 07:40:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4CW-00000003dGH-24bW
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Jun 2025 07:24:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so22521755e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Jun 2025 00:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058655; x=1750663455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Prze7KarTtiEr9ULuOe3gPur17rt7b2Vlkz0iOaKSnE=;
        b=n4/zolbHz2dddZF9t1uQZSo44ekNLF9J0ZAtMSqe7PWhPZk0dn8mMX7cB/GxDcuiaa
         mrtzrZYxYDF3IRlPOjx09a4XvGa9ENhab7M4jH0GMorDf/uztN5GvEDSoFHAOLsMwyB/
         TSlQb8M9PkLsbAVd7IHCEvO4hwbsdsCYUJ9viJ4m20049vTMLFNe4XM3/WTnYTb79pOZ
         2dNTuWsXyZkfMy9xPGXlnBC5CY5vo+72447e+KsFAJ7zKJTbuDvjTbhQv1dVuw7pZFWz
         st0q3LsgOwdPVchlSGr2eC/kCMUKAJIx14Q+40zUBe6ECpMNsprNrtXN5AhcHvPA4uAV
         osvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058655; x=1750663455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Prze7KarTtiEr9ULuOe3gPur17rt7b2Vlkz0iOaKSnE=;
        b=lh3N5ks2Rirc0YoQ5aUew6IYXQlU0Zw+fbxlW12ZB3MAZfz68gVPFlDo8hKvDwerlw
         XcqVbSJ8sVb4VT4lpMZDR2lydWGHtz+kMnH970ICIeutIz/h2NKdl219lDXyFAX0odgy
         cZd9xvFc5AfjxQyITjdeVS32nSQsyN6Pj9V9rWK3CfXbgRszPo2F5PseLdRNyI08nzPe
         hp8PStSTWuYwkptdeA6aCZPcoeXKw3ZN5Png1xwXyLXZ3uzAMalxRbftnWDFJ+vAnMEo
         688ZpjZY4EUDS7iJsm+sWh0d14dE97blTrbLalS/77y3cqnB1CzTHfX4jZjSCEfiLtm4
         09yA==
X-Forwarded-Encrypted: i=1; AJvYcCVjg9Z12NFWdh8jf3qK+00wwAGY4Bnxzl6zACOqDBFoNIFQphEwWxxunqaOEEdCGVXDOsEYPxEaBZeU9orAbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXSUZ0IqEOVlkqkDiM9nueSl7rOtJ0fv1U4/YdsXW7vSSORLrF
	kLpAoasfVpWdOFgWw9qf5lOW+jXGs90NIg+ntpHlMr29Nt67UlEpz5fTM0/nj79OMzs=
X-Gm-Gg: ASbGncsg2J74dxcyTfcwdd7xPP5vaY0DU9lUe0N2s3C5HXP2QpiWMO9/TTeUvnkhLcD
	sB2bwj9vpMfP72c4c1ulgMnMnknpsUwPBAaYX1y5oqmIRaQ7hER5QOnH7nsqKE72CiVc9GCAjpF
	D2z01BQ5+zWewitxCfM46PdzNooizdh+9uOQ6uC67mIr++24dFb/VyhjHdlrsUvV+OLGM0B5IcO
	qQV4SdS2P/CFkfLroNc4ZrJ1l1JbKC3hOOfswmOBSDuaBaSHsiBIAwhcKQR3AZ1ZD7bQhkd5Nw6
	xBfjB4wFSbvB5Hi8bSFS+7WUaafbEY0qBylRcjuAlLjD0dXb4qw+zWkn
X-Google-Smtp-Source: AGHT+IG/lAGJDXz/7A3CvJT8e5vgl3jiY1Lw3i6jYgkiFDTNWEgx2Zv5/09zy+DHigY6izksTnVhjw==
X-Received: by 2002:a05:6000:310e:b0:3a5:1266:3e96 with SMTP id ffacd0b85a97d-3a5723710afmr6864057f8f.15.1750058654687;
        Mon, 16 Jun 2025 00:24:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm10312334f8f.63.2025.06.16.00.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:24:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:24:06 +0200
Subject: [PATCH v2 3/5] net: can: mcp251x: propagate the return value of
 mcp251x_spi_write()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-net-v2-3-cae0b182a552@linaro.org>
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9MP33N5pSy3OGgT8wnmaqvxECSreBBEZS21KtQDntIg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8aZLt+zmsPfXHGowMV7wiRrZdvT9d0pjybCs
 eRaNCJ9eEWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/GmQAKCRARpy6gFHHX
 cr8SD/98aDqkM/VGj5uwtBE5gFWYPj5Z1zIx8qY+nCaRVn2DKwC2Kg4yMV70J9jSdq4ekrRinZV
 RnyJ7ds9/3L20t39TnghIi+GiIxnfHsIawEWyCLFFyEa+b4Fke0iOl/kx2jqaDSFM0C1C3u3ENG
 GbhKATNcf7F7G6DJ2xccIinHhEu+mBXrCrceO+kijsDh6wbut7AtETdESfZaIpQQXFCqwzKl/XS
 6Etd4fE9UpLJ2bmyzW7Yn1/TFo+/OBPgyujTYD2t7FkbOI4ytp4QF/Wl22eeoB7lysoWLzZyI8n
 nA6GYs2OMox0U1nnMmlIEaY2L/73AbfJwzTOV9wnUgLFPgZSW9JGRtzYINWTz9/DrCHmlMwljUE
 VNcYSKhQL1LOduvDgcp3j2z8rI9/aOKxIVCFkXTr0FVHxM2Y7rh+JPFN5sV0TVIDNX/H5h3LMl6
 OvVOPepI/+66wgHuOlV4dGNmeV/6yi2RcwONb7FHZq9wYxDJZtLX2fk6qLjQw8a1vXBfsiO/+Ci
 YULlo87CssHva7nhnuEC+iTL6EiiynLq4/MDVFCaCCFyAz9/cCdRcbyQx34tL8jxS2RAtH6OV48
 dm/bkqz6CxfJxgmvOTb4RBiJdfLXyyoctwXbW/4h9irmuYzMUuV9rctiyHDtoR/H4R1bWJ/dhf1
 u44dRSvvUN2+JGg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_002416_559598_42562DC0 
X-CRM114-Status: GOOD (  11.63  )
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

Add an integer return value to mcp251x_write_bits() and use it to
propagate the one returned by mcp251x_spi_write(). Return that value on
error in the request() GPIO callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/can/spi/mcp251x.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251x.c
index ec5c64006a16f703bc816983765584c5f3ac76e8..60b7fd3040d02f114693cf66d61c8a075a32e278 100644
--- a/drivers/net/can/spi/mcp251x.c
+++ b/drivers/net/can/spi/mcp251x.c
@@ -388,8 +388,8 @@ static void mcp251x_write_2regs(struct spi_device *spi, u8 reg, u8 v1, u8 v2)
 	mcp251x_spi_write(spi, 4);
 }
 
-static void mcp251x_write_bits(struct spi_device *spi, u8 reg,
-			       u8 mask, u8 val)
+static int mcp251x_write_bits(struct spi_device *spi, u8 reg,
+			      u8 mask, u8 val)
 {
 	struct mcp251x_priv *priv = spi_get_drvdata(spi);
 
@@ -398,7 +398,7 @@ static void mcp251x_write_bits(struct spi_device *spi, u8 reg,
 	priv->spi_tx_buf[2] = mask;
 	priv->spi_tx_buf[3] = val;
 
-	mcp251x_spi_write(spi, 4);
+	return mcp251x_spi_write(spi, 4);
 }
 
 static u8 mcp251x_read_stat(struct spi_device *spi)
@@ -441,6 +441,7 @@ static int mcp251x_gpio_request(struct gpio_chip *chip,
 				unsigned int offset)
 {
 	struct mcp251x_priv *priv = gpiochip_get_data(chip);
+	int ret;
 	u8 val;
 
 	/* nothing to be done for inputs */
@@ -450,8 +451,10 @@ static int mcp251x_gpio_request(struct gpio_chip *chip,
 	val = BFPCTRL_BFE(offset - MCP251X_GPIO_RX0BF);
 
 	mutex_lock(&priv->mcp_lock);
-	mcp251x_write_bits(priv->spi, BFPCTRL, val, val);
+	ret = mcp251x_write_bits(priv->spi, BFPCTRL, val, val);
 	mutex_unlock(&priv->mcp_lock);
+	if (ret)
+		return ret;
 
 	priv->reg_bfpctrl |= val;
 

-- 
2.48.1


