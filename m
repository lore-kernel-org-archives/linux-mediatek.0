Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B9FCCD183
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9K2/B5MPGejpyktnrayd2M4OnjFiC4FIJq+++ipUzUw=; b=DEEE1/+owp9Wosq+PH4VUGShO2
	QHj0BOUpdt4y+0FLdPFBrSmBwUojogcG5enuzM/ttzn15wRZnKGA27hieExMfxdZfV3glNJq3xGmb
	53yEGcKMQW0B/CNP1tHChbhWrXZNyUbRwAgphvY08sl1bhR49tfixuVgVQHJjsxdjb+4isJzbtQIl
	vlRSRZ7QxvkFSaT3T7MYIz8Ma98JV95THNHnv34FwIuLDYCiPDd+sC9NdFhHIp+xndzBXK0In751d
	PGOXeHJDR1tA7pAZn3Tcauvm6aAUoWjJmwPyRMW3JqK/L0vt50DCLU7BgQM0GwCYvtnHOUWio6SFg
	FJIH+uIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKF-0000000DKdu-01dx;
	Mon, 13 Oct 2025 14:14:59 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JK9-0000000DKUK-0lE0
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:14:55 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-57da66e0dc9so4294411e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364891; x=1760969691; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9K2/B5MPGejpyktnrayd2M4OnjFiC4FIJq+++ipUzUw=;
        b=VpFd9iWfPP8tfZ7e/ucXIjgWcr+DtpcCy5Ja+a8qeLhsd7VEXwrnm41XXmFFxR/Zkv
         YyUcAY1hBLIybDkLz16o7eIuX3pj+MetfKOPii24LU+2mUSoorRJFkY5lKTQoWZIQB/a
         CUnY/G/pmrbmVrzOsM7S03bCZE8esJRcTKznw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364891; x=1760969691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9K2/B5MPGejpyktnrayd2M4OnjFiC4FIJq+++ipUzUw=;
        b=eslWItz88iwi6pb56/7J/QW86ZLgKovFfFicd6KkDW+X2F+U5t5z0Qb/ipjPNfleGw
         ITKfnZqq4fPBQVsUPhmlGk4cgUA+Xfpk6KA/kac+jS+avwLYo2r5SYXeOnzLNrGq/egh
         BUyEhNBS0FfQBh/8urmezVpapU6oCvyovBlMBklNX31uStK8MdjbRsxBWrjUYGUWrBvk
         bhtR6ODmBrQD/G5c9q2Xf9+yZIALTT4iaTTk1LbzOVOz1vVCiUqlcbcLQGxZ0SquaSVq
         c42Y8oSIW8uK5APFQ3Cc2uKNftK2gZGq0liD3s/KjlFOpvH4ma8zhBJp3CI7H5mrKhRR
         ooWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWMblcAxyvSjGhv6t5EWuDp5ETbRPu30bsc2huGvay3UMIL/JqZD1OxBIr6JpgCyhJaofEGo0ms8q3WfXExQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZZ4l2iEuvZjethgfVQs/9WQT4oucTuCTheU00grr/4qz+yf82
	Fw9yuS+2sEX2rHBZgQ8sz/pzEi8cjKpb/pP/ir9jQ3QnyVmU8A/2TSdDapLQN1X9lg==
X-Gm-Gg: ASbGnct7mSBkFvlMc1ftSCsucKXdHsRHR2WTJjSqgxz1EkOYMkbQJkVr/D0IxztY4Xy
	G+rTcE5ZzTpwzpxpsX00QuTOCC9DGpy6y5LM3GYKH2m03lRAJ/+LE8V6LAZf5DnuGci1feLLJVH
	UKlKuR9AxJxIjkL3pTSapq9gpMUHoNQOTKUZGiHjBLDFchTcKuv7Tpxxix4Md9y3tR+Eb3XYFOH
	0Ga5SY9o9TzxgxanSNjWa2BVdAnkvuKHe1nw7W65ptyh5XT15NtiwCtfjkpSFaAT6Bn03dcuMxh
	uE5rWZrIHme31G9UjjOhfoswYUcWzpo12bmHqxWPgN8S3ishAPZAiB62ijWYBw1OXHB+igJ5nyh
	IdHr4AB78givR4xkhti2oVZpsXBNdHMBJeIQI/HGl3BhWlhJsCK0S10qpe6mdbo4mdDnsGtzO5B
	u8S2oXnEOHVXQy+PoXxhWXokcT/86M
X-Google-Smtp-Source: AGHT+IG5qmXDx4UbLHB42EHlB1t6C5RYlcWqyFNneQm/x2WKvXaXI+FP3no4d6C9H/LUJRdom0BMRw==
X-Received: by 2002:a05:6512:12c9:b0:57b:c798:9edf with SMTP id 2adb3069b0e04-5906dfa81aemr5323251e87.56.1760364891242;
        Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:42 +0000
Subject: [PATCH 02/32] media: dvbdev: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-2-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_071453_270938_9058D486 
X-CRM114-Status: GOOD (  12.05  )
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
./dvb-core/dvbdev.c:575:48-55: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 9df7c213716aec54bab7fde2c94ac030696fe25f..8b980d371a45e4fec5368a7e90d4c42518b72e72 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -571,8 +571,8 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 			       MKDEV(DVB_MAJOR, minor),
 			       dvbdev, "dvb%d.%s%d", adap->num, dnames[type], id);
 	if (IS_ERR(clsdev)) {
-		pr_err("%s: failed to create device dvb%d.%s%d (%ld)\n",
-		       __func__, adap->num, dnames[type], id, PTR_ERR(clsdev));
+		pr_err("%s: failed to create device dvb%d.%s%d (%pe)\n",
+		       __func__, adap->num, dnames[type], id, clsdev);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);

-- 
2.51.0.760.g7b8bcc2412-goog


