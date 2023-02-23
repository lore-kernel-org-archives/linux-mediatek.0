Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414F8C636D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YLIxiEb1cilPuX9DuE8E0rsewYeVs5NMW4uGMqSO9Ws=; b=eF2BkemdaI8AXqkvsinp2Cz5ZN
	awcOMEFrIdm9Ymz4KjfupitzSP8Q8EI06zJpdxlAdrDVRAG0PWjeajF7b71K46Iib1b2/UKDEGUzt
	w6Di43aVqwXMdBP0hn+b+5ddZxuyLIe9tc5nLWWkfxIbfBYlfmRO3513ukO/rXFEZz8y+IqA2jSeU
	87kKDtiVWw1hzRxHQvFRjb7FjotBfkcilRIeQXcCxUwi6an7zC2oUhh5FeOf3BS5clnLUXzAJFBPD
	fNUZgnCbteCXFDEpvJ90IeZ41KRY0GyC7ialLAGkgozXxs7N6+vgd5cB363rSormkK8BXBSAYtwfi
	LUsLHtSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV6jK-00FTft-N1; Thu, 23 Feb 2023 08:13:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV6jG-00FTbh-7e; Thu, 23 Feb 2023 08:13:28 +0000
X-UUID: edafb586b35111edbbe3f76fe852e059-20230223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=YLIxiEb1cilPuX9DuE8E0rsewYeVs5NMW4uGMqSO9Ws=;
	b=TC5M2eFhr9Erunh+8rZLGQsPm/+TJCqIb83ZLfl6g4r6iAE9WS7gPRAJMt3WCm2XPWRvOMYG68tj/y4IUErDXhVfGXsGoPEhNYrHscHR3GUzxrdGMiT+ikDK6AzpaOCywFsf3GqHcdv18VkZaEUk+pvjzSLTbEiv6PYfvSa9IfE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:84a74ed6-40f2-432b-8fb1-e2750e6515ba,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:25b5999,CLOUDID:3487e6f3-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: edafb586b35111edbbe3f76fe852e059-20230223
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1630490368; Thu, 23 Feb 2023 01:13:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 23 Feb 2023 16:13:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 23 Feb 2023 16:13:14 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Tomasz Figa <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
	<maoguang.meng@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>
Subject: [V1,0/7] Fixes jpeg crash issue in cuj test
Date: Thu, 23 Feb 2023 16:13:05 +0800
Message-ID: <20230223081312.29296-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_001327_106411_57AA3159 
X-CRM114-Status: UNSURE (   9.31  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

This series is used to fix jpeg dec & enc crash in cuj test.
The problem was found frequently that executing CUJ
ui.EverydayMultiTaskingCUJ.*_ytmusic test cases on Tomato/Dojo
devices with the HW jpeg decoder enabled. Firstly the single core
and multi-core judgment methods were modified to make the driver
compatible with both cases. Secondly, the jpeg dec & enc worker
initialization method and the timing issue of remove buffer
were corrected, eliminating crash problems. Finally, some variables
and hw dev initialization methods are refactored to reduce code
redundancy and improve program robustness. 

This series has been tested with MT8195 & MT8188.
Jpeg encoding and decoding worked for these devices.

Patch 1 fixes single core and multi-core judgment methods.

Patch 2 optimized jpeg single core initial methods.

Patch 3 optimized sw flow of jpeg enc&dec worker to remove buffer.

Patch 4 reconstructs the initialization mode of worker.

Patch 5 Remove some unnecessary variables.

Patch 6 refactor some variables.

Patch 7 refactor hw dev initializaiton sw flow.

kyrie wu (7):
  media: mtk-jpeg: Fixes jpeghw multi-core judgement
  media: mtk-jpeg: add jpeg single core initial function
  media: mtk-jpeg: Fixes jpeg enc&dec worker sw flow
  media: mtk-jpeg: reconstructs the initialization mode of worker
  media: mtk-jpeg: Remove some unnecessary variables
  media: mtk-jpeg: refactor some variables
  media: mtk-jpeg: refactor hw dev initializaiton

 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 130 +++++++++++-------
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  28 ++--
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |  43 ++----
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  |  38 ++---
 4 files changed, 113 insertions(+), 126 deletions(-)

-- 
2.18.0


