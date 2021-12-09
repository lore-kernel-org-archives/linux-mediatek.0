Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A96AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 03:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbEIwkgNoeM+dmwZTuA3kacbRm1Q6C9TIYffx2AKLpg=; b=C6YMxQlq2EocRD
	OxaafXj5t6Zd2h9dbRbRTMc770ZNNfYSy5QMJT5rlvXTrDM2TB0xnk1xGIRpSpAApG+PEuegF30Qj
	WsXYpT0LWN/rTIpvMB7YBq8Gd+QDiqpHAoqLC6GnwFUWJnKhIuZ/dR8TWQoFeAiZcwAlpBqoUHgB5
	sR7xl6aQmLnaGaBulTedrYsD+jwvav3Rb7U2cr9cABWF/6aAsLCy8fZHvvAa0yRMFpJlsPQaHC7q7
	IaForb2xKkb6GW0VaVgT1vB8RHK5s8Hao509M8JzvCnt2hg48aDVCRroC+bYCcayC0XrtK2U1Zpf8
	UhLt6Yl9sa3WkLOo9rBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mv9tC-00Eo7b-El; Thu, 09 Dec 2021 03:14:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mv9t9-00Eo6f-Rj; Thu, 09 Dec 2021 03:14:33 +0000
X-UUID: dca3811c7d8c49238c13c16fb6eec9cf-20211208
X-UUID: dca3811c7d8c49238c13c16fb6eec9cf-20211208
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1602197447; Wed, 08 Dec 2021 20:14:29 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Dec 2021 19:14:28 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Dec 2021 11:14:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 9 Dec 2021 11:14:26 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>, "Yuwen
 Ng" <yuwen.ng@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH 2/3] usb: mtu3: add memory barrier before set GPD's HWO
Date: Thu, 9 Dec 2021 11:14:23 +0800
Message-ID: <20211209031424.17842-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209031424.17842-1-chunfeng.yun@mediatek.com>
References: <20211209031424.17842-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_191431_926627_A9D5DE70 
X-CRM114-Status: GOOD (  10.46  )
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

There is a seldom issue that the controller access invalid address
and trigger devapc or emimpu violation. That is due to memory access
is out of order and cause gpd data is not correct.
Make sure GPD is fully written before giving it to HW by setting its
HWO.

Fixes: 48e0d3735aa5 ("usb: mtu3: supports new QMU format")
Cc: stable@vger.kernel.org
Reported-by: Eddie Hung <eddie.hung@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_qmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
index 3f414f91b589..34bb5ac67efe 100644
--- a/drivers/usb/mtu3/mtu3_qmu.c
+++ b/drivers/usb/mtu3/mtu3_qmu.c
@@ -273,6 +273,8 @@ static int mtu3_prepare_tx_gpd(struct mtu3_ep *mep, struct mtu3_request *mreq)
 			gpd->dw3_info |= cpu_to_le32(GPD_EXT_FLAG_ZLP);
 	}
 
+	/* make sure GPD is fully written before giving it to HW */
+	mb();
 	gpd->dw0_info |= cpu_to_le32(GPD_FLAGS_IOC | GPD_FLAGS_HWO);
 
 	mreq->gpd = gpd;
@@ -306,6 +308,8 @@ static int mtu3_prepare_rx_gpd(struct mtu3_ep *mep, struct mtu3_request *mreq)
 	gpd->next_gpd = cpu_to_le32(lower_32_bits(enq_dma));
 	ext_addr |= GPD_EXT_NGP(mtu, upper_32_bits(enq_dma));
 	gpd->dw3_info = cpu_to_le32(ext_addr);
+	/* make sure GPD is fully written before giving it to HW */
+	mb();
 	gpd->dw0_info |= cpu_to_le32(GPD_FLAGS_IOC | GPD_FLAGS_HWO);
 
 	mreq->gpd = gpd;
@@ -445,7 +449,8 @@ static void qmu_tx_zlp_error_handler(struct mtu3 *mtu, u8 epnum)
 		return;
 	}
 	mtu3_setbits(mbase, MU3D_EP_TXCR0(mep->epnum), TX_TXPKTRDY);
-
+	/* make sure GPD is fully written before giving it to HW */
+	mb();
 	/* by pass the current GDP */
 	gpd_current->dw0_info |= cpu_to_le32(GPD_FLAGS_BPS | GPD_FLAGS_HWO);
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
