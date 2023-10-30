Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2040DC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6f5of367GWFLTMNgQF+A8V5kJhe5SrZ87ZPUpmvkcm4=; b=ZW9C3Ffx6TKJzMSlCabQmz+CrH
	CaypiSsXwiCoxsMEKcdvvbP2KKc2OmacqhgabxxnLQqQN0pVAkfw6mYTPrnSMv7W0RmB4j42/pfsD
	hOUs7BijAHWUXQ2SL8ixgAna5atBc+aUCUzc2MPPX7Ie5d6EGlRrLA1nKMGhxHb4nZyu69wEIKwts
	8hWP0C8jXphVb7+dDiH7Na9rnsy8DlBpgWdUSTkOSgvlfson5BNutqH9wZaf2LgLeEaJ0eljm0HEV
	sjl/6TxG355RpATbD63h7K442Z3O5dw+rh5gxQ6lWYpwoaxy335ZBCSRISjLLYSor58iz+wauta8Y
	JX0bnnHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxOLM-002tNa-0J;
	Mon, 30 Oct 2023 09:13:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxOLI-002tN5-2a;
	Mon, 30 Oct 2023 09:13:53 +0000
X-UUID: a20554ca770411ee86758d4a7c00f3a0-20231030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6f5of367GWFLTMNgQF+A8V5kJhe5SrZ87ZPUpmvkcm4=;
	b=RsZzb4P8TIXw9wjF4L+TqwND1uWH66kDGK7oQQXtOrYMfKp6qrllPeqs9Ty22CVrgfTE3Mvh5f2Yg42n+vG8bZX9OrKQNBTbP/UV4Y6aeLJpTIhmPB0pgQOTpGV0Ksq3eLdkHVxkL7HtK7zoqCQiAWQs3B6EaKPjEfAUhXgzAUk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:9d16027d-bdec-454c-9eb9-06dc2e6a5705,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:63b60d72-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a20554ca770411ee86758d4a7c00f3a0-20231030
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1542860688; Mon, 30 Oct 2023 02:13:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Oct 2023 17:03:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Oct 2023 17:03:13 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Sean Paul <seanpaul@chromium.org>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v2 0/1] Fix errors when reporting rotation capability
Date: Mon, 30 Oct 2023 17:03:11 +0800
Message-ID: <20231030090312.7758-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.989100-8.000000
X-TMASE-MatchedRID: Z2f9DQPf1tku/MJ2EBezoZVIEKhlTKps68AA1e32M+y7qpOHKudqc+OY
	+B3JL0OU6KyPWSN6DMyYGDWKq7IbHADNPxu11HXjH5YQyOg71ZZ9LQinZ4QefCP/VFuTOXUT3n8
	eBZjGmUzkwjHXXC/4IzsAVzN+Ov/sgmQ6bcMFV02WqAkkYaOobDqacQoxuIGZh+3MYihDJQAATk
	WR47xRfQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.989100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B4943EC94F410E4ACB98F994AA7D9F27E0FFEE3BB02E92E35E4B3854B250ED0A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_021352_868004_642CB7FB 
X-CRM114-Status: UNSURE (   8.54  )
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

This commit is based on 20231024130048.14749-1-shawn.sung@mediatek.com.

This bug is found when running IGT tests.
For CRTCs that doesn't support rotation should still return
DRM_MODE_ROTATE_0. Returns the hardware capabilities accordingly.

Changes in v2:
- Restore DRM_MODE_ROTATE_180 (reflect x + reflect y = rotate 180)
- Define supported rotations in the driver data

Hsiao Chien Sung (1):
  drm/mediatek: Fix errors when reporting rotation capability

 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 30 ++++++++++---------
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  5 ++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |  2 +-
 5 files changed, 24 insertions(+), 15 deletions(-)

--
2.39.2


