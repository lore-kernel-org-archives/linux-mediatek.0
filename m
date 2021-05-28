Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72853C47087
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 06:16:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3295A613DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 06:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3295A613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hVH/YVhod0QcxMLm3e9Qt3MJPdf3+SX671QX3GzBDz4=; b=QN18z72JV940C1
	a+jLXz734IujvE0L5tA766zhid8otcHAyJ1iSJNPMAADH+xD3m20usrz1sAnYrFpkKnUbzILHYXdw
	ZhKJqDY9sYyJOgK8ZiXOHWqbH49evWaM1f+8uTRduamGusYwbseyNfk8hJvzWN4TD386Rx3HVxv6t
	WNR/2ia4lEjc5f0y/3BGKhaQ4bi1UihhXhAWS1GBzuTFZpICjWDBM/U+s+jNQB440XJWVaSAH8OdW
	95RLtZJJvSL93uOy66LKpBVFr/cCZJBETB5Y3UmVpmKxgrHledC7TAEZ/u6wie9LOPnkN607P9I6L
	t71rTO/0Y9iZTl8gE4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmVnW-00CWjl-Qp; Fri, 28 May 2021 06:16:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmVnE-00CWZy-Re; Fri, 28 May 2021 06:16:26 +0000
X-UUID: f1d127d4584540eda163ffcb353f5fbf-20210527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6bWTLGz5omSfDjyNRKVARq/nzi3C/uGa4bUL2BXCCRM=; 
 b=o8GeVMhXNPw5X4K8chc05m9kOlZS1n3/jZqqbpC7PzYpnANFlT7wfu21XjVIzJWxVzRvfN4yMGvCqURsmjZrm9KLtFBgnhVMafqDbSGHctkbd3Jj8qA93BDQjRP/Lug9RMkIauCB77qPsF39kZU4ymyFwtbkXRckXr8VKNhCAO8=;
X-UUID: f1d127d4584540eda163ffcb353f5fbf-20210527
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1888847856; Thu, 27 May 2021 23:16:21 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 23:11:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 May 2021 14:11:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 May 2021 14:11:01 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 1/5] usb: mtu3: remove mtu3_ep0_setup() declaration in mtu3.h
Date: Fri, 28 May 2021 14:10:56 +0800
Message-ID: <1622182260-23767-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_231624_939520_59E0E868 
X-CRM114-Status: GOOD (  13.08  )
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

It's defined and only used in the same file, so remove its declaration
in mtu3.h, and make it static

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h      | 1 -
 drivers/usb/mtu3/mtu3_core.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index aef0a0bba25a..a8a7ee11f7b7 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -422,7 +422,6 @@ int mtu3_config_ep(struct mtu3 *mtu, struct mtu3_ep *mep,
 		int interval, int burst, int mult);
 void mtu3_deconfig_ep(struct mtu3 *mtu, struct mtu3_ep *mep);
 void mtu3_ep_stall_set(struct mtu3_ep *mep, bool set);
-void mtu3_ep0_setup(struct mtu3 *mtu);
 void mtu3_start(struct mtu3 *mtu);
 void mtu3_stop(struct mtu3 *mtu);
 void mtu3_dev_on_off(struct mtu3 *mtu, int is_on);
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index b3b459937566..2ef528f39ba3 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -536,7 +536,7 @@ static void get_ep_fifo_config(struct mtu3 *mtu)
 		rx_fifo->base, rx_fifo->limit);
 }
 
-void mtu3_ep0_setup(struct mtu3 *mtu)
+static void mtu3_ep0_setup(struct mtu3 *mtu)
 {
 	u32 maxpacket = mtu->g.ep0->maxpacket;
 	u32 csr;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
