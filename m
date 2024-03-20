Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0421DC54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 06:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nyuAhfLKdHPlumW7Kz0BvKW3+g1fkVdh9kODSqgPya4=; b=BwlKo1dyILk5tT5rVcmxXWuA4J
	/yfOi0sSzybhahlkciLUsJMdLT53edDYQkuclbzNSeX1iVrydaXnuLulZ7SyC8k4Tb6LHm4rfSvBg
	R3H7MAZQDyEgmq91TyNcBJUCxp+T45jrmx6VI653fjU3uyNDAOsKclkzKSVDo9la2Wru5DlOITJze
	USQS2bsGhHw2NeVhkX2FgtIo1FY+aYQfCJEnz7XnonfOTP5vXGpxofMRnVQJAKKtEOhZ1vrqZJzPZ
	uf/cbTT+E7cyI4v90esOKmVlMyPwBfdi+0+L0nqAcUFoXh18L0mmIyYihA1Rkv/7UATcmuVTMtmoJ
	gwlPRCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpdM-0000000Fj83-1eD2;
	Wed, 20 Mar 2024 06:41:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpdG-0000000Fj6J-05uK;
	Wed, 20 Mar 2024 06:41:04 +0000
X-UUID: ce7a5100e68411eeacdb61a41848c7d2-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nyuAhfLKdHPlumW7Kz0BvKW3+g1fkVdh9kODSqgPya4=;
	b=nMoxPTJUvD2QTpTMP4lMvLROO9oJLPJB00CeMGc8C+CwP0EzuCkPvDqilA+Kmez0PpoPHFmyNeDKt21XYv6sPdFJx4Xs5NorUl8a7gHPL+tNW+IHlhQwY6/5G0G5C3/LHUIwxDe9AyszyxMUCRHNPKitHVIg77jRaZHRXGWy6gk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:08efb7f3-43fb-459c-b650-d658c8d7fa11,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:f1463685-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: ce7a5100e68411eeacdb61a41848c7d2-20240319
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2071340106; Tue, 19 Mar 2024 23:40:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 14:40:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 14:40:54 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH 0/1] Add interface to allocate MediaTek GEM buffer
Date: Wed, 20 Mar 2024 14:40:42 +0800
Message-ID: <20240320064043.29780-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_234102_106042_B4245D5D 
X-CRM114-Status: UNSURE (   9.78  )
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Add an interface to allocate Mediatek GEM buffers, allow the IOCTLs
to be used by render nodes.
This patch also sets the RENDER driver feature.

This patch is:
- Based on 20240320024222.14234-1-shawn.sung@mediatek.com
- Reviewed on https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1955361

CK Hu (1):
  drm/mediatek: Add interface to allocate MediaTek GEM buffer.

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 ++++++-
 drivers/gpu/drm/mediatek/mtk_gem.c     | 40 ++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_gem.h     | 11 +++++
 include/uapi/drm/mediatek_drm.h        | 64 ++++++++++++++++++++++++++
 4 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/drm/mediatek_drm.h

--
2.18.0


