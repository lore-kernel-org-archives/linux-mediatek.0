Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD52AC74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 02:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V6pw6mHYurwTel+yxSUMqLDElZJTvOlqL3tOX1KJUOo=; b=pK3pTj7AjA4di5tlRXP7+vSBSg
	cOzDrRAbP7Tm0AtDcBqGJEUjikqaJTAOqdv9iBMqzfDCY9JroZUjMAi6jWEajFwDB8QBfWzjpnFXz
	3kWzMmKJYGPC0smxWYZ1adq023ckASvqk7rPpgc4O6NHnerdC2GtTp1W0TpM3RCkLUB8cnqMpvKSx
	8geuMd7NUaPlsTWicYVviAQq15jHkkpCtqZDnFHTEiJCn9xGMA1JnRNuYQfYSM20njTYlTbW5tU9p
	ManT97S3fdhdl1Iur4X2pZXtBVj5H2dg2TvpB2/hHu6yIxsSku+xScz0nEQVmGYCNuxRRibtAMXhj
	GeOFFSrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWwz-003MAM-3A;
	Fri, 24 Mar 2023 02:14:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWwg-003M4Q-0C;
	Fri, 24 Mar 2023 02:14:23 +0000
X-UUID: 7bb17236c9e911edb7d8d11f642b8e78-20230323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=V6pw6mHYurwTel+yxSUMqLDElZJTvOlqL3tOX1KJUOo=;
	b=nE9RdJjd7LQ8AHoUfnaLK8NQvbQvkO4FpUXcZUFHydf7R3eg3lLtGAsVBRaCH46czWFE7vNeiBdMEby/A4hx7Y1Vab4w+vf2PLe4T23LnnP07r/szDcSh/WK6YKe2lj4wzUD5VP1P0IspFhj8kGglO6uvUrtTG/HWRQKdevnvZk=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.22,REQID:8a07285d-fedb-4aa6-a315-980f079a0050,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS6885AD,ACT
	ION:quarantine,TS:120
X-CID-INFO: VERSION:1.1.22,REQID:8a07285d-fedb-4aa6-a315-980f079a0050,IP:0,URL
	:25,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:120
X-CID-META: VersionHash:120426c,CLOUDID:865434b4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:230324101302H4DRW7KZ,BulkQuantity:4,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 7bb17236c9e911edb7d8d11f642b8e78-20230323
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 18215352; Thu, 23 Mar 2023 19:13:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 24 Mar 2023 10:12:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 24 Mar 2023 10:12:59 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v5 0/6] Add and update some driver nodes for MT8186 SoC
Date: Fri, 24 Mar 2023 10:12:52 +0800
Message-ID: <20230324021258.15863-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_191422_102628_CC1D5B99 
X-CRM114-Status: GOOD (  10.19  )
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

This series is based on linux for-next.

Changes since v4:
 - compress the compatible strings for display nodes

Changes since v3:
 - Add index for ovl in aliases

Changes since v2:
 - Remove some unnecessary linebreaks for some nodes
 - Use one line for some properties
 - Drop "Fix the fallback for mediatek, mt8186-disp-ccorr" patch
   (since this is applied in chunkuang.hu/linux.git/log/?h=mediatek-drm-next)
 - Separate GCE into another patch
 - Drop some patches which are appied in matthias github

Changes since v1:
 - Remove the unnecessary trailing number
 - Add aliases for ovl* and rdma*

Allen-KH Cheng (6):
  arm64: dts: mediatek: mt8186: Add MTU3 nodes
  dt-bindings: spmi: spmi-mtk-pmif: Document mediatek,mt8195-spmi as
    fallback of mediatek,mt8186-spmi
  arm64: dts: mediatek: mt8186: Add SPMI node
  arm64: dts: mediatek: mt8186: Add ADSP node
  arm64: dts: mediatek: mt8186: Add GCE node
  arm64: dts: mediatek: mt8186: Add display nodes

 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      |  11 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 225 ++++++++++++++++++
 2 files changed, 233 insertions(+), 3 deletions(-)

-- 
2.18.0


