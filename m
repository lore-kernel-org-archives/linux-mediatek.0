Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB63C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 05:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Duz+R7OD5yozyO0xOdsWZmjZsXtc7sydmF+n4fo7yxk=; b=ud9ssb//vl8RmW+UDCmsrWSn9M
	0baIoJ4maXztnzh81nMsQ9Xa80IAFoNTpphCVuOEdW7PKwhouYJuriqn6NZ3EOQ2XgSSWKsd3CRAn
	bAJLOX6b2IQbO6nQn72uAnh4qsf9oX8oI78txx0YyIAPB9Jk62BnD5OajSLxCqUApE8hLEbTI3Krq
	VurNNSFf2gUmwG+Wi3mGdYoYlBZWead3fSy5BR3nuwhfpXiveN1v8LkCCbtihbFUMSt1Zjp8DygSq
	5iET26yl/jXo8o1oqIBCzCtthj8AcZNlKlE3Btqi1vPPxq5noGWRcQRFmo6H8kTLPetj64bb0Nt4o
	Uk3/LFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKWTV-00000007iW2-0qlJ;
	Fri, 21 Jun 2024 05:06:13 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKWTQ-00000007iTi-2s9d;
	Fri, 21 Jun 2024 05:06:10 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5b96a781b63so648645eaf.1;
        Thu, 20 Jun 2024 22:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718946367; x=1719551167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Duz+R7OD5yozyO0xOdsWZmjZsXtc7sydmF+n4fo7yxk=;
        b=XghAlN3y6anRBtClPLcDBIMASirBHbCBZHd69qgyGh/gnGglq1XEDBUy1kXMepTwAw
         3me/ChNrg7u2X1wRX4gmLxK6TeQ6ZQIJ0UIHjYoKwF6ykbb48hM+9LRal3gMT/fTDFmD
         q6NbzUING1LYb1JIWtziDgwz1WSss+ouMAp1OaRMPgnMkmFUzok3aVy7XQmcbabiYrs6
         xmaBHiUmU1X9R+xrPABOwuGcs3sSBXxYZR+H22UrDXSWsGu6blIgJyraddFLNz4hmlZ8
         ngTeHQ8kh9ZoGmltUiVso7vXAmd72TiutjSDI2cqA8cmkAoVrmVa8GIRdOWErWAgr2En
         On/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718946367; x=1719551167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Duz+R7OD5yozyO0xOdsWZmjZsXtc7sydmF+n4fo7yxk=;
        b=hEVP2Ra3mw0nDRWqPTmE8H2xIiTRWtXRf2NPoTkHFfcHLXP2nqvIHXIYv7MVWVE8AT
         nmYrZx63lc6L4XZNLT3EMcmiqg8KcCtFwCISH7OX8lmrz7lda823+OSn1ceTcbIxFWqD
         4QacLPPFsosGj35q5/Jl3CrvyD1aJVE9tCnNjbNmTu5K9WXxllpAo1R0jn9y2EyNmztd
         U1zKwUfFPb2+8gSw9O6YTjeYC+6t6SQ7euYC9hedDt5iObT9j9XV/zQN/EPr/GO3Rgyg
         ScKSMmkJmgKNpFHYpIHKq9NApeKd7mmye+qpWHFAvx5aQxuYwonp+xjEhaMXgUh4s6LH
         0PNg==
X-Forwarded-Encrypted: i=1; AJvYcCXuYOrfSLy+x8hm5PTt8bfb7uzVB8b3JG4nJBRUFJRLHtp3acspcAzizc5FmAsYzM9SOJPlw4LiOll5yGa3KUDahJg0RmCuLPu/XxjQCCplyew2/PeG9HkkH00OXWsAbWiPb1nqv9CAgCynz4BpI23ZY/q606hWvX8=
X-Gm-Message-State: AOJu0YyZgXr+kPA+mG6mEui2O8H1Cc3n7Jdwo8RqSOF01RRVGXifnFfe
	tCzWH78SSm6JXFoEfeTNkQGpOKJL2JX84Xa4zfOG89sJ71F0+FA3
X-Google-Smtp-Source: AGHT+IGT9uXfh3BNKu1qNO8/2xY3x6EuWChfPz49EjQAep0tUJhHE+dOOG2sFET4fGBrowHmzjImpA==
X-Received: by 2002:a05:6870:16:b0:23c:1f34:730 with SMTP id 586e51a60fabf-25c94d7278cmr6774170fac.49.1718946367326;
        Thu, 20 Jun 2024 22:06:07 -0700 (PDT)
Received: from apais-devbox.. ([2001:569:766d:6500:fb4e:6cf3:3ec6:9292])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716c950d71asm371308a12.62.2024.06.20.22.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 22:06:06 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: kuba@kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jes@trained-monkey.org,
	kda@linux-powerpc.org,
	cai.huoqing@linux.dev,
	dougmill@linux.ibm.com,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com,
	nnac123@linux.ibm.com,
	tlfalcon@linux.ibm.com,
	cooldavid@cooldavid.org,
	marcin.s.wojtas@gmail.com,
	mlindner@marvell.com,
	stephen@networkplumber.org,
	borisp@nvidia.com,
	bryan.whitehead@microchip.com,
	UNGLinuxDriver@microchip.com,
	louis.peens@corigine.com,
	richardcochran@gmail.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acenic@sunsite.dk,
	linux-net-drivers@amd.com,
	Allen Pais <allen.lkml@gmail.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 15/15] net: mtk-wed: Convert tasklet API to new bottom half workqueue mechanism
Date: Thu, 20 Jun 2024 22:05:25 -0700
Message-Id: <20240621050525.3720069-16-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621050525.3720069-1-allen.lkml@gmail.com>
References: <20240621050525.3720069-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_220608_750905_5324D915 
X-CRM114-Status: GOOD (  12.67  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Migrate tasklet APIs to the new bottom half workqueue mechanism. It
replaces all occurrences of tasklet usage with the appropriate workqueue
APIs throughout the mtk-wed driver. This transition ensures compatibility
with the latest design and enhances performance.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed_wo.c | 12 ++++++------
 drivers/net/ethernet/mediatek/mtk_wed_wo.h |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.c b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
index 7063c78bd35f..acca9ec67fcf 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
@@ -71,7 +71,7 @@ static void
 mtk_wed_wo_irq_enable(struct mtk_wed_wo *wo, u32 mask)
 {
 	mtk_wed_wo_set_isr_mask(wo, 0, mask, false);
-	tasklet_schedule(&wo->mmio.irq_tasklet);
+	queue_work(system_bh_wq, &wo->mmio.irq_bh_work);
 }
 
 static void
@@ -227,14 +227,14 @@ mtk_wed_wo_irq_handler(int irq, void *data)
 	struct mtk_wed_wo *wo = data;
 
 	mtk_wed_wo_set_isr(wo, 0);
-	tasklet_schedule(&wo->mmio.irq_tasklet);
+	queue_work(system_bh_wq, &wo->mmio.irq_bh_work);
 
 	return IRQ_HANDLED;
 }
 
-static void mtk_wed_wo_irq_tasklet(struct tasklet_struct *t)
+static void mtk_wed_wo_irq_bh_work(struct work_struct *work)
 {
-	struct mtk_wed_wo *wo = from_tasklet(wo, t, mmio.irq_tasklet);
+	struct mtk_wed_wo *wo = from_work(wo, work, mmio.irq_bh_work);
 	u32 intr, mask;
 
 	/* disable interrupts */
@@ -395,7 +395,7 @@ mtk_wed_wo_hardware_init(struct mtk_wed_wo *wo)
 	wo->mmio.irq = irq_of_parse_and_map(np, 0);
 	wo->mmio.irq_mask = MTK_WED_WO_ALL_INT_MASK;
 	spin_lock_init(&wo->mmio.lock);
-	tasklet_setup(&wo->mmio.irq_tasklet, mtk_wed_wo_irq_tasklet);
+	INIT_WORK(&wo->mmio.irq_bh_work, mtk_wed_wo_irq_bh_work);
 
 	ret = devm_request_irq(wo->hw->dev, wo->mmio.irq,
 			       mtk_wed_wo_irq_handler, IRQF_TRIGGER_HIGH,
@@ -449,7 +449,7 @@ mtk_wed_wo_hw_deinit(struct mtk_wed_wo *wo)
 	/* disable interrupts */
 	mtk_wed_wo_set_isr(wo, 0);
 
-	tasklet_disable(&wo->mmio.irq_tasklet);
+	disable_work_sync(&wo->mmio.irq_bh_work);
 
 	disable_irq(wo->mmio.irq);
 	devm_free_irq(wo->hw->dev, wo->mmio.irq, wo);
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.h b/drivers/net/ethernet/mediatek/mtk_wed_wo.h
index 87a67fa3868d..50d619fa213a 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.h
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.h
@@ -6,6 +6,7 @@
 
 #include <linux/skbuff.h>
 #include <linux/netdevice.h>
+#include <linux/workqueue.h>
 
 struct mtk_wed_hw;
 
@@ -247,7 +248,7 @@ struct mtk_wed_wo {
 		struct regmap *regs;
 
 		spinlock_t lock;
-		struct tasklet_struct irq_tasklet;
+		struct work_struct irq_bh_work;
 		int irq;
 		u32 irq_mask;
 	} mmio;
-- 
2.34.1


