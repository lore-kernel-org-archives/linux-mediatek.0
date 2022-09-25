Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1FBC04A95
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Sep 2022 14:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IFLT2hzEyF3+TnhAdjTrqq6/uaknXmaqUTs3cCGB+pU=; b=OdWgaU05z9mOhiAjcSdgq0Vk7B
	OQkZaWOT1XHu1La4J8CZGcQV++rKZttSJoVHdgVLSv5VSIT0jiESRQp1O00DtGzZIsVrnJGZNSDj4
	K0z87GUS1k3buR+Vp1e7dSME7WXr2J4ekR7JhOXICf071TWHjOYqOWNRNsJ5VhFPx/MafDP2/ELa1
	aCf1LlyvWs9RCuzbp3W03Y13StYp4By3mINFDU43r9t7CPZ8cu/ru4T7KYQCFJQIOj0oQqooQbe+s
	0MjTC2917B4s2rif5pcOZukF4GbDXvecDw/7yal8iaIaWzo6eEx6i31/Q+gbY4+DYMmLElYHMDMnt
	vAwOgbpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocSwA-00EGUi-8S; Sun, 25 Sep 2022 14:48:54 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocSw8-00EGTU-0U
	for linux-mediatek@lists.infradead.org; Sun, 25 Sep 2022 14:48:53 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ocSw5-0002Ul-3B;
	Sun, 25 Sep 2022 16:48:50 +0200
Date: Sun, 25 Sep 2022 15:48:43 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sujuan Chen <sujuan.chen@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen Minqiang <ptpt52@gmail.com>
Subject: [PATCH 2/2] net: ethernet: mtk_eth_soc: fix usage of foe_entry_size
Message-ID: <YzBqPIgQR2gLrPoK@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_074852_069771_19A211F8 
X-CRM114-Status: GOOD (  11.73  )
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

As sizeof(hwe->data) can now longer be used as the actual size depends
on foe_entry_size, in commit 9d8cb4c096ab02
("net: ethernet: mtk_eth_soc: add foe_entry_size to mtk_eth_soc") the
use of sizeof(hwe->data) is hence replaced.

However, replacing it with ppe->eth->soc->foe_entry_size is wrong as
foe_entry_size represents the size of the whole descriptor and not just
the 'data' field.

Fix this by subtracing the size of the only other field in the struct
'ib1', so we actually end up with the correct size to be copied to the
data field.

Reported-by: Chen Minqiang <ptpt52@gmail.com>
Fixes: 9d8cb4c096ab02 ("net: ethernet: mtk_eth_soc: add foe_entry_size to mtk_eth_soc")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 4ea2b342f252ac..887f430734f747 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -547,7 +547,7 @@ __mtk_foe_entry_commit(struct mtk_ppe *ppe, struct mtk_foe_entry *entry,
 	}
 
 	hwe = mtk_foe_get_entry(ppe, hash);
-	memcpy(&hwe->data, &entry->data, eth->soc->foe_entry_size);
+	memcpy(&hwe->data, &entry->data, eth->soc->foe_entry_size - sizeof(hwe->ib1));
 	wmb();
 	hwe->ib1 = entry->ib1;
 
-- 
2.37.3


