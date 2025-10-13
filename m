Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6454DCCD194
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVsYamtIjQUiQyb/41UVrEZvV/AHr8CKvvGfsgypkrk=; b=vCo+50iMYfacAkkuXKLXOVPuct
	MNb9jlvCEEIHFfOLaRtd0MqDQTM7f0tI0osI7qNfDAEUNWyuqHWM4WpcmahlgNxi0dUBrrkyKSLlX
	b3KyV4p2b9Du5nCilcpjGNP0yW12RJsv25xO+ymdb2nttha8oVD6pGk/qMtB8ujUbixCGSbZXYZNp
	2AaOLrl1a/MKh3Rpq1VR12sL66/wfMaom6o19Nx4U+0mw6PnJjzLYSqObmdk5kSICgZqDh2sQqMiQ
	LxxRTiGkVCvWYs4mlnbt61VF187By2qxvmSMCkMa1zBEBLc6bWtUdp0doUZrCj0N4ygFThZbgWN+p
	UQLh6X8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JL5-0000000DMFH-11JF;
	Mon, 13 Oct 2025 14:15:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKY-0000000DLCu-0vLo
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ZVsYamtIjQUiQyb/41UVrEZvV/AHr8CKvvGfsgypkrk=; b=CK0cWiMTtpL1hI/9+nLP32YaEl
	3GWT0SIBEcAo4BB47zHt95BTlu4qnzk5bksCXba6zTUnMub+GXEM4INomMpzLyQ3Z3jd5lavRUO3H
	UuLBEGRjgZ9HesdiaxXUUrR+LdD1HJU22H5E+WuCJdNcBtHZLOFhUtICTg/51RAENR0uHvk2kt+2Q
	CdYNcmVzOsUr0ryUxE5EvK7dEYmXH5oWYaJwI8cVpWNioeeU1xLw4NBoUbtLg38vt3k3YY1mIWu+V
	YUUGc2096jLs3uq6STVRJfGYJ5OrMjMMPy/oAdboZL+zhSApVt7LNaEbhVFYkdMJ0MvTCZvyf9KSp
	jKILOzww==;
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKQ-00000007W84-0NKq
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:16 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so4896248e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364908; x=1760969708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVsYamtIjQUiQyb/41UVrEZvV/AHr8CKvvGfsgypkrk=;
        b=KhD1OIuHpp0HNUn/h95tz9dSM7YsN4n0KYOriKsXebzwaXRmxnwta77rrRpgiso1JK
         xyzaLdQO+lCZ73yibmw2qia5Y9liejZhQp78qXcXQBHZgseeO+AOtbEk+k0OpUrS98O9
         nXjZ882a65e/ybKz4HCNejd7U2/gUB/GT6aXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364908; x=1760969708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVsYamtIjQUiQyb/41UVrEZvV/AHr8CKvvGfsgypkrk=;
        b=ooM+IMAA313YAei3KrPMDsc4wEAYD11iae36icNnYpiwNovoQbJ0eXg9wPjslcpMnQ
         b05uu95UlKen2dpbiZvq3/k1baXkLTpUMRsxBSk5NTuB690cUfTc9BzOwSCNSEoEB4CT
         ozROG4vVt4JQ8i78vnoAG9oip00N8zO8e2TaGkVyea+p45sJEgPCW7Sf3xVT2gX5n2us
         LnkoyVRsU3NV+5lPmRk416DOyJF2FoFdMwLueOJZZqzOz9QJH45A/Hd1ZKE335CnMB84
         qVxV4EJlsgMcn9sQ5hJIKwPnsd0Qe6iO8/HBr0iB0rQWj+o4jwIHoxKdtkaAcnqk+XlC
         v/sQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Zz/P8k/tChVGIezRdpPMEv9hZ2Wsjr0Ha4nAf7uEBlc8FltwPtKaTUq+9ztBZcfnGRo1rEg09inh6SCCmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Say1HeMLJpSKHPNTj7a3Zetias0B+KR/kLBiX68YbtNG1dUp
	n5mmwP9gThGN4WNfy/7yYaDwU8g86IeVj5xDtEIeG4a/PDNx8T5wEEBW+JcKeody7g==
X-Gm-Gg: ASbGncu00As5eh9rga+aPlMIuX9hmqaTBW3/y5ZnCBmT3qZJvnYl/suu7Vmy2EKewq6
	+wD4BdL+RiAv5/RIppY02U2KjGYEwVM5nVU406s+UkfO9bx+akUxe0gHoo+A65Bc4ZQ2jju5kCJ
	XTA1BqhG9kQ1krOLgi0W3OAIGX+pNA9O/55b+yK2Gs2s+6C7taEsdIGghFi9HqWpFAsf2DnS+WG
	oPHkXeL090PkZxX1Mg+AuvNj1AeChsGEngM2bNcHkRaQ0Zn9QKNlu4APedp3Ihi7Wqgs/3xWdHk
	m5B9c7cavWYtZHGJ6TZ/9KSIeQAcc9dItgF7LGikJJRQ69449Lf3VN/MGJa5aJ0Z284lX8VqeGU
	fSKAN5jnAgTv7Bdmb/wrCIqeY9vczc7E/Qe0r+JLBwg1lGHjiDa3CYmCAqNn/2BRxcyeEM17qDm
	0xW4DS11Ofztz9z8AQhq0u8B9AgzXA
X-Google-Smtp-Source: AGHT+IHnTH3divp7fqt3s0C0bL0Y26kzFRRxIkA6dzGRmTI5xBy5IO/jgX2PIUsKvH8Kkie5THLlbg==
X-Received: by 2002:a05:6512:63d9:b0:590:9a11:9c23 with SMTP id 2adb3069b0e04-5909a119ec4mr1624042e87.55.1760364907731;
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:11 +0000
Subject: [PATCH 31/32] media: staging: ipu3-imgu: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-31-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151511_397168_342CE5F2 
X-CRM114-Status: GOOD (  11.51  )
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
./ipu3/ipu3.c:534:5-12: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index e22a9c0921957ef2fbf7b8a11fab28e6d78c60eb..bdf5a457752b24bf35e38491d63fc1e059a1e058 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -530,8 +530,7 @@ static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
 		if (IS_ERR(b)) {
 			if (PTR_ERR(b) != -EBUSY)	/* All done */
 				dev_err(&imgu->pci_dev->dev,
-					"failed to dequeue buffers (%ld)\n",
-					PTR_ERR(b));
+					"failed to dequeue buffers (%pe)\n", b);
 			break;
 		}
 

-- 
2.51.0.760.g7b8bcc2412-goog


