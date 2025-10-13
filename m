Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A99CCD18D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nh8P+yO8NsicwjNOpOoZpCCNOToSmwS7+PssriFBCJo=; b=L/jbXHL0p0vVHwBAASnxG/3jN5
	J9UhlHFbXz4iIEoRMZo7GKb28VznPS995Enzak+O6kMgpxdw2FQ3MqXHkFFqH30jyV0Vrw0hUIiYA
	OnNd8xz6S+aJZFY2YaUDVRfM4Vnf4+GEiaOT8Hhwp3JWx7KhmrmFihlwtC8aVcFteZEJNFr0J+TGI
	HJlyDSuEoGECUj1nv6h/c12ZMVFjecHJ5IpVv/S4DYQDqCUHc5pW5ZAmML/SvFvpD70kl4T+s0Erv
	UzdfMCO9l5SZQr82CoVcTNPV2nHHVhj2PCJ6yQ8Qj9LBQLrXIeF3wdcM1Fq1uSipji0uKCm6BJH9k
	NDMogr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKz-0000000DM1G-07JK;
	Mon, 13 Oct 2025 14:15:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKQ-0000000DKzf-44n6
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Nh8P+yO8NsicwjNOpOoZpCCNOToSmwS7+PssriFBCJo=; b=KJmyzD/vIP1ex4htT2xtjCg+V6
	nyxAHX8sXaKrmQh9YgYni2ttk6PADffChozZQyt2FkiuQ8fm9Tf9tuB7pg92ObrJuKFroZ/3K3/qE
	1ZfBoFhuJslZyweSMPm74HQee91OP3oYGaDrmuG+MuMMn4KLHRzLoS0I5iIToTWSfjeeYD+RCYEvb
	YxwhTl33vb6azGnJvqCYPWpJOTBDttFyEIF7EhPVlM/UtdiIPjSIZoX2Y0d74OQB1VW+lofAjFNMg
	HQbp4FwKarM4TrpX8i7ADSEkJKCmu+pN4d2TvoMFjQUWmu3Elmd9Gt602V5b6Xjcmr9b+wzeBer4C
	aiiyUWDw==;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKL-00000004NAr-2lfs
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:09 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57992ba129eso5322344e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364903; x=1760969703; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nh8P+yO8NsicwjNOpOoZpCCNOToSmwS7+PssriFBCJo=;
        b=ZtySOHFH8P/R5qIyuKOWgqrRjbXafUArgGsdSDIHPM0dO/+KfQ9CA72Ob0hGY/dAop
         ToUzDpKc826EshLleN/TZq2FxKQeYs3BOFNh5D1PDGqR6f2wo62QmQWvDFrOp9mmXDbz
         jEcypA+N6jhv1/Zm1MF/dvuPirG7l43DeiWhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364903; x=1760969703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nh8P+yO8NsicwjNOpOoZpCCNOToSmwS7+PssriFBCJo=;
        b=BbETkUQf/yLGzY8WtJsX1AuNIxcbe3IgjIBiM0jz52w9Hc4QKqy/VITR99+KDNh0QC
         xzZMvD1Gsbo5toy5xra9NvV2HAuM5oi8sFdfjgh9HT2y+xKjtJxsh+wAgkpyfd6TfIGk
         grgFoIMyvVFoxu82Cwf7Yzs1FVA0dlu9jF9u2BektFtyJufAQAZGeSQjVSpdQUjj3K/C
         D+8CMy4A07kpEfHtC9ZNhXfS/XFVyY9mXk47m+gZ3HdBsRdbYBNQFfc09ODzbZvJWsZY
         Qyij6qt1CfTs9qFKHhPIXm0XQwp3s9st97d2F+4CquZLpoHrapXNBDJSBEW2aAzB/8Fd
         XY1g==
X-Forwarded-Encrypted: i=1; AJvYcCWLYPVnR8ZBAFlZ/vhlDW3Gdb+jHd8J7RGFXULbrV4GAG4QSTbpU81AKnMigVMHqYOC1YNTUEjk6avBSZccPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc1dFN8wjdKMtmk7FHwBEK+nW6yBSoMIOQnbmy77qQlfoa9dOK
	AWDZxaY76NinXydrQD/wonYIMKouWKZT/QuSi7BBIKv1gWsvHu4W2rm5ywfTZNpZjw==
X-Gm-Gg: ASbGnct3h2x0hP9VOwx9EPOkyS347cwt6sbeYAX20aCWbCu3AYyN/1C2VuFmstO7REh
	LYh/Anf5UcJCzqv+WAbI7xG7o1sdr7dDxTVyzPySI0xd8TGU115RIuZP7e3TsPpTyt1tvtHQV+j
	HVRSy9CDBoGFh2yOKDCPTOqcQ9nXE3NLMa98P9fk6VE4tPXyjruZmHGNY8HK06wf5Xeej2pVvO4
	GckiBH2lOYgX5Wbx1UZ+PJQvl4hVPkoremqB8z2VVGJWMbH+D2hMpnaSt7bmBY3IwlrgOfpZHbi
	FDm3LpRi0XJpxKbR3Ade8KTyz0WHedSfi5sG8ztmgvnHED8wGIbuyKfZ1ycllgVjVb7V0UdFMwN
	PmTRHdf4FtcSSL2R1sxKAtGv2DfmlL4Ss6C3uOegXoekEsnD3u8YP41VX+kKQKZQbi6hLvb5tbo
	94OMhhqKzooeBc8YU04g==
X-Google-Smtp-Source: AGHT+IHTiQ/qP/uDKTsRTktboy2tz6+O6QgpLJK8/qSWk5/9SrQl1mdClJ1AYpOXCltPovAllg1/dg==
X-Received: by 2002:a05:6512:3c87:b0:576:89cc:95e3 with SMTP id 2adb3069b0e04-5906dc12458mr6541046e87.10.1760364903311;
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:03 +0000
Subject: [PATCH 23/32] media: ipu6: isys: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-23-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151506_058970_3BD49807 
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
omitting PTR_ERR().

This patch fixes this cocci report:
./pci/intel/ipu6/ipu6-isys-csi2.c:91:22-29: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index d1fece6210ab25de4e8c7b5247f049cc1dd1e677..d858976112ba2bfc2907f9b88dc6c6434053f4a3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -87,8 +87,8 @@ s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
 	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
 	if (IS_ERR(src_pad)) {
 		dev_err(&csi2->isys->adev->auxdev.dev,
-			"can't get source pad of %s (%ld)\n",
-			csi2->asd.sd.name, PTR_ERR(src_pad));
+			"can't get source pad of %s (%pe)\n",
+			csi2->asd.sd.name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


