Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94815CCD192
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Smwvmk+cDkyGjYaS177QmxkSssvQt/cgmiOzwIecscI=; b=RkGq/fUNwaAUbkA65N5lK8S5JQ
	Fy6Kog/hW0gyZY+6qRC/LF/CWrsLcmNYoqftpCsyq1Tb3MiD4XB7fAPSzQYzpXg9+ch1MbnSWYAjN
	G1KnAvmKj2yGj4QPzUzZAtStfwntKptQrIfGxRBw6myE3cH9VWijREkWdOW2t8SghX4WIERhV+L0D
	mpXhFW9GdIquJUuGpSh89/A4kdtS6XVU7J0XbEGbjco/+0FvvFO5lzJIOtusVFQnURPoppoYX9qW/
	99i9h7hV+ficoR+S8ajuNvHN8M98L2E5OSz3rFsQuD14pDGWnZO+vpWz0vKobVEnVQfaHH+JsCVY3
	bKYRBiOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKz-0000000DM3A-39az;
	Mon, 13 Oct 2025 14:15:45 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKO-0000000DKu0-3IRI
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:10 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5390510e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364907; x=1760969707; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Smwvmk+cDkyGjYaS177QmxkSssvQt/cgmiOzwIecscI=;
        b=E/SfB3MaibsPg3F5ga8mVRZcZz0EdQXvrLZYQze0a9g1FHFJ5iby32fbl2RRsS88yj
         2wjsJK6pM6davn+gsXIecyfm2BvgPNTiT2ussYRNby26zEn5I14yheU1rCGHeleezMOc
         gqsTp0Zo70+LiKJIIrK9KHV2VcHjJHk++zGfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364907; x=1760969707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Smwvmk+cDkyGjYaS177QmxkSssvQt/cgmiOzwIecscI=;
        b=cjlFIebnW7jkM42YVEiL9e4kftokOBZ+z96Y7X+0V0A4A/0p7TeHWLp5PMDnJOeFfd
         eShK+8iSdh04BmisdI1mjGnzRajYz7MpYZnDmhnN4mFHP7Xjsl8xnmdcn9p7mqkMFxQc
         TAvwgVkg4vupe/XNopwnkcCGXQdsd7cHd8JNS+k0bvkp8WppUDuaBN3WOBFiPPT9HuvH
         PPeK0qzhFUkdv2/VXPGELEj9UHKaPHZe8gB7sPjz4vIPLKfChfkFABA04JJDx6fBesYm
         c+NtYuHLqVNdOX///U4bOER7TmA+KsT0WCE39qWI+GWxTvOpo/nhFGddrF7kLjC2pdNT
         jirQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr+mtlENRR++nlESHcfbYrGcbyrQNbFeiOFhlOWKK00xnlShVPTpm6DP9K77bNrc81G6hMdXB9VXl1suo5PA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0J4GrtK5fbh/w2uEL3j8LRGY6inMlaZ31xJucdh7UvulvrXkf
	PIZEJ+JuNm0f17TTXdDpS/7rprgbnXLmCTZMQcmjOwOhjyz+tG+EduDvoKlM3K/NFQ==
X-Gm-Gg: ASbGnctaou+w8SDv1tPWOXQKhT5LFJ1TLYeM9+AeawfrkLRII45TRUnkNNld+gUqLbr
	pfQozwYn3dvejqEbqcLe6XmBxJE54Ol5+g/X7ia/4GSiQdfDUT+x5WmNoICK+mdV20rVup+nwdp
	6DOJTtW9O1R/YYVvJ6w4FKMMnofobjfMbWBgqSikfqAZ2jRgr9ImAPzT6lkRUUdftv9E4onv+8S
	y7pwb7p4gZfM1l9ZVL+neMh5W5N7z48PdNfz9yeL2ijpNbFDeGm3qiF03hmDoLnfMbTi9S4xWy0
	gCM2IDlU/C+38mgXl4mBkin2IbHaPGbocoiqDSa9dpKHThNWKN0X404NoKc/+XURx3FVyg+7hH4
	4fUVbIWUtrzMmeGXtJU5aeoj0FHdRHIDK1+9Y2USdbJIjlnY7/IguRJIJlYJm9oBm24bPvmxdaK
	4g3Lq2SwhKNiYzYbMVIg==
X-Google-Smtp-Source: AGHT+IG0XyykaxSpAJZEJBiMkxB//rHuKsliNYYIqdi4qrxeJQYdIviCb9iwNXvzzJnUAUziWI3Chw==
X-Received: by 2002:a05:6512:ea9:b0:585:bc5e:237c with SMTP id 2adb3069b0e04-5906dafca4dmr5906081e87.49.1760364906745;
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:09 +0000
Subject: [PATCH 29/32] media: samsung: exynos4-is: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-29-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_071508_907668_2013C2FE 
X-CRM114-Status: GOOD (  12.70  )
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
./platform/samsung/exynos4-is/media-dev.c:1337:16-23: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index c781853586fd21996105c050e587bf8079cfc095..d6f7601de597e3d3517ef9195d728deb578e74f1 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1333,8 +1333,8 @@ static int fimc_md_register_clk_provider(struct fimc_md *fmd)
 
 		cp->clks[i] = clk_register(NULL, &camclk->hw);
 		if (IS_ERR(cp->clks[i])) {
-			dev_err(dev, "failed to register clock: %s (%ld)\n",
-					init.name, PTR_ERR(cp->clks[i]));
+			dev_err(dev, "failed to register clock: %s (%pe)\n",
+				init.name, cp->clks[i]);
 			ret = PTR_ERR(cp->clks[i]);
 			goto err;
 		}

-- 
2.51.0.760.g7b8bcc2412-goog


