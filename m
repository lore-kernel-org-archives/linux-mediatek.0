Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E72CCD195
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5P2qDb2fF8LDzF+Q7SobVA0m4pVGtYbfI8YlHA3qkzo=; b=rokYXNhAYU4yKy/r9YCjePmfdE
	WzM5hgHsU5n6JZgQaW/s+C/ElwENnoZRru35V4ADjGx/Tx4I6DiB39xe0mqWTjqAwicbmyE+zuacQ
	Bbd91Gm1up1zPsbzrkyjr+IHlmGeqcs8NWGmr7b1GAOWU4TG5Zm8PHso0n7rTuDXSYy5TA19WlLZT
	pw7XSHVaeq7Cm65W9oefo7LCeG6cE/hDa5B1XSKUtA2Q2fhFiYdKs4lA6myvXxNh3L8JYMpTg5dmB
	vd0zBnbPcQzLP7f6SBzimuhcSDH6Ao+IRE7HfRCbNDalIOuBvogAJTBDLCvkg3Y3QeawFpLHNWxe9
	GU16sKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JL3-0000000DMBQ-2FiB;
	Mon, 13 Oct 2025 14:15:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKU-0000000DL74-3o1o
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5P2qDb2fF8LDzF+Q7SobVA0m4pVGtYbfI8YlHA3qkzo=; b=ibt7skLO/s6wudzJv0/sL47mT2
	p0s3CdJxMuwAZjurH/VFq2Bf0W3YFEcc9dXjEk8MaGFMDpPn1jknaYJ78VO1tdAkV5AOJUBvASFsE
	jZ3xE+SJcXXQIB3IAx8IGsHNHf/Vtsdl62nVBuchfwVeTYoSe6VEerLVBPRlNqZOKZokOWzMFRKCQ
	+oB3xnSnCj/tfNvCGyym/xPTt9Kv3Gz3DwB6jphaMiFLtqMiogNgnH/k3MnQZpN1Ab9UXPttp0NIm
	e5FhS5wBjFpqnqfyhcSb5vCTtSSkNOaro3WUIr/RkLgd9KuKCUgyt8jjiIDoe5x45fN+OEVTJJW9X
	0dbzds9A==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKP-00000004ND4-0SOC
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:12 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5390528e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364907; x=1760969707; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5P2qDb2fF8LDzF+Q7SobVA0m4pVGtYbfI8YlHA3qkzo=;
        b=dIp2SxUrGvOnT1Evx1oRg/P2EWlT/gTOzrhep6Kh1DsPdgwJsVmf6cC/tqC7ZvJFeA
         +4kG31DsJkVolqm2MAG9Uo07gIOhbdKtoTKeH9QOdwld8aaQwvzME5DMGsI9/JFipN4g
         E1U65ggxmFFLhYa5X2kVm804d7w2Bvy7mlMHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364907; x=1760969707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5P2qDb2fF8LDzF+Q7SobVA0m4pVGtYbfI8YlHA3qkzo=;
        b=fakFyLvqb6lcevJmoFvZo0Y3NbAEpwrRgB05hwzIIxnudN41f+GK4ccBxwg7VrXvMn
         zKzXXoa4HPMf5qmnKXb+TJUibIVo8buki7sXhdmc6Vk+s5KZ2vN4Z0db/1v6Vp3fQOvG
         ShkD+d4usZhncbq3P310c37ae2ofDfftTdAtfs/+uovpbr2Oax3SfBNTe56pPqSf1ALC
         g5mQAUfoRoUrkOGYWLDuwgfK/6NYRIlVSbutfC2a2IgIkxflU/wSPfbERdoK6rSNMlIr
         DRTbUnHrcaDIdRdkRfuTVEzCFGJwOYYa+GJ2REaMW5kANjWw8+fzVd321zpD0BFS6LEp
         4ReA==
X-Forwarded-Encrypted: i=1; AJvYcCX3G5LXmtuvv0N3YmJtDLUQxloZ4ZuWWrLNMdoHVRw11NLnKMdBrR9BILshBQibmqMtt2Gg9Yb3I/+u0Ba8UA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOHT2wbizdKSvty5Fw5f5taWkaK7X1w5/6luIWZtrbzAekEFWm
	RAki2wAA+Gw1b+K2Q6SJwqEbIKpat0uWhFH3x8+BuGlOpXEqBFNsKFEvY2cnYa66tQ==
X-Gm-Gg: ASbGncvy9ylyy9WNjR6pu1mKX4b4TGrMiUMyKW96vYRp/1N5pZavWEgKHUUXnLOjNOS
	3wmXEqE52uKjz0/U9IGMTHiTxcirVQxVXx0lksFSoFvG6bBK1w3rYuNa9cmf+YmhtOxXKIE7349
	ZoX4aj9viTiBTZ7XMU6S8CuhC3u9LP6LwWxGeMZffBwUauqvrO3o6RhZUKqVqJbXIArDYKN35oj
	zO0sOXtEtgiYau3ygR2IagKnv2BhKd/sHOOpvAqIkITbv7TKQ8Ee8UzP49CmRQso0TPN5rymNpb
	R7EBMN3y25AsYKRF/TpFllZaAUqYofCW/NLx1OuVA3nN9CF4zhfDkZeKDhgGP3+K+lrNLJMq/6j
	4fqZfbHnv9x8Gjr41XpQup/P+w0k8VHbaJJbf2Ubw0KtQ4StabXVJIXw2k4EWILzKMme6V8lotF
	zZxNAMyd1B90NQrvRlrQ==
X-Google-Smtp-Source: AGHT+IEQsTtyBvH7wA40gxhWBW3oPtbImGl+YQPk0oKm5qusk9oOE9kCkc6erWew+lMrb0jYwU0vow==
X-Received: by 2002:a05:6512:b19:b0:579:8bbb:d61b with SMTP id 2adb3069b0e04-5906dae8e6amr5727710e87.46.1760364907237;
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:10 +0000
Subject: [PATCH 30/32] media: ti: cal Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-30-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151509_359242_69C42FF4 
X-CRM114-Status: GOOD (  12.52  )
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
./platform/ti/cal/cal.c:1111:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/ti/cal/cal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index b644ed890412104887ce3ec32b5024a02a9676c8..3e25ce0c3c3bdce3434d19c416481bd8d8b838f5 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1107,8 +1107,7 @@ static int cal_init_camerarx_regmap(struct cal_dev *cal)
 		return 0;
 	}
 
-	dev_warn(cal->dev, "failed to get ti,camerrx-control: %ld\n",
-		 PTR_ERR(syscon));
+	dev_warn(cal->dev, "failed to get ti,camerrx-control: %pe\n", syscon);
 
 	/*
 	 * Backward DTS compatibility. If syscon entry is not present then

-- 
2.51.0.760.g7b8bcc2412-goog


