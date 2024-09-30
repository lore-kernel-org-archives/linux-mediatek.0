Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA032CEB2CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 22:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0LZHtqzBnIuZo9WgI5XN+fZbaiOF80rdjBOKI8JpkM=; b=Nup5MEyYsvglURYdZ1IZtqtqtM
	+sBlAz0onXSZqPg9NGSkPoqNl0zF3lYn9KxH/meJNXEDrMkmoHn85yfzxSQ45oHbcrRCak/OFSfuO
	NrXoAyWjZ/dpm5fCgc6iYonrhCv0i6nN0EwGxyCEleexYoW/KBHj4h5m2ps+anJzaNWRYHrIdLQwH
	uZjypUnaSjahVlgpsPWes3FrRnZIoMJiR+lg0JOQaFY8soLISVQQcuCZnxtM+ucKSXoxD65/HswXy
	ng/9pToPNDvr8DqklS138+p1aNK7zb29VMPGhCvbcyuPgqEipHfrJ7kjb7yDaAtaO7nPsZhDg+SN8
	CbuxWqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svPJB-000000014XP-3ipH;
	Mon, 30 Sep 2024 22:56:01 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svPCn-000000013kD-3HRz;
	Mon, 30 Sep 2024 22:49:27 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7d50e7a3652so3278840a12.3;
        Mon, 30 Sep 2024 15:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727736564; x=1728341364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0LZHtqzBnIuZo9WgI5XN+fZbaiOF80rdjBOKI8JpkM=;
        b=da7CKKYklXbKTS9qyGsx2ob/72T97V0FRJKgX3A8raqRbj/e1KZ6Vaw6pRbXp51af6
         ujqTPisKpP7ypZZ5FF21ZQ/NMCBDnPg6kHZB6zvv7NXnEnx9U0Mq+rjUMp9WWxko7qcP
         8i9q1yiZANoAJzhUYUL3t4Fn5mrXcC0XiuTAp2hHOFpeZeyoUUXl3zfMDlNfSUL0TtM+
         +YhXMg7zMDfMNUhtl3y0eyw8MAdOkwnBKG5fkaxaAFVQ8XmoYZiImWM0TRw7+vGrDpCE
         PfNqfGCXdO8TxbTcTo7S6RKFNnfqDjGXVXBmBEfnnxid/vLhpFZmS0gkY/CbTFTq4AJL
         sTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727736564; x=1728341364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0LZHtqzBnIuZo9WgI5XN+fZbaiOF80rdjBOKI8JpkM=;
        b=RTzCeaG2owtJzmZKm1IuQROavDiyVdcgZsenS0wXfC1M+j3Gr+b0a6vsRa0JBN986T
         ymmFizlodbi8Cs3eETvAP6oWuH5Uyl980kL8xxLzyYBy7WKjaBWT5bXLP8l9CmMkO73S
         6RN7kECu2k6q7abrEppYRbDkwZdZkCmHJnjlc0mw3wVz0Zj5cLfUcYtGOY6+0tEOdFCK
         8JO3RcTdlJxfpNTJl5ZMGUF5aG2jD1+/b8/6JqpPThBj18EFsX6qP2MUpJdzHMLU+y2t
         mpzlqbfW/Lz9zuhHPWhUu7q2lwbUfZa99SmWDF7Ojy4StSnZ6GpvWWbbaUaE0TczPPvm
         UTcw==
X-Forwarded-Encrypted: i=1; AJvYcCV/5lAq7Czpcx275DKweF5WJONndu8Ghrku3PeBW4Ur5J/9p9muPYm8pQlBerL+bmXTHK3TSu9/m3VxsmM7Q9w=@lists.infradead.org, AJvYcCV5W0lai9saI6yVnxCZiegPCVinBN4q7X+aNjyBOIVwM1PKyPuyN4TX1I7efrEYiNaK1hh4L0vkTZUO3CkCPuZN@lists.infradead.org
X-Gm-Message-State: AOJu0YzC8u0rk7g1NoIKv4bM/tNuV/SNofApKyEh3tWiw8pRz7PEOyqe
	CqbCy24A5PkdYKn+cfe1Okk4BPmvc7ISb5NQMie82x3iwxUNc0uW
X-Google-Smtp-Source: AGHT+IF6EvgE3gl8ueVWIB0I3k9SSFxraUPAgWsvgxyqSPIjf5c8FhCRNnG4kbQalUudlk0nUl/+bQ==
X-Received: by 2002:a05:6a20:d48b:b0:1cf:4ad8:83b9 with SMTP id adf61e73a8af0-1d4fa7dfa7amr21216746637.43.1727736564582;
        Mon, 30 Sep 2024 15:49:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db2b391bsm7029528a12.22.2024.09.30.15.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 15:49:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mmc@vger.kernel.org
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 2/3] mmc: mtd-sd: use devm_platform_ioremap_resource
Date: Mon, 30 Sep 2024 15:49:18 -0700
Message-ID: <20240930224919.355359-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930224919.355359-1-rosenp@gmail.com>
References: <20240930224919.355359-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_154925_889658_249D628E 
X-CRM114-Status: GOOD (  12.62  )
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

My guess is some automated tool missed this transformation. Now looks
clearer as do what's happening. Also allows removal of struct resource.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mmc/host/mtk-sd.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index c607312dfe07..4be13b9c2d71 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2727,7 +2727,6 @@ static int msdc_drv_probe(struct platform_device *pdev)
 {
 	struct mmc_host *mmc;
 	struct msdc_host *host;
-	struct resource *res;
 	int ret;
 
 	if (!pdev->dev.of_node) {
@@ -2749,12 +2748,9 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(host->base))
 		return PTR_ERR(host->base);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (res) {
-		host->top_base = devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(host->top_base))
-			host->top_base = NULL;
-	}
+	host->top_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(host->top_base))
+		host->top_base = NULL;
 
 	ret = mmc_regulator_get_supply(mmc);
 	if (ret)
-- 
2.46.2


