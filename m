Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798B9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 06:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6e3oVVHcIJ/8YL1JVpxfoA5LHPM283U8+pi+FENMzK0=; b=fN8hTYzjasNIXs
	+POMUONraK9HOM5D/lyQG9kepah2WhJ2lMjJYDoc/+Ou7FI+zae5QFhcxk/eVVmFRzGtOgqb78/m7
	J7A9Drq3FIQWOtoXVsXs0hLdfBavsEcwv8Ar5PT/qmP2B+A8TsNVyu+jB0Ro4dQxdOuYznxKkq7N6
	+FEcHeqpxrJWzDk1NBYPnO1eWDTKXWs2Le1LVGjoTOt19qmcMT3bga5+a6FDdmUbraneSw7qb7n4b
	/qdheM0WbApcJYkltruwgipFZeBL8BtCQebGAq+dlBH03JA9RH7lt8gCug3FTVyBrs09aE10XRqLr
	rY1QPpNvvSL4yEdMq9FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYEV-006AIc-NB; Fri, 10 Jun 2022 06:34:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYE5-006A6K-Gq; Fri, 10 Jun 2022 06:34:37 +0000
X-UUID: d845ecb856b64fbeb7adfa2ba55217c2-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:107ef8f5-6b48-412e-9f84-287aeab5c9b8,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:67ace77e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: d845ecb856b64fbeb7adfa2ba55217c2-20220609
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1123954851; Thu, 09 Jun 2022 23:34:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 23:34:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 10 Jun 2022 14:34:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 10 Jun 2022 14:34:25 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, daoyuan huang
	<daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
	<randy.wu@mediatek.com>, <moudy.ho@mediatek.com>,
	<jason-jh.lin@mediatek.com>, <roy-cw.yeh@mediatek.com>,
	<river.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>
Subject: [PATCH v20 0/6] Add mutex support for MDP
Date: Fri, 10 Jun 2022 14:34:17 +0800
Message-ID: <20220610063424.7800-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_233433_584478_5660F11B 
X-CRM114-Status: GOOD (  16.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Change since V19:
- Reduce parameters pass to function "mtk_mutex_write_sof"
  to avoid redundant action.

Change since V18:
- Rebase on v5.19-rc1
- Remove unnecessary functions:
  "mtk_mutex_set_mod", "mtk_mutex_clear_mod",
  "mtk_mutex_set_sof" and "mtk_mutex_clear_sof", and export
  "mtk_mutex_write_mod" and "mtk_mutex_write_sof" to
  set MOD/SOF directly.
- Remove unnecessary SOF tables and add new enumerations of SOF instead.
- Adjust the error checking for CMDQ operations.

Change since V17:
- Rebase on v5.18-rc6
- Fix undeclared identifier causing compilation to fail.

Change since V16:
- Rebase on v5.18-rc4
- Fix misplacement of definition "CONFIG_MTK_CMDQ" which
  caused compilation error when CMD is not supported.

Change since V15:
- Rebase on linux-next.
- As suggested by Angelo, split common parts into independent functions to
  make functions more concise.
- Based on safety considerations, increase the returned error number and
  message to facilitate error handling.

Change since V14:
- Rebase on linux-next.
- Add new SOF and MOD table for general interface to integrate the requirement
  of different modules.
- Remove unnecessary MOD structure.
- By Rob Herring's suggestion, revise the description of
  "mediatek,gce-client-reg" in MUTEX dt-bindings.
- Delete the redundant definition of MTK_MUTEX_ENABLE and modify corresponding
  function.

Change since V13:
- Rebase on linux-next tag:next-20220316
- Adjust the MUTEX MOD table structure and corresponding functions.
- Adjust the definition style about 8183 MDP MOD.
- Remove redundant definitions and enumerations.
- Adjust the CMDQ operation in MUTEX to be backward compatible

Change since V12:
- Rebase on linux-next
- Remove ISP related settings in MMSYS
- Removed CMDQ operations previously used by MDP in MMSYS
- Move mediatek MUTEX dt-binding path
- Add additional property in MUTEX for CMDQ operations

Change since V11:
- Rebase on v5.17-rc6.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next/soc&id=5f9b5b757e44de47ebdc116c14b90e3cc8bc7acb
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next/soc&id=831785f0e5b919c29e1bc5f9a74e9ebd38289e24
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.17-next/soc&id=15f1768365aed810826a61fef4a744437aa5b426

Change since v10:
- For some ISP application scenarios, such as preview and recording
  at the same time.
  The routing table needs to be discarded, and the calculation result
  on the SCP side is used to write a suitable mux setting for
  1 input and 2 output.
- Adjust the GCE client register parsing method to avoid redundant warning logs.

Change since v9:
- Add API for MDP getting mutex mod.

Hi,

This patch splits mmsys and mutex settings from Media Data Path 3 (MDP3),
and original mailling list list below:
https://patchwork.kernel.org/project/linux-mediatek/cover/20211201095031.31606-1-moudy.ho@mediatek.com/
Corresponding settings and interfaces are added for MDP operation in the
mmsys and mutex drivers, which increases the independence of the modules

Moudy Ho (6):
  soc: mediatek: mutex: add common interface for modules setting
  soc: mediatek: mutex: add 8183 MUTEX MOD settings for MDP
  dt-bindings: soc: mediatek: move out common module from display folder
  dt-bindings: soc: mediatek: add gce-client-reg for MUTEX
  dts: arm64: mt8183: add GCE client property for Mediatek MUTEX
  soc: mediatek: mutex: add functions that operate registers by CMDQ

 .../mediatek/mediatek,mutex.yaml              |  14 ++-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   1 +
 drivers/soc/mediatek/mtk-mutex.c              | 119 +++++++++++++++++-
 include/linux/soc/mediatek/mtk-mutex.h        |  27 ++++
 4 files changed, 159 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,mutex.yaml (81%)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
