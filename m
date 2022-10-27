Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86454C67871
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 08:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TwDRdAHV6omantZx30uYTP1G+rwKWyLT0MPaZq06kLw=; b=e4oNtz641XbrLJAHG4AtAt15EY
	J2sML4eeCai5ItOinO1Ck4X5dXJztSMKZR3AZCXKHcU/wo/AegJUBNNYxEy8vUYdKkyiMmrsVV9Hf
	Yc1SU3k8EiYEr0u45004ISDqkhYct1PBPa2YbkFgsm8ddq0rwzewGSKpREf/N+cSe4T88blKv6fN6
	h7lZHhgMxNkB2ixuVwIFtUKwD0RsYWRILAXb/f4nJlimEBJ1NjUrlmLkCF/cB3Q8+6Xdn3TGA4Vb1
	egqEMJVRNUhkAyh0ZzEmlifSvGOSaEOhzIFSt+MaRvMLUxKFtsDzCfCkcUA+wIACl+m/dweRndG4v
	9B9NWHyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ony90-00CMAD-QS; Thu, 27 Oct 2022 08:21:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ony8k-00CM2Z-S8; Thu, 27 Oct 2022 08:21:28 +0000
X-UUID: 5bacff286b0f4c0bb2c99b3b458d170f-20221027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TwDRdAHV6omantZx30uYTP1G+rwKWyLT0MPaZq06kLw=;
	b=MlyHXQpQxujp8tVsEaF8CZx7QGd1Ql+mmmL4UvmbRxkqJ7Xz5qvC+fnun1fuQidb0XlhUfyRMjXGJfe/lWUizF+0uQb5hzLUvzfIRf61+u8LYXZSg3CHNrlWCkKnv2oEuRIpqHSIuHBs5DsKmShob1f8MdoIBGtFWHF8DXO0+gw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:da31fedb-595e-40f4-804b-28e274ce41b5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:955a456d-89d3-4bfa-baad-dc632a24bca3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5bacff286b0f4c0bb2c99b3b458d170f-20221027
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zhaoping.shu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 87857456; Thu, 27 Oct 2022 01:21:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 27 Oct 2022 16:20:46 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 27 Oct 2022 16:20:43 +0800
From: zhaoping.shu <zhaoping.shu@mediatek.com>
To: <loic.poulain@linaro.org>, <ryazanov.s.a@gmail.com>,
	<johannes@sipsolutions.net>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <matthias.bgg@gmail.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <srv_heupstream@mediatek.com>, <haijun.liu@mediatek.com>,
	<xiayu.zhang@mediatek.com>, <lambert.wang@mediatek.com>, zhaoping.shu
	<zhaoping.shu@mediatek.com>, "hw . he" <hw.he@mediatek.com>
Subject: [PATCH net v1] net: wwan: mhi: fix memory leak in mhi_mbim_dellink
Date: Thu, 27 Oct 2022 16:20:40 +0800
Message-ID: <20221027082040.149468-1-zhaoping.shu@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_012126_941327_0C878CAD 
X-CRM114-Status: UNSURE (   8.54  )
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

From: hw.he <hw.he@mediatek.com>

MHI driver registers network device without setting the
needs_free_netdev flag, and does NOT call free_netdev() when
unregisters network device, which causes a memory leak.

This patch sets needs_free_netdev to true when registers
network device, which makes netdev subsystem call free_netdev()
automatically after unregister_netdevice().

Fixes: aa730a9905b7 ("net: wwan: Add MHI MBIM network driver")
Signed-off-by: hw.he <hw.he@mediatek.com>
Signed-off-by: zhaoping.shu <zhaoping.shu@mediatek.com>
---
 drivers/net/wwan/mhi_wwan_mbim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
index 6872782e8dd8..ef70bb7c88ad 100644
--- a/drivers/net/wwan/mhi_wwan_mbim.c
+++ b/drivers/net/wwan/mhi_wwan_mbim.c
@@ -582,6 +582,7 @@ static void mhi_mbim_setup(struct net_device *ndev)
 	ndev->min_mtu = ETH_MIN_MTU;
 	ndev->max_mtu = MHI_MAX_BUF_SZ - ndev->needed_headroom;
 	ndev->tx_queue_len = 1000;
+	ndev->needs_free_netdev = true;
 }
 
 static const struct wwan_ops mhi_mbim_wwan_ops = {
-- 
2.17.0


