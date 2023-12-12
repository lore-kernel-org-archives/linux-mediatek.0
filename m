Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711F2C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 10:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2i8iQSXY9yb6m4UH98CW/gK05iO3m9ZO9MQdkFeNwA=; b=22a8egLFk8b/Z9pWMOARbYO9MR
	SHZNv/670VatejE7RKRbOjSgar1ldRKlKU2hodRvL/fPD26dLnHrBxFCZe47zvGafC65UzTDz6oWy
	L9np+EEjdJTg4Ii5qiDJlXLANmw5dAUdSwXNoIgqgubwucmNcRbXVMOuaSmnHFoQpB/nx6bo6W5td
	q+59KmTcMYVn9nN59Ppr9BVgr7jI/Bgo81TYt241zkPyZi/JO/wduRecEqMy845a6lNX1PgtqnjTA
	6dKUem/BDfRLEYLPhD3WfT8gDU9bUHgXEAFoIzFC3OPgdtjhDLZm0qxG5erN0/uN0QgHgNYOYbSyd
	erMni6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCzfc-00BGqS-20;
	Tue, 12 Dec 2023 10:07:20 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCzfa-00BGoJ-0o
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 10:07:19 +0000
X-UUID: 56733953bd2a433c93b33f470ecc7e86-20231212
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:12e74b13-1974-4dc9-9b24-65e3eccc3b47,IP:5,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-10
X-CID-INFO: VERSION:1.1.33,REQID:12e74b13-1974-4dc9-9b24-65e3eccc3b47,IP:5,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-10
X-CID-META: VersionHash:364b77b,CLOUDID:d891b273-1bd3-4f48-b671-ada88705968c,B
	ulkID:231212180702V8U29WZV,BulkQuantity:0,Recheck:0,SF:17|19|44|66|24|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 56733953bd2a433c93b33f470ecc7e86-20231212
X-User: shitao@kylinos.cn
Received: from kylin-pc.. [(112.64.161.44)] by mailgw
	(envelope-from <shitao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 148750459; Tue, 12 Dec 2023 18:07:00 +0800
From: shitao <shitao@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: alcooperx@gmail.com,
	chunfeng.yun@mediatek.com,
	justin.chen@broadcom.com,
	kernel-bot@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	shitao@kylinos.cn
Subject: [PATCH] usb: mtu3: fix comment typo
Date: Tue, 12 Dec 2023 18:06:57 +0800
Message-Id: <20231212100657.3115089-1-shitao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2023121236-earful-email-ea09@gregkh>
References: <2023121236-earful-email-ea09@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_020718_592718_1BBE011B 
X-CRM114-Status: UNSURE (   7.77  )
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

Fix comment typo in mtu3_qmu.c file.
"empty" is misspelled as "emtpy".

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: shitao <shitao@kylinos.cn>
---
 drivers/usb/mtu3/mtu3_qmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


