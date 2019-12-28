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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2C1C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 18:38:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00A00206F4
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 18:38:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m56tUXgI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HggcovvR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00A00206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=05kl2Gb1WSnZwOAUgJu1qLKQ0LcRG2Sz6poqfHPt4Bo=; b=m56tUXgIxxzRXT59mlPwrJ+QgX
	US9neUQ/82pHh5mnYb+N5d7QeFbygh3VfgFGfQ262M8B9lsCEFf6j7GDb5Z/a2ypZLjXlwoBwBcf9
	dxx669vGoqWKn5b8AwiauNN8xj6qYmdlBnf3FYmnyVr+LCp4f/UmJ9ZIbiyX2JHXpaEuG9cHOLFvx
	5APjli919O97OtVG65nyO0uNGiLKbN3VEsPD66N2neEi2Ayz7TB650Ih4HcAsfCzicdr/U647RxWr
	+rPz8awxHryBf6jrQOdzZqQGMLNBEbxB/+n4ftTB45f3HUZ90xsrYt5gzD8I+782zLIg63AcuXgGC
	65FJaXtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilGyY-0006sb-CB; Sat, 28 Dec 2019 18:38:10 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilGwH-0004wJ-Hm; Sat, 28 Dec 2019 18:35:50 +0000
Received: by mail-pf1-x441.google.com with SMTP id i6so9475214pfc.1;
 Sat, 28 Dec 2019 10:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y/sE4xh1t2Cj8E77giYRBaNWrpcKyHc3i8dVPSovTK4=;
 b=HggcovvR0ogFzw+dm8PvFlPesZYlhG5KhXgOaKns7flxoEPrBu2JbFjj1rJ6TylBUY
 grdEZJwUdf8Xt8x/KKOFpBrBeOIxlvRIAkzmjrokl6/A1Kum3J51+xwWoZGyZtEnN0M/
 pBWNiO2rVL2Xx7w8NBxv93DExpYLnn02bNA8fy3tGYc6dqqbaD2IQBCzu7pIqqj2z9yP
 ZRgyB7YwrSGb4TzirAWob2TYmGDLSc7FisDS+xCLyDfmK+EyfAvKzSFXJegZnhpYpt0x
 Ghqc2ZFAS9Snl1W4wohZrcH7c7vQ9Mcpq2GI2OByddPXR3b/pAqdlIWJ7vHUFsfgavdk
 P+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y/sE4xh1t2Cj8E77giYRBaNWrpcKyHc3i8dVPSovTK4=;
 b=VKa87MnicRrbc86QEGrjKLAjhGpVUdFh/jwtKnQxbQikKwqu4K2sRw4pF49KSNDsCF
 pWrCSz1qKxaePCwKNy1Jn2CbiPghVp475bSijn81CNkWuWFph/4OYklPjc0P/dfBTzPU
 mzipHATPW096A+PezhNG75uXjx7iOs+pjZC4NZJcD64MthqfEapwxzOTtK+tbgJEuBDU
 usNDihzG9aXHl5xlT5SssInG1zmf2AcbMIU3iHE95iyYtDfefeskEsNXWFWWwMGE47Kl
 UBNqRu3RVXJbyyCvIRdNRoFJUFB7lBWyvAqb9EbFk5qdzY3h+Ka2/vhplP6i9FV/t/9S
 ojRw==
X-Gm-Message-State: APjAAAWBwzCUZp8qkbZvBVMGCzfnAIDlfxzMHhrh9a/v7Bbn5rTll6tB
 5YmYKyJvdqfyUe0583LSqyQ=
X-Google-Smtp-Source: APXvYqy67ub/4Rasa9TpN7ktqWdCOG7h8UEvzxw+QTUrNSPvo1fREyMoMw31xtaDb43AL7S++RClqQ==
X-Received: by 2002:a63:1b49:: with SMTP id b9mr61252160pgm.258.1577558148388; 
 Sat, 28 Dec 2019 10:35:48 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id t1sm42242427pgq.23.2019.12.28.10.35.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:47 -0800 (PST)
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
Subject: [PATCH 06/13] mailbox: hi3660: convert to
 devm_platform_ioremap_resource
Date: Sat, 28 Dec 2019 18:35:31 +0000
Message-Id: <20191228183538.26189-6-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191228_103549_635807_F0947643 
X-CRM114-Status: UNSURE (   8.95  )
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
 drivers/mailbox/hi3660-mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-mailbox.c
index 53f4bc2488c5..97e2c4ed807d 100644
--- a/drivers/mailbox/hi3660-mailbox.c
+++ b/drivers/mailbox/hi3660-mailbox.c
@@ -240,7 +240,6 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct hi3660_mbox *mbox;
 	struct mbox_chan *chan;
-	struct resource *res;
 	unsigned long ch;
 	int err;
 
@@ -248,8 +247,7 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
 	if (!mbox)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mbox->base = devm_ioremap_resource(dev, res);
+	mbox->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->base))
 		return PTR_ERR(mbox->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
