Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905D3C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 03:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XEZo6MeD7iZ0GlWlMoZRRlpTW9x8DYLfvSsVWsMRYz8=; b=3pdw1HM0a93QZm7fTZkDpf97Xs
	2NKWM2X6v1x4kVdGhY4faV0BQOWt6Nd27dCJ6qT2al4VZAOUTmigZVapU7dHCktBZyRaXOBqYb0y1
	42JVErcXeHiqoWNQiQB4pWjnISM986NCJsR6fIE3VkKOeX8vXWnT/seysAQ94V/wa87MFUp2loVPL
	dT7relFlKX4jRssYKpEuVguYBxnyfE0PZnzX9Oni9mbGXNqBQ8Ca20OTRgbRB9wtQZs6qdjDuQNxg
	HXbDYexQHreKr+FTBF+163yTQIxJgzhzrgrtCYawi3r4O/liwB+pC4P8IwLVkN9nymEhZc9BxrGNZ
	RE/Gky7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogeBn-006uUE-5W; Fri, 07 Oct 2022 03:38:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogeBk-006uSJ-9z
	for linux-mediatek@lists.infradead.org; Fri, 07 Oct 2022 03:38:18 +0000
X-UUID: 01a3f8af996e4670bc1acfa0ff4b56cb-20221006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XEZo6MeD7iZ0GlWlMoZRRlpTW9x8DYLfvSsVWsMRYz8=;
	b=WUX2dznsKOPm30Q4Ms8tjlQXU22y3MNqlIifVSfqlZmmbd4xfB00tI5gEE+nXD7f0eWkEgRVydeMMRbFFghqRhEddoulcveP5SRxDI2aqcrqkAwH2h5TMRu7U0sv4GlLQ4lvmE4XgjE6T2NIm7SXGo84GQdgnijHO75K6IBPMak=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:0607d34c-2227-409e-a8dd-ae83fd09db4b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:66172de1-2948-402a-a6e4-b5d31fe11eb7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 01a3f8af996e4670bc1acfa0ff4b56cb-20221006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 199851064; Thu, 06 Oct 2022 20:38:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 7 Oct 2022 11:17:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 7 Oct 2022 11:17:38 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v1 0/6] Add support for multiple chips
Date: Fri, 7 Oct 2022 11:17:31 +0800
Message-ID: <20221007031737.5125-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_203816_356438_6B311860 
X-CRM114-Status: UNSURE (   9.53  )
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

Hi,

This series are based on following series:
MDP3:
    [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=682204
    [2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=682891
    [3] https://patchwork.kernel.org/project/linux-mediatek/list/?series=683526

To support multiple chips, a chip configuration header file needs to be created
and the relevant information split and moved into it.

Moudy Ho (6):
  media: platform: mtk-mdp3: add chip configuration header file
  media: platform: mtk-mdp3: chip config split about component settings
  media: platform: mtk-mdp3: chip config split about subcomponents
  media: platform: mtk-mdp3: chip config split about color format
  media: platform: mtk-mdp3: chip config split about resolution
    limitations
  media: platform: mtk-mdp3: chip config split about pipe info

 .../media/platform/mediatek/mdp3/mt8183_mdp.h | 409 ++++++++++++++++++
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  42 +-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 160 ++++---
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  24 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  48 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  13 +
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  10 +-
 .../platform/mediatek/mdp3/mtk-mdp3-regs.c    | 283 +-----------
 .../platform/mediatek/mdp3/mtk-mdp3-regs.h    |   7 +-
 9 files changed, 603 insertions(+), 393 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/mdp3/mt8183_mdp.h

-- 
2.18.0


