Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955B3EB64DE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 13:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ysY9Sm6/JWBZ3bOT6S/Yzq5jj/3qAL5EYD8foDPm2Q0=; b=03zPVW0tyvNufrzkzTbAobmD3x
	IPK8VxD2cZIP5AFii2YTrTAffYNrgrJZr+SHf9LxfzupPvu8mP/uSJWTKXiOzZ88jsn5Wg/D70leJ
	jhpTmarnSQYS6dKily7d0HBNDhQD905aP0j/ppXfL1q3aFSYKoZ4ydvISGvwb1rbWVVCWh9cFzugH
	TXn4tTjkgJ5ZWotl5eRwyrGdESl+xT98dojjnbeNoBNZ2JV1hs13+3QCXcg6seynERyUREVzpbiPv
	AL6k3x+5mnNB2m6Er5O0fu0VZlJSyjUSJilS6jENWP6UFOALxlZg2LY5Jrv1k7H+dr2j6UZ3Hcu6W
	5IBZfwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0Wy-00000005edn-2rl6;
	Tue, 10 Sep 2024 13:03:40 +0000
Received: from mta-64-225.siemens.flowmailer.net ([185.136.64.225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0Wv-00000005ecW-2IId
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 13:03:39 +0000
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20240910130332a12ddb7ac64ec3d8e6
        for <linux-mediatek@lists.infradead.org>;
        Tue, 10 Sep 2024 15:03:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ysY9Sm6/JWBZ3bOT6S/Yzq5jj/3qAL5EYD8foDPm2Q0=;
 b=Lm+poT+zCYhcBoxzXcBNf1re8bJ0YaLedOb4LNRNhibSLtF7DeWFZTM+QwdLNheEe1GVtD
 fAYFg5nzY321NNl0BXrEGHrWz4iFDOxbO5oFYIVX4p/N/16fI2r2I43dksAS2K3I2H+s/Dr+
 PkG8P7eg5oiXD1m5T6F/GrFBbKmcjfji5Hezn+olJ7yiadhEXLMRK7x9iF21DGvSOi0wXQGb
 BcZp8VLrBoBPC+qB9oEAAnLrNCdke/xheqwKD8q8C423IR0/vwiREcGg9h5rOterU52C88Fx
 8VRNHrikSmVukCpuqgUxdvzs6iwIbSZhxemAC8yd/76ocmRGsTcIQbXQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: netdev@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 =?ISO-8859-1?Q?Ar1n=E7_=DCNAL?= <arinc.unal@arinc9.com>, Daniel Golle
 <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli
 <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, UNGLinuxDriver@microchip.com, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay
 Aleksandrov <razor@blackwall.org>, linux-mediatek@lists.infradead.org,
 bridge@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: [PATCH 0/2] net: dsa: RCU-protect dsa_ptr in struct net_device
Date: Tue, 10 Sep 2024 15:03:14 +0200
Message-ID: <20240910130321.337154-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_060338_025824_10104016 
X-CRM114-Status: UNSURE (   8.17  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

There are multiple races of zeroing dsa_ptr in struct net_device (on
shutdown/remove) against asynchronous dereferences all over the net
code. Widespread pattern is as follows:

CPU0					CPU1
if (netdev_uses_dsa())
					dev->dsa_ptr = NULL;
        dev->dsa_ptr->...

RCU-protect the dsa_ptr and ajust the documentation where unsafe patterns
were mentioned.

The first patch has been compiled with ARCH=arm64 and allyesconfig against
v6.11-rc6. Backported to v6.1 and tested on arm64 HW with LAN9303 switch
(where the issue was initially reproduced), including LOCKDEP and
PROVE_RCU. Therefore I will be able to provide v6.1 backport (for -stable
purposes) and later v6.8 backport as well.

Alexander Sverdlin (2):
  net: dsa: RCU-protect dsa_ptr in struct net_device
  docs: net: dsa: RCU protection of dsa_ptr in struct net_device

 Documentation/networking/dsa/dsa.rst        |  18 ++--
 drivers/net/dsa/mt7530.c                    |   3 +-
 drivers/net/dsa/ocelot/felix.c              |   3 +-
 drivers/net/dsa/qca/qca8k-8xxx.c            |   3 +-
 drivers/net/ethernet/broadcom/bcmsysport.c  |   8 +-
 drivers/net/ethernet/mediatek/airoha_eth.c  |   2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c |  22 +++--
 drivers/net/ethernet/mediatek/mtk_ppe.c     |  15 ++-
 include/linux/netdevice.h                   |   2 +-
 include/net/dsa.h                           |  36 +++++--
 include/net/dsa_stubs.h                     |   6 +-
 net/bridge/br_input.c                       |   2 +-
 net/core/dev.c                              |   3 +-
 net/core/flow_dissector.c                   |  19 ++--
 net/dsa/conduit.c                           |  66 ++++++++-----
 net/dsa/dsa.c                               |  19 ++--
 net/dsa/port.c                              |   3 +-
 net/dsa/tag.c                               |   3 +-
 net/dsa/tag.h                               |  19 ++--
 net/dsa/tag_8021q.c                         |  10 +-
 net/dsa/tag_brcm.c                          |   2 +-
 net/dsa/tag_dsa.c                           |   8 +-
 net/dsa/tag_qca.c                           |  10 +-
 net/dsa/tag_sja1105.c                       |  22 +++--
 net/dsa/user.c                              | 104 +++++++++++---------
 net/ethernet/eth.c                          |   2 +-
 26 files changed, 249 insertions(+), 161 deletions(-)

-- 
2.46.0


