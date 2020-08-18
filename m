Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7026C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:25:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A966E205CB
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:25:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XGQWgdt1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hCWNi3bG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A966E205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2PtUC04qf4Gm+bUu3t0P7kmV2xf+UcgO+3ywDN7AC94=; b=XGQWgdt1X7eCA7C4PGcxe+RY7y
	tW0GEMU5S30ogTpalWpH0YsUeYSXaXUVEUpMMjO7TyUW3/h5TNQUnU5CuCiTVpxRmQ2btL0dW6bbM
	2DDTjZ4xsvZm6Bl9FgHbuZSNhBJwG9OI7xhkBvLdqC8BFne2YNS8InclApBkrQO9DEt0dXGNw3pSP
	Ops+rGc0K3pRLpHDV/ZC4J3mqI/NqFLg4Y0ay4HtmCFreM5tJRRxjxsEGuskdvR4LMqUDRdRUHqY5
	+Q565dINEcqlQeWdBfjz7tY9LmtYeiNuldrjuelGhKmAR4N5lox5/M+JvsZq1DyZBDTdhKDowAV/O
	zFwajzjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7vzK-0005MZ-KJ; Tue, 18 Aug 2020 07:24:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7vzG-0005Is-AW
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 07:24:52 +0000
X-UUID: 7f71a322258e4987bbeb205a32c3f953-20200817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=V6XxCpPTSlmV62qL2azad6TOR58m4DQS08EIOISEdq4=; 
 b=hCWNi3bGS1TTNBHFXqsWpfZlZiz3rXEyJli0ekQMsb3zuFKECf2eOIO3smMPoF3Bw+tydUa829hikwZPrZi0C8xk1a+RKRgOozJjyMM47I9e0Z1+sDIz7VOdIi2aBw2U62h4xDfbaHDm/lMOtb2YLUi1kwzr3pNJsiFtbbyJ46c=;
X-UUID: 7f71a322258e4987bbeb205a32c3f953-20200817
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1323104897; Mon, 17 Aug 2020 23:21:38 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 00:14:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 15:14:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 Aug 2020 15:14:16 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <vivien.didelot@savoirfairelinux.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Subject: [PATCH net-next v2 0/7] net-next: dsa: mt7530: add support for MT7531
Date: Tue, 18 Aug 2020 15:14:05 +0800
Message-ID: <cover.1597729692.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_032450_533555_68A7DAF1 
X-CRM114-Status: GOOD (  15.32  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, dqfext@gmail.com, frank-w@public-files.de,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, linux-mediatek@lists.infradead.org,
 Landen Chao <landen.chao@mediatek.com>, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series adds support for MT7531.

MT7531 is the next generation of MT7530 which could be found on Mediatek
router platforms such as MT7622 or MT7629.

It is also a 7-ports switch with 5 giga embedded phys, 2 cpu ports, and
the same MAC logic of MT7530. Cpu port 6 only supports SGMII interface.
Cpu port 5 supports either RGMII or SGMII in different HW SKU. Due to
support for SGMII interface, pll, and pad setting are different from
MT7530.

MT7531 SGMII interface can be configured in following mode:
- 'SGMII AN mode' with in-band negotiation capability
    which is compatible with PHY_INTERFACE_MODE_SGMII.
- 'SGMII force mode' without in-bnad negotiation
    which is compatible with 10B/8B encoding of
    PHY_INTERFACE_MODE_1000BASEX with fixed full-duplex and fixed pause.
- 2.5 times faster clocked 'SGMII force mode' without in-bnad negotiation
    which is compatible with 10B/8B encoding of
    PHY_INTERFACE_MODE_2500BASEX with fixed full-duplex and fixed pause.

changes between v1 & v2
- change phylink_validate callback function to support full-duplex
  gigabit only to match hardware capability.
- add description of SGMII interface.
- configure mt7531 cpu port in fastest speed by default.
- parse SGMII control word for in-band negotiation mode.
- configure RGMII delay based on phy.rst.
- Rename the definition in the header file to avoid potential conflicts.
- Add wrapper function for mdio read/write to support both C22 and C45.
- correct fixed-link speed of 2500base-x in dts.
- add MT7531 port mirror setting.

Landen Chao (7):
  net: dsa: mt7530: Refine message in Kconfig
  net: dsa: mt7530: support full-duplex gigabit only
  net: dsa: mt7530: Extend device data ready for adding a new hardware
  dt-bindings: net: dsa: add new MT7531 binding to support MT7531
  net: dsa: mt7530: Add the support of MT7531 switch
  arm64: dts: mt7622: add mt7531 dsa to mt7622-rfb1 board
  arm64: dts: mt7622: add mt7531 dsa to bananapi-bpi-r64 board

 .../devicetree/bindings/net/dsa/mt7530.txt    |   71 +-
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |   44 +
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   57 +-
 drivers/net/dsa/Kconfig                       |    6 +-
 drivers/net/dsa/mt7530.c                      | 1184 +++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  259 +++-
 6 files changed, 1514 insertions(+), 107 deletions(-)

-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
