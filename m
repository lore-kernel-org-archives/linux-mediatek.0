Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC9EC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 23:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3qYLXyBc6yIyyK/QL6G5uDCUOcpKKSAsCoCRDUkxmQ=; b=1Sr79VYmlOsKdk/uOp3YK1tsVO
	JVPx+DuWtUkO7P9JEwHC4qAHmMU3kYsh2CMQDkgUOFlAIkA04wmlD40lvj0ZS2bjuWXxJs8ckE8le
	8LI9iNmPYHyPQsjiRUGV0/AIPMhyQcG8GhPGkuKU5cH3w3PrTmX45jIb//rskXjbYVOzuAX8Mq0tP
	vKt7zYC/lR/9y6zsOZX6nd9xWfDK/gjN/ELNCyfDUjPnJW71TFIJYx0VWUGmzoIh+z83XFWM98boP
	qg2xaFYxAF7LwFnpIBhdibyFQG6UX+etgGFvYKBC8yLqAcfXtY40SM4gQADTjYiWedzxaUxHdGnm3
	I5BQLGgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHZJs-00CJXW-3M; Mon, 16 Jan 2023 23:55:16 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHZHa-00CIEi-9e; Mon, 16 Jan 2023 23:52:57 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 84B6019E1;
	Tue, 17 Jan 2023 00:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673913169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3qYLXyBc6yIyyK/QL6G5uDCUOcpKKSAsCoCRDUkxmQ=;
	b=YRLOsOmaFRKZei5adzuAH0AgP0yhArS53j0xCeiNyf4eSu6cevLBmQGDmv02QXMGPTqM3I
	gc7cg5NS3j1olshw8fSbxCXYdhMBiQpsjv94lGCJPoKjOrH3O7yhIzo1EhDdxH+dHwixRs
	xbMVwbCnCMyg1iXDf1YJk0cH+LIr7mYprGlOKUO7u4oz/oTf9fipLNitiOmDX5rRotolKx
	fnRnVdGX0yoFKiCLfjm1mKcq9qrMOQBCXSZIkgKIduCXq1bWPpBCuXc45emkSorCXbtAdR
	zH3n77hq0VeJVDTwEkR+sJa4K4+YoZqEElUwoue1N1S4SRypLEU0ZLt6nCJXVQ==
From: Michael Walle <michael@walle.cc>
Date: Tue, 17 Jan 2023 00:52:24 +0100
Subject:  [PATCH net-next 09/12] amd-xgbe: Replace MII_ADDR_C45 with XGBE_ADDR_C45
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230116-net-next-c45-seperation-part-3-v1-9-0c53afa56aad@walle.cc>
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
X-CRM114-CacheID: sfid-20230116_155254_614879_9D3F5DD9 
X-CRM114-Status: GOOD (  14.21  )
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

The xgbe driver reuses MII_ADDR_C45 for its own purpose. The values
derived with it are never passed to phylib or a linux MDIO bus driver.
In order that MII_ADDR_C45 can be removed, add an XGBE specific

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/ethernet/amd/xgbe/xgbe-common.h | 11 ++++++-----
 drivers/net/ethernet/amd/xgbe/xgbe-dev.c    | 16 ++++++++--------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-common.h b/drivers/net/ethernet/amd/xgbe/xgbe-common.h
index 466273b22f0a..3fd9728f817f 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-common.h
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-common.h
@@ -1699,20 +1699,21 @@ do {									\
 } while (0)
 
 /* Macros for building, reading or writing register values or bits
- * using MDIO.  Different from above because of the use of standardized
- * Linux include values.  No shifting is performed with the bit
- * operations, everything works on mask values.
+ * using MDIO.
  */
+
+#define XGBE_ADDR_C45 BIT(30)
+
 #define XMDIO_READ(_pdata, _mmd, _reg)					\
 	((_pdata)->hw_if.read_mmd_regs((_pdata), 0,			\
-		MII_ADDR_C45 | (_mmd << 16) | ((_reg) & 0xffff)))
+		XGBE_ADDR_C45 | (_mmd << 16) | ((_reg) & 0xffff)))
 
 #define XMDIO_READ_BITS(_pdata, _mmd, _reg, _mask)			\
 	(XMDIO_READ((_pdata), _mmd, _reg) & _mask)
 
 #define XMDIO_WRITE(_pdata, _mmd, _reg, _val)				\
 	((_pdata)->hw_if.write_mmd_regs((_pdata), 0,			\
-		MII_ADDR_C45 | (_mmd << 16) | ((_reg) & 0xffff), (_val)))
+		XGBE_ADDR_C45 | (_mmd << 16) | ((_reg) & 0xffff), (_val)))
 
 #define XMDIO_WRITE_BITS(_pdata, _mmd, _reg, _mask, _val)		\
 do {									\
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-dev.c b/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
index aafa02fb3fdf..f393228d41c7 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
@@ -1157,8 +1157,8 @@ static int xgbe_read_mmd_regs_v2(struct xgbe_prv_data *pdata, int prtad,
 	unsigned int mmd_address, index, offset;
 	int mmd_data;
 
-	if (mmd_reg & MII_ADDR_C45)
-		mmd_address = mmd_reg & ~MII_ADDR_C45;
+	if (mmd_reg & XGBE_ADDR_C45)
+		mmd_address = mmd_reg & ~XGBE_ADDR_C45;
 	else
 		mmd_address = (pdata->mdio_mmd << 16) | (mmd_reg & 0xffff);
 
@@ -1189,8 +1189,8 @@ static void xgbe_write_mmd_regs_v2(struct xgbe_prv_data *pdata, int prtad,
 	unsigned long flags;
 	unsigned int mmd_address, index, offset;
 
-	if (mmd_reg & MII_ADDR_C45)
-		mmd_address = mmd_reg & ~MII_ADDR_C45;
+	if (mmd_reg & XGBE_ADDR_C45)
+		mmd_address = mmd_reg & ~XGBE_ADDR_C45;
 	else
 		mmd_address = (pdata->mdio_mmd << 16) | (mmd_reg & 0xffff);
 
@@ -1220,8 +1220,8 @@ static int xgbe_read_mmd_regs_v1(struct xgbe_prv_data *pdata, int prtad,
 	unsigned int mmd_address;
 	int mmd_data;
 
-	if (mmd_reg & MII_ADDR_C45)
-		mmd_address = mmd_reg & ~MII_ADDR_C45;
+	if (mmd_reg & XGBE_ADDR_C45)
+		mmd_address = mmd_reg & ~XGBE_ADDR_C45;
 	else
 		mmd_address = (pdata->mdio_mmd << 16) | (mmd_reg & 0xffff);
 
@@ -1248,8 +1248,8 @@ static void xgbe_write_mmd_regs_v1(struct xgbe_prv_data *pdata, int prtad,
 	unsigned int mmd_address;
 	unsigned long flags;
 
-	if (mmd_reg & MII_ADDR_C45)
-		mmd_address = mmd_reg & ~MII_ADDR_C45;
+	if (mmd_reg & XGBE_ADDR_C45)
+		mmd_address = mmd_reg & ~XGBE_ADDR_C45;
 	else
 		mmd_address = (pdata->mdio_mmd << 16) | (mmd_reg & 0xffff);
 

-- 
2.30.2

