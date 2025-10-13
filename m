Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9CDCCD18E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvGrgXxce3b673ZvWJmL2O2P/vGZxGBn/PkoM5SNlqE=; b=KUNcnRjTmHS42UnuPwRPwQeXFy
	J4dLGi7Xg2ix5ftfLKajwE4S4/mmIVf7uioAewQ9geiEjfUQ+ZyfKkCNcEmulq5YoPDrbYDR8geUm
	IhZgnHQ+QZkBB8xbSULcRiWRAWVyOGRPySo1cJV8EBP9yLkhz2Vsoo64orZhpOmMjLcnIxb0ZamSh
	N+8guq4Befohk5e0xPKnyNykB8ZvXsC30nmdA3BzhOm78ppr47V77Od+1Af54cR0dgA/6o/aa9tul
	cQDH0XZHcq6kSNQBH+JVTwols/3yF0TTzToYEumfg/IDo3o9boeEdzYvt48M6ndgsp4UXAwPlPsjc
	zDQXqMTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKo-0000000DLgI-3Wej;
	Mon, 13 Oct 2025 14:15:34 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKM-0000000DKqP-2OO3
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:07 +0000
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5797c8612b4so5253139e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364904; x=1760969704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvGrgXxce3b673ZvWJmL2O2P/vGZxGBn/PkoM5SNlqE=;
        b=J04TcAxcOw7gQKsd0lZ8h2AkoARxU+O77vsUHAwiAxa9EaNVUwbptZcabmuj5zkBaf
         nxQ3qDNZUCL1KtzordOBNE78xgymG6ikzCdM5Keodo6AURaoMVg6f+iCmFBtJnM320Tw
         1hK5pnvG+3GFAZ5o8cL0lrfb6kdYhX+dqdVd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364904; x=1760969704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvGrgXxce3b673ZvWJmL2O2P/vGZxGBn/PkoM5SNlqE=;
        b=RI5OibFUoXjjPReaVwzn1rEEZIeOysJjnObDRfGb1C1BULxMYTxLc/4jhVY0PS3h4b
         pfSSOeeUYYWful/MYX+kCRovHg6aVUWPH3ScDyqdR7CVrO54Yv2gT5Uy8X2ZQA9IClBA
         7AmzoRXTDt0gbYohUgYJHf3FBFX/T+d4RHQ77M9QUcS24KHEplVfS8EahzZcpP4/JrmQ
         nZ0G7fIxuvpBjeKQaOR3eT0KtTJMSuwENppdxx+G5g2A2LI+rEBT1otUTpbdseAvdEGg
         WR5einq9RTFnGjzfOAGpEhgWtZtMlVDp69c0hSUK+5DErzGUhr9mjAjs7Gr5p0QaswwM
         bAiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLFXK6N9RSVvuELUSHMvobEMdnuaQo5Jwv56UMKDp41vsS8sjXMJizwmiWBJ16SI+hXsl9JSUeVXiHHm5WgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqoExkmgJ2E+tO2OiZ2eKjd3moot21VMc8+RvaGoP6Lvg1v8iu
	5HSw2EPcTdHz7cZznG3QrOhZkux7nqni/FO6TEoYYf2IQU3Ly204XE8Ane+pWjfiCQ==
X-Gm-Gg: ASbGnctRXAXMx0LCSGa6so+fgZTGJeKpHIZJZONRy/OOjZGg35U+F++4Iw9qL1+sQq+
	Ie6xIQPzoSKd7E1jTgjhR61f6L6h+HXWr+QiQkkXXba8fDVs7GYMjsiJwT+FAlb0upjSKzX1ezJ
	WHVVBLM7RMF/2X347s6U6w0h8Ey93Z12JNMPSMB6iM7jiNJnVqYdq3cj+vfzh75h3Vt4IwmQ0mB
	SAdpLUgkFyRyut6PKCQBXpPe+JPel/pT5B4bZ1sVPyPmBzE8vu0vhvO7P6oKDFOn09AxQoEbK/J
	Iu0g0h3X8gys9Jtzstw7TdOxpQH9lVrDfFdRb5dV2JQHpdP6qakNwkaX1+ne/qFKwXac/TthyR6
	VAd5sYXrb5jkIOyxoeFNuB/k7rvfh/7r83rNrdXuTLQIknp7Dsbbbjd1X4EstPlytbmO5v5MfbK
	GjlZIWvebMLiGktboLmvwlt12S82sP
X-Google-Smtp-Source: AGHT+IGGd6j7B+8NL75y4mrJN6TXhWVlixXUpX+LgX1rgjlDHLsFmo3oZTEn3Lq8AvVEZR1xSQXSLQ==
X-Received: by 2002:a05:6512:3b12:b0:576:d217:3f79 with SMTP id 2adb3069b0e04-5906d8b179emr5620261e87.15.1760364903769;
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:04 +0000
Subject: [PATCH 24/32] media: mediatek: vcodec: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-24-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_071506_668254_0E6D7AA5 
X-CRM114-Status: GOOD (  12.11  )
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
./platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c:187:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 5ad3797836db15bb62744d6699cdd2d6f05ad01b..643d6fff088b22dd58c0b05d5699432ccd0bc582 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
@@ -183,8 +183,8 @@ static void mtk_vcodec_dbgfs_vdec_init(struct mtk_vcodec_dec_dev *vcodec_dev)
 
 	vcodec_dev->dbgfs.vcodec_root = debugfs_create_dir("vcodec-dec", NULL);
 	if (IS_ERR(vcodec_dev->dbgfs.vcodec_root))
-		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%ld\n",
-			PTR_ERR(vcodec_dev->dbgfs.vcodec_root));
+		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%pe\n",
+			vcodec_dev->dbgfs.vcodec_root);
 
 	vcodec_root = vcodec_dev->dbgfs.vcodec_root;
 	debugfs_create_x32("mtk_v4l2_dbg_level", 0644, vcodec_root, &mtk_v4l2_dbg_level);

-- 
2.51.0.760.g7b8bcc2412-goog


