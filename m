Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F957CCD193
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kj07cX9dfdog7qE3ITvyCUHudwQ7Qr1GriLN3ezW2JQ=; b=QcXxbhHnsbKEJtbysIVzfgq4vS
	KTye3YhKN0N2fRY3zLJV4OPU6JkXSadQPop/RXpBNlrl2PmWJcgFDSyWbPcyEZaxPIi1MyCJpBkMG
	hRmvS8n2mckan6EtrRHUjJSbFcDTPSFhetZSGbs7jdJI9W4S4Hk+iN73+Q4+dND4/gJm+2dN15qae
	UneQY89E/GuPzPIxXdJAypoCGtybgg5FdE1j1N3ok1a/xM+z9I5Yehuh/mDOg3/JqtqV1XEhm2+cU
	Kyt7pyiMhw0mao3VzL9KW71eD/bGm50dfTu20LlULijr5DQfeqxvlnNtH8nHWjOCW9ZGX+Bf7Hs1Q
	vHNzCp8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKn-0000000DLdQ-1Ryk;
	Mon, 13 Oct 2025 14:15:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKN-0000000DKrn-14VZ
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Kj07cX9dfdog7qE3ITvyCUHudwQ7Qr1GriLN3ezW2JQ=; b=DexDE+RM6m45ch4cidETLDqmoo
	kMm8gVNtSSpTxmpkH8JNPh92DC8nds5aRQDY1JMVr2r6AinM5pUwTXJ6aSF7KvtVigH8rGnA9B9Da
	AyHsVrgQv3ZX4lBkMnfBVeAqzM1IdlPrOyNTOwT4+AiF9nIimMXvWErxaqvwVDrpW6sPRs7fOhkmZ
	Sql5XNk8QEd8l/JZDYY2vtWMcs5qBVFghYPixBzMmrOGFoHDWeaqUsE3v5LeOTWsYeF2uZrNs06lw
	RWCEbWJErqDzHPrZIZCm2qKHV8fPgSafjkr3Od2AEclMBLa7oI9Ag6UPH+h1V7WQ+ZEY2Ubkps5hi
	pgiUnr0g==;
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKG-00000004N76-3Yhw
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:05 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5390282e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364899; x=1760969699; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kj07cX9dfdog7qE3ITvyCUHudwQ7Qr1GriLN3ezW2JQ=;
        b=PG7rqhWEwzyxYS4gJbSKUjTUoN3upRrjp5AAVXD97ug1ntBxZO/qVlEQPOpxbyejYD
         Wr8Y3FAWx51H45cCSjVM+TQDj0VcBOSbcOBmy63zHRUHmPi4tAxFdN1aZLFbPaNOCWmP
         VnVTrSmPD0691fqmiklezeI6byPzOr2Adjl0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364899; x=1760969699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kj07cX9dfdog7qE3ITvyCUHudwQ7Qr1GriLN3ezW2JQ=;
        b=CN7ohOYfUtk3oF1GkjCgd7+7wVe2nFwD9gmLCgugagET0p1jaAWbmCaHW+OV8v6pjg
         DzBLwKnstpBhDhlsDXvqv4+aBQ9hzXh01/FO7/yyPd1xaA6XYTN67NjpkoEAw2lXM9Rr
         TqLj7tKYSTQt/EYgT2O1E+oHdtIqE0QL0RcUR/52kahS990vjt1HimRJMFyfQiStY6gb
         3vwmer7ihjMUQe1CQbfFkzTOOMLUF84t0E4D8olS0wFqLK/Wdoa/FzSwCp/Monx6HBnp
         NfSPCuwN4auJjSDjwtkS/uYb7dEgUYlMZlm9hDJSq3ctTGJehxx9GD9rbpK1i8Hr+n7m
         jMRA==
X-Forwarded-Encrypted: i=1; AJvYcCWHocKT1VD7CAHzVXzEJkH0vmDDRFkXv5Q+vyciOG0dTyUlJlMxBGzaVhvF5ywPJPEbK4mkjBpLhUUz174vEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YznJnZB7bWqMjxN1tnUO0zwVfaG5FSg53DpzuVC2wLh3RJt9x+P
	YJb0Oy9rJOMfPwff6AM0Yu1bKvXLF6sPHNTrz8zTFKdnqdZEwvM+J2nXJqi8RkWLIA==
X-Gm-Gg: ASbGnctkjG903UfvNF6q0S6NHaD9dpA3UQJ91OHuSeDofasi5FGh3aGfbVLXqgZX4C7
	r456ou/uq61Ji4omxWgxvQbLE8kTMSSRCNPRzkIpa/ZZk4et1QMgqglA9q8kQ9GU+CZaU4phNK9
	n2m6ZXndXFVAGOOICHpg8V6yHnB554A9+QdR2QLXi5cQOn6iDDww/w6Un4GR8IOE8JDtI7WnuRz
	2eYb5SQEscfatyoJfkAioF47TI+dtGtpsKOfYvJ9xgAw7UnAgVq4Ysrw53SAK5ywqkIo9bUbtFx
	M03bHB+2KaSXY6KsD2ZccwuD0dKiKPMRZ5shSHD/XyvlGnWMsjJpoEkZ9ELVm95QY5RdCtn3Y3A
	n8AcjpnVunZzO21Kag2lbRV4eNvygVex3tFOCXnfHTfYrWatCzJf6pJ+TzlrcSPAIJmxJS+8Dkw
	l4gInujPq6Odffi0e7PA==
X-Google-Smtp-Source: AGHT+IE2HB4PNnNNZPoJgrmm/zoBzzLugjubCTHQBbs/Uafloy4/vUsHxeeEoDk1I+UDuJlRtAHv9Q==
X-Received: by 2002:a05:6512:3dac:b0:586:7f:a141 with SMTP id 2adb3069b0e04-5906d88e732mr5437316e87.18.1760364899093;
        Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:56 +0000
Subject: [PATCH 16/32] media: i2c: ov5675: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-16-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_151501_217040_565ABF2D 
X-CRM114-Status: GOOD (  12.47  )
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

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR().

This patch fixes this cocci report:
./i2c/ov5675.c:1188:9-16: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov5675.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 30e27d39ee445c2603b8fecf7a1107969eb97df3..ea26df328189eef449ce121c0f62a4ef02631830 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1184,8 +1184,8 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 	ov5675->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(ov5675->xvclk))
 		return dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
-				     "failed to get xvclk: %ld\n",
-				     PTR_ERR(ov5675->xvclk));
+				     "failed to get xvclk: %pe\n",
+				     ov5675->xvclk);
 
 	xvclk_rate = clk_get_rate(ov5675->xvclk);
 	if (xvclk_rate != OV5675_XVCLK_19_2) {

-- 
2.51.0.760.g7b8bcc2412-goog


