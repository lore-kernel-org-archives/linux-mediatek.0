Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61197C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 23:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9NXyj08/VRkafMXUB3qax5P2d+sp7z57TdP+lU677PQ=; b=U91yjS44fNZpcZ
	YYZ2KTi5CW7MBXhgxiF0Y5rvuE6xZRHHu2i23cNexg9/boliDfWAy42vu7CnbZaJ875GisSG1H5OC
	DRgnfc17rp0ayWRvk62kS9CI1JnHb//HS1JZlzTeHwNLzcxzieEJWCiUHrrMiMOh+g1ewQMmzkgBr
	72jh3EKUaVl0PrdQjaD3ZQbWRI+kloXZE23RkENQuzBJ4JUidWUME6KevUhkZDykl5+fZ5LE/Vt7S
	p386Jecyb6phsj3Z6wD8palxJGLmEgLMYdwBZBySTTj76lBgu378GvqHAIhdm9l8k1kN/fsHoKB7S
	Axpb3Vge5HlQ2zOn05MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHZIN-00CIao-5L; Mon, 16 Jan 2023 23:53:43 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHZHW-00CICl-OO; Mon, 16 Jan 2023 23:52:54 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id DE3F39EF;
	Tue, 17 Jan 2023 00:52:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673913164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9NXyj08/VRkafMXUB3qax5P2d+sp7z57TdP+lU677PQ=;
	b=QoNpfy8VBKQeOx6xUXRguUzScp9m6a8QuHLmFjdrfJ4Hv+VB6QWFzA9/K5FJUXhtkFIpAe
	vVGRcUajt5L9FgpRePe0Gz1995DAO7uzFOlveXFzz/4nfK0BBWRxuzndc0GBIOusSzOJOA
	aOExxMBt49LfEq8zFMShRC/dRfg7sIzHt+9gS/RJdqZOCrfxHblHB7Me/YBO1zCm91LCMX
	dVMhyJzUqnldGcJVw0ArXJthYmR7NU6svZtEbAspTyvM/Ek+SHwGjvJ10I5iOdb84gGDMJ
	LnIu0QRkmDd032PAmLZQVnaDqiJnqz+Ix40SsKp4IUl3DsFay3+CNRoGom/QRA==
From: Michael Walle <michael@walle.cc>
Subject: [PATCH net-next 00/12] net: mdio: Continue separating C22 and C45
Date: Tue, 17 Jan 2023 00:52:16 +0100
Message-Id:  <20230116-net-next-c45-seperation-part-3-v1-0-0c53afa56aad@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADDjxWMC/zWNwQrCMBBEf6Xs2YWmsSr+injYpBubgzHshlIo/
 Xe3goc5PIZ5s4GyZFa4dxsIL1nzpxi4UwdxpvJizJMxDP3ge+cuWLhZ1obxPKJyZaFmG6wkDT2m
 0d+uIU7JM4FJAiljECpxPjRv0sZyFFU45fX3/IC/FJ77/gWfYfhdkwAAAA==
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
X-CRM114-CacheID: sfid-20230116_155251_017138_BFA75A2E 
X-CRM114-Status: GOOD (  14.08  )
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

I've picked this older series from Andrew up and rebased it onto
the latest net-next.

This is the third (and hopefully last) patch set in the series which
separates the C22 and C45 MDIO bus transactions at the API level to the
MDIO bus drivers.

The first patch is a newer version of the former "net: dsa: Separate C22
and C45 MDIO bus transaction methods", which only contains the mt7530
changes. Although posted as v1, because this is a new series, there is a
changelog included in the patch comment section.

The last patch is a new one, which isn't from Andrew's tree.

To: Sean Wang <sean.wang@mediatek.com>
To: Landen Chao <Landen.Chao@mediatek.com>
To: DENG Qingfang <dqfext@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: Byungho An <bh74.an@samsung.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
To: Jesse Brandeburg <jesse.brandeburg@intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
To: Yisen Zhuang <yisen.zhuang@huawei.com>
To: Salil Mehta <salil.mehta@huawei.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: intel-wired-lan@lists.osuosl.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>

---
Andrew Lunn (11):
      net: dsa: mt7530: Separate C22 and C45 MDIO bus transactions
      net: sxgbe: Separate C22 and C45 transactions
      net: nixge: Separate C22 and C45 transactions
      net: macb: Separate C22 and C45 transactions
      ixgbe: Separate C22 and C45 transactions
      ixgbe: Use C45 mdiobus accessors
      net: hns: Separate C22 and C45 transactions
      amd-xgbe: Separate C22 and C45 transactions
      amd-xgbe: Replace MII_ADDR_C45 with XGBE_ADDR_C45
      net: dsa: sja1105: C45 only transactions for PCS
      net: dsa: sja1105: Separate C22 and C45 transactions for T1 MDIO bus

Michael Walle (1):
      net: ethernet: renesas: rswitch: C45 only transactions

 drivers/net/dsa/mt7530.c                        |  87 ++++-----
 drivers/net/dsa/mt7530.h                        |  15 +-
 drivers/net/dsa/sja1105/sja1105.h               |  16 +-
 drivers/net/dsa/sja1105/sja1105_mdio.c          | 131 ++++++-------
 drivers/net/dsa/sja1105/sja1105_spi.c           |  24 +--
 drivers/net/ethernet/amd/xgbe/xgbe-common.h     |  11 +-
 drivers/net/ethernet/amd/xgbe/xgbe-dev.c        |  91 ++++++---
 drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c     | 120 +++++++++---
 drivers/net/ethernet/amd/xgbe/xgbe.h            |   7 +-
 drivers/net/ethernet/cadence/macb_main.c        | 161 ++++++++++------
 drivers/net/ethernet/hisilicon/hns_mdio.c       | 192 +++++++++++++------
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c   |   6 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c    | 237 ++++++++++++++++++------
 drivers/net/ethernet/ni/nixge.c                 | 141 ++++++++------
 drivers/net/ethernet/renesas/rswitch.c          |  28 +--
 drivers/net/ethernet/samsung/sxgbe/sxgbe_mdio.c | 105 ++++++++---
 16 files changed, 906 insertions(+), 466 deletions(-)
---
base-commit: c941c0a15bee01a702d82793fe605326d453d9a7
change-id: 20230116-net-next-c45-seperation-part-3-f5387bcdf3ea

Best regards,
-- 
Michael Walle <michael@walle.cc>

