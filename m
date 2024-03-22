Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6885DC54E71
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 05:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5ymA2znfep2YAZ2eNvYHhwfhSc9SpWJueCtuXge37k=; b=BcHP7+8W4SdGs7uhrODnHOhv/B
	g2jx5ukjkdiI4r3hdIMgKVZnJffT+buEjPcbcODu7HW7JczS9+G2+xhWuTE/YgT8YCoKm8Gc8/y7J
	SFa8asssZIBDuBtuJREDF9tuOQVR6oBLKJuKn2AH7iwtp0F8WsCMNngmCPRQWxvl/IewAoJ0d2wAc
	Vx+IdmR54EP9byjA9hxnb/O8s6+h0yw3OyFk3AUlzy0TSjLmgGTaOBgl8keQk1KUZMEIweWrtGH+/
	XcVhC1Ko4+KrXlJ4uepWhXyKQsSBYL2UsilKjZ0CFzsbct6ZtnwB4EhQYm41wIzEgb56xe+TNrulc
	2PK0N4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnXUj-00000005s8a-397D;
	Fri, 22 Mar 2024 05:31:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnXSs-00000005qqd-2PxP;
	Fri, 22 Mar 2024 05:29:16 +0000
X-UUID: 1ba10756e80d11ee9aa9374d6d45775a-20240321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=w5ymA2znfep2YAZ2eNvYHhwfhSc9SpWJueCtuXge37k=;
	b=bj6tsQAY3Kg4Q+fqz+V6vnw+M+QnkTWmq9xUnlV749Ojp8Os+BQba10YzHLGw+FVBt/RBHPZ/N5fBg7EgdW06Fsv7l+i9Xq3fbo6fLsvQVRdPkpeh1LdQAVRsGdeRIW76AQsPgecjZ69oIY6t8mn1aHphUSLshvz2PRWEnFwxmc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:643c8719-172f-46c7-b456-99c70da57830,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:2e57cc81-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1ba10756e80d11ee9aa9374d6d45775a-20240321
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1531488470; Thu, 21 Mar 2024 22:29:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 13:28:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 13:28:31 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 10/14] drm/mediatek: Support "None" alpha blending in OVL
Date: Fri, 22 Mar 2024 13:28:25 +0800
Message-ID: <20240322052829.9893-11-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322052829.9893-1-shawn.sung@mediatek.com>
References: <20240322052829.9893-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.878300-8.000000
X-TMASE-MatchedRID: gZQz39yqSjep2D+ysBQGebxygpRxo4693KXiaLjnK32vloAnGr4qhglh
	29MaPxbmZKE0ERpSKdRmWak1/EAxtFm72EsAF82QA9lly13c/gEK3n1SHen81eO53bHtM9W3+4D
	ayMhOhsnrDONdwADMfYAy6p60ZV62fJ5/bZ6npdg7AFczfjr/7J1YdJW5/P/fXo1DISzMEK0OxV
	ov9nycuK5NltfQgBA2ciaYNfAQH9w=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.878300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: ECAD17759913EC481D3141436FB6CB17E6B84EA59B8BF68E46CF4B2C7D0331272000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_222914_702138_BD46FE7D 
X-CRM114-Status: UNSURE (   9.85  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy .
 Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Hsiao Chien Sung <shawn.sung@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Support "None" blend mode on MediaTek's chips.

Please refer to the description of the commit
"drm/mediatek: Support alpha blending in display driver"
for more information.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index b1e5d453316cc..a936f338ab79d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -484,7 +484,8 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		con |= state->base.alpha & OVL_CON_ALPHA;
 	}
 
-	if (state->base.fb && !state->base.fb->format->has_alpha)
+	if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
+	    (state->base.fb && !state->base.fb->format->has_alpha))
 		ignore_pixel_alpha = OVL_CONST_BLEND;
 
 	if (pending->rotation & DRM_MODE_REFLECT_Y) {
-- 
2.18.0


