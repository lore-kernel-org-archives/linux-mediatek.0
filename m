Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75566C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mHY+1oH0Tgef7BNwDp0vFm2rZ8de64Px74Z8PHY05JY=; b=ig68+iH63CSOSAk0EeTqMpjWf3
	PwYvh6Bf8RngX2yMAWb3ttbtirxk7jlQB3rk4lb6LNMRdGCbs6JnfZPAiNM/o9qu9RZfRbtD/fu9A
	CA5Du0MHsXvLYTx1oMpd3hdK/T5hUkzhizIxEi+IIuRMW+L4LDPcQShrCwDhjAQ3l2PVCmUaXJrTs
	01dnKh/n7qGA8l8EwkhmM5VXV4B6QjK09lSvcICQCABXuTXVJgQhB3xd8WHI1MgJ3DGP7dUh6y4fJ
	6FJjXZWKUpX7mxZRHQE6iH3MPnaxx3w3xqA4Km/nsX6O1lAl24xAVDeobOyJ9vl43f8mP/642pMhl
	sF+fDOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2O2-006HnR-1i;
	Wed, 19 Jul 2023 08:18:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2O0-006HmX-21;
	Wed, 19 Jul 2023 08:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mHY+1oH0Tgef7BNwDp0vFm2rZ8de64Px74Z8PHY05JY=; b=RrTmpSQlXXmi0LvxLmmAvAmxEY
	ZFBPRGsiUM2h2H2myvyHAfJEACjQ1g2kng1Anf8mE8rmM2GMUiWFqwlHffh+A0nSmFsV5oiTmjFdv
	avS5AJGfkLGDsqbgX5sTaQXo3citlKjNb5L8dUH+pJGtKWXTWg/9sKYAAN9vLlN06Mu3NFn2jth1i
	yzWMQCXgjqzjRP4dBML23kGhlrrfUPB3gVPnWINVeQeSpgRk4soVeyCJLvr7EFDcA8dz/KFcKvDQy
	pMDhO4ryVul6yuLYiPqCXUHiuZUWgVBOqlxKPzT9jOo7DHwPXt4pa5RMPb/wVDgQHsHbMPKM/ElzR
	tIpmjmAg==;
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLvEh-00CKQP-12;
	Wed, 19 Jul 2023 00:40:17 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qLvEO-0002TA-0d;
	Wed, 19 Jul 2023 00:39:52 +0000
Date: Wed, 19 Jul 2023 01:39:36 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: ethernet: mtk_eth_soc: always mtk_get_ib1_pkt_type
Message-ID: <c0ae03d0182f4d27b874cbdf0059bc972c317f3c.1689727134.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_014014_988269_BFA45CB5 
X-CRM114-Status: GOOD (  10.65  )
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

entries and bind debugfs files would display wrong data on NETSYS_V2 and
later because instead of using mtk_get_ib1_pkt_type the driver would use
MTK_FOE_IB1_PACKET_TYPE which corresponds to NETSYS_V1(.x) SoCs.
Use mtk_get_ib1_pkt_type so entries and bind records display correctly.

Fixes: 03a3180e5c09e ("net: ethernet: mtk_eth_soc: introduce flow offloading support for mt7986")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
index 316fe2e70fead..1a97feca77f23 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
@@ -98,7 +98,7 @@ mtk_ppe_debugfs_foe_show(struct seq_file *m, void *private, bool bind)
 
 		acct = mtk_foe_entry_get_mib(ppe, i, NULL);
 
-		type = FIELD_GET(MTK_FOE_IB1_PACKET_TYPE, entry->ib1);
+		type = mtk_get_ib1_pkt_type(ppe->eth, entry->ib1);
 		seq_printf(m, "%05x %s %7s", i,
 			   mtk_foe_entry_state_str(state),
 			   mtk_foe_pkt_type_str(type));
-- 
2.41.0


