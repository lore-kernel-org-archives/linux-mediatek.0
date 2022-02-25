Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986BDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 10:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtY+wpcrNoo4cvVxiro2TAJkRO/qcUYM0P1OM5PZEiI=; b=XBPAI3EWMnGBj1
	ZnhmWMdsRX1dh9N0wgMqUQTO/VAcYPtGuoZ1DwXCWtBqUlawPekdQMN3Ld/OYyUSzkSnTs/ICdXy/
	rGx7hjukjglNFAUyuMox0LnIV6ricmBrXV7yTqB6+nIXEJ15+a0cNYjLfEPDSGTXR34PSztL8kbX0
	Mn9/PzD/5soYoZAjWM5vY0hqcsMaIjGbG0zbKjv76V8YzL+JMOeL/RVjSIc/jK64oGbwYeCMaQ4Oh
	RFFtNeD/YZZpHbGsL85y1TyzicOKGThkX/NqOZCnhnXoy9VJjPa5m41HHPdxrfXDjiD/vQ4kaI1Kc
	KO03NYMm4Z3vLfH8uJ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNXtv-004QGn-U8; Fri, 25 Feb 2022 10:32:39 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNXtB-004Pzk-Px; Fri, 25 Feb 2022 10:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G7vsg/KcOeJhzWVxaCzLaJE46D0kipXYK45386ZlK7o=; b=U+5fzw8vCoFnC2xr7pDVAIT9fo
 V4sikZJwQwEO8t2tJofbwPbv9MOY+FGdY/Ec9jjpAuJnk2DwnmtDuxHaRMR/76IJGa3VqM0bn2WxJ
 axarjWcUNqlMtPUKoges/HzpRQfEhl1VCf/bTyz2b5FBoyhCbJn6C9NRZIxO24cRNyBo=;
Received: from p200300daa7204f00f847964d075b2b3d.dip0.t-ipconnect.de
 ([2003:da:a720:4f00:f847:964d:75b:2b3d] helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nNXg5-0007J1-9J; Fri, 25 Feb 2022 11:18:21 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] net: ethernet: mtk_eth_soc: remove bridge flow offload
 type entry support
Date: Fri, 25 Feb 2022 11:18:09 +0100
Message-Id: <20220225101811.72103-11-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220225101811.72103-1-nbd@nbd.name>
References: <20220225101811.72103-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_023154_035864_AB460BB8 
X-CRM114-Status: UNSURE (   9.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

According to MediaTek, this feature is not supported in current hardware

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c         | 8 --------
 drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index a7fe33bbde63..aa0d190db65d 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -84,13 +84,6 @@ static u32 mtk_ppe_hash_entry(struct mtk_foe_entry *e)
 	u32 hash;
 
 	switch (FIELD_GET(MTK_FOE_IB1_PACKET_TYPE, e->ib1)) {
-		case MTK_PPE_PKT_TYPE_BRIDGE:
-			hv1 = e->bridge.src_mac_lo;
-			hv1 ^= ((e->bridge.src_mac_hi & 0xffff) << 16);
-			hv2 = e->bridge.src_mac_hi >> 16;
-			hv2 ^= e->bridge.dest_mac_lo;
-			hv3 = e->bridge.dest_mac_hi;
-			break;
 		case MTK_PPE_PKT_TYPE_IPV4_ROUTE:
 		case MTK_PPE_PKT_TYPE_IPV4_HNAPT:
 			hv1 = e->ipv4.orig.ports;
@@ -572,7 +565,6 @@ int mtk_ppe_start(struct mtk_ppe *ppe)
 	      MTK_PPE_FLOW_CFG_IP4_NAT |
 	      MTK_PPE_FLOW_CFG_IP4_NAPT |
 	      MTK_PPE_FLOW_CFG_IP4_DSLITE |
-	      MTK_PPE_FLOW_CFG_L2_BRIDGE |
 	      MTK_PPE_FLOW_CFG_IP4_NAT_FRAG;
 	ppe_w32(ppe, MTK_PPE_FLOW_CFG, val);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
index d4b482340cb9..eb0b598f14e4 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
@@ -32,7 +32,6 @@ static const char *mtk_foe_pkt_type_str(int type)
 	static const char * const type_str[] = {
 		[MTK_PPE_PKT_TYPE_IPV4_HNAPT] = "IPv4 5T",
 		[MTK_PPE_PKT_TYPE_IPV4_ROUTE] = "IPv4 3T",
-		[MTK_PPE_PKT_TYPE_BRIDGE] = "L2",
 		[MTK_PPE_PKT_TYPE_IPV4_DSLITE] = "DS-LITE",
 		[MTK_PPE_PKT_TYPE_IPV6_ROUTE_3T] = "IPv6 3T",
 		[MTK_PPE_PKT_TYPE_IPV6_ROUTE_5T] = "IPv6 5T",
-- 
2.32.0 (Apple Git-132)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
