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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EA2C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 18:37:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E112206F4
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 18:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XzmHHtdj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TN5UMyKt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E112206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=b+m5sWnX1LT5gzQsLOBE4dxWzBZU7Y2vS2oFAZ6NFXA=; b=XzmHHtdjHMHvh2w+8BpTriTSED
	IJoJ5ZdSBWr3MlmzxO/8lkMLPXiUMLZ3SGpdkrIYv6hiW9E6yz5P9Pg3W9MLxLT6Nwq8ABeRifIP+
	ZInHFsR5bvSnrUy5ep5Gwa2I/XYjCet+SRuz1exlT2+DraCWmnAX5Hfk00qie4g3d3hEBfCqTOpqz
	stJjgJtN9yhq5z2ODTcuqflrTViTfw88dzPNCP4EHv2y2GpSdIN6rsWOGpcJ5pXsO20eaK/CqCM//
	LEttF+HM9MsoBkgNoD+zfF5etFnOce8+ajq6OvPcCHn0Q7qbaz8yAQU6blNTm8FzQukdTyZfAOS4+
	Y3UWvdLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilGxk-000642-Ml; Sat, 28 Dec 2019 18:37:20 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilGwD-0004sl-Gs; Sat, 28 Dec 2019 18:35:46 +0000
Received: by mail-pf1-x444.google.com with SMTP id q10so16317003pfs.6;
 Sat, 28 Dec 2019 10:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hqSfykticrVROnPZePmOru2pp1VCz0LFD/v0VexrqBA=;
 b=TN5UMyKtGRFA9r24t/ZYgRXLOw/LCoKmhLVbbsgo4/9YAbF01PPDODx3Tg5TIqMice
 9+t2T8Cz0hK+BqG+Xyey3W3XOXnNK/H9hEE7XXjFeftyMBA2os7fKbrgmOF3Uf5qv4wY
 Kad1ZksLn7TWdjNFT78COriJqMCYMQlUSNkosa2FmFDxWXLUSMcitCKdiboBnxd0zQWr
 hi88HS+npw/ogvjqq/+jY0hby/cENDfini7neUTe9xDcEijGSkGIfMgDPXTucJ+luVYd
 g5QYLr1IVKvSeLPoTvbnpyRgJMJu43ss8Kly5/kDA+r+v1DElUws4jNDk1dao/QCykbv
 jxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hqSfykticrVROnPZePmOru2pp1VCz0LFD/v0VexrqBA=;
 b=lh+GACuUTHb/DFo4ap4qOG5OeWrVPUiiBPxie9T0prHB/hRbJQK2sFsQLnI81sQVWe
 nDm+ypAT8xZx7eg+u2n+yqTFQ/poUUnbGvHFoWC+v2niV38wIHg+17P5A+qf7z6EJeIL
 C9upoVBkpgS31JZjvhggLPnVNQfOCYbNvSV8nom58Ck+oS67eE5FrxpK0ROqaVw4fWp8
 3KiKRq3Foz6NloE9mBGD2jf/KqTCR2xu6RMAkUIvlHJt4cbkXJuEL9EG/IvOlLwEgu0P
 ZQdJ9CP2V35zdnQ43VvlOmL5avbNXNHYcCocdnkeoz7yJRYUM8V7eBC68+QHsGuEy5VY
 53TA==
X-Gm-Message-State: APjAAAWDDam0qtrjl/CVselLop9DK4nNxG2GZQ0KHhVmZZgIcedbsk7I
 UoVlHYisVruOT7bnM0vkWuk=
X-Google-Smtp-Source: APXvYqxhLmtho2czElmGfzLozaAqFNdvpPt2BmXqglNEJ0AN6V99RjBsDbUR/heJgBjeBiaCFQdPeA==
X-Received: by 2002:a65:621a:: with SMTP id d26mr59969401pgv.151.1577558144795; 
 Sat, 28 Dec 2019 10:35:44 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id k190sm42068720pga.73.2019.12.28.10.35.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:44 -0800 (PST)
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
Subject: [PATCH 04/13] mailbox: mediatek: cmdq: convert to
 devm_platform_ioremap_resource
Date: Sat, 28 Dec 2019 18:35:29 +0000
Message-Id: <20191228183538.26189-4-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191228_103545_572012_BFFE6EAF 
X-CRM114-Status: UNSURE (   9.41  )
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
 drivers/mailbox/mtk-cmdq-mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9a6ce9f5a7db..7f9e34b021c8 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -458,7 +458,6 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
 static int cmdq_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct cmdq *cmdq;
 	int err, i;
 
@@ -466,8 +465,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	if (!cmdq)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	cmdq->base = devm_ioremap_resource(dev, res);
+	cmdq->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(cmdq->base)) {
 		dev_err(dev, "failed to ioremap gce\n");
 		return PTR_ERR(cmdq->base);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
