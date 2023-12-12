Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D09C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 12:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ySY1u/YNaA7jfhX55xp0CtWVrzD0erxT1NWG3Ec/Vo=; b=opt7pZpgfnEENNJ2SNif1PvHFS
	2pk1Ysa2UN6+WJbsZ+C4kqcA+ufcmFU1axXmIw9fBk86aeTR3RCPXHMaj2OZQNosLoclrpx8KO3aq
	ei0rNfxN64yML+XEDMO7KJ5glaeeIam2Xo90GoYWX8s/ueyNpxVpVkOBtgG9plIMO0ABV/Rdb6g2X
	4A8YQCIo8lXHaw0CLZ9KTZWsDmUBI0jdLtWE3bGUUaBmxSkz9lwqm3dVa2E2ZebYHk+OzaZYVpzCR
	/jW0TeSgvvkQj1JceEJBVgCNS4MkvSsRU7s2zw4sTfI63AQhDFlhZRV5tLL+HgbdkNAZSAdxpvaMI
	CLI+TiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1l5-00BeBV-0e;
	Tue, 12 Dec 2023 12:21:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1l2-00Be8g-28
	for linux-mediatek@bombadil.infradead.org;
	Tue, 12 Dec 2023 12:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6ySY1u/YNaA7jfhX55xp0CtWVrzD0erxT1NWG3Ec/Vo=; b=pRfXGdrhHEtnwJUFpMP4MP/Foo
	7V038PmEM+VCXhUwbM9GstKqRnm5ZkULaSuoFio1YF1+VeToIYr+2hdKEZvyC/HtkPfYc7EVk7wNl
	eisHkJbQ5skP/dFGi5VGNz3gnLRlnRvJUJIZY5QByOk/WI429Ta9i09PY9KLX1Vz5DuJw04OCnBtn
	fwHewg5g24KSCcgTOzAGiKz7zWjH45F1IOeOcSl4una7pYobg5J8LxTRIL/+8lIE7ROE4s88RlDOn
	v784MBtnjcRh+hPJvmi8oTjTPWwhSH5+Ex5OEOkJ1r3fqFMYTs+cKZpQX2V5YJ1TBg7rxOMn7cJub
	zwn+3SrQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1kx-008WpU-21
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 12:21:03 +0000
X-UUID: dcbff18c98e811ee9b09ad09c76753c8-20231212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6ySY1u/YNaA7jfhX55xp0CtWVrzD0erxT1NWG3Ec/Vo=;
	b=OIEbJsAG8If+T82xYPUBlgMMcstui73Dbqn9SEvN+8rRZU2HYibvLcB9rpFBInAlveVG1WxEJpeIZnfkUukI8pPT193NurNO4/lgd9Z2HKZuF7gO1V3cOkBmQlu49oQ/0H6jKcWBiqCJEatLbKxWiqaEg9qJOlyay3u7YAsu9bQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:3c4beb8b-1efb-46fc-984b-19495fd30fb0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:6e3c1c61-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dcbff18c98e811ee9b09ad09c76753c8-20231212
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1484748824; Tue, 12 Dec 2023 05:20:39 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 20:20:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 20:20:01 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v4 08/17] drm/mediatek: Support alpha blending in display driver
Date: Tue, 12 Dec 2023 20:19:48 +0800
Message-ID: <20231212121957.19231-9-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231212121957.19231-1-shawn.sung@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.676900-8.000000
X-TMASE-MatchedRID: uP1aVdOuidn2fv0LTPfvM6MVgdN9w+TCG9Itfzsy8/Xvnm3ZesFzgvKC
	81FnsF5IrUhQzMxACbp+6n5OByhL/9S/P7msP4phXP5rFAucBUF9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO31Kzk40dEY9ZuHU9bZjqh9ETalZivxO7S1Qc3P+ghxGHPWA7TjQr4H
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.676900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 430A300697861B49F3FF941E41A8CF8D528CC0377473359CF40861FC00E808A82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_122100_046612_CF01A11E 
X-CRM114-Status: UNSURE (   8.76  )
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Hsiao Chien Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support alpha blending by adding correct blend mode and
alpha property in plane initialization.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 9208f03b3f8c..dfd81172a940 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -349,6 +349,17 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 			DRM_INFO("Create rotation property failed\n");
 	}
 
+	err = drm_plane_create_alpha_property(plane);
+	if (err)
+		DRM_ERROR("failed to create property: alpha\n");
+
+	err = drm_plane_create_blend_mode_property(plane,
+						   BIT(DRM_MODE_BLEND_PREMULTI) |
+						   BIT(DRM_MODE_BLEND_COVERAGE) |
+						   BIT(DRM_MODE_BLEND_PIXEL_NONE));
+	if (err)
+		DRM_ERROR("failed to create property: blend_mode\n");
+
 	drm_plane_helper_add(plane, &mtk_plane_helper_funcs);
 
 	return 0;
-- 
2.18.0


