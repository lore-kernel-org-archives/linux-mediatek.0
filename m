Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29B7C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 23:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bhgExHn/ar4TfzsxVA1DWmb/VXmvJMEz1zy1qxzkSM=; b=j6NxSuPmUUH18ooNr2C8oqxub2
	0qhYEWmzeOJbvIb1VeVWEEBiOGhXoUqpSMiU+V9k4C4/HJ6TX5ljK7eTa1XQr/u83HhMb2XI5AF1P
	PzWPCaIzwWaQbPq049FA3PW9z6ss1fiKP1xswsktWAlw11u8P/vQAm5IIcbVsanDdYDAEGQ9IMRRE
	Bnn+O7UzykwSwt2ZNzinXYESJLjltl6wO0IyOSyX/bCLaTgtFfO4eS+HSLOBIqLWfSI7A7wlO/d1W
	PZgbYtxM9Uy1PNDItvrrXhGE/t2JHFDPBnhB79CjoWoC/TW2BcTT1YYU+UGot5Xq+Ho1MNdXgLiDi
	Z/xmuKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAJCX-00HB6A-OY; Tue, 27 Dec 2022 23:17:41 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAJ2f-00H6QG-OI; Tue, 27 Dec 2022 23:07:31 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 0BF7A1691;
	Wed, 28 Dec 2022 00:07:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1672182446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bhgExHn/ar4TfzsxVA1DWmb/VXmvJMEz1zy1qxzkSM=;
	b=0BRwE3+CnQZBCkueooc1hgIlxrIo0V225AOr2XwrlQzWPJ8ugeR1BDPDeamA7dPiMF3K0L
	/X/SEQZVotNLcfcLXxD1873LIdC8taHCSWHIMC9YVTfIX5Au7z9DL3sBb1cDeTF2Thcc8M
	B3SV0iGKSP1k6BI8a6CExi7RIQd1FG5nCKzmcuFPl4PPV7ByXGS+uxrwK5bDgV4RjZNHuT
	7RTutdIP9lS65jHnOHgKOLG+AXCjTl33MypfVk5RqDVfFPu2kPRF88yPMC197dzrpcyuUY
	F/JvMQfaw1Yr77z2UPiPI6otSBkWBFJujTj7u/s3/ZDIwLsZ+yJa/CSAO26xxw==
From: Michael Walle <michael@walle.cc>
Date: Wed, 28 Dec 2022 00:07:18 +0100
Subject: [PATCH RFC net-next v2 02/12] net: pcs: pcs-xpcs: Use C45 MDIO API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221227-v6-2-rc1-c45-seperation-v2-2-ddb37710e5a7@walle.cc>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <michael@walle.cc>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_150730_089114_BD5741E4 
X-CRM114-Status: UNSURE (   9.16  )
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

From: Andrew Lunn <andrew@lunn.ch>

Convert the PCS-XPCS driver to make use of the C45 MDIO bus API for
modify_change().

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
v2:
 - [al] new patch
---
 drivers/net/pcs/pcs-xpcs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index f6a038a1d51e..bc428a816719 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -199,9 +199,7 @@ int xpcs_write(struct dw_xpcs *xpcs, int dev, u32 reg, u16 val)
 static int xpcs_modify_changed(struct dw_xpcs *xpcs, int dev, u32 reg,
 			       u16 mask, u16 set)
 {
-	u32 reg_addr = mdiobus_c45_addr(dev, reg);
-
-	return mdiodev_modify_changed(xpcs->mdiodev, reg_addr, mask, set);
+	return mdiodev_c45_modify_changed(xpcs->mdiodev, dev, reg, mask, set);
 }
 
 static int xpcs_read_vendor(struct dw_xpcs *xpcs, int dev, u32 reg)

-- 
2.30.2

