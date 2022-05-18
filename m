Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0226C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 14:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTnT5YrOdAMGRgNVtaVAcnU8zgcjYZgpN1SPU8PW7H0=; b=z5xNsgs0j7BAP6
	Kv1MZC+maqiCiov9m743fbNKRwoFmkaC8UslqzjGPHm75zv8kpOR+qPau4Vry13+SlXHOAMmBj3EO
	LqFCNHbQLbxvrzZ9yLLGArNgp+SFrfXj4TraoogJwcvOtHbZN1KdgniK4/sddoR2kKO5QW/DRSu11
	X3xMGALcH/XfZaakRANS/861QsWp4+r5kUk2s30MQoRhc0PZvlB4cqtngp+36d3pGHdI299dOwxr3
	zLfKojV1InkoF5fyt7EOFlhCzqMuTUsgpJ/UaYl4uhdNJN+8LSNJFPXXOyM7tDYUGhCvymcUKguSL
	1dEe1EQyl3T+iXN8Z6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrL5m-002dQF-4p; Wed, 18 May 2022 14:56:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrL4Y-002ckU-2z; Wed, 18 May 2022 14:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QjWvAe5dEJjDyoC2IMky/s17OubBaU/he0qgyWdmoIY=; b=xDIA531rdMo7wiVGuMBBYa7d/s
 2hTgCuBON9Pzm3OOb2m3W8cCrZUumR66E9OSUtUMbq6U5naEswsCwoMqITAA/yUiuMk17qvUUQw9v
 bc0d3eKvVXlZkUOOgYm0xw7DsI1DNARpz7yZKy1U7qnJhIbltG91U4TshnkSK6haJYSSy3136HB2M
 Hw7sLp1A/mvWaO9MFt6aBiApQNE4CaHQaK7HvSoWls5a8DF4Qihgs2Tu5+1VMh6i/cKwE0DK3EoIK
 Vkjl2nidkC3uc5P8y8c9J9MDHMsaIqty395M+KZLfGspEG01EfEfFegitrcZpnBkFVJzDn2vXQb6g
 BBk7K7bg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38612 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nrL4U-0002E9-5Y; Wed, 18 May 2022 15:54:42 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nrL4U-00AM4q-2X; Wed, 18 May 2022 15:54:42 +0100
In-Reply-To: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
References: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Eric Dumazet <edumazet@google.com>
Subject: [PATCH net-next 03/12] net: mtk_eth_soc: add mask and update PCS
 speed definitions
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nrL4U-00AM4q-2X@rmk-PC.armlinux.org.uk>
Date: Wed, 18 May 2022 15:54:42 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_075446_196118_C7DCA1BB 
X-CRM114-Status: UNSURE (   9.82  )
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

The PCS speed setting is a two bit field, but it is defined as two
separate bits. Add a bitfield mask for the speed definitions, an
 use the FIELD_PREP() macro to define each PCS speed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 085f53d23f25..4f97195159f3 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -17,6 +17,7 @@
 #include <linux/phylink.h>
 #include <linux/rhashtable.h>
 #include <linux/dim.h>
+#include <linux/bitfield.h>
 #include "mtk_ppe.h"
 
 #define MTK_QDMA_PAGE_SIZE	2048
@@ -493,9 +494,10 @@
 #define SGMSYS_SGMII_MODE		0x20
 #define SGMII_IF_MODE_BIT0		BIT(0)
 #define SGMII_SPEED_DUPLEX_AN		BIT(1)
-#define SGMII_SPEED_10			0x0
-#define SGMII_SPEED_100			BIT(2)
-#define SGMII_SPEED_1000		BIT(3)
+#define SGMII_SPEED_MASK		GENMASK(3, 2)
+#define SGMII_SPEED_10			FIELD_PREP(SGMII_SPEED_MASK, 0)
+#define SGMII_SPEED_100			FIELD_PREP(SGMII_SPEED_MASK, 1)
+#define SGMII_SPEED_1000		FIELD_PREP(SGMII_SPEED_MASK, 2)
 #define SGMII_DUPLEX_FULL		BIT(4)
 #define SGMII_IF_MODE_BIT5		BIT(5)
 #define SGMII_REMOTE_FAULT_DIS		BIT(8)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
