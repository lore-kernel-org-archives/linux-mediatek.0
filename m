Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DE6CCD18E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtOz2kIfaFHaB3b4Ap3srNj5aje/vDsBh7jaOB3MjlI=; b=Xq6DUEIV1NK6gKaPATfeJvggm3
	2tIDwHa/7AlWfHgSRT4mL9HJJS5MnXVm7vn4vLcoztbckshxE1YoF9iEkMzYax+XTaPvosi/ViBRP
	b9kDPF5KnBESGcttCSfh0tnrnvEkEt6YqxfdBofDINOnN03eNQByBTGpjCVIkVMgQ9BwukLVYZxYS
	U+qGEwcUCd26L2kGmHfOK4wC2scPR55hRHcgLQVB9Y0cP/XH6fiTu4a7ySjsiBtvIDqF+gbuaz5AP
	znlGRrUhK9oe7WtaBi/zbD0CcIX9xUt8afUxjkUwBbcOQ1n0mLYT7zPKxlDvhkqsb7R9ydIpudiZs
	elWdG9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKe-0000000DLNP-1oRT;
	Mon, 13 Oct 2025 14:15:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKI-0000000DKjC-2pDk
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PtOz2kIfaFHaB3b4Ap3srNj5aje/vDsBh7jaOB3MjlI=; b=lqNnmisUNwtQwYxahSefcSkYvl
	o9+BUiYHNBYb5uSIELPx/puYSt7MAqHAnI+SESnQH1qdGgO/OZEtH1aWKJBuicJTisP9cf2heqZ4f
	Vc1NP1pQ6Bz/3Pe3bwZ8TDT9w6bHoZQ0OafICna+6+LE5hE8KZ+t4ZVeBkgvNCf+wOb/qqegFpkf8
	VScLe+NYDtSuHonME5czaRnngQDDbxLxccydxaX74hx1q3WoFdjFVl+Iop7Ch2xBf4cAaGgUU8VLY
	ukjQML491re+9RCZq71y0piwZvU0Klhl1/nBwwERq8RNb8YRzkoknAfLvpe4eLi+wrglaqPTs/Xtg
	tuiEPt6Q==;
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKD-00000004N2W-1VNh
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:01 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5711458e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364895; x=1760969695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtOz2kIfaFHaB3b4Ap3srNj5aje/vDsBh7jaOB3MjlI=;
        b=lOxFNtaHR+Oh2RRG6Af5zpz2E1V46OqR1H5UFSr4JZ9jdLq/07s3i2i/ilaggq/j40
         hJzhnYO95GSpccI3Sr6J1ItRWwEaafvaTD8Jw7r8MNa/9dkCUlBNRvbmUtTRK1fznjz8
         MfLORzxoRJQPh5G2MBp0GNtb6t35xTyDwn+nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364895; x=1760969695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtOz2kIfaFHaB3b4Ap3srNj5aje/vDsBh7jaOB3MjlI=;
        b=RA8KXOUQsA05avVNwHtoSAJuA1y1TOSvrSQ+Z9cvSDS/yBULGeC0zR7ExRbH242kjN
         xZB/4MK1bNizUF0Lw5WhG06qlvaoy9KbBNq1fRHNCjD8edeXuemvvjrodWpSyKLD9jrs
         eSMxJEd0p2WMLsNBKYnhVoG7lYymlODmFSgo3W3H950V3jHWSzgx85zll93fG47w0fto
         PMDedFCIAkHvrDIpKOTUec9w/1Sof+d8zmSV3D/Y+Predx9hEoiZ8O1kx4Tx+FM0Syxd
         5S10FN5p5ux3h6n2SjrQSrJstIlkKN7mhIJbvLnXlv7wha2Y0Rdxlnd8a25T0psrup99
         97Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXcL/sD8DKpVuYf/K5FbbYeTQBQXLMUai2gk2uB2gyd7Jg6QiEXxs681s+52CFNwJjWkyPKYSxS56tMFSioGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLkJxeV9WceAyDm5h0lpay5uvVf2sXLzNloMuPAXgwaNIWLGhU
	amZ0G+66gQLY6N3UXzODyNQuH88ylWt3jf+N/r49ZMAzyxF2b3CY4Cgnv1q/s8hrFg==
X-Gm-Gg: ASbGncsNQDDQc63XLL5dSnKg5VHnRAWrutOf3CSNFkZszclw4AWEneBzi2kFAtE3sEA
	n+WP8ePQ/zOfqgV7kNOUuL3vBJrO0Rxzb1c66BJHI+fmidGUpW4yrzPLCxmZiV3muyIHS2yPW8s
	X6Ulj67Abu9Fu5XIxyacA6IFJ4M2+oqDe1mry0FFZafnmBAkIF9Pnu3olX+pWm578lnUWeYvIsN
	kl2hxnGhlMIbOfaOesplC1pm7ct0aZsZQRSOedtBOVsvtrDHyNOw2zX/R2R8W2XSTQeimwGGDjB
	LhGnZCVz7lV3G2xMQw57enTUzg4cast4bkwwbIvWFG4R3VFVe4tCfGKsEUPwlVTut80NV+1K8wl
	gnJlInMzdFbSwPCgOsWvtSbLXtExfAPnNcmwZFpcP5e3RfyakZbpqQuAPZ+em+PUCOllfLVCaEw
	9fmfvW8R7ruYcbTnyDjw==
X-Google-Smtp-Source: AGHT+IHgj8C7exDJvyPI6OyYwB6RVmsRdyW2/dMuvAdiNw0oCeaD3q0MVrstbMSTaMktl9t7RYe3uQ==
X-Received: by 2002:a05:6512:3caa:b0:586:8a68:9c4d with SMTP id 2adb3069b0e04-5906dafe47cmr6138791e87.52.1760364894546;
        Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:48 +0000
Subject: [PATCH 08/32] media: i2c: ds90ub953: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-8-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151457_512475_D13090F7 
X-CRM114-Status: GOOD (  12.79  )
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
./i2c/ds90ub953.c:779:44-51: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ds90ub953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index e3fc9d66970a762d284955f14db48d7105b4b8c4..087bb4ea555977692c66387a43dab54c12134e60 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -776,7 +776,7 @@ static int ub953_v4l2_notifier_register(struct ub953_data *priv)
 	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		dev_err(dev, "Failed to add subdev: %pe", asd);
 		v4l2_async_nf_cleanup(&priv->notifier);
 		return PTR_ERR(asd);
 	}

-- 
2.51.0.760.g7b8bcc2412-goog


