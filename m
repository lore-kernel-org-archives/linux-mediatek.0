Return-Path: <SRS0=fxQu=2M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CDAC2D0C8
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 18:53:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C86206D3
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 18:53:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YrEM1i4a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMuF8azL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5C86206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QTMSfzlML1wVr3VjU6vi/0bFtPcrdXMCzU8+CDro+S4=; b=YrEM1i4aXHS0uYxSOs5IdLCX89
	BT+3FxKeYq0PJTJF2jhbLdoDeV+83G1FNX8TpqrqgZ0iGjVWHxrHlH/+eIeEBtSOZpqR5ChCR5Ky5
	j6DygNyNROpYLUyvLnMmtnUyLeaT3BrRsWDdlw0/TTUX5HurA4S05yFolEqKDyRRBEaT1GFK160S/
	Mszkq22TY5tMMeceljKdvZgBdVQ7m7FW3ERRdPyfeAZ8sbW/+3bf7vLhp0kUkkL0pvmM8V4St4Kya
	tpULfw/42zz5Vw1ABNDSa9eoqYn6Uu/yoEJAabCNsIPRxkt/WO/s6cNp259mWn2WZSl1tMxLb3XZE
	/gsT9kZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ij6M7-0005if-HI; Sun, 22 Dec 2019 18:53:31 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ij6JU-0003Iu-LW; Sun, 22 Dec 2019 18:50:50 +0000
Received: by mail-pj1-x1044.google.com with SMTP id s7so6512851pjc.0;
 Sun, 22 Dec 2019 10:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vbA/SxZM7arQJSBxpfLhl1W8O2cnxPsWXhCTQaV8bqw=;
 b=XMuF8azLQN02i51bK7MY+jsZOPuqljSFDQgTsKdhh/pVSDPy/Tc4Gonb84B+avBTxQ
 c+o5IEggvioE6o134w67CrN1EyeSkThBdEfhNJP4Wb1GBH1Ss5BKT4NL3ne5lNCTGXLS
 xS6D3cR8dWbtXmiz1R6o4g7L+MltNoUyyYBDpVKhhubsWNrxgTi0WZHa4pQ5Xg42aS6w
 teG+bEYZpVdyQh+ds0QAnXz8ja1v38+nAUm8w1vSfjCQeg7wTryA9jaK2I4YRRyknGYb
 H4R32GOSUf7Dn7CNRQ25OkWuDyniKGfpp//nxHF3E1GORs8KP2h2vgggNn+zldhjXWEA
 Y7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vbA/SxZM7arQJSBxpfLhl1W8O2cnxPsWXhCTQaV8bqw=;
 b=LO63Nqfqy8D2uADgy1BhOdDoQ4o6Cbrmd5L5mq6mZ6s1SYwG946tbpOExaVIBYDnCh
 usPkNYl7Yr2lxHbp6QCrWIZOcAkTA956uFjYuJKFYrlE02y5E0ohODUiiJuvzqr/bAUF
 0/ptSLOfK+Ki1sNqHLQBvFKKeFtgkpwdGEwLIew0AkTco2Z/LeeKSu235Dm4B9SNPkrC
 RFbhowhc1C89O8ZFv6WBLbhq2d6eCWffQkQKu5PEuN+SYT3X/q6SE11nknQgl9qyHVM+
 uJ1NgaNcKiimVLD2oKOBz8TxzIsRjqmb5Mrc9pnM9gSRGy0raavkknHREvipgMhEu3x4
 x/qQ==
X-Gm-Message-State: APjAAAVNthoVBbafhjFJJgvSBbNgS34hsoV2dNQYJ9Zi1fDV1OsRWDfJ
 U+GAwl39yGo5gZ0aEBpIvuA=
X-Google-Smtp-Source: APXvYqwGfChxQFCRaBEjK6UXxlwsQA4EJFSFKV8mJBq+/pqe5eDbStpHvTiuLM5YyMNnYuew2Vtf+g==
X-Received: by 2002:a17:902:104:: with SMTP id
 4mr27974553plb.130.1577040648012; 
 Sun, 22 Dec 2019 10:50:48 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id m6sm12090747pjn.21.2019.12.22.10.50.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 22 Dec 2019 10:50:47 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: ssantosh@kernel.org, paul@crapouillou.net, matthias.bgg@gmail.com,
 rogerq@ti.com, tony@atomide.com, lukasz.luba@arm.com, kgene@kernel.org,
 krzk@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 allison@lohutok.net, tglx@linutronix.de, yong.wu@mediatek.com,
 jroedel@suse.de, evgreen@chromium.org, rfontana@redhat.com,
 digetx@gmail.com, pdeschrijver@nvidia.com, john@phrozen.org,
 alexios.zavras@intel.com, sboyd@kernel.org, kstewart@linuxfoundation.org,
 info@metux.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 7/9] memory: samsung: exynos5422-dmc: convert to
 devm_platform_ioremap_resource
Date: Sun, 22 Dec 2019 18:50:32 +0000
Message-Id: <20191222185034.4665-7-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191222185034.4665-1-tiny.windzz@gmail.com>
References: <20191222185034.4665-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191222_105048_760264_00179D4D 
X-CRM114-Status: UNSURE (   9.17  )
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
Cc: Yangtao Li <tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/memory/samsung/exynos5422-dmc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index 47dbf6d1789f..81a1b1d01683 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -1374,7 +1374,6 @@ static int exynos5_dmc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct exynos5_dmc *dmc;
-	struct resource *res;
 	int irq[2];
 
 	dmc = devm_kzalloc(dev, sizeof(*dmc), GFP_KERNEL);
@@ -1386,13 +1385,11 @@ static int exynos5_dmc_probe(struct platform_device *pdev)
 	dmc->dev = dev;
 	platform_set_drvdata(pdev, dmc);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dmc->base_drexi0 = devm_ioremap_resource(dev, res);
+	dmc->base_drexi0 = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dmc->base_drexi0))
 		return PTR_ERR(dmc->base_drexi0);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	dmc->base_drexi1 = devm_ioremap_resource(dev, res);
+	dmc->base_drexi1 = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(dmc->base_drexi1))
 		return PTR_ERR(dmc->base_drexi1);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
