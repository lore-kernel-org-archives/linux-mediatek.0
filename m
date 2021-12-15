Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8547DC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 23:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GkT68MuocC4+dJv609TmXci9rLzBRTtA5suZ79LuuyQ=; b=qaU7SfndNneBuE
	+4Lajr5TJTOtzAX6h+q10ZqUPOFEDxiqoC8Licy2IBQza8EC7YjgUPvH6Txr4FMZKzdvesYhmdhKY
	/zjD1Y+RuTORNlrWX/VAETrF6K3+wYa5S30rTMr7yB7JL+csjkATiqVRwn825hgOQoy17xCCKmKBM
	/Gq24hfDmxQkmknkstRlOkGYToDJ1OuH5YNiglUudHXan6eihuYzozaELh1nY9PsiGQWXlhBsHRiZ
	czlSjhtWUATVZvUEUA/mitu2/rdOAZyKEJxOkzQx7dFfHt4aSMkXXXQCuXto/C216IwLUZe9wQ3bj
	ZAdpebUjgDJ1Nx13gPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxdVt-0034pY-Bm; Wed, 15 Dec 2021 23:16:45 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxdVb-0034kj-M7; Wed, 15 Dec 2021 23:16:29 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso26780867otf.12; 
 Wed, 15 Dec 2021 15:16:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+NJojSfoVwMgJb/Ja90KiUetfn1vdOAgMVEPVsedxn4=;
 b=KvgKmlmRDaCl4bYWtYl3k0BVslnJDDYur5cMICJjFhpNgPSkbJ+o+GI0+2m5FKjSJz
 21IXovNdmnqA6/IF4mu+gkODk2iWtrYonnDjrgeFRtaw8UbmW+jrq7j2bnrCPnwT0oi9
 l5ZSkVsjKQXuZJIN8FvPPaGy6hF8DyBogT7cSnr60FLtEMyC39/02TJlHdhCx6SfEcXw
 ekkQOcX8ycmfnh9nXFN0EBNhuR7VSOhSuMGC/KFy9jRNjDqyoZUQVvM4TxrhHs6MjWUJ
 BS8r2QWRptKSWrCdFBomVmdY45I2EXH2k4TUgm3xhdBJ+C0jzuj1OMG4oIwPjJwyu1xz
 Vhhg==
X-Gm-Message-State: AOAM533/KX+rQbMePjPvin9hm3IpKCifZM8CxH5j5lNbbd95+I7aWmSp
 ykjG3Mjk4ybRDM9GKRcwJwv4Cqz+XA==
X-Google-Smtp-Source: ABdhPJxe1D9MH0CKZ4DycjsHFTIJBOoLIjt6AIVTztF3s4fwJK0Y3vM/K0Wz5DMCsalknmREVSwMng==
X-Received: by 2002:a05:6830:2707:: with SMTP id
 j7mr10302445otu.354.1639610186803; 
 Wed, 15 Dec 2021 15:16:26 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id g7sm740166oon.27.2021.12.15.15.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 15:16:26 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Bin Liu <b-liu@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Cercueil <paul@crapouillou.net>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 2/2] usb: musb: Set the DT node on the child device
Date: Wed, 15 Dec 2021 17:07:57 -0600
Message-Id: <20211215230756.2009115-3-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211215230756.2009115-1-robh@kernel.org>
References: <20211215230756.2009115-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_151627_755502_28460E03 
X-CRM114-Status: GOOD (  12.06  )
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

The musb glue drivers just copy the glue resources to the musb child device.
Instead, set the musb child device's DT node pointer to the parent device's
node so that platform_get_irq_byname() can find the resources in the DT.
This removes the need for statically populating the IRQ resources from the
DT which has been deprecated for some time.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/usb/musb/am35x.c    | 2 ++
 drivers/usb/musb/da8xx.c    | 2 ++
 drivers/usb/musb/jz4740.c   | 1 +
 drivers/usb/musb/mediatek.c | 2 ++
 drivers/usb/musb/omap2430.c | 1 +
 drivers/usb/musb/ux500.c    | 1 +
 6 files changed, 9 insertions(+)

diff --git a/drivers/usb/musb/am35x.c b/drivers/usb/musb/am35x.c
index 660641ab1545..bf2c0fa6cb32 100644
--- a/drivers/usb/musb/am35x.c
+++ b/drivers/usb/musb/am35x.c
@@ -500,6 +500,8 @@ static int am35x_probe(struct platform_device *pdev)
 	pinfo.num_res = pdev->num_resources;
 	pinfo.data = pdata;
 	pinfo.size_data = sizeof(*pdata);
+	pinfo.fwnode = of_fwnode_handle(pdev->dev.of_node);
+	pinfo.of_node_reused = true;
 
 	glue->musb = musb = platform_device_register_full(&pinfo);
 	if (IS_ERR(musb)) {
diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index e4e0195131da..fd4ae2dd24e5 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -563,6 +563,8 @@ static int da8xx_probe(struct platform_device *pdev)
 	pinfo.num_res = pdev->num_resources;
 	pinfo.data = pdata;
 	pinfo.size_data = sizeof(*pdata);
+	pinfo.fwnode = of_fwnode_handle(np);
+	pinfo.of_node_reused = true;
 
 	glue->musb = platform_device_register_full(&pinfo);
 	ret = PTR_ERR_OR_ZERO(glue->musb);
diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 5b7d576bf6ee..417c30bff9ca 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -231,6 +231,7 @@ static int jz4740_probe(struct platform_device *pdev)
 	musb->dev.parent		= dev;
 	musb->dev.dma_mask		= &musb->dev.coherent_dma_mask;
 	musb->dev.coherent_dma_mask	= DMA_BIT_MASK(32);
+	device_set_of_node_from_dev(&musb->dev, dev);
 
 	glue->pdev			= musb;
 	glue->clk			= clk;
diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index f5d97eb84cb5..1aeb34dbe24f 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -538,6 +538,8 @@ static int mtk_musb_probe(struct platform_device *pdev)
 	pinfo.num_res = pdev->num_resources;
 	pinfo.data = pdata;
 	pinfo.size_data = sizeof(*pdata);
+	pinfo.fwnode = of_fwnode_handle(np);
+	pinfo.of_node_reused = true;
 
 	glue->musb_pdev = platform_device_register_full(&pinfo);
 	if (IS_ERR(glue->musb_pdev)) {
diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index d2b7e613eb34..7d4d0713f4f0 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -327,6 +327,7 @@ static int omap2430_probe(struct platform_device *pdev)
 	musb->dev.parent		= &pdev->dev;
 	musb->dev.dma_mask		= &omap2430_dmamask;
 	musb->dev.coherent_dma_mask	= omap2430_dmamask;
+	device_set_of_node_from_dev(&musb->dev, &pdev->dev);
 
 	glue->dev			= &pdev->dev;
 	glue->musb			= musb;
diff --git a/drivers/usb/musb/ux500.c b/drivers/usb/musb/ux500.c
index 9bce19b5ffd7..8ea62c344328 100644
--- a/drivers/usb/musb/ux500.c
+++ b/drivers/usb/musb/ux500.c
@@ -262,6 +262,7 @@ static int ux500_probe(struct platform_device *pdev)
 	musb->dev.parent		= &pdev->dev;
 	musb->dev.dma_mask		= &pdev->dev.coherent_dma_mask;
 	musb->dev.coherent_dma_mask	= pdev->dev.coherent_dma_mask;
+	device_set_of_node_from_dev(&musb->dev, &pdev->dev);
 
 	glue->dev			= &pdev->dev;
 	glue->musb			= musb;
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
