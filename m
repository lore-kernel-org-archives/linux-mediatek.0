Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B335BCCD183
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWalVF0nnSBnNQ4jdDd+P85V6zyjZ9PX8Y+NqBliTWQ=; b=0tENvUXur8hhsDDu/6G0wy4+pf
	t0GsUguasZA1i/HDVPNmnh20KJEqTQ5HDSvNhy6waxSExfGAI6Cb0z3+38vZP8vv7oTwhkQMzXvZz
	AjAu1PTfxPCs1UdncqazIXqNlI1MkJx8uKhTas8zx4FxkRRr3DGhQjguagp8X7PWaJDafsiYxsi6q
	f3h6uubFLnORkWB4o0uGJlvS54EOSYjX88smNGDkVhPOnFJ2Nddx+Ed55+RN+qHxmMg8LgIbKbw/Z
	ZsCN1QWDUQf9k/Kr3UujhhqhvADswkXA8pMlj7OnOUG/2twP/phNIT1GWuloUWjlW6ETkjz54nd+f
	wgmbhIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKs-0000000DLmj-2D2b;
	Mon, 13 Oct 2025 14:15:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKO-0000000DKus-3tgf
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AWalVF0nnSBnNQ4jdDd+P85V6zyjZ9PX8Y+NqBliTWQ=; b=fNsUbAThEHaghEVBOWG9F/cARg
	W/TUoEShHWQVIBY5Zjdr4/5kyDhVpwwa9VG/Q788II5TjA4mKGktfKbJQckIzMsz9JntdeRQYrfi1
	14xQoHByFCY45Fwy2XwSKfX1fqpAFBQOEg07Cp/S4E+wgkDuwkURvcW/OPD5+6H0OERBmqI2LMUJk
	CizADM0Je6pdmIPUi1Tf3p8EBI3UX1RbXBO750h8IR/9vstqQ8ZQxOvPVIZ7FBBdju5RUpkDWlrC8
	+7DpQQ80LTt24Tw63spu2/BcHDZbt0Amf7oEvUu4EDPpaOTWI5SxxFlOLwN2zwfUoEvq0VCGPpmr3
	Em7/s4qA==;
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKI-00000004N8I-06Mo
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:07 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-36a6a3974fdso46171011fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364900; x=1760969700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWalVF0nnSBnNQ4jdDd+P85V6zyjZ9PX8Y+NqBliTWQ=;
        b=lBMj1r1AUmWWGdV7WQf6NBVBjLBddtAbzCxUPgMBk2w9425/a5pO6uGeBY90ncYFqf
         0H3kFV8Nh84aCtSPMlqcTTIkhgAjR/m7Ph+grJzybRbtej3BRDT+i1xDs66lbVxg640R
         cnU7uco23QL44rQovs06I4+Cedqp8Jml3P7MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364900; x=1760969700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWalVF0nnSBnNQ4jdDd+P85V6zyjZ9PX8Y+NqBliTWQ=;
        b=u0Pez/1UA9ozwrcS2Sb1gu34smnSBCvHc5F7g2aSkyOfrOmytYXeHIPBruTNhpd1J/
         v4ui2d03LmsRWuYZ1p5R+bA5O6A53TZwLvCqjbOcJe/OFdd9CgEqVvs3Dyi86dSKwG0m
         6W+nw+X+716DTXkC7KGVSz0xKsyRVbynTSoNTyswQlJesBFXtJI2cMUKxFN2u2tINRGQ
         HoeklG39jHN/MfzNdCDejMMT7KfVZAbMzUP+nIkZi4S6kSEq/XrwjKfjcYtM88z2IbbV
         9QdbpCvirofBliA/EhYrjitG2gmL5JEHvV29TJTMEmLpU7vIydCN7+YpPWVkjI+p8A3T
         63eg==
X-Forwarded-Encrypted: i=1; AJvYcCUejP31ww9OXGY1s29yQ8FapNUvozah9AMpIHVG2f4uQXrOtbYcVEAEFbq0GBkdUG+vmDxSP1hti7aeiNkPZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiiJPXqjXPTiLzktmlvkjCHOCsf2G/JQO8TpvynY8uGAT0+NyB
	XVIrf9PiOIQ9AFhhrAHhLZjv2BIjGsvCtSe52p0Sgm3IsuJYsms+eO19R+sU0PofjA==
X-Gm-Gg: ASbGncv3I69Z/Xu6oqQR9Lt52ummjj1Jp3UWQGiSGTRi507L4t0+3HAh2qvqRuYTCDt
	QBHkmOr/4b71XAgWco60XfP7bWUWhcM+LgWz51uZcocDtIdTgAyZSMddFqg6o42NEy6IDjTvtMw
	ApNoj8Kcxqj+SrKFWXKy17bdj644mNl3C7qHjLFVfwXn4trTENy6o932rXRX3lutRInmYjVXrBy
	R6o2pzoZCvHguu6TJ6piiD0Wla9B9/LhsePK2uT9OsxMCBCC5js9cQJJVT0VVGY6Yw/oT7uO/9d
	u1PAzww+vSBLzHHOIVlH+a3nPZ/HVQShMGdNVM456J58sRktX6qrSZFiw1VgnJIEYnJHx2U5Xg6
	l43HcCb9JpSJmElAe8EmccAEFF4elzWWJv5GT79e9iX449pnldU1GHbHCEp9BvHy1N5+LGADuoM
	36N6A8tItdDzp2s97C6g==
X-Google-Smtp-Source: AGHT+IGPZ0GBnGH+/De00vLY51zTi7j6Ya9EGY1cvcSTJfIjXM0TP8WRpiQmjBMOUob4MSX3WpygTw==
X-Received: by 2002:a05:6512:a91:b0:58a:f865:d7a4 with SMTP id 2adb3069b0e04-5906d5da909mr5473662e87.0.1760364899579;
        Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:57 +0000
Subject: [PATCH 17/32] media: i2c: ov5693: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-17-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151502_320069_8A81CED1 
X-CRM114-Status: GOOD (  12.50  )
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
./i2c/ov5693.c:1296:9-16: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov5693.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index d294477f9dd30704d2e43a0ed3e222aff3af365f..4cc796bbee9263c032384d8327961b5cee52b9e7 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1292,8 +1292,8 @@ static int ov5693_probe(struct i2c_client *client)
 	ov5693->xvclk = devm_v4l2_sensor_clk_get(&client->dev, "xvclk");
 	if (IS_ERR(ov5693->xvclk))
 		return dev_err_probe(&client->dev, PTR_ERR(ov5693->xvclk),
-				     "failed to get xvclk: %ld\n",
-				     PTR_ERR(ov5693->xvclk));
+				     "failed to get xvclk: %pe\n",
+				     ov5693->xvclk);
 
 	xvclk_rate = clk_get_rate(ov5693->xvclk);
 	if (xvclk_rate != OV5693_XVCLK_FREQ)

-- 
2.51.0.760.g7b8bcc2412-goog


