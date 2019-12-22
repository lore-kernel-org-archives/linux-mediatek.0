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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E909C2D0C8
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 18:53:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F395D206D3
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 18:53:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AD6zv0xe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdmiiwF6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F395D206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7knlhkXLkC36IhGDNnoIUhwu6X6x/UBV0w2TE02n/fY=; b=AD6zv0xefXFBUul0Zmqf5OSHP/
	EDUjWeBF3s4+WO0UmDHJdAU6g6695SssWbHlganKkSNuQchPZhu1mtK7ebHl/V9HjK8Bs+bNukBMm
	mpNCSRA0w+YSWARoj8B7F/wC3uIu+gdiP5AjMUsuspxT0nYovgyS1x/IV1LhD9hqMf5U/FDHFoOHa
	SziBG3W0ieFo65YQPd50zDRgbelRG1W38+8w+gLcaEjz/NZ1/iEbJoGvnxvcAVZF9wp8tm9kcBq3p
	0YcidzCjmsoTYO+u+BnkcGxPPErgDfe0OyTCjnt5Hi4cR0w4eXJk43R9fbHsqGr4LdHv1eg3ykzD+
	F9r1MzYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ij6M6-0005hX-Ew; Sun, 22 Dec 2019 18:53:30 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ij6JX-0003LU-8U; Sun, 22 Dec 2019 18:50:52 +0000
Received: by mail-pl1-x641.google.com with SMTP id y8so6309503pll.13;
 Sun, 22 Dec 2019 10:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=obMvYqnbW6FnclvcaTw1U7yQPLStwyHiLSMoMgJ8DMo=;
 b=RdmiiwF6babAQFWUpUGLy2DZqAwZAi8V33zgiNx7dj87h8phOlTYHtZOMDCQtXFOit
 coQqalsXFCLZlPp6YJ4THC2t7m8EEi9PnxcIXgnqBv8YojpdwQ8b1z12w3XbHM6gRe2N
 9cXHFVzTg5EsYmr3AiWsmm30sn/yrNbhfuYIlptfe1Mjzl/GJ0cPIIf7zQeTlWRApwyt
 ceX5KsTvJkHVzT/jsg270BpkQa+0B9D2w9kYdnxox243iMIwwKPCl092zGtmcZOreNl2
 ops0dZYFpd4iyt33sNOKbW/8D9fDi76pS+zAn59mN4DcCTF39VQKSGfc5uBhAnozFnSr
 F3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=obMvYqnbW6FnclvcaTw1U7yQPLStwyHiLSMoMgJ8DMo=;
 b=CqpONEmweCQMU1yVGtWinS4D1R/uFVwbw3rhF9UWVK+mwoGVLh6qXdkx32fqAJxZ+N
 /i4Ayg2Zh7PKXrmD20CpJBelQM+xpf24NYukijD3mZsfHkrzL+GS09EjxldglAFghFFz
 9tp+FfMeFf0469jH/zyZAOAxm8wdcQKqXVdWuR2vKC/3V919kOuk9EHMYujVaDwwTEvl
 gczbif1p2Rm1hDoHLUoTRFtmPhbVtI1gvNgnBI9rcM/456nRidU9JeXgUQZISDV/Yf+h
 1F3avmELckmOZpZUu4rfiOGx87BcA/k0j35itF8g0zSFjIbieMf7JkfqsArV7vBrquwz
 4gVg==
X-Gm-Message-State: APjAAAU/7T9Mjbo0Jb5Xh9ILkXyY+h/1ehYenigFcWQv5HdXxPaXH1ch
 34nFc/Yhj6l1Peg9UWGyg/Y=
X-Google-Smtp-Source: APXvYqynfZtZtMfgSs1bDem4Zo+v6lSrgRDKxVTy4vingOzHr5+fBrYwncpXVgh6n1vtEUTebtVYcQ==
X-Received: by 2002:a17:902:6bc9:: with SMTP id
 m9mr26918356plt.260.1577040650351; 
 Sun, 22 Dec 2019 10:50:50 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id x8sm21284906pfd.76.2019.12.22.10.50.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 22 Dec 2019 10:50:49 -0800 (PST)
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
Subject: [PATCH 9/9] memory: omap-gpmc: switch to platform_get_irq
Date: Sun, 22 Dec 2019 18:50:34 +0000
Message-Id: <20191222185034.4665-9-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191222185034.4665-1-tiny.windzz@gmail.com>
References: <20191222185034.4665-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191222_105051_383341_8EEB65BE 
X-CRM114-Status: GOOD (  10.97  )
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

platform_get_resource(pdev, IORESOURCE_IRQ) is not recommended for
requesting IRQ's resources, as they can be not ready yet. Using
platform_get_irq() instead is preferred for getting IRQ even if it
was not retrieved earlier.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/memory/omap-gpmc.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index eff26c1b1394..6dd19d168f75 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2366,13 +2366,9 @@ static int gpmc_probe(struct platform_device *pdev)
 	if (IS_ERR(gpmc_base))
 		return PTR_ERR(gpmc_base);
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Failed to get resource: irq\n");
-		return -ENOENT;
-	}
-
-	gpmc->irq = res->start;
+	gpmc->irq = platform_get_irq(pdev, 0);
+	if (gpmc->irq < 0)
+		return gpmc->irq;
 
 	gpmc_l3_clk = devm_clk_get(&pdev->dev, "fck");
 	if (IS_ERR(gpmc_l3_clk)) {
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
