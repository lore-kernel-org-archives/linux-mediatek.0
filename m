Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZWanLaKAYjFGc0dsrGWNfTMucwcT5vJkHSpB7XG3y0w=; b=NMlAQtzqpzVNpT4WPij08UAFrT
	sjl2aBGzo7cuzHo5Y+emmnTwDBd5Dz31V9ixigiuM6gvYc/V73G4ihe/lo6q9tQNHEGzUDu78pD4C
	bweZxW8xo3La4K+S7kkBI7wgtA7IvRBJlOn4n2mwA+L8uPLCVez6xDbiPf6ZtGEamwayi7QFimr1a
	MqrE0mxRMyR5+jWAJbOCYNEaRSstFNxmE1t9XAgd98Es+bDWrsZ5nwjN5JyJxMyMeqPJ4myXrLd1X
	yaBnDPAxBsvwwPRwOXT4Y/zXfVffk0xvp9/VsydI2tQCyBdcLCFIEiXQVpJjatIoLI/lrJApCPUrn
	AUUJWHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE5Xr-002w6P-18; Wed, 20 Jul 2022 08:59:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE5XG-002vQw-8N; Wed, 20 Jul 2022 08:58:29 +0000
X-UUID: 8676378e5eba46c1aa20e008f7fbfa4d-20220720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:c4527383-81ce-4c52-80e4-7a243d561b3d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:34d3fbd7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 8676378e5eba46c1aa20e008f7fbfa4d-20220720
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1792033983; Wed, 20 Jul 2022 01:58:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 20 Jul 2022 16:57:35 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 20 Jul 2022 16:57:34 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Alexandre Courbot
	<acourbot@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, "Andrew-CT
 Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
	<longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Irui
 Wang" <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2, 0/6] support mt8188 h264 encoder
Date: Wed, 20 Jul 2022 16:57:25 +0800
Message-ID: <20220720085731.11011-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_015826_307895_C3776B35 
X-CRM114-Status: GOOD (  11.98  )
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

mt8188 encoder hardware has a change compared to the previous
chipsets, it supports 34-bit iova access. For 34-bit iova, the
encoder driver needs to write all 34 bits to hardware, otherwise
encoder will encode fail.

Patch 1 add the 34-bit iova supporting in driver.
Patch 2~3 add dt-bindings and driver compatible and private data.
Patch 4~6 some modification for in driver.

---
compare with v1:
 - split vpu_enc_encode function into 32bits and 34bits.
 - some review comments modification.
---

Irui Wang (6):
  media: mediatek: vcodec: Add encoder driver support for 34-bit iova
  dt-bindings: media: mediatek: vcodec: Add encoder dt-bindings for
    mt8188
  media: mediatek: vcodec: Add mt8188 encoder driver
  media: mediatek: vcodec: Remove encoder driver get IRQ resource
  media: mediatek: vcodec: Fix bitstream crop information error
  media: mediatek: vcodec: Use ctx vb2_queue mutex instead of device
    mutex

 .../media/mediatek,vcodec-encoder.yaml        |   1 +
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   6 +
 .../platform/mediatek/vcodec/mtk_vcodec_enc.c |  14 +-
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |  22 +-
 .../mediatek/vcodec/venc/venc_h264_if.c       | 200 +++++++++++++++---
 .../platform/mediatek/vcodec/venc_ipi_msg.h   |  24 +++
 .../platform/mediatek/vcodec/venc_vpu_if.c    |  76 ++++++-
 7 files changed, 291 insertions(+), 52 deletions(-)

-- 
2.18.0


