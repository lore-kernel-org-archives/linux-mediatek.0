Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26ABCCD183
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ytl5LFG4k2lvKI1fHaoSkPXZntuyxjUYygC+V2GNf2w=; b=2QdTlk0S9YBcqsotiAhk9d61Ys
	mSXWtZ6NpVJlOR2QAG3tyrwmDosAr+rl587BxA7UtPzJlDrh2qCtUYTf/S8xRyzhiTQbjkrqN/fU/
	GEuiymhQFHPuMHchpQ9/FIkAOv/McwAVbfeFFJm7LBYOIxXA6DbS2fEYf72b8bopg89OupcghuQGL
	/DRhVoQGrSyn6hn5irDNi8wCb5KtSVUvI64MzV+PzRjPVxenKTjsNX4Tk6lzr+3APdOl0CcebskZ0
	JAXvNItwuhYWup3ZIZmMhEJHvKFj20FaHiZuevYlzUyFKeom03D/ZDArNxuo1F4HSH/kGuj6ebPUM
	X0xlud4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKa-0000000DLHI-3MYO;
	Mon, 13 Oct 2025 14:15:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKH-0000000DKiC-43uQ
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ytl5LFG4k2lvKI1fHaoSkPXZntuyxjUYygC+V2GNf2w=; b=JHmyHgs3H6r49G6bt5lLS49DzV
	WgfCZBQczv6osDkhKDViD6eReGywyyJnR6XovJa6aXhYy1dvfrS8nIDViw9WZ41NfrXa53JA5HMyP
	aGjI4lHMHFeUdalBARiA8ltLU4yPenjHytR9vGXopEFiYUMgYhDfZ54uVmR4NIMGhjVPkGHfr6jJQ
	n2Z3z/i9CFl6L2sYB1y6tksAyZIt2uGLxhaEjjmPLRhD3/frDfdZEHgOxg8dLEp4X8ow5on10IoQ5
	Q1oDsdCPcnMY9IBc2H5SAyVUL4Z1u+JITQjGNN0UVROMX5rhhYmkAX5tbA8ghwsfJFkGeOX7Mdg6L
	9Nieccvw==;
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKB-00000004N1l-1Z5b
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:00 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso6501963e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364893; x=1760969693; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ytl5LFG4k2lvKI1fHaoSkPXZntuyxjUYygC+V2GNf2w=;
        b=P11pkuJyn8oWJ0ArBMigyoLi/xd/PdVhzBaFeg3MQz4aKLprSlvLMOS5N0WEmFlM66
         OrieMoKvG6d+PqMcQYP6b1ryM8swVZCFw/0XfMEJWQUiw6wX6egpDV8UfSVRL7hGhbbH
         JF7Zj/nb1bjcYC9dl5hgEl0a/nrMxGb5kjNzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364893; x=1760969693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ytl5LFG4k2lvKI1fHaoSkPXZntuyxjUYygC+V2GNf2w=;
        b=EyzqzVjdluRi+lGsr3CT4NvuIOZPL2zoo5VII4+vt/SNCRcAP021VnwwhHHcyIKFKV
         iL3iqCQq/QoZCUarx+bGVwJXynwfgDuMo0vAwtVv3P0wsODUqKNNMSEAbdSt0nQeJELY
         lFXoaJhPHe59EwzSlqxOJNCi+VYR3Ahxk3nSl1oE1nGhX1OKYoNvbGidwy7dJDkjzWJq
         oJ+4p8jNumnoz2Eqg8MIkacw8jY8H9Lg0ZxvmCH2BVh0CwPFEAMS4X2QbvBbchF8Kwbb
         2VU3Eah4pOAxNL09FW4MBYBPMYFqt1C1DwjJlbc9x+ndQqOE/96G4eTl6EyPKXgUTsJ2
         RVew==
X-Forwarded-Encrypted: i=1; AJvYcCVJCwPgCbzaN8bnz7JXKOeLmdhl1rWOLWCvS3zsR53AYa47hRSCTjpOeNY5RxhY15OzqOQVbPjM6iNcikPuYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp62gUmxyz6MBFpDQmthD2qmV3+mQuecHoYUEtHNlK3w5EHhwY
	yABJSXdbmFWDHINYyu5FdshB/jE7f2xnu+F4WLXXJvzVAihhUldBCZtQ+3Y/wZhpsw==
X-Gm-Gg: ASbGncu4eRd/6XG2JIiVUmRCGnyfTO1mcthx5Htf1ekBP4GciuqMzWSE71X3zJR7aqZ
	N+Cr594Drxk0RUZZXDeEAMLp8Np4hRstHSsF/jw3Uw+D3SVMIMHMDimhzfuEARd7EZVckOynj2r
	cIMjNCtHIA1zL1ktQwOYWi7IqAO0oTVTVW351fHXNz04spt/6QfmTW1fthin521CRPo40zHFan1
	RQ4c9EFK6Vn/SSPnesOcCnHvWdpeoNGpYhiFObIs6QHNaPgg8tWAvZhMXsyumF9OPvXdTkhX0FC
	Pr39Z5H5hVgA+JYQ7AJstHNF3tv7pi5yyJ36VEHHeto0y4Cz6QrZtc+CLhgXd00tWxlZ5tTGsKw
	Invj+nZh7AG5UbCtnnXPRPuWp5qVMZ0fJBqvAZVuZNA2zbpQgVBRvfQPu3RIHbR1WBigw28HtAd
	ig4VJh+XaiGaWH0Fhb3xb12/3kRAP5
X-Google-Smtp-Source: AGHT+IGVVbL5/vtkpaQMJQh0k7ML+5P3f5T7fpLYmv9ZzC8x6SpLBLD8o5pL52MoM0M8VLfq2lDuFQ==
X-Received: by 2002:a05:6512:3d09:b0:571:75c8:43a5 with SMTP id 2adb3069b0e04-5905e1d36demr7120769e87.1.1760364892853;
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:45 +0000
Subject: [PATCH 05/32] media: ar0521: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-5-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151457_154893_692E56AE 
X-CRM114-Status: GOOD (  12.25  )
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
omitting PTR_ERR()

This patch fixes this cocci report:
./i2c/ar0521.c:1113:31-38: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ar0521.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 939bf590d4b2107c6669b83903028744de1c2b30..f156058500e3dce5d7b5b831bf8ec4056e49ad5b 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -1109,8 +1109,8 @@ static int ar0521_probe(struct i2c_client *client)
 						ar0521_supply_names[cnt]);
 
 		if (IS_ERR(supply)) {
-			dev_info(dev, "no %s regulator found: %li\n",
-				 ar0521_supply_names[cnt], PTR_ERR(supply));
+			dev_info(dev, "no %s regulator found: %pe\n",
+				 ar0521_supply_names[cnt], supply);
 			return PTR_ERR(supply);
 		}
 		sensor->supplies[cnt] = supply;

-- 
2.51.0.760.g7b8bcc2412-goog


