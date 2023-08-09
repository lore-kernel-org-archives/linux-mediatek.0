Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25064EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Aug 2023 13:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2sZQxcx0KmG2jwUfxyeIK+/P1Dx+ENWRtNYfhOBak7g=; b=SqbYUOCbC98Uh6Zp/p/m14Mp9f
	K9zsbXHN/VmpGG+sYD1v4gqSuFpugz+HPG1oE0tWMlXgkfwxkIVbiCq5yrl/EfkqVTp4pl486ePAD
	H/A7+d5Gap4z8R0YPAIWbtktMztTAHOwHtbfUOHeyo62rxUsHFbshUofcDopAMkNa4WeyLIXBUkOF
	34teOPB8HHxkzIN1pzteMXj+T/M3x/lyJxxAgwfFAUHzurFQFQZGtbO2LKtmC1e+W0l9aa0ydQr8e
	LAmDvFgn+mgDBbZqZjfJyBUGrsmuMbX9IPqvq8K/mkqCi8d+zekeBg6L0cdaW/H4zGhBLIZOWoD01
	ZvTj/F1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTiuW-004xsG-2w;
	Wed, 09 Aug 2023 13:07:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTiuT-004xrV-23;
	Wed, 09 Aug 2023 13:07:34 +0000
X-UUID: b00b407836b511ee83ed1395ce914268-20230809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2sZQxcx0KmG2jwUfxyeIK+/P1Dx+ENWRtNYfhOBak7g=;
	b=GshYwU0A1toA9mM5S9yem/GK7QVOJkQ7ZraC3HXb79piT5qvS9psVVxmj7KIZH7TJtt7NfFcwiITrhaLEZh7Qjqfih1ErD3Gi+8CK6j9DcziRAYRnyOjcoIJ5xiE8/iqJXDr9wuEaNch4sKEV6XTnsk9wPpkGV1Vy94Nw7D6ux8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:46a8a082-d477-47cd-83d7-12945fee35bd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:00f9231f-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b00b407836b511ee83ed1395ce914268-20230809
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 615930838; Wed, 09 Aug 2023 06:07:26 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Aug 2023 20:57:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Aug 2023 20:57:23 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
	<amergnat@baylibre.com>, Eugen Hristev <eugen.hristev@collabora.com>
CC: Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 0/2] Fix OVL iommu fault in cursor plane
Date: Wed, 9 Aug 2023 20:57:20 +0800
Message-ID: <20230809125722.24112-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_060733_679244_2C1B5877 
X-CRM114-Status: UNSURE (   9.00  )
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

Change in v5:
1. Rollback the entire series to v3.
2. Add more commit message inyo [PATCH v5 2/2].

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

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 3 +++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.18.0


