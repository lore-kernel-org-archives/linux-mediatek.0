Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BEBC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 07:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AmuL/oVo+FdiskG5NMRUUIq4JdgmyVMU2HA8Gjlcquw=; b=A43czzheNiLIE0WPcwwC1kzsUE
	P+XMcLNq67jvnoViKsFIWWvu1CECb7Iu/8DUoGCQO8F1rD5cNWKCmhDiKXLEPVbGQFhmmflCHKLbD
	2vV9LS3o452q++ih2V5nPFa+5N+yf7zwl6Eon5h7iiJ6gg8u0XbnazP7Rl64J4ktM2i0nRfE8gqhv
	YKxJfK0WjigEhyzABsy1kOGMf0S0NB9ZxkHRgzXt6gswwfEgX9CPLPjA3DUU+JBdBEKaLYktgv76q
	mz5JSKO3cWrR5rCgF2I6BgvyUu6/Z34vT0H1zT7xwR6ZTQlAVIBF1VhxrebvSsoK4ROvzPaGg/N2m
	/iB7EJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCxTU-00AxEo-0V;
	Tue, 12 Dec 2023 07:46:40 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCxTR-00AxAr-2h
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 07:46:39 +0000
X-UUID: 0f74f0b037994e75867fa718bb59b71a-20231212
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:76e9b1c9-117a-49a5-9fd5-04cb21c29c03,IP:15,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-INFO: VERSION:1.1.33,REQID:76e9b1c9-117a-49a5-9fd5-04cb21c29c03,IP:15,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:65b913bd-2ac7-4da2-9f94-677a477649d9,B
	ulkID:231212154602Q03BG4P9,BulkQuantity:0,Recheck:0,SF:17|19|44|66|38|24|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 0f74f0b037994e75867fa718bb59b71a-20231212
X-User: shitao@kylinos.cn
Received: from kylin-pc.. [(112.64.161.44)] by mailgw
	(envelope-from <shitao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 511488362; Tue, 12 Dec 2023 15:46:00 +0800
From: shitao <shitao@kylinos.cn>
To: justin.chen@broadcom.com,
	alcooperx@gmail.com,
	gregkh@linuxfoundation.org,
	chunfeng.yun@mediatek.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: shitao <shitao@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] usb: fix comment typos
Date: Tue, 12 Dec 2023 15:45:57 +0800
Message-Id: <20231212074557.3100489-1-shitao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_234638_201874_4096EE2D 
X-CRM114-Status: UNSURE (   7.54  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix two comment typos in usb module files.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: shitao <shitao@kylinos.cn>
---
 drivers/usb/gadget/udc/bdc/bdc_core.c | 2 +-
 drivers/usb/mtu3/mtu3_qmu.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 35a652807fca..874122f8baa3 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -361,7 +361,7 @@ int bdc_reinit(struct bdc *bdc)
 	return ret;
 }
 
-/* Allocate all the dyanmic memory */
+/* Allocate all the dynamic memory */
 static int bdc_mem_alloc(struct bdc *bdc)
 {
 	u32 page_size;
diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
index 3d77408e3133..03f26589b056 100644
--- a/drivers/usb/mtu3/mtu3_qmu.c
+++ b/drivers/usb/mtu3/mtu3_qmu.c
@@ -221,7 +221,7 @@ static struct qmu_gpd *advance_deq_gpd(struct mtu3_gpd_ring *ring)
 	return ring->dequeue;
 }
 
-/* check if a ring is emtpy */
+/* check if a ring is empty */
 static bool gpd_ring_empty(struct mtu3_gpd_ring *ring)
 {
 	struct qmu_gpd *enq = ring->enqueue;
-- 
2.34.1


