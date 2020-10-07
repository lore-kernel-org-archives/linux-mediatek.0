Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292F8C4363C
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 10:33:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE776207EA
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 10:33:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="udLdbeFo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lH6h7BbO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE776207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rbhB+25Tde8JTcBXlCCeuYWFpaP1ByvY985pGUgOpsE=; b=udLdbeFoekcuhLQbilUHc7+Sx
	oX9p9O7QMokuu0UO5keBpHDbpCRd9zXE+gzt4jT9S8Qyi1rmmYFd5eKXRQDVqpU+tkYCvAWoVzjPL
	TSZV3+Kfe/MDRq8AbdLVqjXsThjoniFqwg/eNsznw6IlQ35h2dcYoZ6D5/UncWvHZ5RufYDMwtIWE
	IJD4+3tF3z9wxQaNzS9rM4J5r7eeov9GTorqnhLHmhXo4Ln9UpD0R19VrefF5wBI/hVWM+bP2PyWW
	Xgo60R6ZHavpYhcEMNxmH9hbUPZ/0UzFIWq9TbsHmC6EMqSEI39C/9QfoBPP06vv6EG/0OqjO48sO
	dwZsCoMnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ6lH-0004gD-U4; Wed, 07 Oct 2020 10:33:31 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ6lF-0004dq-5Q; Wed, 07 Oct 2020 10:33:29 +0000
Received: by mail-pj1-x1041.google.com with SMTP id i3so825778pjz.4;
 Wed, 07 Oct 2020 03:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yopkVMiRl0JzTsUJbYFwoQcRM3hdbNjVcOO4o06jw/c=;
 b=lH6h7BbOyF/zl8kPRNyqwm2e3r/7iU3ffvEzAWfVGmwnB8OWm7QQjHrXAPsXpiuk2t
 XKzeC4ccawxF5faQ81tsXUxSrOdEBMsBDE5WzlIZmOn9XDf3TjjCtJc8xduzUt6MlY0q
 x8y6LgMY6QmQxpgGM+GKzPz7yiU70OJEzAovEi+SYhhKhfRTW1/ckII/ULExNZriurmU
 kHkleH1s4/Gh0p9FRN6r0O+hVnRJEVNZvAnX+9t2GeVht24K40LBN4KslS+KwYcM9kXw
 dVYoSXbbLNvi/UAMSwEGQEyHQsbRp371j0REnhKVAMSE4gH6ZQlpg1KfCDz9k1Pj1Wvl
 xDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yopkVMiRl0JzTsUJbYFwoQcRM3hdbNjVcOO4o06jw/c=;
 b=Ac5BkvuQolYt4JJ1XB0piL6uW1aoob7AkwXgflZ8ImvB+KFQUAltOL70GHRxTPDo86
 lroLeNMx3qVHQihB41+zEK7LDjyJ3ubhzVXYxB34Q4Mv19DUmmFQjH9qfy59x8/fk+8l
 mwV9sKuJW4pQD4S2go8nfpomjk1T3cuBo8gHYGsc0F3zWgc/KD7UzLTeXoLeMAPfOCYF
 ioltaBuXRlC+8bS2/BIzyXmNc8RR8Yp9j/nd+4I9VrXjYsjEnyS3ohCFDLxGc8jZNED/
 j/og2+soYKx+50hpucY+mpp3x3wMMj66CuNPam5CdWUbMke9WfZCE45+v1fSCASFlcfC
 v4TA==
X-Gm-Message-State: AOAM530j4duG9SEcK0JIFOJdwY9Qw1xY70nqMxbJJoTtuZOl0BD52GRX
 6xBPj0MW0s2JxLnyVKARurs=
X-Google-Smtp-Source: ABdhPJwVlGCYBw7JNMhbASV+Ji+WfANWd8GPRE+7SevSgBbqnD2OiOnPlxxBmZgCvkEyxcb+Z/nc7g==
X-Received: by 2002:a17:90b:1b0f:: with SMTP id
 nu15mr2273222pjb.231.1602066807230; 
 Wed, 07 Oct 2020 03:33:27 -0700 (PDT)
Received: from localhost.localdomain ([49.207.204.22])
 by smtp.gmail.com with ESMTPSA id v129sm2705327pfc.76.2020.10.07.03.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 03:33:26 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: kvalo@codeaurora.org
Subject: [PATCH v2 2/3] wireless: mt7601u: convert tasklets to use new
 tasklet_setup() API
Date: Wed,  7 Oct 2020 16:03:08 +0530
Message-Id: <20201007103309.363737-3-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007103309.363737-1-allen.lkml@gmail.com>
References: <20201007103309.363737-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_063329_219234_8B71BFB0 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, kuba@kernel.org,
 Romain Perier <romain.perier@gmail.com>,
 Allen Pais <apais@linux.microsoft.com>, davem@davemloft.net, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen Pais <apais@linux.microsoft.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/net/wireless/mediatek/mt7601u/dma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/dma.c b/drivers/net/wireless/mediatek/mt7601u/dma.c
index 09f931d45..5f99054f5 100644
--- a/drivers/net/wireless/mediatek/mt7601u/dma.c
+++ b/drivers/net/wireless/mediatek/mt7601u/dma.c
@@ -212,9 +212,9 @@ static void mt7601u_complete_rx(struct urb *urb)
 	spin_unlock_irqrestore(&dev->rx_lock, flags);
 }
 
-static void mt7601u_rx_tasklet(unsigned long data)
+static void mt7601u_rx_tasklet(struct tasklet_struct *t)
 {
-	struct mt7601u_dev *dev = (struct mt7601u_dev *) data;
+	struct mt7601u_dev *dev = from_tasklet(dev, t, rx_tasklet);
 	struct mt7601u_dma_buf_rx *e;
 
 	while ((e = mt7601u_rx_get_pending_entry(dev))) {
@@ -266,9 +266,9 @@ static void mt7601u_complete_tx(struct urb *urb)
 	spin_unlock_irqrestore(&dev->tx_lock, flags);
 }
 
-static void mt7601u_tx_tasklet(unsigned long data)
+static void mt7601u_tx_tasklet(struct tasklet_struct *t)
 {
-	struct mt7601u_dev *dev = (struct mt7601u_dev *) data;
+	struct mt7601u_dev *dev = from_tasklet(dev, t, tx_tasklet);
 	struct sk_buff_head skbs;
 	unsigned long flags;
 
@@ -507,8 +507,8 @@ int mt7601u_dma_init(struct mt7601u_dev *dev)
 {
 	int ret = -ENOMEM;
 
-	tasklet_init(&dev->tx_tasklet, mt7601u_tx_tasklet, (unsigned long) dev);
-	tasklet_init(&dev->rx_tasklet, mt7601u_rx_tasklet, (unsigned long) dev);
+	tasklet_setup(&dev->tx_tasklet, mt7601u_tx_tasklet);
+	tasklet_setup(&dev->rx_tasklet, mt7601u_rx_tasklet);
 
 	ret = mt7601u_alloc_tx(dev);
 	if (ret)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
