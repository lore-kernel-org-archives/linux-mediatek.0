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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D619BC2D0CA
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:53:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8588C2465E
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pugaBg2I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ID1AOj+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8588C2465E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DTi3gS9LqV72MmMl4UG87MDdipmWje8RJwTSIReojCY=; b=pugaBg2I8XDzGGfLGdgwTg67/m
	kii0Sjyk+KKldAd6QoJjDLVjEnEkmd7781eMH0LAdQL2G4QtXCT4ULJ3YRL3NxqgzgHD4EEni9szK
	jNIaal0HdT7f2zpo7GZvInIsoKukkfyS0BsQqQ2HEAl4TbmEshRibyi8nH7M1qroFM7NFF3zOGRlu
	pD0XdSkXOgN+kxKIvewrnHxnfkg0Cg8/EWpgGBLcAefNyL1qA6sI8jqZuKkkN/FWwanEwfvFAgbcg
	dRav3N4V3NHPrl38a9RS3r2wPI5XtogS2070fVwoPINw/4WOx3wBk8Yzltfry8NKuxU7+hILfZD2j
	sP8jEWsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igY5S-0005VZ-4z; Sun, 15 Dec 2019 17:53:46 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igY3N-0003bC-Uz; Sun, 15 Dec 2019 17:51:39 +0000
Received: by mail-pj1-x1043.google.com with SMTP id n96so1972393pjc.3;
 Sun, 15 Dec 2019 09:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WeP5mW5bX8FRuVYI+VlxgSACH3PZvZTDMYz0Hzl+V2E=;
 b=ID1AOj+6c8Ogf0Hu5RDxzXewB10SEfdGb1Sv5+d7Jnh10f5Ti9G6Mnp7WYJ+JvHBMw
 Shs1Qw8ygC1pEBmPk2Y8Kbi4K/5tjj43ezK5rIxZX07WPLIL6y6q4Gm0r6uStqVcyqfh
 EvHvWDrU8OJVtLLoE5W9knOzkIQ0UYH+H6jiiy0H46OeG3zx2tI8brAeIsg7+8bxPk5N
 +T14M+YvMTh+XtVxMyz3VyipChwVCEny8TyCnAQy3/4M2i9Bj4T2ne21MJkeuzf/TtaL
 eeCY+E01S18KAYaAHH5Gi8UBpIY98wZIPbBCiydcMqnPLyS9sewsj2AahiOmtUINUxLi
 MF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WeP5mW5bX8FRuVYI+VlxgSACH3PZvZTDMYz0Hzl+V2E=;
 b=LQ6h0MSfChz5BKtLopc7NQQX7iFCO7TsmV1l+vEC6qhwlmEXMgFL6DE2byNmBn3sbT
 +Fp74DZVs2Mm6TchjYvpRWzMFWvivgpa/5dGYHbhAkKv1t2W2F1ZQqxhTqmwXHAttZb6
 lqBNN4GAuzqhZK5BB8ex5XAcQJWVywu8biIjDLSUG2DZORJCHPcoZcuEqsVwsfmWuGTa
 88kGFyFXJ8AVBz86oDkjDQsovPKSU1/dIRsAbB2j3HPKuOH6mruw6RK+jVepbyrQkWtD
 AGL9hVrg8MxtUCXxmzHNg/O6cWRh81XYqYwzQ6jZmLtynfs1d0RfcoYi28cU15xhIDWW
 xJPQ==
X-Gm-Message-State: APjAAAWVV1RfkMugXQJSBuKZLZZy7Td51Y1w7Jb/x5Gbi6GT6cG+PfC+
 lVFKtKKd183GcgC390rKjEc=
X-Google-Smtp-Source: APXvYqwb6x+cb5JVAvjSiuBW/F0DFFAQ4Dqz9YAQgQrWJMBNZDKKdDo/7lm7jAMWqNB+6idpMU7dww==
X-Received: by 2002:a17:902:9682:: with SMTP id
 n2mr11535190plp.336.1576432297060; 
 Sun, 15 Dec 2019 09:51:37 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id m22sm12304608pgn.8.2019.12.15.09.51.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 09:51:36 -0800 (PST)
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
Subject: [PATCH 05/13] mmc: sdhci-spear: convert to
 devm_platform_ioremap_resource
Date: Sun, 15 Dec 2019 17:51:12 +0000
Message-Id: <20191215175120.3290-5-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191215175120.3290-1-tiny.windzz@gmail.com>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_095138_003368_8572D02D 
X-CRM114-Status: GOOD (  10.07  )
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
 drivers/mmc/host/sdhci-spear.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-spear.c b/drivers/mmc/host/sdhci-spear.c
index 916b5b09c3d1..37f1c41c8a9c 100644
--- a/drivers/mmc/host/sdhci-spear.c
+++ b/drivers/mmc/host/sdhci-spear.c
@@ -43,7 +43,6 @@ static const struct sdhci_ops sdhci_pltfm_ops = {
 static int sdhci_probe(struct platform_device *pdev)
 {
 	struct sdhci_host *host;
-	struct resource *iomem;
 	struct spear_sdhci *sdhci;
 	struct device *dev;
 	int ret;
@@ -56,8 +55,7 @@ static int sdhci_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->ioaddr = devm_ioremap_resource(&pdev->dev, iomem);
+	host->ioaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->ioaddr)) {
 		ret = PTR_ERR(host->ioaddr);
 		dev_dbg(&pdev->dev, "unable to map iomem: %d\n", ret);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
