Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9134EC07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:20:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53B4861CA2
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53B4861CA2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=crt90W1JfGE9wJVtYLdUKVYRmBU83kc+DbXudgo2b4s=; b=MUBCnK53a25Dgb
	5gyaB3algQeJ6OY5UEMfFK0P7fsN06osP5chH70vH8z9xuClx5F+15GzJMR4Hl34+YbDz35zSXN/q
	WwAAbASNFZxlIsVJslYw67yfneF3wHm4eYogvaT4FT1Xo+wFbfASie5/aZmu6Bdtb6sifTO+ggyGN
	0w2sr8KBv67PdshHFgAODfqj8ubYZedb28QyskJhtLS5YvSCa2gmhV9EkEhtovFW+9qEgT1k9N4/g
	WTu8rGgkAFmvKYonMJBjUbPxkRx/cCf7kLWmD7DrVcjvN01jp2f7JEjzzC83Qbmn62BjxiT/v/itC
	mv7aQQI362rqvSmpwQHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m10v2-00DeBf-Jr; Wed, 07 Jul 2021 06:20:24 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m10v0-00DeAu-2u
 for linux-mediatek@lists.infradead.org; Wed, 07 Jul 2021 06:20:23 +0000
Received: by mail-wr1-x434.google.com with SMTP id t15so1622749wry.11
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 23:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h2fXCkouqdbmp7Z9kcktP6xNq2Is38h9hhTT8ja6vbA=;
 b=qV6gbaTvUDysv+HSNan2FtngVDQtVQrUXZ/X1dux1FK0m6QFr94lHhiJ4srmN18ykj
 iYbNH9Vuyp7b27GrhLJMKBgS9PSK+oCyk/g7MADW8F8k6n4+un2nLXDsuYq+i4a9iZUs
 T9Net+M32qbBZ35Y3AFPS0+UxEreFAABG8cZNRt62qt+FaulDdPnA5iI1RJGXm0Hhp0Y
 1JGsjTwgh+CwtiFymOrsgs36RkmsfAQcgQjvyFPXIUbqTanBz2w7uABP29CVh5T3g1Ek
 8y8G6ZsTqUTNJHtuZnw/SjH1wUdpndcfLXyaTTJdYvY9OU/EyE4r3CBAY9rZDRc2WORH
 J8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h2fXCkouqdbmp7Z9kcktP6xNq2Is38h9hhTT8ja6vbA=;
 b=kU67G616RMXp3XKsYF0DxlCrPQUadzHarb2lWpaeNRWxzZdQ2iPOp7WqYHIA+JvVrh
 F5hzSb8TVQHijPT/DLfAUy1KGM/fsT6DFwN6viWqw7OKACt9Ua7Ghpmrqyywt7TMukqa
 6JbDagcd64F27TCqZDcGHw3qiCKCHFH2XNAgatp6lFhGVrrJyFXJsPB567UCaU8zmm0/
 YY1uZg5MwT5PBq2mZPFKnn3LOPr8DoFhcfBpOyopN0xNfMRFLAIo304K3csqD3oKHvd5
 OKtgSgx8+JiXtIqdvFDV8cpr97i7m65/szd4CDHvhFumnoFUOJOrwzhCW6/GKL6SWtOV
 gmJg==
X-Gm-Message-State: AOAM532NQCgffaItCFfxILui9l19jYhl7woDImrCV4Zli18e7JVvi21a
 5YnKa0kLY31Xy568PiGhJxLT5A==
X-Google-Smtp-Source: ABdhPJyHZyPpfw9rgdM//da0+Xu1NXtYBTAkrJqPRUpIxzxoXzD1vo5ETbR1R0EfjK52LM0WlppMqg==
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr26800136wrn.248.1625638819834; 
 Tue, 06 Jul 2021 23:20:19 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id g1sm5264463wmh.30.2021.07.06.23.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 23:20:19 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH] irqchip: mtk-sysirq: Skip setting irq-wake
Date: Wed,  7 Jul 2021 08:20:04 +0200
Message-Id: <20210707062004.782787-1-msp@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_232022_189075_3E6562CE 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk-sysirq doesn't require specific logic to work with wakeup IRQs. To
allow registered IRQs to be used as a wakeup-source, add the flag
IRQCHIP_SKIP_SET_WAKE.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/irqchip/irq-mtk-sysirq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 6ff98b87e5c0..586e52d5442b 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -65,6 +65,7 @@ static struct irq_chip mtk_sysirq_chip = {
 	.irq_set_type		= mtk_sysirq_set_type,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.flags			= IRQCHIP_SKIP_SET_WAKE,
 };
 
 static int mtk_sysirq_domain_translate(struct irq_domain *d,
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
