Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB25CCD18D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUxX/9XhZ4PnNBB1T7MELmfGG4IHXE3ZwCx+Au9dRPU=; b=IIXjA5paYSGJBaDM/EQGqQ4tDx
	WnpXP+a73ueuCRI4/xKvPNwodFGGnK0swXmoL6AhUCnyErf5Jcj4GqNvfB6iGsr8hFQu78x4ez9Nt
	B6zMhie80xDid2gAZzehJNdv0oQ70dDEwbdiE20B/pTh8BQTUTODOJ4k8uuXstiFV7ELsI64Qrlop
	VR0t6Y/48FPZn3Hk1sxX681qxvSBvfG93l90X0SGv7wA9pCM3xZQV3ZlE0c9LFLbBNBatyzDQqKNv
	yWWZVAFh0Ok/fgGm7gT30XizBRsoOYCxwgofkHRl+2nfBV0k18Tx+yOCFyem4n+sKR90F6FVeOC74
	JY33sKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JL4-0000000DMDX-2Aud;
	Mon, 13 Oct 2025 14:15:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKV-0000000DL8M-2IlM
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=gUxX/9XhZ4PnNBB1T7MELmfGG4IHXE3ZwCx+Au9dRPU=; b=sUkCNP2lIiqhgmrl218+ZBZiS3
	BaKndeE0WhqXet1vf7jiVrgdjvnYXMM4mTEfd52FHy98UY2fSNxCOFMbR3dHchpvIB1mgoOpSjlLP
	ejTkKQ5/o/Xx10A/nCjX78B2+BVGDL17+hTEYw0gq/MV03Z7GCWo2cCi5KMDTI2xp3tSMYCbdYvnG
	dFo+NslDDZRGNo2srHmce77Ir0ga8DAHFIkdvK6K6yReZC5TjGIfdJxE3j4JDdP7tSCAkyv4WBqEI
	O0ZYdU5GJObciNhM4CgeYfLQsSh9LoOwpN/Fx2jIuw2m3OSrdpGlavty0neq0iXFG4A670nYBLm9v
	oavANDaA==;
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKN-00000007W6L-347g
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:14 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-57992ba129eso5322373e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364904; x=1760969704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUxX/9XhZ4PnNBB1T7MELmfGG4IHXE3ZwCx+Au9dRPU=;
        b=IVPNnoKQf2dVwKhj2tf5LwYWqA5tsyoBQ0c9bC9gnGheutPqLt5kHK6lUvP9rlr4tX
         dFtBiCAUsEj11Z0Wccmykqz+JR5EO126XP7mzBaa/1giV0oLVRUZTroqddrztAC3PBTq
         hLWPAcxAEKyM4qcbZEM1/BDCK4BBvnhQwAOUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364904; x=1760969704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUxX/9XhZ4PnNBB1T7MELmfGG4IHXE3ZwCx+Au9dRPU=;
        b=UHKiGo3pkQ2vklUBsagyHYXxhRTRe0jadNrLDeuhjE9lHUZ1aho1ubTeAtD2ZPEDHK
         ow0l7/1uQHfMhP50CCeuYjWAlPuarjfLrZf8Cx5xvsYhD/M6Tu7nLZLWNjDeqv9BK6Zl
         1gKF1VzIqDT6o1xLVm300Zk0cIIl022MJjv8r+jMcPo1viyWZzx+mOh6astk2lhePznI
         Dtf62GTyl0kptEqR+B7kal4pEt2i065UZUKckjayprUtfiERciK7sLc1PemoKqapkRTJ
         5B8MPkmRIy/9cpNt8EgXMUuRP+f1MCBAmLw2KSo32qanylVBfY+nzi5hva8DXIjEecEz
         v29g==
X-Forwarded-Encrypted: i=1; AJvYcCXo1BudCttUC30V5WiyWGz8IlZ0TjLqP21hV5mKy5+fWwvVPBRyfcHEMSqF2b7rHNVSIiosTNPgoUngBGm8ug==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOJapcv0wif5ZCSkKTD8hVu3pnIT5lQX5EPvg4SpDey4+dq84C
	gLYa5r5JvO4Sjm42cCSWeM4vBAifGL5tD+lCskB/N0VXg89zGeCMRX4IbDH9+A6mrw==
X-Gm-Gg: ASbGncumb0sblAwi8HlJM9f6Ge0hTmiLbu7l/b6TcNjHNAqfIt68uY0FmDhb5AR1oVO
	W4Kjw3sZz3AVenAMLphVUIUPmCjbPXbrHQJRuXxU4VOFElmnlR8IgIeTANqIFaPkY9J/avrOuaG
	ujzLmWJxQoz4du0mylPUxOhE5ol/Fd6srMrmomgjBh4cA4wt+AJxcJd/NxaQ+TL9B8WZwC/yb5B
	XawBq7J8Iu6n76pTxramI9Mq09rP7mL2F3akhL0CU3Q1zCscBccCpnotQz6bi17IhgPdIFxKjUT
	hKnBE7B1IfYj/hSLVWY/f2OoAohlisDcSRsJ6lvqL90Bg5rk/j42k+2jvjH7ivkVnB0xc5Jd8YX
	z8dnjojsrNnPhwFj+OvrtTj/uMRq26/+RYFTqx5oKvghKItmMnqhalZ8L6jSm0axU+I5Uyy/BeP
	uKAd0tZBCqYSVFT8EbbQ==
X-Google-Smtp-Source: AGHT+IFTTHLDJWS3Dn9Gd32yhET2ji8RYegzhadBkm4NFBADg/24WPxUjewhK5Qa14H7toVcPkN+hQ==
X-Received: by 2002:a05:6512:3f28:b0:590:656c:d11f with SMTP id 2adb3069b0e04-5906de88e60mr5677489e87.44.1760364904333;
        Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:05 +0000
Subject: [PATCH 25/32] media: imx8mq-mipi-csi2: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-25-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151509_017988_4CCE2D42 
X-CRM114-Status: GOOD (  11.64  )
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
./platform/nxp/imx8mq-mipi-csi2.c:422:23-30: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..d333ff43539f061b8b9cf88af2cda8c44b3ec2a9 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -418,8 +418,8 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 
 	src_pad = media_entity_remote_source_pad_unique(&sd_state->sd->entity);
 	if (IS_ERR(src_pad)) {
-		dev_err(state->dev, "can't get source pad of %s (%ld)\n",
-			sd_state->sd->name, PTR_ERR(src_pad));
+		dev_err(state->dev, "can't get source pad of %s (%pe)\n",
+			sd_state->sd->name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


