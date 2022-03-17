Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BF0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 14:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XrgDmqHlWc1bcDxfR6vjJTgRstkuRzXKi2VUYiolP94=; b=zrtyeYUAjRF7AC
	eqE1vcfebB9vR8T45EhIsvqKg4iUABnc+RQ01NwtyHi6MAxXk2Bxc1mxAJTQZHk8oF6xI1w9usohm
	Gm/alu1kF6OGMkZRz4FDY4rm4Ja5yZ9NaM46UgpeZ71QyTCnQkX/tuKB1jHU2SVXIdgW+XHvKH7JG
	0VdjT06yu2n1vzTfsJyQ9IAJ4upK0MKlieiWyxFJJpf9PWiqLbzYoC3TthA1LFYSPk1c0fp03qwCQ
	f19NrgKhwkQhYE+WjzVSrCyu2xooiAaQKzG+5CsGenkF9UNummJVRTydjznbczvMGLur8znMGmiJd
	hyIyHIbuniPra+s7VunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUrJ3-00GSlC-QY; Thu, 17 Mar 2022 14:40:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUrI4-00GS9M-PM; Thu, 17 Mar 2022 14:39:50 +0000
X-UUID: ba3c09e1d9f24b828c4d27b090f91167-20220317
X-UUID: ba3c09e1d9f24b828c4d27b090f91167-20220317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1737740743; Thu, 17 Mar 2022 07:39:44 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 07:39:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Mar 2022 22:39:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Mar 2022 22:39:27 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <pihsun@chromium.org>, <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <moudy.ho@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v14 0/6] Add mutex support for MDP
Date: Thu, 17 Mar 2022 22:39:20 +0800
Message-ID: <20220317143926.15835-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_073948_865137_4F532E42 
X-CRM114-Status: GOOD (  12.66  )
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
mutex drivers, which increases the independence of the modules

Moudy Ho (6):
  soc: mediatek: mutex: add common interface to accommodate multiple
    modules operationg MUTEX
  soc: mediatek: mutex: add 8183 MUTEX MOD settings for MDP
  dt-bindings: soc: mediatek: move out common module from display folder
  dt-bindings: soc: mediatek: add gce-client-reg for MUTEX
  dts: arm64: mt8183: add GCE client property for Mediatek MUTEX
  soc: mediatek: mutex: add functions that operate registers by CMDQ

 .../mediatek/mediatek,mutex.yaml              |  10 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   1 +
 drivers/soc/mediatek/mtk-mutex.c              | 187 +++++++++++++++++-
 include/linux/soc/mediatek/mtk-mutex.h        |  23 +++
 4 files changed, 219 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,mutex.yaml (83%)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
