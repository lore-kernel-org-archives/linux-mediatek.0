Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924D4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 09:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I0M5XEe5stVRnukpyyFX3IhI3XJBoOZlfKFNwX5FMVU=; b=Kb8VAqSIJcXQvzBexTc9PAF5pD
	+Lqcb4nwTMTbIiU8ZvUMqtJ7GnRtmWxkmpXXoAaU9k3sJCf62isGsR38gLzutQBN7lozb3eipp8aC
	4eZFeayN0llswh52QXPmZQlVlki+e3hr/3Seqi+AeMNyWTq5MUHoAzKbDkdsbHXZqnsNeaZumT+m+
	D9oV8IRgWd+wOabGlbtf2+FJo9WbQ9r/clBBuTFS6/lVVyBi0kO3hSBlpih47NQtmGrKaJKUchyVV
	tXKm/WeuabvoEaCDbSNCsjzAlhpMQlSlvT7hngFA5nivd0sn1asNsza+z3gu2gN9RZEchoWxtT2QU
	+sMYk//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Cv9-003r2u-Sz; Fri, 01 Jul 2022 09:26:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Cv5-003r1r-NR; Fri, 01 Jul 2022 09:26:38 +0000
X-UUID: ca15e519b04f49d2ab0eea5017f4352e-20220701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:7d1b8987-5983-4384-af0c-ef6e72393982,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:87442a2,CLOUDID:a18a5ad6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ca15e519b04f49d2ab0eea5017f4352e-20220701
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1362027080; Fri, 01 Jul 2022 02:26:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 1 Jul 2022 17:05:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 1 Jul 2022 17:05:47 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@canonical.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 0/6] Complete driver nodes for MT8192 SoC
Date: Fri, 1 Jul 2022 17:05:41 +0800
Message-ID: <20220701090547.21429-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_022635_806745_CD1B64D5 
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

This series are based on matthias.bgg/linux.git, for-next

Also should reference below PATCH for dsi in chunkuang.hu/linux.git
dt-bindings: display: mediatek: dsi: Convert dsi_dtbinding to .yaml

changes since v1:
 - add Reviewed-by Tag
 - rename dsi-phy from dsi-dphy
 - add missing power-domains in disp mutex
 - Add remove mt8192 display rdma compatible PATCH in series
 - use "mediatek,mt8183-disp-rdma" as fallback
 - remove mediatek,larb from rdma node
 - remove syscon-dsi and add power-domains in dsi
 - add reset property in dsi and mt8192-resets.h
 - correct Typo: s/ndoe/node in commit message

Allen-KH Cheng (6):
  drm/mediatek: Remove mt8192 display rdma compatible
  arm64: dts: mt8192: Add pwm node
  arm64: dts: mt8192: Add mipi_tx node
  arm64: dts: mt8192: Add display nodes
  arm64: dts: mt8192: Add dsi node
  arm64: dts: mt8192: Add vcodec lat and core nodes

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 238 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c |   6 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   |   2 -
 3 files changed, 238 insertions(+), 8 deletions(-)

-- 
2.18.0


