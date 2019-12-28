Return-Path: <SRS0=XgPn=2S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B4CC2D0CE
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 18:39:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB97721744
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 18:39:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lCccm9z3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBDWwT73"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB97721744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ecd37KS3AIl0ePJLs21seERAFT8w3R8FQyGgc593FMI=; b=lCccm9z3Pa1liNEjlxCXyGncyr
	/Jdz6+AcDUMMEL3CbvbuNdVUaGw2xMilIeJcCYS7/OR3JrHUvTay2D0/2JS4Mfcq5MPdNQyZfHViU
	60KIe1xWExdbsk74uvkpr1rX8nHfMQ/SIUzemADil2z2aGERkRq7UPCsMMi8wjb0GlnOkC3aHrkJ6
	6MW+skzkM7jnaTp1fHhdeoTCUqKPC8c0XpovfvQIwG97l8qAnqg26r91lSACDbA1RZeHGjYES+Psf
	Z3n0ALiHDKQgzGVFPNb8EGys9VBlYjO233Iy6dA5G7hcramQVfNpf4kTT7wG3M3Q4GUAIWODFuxw9
	KOo8Ufig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilGzq-0008D7-Nl; Sat, 28 Dec 2019 18:39:30 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilGwM-000518-VM; Sat, 28 Dec 2019 18:35:56 +0000
Received: by mail-pg1-x542.google.com with SMTP id 6so16059425pgk.0;
 Sat, 28 Dec 2019 10:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=P8HOUTr3eF/0dZg+if1YFcXmVFAjMiDjsMoChiGwrOo=;
 b=qBDWwT735xPG/Q9VTH7Jk7ltHqJGzS3SIxRJyL/UGKLhT7cIiteBnbPNein0+zuYE8
 G5i8IlFW2hE7Oa2TgAYWyq/BO/6LSnQx3UVC/uxt/9u4n8IPFi3wj3qTM60uObs3vPDd
 jQv4IxlP2VO+QrcbqwkFMJqyHITKONYz4jXKqOm+U11JeG/N35CiFkMurclNO0EXtPQE
 Bw21iyPcB3S8P0FC3LPvm13lLMp4aiRHWpIiGIOVR/X04PmcBJrbgvC7yrtjFe+I217L
 5zkbf8OI+YCmGViTfmzsoEIVblJ47JqV2dp9CGtOzypeTVpEdtYAEcY1CAwd2SUPF0yj
 gAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=P8HOUTr3eF/0dZg+if1YFcXmVFAjMiDjsMoChiGwrOo=;
 b=dmSVLjmpLCBSfLemcYkdcNbgzl4ixst4KUGannZLTmkrGe2/DUeY93e4SjIkQ8NtrW
 koJNrPccIVjhG9qSPw33/X8z2y3GItTZg9QBBr4fxjSRFlXZpua5o7lwIstezJGgmuE0
 wpeAhGNm8QKuJTjtn48RSodwwAeiSEi4a3f0VPvzLDYtymTrHt6rpEDiKlwXGXESBD77
 WNnjpIJndCu2OlPs/RS/VQQCaXSL0sdQSswQPuyvQD1IEkzs7oLwkEYt7qPTfy5tvXnO
 1XmQ/J3gaaz0b5rssWmEFR4+nt52cGhVkc8D/0uIkQJTyurEBDhoFGTD49OnBrv5WQEl
 MiEw==
X-Gm-Message-State: APjAAAX35Uzj3OlaR7d9KpcRl4qQaOhxSMZuY/Vyh3I+0N1PDPbwQfKB
 4pWxoH6lxj49quea1IiQOZ8=
X-Google-Smtp-Source: APXvYqxea8vWEh1FOmzdiLRfJsv6AzNkX2LzmseSeWMmZhHvq8Jq9qBoRVY01nxVBzYg5sRmju+cRw==
X-Received: by 2002:a63:c40c:: with SMTP id h12mr43297443pgd.77.1577558153578; 
 Sat, 28 Dec 2019 10:35:53 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id n1sm45063313pfd.47.2019.12.28.10.35.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:53 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: jassisinghbrar@gmail.com, nsaenzjulienne@suse.de, f.fainelli@gmail.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, lftan@altera.com,
 matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nios2-dev@lists.rocketboards.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: [PATCH 09/13] mailbox: sti: do some cleanup
Date: Sat, 28 Dec 2019 18:35:34 +0000
Message-Id: <20191228183538.26189-9-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191228_103555_019214_87C8F0A9 
X-CRM114-Status: UNSURE (   9.43  )
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
'irq' and 'ret' are variables of the same type and there is no
need to use two lines.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/mailbox-sti.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mailbox-sti.c b/drivers/mailbox/mailbox-sti.c
index 2baf69a0b81c..2a2316dfdca0 100644
--- a/drivers/mailbox/mailbox-sti.c
+++ b/drivers/mailbox/mailbox-sti.c
@@ -408,9 +408,7 @@ static int sti_mbox_probe(struct platform_device *pdev)
 	struct sti_mbox_device *mdev;
 	struct device_node *np = pdev->dev.of_node;
 	struct mbox_chan *chans;
-	struct resource *res;
-	int irq;
-	int ret;
+	int irq, ret;
 
 	match = of_match_device(sti_mailbox_match, &pdev->dev);
 	if (!match) {
@@ -425,8 +423,7 @@ static int sti_mbox_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mdev);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mdev->base = devm_ioremap_resource(&pdev->dev, res);
+	mdev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mdev->base))
 		return PTR_ERR(mdev->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
