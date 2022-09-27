Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE841C6FA83
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6/sQLw9MHSTRDW30VdgFzJ2Vu/oHj4Ys0yiq36Wd2c4=; b=iTt29Qrk79urCP9jHhu5LaFiAh
	vwnQHzJT4flvFNqHtzBVFIEiEODmVDCJUchLV0uDYBbUf3R7O7EH/4nAP8CVoMAS3DZ4BoEuVQS3A
	eC/OcaeR0V0DvwfOszLqtVWaxF0Uo7NyAAad1fAYuxzwbj1vmkJRm6GW+fC1wAHLQcaa5kEnFIe/w
	QPxSr8/+h/COtGJxJGX0EgFIvHOBFUxbXLm+4RPChbUKlc4LhUYwMa2Q/Otup8K2+Cu3q+5cZExEI
	hP+0m9V/YxIiOoKZtxUu4eBIciIVJ9gPgGmPtGvZtNNQVMQLuFiSDU0GGns0tMDz4iDw8CveK23Iq
	snKu9mcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odCWs-00BSNF-DH; Tue, 27 Sep 2022 15:29:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odCWX-00BSIo-5o; Tue, 27 Sep 2022 15:29:30 +0000
X-UUID: 382adf7a58e7489e83f3e87707b573b2-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6/sQLw9MHSTRDW30VdgFzJ2Vu/oHj4Ys0yiq36Wd2c4=;
	b=JQbAdAByDg1NoGqkrtaSCMdH3+tCYJRAe5R0/hvDd6p4P8tTHNWhKBxnmWj1ZQi3FbfK3WwefC9cGfkbnRCUdZu1aYxibHyB7uqn7WKFetVW5XiHuYmGGkEEtheHwemY1RmZyWhF6X8BPxP7klWRQSnFGVyDN8NLdiWsoxn6gbo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:d2d021ae-699d-4268-8f5b-e34cc6209fbe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.11,REQID:d2d021ae-699d-4268-8f5b-e34cc6209fbe,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:39a5ff1,CLOUDID:8a6c40a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:220927232905447O557B,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 382adf7a58e7489e83f3e87707b573b2-20220927
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1141437345; Tue, 27 Sep 2022 08:29:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 23:28:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Sep 2022 23:28:46 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH.Lin
	<jason-jh.lin@mediatek.com>
Subject: [PATCH v5 0/6] Change mmsys compatible for mt8195 mediatek-drm
Date: Tue, 27 Sep 2022 23:26:58 +0800
Message-ID: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_082929_227256_06451104 
X-CRM114-Status: GOOD (  12.83  )
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

For previous MediaTek SoCs, such as MT8173, there are 2 display HW
pipelines binding to 1 mmsys with the same power domain, the same
clock driver and the same mediatek-drm driver.

For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
2 different power domains, different clock drivers and different
mediatek-drm drivers.

Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
and they makes VDOSYS0 supports PQ function while they are not
including in VDOSYS1.

Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
component). It makes VDOSYS1 supports the HDR function while it's not
including in VDOSYS0.

To summarize0:
Only VDOSYS0 can support PQ adjustment.
Only VDOSYS1 can support HDR adjustment.

Therefore, we need to separate these two different mmsys hardwares to
2 different compatibles for MT8195.
---
Change in v5:
1. Add oneOf item to deprecate mediatek,mt8195-mmsys.

Change in v4:
1. Deprecate original mediatek,mt8195-mmsys at the first item.

Change in v3:
1. Keep the original compatible "mediatek,mt8195-mmsys" and add
   "mediatek,mt8195-vdosys0" into the same item to make the tree
   fallback compatible.

Change in v2:
1. Remove Ack tag in the first patch
2. Change the compatible name changing patch to one revert patch and
   one add vdosys0 support patch.
---
Jason-JH.Lin (6):
  dt-bindings: arm: mediatek: mmsys: change compatible for MT8195
  Revert "soc: mediatek: add mtk-mmsys support for mt8195 vdosys0"
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
  Revert "drm/mediatek: Add mediatek-drm of vdosys0 support for mt8195"
  drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
  soc: mediatek: remove DDP_DOMPONENT_DITHER from enum

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  14 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 128 ++--------------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   6 -
 drivers/soc/mediatek/mtk-mmsys.c              | 145 ++----------------
 drivers/soc/mediatek/mtk-mmsys.h              |   6 -
 include/linux/soc/mediatek/mtk-mmsys.h        |   3 +-
 7 files changed, 46 insertions(+), 262 deletions(-)

-- 
2.18.0


