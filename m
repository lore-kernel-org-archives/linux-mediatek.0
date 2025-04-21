Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B78BC369D6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 13:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b3U5qKs7ZZQMPyNRE7SU8rjw10yJuWPqYkkMERYBa1o=; b=Ivyh01mOESS6XgCmZ+tIYPWhEZ
	1svnbJwFdLopIxng5RM/RO3dfa1nf0T32lgwfG2P+vOTDh4elvo/lHOxgtHiLIaRGyr/1BaJ6N1pm
	Ij9JAF9M3qfIRb5NWMlK8eX+l0SPgvD13wmH1UQxKuxgtaSiPrqe3bNMkasDv1k2EAsNVrts00Q0v
	H8M/m16fqAGwrjlBMv/xEzDnubqxURfXocYu4ng3rb8CBUAJwCyT4cq+4g/Rf1dEgaKrfo2nKwRoj
	jMbeBDMNrBgq7rNfjecmxZTpnOImk4OUzupAkgpuDi0+vHRwTbQgcGBmk4a+CCUejNg2VwIE8lF9R
	zbiTSpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6rS3-00000004Mpb-0fKT;
	Mon, 21 Apr 2025 13:44:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6rMT-00000004M1R-2unK;
	Mon, 21 Apr 2025 13:39:03 +0000
X-UUID: f866f8dc1eb511f0a2405d5ef59ce188-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=b3U5qKs7ZZQMPyNRE7SU8rjw10yJuWPqYkkMERYBa1o=;
	b=oWVEMLurbVeZpKmfgiDHS1bUhpYTF0vvBq0H044Wqpm6b+dWjTerpvKGlHr3pl+3wlNmIixHosYBVt2JN353I2mqMqUoEuutx0OolEr7q7mE71aWNB1qmS8KiVkwliDmYvSYXM3b8AJ/A5u0S3W1ENh9P21FkInqLVO9JtBnjTo=;
X-CID-CACHE: Type:Local,Time:202504210635-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e9dc9b44-3af7-4018-a8d4-428cb05d2ade,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:886354a6-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: f866f8dc1eb511f0a2405d5ef59ce188-20250421
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <sunny.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 810015299; Mon, 21 Apr 2025 06:38:55 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 21:38:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 21:38:52 +0800
From: Sunny Shen <sunny.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/5] Add components to support PQ in display path for MT8196
Date: Mon, 21 Apr 2025 21:38:27 +0800
Message-ID: <20250421133835.508863-1-sunny.shen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_063901_751814_50B3DFF1 
X-CRM114-Status: GOOD (  11.61  )
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Pin-yen Lin <treapking@chromium.org>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, "Paul
 Chen --cc=devicetree @ vger . kernel . org" <paul-pl.chen@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Sunny Shen <sunny.shen@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Due to the path mux design of the MT8196, the following components need to be configured to support Picture Quality (PQ) in the display path:CCORR0, CCORR1, DITHER0, GAMMA0, MDP_RSZ0, POSTMASK0, TDSHP0.

Change in v2:
- Update compatible name of mt8196-mdp-rsz.
- Update clocks and examples in mdp-rsz dt-bindings.
- Update subject of postmask dt-bindings.
- Remove DISP_REG_MDP_RSZ_EN.
- Add comment for MDP_RSZ size settings.

This patch series is based on [1]
[1] Add MediaTek SoC DRM support for MT8196
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=946188

Sunny Shen (5):
  dt-bindings: display: mediatek: mdp-rsz: Add rules for MT8196
  dt-bindings: display: mediatek: postmask: Add compatible string for
    MT8196
  soc: mediatek: Add components to support PQ in display path for MT8196
  drm/mediatek: Add MDP-RSZ component support for MT8196
  drm/mediatek: Change main display path to support PQ for MT8196

 .../display/mediatek/mediatek,mdp-rsz.yaml    | 45 ++++++++++++
 .../display/mediatek/mediatek,postmask.yaml   |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 24 +++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  9 +++
 drivers/soc/mediatek/mt8196-mmsys.h           | 70 ++++++++++++++++++-
 drivers/soc/mediatek/mtk-mutex.c              | 17 +++++
 include/linux/soc/mediatek/mtk-mmsys.h        |  5 ++
 8 files changed, 170 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz.yaml

-- 
2.45.2


