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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B3DC2D0CB
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:56:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1095924679
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sRBi1Xxp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkW7kWPX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1095924679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eR2G+An1FQ7ee7QHT40Kxv47FY1Gh7Pt5bePV+Im+YY=; b=sRBi1XxpOUhS29Xk3/x3FO4IRg
	wv0/b33avgBtrb0pc95QF1eM372PJQyVgrEw5EYIl8gxW1TWF3tZRKfOoUXwEHqZaILsCa3LixV1a
	2yGnobrUcG3eR+e0MHSQuw3/PKhMy0XaDKUs+4f0TwvvQ4nFtfvwa99OgbZigdWM7tkbRmyecsOTW
	ZJM14AKYx+Rl8HjIKPIHl3MiAZvuB+oxMsRuPkhyd/1LSNj57rJSx+JBv7Wsif1r4R4J4pXpB2ECu
	Z00pRszmP1WqFB5AsUApCwTZD+3wEjpGAF0EjMvBFc46q7E+SR61f2FJT2TYiZlOvuPe6wTSQJJjq
	nNWF7kLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igY86-0000YL-S8; Sun, 15 Dec 2019 17:56:31 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igY3X-0003kv-BB; Sun, 15 Dec 2019 17:51:48 +0000
Received: by mail-pj1-x1042.google.com with SMTP id n96so1972503pjc.3;
 Sun, 15 Dec 2019 09:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YhjgtX960UbsjbrvQDkjR25LC0Xp5UzP+rm2Z3AHVDQ=;
 b=VkW7kWPXziC0PIAM0OaTLrvFFbF7v1ufFpviwDay49gsDMIcH+IRBccBJkurcCi4Vq
 q5zOaB1wZls+sDA4pOti1NqA+zCz50hczkno5ZcBXkTH7MAUjtp+hxim8dDi0xM9zlBh
 ORTfc7tfdwMyf44es4S115TlGJAo26zBaga4SP9Y2tm88AQJ8aj2m7/XSID274AaZLms
 r7kAlePWaMqowpfXAbyBnPXOCr/YpBVHULS1GQ8tBd2FKQnh71FuVAqFXVNByMVol0gD
 bv4nHt2lDPvuMrqo5uZe2xwrtq1AVl0Tr5mMHy7rSIm1CxFBmAOLQYeCQ17ker7YtIVV
 /G1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YhjgtX960UbsjbrvQDkjR25LC0Xp5UzP+rm2Z3AHVDQ=;
 b=Ian3PzKiZ1TzvzTEgvifDkDPPi5F72fq6WByrUZK5x1pEsAzlVPGMUMjQhxXDfer+e
 5oDpTg6qZn3dVS6ZwLMnFTXWPlthTeH3S8OI4vXAcAuZtpXSgQvfntmrKE429YvLexrQ
 1BKYXqBBboWPIs68LvfE0Al47qvK/70EM/XGdeeeLdVYN9srPlZLvgL6w7UXCDeJgwYA
 xiC+VMaFVtpRUvbDHxk04TV1AALL8w/RIfg15CDCLKPbV719Fhu/E6wFftLOuqDmN+/m
 RfoWayiMzpuSVfzrJ6zAI6ugVLIyyfpzSprBWFyXx/wtoGD2gpT7oBg5D86JN+Gb9u7c
 Gw/A==
X-Gm-Message-State: APjAAAWq4VKZFq8vpSPwU9YEVznqQCM/8AIhGIAwAIYtz0+R+9nIudwN
 5Pmo9rvQk0GmeqIBCAtvbEs=
X-Google-Smtp-Source: APXvYqyFOVnVHQlrCHXl4b4SA8i+eeSI1R8YkDiMXk+XQeJjyOl6YSByuDfOki4oIhQ8Xaa4GARrSg==
X-Received: by 2002:a17:90a:86c9:: with SMTP id
 y9mr13116519pjv.88.1576432306430; 
 Sun, 15 Dec 2019 09:51:46 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id p28sm18232181pgb.93.2019.12.15.09.51.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 09:51:46 -0800 (PST)
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
Subject: [PATCH 10/13] mmc: sdhci-msm: convert to
 devm_platform_ioremap_resource
Date: Sun, 15 Dec 2019 17:51:17 +0000
Message-Id: <20191215175120.3290-10-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191215175120.3290-1-tiny.windzz@gmail.com>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_095147_472106_A0033A54 
X-CRM114-Status: UNSURE (   9.95  )
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
 drivers/mmc/host/sdhci-msm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 3d0bb5e2e09b..6daacef4ceec 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1746,7 +1746,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	struct sdhci_host *host;
 	struct sdhci_pltfm_host *pltfm_host;
 	struct sdhci_msm_host *msm_host;
-	struct resource *core_memres;
 	struct clk *clk;
 	int ret;
 	u16 host_version, core_minor;
@@ -1847,9 +1846,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	}
 
 	if (!msm_host->mci_removed) {
-		core_memres = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		msm_host->core_mem = devm_ioremap_resource(&pdev->dev,
-				core_memres);
+		msm_host->core_mem = devm_platform_ioremap_resource(pdev, 1);
 
 		if (IS_ERR(msm_host->core_mem)) {
 			ret = PTR_ERR(msm_host->core_mem);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
