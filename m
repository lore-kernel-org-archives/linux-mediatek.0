Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7A1C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 23:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAC3lvYePixzcXebo4E3nrWp2H/ZNlz8TyV8NSReGQs=; b=RwPaFwPFdScVMznkiwJQJoT9GM
	/NhIVnlzYvNa0Z2LLqxm1ceO6pqUbQaK+7CbfNN3peVBV7nGHwO1v+KT2eqUbvjYtz6xqqnF4vzzD
	FlxM3X7rvCesz7H+Ahg2hMaENKXWYPekHtxmwwDhBAwC2WzlscLnBMUti/BMc2fdBDNgViH+Xm9rC
	59mC3k/7ohQierGlQ54s0D3bq+dQcu8flke7WasQ/xv9A+TvVFiMe8l/38mDkF3yxe7xLZ/gOowpE
	Gw27RsxgZVc1N9ijqwFKhj9uVR7YrEPjQDcimNY5CrKjsoODN8DL8FMBnVgirBF3YybROHltFO9O2
	NKk25FdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHZIr-00CItB-F4; Mon, 16 Jan 2023 23:54:13 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHZHa-00CIEb-66; Mon, 16 Jan 2023 23:52:56 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 377561AA3;
	Tue, 17 Jan 2023 00:52:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673913171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VAC3lvYePixzcXebo4E3nrWp2H/ZNlz8TyV8NSReGQs=;
	b=GX7X6H8lc5xEN2+bG0vGPNrbHpUIAQOgt5cogS4U1N7qThjjN2kBzzYQp/8KzT84ti0igo
	xSB7LtanZuOWOoFLF//R6xu0DEVnKAgh2gmiPE8/wZoeTLTCRdhRpTvFILbtntC9hLuBLj
	CnLtT1FJ5lt9YoGY5oDs0zZjipTZSuzptW13uvMVmynj6dYqNfnd42XKFSNgMGotGTUKE8
	BXzciw/3UQuIntlC/9InYkjZ7/KD6wG+fCP+B75yawvNq2My4riw29+tbN+fKgvqe1mdeQ
	IY10rHas3nLp7tewG0aHGrt5ZwAbQkMfxwLieYn3rr2+MYMWJ09/jxb5QTziBA==
From: Michael Walle <michael@walle.cc>
Date: Tue, 17 Jan 2023 00:52:27 +0100
Subject:  [PATCH net-next 12/12] net: ethernet: renesas: rswitch: C45 only transactions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230116-net-next-c45-seperation-part-3-v1-12-0c53afa56aad@walle.cc>
References:  <20230116-net-next-c45-seperation-part-3-v1-0-0c53afa56aad@walle.cc>
In-Reply-To:  <20230116-net-next-c45-seperation-part-3-v1-0-0c53afa56aad@walle.cc>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Byungho An <bh74.an@samsung.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Michael Walle <michael@walle.cc>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_155254_435864_E7DA714B 
X-CRM114-Status: GOOD (  12.12  )
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

The rswitch MDIO bus driver only supports C45 transfers. Update the
function names to make this clear, pass the mmd as a parameter, and
register the accessors to the _c45 ops of the bus driver structure.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/ethernet/renesas/rswitch.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 6441892636db..885fdb077b62 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1024,34 +1024,18 @@ static int rswitch_etha_set_access(struct rswitch_etha *etha, bool read,
 	return ret;
 }
 
-static int rswitch_etha_mii_read(struct mii_bus *bus, int addr, int regnum)
+static int rswitch_etha_mii_read_c45(struct mii_bus *bus, int addr, int devad,
+				     int regad)
 {
 	struct rswitch_etha *etha = bus->priv;
-	int mode, devad, regad;
-
-	mode = regnum & MII_ADDR_C45;
-	devad = (regnum >> MII_DEVADDR_C45_SHIFT) & 0x1f;
-	regad = regnum & MII_REGADDR_C45_MASK;
-
-	/* Not support Clause 22 access method */
-	if (!mode)
-		return -EOPNOTSUPP;
 
 	return rswitch_etha_set_access(etha, true, addr, devad, regad, 0);
 }
 
-static int rswitch_etha_mii_write(struct mii_bus *bus, int addr, int regnum, u16 val)
+static int rswitch_etha_mii_write_c45(struct mii_bus *bus, int addr, int devad,
+				      int regad, u16 val)
 {
 	struct rswitch_etha *etha = bus->priv;
-	int mode, devad, regad;
-
-	mode = regnum & MII_ADDR_C45;
-	devad = (regnum >> MII_DEVADDR_C45_SHIFT) & 0x1f;
-	regad = regnum & MII_REGADDR_C45_MASK;
-
-	/* Not support Clause 22 access method */
-	if (!mode)
-		return -EOPNOTSUPP;
 
 	return rswitch_etha_set_access(etha, false, addr, devad, regad, val);
 }
@@ -1142,8 +1126,8 @@ static int rswitch_mii_register(struct rswitch_device *rdev)
 	mii_bus->name = "rswitch_mii";
 	sprintf(mii_bus->id, "etha%d", rdev->etha->index);
 	mii_bus->priv = rdev->etha;
-	mii_bus->read = rswitch_etha_mii_read;
-	mii_bus->write = rswitch_etha_mii_write;
+	mii_bus->read_c45 = rswitch_etha_mii_read_c45;
+	mii_bus->write_c45 = rswitch_etha_mii_write_c45;
 	mii_bus->parent = &rdev->priv->pdev->dev;
 
 	mdio_np = rswitch_get_mdio_node(rdev);

-- 
2.30.2

