Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4428C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 13:49:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4398D20731
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 13:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lygWETsn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gsoQNuhr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4398D20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tyx9TBYfTIxM0ljU7pJ/WGeEkllEoFMtuxttEsqA4tA=; b=lygWETsniVNAtBpAPdbzeIlTrm
	c+2RpnkTRIfYQhkreFY0RQyFbmc1PcGSMdzes8OUZ48VlmPsnq5XYHDj/KvtATM8q6/EPEVHQ0sMx
	OjDLERRgPnyFNbsl3DGyiZgI47j9cxH5Dy/YuuC1fSZHdatBSsIibwwCVd/LH8sx+hUTGD1Wo6Fv5
	tvceUxpAPOs86+bkoLzeOS6osOnHGidUACMRFyJ1ihfF90ocxmx0YrZzj2brRJw9TGS+yzHm7OikJ
	pFvcPwlcFt/e6yXlSuAv76qj0sgYvN5yVcAxrYx4PXVBlor+5z3Pe/GkQGY9vYaRAHCgZlqLlbpoG
	fpuMqZDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGjQX-0003y0-UN; Fri, 11 Sep 2020 13:49:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGjQT-0003xD-64; Fri, 11 Sep 2020 13:49:18 +0000
X-UUID: 82b14614d6ac4fafb87b49c4f22e8fca-20200911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=MkU2LaCnOssekgPwIVl1I9pETqJ6+L8geigHE05ACLc=; 
 b=gsoQNuhrssG/vJrWbef0DrLhuA40fAyZzmihpiuOCV3OnXAn5TyEzavDUuYDtPuz3K0hhUxHEBy8RoW8Sux6kt7GmxB28HDmra2uJWTll/X8XfFhtyZ1SF9o2L7+KaZ+3c+ZU1mxQMODap2SVVraPg71/KUQXd14FXu1HR3cQdQ=;
X-UUID: 82b14614d6ac4fafb87b49c4f22e8fca-20200911
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1657414812; Fri, 11 Sep 2020 05:49:14 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 06:49:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 21:49:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Sep 2020 21:49:09 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Russell
 King" <linux@armlinux.org.uk>
Subject: [PATCH net-next v5 0/6] net-next: dsa: mt7530: add support for MT7531
Date: Fri, 11 Sep 2020 21:48:50 +0800
Message-ID: <cover.1599829696.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_094917_426248_A9ED5B5B 
X-CRM114-Status: GOOD (  17.32  )
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
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, Landen Chao <landen.chao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series adds support for MT7531.

MT7531 is the next generation of MT7530 which could be found on Mediatek
router platforms such as MT7622 or MT7629.

It is also a 7-ports switch with 5 giga embedded phys, 2 cpu ports, and
the same MAC logic of MT7530. Cpu port 6 only supports SGMII interface.
Cpu port 5 supports either RGMII or SGMII in different HW SKU, but cannot
be muxed to PHY of port 0/4 like mt7530. Due to support for SGMII
interface, pll, and pad setting are different from MT7530.

MT7531 SGMII interface can be configured in following mode:
- 'SGMII AN mode' with in-band negotiation capability
    which is compatible with PHY_INTERFACE_MODE_SGMII.
- 'SGMII force mode' without in-band negotiation
    which is compatible with 10B/8B encoding of
    PHY_INTERFACE_MODE_1000BASEX with fixed full-duplex and fixed pause.
- 2.5 times faster clocked 'SGMII force mode' without in-band negotiation
    which is compatible with 10B/8B encoding of
    PHY_INTERFACE_MODE_2500BASEX with fixed full-duplex and fixed pause.

v4 -> v5
- Add fixed-link node to dsa cpu port in dts file by suggestion of
  Vladimir Oltean.

v3 -> v4
- Adjust the coding style by suggestion of Jakub Kicinski.
  Remove unnecessary jumping label, merge continuous numeric 'switch
  cases' into one line, and keep the variables longest to shortest
  (reverse xmas tree).

v2 -> v3
- Keep the same setup logic of mt7530/mt7621 because these series of
  patches is for adding mt7531 hardware.
- Do not adjust rgmii delay when vendor phy driver presents in order to
  prevent double adjustment by suggestion of Andrew Lunn.
- Remove redundant 'Example 4' from dt-bindings by suggestion of
  Rob Herring.
- Fix typo.

v1 -> v2
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

Landen Chao (6):
  net: dsa: mt7530: Refine message in Kconfig
  net: dsa: mt7530: Extend device data ready for adding a new hardware
  dt-bindings: net: dsa: add new MT7531 binding to support MT7531
  net: dsa: mt7530: Add the support of MT7531 switch
  arm64: dts: mt7622: add mt7531 dsa to mt7622-rfb1 board
  arm64: dts: mt7622: add mt7531 dsa to bananapi-bpi-r64 board

 .../devicetree/bindings/net/dsa/mt7530.txt    |   13 +-
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |   50 +
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   63 +-
 drivers/net/dsa/Kconfig                       |    6 +-
 drivers/net/dsa/mt7530.c                      | 1192 +++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  259 +++-
 6 files changed, 1467 insertions(+), 116 deletions(-)

-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
