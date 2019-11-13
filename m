Return-Path: <SRS0=w4bH=ZF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE35C43331
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 02:39:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05CC9206BA
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 02:39:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mQ0KX+Vo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tQRA2bh0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05CC9206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptmRQ1/GIZF2FVu2h0BcynUpd8F60Oe83wTT+wEKELs=; b=mQ0KX+Vo/eg7kq
	7BtRr9h9CCJYgtUuGeX+WyQG8zp6k2zR9iFJ9HdutUt8YR2LigWcz+OjXl4fFI0QYwtWNuEHPaG++
	vrq3MWH6H7U3K+8/izo2VpYjdxt3qsXTpK6iKrDrtjEmQZJEcpKVgKR4tY4UuKLSaD1G9/z1N4nrU
	LLZmOBIL6TPTaZOpv7tcY8lAD+nPjZGAztrLtdu8lsDotNz1dipilZdN+m58KOZkXVrKpRHwck1WC
	MZWt28BQ7C0NSdY8vNqg9Eu7Gc4BcVoFyWcpYwR2EIYVxlOgxPdp0c3KFjWAVE9wrOb80MPkvep/v
	eq+9GWUEbWz5/O7P52Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUiZD-0003m9-Aj; Wed, 13 Nov 2019 02:39:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUiYq-0003O5-Ju; Wed, 13 Nov 2019 02:39:14 +0000
X-UUID: cbc4b19c0fe9484b8b15e6e7d40991a5-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+FkK1iCNCZ5mbqNEG+dK1JRhB0qOI3mgu4fpv9haJ5A=; 
 b=tQRA2bh0iNPUBTi4CfOkY8u8Yv4DCRNCkvY2RWnwdMLc1Plp4kVYlc+kpMz3geneQVBZHhHyqLlUDhxYBE0J3DNfD+DgwluC6N8TyHdCjiRFJowtFTQjlVbPj0KFZVkapG4P9a2Tb8/BgxVeYnEaBBY9DCGtyF6Ioq+9p0QYgYk=;
X-UUID: cbc4b19c0fe9484b8b15e6e7d40991a5-20191112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-mc.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2066970205; Tue, 12 Nov 2019 18:39:05 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 18:38:45 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 13 Nov 2019 10:38:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 13 Nov 2019 10:38:44 +0800
From: MarkLee <Mark-MC.Lee@mediatek.com>
To: "David S. Miller" <davem@davemloft.net>, Sean Wang
 <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net,
 v3 2/3] net: ethernet: mediatek: Refine the timing of GDM/PSE setup
Date: Wed, 13 Nov 2019 10:38:43 +0800
Message-ID: <20191113023844.17800-3-Mark-MC.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191113023844.17800-1-Mark-MC.Lee@mediatek.com>
References: <20191113023844.17800-1-Mark-MC.Lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_183912_661608_748C16DB 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jakub
 Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rene van Dorst <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 MarkLee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Refine the timing of GDM/PSE setup, move it from mtk_hw_init 
to mtk_open. This is recommended by the mt762x HW design to 
do GDM/PSE setup only after PDMA has been started.

We exclude mt7628 in mtk_gdm_config function since it is a old IP 
and there is no GDM/PSE block on it.

Signed-off-by: MarkLee <Mark-MC.Lee@mediatek.com>
--
v1->v2:
* no change
v2->v3:
* no change

---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 6e7a7fea2f52..b147ab0e44ce 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2184,6 +2184,9 @@ static void mtk_gdm_config(struct mtk_eth *eth, u32 config)
 {
 	int i;
 
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
+		return;
+
 	for (i = 0; i < MTK_MAC_COUNT; i++) {
 		u32 val = mtk_r32(eth, MTK_GDMA_FWD_CFG(i));
 
@@ -2222,6 +2225,8 @@ static int mtk_open(struct net_device *dev)
 		if (err)
 			return err;
 
+		mtk_gdm_config(eth, MTK_GDMA_TO_PDMA);
+
 		napi_enable(&eth->tx_napi);
 		napi_enable(&eth->rx_napi);
 		mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
@@ -2405,8 +2410,6 @@ static int mtk_hw_init(struct mtk_eth *eth)
 	mtk_w32(eth, MTK_RX_DONE_INT, MTK_QDMA_INT_GRP2);
 	mtk_w32(eth, 0x21021000, MTK_FE_INT_GRP);
 
-	mtk_gdm_config(eth, MTK_GDMA_TO_PDMA);
-
 	return 0;
 
 err_disable_pm:
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
