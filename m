Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE71CCD18E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTfgrP773mTzuIwpFbkRpkdwa1sJQvDkaUU5vsQzRTQ=; b=QAdCMZlwsbci7T1xeYJJwoeYWs
	i/63GrkRUR1ofyF+69k/BqbG9L1Vuv0ZHd38YPg/CeS+rkHRATs2ZGSCONm5NpNJN90xIyYUhbuLu
	FRoPuwHPs8d15t6kv9W31KO/fknKXiJ/YXUjEOyhHxTeKXUT/IF6fI+6QxhDeu0TEYrIgxhuQRBRN
	6BemTBPjab7+mCP9s7FT9elGQHLABHtBOZzSrxNW62VKAOuFWEj9MiILju29k5etGMTlBYmBbAKWX
	7ify/8ZnicLofzh6LLS0FpqTQoNM537Iye4LMY3lbeIu+gvkqbKdPcFS5kPykhS1VGazK0syBVVtH
	gteKDNCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKt-0000000DLp7-2Kyv;
	Mon, 13 Oct 2025 14:15:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKQ-0000000DKxX-0DvI
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=XTfgrP773mTzuIwpFbkRpkdwa1sJQvDkaUU5vsQzRTQ=; b=Vg5mh04ZrEXEMPAPSdDYBIKOEa
	zIxY5gCICtPrJVy68uAbEoNDmUD5n242Tl7zxz7r5c0YQCGQqY58GvTrMCkg5bDyrVaZBzusjMbpl
	0PiJI1lweqjIkVhLvFKGdhs6VkdeEC8r4uxMvWlu+x+WM+KYC6NCs+ELbRQ0n955k2MUF5LZLir7h
	Z2eQrNHwlLuF3736+1NeU5i1x/FY8lcsF7+DkiIU6qcuDURgY3BScVMlhqmepoZc/U1NkXsucG7fQ
	hwYyHGj0QrMOp8W5cWGIaE7miqNr1CcErKYCwyQ7kr0fCCIfcMogX3Hhi6dh12dHb4PVA+QUQYtKB
	D32EgWgA==;
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKK-00000007W4p-2mQq
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:08 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-57992ba129eso5322314e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364902; x=1760969702; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTfgrP773mTzuIwpFbkRpkdwa1sJQvDkaUU5vsQzRTQ=;
        b=XJ3aYY6ojyfENYuqSXXpICiW6wKecTVWIqTKXiS/rr7hPZ+/pGPt1AH8ZJcU588vsM
         TpXZRt3T90A27Ncj1e8BMtkGkl0byPCDgYfo3IASTzKE60bE28WcfgEP7xJ/apJc6h3V
         VXG8UaXX5j9TiYY5verUTEzt34fBh9yp756Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364902; x=1760969702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTfgrP773mTzuIwpFbkRpkdwa1sJQvDkaUU5vsQzRTQ=;
        b=YHHHx9DTIPQKihce+QmxHIpYM01Udky86eNcwA4eDkACodrmSShx0SH+WzPZV4yGfM
         Lo1tvmvL01lneMbGx3mTLvElHcEbymC5r/kD0KQSM1f/k9iDNaNFVYp0sT/phYT7r6z8
         LhQK+yHbAnNEo3MwxHkNeFmYrIpdOmgJrJfJAtgCLMeB8gWdhCU8AxN9ea0g34JF0K/0
         FV4fjKI+FyA2o2OQHRxqFaP3DJtqiAI7kk1Y8VaoCvrTXdaYfHGSUdDibF1P+U73Sfu+
         4RHDDrcrrhtExE1jZsDEPKe72aAcTlwkG6CxAD5SPdC9idjKP7gXbc8nLy64N/tD+c5m
         VVsA==
X-Forwarded-Encrypted: i=1; AJvYcCW64t5CGoZRuX3aEOKJW5PMIvTn41E8OGfgjdmcsb1LKX4yX/9dbJkC0BmBN4s68yGBtdM4vVh1ps0ntRJDFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCEmPLGTvwoYrdx7+l7unty/nSIEhtm2Ld4KrHaNuvhERB+OPx
	VJLYfwzd4fzb9aiBGu5V4Gkd2IExOisLZKuQ4Opm7agTlRPZNxITEokcolg4yWHI2w==
X-Gm-Gg: ASbGnctiD0wODAIT+nNIUn9FgXe70u3NYVGCN/zE7MmmggB+mb0+DfPhcx8YCmzTUGW
	kt0OGOB6VLqdfquNrKpzOrbvrm6uUXWPeKF2KTAyeowTVSz/QsI1m7NFJiBu8DmfIgQQPtSzx5w
	cHxs05ztzJT9FUJfHMsAZUJWVM4dP3b4rwXXQZ4Qi9qy5OKMQ4ql/seLhUJKOtns41fxIygNXTd
	ptiqofKlpDddEyPWefDzJ9Q519qpGsNrqqhWwaBkULnaqoKSLtQGVH9t60jFFU3ScKblLJFkd7R
	HG6vkFc2th7caCq6dhIoIJQdS4NUmmdCdVfejp/tmoVSjoEQCCX23nKiwwScKGkVrMy1IRUON3m
	+xZqeYpRpdNL3ZI5G07yv1IULcydcVXUJMSB7q32YzJw8kYHaFqFhRIqkYUm/5iNvVra2mjbFGW
	+Rn1drt6UtpPyx5Vl6ULBS7kDag+WZ
X-Google-Smtp-Source: AGHT+IEmYSyu4nHTtG8vRgmb2LccUUeX39k0JKnrkMfDo77UUQwM9CrYH1frfefAQcn5JPDuzUf+OA==
X-Received: by 2002:a05:6512:104b:b0:58b:394:fd4c with SMTP id 2adb3069b0e04-5906dd6fb89mr6060927e87.33.1760364902483;
        Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:02 +0000
Subject: [PATCH 22/32] media: ipu3-cio2: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-22-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151505_983770_735B93EA 
X-CRM114-Status: GOOD (  11.92  )
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
./pci/intel/ipu3/ipu3-cio2.c:318:19-26: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index a87f105beb5e267fd450b8a36ef9b0e0ecafc598..986b9afd7cb5b6a07c796b4333f93d427a8c4fbe 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -314,8 +314,8 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
 
 	src_pad = media_entity_remote_source_pad_unique(&q->subdev.entity);
 	if (IS_ERR(src_pad)) {
-		dev_err(dev, "can't get source pad of %s (%ld)\n",
-			q->subdev.name, PTR_ERR(src_pad));
+		dev_err(dev, "can't get source pad of %s (%pe)\n",
+			q->subdev.name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


