Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA407C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 06:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2eYAj1r9aa13hMqiyjgWPq19lexYMgqUXKhRE9I/R70=; b=sVj5F3AI8C+ZbX
	YkUGAcY7InI10kT4wRujIEEszlqO22HuPw3Iayujsqc2bZQZlzOZ6+w/HEv3N2uvaCRVOCfOE5XsU
	ZOGMeF4CFg6avCfAveRJWGf70Ril8LUn/7OCwTFsN1dyYEgmekqZQo6w/NlW43Yn9TOXqL8Bjg6MF
	sFZQ+YBHKi97C88t3wxvVNN7AubOd04fqYkCPkIlA3ifytM689/6XyIFX3BIU4fkn6aF5O3fV7XO7
	gobt/ApgwEq61I0Hh5sEIXzuRFVUtAEvE/qlVIYfbuhAU4v1XAl8jquomAUJtfX281vsd0qid2Cx5
	J1nF1ZlrNdlXn1IoDy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njbVC-0004t6-Pl; Wed, 27 Apr 2022 06:50:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njbUn-0004jz-QO; Wed, 27 Apr 2022 06:49:55 +0000
X-UUID: 88b5fd1eeddc43cfbc59d54b755d5712-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:37f3bdd4-3066-4929-a765-7258e46441f6, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:4997dc2e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 88b5fd1eeddc43cfbc59d54b755d5712-20220426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 204415928; Tue, 26 Apr 2022 23:49:45 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 23:44:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 14:44:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 14:44:30 +0800
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v17 0/6] Add mutex support for MDP
Date: Wed, 27 Apr 2022 14:44:19 +0800
Message-ID: <20220427064425.30383-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_234953_891871_37F66510 
X-CRM114-Status: GOOD (  16.02  )
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

 .../mediatek/mediatek,mutex.yaml              |  14 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   1 +
 drivers/soc/mediatek/mtk-mutex.c              | 165 +++++++++++++++++-
 include/linux/soc/mediatek/mtk-mutex.h        |  24 +++
 4 files changed, 202 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,mutex.yaml (82%)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
