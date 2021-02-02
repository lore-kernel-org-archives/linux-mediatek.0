Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99916C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 14:05:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D240264E7B
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 14:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D240264E7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vzGa4z0Ss/JAEdI9WvNiL2fpqPvu5yhAh0HlRFDn55Y=; b=UGMq2e6d9K0MM+553rJQsHA/C6
	sCg+5o0q+yqhD+napGEGT2SkdFoT2A1wrpooWMQVZ6FTMUUo9/KobkjcV0JrmtOeaQSuH7pUFxKE0
	2itNGSi0JO5yL7dy4rWV8FxuWJXjtWne9hEXRKTPGmALE+H+pyE8jEWW8fKk1jUtds5Z+KtTdZntr
	sowto/ysNWCTrxq5qSJ0yzE0deeEWRk2JPmuwTEVjkBK/0Bq69glilvWX1XPVOLEeBWMB6c+SRlqD
	bbh5v3cwQx0PU204fnNcBOUCCIDOw0dF3KEDHogSix93eHwTKzaxPL9GnS+J69dQGA7DQvz7yXyBE
	xL6qe+cQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6wIq-00060p-KQ; Tue, 02 Feb 2021 14:05:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6wIo-0005zo-Dr
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 14:05:11 +0000
X-UUID: 023200eb6815428eb85d1735c7f16f5b-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ml/3SSiKgk1ZdU4cg0QysWS8Fqe8Dd4tgIdI8g/9AZ4=; 
 b=FyyMfIHPWe95oQJ2Uh1K55Oken9OJcguXa3peAqnA7qXeiv1S8EMMnFOJ0UDkTY3A0ROB7R9nkwwwJ5rTdhZ+eaAaXuscp2Zq0HIcl3eC3mQaM8SZRy5Yykx7oT8KSTeyZ8G+UEXJ+w4iR513vYZBPVUDqEwVe7moyVoW3Ix2o8=;
X-UUID: 023200eb6815428eb85d1735c7f16f5b-20210202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1677514766; Tue, 02 Feb 2021 06:05:01 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 05:58:02 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 21:58:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 2 Feb 2021 21:58:00 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: use PCI_VENDOR_ID_MEDIATEK to avoid open coded
Date: Tue, 2 Feb 2021 21:57:59 +0800
Message-ID: <404c3c6be07d4c8b2a9a7297c387509b801e62a5.1612274129.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4055448C08ED3A018B512A6FAED4963B84FC36D2EC8700AC96D435956B21B2082000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_090510_664331_4797C431 
X-CRM114-Status: UNSURE (   9.45  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use PCI standard defines.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/pci.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/pci.c | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt76x0/pci.c | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt76x2/pci.c | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/pci.c b/drivers/net/wireless/mediatek/mt76/mt7603/pci.c
index 06fa28f645f2..aa6cb668b012 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/pci.c
@@ -7,7 +7,7 @@
 #include "mt7603.h"
 
 static const struct pci_device_id mt76pci_device_table[] = {
-	{ PCI_DEVICE(0x14c3, 0x7603) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7603) },
 	{ },
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
index 71487f532f36..11f169cdd603 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
@@ -13,9 +13,9 @@
 #include "mcu.h"
 
 static const struct pci_device_id mt7615_pci_device_table[] = {
-	{ PCI_DEVICE(0x14c3, 0x7615) },
-	{ PCI_DEVICE(0x14c3, 0x7663) },
-	{ PCI_DEVICE(0x14c3, 0x7611) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7615) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7663) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7611) },
 	{ },
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
index 02d0aa0b815e..5847f943e8da 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
@@ -221,9 +221,9 @@ mt76x0e_remove(struct pci_dev *pdev)
 }
 
 static const struct pci_device_id mt76x0e_device_table[] = {
-	{ PCI_DEVICE(0x14c3, 0x7610) },
-	{ PCI_DEVICE(0x14c3, 0x7630) },
-	{ PCI_DEVICE(0x14c3, 0x7650) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7610) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7630) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7650) },
 	{ },
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
index ecaf85b483ac..adf288e50e21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
@@ -10,9 +10,9 @@
 #include "mt76x2.h"
 
 static const struct pci_device_id mt76x2e_device_table[] = {
-	{ PCI_DEVICE(0x14c3, 0x7662) },
-	{ PCI_DEVICE(0x14c3, 0x7612) },
-	{ PCI_DEVICE(0x14c3, 0x7602) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7662) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7612) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7602) },
 	{ },
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 5570b4a50531..33ed952d7f4c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -13,7 +13,7 @@
 #include "../trace.h"
 
 static const struct pci_device_id mt7921_pci_device_table[] = {
-	{ PCI_DEVICE(0x14c3, 0x7961) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7961) },
 	{ },
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
