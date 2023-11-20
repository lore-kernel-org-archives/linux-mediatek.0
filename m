Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA5FC54FB9
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 07:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4qMzF3eb7VbcQOFcRLYWnPFhTSwClFhBuyXM/7gc30w=; b=Lw3JfjCRv+I2ZMKNV09R+r9EgG
	7oHNKSoaMoGdnBDsW/C2GwPGgJNsBl/3Lcd4TI1h40xG2fzRCHUlCTYI8EhuJ9htmcvH25rO+dUqe
	EeXAf3gBGWNwzADhJ6NxR46ncvkDRzxkPTQX9Q/5Qz26fRbx9ly6tWHtsWZ7tcOjBkxZLccgMMjFq
	xZixsR6BJnSo4ne6dy8n/VH8Q5cwOesa9RoM7Ki90xlBlUrfQmEdtQJA7ZodHUnGo6FF3+5KWuAys
	WJtjC3EWO/vffJO/O0xdo+J5oDyAIK3+DpQ26fL97jJCpKMqXSvHJ5z9PyYnzcnThPJo6apSkmSnN
	/3nQiBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4yTM-00BLye-0f;
	Mon, 20 Nov 2023 07:13:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4yTI-00BLwR-20;
	Mon, 20 Nov 2023 07:13:29 +0000
X-UUID: 4673ae6a877411ee86758d4a7c00f3a0-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4qMzF3eb7VbcQOFcRLYWnPFhTSwClFhBuyXM/7gc30w=;
	b=c3EbLhUC6NOGq2aQpj+wlSQnoccMBUX8EUpQ7lPQMklOX8C9mNvJTtKqRoIeoA5VvpPDhgf4sN3RqHkx9+IuoW1tJsd4SoqXbNIpiCB+oDTnHNtN67VSD1r/Mjbr8EVauqdf6N7Bz0b+48PxKIEvENQZEuYaBQNhvohYa2fMmI4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:b01d2b81-ad6e-49e6-aa67-c28a7f8b1f3a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:18d7b9fc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4673ae6a877411ee86758d4a7c00f3a0-20231120
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1227436890; Mon, 20 Nov 2023 00:13:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 15:12:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 15:12:48 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Paul <seanpaul@chromium.org>, CK Hu <ck.hu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Hsiao
 Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v3 0/1] Fix errors when reporting rotation capability
Date: Mon, 20 Nov 2023 15:12:45 +0800
Message-ID: <20231120071246.30823-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_231328_661319_B610D97E 
X-CRM114-Status: UNSURE (   9.72  )
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
DRM_MODE_ROTATE_0, otherwise the test will fail to restart.
Returns the hardware capabilities accordingly.

Changes in v3:
- Return 0 (not support) if rotation capabilities is not defined
  in the driver data.

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


