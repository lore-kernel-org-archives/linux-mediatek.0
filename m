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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C59C43603
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:56:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54B2A2467A
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:56:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kQW64COa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQhWosuw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54B2A2467A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fKhh3BIAmJpuUqOztx1wttvkkcVVhwkx/iRcmMMsN2c=; b=kQW64COa/pianxDMttjNnUZRFu
	hN+El7XgN8XlUuknGY031so6hq4Ww2yzwQdEu90k4GR8veKIr1Yif4s/ILri4DuFge4SqXOdC+P/d
	73slFhmHU/8XNBmcfT13s68HLlIDPubjMV5N1e70WbrXBCOTkkQ3PNGLLdDf/BKr8bAyXdoYcyJCK
	ebjwfs5HrB8iAJOmF4oLUo3sKkXsx/CziXswNfkwarObEKanIIhudpDwBRCRVd34T5w+epmAHIjIT
	thIfwzKR09j+3nr5tjyWEjuXa74BXpsW9kE+lAjH7w5/fBomIBv4xMHdZ5tafOV+U6w0cHnAYIdtw
	bA2L1i7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igY8F-0000et-42; Sun, 15 Dec 2019 17:56:39 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igY3Y-0003mx-RW; Sun, 15 Dec 2019 17:51:50 +0000
Received: by mail-pg1-x541.google.com with SMTP id b137so2330177pga.6;
 Sun, 15 Dec 2019 09:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qIcZpVaq+iaWAioOWHH7QyZK8f/ao9N/kVPUnMEajrg=;
 b=eQhWosuwmegDI3J/X1lPGlAItpCcpP+ZIhdz/qqbfb6orbQFKn4DWfrncu89r+aQbm
 fwFbVih2JALiHfXd2X1+MCWrWH4RSC4JuF1cg1BlWTEtAfFqst8Rn+lRBAVP0tw0UWvP
 X4ippjV15+9c/2NDDbj9OjZ4jfMQK2Mw/YkNFEHyUjYZTD77gd1eIeLya1FuM3vgF3P2
 vjSaBoDB6iSDBMHfu1t+WBZHSPnVmfJXVymcmZy84YNbGOuXhINfETqsvsT8t0aBRps9
 0QLO3Lcpmwi5QbvOItENts7vwfPBMP85HHs/BpSvycP+rHMksXVTnIYJDTKTPgTuhqWN
 m6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qIcZpVaq+iaWAioOWHH7QyZK8f/ao9N/kVPUnMEajrg=;
 b=lBNWnMUqDLkPSWm5SXtot7MRFzUnvccwT8yL2VlJMELn4rqKJ4TykwiQwMhEDasrO6
 t67kSy42dnue0RIptz6N5F3hjzFWh8xwvLVp9i864mI1NXGTSAY1ijIgBRvk7Himlm2q
 bxqM13O1XfVM1+hEIw1AX9fW3Y86oM8slSi194YfvJ1lnurWOKamLrnybqm/axGCZCQm
 02CVLwkhOg8k/sZJONPsSEQcpggjxRzM4z5EZajR/REHwLyfzPOX3AxnrFBipIAzXgC2
 f/Y1WIxkZjsns98V6bwBpQ6wKCCikmmLDzp3+iLe69VZbkzwW46DN0a+C5/WQeI6urY7
 dhng==
X-Gm-Message-State: APjAAAXTHb35XitS9dNgzumRCpFu7inWZ91h8uUhI+Jm76jiBGgXcuKY
 FoyTEgBXob4JDKgKJMf8FXw=
X-Google-Smtp-Source: APXvYqzMOkkvgyckqiTIpy5X7VqgwsZVaBxnJUyY/NoJodtBNikPzj1CKS0zJ3tx829QCCA+BuuTIA==
X-Received: by 2002:a62:d444:: with SMTP id u4mr11821902pfl.153.1576432308269; 
 Sun, 15 Dec 2019 09:51:48 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id y76sm19858133pfc.87.2019.12.15.09.51.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 09:51:47 -0800 (PST)
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
Subject: [PATCH 11/13] mmc: mvsdio: convert to devm_platform_ioremap_resource
Date: Sun, 15 Dec 2019 17:51:18 +0000
Message-Id: <20191215175120.3290-11-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191215175120.3290-1-tiny.windzz@gmail.com>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_095148_963728_4A3E228E 
X-CRM114-Status: GOOD (  10.15  )
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
 drivers/mmc/host/mvsdio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/mvsdio.c b/drivers/mmc/host/mvsdio.c
index 74a0a7fbbf7f..203b61712601 100644
--- a/drivers/mmc/host/mvsdio.c
+++ b/drivers/mmc/host/mvsdio.c
@@ -696,16 +696,14 @@ static int mvsd_probe(struct platform_device *pdev)
 	struct mmc_host *mmc = NULL;
 	struct mvsd_host *host = NULL;
 	const struct mbus_dram_target_info *dram;
-	struct resource *r;
 	int ret, irq;
 
 	if (!np) {
 		dev_err(&pdev->dev, "no DT node\n");
 		return -ENODEV;
 	}
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	irq = platform_get_irq(pdev, 0);
-	if (!r || irq < 0)
+	if (irq < 0)
 		return -ENXIO;
 
 	mmc = mmc_alloc_host(sizeof(struct mvsd_host), &pdev->dev);
@@ -758,7 +756,7 @@ static int mvsd_probe(struct platform_device *pdev)
 
 	spin_lock_init(&host->lock);
 
-	host->base = devm_ioremap_resource(&pdev->dev, r);
+	host->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->base)) {
 		ret = PTR_ERR(host->base);
 		goto out;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
