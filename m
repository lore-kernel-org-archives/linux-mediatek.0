Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EB5CCD183
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSJdC/O4+ZsAqBeRWK64BAxaBhpHQ02dQ2HoRNMjbAI=; b=V4tklIT61A+BKx5iQJpGwjNHEQ
	N/37eElwB4W4FB2Tzb8cZ3KkbJ62QR8OZZB8AdMJu46YR1IBlTpJV/FkJbxxs6GmniHaP5uueAWdl
	7cwBXVrLa++nZsbUJzABVRugAfF6b+eQUmqiXHXcjai26iFeQdq1fhncPYeSeHYEEMs+HSeCMvROf
	bi4BWKOuEmauQWKCuHXI8ZZ5wJ4hCu340PdlaomsPrLD2y84N4puwc/eBHtyzqzPyxrSW6cpk4vPm
	AwB7EYyPhKYgOuLwSHY8/ZMzUPMxFVNU0xLeRwzMhGfj9uJUucZmeNlRpHjehqgR6qUxDWBszxUDV
	67mBju4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKk-0000000DLXB-00vA;
	Mon, 13 Oct 2025 14:15:30 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKJ-0000000DKjg-2og8
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:06 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-36a6a39752bso40631191fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364901; x=1760969701; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSJdC/O4+ZsAqBeRWK64BAxaBhpHQ02dQ2HoRNMjbAI=;
        b=P6eAvc4rdCDffw8foqpg/9Xf8GfqaA3U8QkBNxFy9u5W4RM4t0rt/t9vq+tL9FbzAX
         Kh9JMoz3pDSD6aOTLpGaN46YzPj9tGBu706F91sN3Hq9mi6WHTvKYhpL8hFU7fi2kytH
         nFphAYj941t/ciGa8vaiQ056LKv48oaB8+Euk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364901; x=1760969701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSJdC/O4+ZsAqBeRWK64BAxaBhpHQ02dQ2HoRNMjbAI=;
        b=qTiyb3x/VS31KB7FLt5uumIxf8lRfxAs8pXpBo0YIQ0FIL5lM0xOnAiTrXzi1DXZTV
         mRQPbvV44rs0HMEXNbRF2QxGYqNul1g1MyJblSoh0HhSR3TuPhw3XC3A/r7cdNfvRtQR
         /hBUbyH6UT+IcMK4UuEa56MwBjUTu1u2X147tFRf90cZAwlpwH/xUww8votAK4yXqT+A
         mv+TPeAr2pc4D9FqyDvMRX5lDf+cWlFjhibNqqPdduO3/HLcusE2Nw27JK9vApUnepm7
         R6jt3Gf2ajQLKTHQO82JQAhgfQKNYYS7B120nHx9BwA4YcYuxdDtkxigAPo40iRNZEtj
         jMJA==
X-Forwarded-Encrypted: i=1; AJvYcCXM2n3l61jA6jlsY2HGoknNpA23tGsJXdVhPRFXSLn8EP9G5AxtPXiIbwaW6GnyupBVdgcdSYjq0tCszWjv2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbpWXrtlYNG/XC5HDngu7VR45bd8iM7bj9ty1o9eArju45CxoT
	54K3x6UBMzPBe2sUJV7mvwtZkjSRUYZp3bPaaYWnm3pqVOufdXsa42YjOxCrriQrVw==
X-Gm-Gg: ASbGncuckVkf5ug+BokkMkm1f6nCDlSHykaJsJLkaooRPr6ZcNLmekaCLO5pJ6J8QTa
	/brPokqlTLrcU/s1jtaiYcG7oMFFSoXuF2m8N/vJNE6mWlA9wMseTufSH8jAs/pPMf0895QTXCm
	wwQGsOg+WRQXHozq2V8N7Fws10ZzZPc+/2s5AUNMgdbUsFC878U5y+tm4/AoFcXraR9x0E7jCGM
	0F60rxpnG08FaxAi1rqd0u6+XE+OXaicl+sZOdXi3alkHcLqbL6KsUJvmvcnCX5E52zKAEU1E2d
	q3PmjUq5JYzFDEIt31GNpCumrU17JJ29aGNzYyb8D9eOFIrQvc7no7vJT7xlZPg5JAhqR6FsbxA
	XgmS21Ee4Awmjo3Wt63ImuyVH6XYbCMwDVAxTa77cUjwze/jK/YH6puXR5Bfn5Zb8t2wYx1G/i4
	RJlHfDP1qj9iAWCmUUw/ZnvdQE3tj0jrkFdVotOeA=
X-Google-Smtp-Source: AGHT+IHaXYtEGcC0lCeqZAPaJ1Eba36sEUnGMYsHL1RWVLLcW4i0NjVadIfSh/QN3FLm+/VJwSwBng==
X-Received: by 2002:a05:651c:3617:b0:36d:501:76d8 with SMTP id 38308e7fff4ca-37609e5e0b9mr54139201fa.31.1760364901230;
        Mon, 13 Oct 2025 07:15:01 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:00 +0000
Subject: [PATCH 20/32] media: i2c: st-mipid02: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-20-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_071503_769999_0912F4F0 
X-CRM114-Status: GOOD (  12.68  )
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
./i2c/st-mipid02.c:751:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 41ae25b0911f02517f137d6b5307d13154266e07..4675181af5fb00df837c8b796fc32d50e077a480 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -747,8 +747,8 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
 	of_node_put(ep_node);
 
 	if (IS_ERR(asd)) {
-		dev_err(&client->dev, "fail to register asd to notifier %ld",
-			PTR_ERR(asd));
+		dev_err(&client->dev, "fail to register asd to notifier %pe",
+			asd);
 		return PTR_ERR(asd);
 	}
 	bridge->notifier.ops = &mipid02_notifier_ops;

-- 
2.51.0.760.g7b8bcc2412-goog


