Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED7AC41513
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jun 2024 12:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4TsRg2oPuLZTyrFAWx6iQegBDteJk0cn8a+inIOYQzg=; b=uIPUlRI/dHAeWeDxvweYIz2Ctm
	Ef2cf10xfHr+oWDoob7tX5rKHKlR+QNnTJsJQqz+f153f/Xp6mRNDCjoKyaRYbgISncEaVb5pROjm
	FZZh87CCqGfiifjZcQhL7MS70UbbJDarfuaxVMMLRuB2e05kT/8Xzagwjv9IInR7YDHvjsoV05d85
	+zmc3MbqBa2Ep7p499w9NofUP9bNuKKZoOK63CYhGXSIiSp4fnZuAOCuyVFRrfZiheOElfZBLY+Q2
	2uabjSBWrVY6fSBLopW07CHnCshaNetNWZRLsy+zMIYIFIYD72qTRtdYlO5m9uRTg1sg2kHdbmlRU
	Nn5SKZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFumM-0000000HMzI-1eW2;
	Sat, 08 Jun 2024 12:02:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFumH-0000000HMxC-0rDo;
	Sat, 08 Jun 2024 12:02:34 +0000
X-UUID: f889d7f6258e11efaf04eb0598667787-20240608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4TsRg2oPuLZTyrFAWx6iQegBDteJk0cn8a+inIOYQzg=;
	b=kvo7Am+A19V7WJ9l1lO3hJiZ/0b6n/DYpx8KZuFKXyHfsQT1repz7pOG8jprZjGRUh/Gpd6cuRg4mCBnjvmHJ+uy3EkpPYvfXf03APXkPy7sYm4rllwcGtCE/150Q6S5/N6ymUeRjuPu8b2RjXI4YD8i4MGDrHcgfUs1o+vu+O0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:88322a75-d275-4fec-a251-35461a786718,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:1b7a5a44-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f889d7f6258e11efaf04eb0598667787-20240608
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <mac.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1248903530; Sat, 08 Jun 2024 05:02:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 8 Jun 2024 05:02:23 -0700
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 8 Jun 2024 20:02:22 +0800
From: mac.shen <mac.shen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <mac.shen@mediatek.com>, <shuijing.li@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/3] Add HDCP feature for DisplayPort
Date: Sat, 8 Jun 2024 20:01:03 +0800
Message-ID: <20240608120219.21817-1-mac.shen@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240608_050233_268112_93EE3596 
X-CRM114-Status: UNSURE (   8.13  )
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

Add tee client application, HDCP 1.x and 2.x authentication for DisplayPort
to support the HDCP feature.

mac.shen (3):
  Subject: [PATCH] drm/mediatek/dp: Add tee client application for HDCP
    feature
  Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x feature for DisplayPort
  Subject: [PATCH] drm/mediatek/dp: Add HDCP1.x feature for DisplayPort

 drivers/gpu/drm/mediatek/Makefile        |   7 +-
 drivers/gpu/drm/mediatek/mtk_dp.c        | 332 ++++++--
 drivers/gpu/drm/mediatek/mtk_dp.h        | 103 +++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c | 577 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h |  17 +
 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c  | 944 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h  |  25 +
 drivers/gpu/drm/mediatek/mtk_dp_reg.h    |  11 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c       |   3 +
 drivers/gpu/drm/mediatek/tci.h           | 143 ++++
 drivers/gpu/drm/mediatek/tlc_dp_hdcp.c   | 595 ++++++++++++++
 drivers/gpu/drm/mediatek/tlc_dp_hdcp.h   | 133 ++++
 12 files changed, 2805 insertions(+), 85 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h
 create mode 100644 drivers/gpu/drm/mediatek/tci.h
 create mode 100644 drivers/gpu/drm/mediatek/tlc_dp_hdcp.c
 create mode 100644 drivers/gpu/drm/mediatek/tlc_dp_hdcp.h

-- 
2.43.0


