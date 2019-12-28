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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642F4C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 18:36:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42F6A206CB
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 18:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LLhwr6IK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEK8+t67"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42F6A206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TZXmLFe9D+pzbk1R7HiUU2654WjG9KLbvwJCZn7lE5M=; b=LLhwr6IKmTMSaFoc+H2W74Sjig
	zkqaMGkRj6rQ+x66Zofz+mJvo7FE+s8Du3Fu38/EgKKmaTW4xbqyrXI7AEbKyf/rpex7ugZ2Y9996
	b3rjYY9dklaovqvibR6831AqXXP8e860T+o+DcrPfbjOekwk5FI3BmSVJZiIgxhh8AqIYVLxxSq9K
	osH5zz+45TdJeAZyUUoJHqkbq2BracC3X3aqjnPxeT1Kp6PhQPHL4IVl1FR6AvAMBy16+OywooNW3
	ysN0sqTjpfYwjwMsNog/t+MLDfGiSTnMRL3aLS0bDNTaxnW/PsK5oiqdIHEdUbGYQZdaxxJubN6NB
	zFYS4rTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilGwt-0005SK-1g; Sat, 28 Dec 2019 18:36:27 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilGwA-0004rX-Bn; Sat, 28 Dec 2019 18:35:43 +0000
Received: by mail-pg1-x541.google.com with SMTP id l24so16063226pgk.2;
 Sat, 28 Dec 2019 10:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ck7TpFNaYsTfHjkSWvol6O0HxhZOnUYsxWnfPAIODG0=;
 b=SEK8+t673PBtRzm98GmczaWYIBSNYcOrsEXBKK6zpG07VibtJQX62dTHYPFL4w+jn8
 J20u/cIUNnFSow7+ZChaXz0UVQuYAZd8oCZy7nnV/qto1fHLZWL/W5re1lp/81kjaOOB
 0XTi/yHyByCZ8cUJeKUMhCHhH5hUe7VYE/9t2Lum5P7P4pY5ew4fu2nA0QzW4bY/jFRE
 g9cF4BVNx3T84j2SNec0geRbXtvFbo+UyEeTSJ54I8iOJF2CSVxIYb2HDbqnWdvaP1H6
 ZTaEXNeqmvV4XlhIL/ZrmGrACVgGlzp8uUPkzAv+dPL/pbV6GLtTuPbwRs8FyhFH8yDq
 pVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ck7TpFNaYsTfHjkSWvol6O0HxhZOnUYsxWnfPAIODG0=;
 b=hZRYojK53y4E2zTu6OfbOPLkTPWo+3DrVaJiaaM5NPx7l20Zet/Ff7fnGHS/m+YrC8
 4K7z/Ma+XlsZ13dwJWXrxiP43OoBulBik7sXdghvc90wBFUydCQbmQiHSe8uPdAuJitk
 myIjguCd9J/ml/jMVil2Y9pCHcUhe1rbNnlD1p3g4CDdORLrfJCEsJn5Ana4wS973e88
 Wak5P2qNc5SRaZrzVgYwNspE5Uo0cn/TYM7cYP4QFb2FNIX/WhY+nr1wPIOgSzCHc927
 B3bb3cLmGb48k2EFvrbJuVSmU8dlKryX4kcVztX41bX1UhikoOb+MGzNE7G1bTSezExt
 +9Mg==
X-Gm-Message-State: APjAAAVn5at6tau9r0M7P0jPuw2jb4uLMvV6f5wb7uqm5ILgDwlr3Ufr
 ixfuVLI+Ai1U66hlD91TjtI=
X-Google-Smtp-Source: APXvYqx5/QP/GNVoyrkVJfv4Aq0NGpfhph/LLs+Iu2oE/kr2AvgV3Rb9EKdPNpuSs0gUI6foQXJ/1A==
X-Received: by 2002:a63:338e:: with SMTP id z136mr62252030pgz.60.1577558141763; 
 Sat, 28 Dec 2019 10:35:41 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id o31sm42035078pgb.56.2019.12.28.10.35.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:41 -0800 (PST)
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
Subject: [PATCH 02/13] mailbox: xgene-slimpro: do some cleanup
Date: Sat, 28 Dec 2019 18:35:27 +0000
Message-Id: <20191228183538.26189-2-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191228_103542_401607_397980C9 
X-CRM114-Status: UNSURE (   9.70  )
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
'i' and 'rc' are variables of the same type and there is no
need to use two lines.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/mailbox-xgene-slimpro.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mailbox-xgene-slimpro.c b/drivers/mailbox/mailbox-xgene-slimpro.c
index de260799f1b9..908c0eb99b5a 100644
--- a/drivers/mailbox/mailbox-xgene-slimpro.c
+++ b/drivers/mailbox/mailbox-xgene-slimpro.c
@@ -170,10 +170,8 @@ static const struct mbox_chan_ops slimpro_mbox_ops = {
 static int slimpro_mbox_probe(struct platform_device *pdev)
 {
 	struct slimpro_mbox *ctx;
-	struct resource *regs;
 	void __iomem *mb_base;
-	int rc;
-	int i;
+	int rc, i;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(struct slimpro_mbox), GFP_KERNEL);
 	if (!ctx)
@@ -181,8 +179,7 @@ static int slimpro_mbox_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctx);
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mb_base = devm_ioremap_resource(&pdev->dev, regs);
+	mb_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mb_base))
 		return PTR_ERR(mb_base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
