Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140FDC6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 18:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JrNvGVQ5Igw0To7wS8WYbhsMfdOBx4yv/Lem1dTWqbU=; b=f9OHHDD8jBtrBImmhT8JKyxtuc
	bkdNstHHlYHvPVi8zMJc57PguXLJu3aWgYsbwO7N2CmCDFYAEtvwN/nbi2x50eTDDh/n5aED7ng1+
	W8EHCxiRlwqYdrMmBCnnTnG2B0twf6TYDGCCRLeJOtN17AuND7coXv+rE7pughVFGBXCbJ8BCxj0A
	m5E0wtZ39WKInPCOI8vEHwXAJpkpUuMDIv73S8MkCQiT14mquBF/NQV6kFntWIRE+SnJQAxwYozuU
	afCyvo+Ap+h8u6iPQ8vDZ4vzKyAcJLV0cGZ2maOVkTfvl4Z0W0bJN9Rk8Hz92LrDi7xjvYI+rbRDm
	XjCea2sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYXDY-00799D-5q; Wed, 14 Sep 2022 18:34:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYXD4-0078n0-4A; Wed, 14 Sep 2022 18:34:07 +0000
X-UUID: 3bb2d6b67faf4011877e894218703383-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JrNvGVQ5Igw0To7wS8WYbhsMfdOBx4yv/Lem1dTWqbU=;
	b=h9lLOQZLrh6e3CgNaVuoZmboKvsDljRz6XUBObg6wrEVeNZ5l1nJNcLJU9Ar2SUBpKT8Nyd1r9iD6GDgNG0o9f0/RKj5blp9grR2VrWuQo0EAp/I26MQzaf0NjVs8zX4qpzdmdkjA4KzkaC6eECAEJ7RPkjkgK9QSs/Ji47oo5g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:f3994cb1-8d48-4cc5-a156-abd0888bb556,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:6e0371ec-2856-4fce-b125-09d4c7ebe045,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3bb2d6b67faf4011877e894218703383-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 163436019; Wed, 14 Sep 2022 11:33:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 02:23:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 02:23:54 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH.Lin
	<jason-jh.lin@mediatek.com>
Subject: [PATCH 0/5] Change mmsys compatible for mt8195 mediatek-drm
Date: Thu, 15 Sep 2022 02:23:26 +0800
Message-ID: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_113406_204682_4837AE7A 
X-CRM114-Status: GOOD (  11.40  )
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

Jason-JH.Lin (5):
  dt-bindings: arm: mediatek: mmsys: change compatible for MT8195
  soc: mediatek: change compatible name for mt8195
  drm/mediatek: change compatible name for mt8195
  arm64: dts: change compatible of vdosys0 and vdosys1 for mt8195
  dt-bindings: arm: mediatek: mmsys: remove the unused compatible for
    mt8195

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   3 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 124 ++-------------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   6 -
 drivers/soc/mediatek/mtk-mmsys.c              | 141 +++---------------
 drivers/soc/mediatek/mtk-mmsys.h              |   6 -
 6 files changed, 36 insertions(+), 248 deletions(-)

-- 
2.18.0


