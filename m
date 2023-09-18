Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB725C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EvHvDx283IzEltxctJnUdGAUV6tBQrKDH8gsbNSn6lc=; b=J84Ah/fVjuPIePvKwlOSLlonBt
	dbaf82zqMwoD8/x0uT/INAAiMa/Zoa7OXMj9z5sEsI4ZH6HiYcg6/oLrS74j45emWQHB4xjZJmg0U
	/2heyKrvKLf1rTdx8tbJzxubHkrNWVpqVnCXiCF0d9oqkPQ3sUP3Uv+B1RfHtlLQiGscr09RLkMur
	ZSN5VwTYGXSM2sWIkSBdZ2fy5+4zGlAcChSJurqxhsiWyZnenkInlVA77YdeA23QEcj/u+qOgWQ/w
	6mE2ptx5BJ2ZQLuRq8Ut22KwUoLtnfwJxC2CgBWQruf17K1TlZapsu5NIdQBuNzHRemdFAFBRwR62
	I6mTMtNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8Oq-00EdMK-1u;
	Mon, 18 Sep 2023 07:10:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8On-00EdL2-2Q;
	Mon, 18 Sep 2023 07:10:26 +0000
X-UUID: 6e69ea2855f211ee9b7791016c24628a-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EvHvDx283IzEltxctJnUdGAUV6tBQrKDH8gsbNSn6lc=;
	b=e85znPPWvUSG824KIqx9Rfct/oB7pqDRwB0WKHj1w5jVs1gTvtFwi7B81Sq0BgfQgZx+8vfuDfE0q/7uKRRWe48j7418isNxof40qHmNw70wJvrMk8fd5iD0had4IcK3k9ckz7vFJEAaDWL36EvrBhJNPqRp80WwxuYILPzyNBs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:35b4a804-86f0-4022-8ce9-1b75ba265e12,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:423426c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6e69ea2855f211ee9b7791016c24628a-20230918
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1817914205; Mon, 18 Sep 2023 00:10:21 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 15:10:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 15:10:13 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Sean Paul <seanpaul@chromium.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Hsiao Chien Sung" <shawn.sung@mediatek.com>
Subject: [PATCH 0/1] Fix errors when reporting rotation capability
Date: Mon, 18 Sep 2023 15:10:10 +0800
Message-ID: <20230918071011.18481-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.362900-8.000000
X-TMASE-MatchedRID: IJfQKf6xjE4u/MJ2EBezoZVIEKhlTKps68AA1e32M+y/Wj4uWP2JYWDm
	yyASSuxBNgD1nJIvf+9EzxsFM1euZkkjllSXrjtQFEUknJ/kEl5jFT88f69nG/oLR4+zsDTtjoc
	zmuoPCq0oityJbwQtJ2bQ1Q9x9TiCAJHWuhIuoo6i1r10f1kTMaRU1LSKs2VE
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.362900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 56304D84A71E4D1D993A7E86329D0A70691A36B724FB3A9C8B1D9F1A1D1ADA062000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_001025_792558_75FEE494 
X-CRM114-Status: UNSURE (   8.05  )
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

This bug is found when running IGT tests.

For CRTCs that doesn't support rotation should still return
DRM_MODE_ROTATE_0. Since both OVL and OVL adaptor on MTK chip
doesn't support rotation, return the capability of the
hardware accordingly.

Hsiao Chien Sung (1):
  drm/mediatek: Fix errors when reporting rotation capability

 drivers/gpu/drm/mediatek/mtk_disp_drv.h         | 1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         | 8 +-------
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 5 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c     | 1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c        | 2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

--
2.18.0


