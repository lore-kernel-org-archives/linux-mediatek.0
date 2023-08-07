Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C5FC001DE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 01:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pzA9l5K7eh0HXulmiYlwo14ZGlQyOEZHTmafUr72qbE=; b=AxYrXXs4XO/Rc+LAC94VEFqOcx
	SlttXpU0zXQ99C8aBQv9DOsPyt+BVxJFqoPEsGP1wDX2/3ZqPtU9h4M5TvYKIxMZ0GoOHA2wb5FO0
	n8Tw7R2iLac42XDS8f/vepbuP+DDNlXK6KlfNMeXVUIR5seqP/sb1j/K6r2QNFDgLHvh+aweqEmk9
	tedfB5mOAwAvHw7txb9EDufdAdD6apNEBW5EFQx0Es221vhVz1urFOFEP3ddyGbyebrKRarMEI8hV
	mGE4plMv/c2qi15oc0+KmDe83hEc+/saOXmfHPH9STTMx5SvoAUSk5Z8/swb1AU5zxQCz9zWuDjEL
	WQ4rIMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSpPe-00FzI8-0x;
	Mon, 07 Aug 2023 01:52:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSpPZ-00FzHB-3D;
	Mon, 07 Aug 2023 01:52:00 +0000
X-UUID: f906dc3a34c411ee912e1518a6540028-20230806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=pzA9l5K7eh0HXulmiYlwo14ZGlQyOEZHTmafUr72qbE=;
	b=HSynFcGEvuSMIOH0SpGxShg8xY3AlcnZnWGQnByDvCgqrcK8ZejK+F9T3raY2BSqjLY2nzsNT6AD9eXHY5QD2k1da3ehKlqKvEGCeYUOsmdpHesjDHxW/uBijXvcNs6NWHbcDcQsmj1hTQlcK0KSL9VmBw23M96XqUjONE6p9iI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:b7c83c65-e34d-410c-bab9-d99645ee0eb9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:b5d8bfd2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f906dc3a34c411ee912e1518a6540028-20230806
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1621918389; Sun, 06 Aug 2023 18:51:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Aug 2023 09:51:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Aug 2023 09:51:11 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH RESEND v4 0/2] Fix OVL iommu fault in cursor plane
Date: Mon, 7 Aug 2023 09:51:08 +0800
Message-ID: <20230807015110.30579-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_185158_037971_B95C61F8 
X-CRM114-Status: UNSURE (   6.20  )
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

Fix some IGT tests fail at iommu fault in OVL cursor plane.

Change in RESEND v4 :
1. Remove redundant plane_state assigning.

Change in v4:
1. Change disable all layer method to update mtk_plane_state stored
   in mtk_crtc by drm_atomic_state from mtk_drm_crtc_atomic_enable().

Change in v3:
1. Add Fixes tag before s.o.b.

Change in v2:
1. Add Fixes tag.

Jason-JH.Lin (2):
  drm/mediatek: Fix iommu fault by swapping FBs after updating plane
    state
  drm/mediatek: Fix iommu fault during crtc enabling

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 14 ++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 13 +++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 ++
 3 files changed, 21 insertions(+), 8 deletions(-)

-- 
2.18.0


