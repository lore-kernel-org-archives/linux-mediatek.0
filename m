Return-Path: <SRS0=PXBb=2F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC9DC43603
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:55:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5633F24679
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E+de5r1d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dffo/ivb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5633F24679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZrwthG4uBJPXHGy4bum0fyZAlkhiStgRWoT7c2ayW7k=; b=E+de5r1ds8xzMn9uAvmAMmL1FI
	+7ZRhR0ORLw+LHl5zMDNR0eBCy4uGbOwVQS3V3BVPY1RLV37htZWvkIPsT/lNU8FQQRfnsQjxinW3
	2+bFZ8ayl23G3VSUjYRlY9TmgFUT2NN3idBmbHdg+nQGo9mvjw3A4LgPZxHKQWVVrhUd1C/UiGCNA
	da4MOj1CI/p5DTJ+8+fTAN/8FnsTjaCNJhuz6J95KeWhCGm5RBew4wkE5C2WFgiXUR45Cz9MOnutl
	VX45TcYZDUgd/VehCARsX7lPAyBUk0QWkOj9PagrTRlxBQyAvtv0hTktTtgyqPyJT4QBMQrOfaOHA
	vfMo8Q+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igY78-00084u-Mg; Sun, 15 Dec 2019 17:55:30 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igY3R-0003fF-G2; Sun, 15 Dec 2019 17:51:42 +0000
Received: by mail-pf1-x443.google.com with SMTP id 4so4315744pfz.9;
 Sun, 15 Dec 2019 09:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=M4rb0k6npd2G8XmrmT8Mmuq1Mqx3Tqp4JozWv4IeGBE=;
 b=Dffo/ivbPuSxvOTilFvFyuCjze8R3Nz1KdRpjRZXiuzi/VElxSGfIWsE7zsGZ16JIl
 wvqLG4syWI7BDu80fWkO44X0LxOO0zbyOuuPqoHFZE7qxFnwAfg1WM85/YsC08Lr6Atc
 f1x3CHSxQxK4W8uN0GPvNQbdOhAbGrKD/lkgp19Wh+tZzD28fwxnFI/rgDycdti4x/Vd
 NvvdWS9zDoHBOnZcouhEQCaJJTr/qCV+yoefROCP2SQE88CSB79DLklO0AP4rsAyO4us
 kaDbsGbd9ayVBP85+vIGzL5vJ+PoGnyHsXOqkZ2051uGdqVxhI1E/zUisQmkG7MAc+ej
 WBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=M4rb0k6npd2G8XmrmT8Mmuq1Mqx3Tqp4JozWv4IeGBE=;
 b=Nlyu+aSCmjyuRT9TmdFyd/GJ9JtypTpev98y/wPYqUi9yUGzgT3YxksDFkWPO0Gqrc
 amR2kc1stvESWB/+sP9rZ/YunYM95CE9v1gk3hQVj3ESQrWHT4r/s48/NOQM5i6O3/V2
 gRd4wkGkHEBWI55G5GKW1N3oxQySNKs9GanLTBUdnT2XGzmLsp2aJIU6sammJMqBVUjC
 2hO+UuP6IKFMv4Hw4AJoitHMzMqvfAKepnzSMMLdGW7guPGZcoXFiHwhGmmeWQgmmknZ
 vh7kACQHBijf+GwGTB0bpo9pZeuZJ0/2tcvV0vtWmyb4/90uZwX7cZOBpbUZHYyfA66Z
 FLlQ==
X-Gm-Message-State: APjAAAXaZgo9WC6xGd49nYQjWJHoFXmcIyHDo7J0DopbrTESb1pvMoDw
 oimrYeDK2Juv9efa2X2KhWQ=
X-Google-Smtp-Source: APXvYqyQzdWSpl2Sd5Qy8EvlwnGWckT99MmmuRs6mMqDmxroD8ufUiQwLV2+LBkw71MDRzquOsBmeg==
X-Received: by 2002:a63:6f8a:: with SMTP id k132mr13514164pgc.70.1576432300626; 
 Sun, 15 Dec 2019 09:51:40 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id r62sm19900871pfc.89.2019.12.15.09.51.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 09:51:40 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: manuel.lauss@gmail.com, ulf.hansson@linaro.org, khilman@baylibre.com,
 chaotian.jing@mediatek.com, matthias.bgg@gmail.com, nico@fluxnic.net,
 adrian.hunter@intel.com, agross@kernel.org, bjorn.andersson@linaro.org,
 ben-linux@fluff.org, jh80.chung@samsung.com, vireshk@kernel.org,
 mripard@kernel.org, wens@csie.org, wsa+renesas@sang-engineering.com,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 yamada.masahiro@socionext.com, tglx@linutronix.de, allison@lohutok.net,
 yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
 linus.walleij@linaro.org
Subject: [PATCH 07/13] mmc: sdhci_f_sdh30: convert to
 devm_platform_ioremap_resource
Date: Sun, 15 Dec 2019 17:51:14 +0000
Message-Id: <20191215175120.3290-7-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191215175120.3290-1-tiny.windzz@gmail.com>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_095141_557151_99313211 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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
Cc: Yangtao Li <tiny.windzz@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mmc/host/sdhci_f_sdh30.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci_f_sdh30.c b/drivers/mmc/host/sdhci_f_sdh30.c
index fa0dfc657c22..4625cc071b61 100644
--- a/drivers/mmc/host/sdhci_f_sdh30.c
+++ b/drivers/mmc/host/sdhci_f_sdh30.c
@@ -89,7 +89,6 @@ static int sdhci_f_sdh30_probe(struct platform_device *pdev)
 {
 	struct sdhci_host *host;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int irq, ctrl = 0, ret = 0;
 	struct f_sdhost_priv *priv;
 	u32 reg = 0;
@@ -123,8 +122,7 @@ static int sdhci_f_sdh30_probe(struct platform_device *pdev)
 	host->ops = &sdhci_f_sdh30_ops;
 	host->irq = irq;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->ioaddr = devm_ioremap_resource(&pdev->dev, res);
+	host->ioaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->ioaddr)) {
 		ret = PTR_ERR(host->ioaddr);
 		goto err;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
