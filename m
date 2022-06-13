Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE78CCA47E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 06:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ak5vVWil2ccX3Vs8JXvNgqLos68YsSQckYkHuPBo0eo=; b=ZJg9xe3ZmmiyjI
	LL4RyAGEsoZcy8c8ACk/Sxm0adBqmd9pqBrk0ptFcumq3wY2d1kAuT0HVrEJa7IgNbZFWzGTMkl/2
	HRYAJaRIFOR+StxBBL5uxLv6x4a3zzwLjOhmRAqPEAO0/UXeSTPFyRgQ6q2Z5+Mh4kRWrmShHihNR
	yzWmm7vP0pX4TDsrUgplivtQxqn02eHACZtK1wcg3wE6iObufANsl6Of3v+ebeNcQaaB8vhPZIbeR
	RXjrOO4pWL1BRqk3Gu6MUmlp+1P54/cneNOzSh/ZVtMLjwv4JXQMS+qP84jWXOY+5vmbCCKAyzcq+
	Zp1ahp+HrA8I8eNDhGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0duv-001kFk-6I; Mon, 13 Jun 2022 06:51:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0duM-001jyg-8s; Mon, 13 Jun 2022 06:50:46 +0000
X-UUID: 82a44f2bfcb249cd812d9a0a5ca2a36e-20220612
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:add89d74-3dd2-4186-a2b4-6ec326c3d870,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:39845ac6-12ba-4305-bfdf-9aefbdc32516,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 82a44f2bfcb249cd812d9a0a5ca2a36e-20220612
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2086275980; Sun, 12 Jun 2022 23:50:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jun 2022 23:48:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 13 Jun 2022 14:48:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jun 2022 14:48:42 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v11 00/12] drm/mediatek: Add MT8195 dp_intf driver
Date: Mon, 13 Jun 2022 14:48:29 +0800
Message-ID: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_235042_426603_983E7101 
X-CRM114-Status: GOOD (  10.34  )
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

The dpi/dpintf driver and the added helper functions are required for
the DisplayPort driver to work.

This series is separated from [1] which is original from Guillaume.
The display port driver is [2].

Changes for v11:
1. Rename ck_cg to pll_gate.
2. Add some commit message to clarify the modification reason.
3. Fix some driver order and modify for reviewers' comments.

[1]:https://lore.kernel.org/all/20220523104758.29531-1-granquet@baylibre.com/
[2]:https://lore.kernel.org/all/20220610105522.13449-1-rex-bc.chen@mediatek.com/

Guillaume Ranquet (11):
  drm/mediatek: dpi: move dpi limits to SoC config
  drm/mediatek: dpi: implement a CK/DE pol toggle in SoC config
  drm/mediatek: dpi: implement a swap_input toggle in SoC config
  drm/mediatek: dpi: move dimension mask to SoC config
  drm/mediatek: dpi: move hvsize_mask to SoC config
  drm/mediatek: dpi: move swap_shift to SoC config
  drm/mediatek: dpi: move the yuv422_en_bit to SoC config
  drm/mediatek: dpi: move the csc_enable bit to SoC config
  drm/mediatek: dpi: Add dpintf support
  drm/mediatek: dpi: Only enable dpi after the bridge is enabled
  drm/mediatek: dpi: Add matrix_sel helper

Markus Schneider-Pargmann (1):
  dt-bindings: mediatek,dpi: Add DP_INTF compatible

 .../display/mediatek/mediatek,dpi.yaml        |  13 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            | 262 +++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |  16 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |   4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   3 +
 6 files changed, 251 insertions(+), 48 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
