Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428D2C77B76
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 06:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NSAEsm+B43z8/D9Tccqcqtf5P15Y+HR/vIbePCa2H3g=; b=gJBg7A4gd3c5w7BhKApmsPEqxL
	1VerYLSViTTH4wCEETFSq+AeegjcirZ1PusL2CfqsSHhktfkNOefwERxWMN1qtxqX9SS0ESYAxSId
	yzBK4LDj8WZBPRxl+sb95BErW5SUbmdA25nVJXyOsanalMq618o/UbNEvsICJpXKYgrE9s0z5wgwP
	domMjSpy/0kTvPhrHOleq8EK+EQsSrBbnjjdPAuk9L6tkZrpKRpWyTwjZCZ93U8esssBCjDoLxXdv
	uzOQJlMMRPVzKP3m+TSAxXGE0Z0qYeAiDBqqVKckG5fm0EpD1xFQaEwsIPgoMC88Xy8TZ/eMnw2iP
	+OO/B+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmq9N-0057vb-0F;
	Thu, 13 Apr 2023 06:09:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmq9F-0057t5-2d;
	Thu, 13 Apr 2023 06:09:36 +0000
X-UUID: bf0b6180d9c111edb7d8d11f642b8e78-20230412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NSAEsm+B43z8/D9Tccqcqtf5P15Y+HR/vIbePCa2H3g=;
	b=tA5iyidIPhQQMHw5xWSFXHXMJVeSTZWQsJuq8ylbR5rPYmIE97zyEP7xbBllsgXwyF8KDxKdaasewCNpqKgXtqM1SGpTDFSi95bvrbIVPazIzrbW0XaBVS/VM8tAWOm9BcpPRWMf/oOC5fhN4lczrSkR4Nv2wXdRtN3p5ZWWFQ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:a463f5f2-6641-4df3-a9d7-266ccdb6e4d7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:fb542ea1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: bf0b6180d9c111edb7d8d11f642b8e78-20230412
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1605008473; Wed, 12 Apr 2023 23:09:27 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 14:09:25 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 14:09:24 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>,
	<shuijing.li@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH 0/3] Add mt8188 compatiable for DSI cmd packet control
Date: Thu, 13 Apr 2023 14:09:19 +0800
Message-ID: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_230933_888680_FAEA774F 
X-CRM114-Status: UNSURE (   7.48  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Add dt-binding documentation of DSI for MediaTek MT8188 SoC.
Because of the difference between SOC and DSI cmd packet control, for
MT8188, it is necessary to increase the DSI_CMDQ_SIZE control when
sending long packets to initialize the panel. Of course, this will not
affect the sending of short packets.

Base on the branch of linus/master v6.3.

Xinlei Lee (3):
  dt-bindings: display: mediatek: dsi: Add compatible for MediaTek
    MT8188
  drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c
  drm/mediatek: dsi: Add dsi cmdq_ctl to send panel initial code

 .../display/mediatek/mediatek,dsi.yaml        |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 20 +++++++++++++++++++
 3 files changed, 23 insertions(+)

-- 
2.18.0


