Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7AFCCD18D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weMrn1P2Dmx5cKyBfIFsmXsJRg2imt8oYjxSbIy2C0c=; b=T00N6mMy1c4CR1b/XMHvffQ8/T
	iliv300Bx38MPiTzMncLvMm0ap/ukcFDEz3Ixd8H5yuGUCi0HIPJmvC2ulwt3JRRnWlBxQVkPPnG8
	oohtN1jBrrzw/A6TwsaZaV9yQmlOKbKIWtmwcwmaAsKT6j7mdeowIMrbEeEFFXn94+6Uwx8tn0vg2
	pY8ROVtP7N98T3NBOSToGY7PwjoxqaIbLiYAeY8/0ZL5dCrRJxjbwlYVk6WcgACWnSfNOjyJbGtDT
	Xc2yJ5T1f1lf+6231dv56hTCfDlyrLUC0GoX3KAdKVK4OqQp988lY0N0+WAczcFKWovQKjJxyOFxL
	b/SpWP6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKh-0000000DLSq-3Hey;
	Mon, 13 Oct 2025 14:15:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKK-0000000DKmM-0kzQ
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=weMrn1P2Dmx5cKyBfIFsmXsJRg2imt8oYjxSbIy2C0c=; b=p2ddkK/rJO/YxP93NGEJYl2KAF
	luhDVIehDxEdDDIfyh7bIlPXcxX5WrPIMfGebTjGRtoa7EpWNoS93/KMajoJdHlx5ex7IcU2bnfei
	D2RdGIUfmDuDlDoPP7heR6W3HjIVZFfcl8xacmASduNrloQG6uNFWvAUkr0OpOyRYNfteCCW2Of6L
	13tQD0q0lIeS7tHjTFSOno/Y2piL0KFLc/x1YpVkBdG0FKYop78F3OWGzQBn0SBL1hi5BKjhaosk6
	S2OmzJt2avDHiOe0R3q/vfNKNbcshVbohLlVMXykKMDP+Oa1fJ4RnFl9pts+mvQZ258GO9U8LAlgC
	H6hbTOCQ==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKF-00000004N4Z-2B38
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:02 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-57a59124323so4619693e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364897; x=1760969697; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weMrn1P2Dmx5cKyBfIFsmXsJRg2imt8oYjxSbIy2C0c=;
        b=CuIv+5XKvC0hnwFf/pwkzUmOgjXxu6zFnvjj1Z5hz7/yUq8t1tq3NeQDB8rBz3SFmw
         Myojhel5F5zM/WgkMGtUZ68lSRUvYgV1Y2eD4pDbMWt1VdJlEaPKRWSvLmlxEbGE1Nyd
         j8dBfyTWlFekcDHr3/j+j84hm8XuUxsVkZdlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364897; x=1760969697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weMrn1P2Dmx5cKyBfIFsmXsJRg2imt8oYjxSbIy2C0c=;
        b=t80lbc8+BFGhZ7E1FwYiCWAX0wxau5kKQAZmeXKzJPO27cdokgWIIZLO+buNzUWAax
         bhfMwQM4p5QYiy8hpAxvzHDT8vow0c8azk2//CJjQqek+wk3YOOjYlhzyiRTlLbK0/cL
         EK28dAz/IupCVtQDecFBVHvSd6kkgUp+UuefZ6ZIZQ6ITN4hRw+2ZWLjQcVhPUa83Vqe
         UoRjBnipDnqrJlLQPYREzpldM8gSYCW0ZOd/pMyyDtmhQFlcJT677j4kiyiDEWbxuZS0
         SL1w3ol9wL/TgegGzJtZLqt0HbyRHrcXsVtlzvJafw+BI6rfK9vO3XmpeixVWOGfVvuf
         Pj/w==
X-Forwarded-Encrypted: i=1; AJvYcCVUsFFY8amOWRMoHzz+hSB+87ASwfReKVfqdnw3BcUXwHrQT2k0Opb31O7Kby+NkqTjaB9I3TNJg4OLsaKbxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPn9gwTpTdyViBaTUrN2GF4Gi8KxwX/IaBwiR1Q0lpTCtJJJNz
	9gsoIOVkWcu5H4P3byJh+8j8HM4FTozlgWp9z0q1VBMYeWHKP5Wk4QsQKD9XyeQfIw==
X-Gm-Gg: ASbGncu7BL2rigoabLzDheAJ4CZgeXnQfmBp3+4xLbZhv8DHqDJPLNygVl0RRtrm4De
	Dyz1e5ABPLW0Gj1kK1BG1IsNuGXCfeIU7AJAb6FhFBQxQsp8YmxHdwV67162OdYTCIZQl5V+hqR
	xwkzQy5rfXS0CPpOsrPaG74A0lsjbtoSPOg/yqRs8JGN82L8yQ2Mn5mcEFWL6YjxywDVE+lUSum
	BLgIOBpHdJNSIB+dSYY2diNRw4eCKPqqjEBTH3+jMJ9HhRk2AXnP5Xkjy/8Cpa4zkpcKJjmRMkj
	SpRxyOFIjFM7MJzOhJVmODos45lh303TUefZ3SF/UtYvK3/LLBmn/+L/q95Ku77J/Wyu/0MmqBe
	yUNQHn2NhK8khdHMQuMjYWG+MMGQfUcqNSNtixXtdoT9YvxBadBWARMmwHzoV/8qrRKhIuvybk1
	nxm26EtOwKzRtJYP0jqQ==
X-Google-Smtp-Source: AGHT+IHVv3VTrmCgUzT/cTkypfMtCAEj51jzL57PRvYw0rG8gIadeWnRbBvldcFvBGl05DoGVFZcMA==
X-Received: by 2002:ac2:4e0a:0:b0:55f:503c:d328 with SMTP id 2adb3069b0e04-5906d8edab9mr6287769e87.36.1760364897004;
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:52 +0000
Subject: [PATCH 12/32] media: i2c: max9286: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-12-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151459_828986_33CFA681 
X-CRM114-Status: GOOD (  13.04  )
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
./i2c/max9286.c:755:7-14: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/max9286.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 7c0961688d6173843f3ae846253d4a8669ae762b..e6e214f8294b83105be02f29966e1d3ed72f8dbe 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -751,8 +751,8 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
 		mas = v4l2_async_nf_add_fwnode(&priv->notifier, source->fwnode,
 					       struct max9286_asd);
 		if (IS_ERR(mas)) {
-			dev_err(dev, "Failed to add subdev for source %u: %ld",
-				i, PTR_ERR(mas));
+			dev_err(dev, "Failed to add subdev for source %u: %pe",
+				i, mas);
 			v4l2_async_nf_cleanup(&priv->notifier);
 			return PTR_ERR(mas);
 		}

-- 
2.51.0.760.g7b8bcc2412-goog


