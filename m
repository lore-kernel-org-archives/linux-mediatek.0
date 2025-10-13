Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA9DCCD18D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxwItL4tz8pq3Mzmh9A8flAtdwuQ+oH3jrE+Iyzt0C8=; b=nnPZm6TKuqNnc7BVkLJvyYBtCd
	fbxYpRUFjYT+Mv5JJGDMysOuYeTcETkdampX55PuGHVe4m9GtCNs47UTwK3D15nNkfxzkj/BvROAL
	zA80gSy5WRtb3Pm9/zX1y66EvKwXG7yqckezf2MyqzmTGmQcWtPRlZr6K8Lff2nkrw7iMbe2ynIT9
	Hx8cd6XaAVVyK+pguN4IIEIfCj6+XcH0aUzK6He/7kCqk5jV1wGR7vtdW1XXTAmRCBEGi/Gg4OtHs
	ZGoe/3mIKr8LYATZOz+gYRCQL3hUaVaTHK2M9eQzr7fs1wDbgQg1UpOdiizMTlnajz2FJW0PoF9rj
	nXfk9QqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKW-0000000DLBT-1BFa;
	Mon, 13 Oct 2025 14:15:16 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKE-0000000DKa1-1JWm
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:00 +0000
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57a59124323so4619661e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364896; x=1760969696; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxwItL4tz8pq3Mzmh9A8flAtdwuQ+oH3jrE+Iyzt0C8=;
        b=i4lsaV2nxCWYwbJpoLK6d3dy4k/tChpj+/E2A/DQdwaQZ7YBZEfeFlQxuLrdJb3BEk
         8sj3dUQbtSaAgWiyJjG7OGSqN6Qulij/hKmGA3svkVJlW88Y9C2ajFFn1dCbKMhFdSeu
         8mtOLPZdyu8gNr79bneZDGgmwm10Vjj6Siw24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364896; x=1760969696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxwItL4tz8pq3Mzmh9A8flAtdwuQ+oH3jrE+Iyzt0C8=;
        b=Sw0tCFl9UXYJPY3ZEO52q7Tl2ktI51WTkOqU49mcz2N/HgeYytED6Me7QDUsNspFLs
         3AWRWaUMvQo5bJJsSeahUhk7KHjYzrodZTA+9k7Ip9pF0BAltWTwSGJ84QAIUCWzpu9I
         Wdd2SG3uF3j+ewym7LfTjDUGDCqiUpp2G+hRXm4YsOYmp5QlR8DAp1NNBinkfuep44Rn
         OddPO13btYLEh1Sa+n5NrqmFFyo5WE0wx7hvj3nqiRkvKM2at3DCZCyIcaXr9PGuLXzf
         qzz3WnIHWOFhy/89MnbdYHEQ1UsTa7WicVj1BRQlXpRCUJ41z2Fqdx4JWuhzMWKsOvRh
         Xv6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2SJjsOX2x4xiIjlHYhJS2RwHo/cWD17DWDmCD7WGNNeXxQc4oPvnKlExKO2RhBfAXwOk6yuPEXMKp8jvYVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwulFeDMBftcBRbPDgnYa7ThP7wsuvweEGpsZbfCEzW0dqwdTX1
	wy6tfNNdqmYCKKPmsI2n2LVJrnt/6gHV7rtxqwTVoravLrlTVXgU+1+djddPnjDnbQ==
X-Gm-Gg: ASbGncveuhJYxAJOS65crdP/oNJohy//7Io3jqffOvdhvHsm9O1+cNW/ygVitVYR0qg
	uasM4BZ9gz4tzQiqknwJ+sg0p07YphLUwciZEU/gXLYCah8KXr56KoCwsh1g6VOPv0E+bPzc2II
	wN069jpF5UEMrG1VHNrHkZQmVaCkAyzyBPn8n8WtHlXrnQfHRnRu8iYQxa6crbv+K131ILSfKLj
	+mP2RjgWgziM3/iCd8YcNCIBYM6Jew1cg3CvSC3F3JMvydoyDgdFDNhplHDxLdPUQ9vm4SPCNeT
	4Nl77kbrGrDDD9UQdJJWMUi0uYAx6O0/kEm1jmumuSkLPU0a5+nAW4Vl5QfWcJzS0GIxAZZdiiw
	SpWwkuS4ccVpGhxNiBsZpDKM1zKKqeJFD8DFlptyp7RV45BbnJY3RJPr7mzCQQMKHSOaiLrAo2k
	jkDhrxVwZva4pfUowzGQ==
X-Google-Smtp-Source: AGHT+IHRStcb5/UNrBSpVyOQrSmM6wvY4Sq5I8E4EibgafKAtbziLGF8qFxpeqrq8sYvK0QOKhdKZw==
X-Received: by 2002:a05:6512:308d:b0:579:ec3a:ada2 with SMTP id 2adb3069b0e04-5906d7738b2mr6908772e87.4.1760364895693;
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:50 +0000
Subject: [PATCH 10/32] media: i2c: imx335: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_071458_510119_3EB8A0CD 
X-CRM114-Status: GOOD (  12.63  )
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
./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/imx335.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c4d38001508fb86d28 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 	imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(imx335->reset_gpio)) {
-		dev_err(imx335->dev, "failed to get reset gpio %ld\n",
-			PTR_ERR(imx335->reset_gpio));
+		dev_err(imx335->dev, "failed to get reset gpio %pe\n",
+			imx335->reset_gpio);
 		return PTR_ERR(imx335->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


