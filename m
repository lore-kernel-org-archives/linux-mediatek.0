Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A464CC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 23:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmJ+9CmwjBTs3CG9j8tedbOIS1gGBtjDkwnDw2VO6LM=; b=TyFovEGraz1iKNirh2QWE1u3AA
	bd/rDGCmOHhbLWUY866GluNLl2zDJnwwcnA3oqqQI4pZHJhw8ULmpQSUU/8vpDTYIyyrrEORcUFs6
	KBRkAKfCCMLbJdmNoJHEa4aAKtU4F7MmORpdFepLfsQhnEkWJ2TNen+AmZI3tUuBUapIoTz6QCLgU
	9vGbiMDRo8leaDGk7CWhP1SyWl3dTcwT2oGhJp6eGs8UMaG2QSlH3GF02ngE6d1VqhnqwsRJs7GB3
	NvrGoyeXj/G+gzxvcJBpNGO4th8H07YrKbmb5brJZWxgzRpi/68PqyAs/tfYuuHPsxsGGOlHdcxjc
	uiRh7o1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHZKV-00CJu2-60; Mon, 16 Jan 2023 23:55:55 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHZHb-00CIG3-Uo; Mon, 16 Jan 2023 23:52:57 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D8A0816EA;
	Tue, 17 Jan 2023 00:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673913168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OmJ+9CmwjBTs3CG9j8tedbOIS1gGBtjDkwnDw2VO6LM=;
	b=eItgcFr83H0p1PU0iNChDNdiOgj8KhYJ8woVXKsLke+s9Qzn4YWii5eReEsBuleyYQt6qF
	zdB3j5sZRNRt7IYX77xPINY9PI563Domlhi3UUM6iYnR/7cJNfvw2qJ9K/pFln4/WldMhR
	KLEda5zh67qih83Ir652RtZkToIDVhs+vwYaXJQkzFrYdR4NRzGcjoj7o0P9BTVYD+HGzh
	e91HRJCCAaJRUCf8LXpvVLVkoVWluGPxBaeiv+On9tzW4vLvj/LrS/kvi4VC8xZIjuV/fH
	dq6rAn7Pjrjnz7XuZr3iXlIGBZFY2xdOTT7geNfbJloqNBU6E5xeHvWycz+NAw==
From: Michael Walle <michael@walle.cc>
Date: Tue, 17 Jan 2023 00:52:21 +0100
Subject: [PATCH net-next 06/12] ixgbe: Use C45 mdiobus accessors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230116-net-next-c45-seperation-part-3-v1-6-0c53afa56aad@walle.cc>
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
X-CRM114-CacheID: sfid-20230116_155256_235466_F69C3273 
X-CRM114-Status: GOOD (  11.63  )
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

When performing a C45 bus transaction, make use of the c45 variants of
the bus read/write helpers. The ability to pass a special register
value is being removed to clean up the mdio bus driver API.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index ab8370c413f3..59f9d82ce532 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -8937,7 +8937,8 @@ ixgbe_mdio_read(struct net_device *netdev, int prtad, int devad, u16 addr)
 		int regnum = addr;
 
 		if (devad != MDIO_DEVAD_NONE)
-			regnum |= (devad << 16) | MII_ADDR_C45;
+			return mdiobus_c45_read(adapter->mii_bus, prtad,
+						devad, regnum);
 
 		return mdiobus_read(adapter->mii_bus, prtad, regnum);
 	}
@@ -8960,7 +8961,8 @@ static int ixgbe_mdio_write(struct net_device *netdev, int prtad, int devad,
 		int regnum = addr;
 
 		if (devad != MDIO_DEVAD_NONE)
-			regnum |= (devad << 16) | MII_ADDR_C45;
+			return mdiobus_c45_write(adapter->mii_bus, prtad, devad,
+						 regnum, value);
 
 		return mdiobus_write(adapter->mii_bus, prtad, regnum, value);
 	}

-- 
2.30.2

