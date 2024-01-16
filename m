Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7914DC47077
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lRLsvt6AN8BxywW0Vx62uPuBT/N5koDEut1R2l7E42k=; b=K55Ohqy/syH136bJsWJIx96C8+
	RgEPR+ybNyzTQ5+PzVfiQF9rxPKydMrowhh0Lfhjdsoyz9iOCSB2PfGiZcf70JPAH8EGD4VtqPWFL
	WVTx/XHFtn9yw+4ZPMYa4ZO5VxZtOd2du2EJQTR/AKpeBCE0q1A/01IgSLse+wEXAD8tc0ef5bjFp
	7sEcp/TtbslgKGje+ibv6JgLshtSS6g1g84zRBAnmAy9e1sEzUxrY+aL2h6+wNgu6UBCuP0Lle5rg
	fq7MNxzOaHfUg9TV8RggXA0fYbNAVeFP3KsuLOX9JgHBlQ0uG0Vllvpe6e81p36nkOMLRvkwoaiVa
	FRdwzlvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPeaf-00BNi7-1Q;
	Tue, 16 Jan 2024 08:14:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPeac-00BNh2-1g;
	Tue, 16 Jan 2024 08:14:31 +0000
X-UUID: 41554aceb44711eeafd70d0b34820190-20240116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=lRLsvt6AN8BxywW0Vx62uPuBT/N5koDEut1R2l7E42k=;
	b=srv4G6D9zqpRYC4UQhr1ttQkoiaVrJPpgAmKe1cAn7wH76J5umoahk4nNfdfoUBCk+MfYD5fmFlf0PTrld6ko02DYEtkcZeCXtj+nAGVlMKjJD41nEBPGTiEF/DWfUwaOd1JX+D3wN984sAnKLMEC4pZREfckAHRc1XOxDx7tKM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:0d8abb32-6066-4638-ba35-b52fc262d617,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:5d391d7,CLOUDID:ed89667f-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 41554aceb44711eeafd70d0b34820190-20240116
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1036532826; Tue, 16 Jan 2024 01:14:22 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 16 Jan 2024 16:04:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 16 Jan 2024 16:04:19 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH 0/1] Filter modes according to hardware capability
Date: Tue, 16 Jan 2024 16:04:17 +0800
Message-ID: <20240116080418.28991-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_001430_567741_B70AB9D7 
X-CRM114-Status: UNSURE (   7.62  )
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

This series is based on mediatek-drm-next branch of
kernel/git/chunkuang.hu/linux.git

Hsiao Chien Sung (1):
  drm/mediatek: Filter modes according to hardware capability

 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  3 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  7 +++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 15 +++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 62 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  8 +++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  2 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       |  7 +++
 9 files changed, 107 insertions(+)

--
2.18.0


