Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB77C001DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Aug 2023 14:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IP+acsE3RHl4zI7GdXWUg/GZYhDWt6M5CSaQkqn6B+4=; b=N6VSDcCcIoTry+y4hI6WMmvzx+
	xmefyuO8AF7Q70+ufPGqdY3yIzNk/n1fH58AuChj6PYuJylSdZgwc5iCmSb0IqLTSQxOVlvKTWesY
	C6SluEvvNcklRPb//1AbqJMMGQmsyaDwvhz4P1XvCajKdYVPSuSIOYFEliV22+0Vy39yfu+5GW6/l
	Wepu9xjdpzD/sDvq+GkdWG+yXGBmDC95pUgigs4LHtU6f+mfyQ9xpEFB1uYuXvqXFY5lklTyH897H
	ab9rpBphmCewpawRyw/DtSjumqa3rnDlLrNRu05H8BkiXZk+jvD1ABqVLA4NWkszWppz9Jhqm+EA9
	uoExgIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSHwy-00EDP0-01;
	Sat, 05 Aug 2023 14:08:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSHwu-00EDNp-0x;
	Sat, 05 Aug 2023 14:08:09 +0000
X-UUID: 7d272b1e339911ee912e1518a6540028-20230805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IP+acsE3RHl4zI7GdXWUg/GZYhDWt6M5CSaQkqn6B+4=;
	b=D3P3CXVnDQU/ZYEbR82mfhySusExeirOcVZcZ2HFr2COT7mVlNr3OaMKIe9QMsIPEZyy+b0feEXEv4zenUEZwCtwf846amZ5hQrr6VGF7o6w/4d4Ijjr0Jqibxil/xYZBac+oUshSvKzexdTOPDcKw2rGUY4vTjBvbxBZ4MA4VQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:777e206d-147d-4462-94c2-b5691f552b1f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:2d88eba0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7d272b1e339911ee912e1518a6540028-20230805
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1877971124; Sat, 05 Aug 2023 07:08:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 5 Aug 2023 21:57:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 5 Aug 2023 21:57:59 +0800
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
Subject: [PATCH v4 0/2] Fix OVL iommu fault in cursor plane
Date: Sat, 5 Aug 2023 21:57:55 +0800
Message-ID: <20230805135757.6625-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_070808_362825_C0AB9543 
X-CRM114-Status: UNSURE (   6.76  )
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

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 15 +++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 13 +++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 ++
 3 files changed, 22 insertions(+), 8 deletions(-)

-- 
2.18.0


