Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A0DCCA47B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUOG43aqGz7LTb+YYP8Zhe2D97K2yOGGTCWUK3jBbgQ=; b=L1OHGxBNCXVFIOXInnuqTdUZjV
	TSpOrTuY4rwwJfZHC3bLeyhqJdoUZPrSWqwvyU4ZXW5TKeOsLMtWWb7jRT2hQQv6YnGDi4CSPFGnj
	B6agnWS9U0wcpQ+MM+hUA0ZKAxJ7gZJ3qS4Xb48u52E59TyLwMGPD4zpuNV9YcmV323bPKGFpwYYG
	p2QcZqzaRW/ivhI/x0LR6zXesFkCpmW/pj21nNiK27KV5Os/fzGnr0Iq/wYoPBfly5og1hVGEgvp4
	KdorlcRkk3AD7zd4SA93uOVwsZxGykczkqAZImg1qkcYyyCgi2yyewfn4mFYy7pg+fM+kd412khxA
	apMs19pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9iHK-002C4w-H3; Fri, 08 Jul 2022 07:19:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9iHH-002C2E-A2; Fri, 08 Jul 2022 07:19:52 +0000
X-UUID: 466d5bb9c31e416883a540aee4a2d2a6-20220708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:00796ca0-3478-4dfd-ba35-22bd36bed8c9,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:87b9f3d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 466d5bb9c31e416883a540aee4a2d2a6-20220708
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1823697354; Fri, 08 Jul 2022 00:19:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 15:19:07 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 15:19:07 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>
Subject: [PATCH 2/5] usb: mtu3: print endpoint type as string
Date: Fri, 8 Jul 2022 15:19:00 +0800
Message-ID: <20220708071903.25752-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708071903.25752-1-chunfeng.yun@mediatek.com>
References: <20220708071903.25752-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_001951_411421_7FC133D4 
X-CRM114-Status: GOOD (  12.23  )
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

Print endpoint type as string instead of decimal value to make
the log more readable.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_debugfs.c | 8 ++++----
 drivers/usb/mtu3/mtu3_trace.h   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_debugfs.c b/drivers/usb/mtu3/mtu3_debugfs.c
index a6f72494b819..ea9186d5504d 100644
--- a/drivers/usb/mtu3/mtu3_debugfs.c
+++ b/drivers/usb/mtu3/mtu3_debugfs.c
@@ -101,13 +101,13 @@ static int mtu3_ep_used_show(struct seq_file *sf, void *unused)
 	for (i = 0; i < mtu->num_eps; i++) {
 		mep = mtu->in_eps + i;
 		if (mep->flags & MTU3_EP_ENABLED) {
-			seq_printf(sf, "%s - type: %d\n", mep->name, mep->type);
+			seq_printf(sf, "%s - type: %s\n", mep->name, usb_ep_type_string(mep->type));
 			used++;
 		}
 
 		mep = mtu->out_eps + i;
 		if (mep->flags & MTU3_EP_ENABLED) {
-			seq_printf(sf, "%s - type: %d\n", mep->name, mep->type);
+			seq_printf(sf, "%s - type: %s\n", mep->name, usb_ep_type_string(mep->type));
 			used++;
 		}
 	}
@@ -177,8 +177,8 @@ static int mtu3_ep_info_show(struct seq_file *sf, void *unused)
 	unsigned long flags;
 
 	spin_lock_irqsave(&mtu->lock, flags);
-	seq_printf(sf, "ep - type:%d, maxp:%d, slot:%d, flags:%x\n",
-		   mep->type, mep->maxp, mep->slot, mep->flags);
+	seq_printf(sf, "ep - type:%s, maxp:%d, slot:%d, flags:%x\n",
+		   usb_ep_type_string(mep->type), mep->maxp, mep->slot, mep->flags);
 	spin_unlock_irqrestore(&mtu->lock, flags);
 
 	return 0;
diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
index 1b897636daf2..a09deae1146f 100644
--- a/drivers/usb/mtu3/mtu3_trace.h
+++ b/drivers/usb/mtu3/mtu3_trace.h
@@ -238,8 +238,8 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__entry->direction = mep->is_in;
 		__entry->gpd_ring = &mep->gpd_ring;
 	),
-	TP_printk("%s: type %d maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
-		__get_str(name), __entry->type,
+	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
+		__get_str(name), usb_ep_type_string(__entry->type),
 		__entry->maxp, __entry->slot,
 		__entry->mult, __entry->maxburst,
 		__entry->gpd_ring, &__entry->gpd_ring->dma,
-- 
2.18.0


