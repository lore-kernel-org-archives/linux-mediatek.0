Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86152C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 23:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lgn0fUyj9IFSMk8AaMRWHgs4+wjSuyxk0Wk78bhVnA0=; b=C6K+Sj4G1AUDtbroyin5CF7KHe
	rSfCy2lm97EUZw65FbvszMk8ItVC8QqTlk59eV+T/tsaQiUWrjybY1l/cz5qM9GJPgT4q8GEPsl+C
	L6smheZGkJ8O47rsG+Pl62YgkxOlXLHMaqUd6ne6QBHC3jmpReSp3i7bC7kRWtV1LFYSlCxOGdUoR
	VHsR8VRIId4FEQvQS36wYk0Ux9Li0Y8+xFJW4a/WJXSB8VsbMyugS5SM6UjRmk72DuRcUL57Zi6nF
	zlN/bB2P28FqpO9iUorRwiaYNEoYoT1XBg/hm607nCLpifG29HmLMpJ3xQddJi876KtbVTvIXdVRW
	buBOA1vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAJJX-00HEBD-8q; Tue, 27 Dec 2022 23:24:55 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAJ2j-00H6UY-MD; Tue, 27 Dec 2022 23:07:36 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A15E416E4;
	Wed, 28 Dec 2022 00:07:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1672182448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lgn0fUyj9IFSMk8AaMRWHgs4+wjSuyxk0Wk78bhVnA0=;
	b=IG0HA2I8gt7HTMttS+b2tDKuI+ZaK9lzIPDjQBgMcPDv+Sb+AQ04m0EIUHjw0vVjK3qAfP
	Jjc1a6hxYB7nXWgWzd4Mp/YFFEZj4pdgYbpDeRlP4y4pCCOkaHptZjaR5GoQfgoBvkPhen
	uKC7DNiXTYMiJAJcMqpyIR2wpNjzJUvp6j7XXnTcleUDN+1nE6gepIOPcco06qgQU102HZ
	3HyGptcDoFFK6PgavhIw+fZma1kC85QGmPShdRozl5NtLesMgWQCUwM/pMZ5NZiKwu1OHy
	Hz2taTVz9lmvUkfLkI3tCAViCdGPkzBqusQnp0EOv8Y6i/BbkVIboWqtISCwMw==
From: Michael Walle <michael@walle.cc>
Date: Wed, 28 Dec 2022 00:07:23 +0100
Subject:  [PATCH RFC net-next v2 07/12] net: mdio: mvmdio: Convert XSMI bus to new API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221227-v6-2-rc1-c45-seperation-v2-7-ddb37710e5a7@walle.cc>
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
X-CRM114-CacheID: sfid-20221227_150733_973157_42C19AA5 
X-CRM114-Status: GOOD (  14.09  )
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

