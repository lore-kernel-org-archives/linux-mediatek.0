Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EB3C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lgn0fUyj9IFSMk8AaMRWHgs4+wjSuyxk0Wk78bhVnA0=; b=w/GK61mOyqBs6fQ4/BYszr8cI4
	GFQh7ZayjWngZlDUKlpB8Mtn/wXEajaxdEg6XLO80vQo56fAeyh4oV+h3Py967tpE/du5R3zKPjsx
	2lZRlRBYmd4qjXYTdBDw3/ODW7TxFAH7sUGAhy97i+s7U7jAbKGDQjv3S75MlGydQUgqTNFRfMbB6
	ei2QThJ0341TF7/nXFmxUowZL854cX5ltLcwnNkd7tXJmTGiWIx2q4xGtTBNVAzk4BmCAv2rfvxsB
	uDN7TC+7tnltM8hPvBp3Q9coQn5WdXfNcOCdb3Wyf9C3T+iR+RDKIRguc+eUdEKvesafOwII3UIfy
	pxQeEjtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuAk-002IDA-Fr; Mon, 09 Jan 2023 15:34:50 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEu72-002FwR-UW; Mon, 09 Jan 2023 15:31:03 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A15021872;
	Mon,  9 Jan 2023 16:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673278256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lgn0fUyj9IFSMk8AaMRWHgs4+wjSuyxk0Wk78bhVnA0=;
	b=paHoMYp5QyTdFJmmJGlkyXxyx1kT7mnZo4KsGjYw673zA4PozBqwyJfHLfMUDMeyv98ELr
	xmptzo+6SEGjSibLaBQj4m+FO+HdVMUhJiS19ZDemTrPStFuuEo3TKrf9iCCypPs+zIn6x
	aPA3K6eGXZajQEi1AZWWZM7oj4qeoc786ugIgP2xji+EKZ2w7DVNirDKl0NJ+npLxKv6qR
	3byRLnvcqXoxg2/tawbXmbt+oBwczg81pRjk4sz/5jOe/16WZv4Qfl4oljyNCHhFlCxme1
	+YXfZQYmFv9eoVubcaixqiWW1+X2D9Y+83Dtp7qmXhatDjOfdIRIukTHqw6n+g==
From: Michael Walle <michael@walle.cc>
Date: Mon, 09 Jan 2023 16:30:47 +0100
Subject:  [PATCH net-next v3 07/11] net: mdio: mvmdio: Convert XSMI bus to new API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221227-v6-2-rc1-c45-seperation-v3-7-ade1deb438da@walle.cc>
References: <20221227-v6-2-rc1-c45-seperation-v3-0-ade1deb438da@walle.cc>
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v3-0-ade1deb438da@walle.cc>
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
 Michael Walle <michael@walle.cc>, Vladimir Oltean <vladimir.oltean@nxp.com>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_073101_254528_C9EDA6E2 
X-CRM114-Status: GOOD (  14.81  )
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

The marvell MDIO driver supports two different hardware blocks. The
XSMI block is C45 only. Convert this block to the new API, and only
populate the c45 calls in the bus structure.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/ethernet/marvell/mvmdio.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvmdio.c b/drivers/net/ethernet/marvell/mvmdio.c
index ef878973b859..2d654a40af13 100644
--- a/drivers/net/ethernet/marvell/mvmdio.c
+++ b/drivers/net/ethernet/marvell/mvmdio.c
@@ -204,21 +204,17 @@ static const struct orion_mdio_ops orion_mdio_xsmi_ops = {
 	.poll_interval_max = MVMDIO_XSMI_POLL_INTERVAL_MAX,
 };
 
-static int orion_mdio_xsmi_read(struct mii_bus *bus, int mii_id,
-				int regnum)
+static int orion_mdio_xsmi_read_c45(struct mii_bus *bus, int mii_id,
+				    int dev_addr, int regnum)
 {
 	struct orion_mdio_dev *dev = bus->priv;
-	u16 dev_addr = (regnum >> 16) & GENMASK(4, 0);
 	int ret;
 
-	if (!(regnum & MII_ADDR_C45))
-		return -EOPNOTSUPP;
-
 	ret = orion_mdio_wait_ready(&orion_mdio_xsmi_ops, bus);
 	if (ret < 0)
 		return ret;
 
-	writel(regnum & GENMASK(15, 0), dev->regs + MVMDIO_XSMI_ADDR_REG);
+	writel(regnum, dev->regs + MVMDIO_XSMI_ADDR_REG);
 	writel((mii_id << MVMDIO_XSMI_PHYADDR_SHIFT) |
 	       (dev_addr << MVMDIO_XSMI_DEVADDR_SHIFT) |
 	       MVMDIO_XSMI_READ_OPERATION,
@@ -237,21 +233,17 @@ static int orion_mdio_xsmi_read(struct mii_bus *bus, int mii_id,
 	return readl(dev->regs + MVMDIO_XSMI_MGNT_REG) & GENMASK(15, 0);
 }
 
-static int orion_mdio_xsmi_write(struct mii_bus *bus, int mii_id,
-				int regnum, u16 value)
+static int orion_mdio_xsmi_write_c45(struct mii_bus *bus, int mii_id,
+				     int dev_addr, int regnum, u16 value)
 {
 	struct orion_mdio_dev *dev = bus->priv;
-	u16 dev_addr = (regnum >> 16) & GENMASK(4, 0);
 	int ret;
 
-	if (!(regnum & MII_ADDR_C45))
-		return -EOPNOTSUPP;
-
 	ret = orion_mdio_wait_ready(&orion_mdio_xsmi_ops, bus);
 	if (ret < 0)
 		return ret;
 
-	writel(regnum & GENMASK(15, 0), dev->regs + MVMDIO_XSMI_ADDR_REG);
+	writel(regnum, dev->regs + MVMDIO_XSMI_ADDR_REG);
 	writel((mii_id << MVMDIO_XSMI_PHYADDR_SHIFT) |
 	       (dev_addr << MVMDIO_XSMI_DEVADDR_SHIFT) |
 	       MVMDIO_XSMI_WRITE_OPERATION | value,
@@ -302,8 +294,8 @@ static int orion_mdio_probe(struct platform_device *pdev)
 		bus->write = orion_mdio_smi_write;
 		break;
 	case BUS_TYPE_XSMI:
-		bus->read = orion_mdio_xsmi_read;
-		bus->write = orion_mdio_xsmi_write;
+		bus->read_c45 = orion_mdio_xsmi_read_c45;
+		bus->write_c45 = orion_mdio_xsmi_write_c45;
 		break;
 	}
 

-- 
2.30.2

