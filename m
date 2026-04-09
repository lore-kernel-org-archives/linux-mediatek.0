Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2680EA3C59
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2026 13:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0rLKwU1N/qqCdCrv9tx/W5ZVb8mZQmZW22Ca/SiHrac=; b=OAndZGY/Uw/Ltw
	6M4K4N6b/bg0awozBK346DFjPESndWwH84UI0jm4rn0cQR1ATSHXRxf2Jy1mkOcWWpmCAF8BSRnSo
	x9fWaKd1SRMcLjOoD+lS+y3JTxPdLBY88887l6frGaA7kASMm+JZJ9JjCJkZDaoqlP/4XjKp8M+iB
	FRsp3ocIagkkXxL9n4W12pxSSfgc8QoXogBLfSr/zax3oMQaAmtz292kn+ZnlGOR6sVdciyv2JYYs
	R1ozggwgcHAx5vaqsLlxfGKei4sXhQszBfVaQXb+ONEXeYzAGSP2UEZx8bQRBWITzXBPIsVNr4Yye
	xUwnW6hWolE+tEZx180A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApW9-0000000AWlT-3DZK;
	Thu, 09 Apr 2026 13:33:57 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApW0-0000000AWjY-3sgR;
	Thu, 09 Apr 2026 13:33:55 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 842F0600F5;
	Thu,  9 Apr 2026 13:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775741626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0rLKwU1N/qqCdCrv9tx/W5ZVb8mZQmZW22Ca/SiHrac=;
	b=pspSm2EV6OnSVVj8ldY+ADJmMhcHgyBGVECtXBh7eB369i2V36LVtmGCPUTR3bM8HNZfAA
	j8zfZY4JDsO7hv3jounVTwd2T+4TX8wzBsKKEYzHBqt7M8NAPAF0tOyzaJHe+xqqK5EQ8g
	iVZDRlcRwxiM2+GQg5hpCIWDNABt/Rs=
Received: from frank-u24.. (fttx-pool-217.61.155.21.bambit.de [217.61.155.21])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 472731226C0;
	Thu,  9 Apr 2026 13:33:46 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [RFC net PATCH v1] net: pcs: pcs-mtk-lynxi: fix bpi-r3 serdes configuration
Date: Thu,  9 Apr 2026 15:33:42 +0200
Message-ID: <20260409133344.129620-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_063350_410296_5B28363E 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Commit 8871389da151 introduces common pcs dts properties which writes
rx=normal,tx=normal polarity to register SGMSYS_QPHY_WRAP_CTRL of switch.
This is initialized with tx-bit set and so change inverts polarity
compared to before.

It looks like mt7531 has tx polarity inverted in hardware and set tx-bit
by default to restore the normal polarity.

Till this patch the register write was only called when mediatek,pnswap
property was set which cannot be done for switch because the fw-node param
was always NULL from switch driver in the mtk_pcs_lynxi_create call.

Do not configure switch side like it's done before.

Fixes: 8871389da151 ("net: pcs: pcs-mtk-lynxi: deprecate "mediatek,pnswap"")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/pcs/pcs-mtk-lynxi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index c12f8087af9b..a753bd88cbc2 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -129,6 +129,9 @@ static int mtk_pcs_config_polarity(struct mtk_pcs_lynxi *mpcs,
 	unsigned int val = 0;
 	int ret;
 
+	if (!fwnode)
+		return 0;
+
 	if (fwnode_property_read_bool(fwnode, "mediatek,pnswap"))
 		default_pol = PHY_POL_INVERT;
 
-- 
2.43.0


