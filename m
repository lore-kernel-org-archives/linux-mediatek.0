Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE68DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 23:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKyvTHvV50I8RigNag7bcQtbvStrEgcL7FZ8nQlqhXE=; b=oyJMaW6Y7wCiag
	QFsf9Wn6gtIc7PNzrtuJ6cYCaTjVPNUT6fyxIsX2JmG8coPR6ab7YcgNKclTP6dcs+Nm/JDSbfH7l
	1ak78T5CInBlLhviAdteQm1gbjBOZyFDGFPcKut2Akg3vUowRk5U2EEZG08lqan7yMZoMpkAizuBu
	AeojcXQlLSSornU6208xumardNieXFoHkuyoG+64MctZwMnvMhed8ANELs0AngACTUw6/jpHNMv/V
	KJHsRJO41ldkglZooWYcq1fZkucfQtnLrZOfio51gY6I1IN5FujhMxC8pnAUltm11rLWBpQE/8Omz
	qTavnAc5sm8jr2EuJ2bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxdVi-0034nB-U6; Wed, 15 Dec 2021 23:16:34 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxdVU-0034iV-M5; Wed, 15 Dec 2021 23:16:22 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso26791338otj.11; 
 Wed, 15 Dec 2021 15:16:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tz9+B80iOJ/5SEIo/3X+KGjAczW/DyI87s+/a132hNo=;
 b=oA3sLfm80M4ahxNdwcZdC36bdH6YKBnn+u1orMFv++XPNcqaWhMusHCRZNBB65JX8P
 L4n7JmNHvo8BstUyR+Mc4l7pTgEMD74/xm/tivx/oMyIAZbYITlGpnoWC/57nFCPNIf8
 QyIfjdYtM9Lk99qI5NTXvmO84lFvL/aA7U7++BcQ8bshw1SMHuz/DNaLv79KUyIjh/Fw
 RiuIhuosDy+XIITbYt1y1+bhVvnlZEmNKtoO5XHeXL6Lc5Zfs0rwbI39hmCHgmROZxYp
 UHQRTHF25oUeMmiZ8tmUBPxXeFbfV0fMzNwbe8fSzkvKVKXIj4BbQ8zux+oE8kHdvrRU
 siSg==
X-Gm-Message-State: AOAM530zgrxqgw1SA7ww9Te4lqZLAuAjcctKSPFCIAU7/hv8g3FMHObp
 rxCpXc9Vx/jJzdBg450fLPRJdttUEg==
X-Google-Smtp-Source: ABdhPJyeuLnb0kevinHDK2T33pvZ/O/pvdFFuXTAR+7gZIcqsqM1MJh1TcdtGlPtGrSzj4DAop6kQQ==
X-Received: by 2002:a05:6830:449e:: with SMTP id
 r30mr10991173otv.120.1639610178939; 
 Wed, 15 Dec 2021 15:16:18 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id g7sm740166oon.27.2021.12.15.15.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 15:16:18 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Bin Liu <b-liu@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: [PATCH 1/2] usb: musb: Drop unneeded resource copying
Date: Wed, 15 Dec 2021 17:07:56 -0600
Message-Id: <20211215230756.2009115-2-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211215230756.2009115-1-robh@kernel.org>
References: <20211215230756.2009115-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_151620_745871_C3C05B7F 
X-CRM114-Status: GOOD (  14.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The platform device resources are copied by the driver core, so there is
no need for the caller to do it when creating a platform device. Just pass
the parent resources to the child device directly.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/usb/musb/da8xx.c    | 18 ++----------------
 drivers/usb/musb/omap2430.c | 22 +---------------------
 drivers/usb/musb/ux500.c    | 17 +----------------
 3 files changed, 4 insertions(+), 53 deletions(-)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index 1c023c0091c4..e4e0195131da 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -505,7 +505,6 @@ static struct of_dev_auxdata da8xx_auxdata_lookup[] = {
 
 static int da8xx_probe(struct platform_device *pdev)
 {
-	struct resource musb_resources[2];
 	struct musb_hdrc_platform_data	*pdata = dev_get_platdata(&pdev->dev);
 	struct da8xx_glue		*glue;
 	struct platform_device_info	pinfo;
@@ -558,23 +557,10 @@ static int da8xx_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	memset(musb_resources, 0x00, sizeof(*musb_resources) *
-			ARRAY_SIZE(musb_resources));
-
-	musb_resources[0].name = pdev->resource[0].name;
-	musb_resources[0].start = pdev->resource[0].start;
-	musb_resources[0].end = pdev->resource[0].end;
-	musb_resources[0].flags = pdev->resource[0].flags;
-
-	musb_resources[1].name = pdev->resource[1].name;
-	musb_resources[1].start = pdev->resource[1].start;
-	musb_resources[1].end = pdev->resource[1].end;
-	musb_resources[1].flags = pdev->resource[1].flags;
-
 	pinfo = da8xx_dev_info;
 	pinfo.parent = &pdev->dev;
-	pinfo.res = musb_resources;
-	pinfo.num_res = ARRAY_SIZE(musb_resources);
+	pinfo.res = pdev->resource;
+	pinfo.num_res = pdev->num_resources;
 	pinfo.data = pdata;
 	pinfo.size_data = sizeof(*pdata);
 
diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index f086960fe2b5..d2b7e613eb34 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -301,7 +301,6 @@ static u64 omap2430_dmamask = DMA_BIT_MASK(32);
 
 static int omap2430_probe(struct platform_device *pdev)
 {
-	struct resource			musb_resources[3];
 	struct musb_hdrc_platform_data	*pdata = dev_get_platdata(&pdev->dev);
 	struct omap_musb_board_data	*data;
 	struct platform_device		*musb;
@@ -383,26 +382,7 @@ static int omap2430_probe(struct platform_device *pdev)
 
 	INIT_WORK(&glue->omap_musb_mailbox_work, omap_musb_mailbox_work);
 
-	memset(musb_resources, 0x00, sizeof(*musb_resources) *
-			ARRAY_SIZE(musb_resources));
-
-	musb_resources[0].name = pdev->resource[0].name;
-	musb_resources[0].start = pdev->resource[0].start;
-	musb_resources[0].end = pdev->resource[0].end;
-	musb_resources[0].flags = pdev->resource[0].flags;
-
-	musb_resources[1].name = pdev->resource[1].name;
-	musb_resources[1].start = pdev->resource[1].start;
-	musb_resources[1].end = pdev->resource[1].end;
-	musb_resources[1].flags = pdev->resource[1].flags;
-
-	musb_resources[2].name = pdev->resource[2].name;
-	musb_resources[2].start = pdev->resource[2].start;
-	musb_resources[2].end = pdev->resource[2].end;
-	musb_resources[2].flags = pdev->resource[2].flags;
-
-	ret = platform_device_add_resources(musb, musb_resources,
-			ARRAY_SIZE(musb_resources));
+	ret = platform_device_add_resources(musb, pdev->resource, pdev->num_resources);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to add resources\n");
 		goto err2;
diff --git a/drivers/usb/musb/ux500.c b/drivers/usb/musb/ux500.c
index 73538d1d0524..9bce19b5ffd7 100644
--- a/drivers/usb/musb/ux500.c
+++ b/drivers/usb/musb/ux500.c
@@ -216,7 +216,6 @@ ux500_of_probe(struct platform_device *pdev, struct device_node *np)
 
 static int ux500_probe(struct platform_device *pdev)
 {
-	struct resource musb_resources[2];
 	struct musb_hdrc_platform_data	*pdata = dev_get_platdata(&pdev->dev);
 	struct device_node		*np = pdev->dev.of_node;
 	struct platform_device		*musb;
@@ -273,21 +272,7 @@ static int ux500_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, glue);
 
-	memset(musb_resources, 0x00, sizeof(*musb_resources) *
-			ARRAY_SIZE(musb_resources));
-
-	musb_resources[0].name = pdev->resource[0].name;
-	musb_resources[0].start = pdev->resource[0].start;
-	musb_resources[0].end = pdev->resource[0].end;
-	musb_resources[0].flags = pdev->resource[0].flags;
-
-	musb_resources[1].name = pdev->resource[1].name;
-	musb_resources[1].start = pdev->resource[1].start;
-	musb_resources[1].end = pdev->resource[1].end;
-	musb_resources[1].flags = pdev->resource[1].flags;
-
-	ret = platform_device_add_resources(musb, musb_resources,
-			ARRAY_SIZE(musb_resources));
+	ret = platform_device_add_resources(musb, pdev->resource, pdev->num_resources);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to add resources\n");
 		goto err2;
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
