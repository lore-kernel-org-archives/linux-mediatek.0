Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018FAC7619C
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:46:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C619C21744
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:46:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qFbPJZep";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GL06Y6kd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C619C21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=npoRpDQuUGhubXSRdJjDZsGAHbJqWENMDY2y1tQGdUg=; b=qFbPJZepP/chNK
	00jRQiA8WMOy+wrEYs0hCK16Udh2cRPBgUAg53oBDBBWwSjbmvR8v1PfzqP0rjuqPUvxhGaLaNcVs
	x4d3uuITZcGxop9kLs3wN/EqrqHUvm1wdlC0RJYiu0KgFe/b9cdprKSxaqPV6Baj1zIBvzofFQzcU
	0UEvhdBgzm9VkvFqnR7z5dQ7jti1LX7vwd2HIghL9Gvq3OO+rWRiUOVNa9Pq6YS80CVx1RLBaL6Q2
	u+2I0XPaoB4dKoYowCQswTDZ6rCx5CwTmvf2kwKt3p7I7JaL4NRetXOrGSX63kZPnVDfh0XSuOKmn
	tUt96EuiNVzD6PaXiWfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3XMp-0001fJ-Hq; Mon, 17 Feb 2020 03:46:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3XLv-0000qD-7G; Mon, 17 Feb 2020 03:45:48 +0000
X-UUID: 4ab96270172a428e83cb51eb1e8b0104-20200216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=d38kig+Zusa5V6aoIvUBBHX1aAbt63Db2pgRYqg7t0k=; 
 b=GL06Y6kd8pL1HQSDEPE1OZWJymXU5+r0Dce5ILiEuU2l46sP3mb/Egh9RI2oWcGis1rkE1o8OgOlfrOaVn6+ftfzOQizwmM0cIYxPK5Vo3NF2sOQp88PiDFmEppH/jPrjDP7rKo6E/ufFXLioZBGP64CY80+KnfyM64ymiuH8WY=;
X-UUID: 4ab96270172a428e83cb51eb1e8b0104-20200216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1893847911; Sun, 16 Feb 2020 19:45:33 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 16 Feb 2020 19:35:56 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 11:33:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 17 Feb 2020 11:35:07 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <kernel@pengutronix.de>
Subject: [PATCH v12 00/10] Mediatek MT8183 scpsys support
Date: Mon, 17 Feb 2020 11:35:17 +0800
Message-ID: <1581910527-1636-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 785D55F3EA22E4D6C03FE494E98FA6AC1A19E1A6762D691285BCAD124FF076B82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_194547_291091_C230C392 
X-CRM114-Status: GOOD (  14.50  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is based on v5.5-rc1

changes since v11:
- re-order patches "Remove infracfg misc driver support" and "Add multiple step bus protection"
- add cap MTK_SCPD_SRAM_ISO for extra sram control
- minor coding sytle fixes and reword commit messages

changes since v10:
- squash PATCH 04 and PATCH 06 in v9 into its previous patch
- add "ignore_clr_ack" for multiple step bus protection control to have a clean definition of power domain data
- keep the mask register bit definitions and do the same for MT8183

changes since v9:
- add new PATCH 04 and PATCH 06 to replace by new method for all compatibles
- add new PATCH 07 to remove infracfg misc driver
- minor coding sytle fix

changes since v7:
- reword in binding document [PATCH 02/14]
- fix error return checking bug in subsys clock control [PATCH 10/14]
- add power domains properity to mfgcfg patch [PATCH 14/14] from
  https://patchwork.kernel.org/patch/11126199/

changes since v6:
- remove the patch of SPDX license identifier because it's already fixed

changes since v5:
- fix documentation in [PATCH 04/14]
- remove useless variable checking and reuse API of clock control in [PATCH 06/14]
- coding style fix of bus protection control in [PATCH 08/14]
- fix naming of new added data in [PATCH 09/14]
- small refactor of multiple step bus protection control in [PATCH 10/14]

changes since v4:
- add property to mt8183 smi-common
- seperate refactor patches and new add function
- add power controller device node


Weiyi Lu (10):
  dt-bindings: mediatek: Add property to mt8183 smi-common
  dt-bindings: soc: Add MT8183 power dt-bindings
  soc: mediatek: Add basic_clk_name to scp_power_data
  soc: mediatek: Remove infracfg misc driver support
  soc: mediatek: Add multiple step bus protection control
  soc: mediatek: Add subsys clock control for bus protection
  soc: mediatek: Add extra sram control
  soc: mediatek: Add MT8183 scpsys support
  arm64: dts: Add power controller device node of MT8183
  arm64: dts: Add power-domains property to mfgcfg

 .../mediatek,smi-common.txt                   |   2 +-
 .../bindings/soc/mediatek/scpsys.txt          |  20 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  63 ++
 drivers/soc/mediatek/Kconfig                  |  10 -
 drivers/soc/mediatek/Makefile                 |   1 -
 drivers/soc/mediatek/mtk-infracfg.c           |  79 ---
 drivers/soc/mediatek/mtk-scpsys.c             | 654 ++++++++++++++----
 drivers/soc/mediatek/scpsys.h                 |  90 +++
 include/dt-bindings/power/mt8183-power.h      |  26 +
 include/linux/soc/mediatek/infracfg.h         |  39 --
 10 files changed, 707 insertions(+), 277 deletions(-)
 delete mode 100644 drivers/soc/mediatek/mtk-infracfg.c
 create mode 100644 drivers/soc/mediatek/scpsys.h
 create mode 100644 include/dt-bindings/power/mt8183-power.h
 delete mode 100644 include/linux/soc/mediatek/infracfg.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
