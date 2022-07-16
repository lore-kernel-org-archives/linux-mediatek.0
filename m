Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A872BC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 10:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K/6V/OAiaGXovUiDVz3YGGIR0F1LzGl/Jb1jANpqmdk=; b=oAq/k2SUJjwd9AJApZvy77yD1G
	xkKIuvuTynj+nNSVV3O/RjSvKvSF+GhRB41te4rkAyXdUtGCgPwRnuCupnb9aML4FTAdXeR5JPVHl
	VUQqUnKzqM1otZ5D7LJW8CzQ6P0GMRk0KBuoDSUiOdekrIMXUCXpNwC0ugqZG15uDjVcekYy3KCs2
	vW+UEhodiYwGip8DcQDUVKXxr9QsPg149disVVbKel7MHRFsIGIW0k5XWPefTKhoOHETDwmjJzc4W
	C2p0Ik0b+ZgZFYGQXi7nL2XQnGcD8gnJtIuZTq+o0bMYRD9lL5yFv3OVo8latbuJ4iEQGThdzQZSo
	zTbKt/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCf28-00FN0l-Od; Sat, 16 Jul 2022 10:28:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCf25-00FMzk-FP; Sat, 16 Jul 2022 10:28:22 +0000
X-UUID: 67a2cbba2acc4e00b87c07c2901db07b-20220716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:b564a3a4-e8c1-4e5f-9cce-0d319d0dc0ee,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:f7f57464-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 67a2cbba2acc4e00b87c07c2901db07b-20220716
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1145677478; Sat, 16 Jul 2022 03:28:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sat, 16 Jul 2022 17:38:11 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sat, 16 Jul 2022 17:38:10 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
	<angelogioacchino.delregno@collabora.com>, Tiffany Lin
	<tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
CC: Yong Wu <yong.wu@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/5] support mt8188 h264 encoder
Date: Sat, 16 Jul 2022 17:38:03 +0800
Message-ID: <20220716093808.29894-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_032821_539972_2747D5C4 
X-CRM114-Status: GOOD (  10.44  )
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
Patch 4~5 fix some issues when encoding.

Irui Wang (5):
  media: mediatek: vcodec: Add encoder driver support for 34-bit iova
  dt-bindings: media: mediatek: vcodec: Add encoder dt-bindings for
    mt8188
  media: mediatek: vcodec: Add mt8188 encoder driver
  media: mediatek: vcodec: Fix bitstream crop information error
  media: mediatek: vcodec: Fix encoder multi-instance deadlock

 .../media/mediatek,vcodec-encoder.yaml        |   1 +
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   6 +
 .../platform/mediatek/vcodec/mtk_vcodec_enc.c |  14 +-
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |  22 +-
 .../mediatek/vcodec/venc/venc_h264_if.c       | 200 +++++++++++++++---
 .../platform/mediatek/vcodec/venc_ipi_msg.h   |  24 +++
 .../platform/mediatek/vcodec/venc_vpu_if.c    |  34 ++-
 7 files changed, 252 insertions(+), 49 deletions(-)

-- 
2.18.0


