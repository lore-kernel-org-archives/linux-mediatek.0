Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79214C004D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uWVRgR/ln+/38QVR0gXqYzqLESpxkY2yEXnYWdBeJ4A=; b=pM373w5EHJDtAvurrUjZuZaXtT
	GbJRJo8ukucd4BDUIZvtLrmZoN5YGJDuJIX3Ifia2QRW5BFehs274w8uIYzOhYOs3UUynTc597OB3
	7ZYX3tFhb7QaSnOcICjqVMHrbCMB3COR48A3mJMfaajEJBIhb84A9AbZxcjfXCRPok5L5lxq5ysBN
	V8UkCpQ1AxzwUF9A0Jf064WqGgTuajINF2a2x+hJAYPi0SDDReFeDxl/3zV41hguBEu3mOAhri9v6
	rJwfE1HBPok5MACHo0TOMx0p7CiRaJu/AK/O4NmzXKMlQLNFiLJinUX+zgY6+VwN9X12wc9HcVqmS
	eAzg3YhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4b9-0003KV-A8; Wed, 18 Jan 2023 09:19:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4af-00033z-IV; Wed, 18 Jan 2023 09:18:42 +0000
X-UUID: 13b9fd52971111eda08d4d6090ec5a5c-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=uWVRgR/ln+/38QVR0gXqYzqLESpxkY2yEXnYWdBeJ4A=;
	b=sOnXAnoVHKQl6QPF4kN20ZgBH5YEhb3sJ4G3bY7qkP9dg/X3DsRcbts+qKZ2rOLse1OEGuHqyivZo8JMmw1jkelmD1qb5EvTvxEqbU21VdDuX+U4/zO43ga833w7ZwsXmb5ledYDLAhf7MyH1d5swmvV28lopyJIEXyJPXxhC80=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:d47277ef-6f60-4f72-8227-26f6c9bc330f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:194b0055-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 13b9fd52971111eda08d4d6090ec5a5c-20230118
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 148967331; Wed, 18 Jan 2023 02:18:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 17:18:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 17:18:30 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 0/9] Add and update some driver nodes for MT8186 SoC
Date: Wed, 18 Jan 2023 17:18:20 +0800
Message-ID: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_011841_628077_831143C9 
X-CRM114-Status: GOOD (  11.18  )
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

This series is based on matthias github, for-next.

Changes since v1:
 - Remove the unnecessary trailing number
 - Add aliases for ovl* and rdma*

Allen-KH Cheng (9):
  arm64: dts: mediatek: mt8186: Add MTU3 nodes
  dt-bindings: spmi: spmi-mtk-pmif: Document mediatek,mt8195-spmi as
    fallback of mediatek,mt8186-spmi
  arm64: dts: mediatek: mt8186: Add SPMI node
  arm64: dts: mediatek: mt8186: Add ADSP mailbox nodes
  arm64: dts: mediatek: mt8186: Add ADSP node
  arm64: dts: mediatek: mt8186: Add audio controller node
  arm64: dts: mediatek: mt8186: Add DPI node
  dt-bindings: display: mediatek: Fix the fallback for
    mediatek,mt8186-disp-ccorr
  arm64: dts: mediatek: mt8186: Add display nodes

 .../display/mediatek/mediatek,ccorr.yaml      |   2 +-
 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      |  11 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 342 ++++++++++++++++++
 3 files changed, 351 insertions(+), 4 deletions(-)

-- 
2.18.0


