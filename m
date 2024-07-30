Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9619BC3DA70
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Duz+R7OD5yozyO0xOdsWZmjZsXtc7sydmF+n4fo7yxk=; b=WoQDwE/vfJOCryPjJlVzQ0a+YQ
	O0/+w4jwQQXyCU1NzEQnjIZjMM4xj4MvBTZ1ScWwyTSBWyU6dVdRzFj5LXGAJt4IFDnadPzYaMuDt
	qr/GDMRBQyoJPf9fihvshJ4/4rJqOsWFeWWMoVqdTZavCgSNFf1oAepTNoAnkVuVSnKsLDp92KDwI
	K1uyeMQlJ7ALI3QUuVfTj1t7M6AWXRLw7WVD2YGGD6e7jB72WY9aeDHuwZOWjK4VHT0ARLNWUnibD
	Nm+B5QLIBudE1VqR5U/cQOdL+FbszrXl3CBUD6PE2sTSl3Yt3wcJMpxZLr7fCJevNZaGjLpRcx3/P
	zeLEu8Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYrhH-0000000G9gs-0cHR;
	Tue, 30 Jul 2024 18:35:43 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYrgP-0000000G9On-4Az8;
	Tue, 30 Jul 2024 18:35:15 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70d1d6369acso130049b3a.0;
        Tue, 30 Jul 2024 11:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722364489; x=1722969289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Duz+R7OD5yozyO0xOdsWZmjZsXtc7sydmF+n4fo7yxk=;
        b=khnN0WuRqd5b0cnMeEorUEAxtLx+JDESBIjqfsobdmHHz3y0/1dbaYVSb06XwzzPfv
         XQEGJEd56NwTjg/okLTEcrZBntECB6gEh2Boq0100ym/uxvzy5pH3VB/64n4/BKHqd8t
         XPZw1BiDzpLrtHGGNN6aqM3ElJ7LQNMNyzf0V2dbn0NixRjO0FjAALEfqdRQlyuLknvP
         i8AYxbXYzl9+Zw6m8vGODRP95d5LpB81dniBOL7BwmEIRNezXpmO3jDq+9DaiPqwQ8vr
         1jSZxEzBQH0s4cVNRjlUIowv2lD9DdpzZdK9aZ0xSwjhnQNwbk0SQmxGa14PjgYH0c9C
         rKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722364489; x=1722969289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Duz+R7OD5yozyO0xOdsWZmjZsXtc7sydmF+n4fo7yxk=;
        b=LwlbwvNGp7J1hPLBKAfI2ltwR+dmeH84rAjmA8ciZTLJbAojJ88X0NL1jrEP6J5yZD
         2l1bIacSNt4Pu4DQ+mUeXs+kBLpvUqOFJSbjFqTAc5q1yfczxE9x1eH1tdzZIuvk16QV
         TG14Ql7Gi1QQEqW9OnTscDqgfR5LangObpVptiVZ3ou7PRIZi/HmADKqK/8AHUi1YNgv
         O9fBX+PMYR2TaBpR8Wj+oVlTo0/2EssjlVzDRAbu6pdsFfHdthwW2CuB0OmEtPISvsYn
         fftkLHfDmD34npmTszxl6G953PHLAmioLIb+NJaXHF8PLOm/IV5pWVRQ3UhHaJdyO8aN
         3nAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1FzMObCR0K2M6CHhIwx//6VOR0NvnBBbRhdkVnb4BAGsqzTsgw4glD4IWTIHN6Jt0p4LF6AXJyUvtGf99/M/iH/GbuymasYYkUzVdez9LJXi6yXkCUnm+R9k5HQMx9oNRKOukWeWg35G1Defv+8F1CtgjXAGky38=
X-Gm-Message-State: AOJu0YyNBgvQtJgUYRqtHxMlPlWzpjk+XhXcAOoHLeWldq0eayygG9GM
	O5nQbIdcn5K7x9qpYRn8pWcsY0eO8p7sLjS+AkcULLA8g/IN1ArT
X-Google-Smtp-Source: AGHT+IGxxd98poQZ5VsvVAwrejG7muttGAGaSqTTcastI4KpGM1zGNrfIl2gMAD8HKtiDAx4TeEmCQ==
X-Received: by 2002:a05:6a20:8425:b0:1c4:8294:95da with SMTP id adf61e73a8af0-1c4e4883b4cmr4197746637.26.1722364488814;
        Tue, 30 Jul 2024 11:34:48 -0700 (PDT)
Received: from apais-devbox.. ([2001:569:766d:6500:f2df:af9:e1f6:390e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f817f5a2sm7837763a12.24.2024.07.30.11.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 11:34:48 -0700 (PDT)
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
	netdev@vger.kernel.org,
	Allen Pais <allen.lkml@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next v3 15/15] net: mtk-wed: Convert tasklet API to new bottom half workqueue mechanism
Date: Tue, 30 Jul 2024 11:34:03 -0700
Message-Id: <20240730183403.4176544-16-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730183403.4176544-1-allen.lkml@gmail.com>
References: <20240730183403.4176544-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_113450_056841_97CC1B21 
X-CRM114-Status: GOOD (  12.52  )
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


