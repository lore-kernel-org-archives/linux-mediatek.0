Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47813C43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 03:49:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BD28206EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 03:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Re2Ld92V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bkWDs9UW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BD28206EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4xRJ5ISZubIWcR9yUHnv2aXcSqd50kzb6zgBRSKDLqM=; b=Re2Ld92V/iNriz
	HWHf68DUH6bXPDa6eWgYgHMXUsRKiJCRBP+DlCetn3GW3vY7bie7BcglrX0SeZ5kJuYJLd+qDIlor
	9nIznratKwDNCW/uBg9UrDGW5/MDGFgUOa4SvYWI/UvWZ9UtuxVbyzxUGNKXQ20RmFHQoWNLfBhzP
	Kq8O/b318ZWeNkv7YPgIkAU+/x/Kv8FQHbRKIj0hgQIf48yQlUtdXYgTgNyyCbay7KDhFjbuyCh6m
	mKhYAR/rtmqlURYPqwwzTco3pIafnQzYsw581WaQM5s++3xZneRF/eNRfe9hugFcQUWqxW8rIxAfX
	iVrpa3RlSpLd55S/y2rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii9Hj-0004u9-Jn; Fri, 20 Dec 2019 03:49:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii9Hh-0004tT-6M; Fri, 20 Dec 2019 03:49:02 +0000
X-UUID: 94f6154125a7471f9ab9be3c8ca34689-20191219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=NSTNC8ojUfDT+QqUlxsgN+IId/aGcya1wEt805+6O/I=; 
 b=bkWDs9UW1V6u8bCL1WZb70OcQbBfwDqUrE644JP4qAIup1UWdfL0IVgEa8y5N3VDDBK+1CRqnExetk5PLTpQOZ4qvNWkcULBdVoa7G5/rJzsYHcvnGIe3glDRgfAfNfncyYabuwg7uYA4lYpfO4YZyNC8Txlh+GVCF1Tb+Q7cHI=;
X-UUID: 94f6154125a7471f9ab9be3c8ca34689-20191219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1985136665; Thu, 19 Dec 2019 19:48:58 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 19:46:30 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 11:45:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 20 Dec 2019 11:46:06 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <kernel@pengutronix.de>
Subject: [PATCH v11 00/10] Mediatek MT8183 scpsys support
Date: Fri, 20 Dec 2019 11:45:54 +0800
Message-ID: <1576813564-23927-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: C84FC9C5B614AE4979CECEE3C56478ADD57E74CC0E01985DD669D5AB984E61F02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_194901_239439_827B8A4E 
X-CRM114-Status: GOOD (  12.42  )
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
  soc: mediatek: Add multiple step bus protection control
  soc: mediatek: Remove infracfg misc driver support
  soc: mediatek: Add subsys clock control for bus protection
  soc: mediatek: Add extra sram control
  soc: mediatek: Add MT8183 scpsys support
  arm64: dts: Add power controller device node of MT8183
  arm64: dts: Add power-domains properity to mfgcfg

 .../memory-controllers/mediatek,smi-common.txt     |   2 +-
 .../devicetree/bindings/soc/mediatek/scpsys.txt    |  20 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  63 +++
 drivers/soc/mediatek/Kconfig                       |  10 -
 drivers/soc/mediatek/Makefile                      |   3 +-
 drivers/soc/mediatek/mtk-infracfg.c                |  79 ---
 drivers/soc/mediatek/mtk-scpsys-ext.c              | 101 ++++
 drivers/soc/mediatek/mtk-scpsys.c                  | 578 +++++++++++++++------
 drivers/soc/mediatek/scpsys-ext.h                  |  95 ++++
 include/dt-bindings/power/mt8183-power.h           |  26 +
 include/linux/soc/mediatek/infracfg.h              |  39 --
 11 files changed, 736 insertions(+), 280 deletions(-)
 delete mode 100644 drivers/soc/mediatek/mtk-infracfg.c
 create mode 100644 drivers/soc/mediatek/mtk-scpsys-ext.c
 create mode 100644 drivers/soc/mediatek/scpsys-ext.h
 create mode 100644 include/dt-bindings/power/mt8183-power.h
 delete mode 100644 include/linux/soc/mediatek/infracfg.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
