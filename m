Return-Path: <SRS0=ko7i=ZB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E494FC43331
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Nov 2019 11:37:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5EE9206BB
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Nov 2019 11:37:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eOYnmJpa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fA9LXUTy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5EE9206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UVGwPBGWi3cNRMcSm8jQlhtHdQHY1bnocz5Lom31e+k=; b=eOYnmJpaOxi080aNzLHRPNCnit
	fmXwivNItVWfWHjFSpX//m/tj8Nci9Gmh0vbJfhuAt8L1FKlNL0DiSZ2nEeiUfc0UxN82qpc2v6JN
	7AWoGpYDT17JmLQgUhUcWVLG6M+bd2iUY7Pqhm0mktLhF9IwY/9Yd3Uwp4uWTTLN+R7v4SY3YKXN2
	vNsWGBRYsq8aOaatKpL3wWq6QPR/RbchHMXe2QbJajq9lD+AV/0TjrSFdVH6RZv5ZScfMQmAYpemd
	nlBpg26H5PXlMUWr5UT86Iako50+3P1bhZQ/yHsyjjRTzrYsD6DCRL0bQVi7I17boYIvdqKOv95ag
	v8ynWliQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTP2A-00005N-PL; Sat, 09 Nov 2019 11:36:02 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTP23-0008QE-M0; Sat, 09 Nov 2019 11:35:56 +0000
Received: by mail-pl1-x644.google.com with SMTP id d7so3590414pls.3;
 Sat, 09 Nov 2019 03:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RPkvyrfedBbWeyTZwzNlXB9DkGbGD3+8P8FOhsdkoDw=;
 b=fA9LXUTy+uzBaE6ACg3sMciWy/pmk8bafM5PrJlxx+/61IoyBypuhoZDWhxguCQnzZ
 QIZ0rNbf0hHAtHzx2qkbaM+RGfY7lmNfNNfhWRrXvlW0tXIgSBlV+QFPhHux2JYxcjC4
 tbhF5VYQ/4ZBVisASZmfOqMwvCuOZeJiZ84fu98M//x1ppDOx2iLkfVpdRDueEwNv8pT
 ryA/6FtYt8U70JlR8won7D8N+SzDgUf98jjOUxXow0UTBpHQMub1r5DDaQmPVxw2Jcmk
 gI7EKyGdV4ya4aplh5FnQzsnWJi1KtiQDeCaY+olpoVnIj/04Vp/uKV3y9Z0GggREPHk
 HcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RPkvyrfedBbWeyTZwzNlXB9DkGbGD3+8P8FOhsdkoDw=;
 b=t7PAKjOVtJgO6HHWUQ5PU/M2InZ2Gw1tdfsX5ZTB5kHOKi8hfYKKnjNCoVuNWmvs80
 33EWcalrbFJD6yneaAcW13TjMvL4G+/4x2FIJjQQG3N8PTmF3uzI0lE7uA6fUZ1M293D
 6VmnL5vHP5/QOYvVGOievIJ/6OGUv9FcJn51n8RvBsCj6AM/d8ZfEFfkUGoz22sFctml
 cyDk9vkaBaR1iyzO6bAGJ56GMeojZ4ihnbinXo+QlXnuzGHg2prv+/pE99fTFqdDNPMG
 JYt93OHZD/p4veHqH/h39h4j3q4Dqct4FezHQalFK9TS1GnlJdOVP5hmblZvT1M3uMMW
 ICqw==
X-Gm-Message-State: APjAAAUM5geSGTFByPJYz1Q4dz3wWgYAkleXnVq+TLUFEplabb1HAClS
 xk7E/2J6xNV4TB0oVLgav0U=
X-Google-Smtp-Source: APXvYqzwtXIY+k0OyvUU4Bkg5AOcucS9hxURQZLsvnV9PlC6QBWMaauMMsyzwgYYWy1wRwhboZNu/w==
X-Received: by 2002:a17:902:9681:: with SMTP id
 n1mr16143620plp.87.1573299354291; 
 Sat, 09 Nov 2019 03:35:54 -0800 (PST)
Received: from localhost.localdomain ([103.82.150.242])
 by smtp.gmail.com with ESMTPSA id x29sm10518172pfj.131.2019.11.09.03.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2019 03:35:53 -0800 (PST)
From: Satendra Singh Thakur <sst2005@gmail.com>
To: 
Subject: [PATCH v1] dmaengine: mediatek: hsdma_probe: fixed a memory leak when
 devm_request_irq fails
Date: Sat,  9 Nov 2019 17:05:23 +0530
Message-Id: <20191109113523.6067-1-sst2005@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105165914.GD952516@vkoul-mobl>
References: <20191105165914.GD952516@vkoul-mobl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191109_033555_720888_0EDB7654 
X-CRM114-Status: GOOD (  11.86  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Satendra Singh Thakur <sst2005@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When devm_request_irq fails, currently, the function
dma_async_device_unregister gets called. This doesn't free
the resources allocated by of_dma_controller_register.
Therefore, we have called of_dma_controller_free for this purpose.

Signed-off-by: Satendra Singh Thakur <sst2005@gmail.com>
---
 v1: modified the subject line with new tags

 drivers/dma/mediatek/mtk-hsdma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index 1a2028e1c29e..4c58da742143 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -997,7 +997,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(&pdev->dev,
 			"request_irq failed with err %d\n", err);
-		goto err_unregister;
+		goto err_free;
 	}
 
 	platform_set_drvdata(pdev, hsdma);
@@ -1006,6 +1006,8 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_free:
+	of_dma_controller_free(pdev->dev.of_node);
 err_unregister:
 	dma_async_device_unregister(dd);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
