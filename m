Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A75C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 12:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhqHABWEQIo+WYNYC9gdSOycjyBWl3smGbw0Sfwcdu4=; b=lqHQti9t+ysXNZmkpWZM4Jn2aD
	iyB4NQhloqeFuaQ6Gub7tANc/hhLQriMpSCZoddmd7rDzrIp0DmwEGfktgymW3aUbtBFcxOS+QHm6
	QCe82J1K1VMEt94Ps06mAWQx9r0QQ408nFgiLVeSJnJACPAVr/fzBX5x7NF9qGb4bC9VRUdQvntn7
	lRY8Rv7N4isvwtV9B5m13qno6Q5oMKTQo0siYR8XqSBTPtaPs12+qtopjCpiSFOdHukhP6d3o51G/
	yUfHKt6rfvXdWOP7EL77AsOgxxe9TmFMp7DcwUAx2q0VNmLwRBZQZChTYnHHnQU4KbJ74su8Ldb9F
	+Cklej6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1gT-00Bcr9-0b;
	Tue, 12 Dec 2023 12:16:21 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD0ef-00BMpp-3C
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 11:10:27 +0000
X-UUID: e663223c89654ae891ebdabf1917482d-20231212
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:f2408a31-901d-4b62-b60f-39d9f2e3e566,IP:5,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-15
X-CID-INFO: VERSION:1.1.33,REQID:f2408a31-901d-4b62-b60f-39d9f2e3e566,IP:5,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-15
X-CID-META: VersionHash:364b77b,CLOUDID:a732b373-1bd3-4f48-b671-ada88705968c,B
	ulkID:231212180702V8U29WZV,BulkQuantity:7,Recheck:0,SF:66|24|17|19|44|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: e663223c89654ae891ebdabf1917482d-20231212
X-User: shitao@kylinos.cn
Received: from kylin-pc.. [(112.64.161.44)] by mailgw
	(envelope-from <shitao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1670769016; Tue, 12 Dec 2023 19:10:02 +0800
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
Date: Tue, 12 Dec 2023 19:09:59 +0800
Message-Id: <20231212110959.3115422-1-shitao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2023121216-shabby-hastily-f094@gregkh>
References: <2023121216-shabby-hastily-f094@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_031026_360018_A8C6A68F 
X-CRM114-Status: UNSURE (   8.19  )
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

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: shitao <shitao@kylinos.cn>
---
Hi,
according to your suggestion, I have split it into two patches and added some simple instructions.
This is about fixing the misspelling of "empty" in the mtu3_qmu.c file. 
thanks.
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


