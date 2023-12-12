Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A7FC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 11:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4SIdle+VScQpplXeQC3LG9130FW5mU+46J+8E3j85I=; b=1vONZhffBluMkLiObxEDuO59in
	sZZs4YSEKvFAIXZv7WyryopweHL5Xk+ldY6WkNAKXAr6jn1wi5ptSbcDDbVekYxb8Qll+C//Da4th
	ll06lmOG0iIuSPhWoRujwEMCh7/C84Q9zzIftptOfqTguxHywle99yFI69vgAsHOfL44hQYZD9knw
	TWHIGjHWBq7+uc0e55C0hsbl/0UOdMo5GLYWSf37+2ZpQGwvO/ZJl8tJo0ocp3VH5pn9I804u42V+
	05ascofmuKYOqZLfQNaMmz7V0EMT2v9vyXxvmMsc8CWrZou9lQUQsLkzGtZ/ATsCdAG2ArvPr3wba
	D2NSr4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD0m9-00BSzw-0q;
	Tue, 12 Dec 2023 11:18:09 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD0m6-00BSx3-1w
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 11:18:08 +0000
X-UUID: a3416e3825d04d11ab433e5be57319f2-20231212
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:d7be38fc-fbff-4d83-8e6b-f3bcdc06f1f6,IP:5,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-10
X-CID-INFO: VERSION:1.1.33,REQID:d7be38fc-fbff-4d83-8e6b-f3bcdc06f1f6,IP:5,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-10
X-CID-META: VersionHash:364b77b,CLOUDID:a31616bd-2ac7-4da2-9f94-677a477649d9,B
	ulkID:2312121820440JAM3HPF,BulkQuantity:6,Recheck:0,SF:24|17|19|44|66|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: a3416e3825d04d11ab433e5be57319f2-20231212
X-User: shitao@kylinos.cn
Received: from kylin-pc.. [(112.64.161.44)] by mailgw
	(envelope-from <shitao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 586504534; Tue, 12 Dec 2023 19:17:58 +0800
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
Subject: [PATCH] usb: gadget: udc: bdc: fix comment typo
Date: Tue, 12 Dec 2023 19:17:54 +0800
Message-Id: <20231212111754.3115465-1-shitao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2023121251-attest-shout-cbaa@gregkh>
References: <2023121251-attest-shout-cbaa@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_031806_939529_43CE8D41 
X-CRM114-Status: UNSURE (   7.65  )
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

Fix comment typo in bdc_core.c file.
"dynamic" is misspelled as "dyanmic".

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: shitao <shitao@kylinos.cn>
---
Hi, 
according to your suggestion, I have split it into two patches and added some simple instructions. 
This is a change that fixes the misspelling of "dynamic" in bdc_core.c file. 
thanks.
 drivers/usb/gadget/udc/bdc/bdc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.34.1


