Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B32FEB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 09:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hd+qR6EgB43KGhIOQ08edgDR0ynE4J+l6er9qSfi/Xw=; b=o+vZstKxdJ102VSr6XF3GtzcyU
	kvjH3FkG/oXRV47OxZ6eIsEXwqQDDMmwxd2mFYjn2mJ4WPkOCLNavxGG4VpYlRdGdYanD/5Z8J19U
	xJnchM42OunSTviFF3nN++wKO497A7FP7OasaHaNnOu2zq7u5iBg5SX45AV55bThMjK1PFHWyJWlY
	jo1prF9BNxBZQZ/yqDA032+oKmSg4ItUT3FzuOEtBvKKvlEzZVYBZs5sTdIM3phuFX450/6mC6xEv
	mnx5cMwRAyGOpHsPR1Lr+3dVjso6vTGb48JmQ9KesbJlGYI/2wyNdg04Lew0LU1SEN77/ZtXvucny
	iC3hL1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInGw-00B1l2-33;
	Mon, 10 Jul 2023 09:33:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInGt-00B1is-1d;
	Mon, 10 Jul 2023 09:33:32 +0000
X-UUID: d2d9aee61f0411ee912e1518a6540028-20230710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hd+qR6EgB43KGhIOQ08edgDR0ynE4J+l6er9qSfi/Xw=;
	b=j/lCS44+m7syZwz3TufyPgAuyhr4UL2sGSE5RNcb0Qn/d2BYVm5FVAeqvFa5EQXccvmb4RrHPlKZHgmm+rYa+FbmV3Ga8nXREqzfbyGRzzp72eVH2RbwWMPA7U8z80vwTavMbFkCnyjjU3jOlKIZaCUzEkMQy4YAY+tbgGe/FTQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:d2806bf4-5e48-4c38-b439-33d217c32220,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.28,REQID:d2806bf4-5e48-4c38-b439-33d217c32220,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:176cd25,CLOUDID:24d50e68-314d-4083-81b6-6a74159151eb,B
	ulkID:230710002645KQ5H3ME6,BulkQuantity:8,Recheck:0,SF:29|28|17|19|48|38,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:41,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,
	TF_CID_SPAM_SDM
X-UUID: d2d9aee61f0411ee912e1518a6540028-20230710
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2087297362; Mon, 10 Jul 2023 02:33:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 10 Jul 2023 17:32:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 10 Jul 2023 17:32:54 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 0/2] Fix OVL iommu fault in cursor plane
Date: Mon, 10 Jul 2023 17:32:51 +0800
Message-ID: <20230710093253.32224-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_023331_561434_8D1CA2C4 
X-CRM114-Status: UNSURE (   7.67  )
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

Jason-JH.Lin (2):
  drm/mediatek: Fix iommu fault by swapping FBs after updating plane
    state
  drm/mediatek: Fix iommu fault during crtc enabling

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 3 +++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.18.0


