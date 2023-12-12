Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6058CC38147
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 12:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPb3UfJ/F4HQXrrSrfK/t28qw8wKavrHrRjno5lOOAY=; b=eL67Ou5Zz/k7Cul1/N4NEo2h5C
	SKOJepjnYO98OPxvQlmGcy/ybEA6xUfUUfO61FjFomvq/fEGIVM3zgOte4wkSyGMFBpmeehPBVgcq
	fxNFtf7UZtxpGWlDAZ0uCZSsIh/K90fekFOwb06/xFymxTuJBsxviVw0O3jabGdRpukXMMyzkBNJv
	G5fwRqFTCJ3GAgIEuhQhNZM8F8aV7bkVH+aUgxhSawwKLeHt//fEJc4UZIiL4Hzy+sARrrOZx1zS+
	ECzw0itsUGH/+v/xCO3u7QKLgG4uIuf+ll6XfKhy4p76WZf9cSh/isi4hbyXZ23uWVtD83umy3tOE
	M1Xpl5vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1kM-00BdZX-0R;
	Tue, 12 Dec 2023 12:20:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1kD-00BdUl-0X;
	Tue, 12 Dec 2023 12:20:15 +0000
X-UUID: c8b0bc1298e811ee958cff29c719f35b-20231212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MPb3UfJ/F4HQXrrSrfK/t28qw8wKavrHrRjno5lOOAY=;
	b=fukKPYDXe4S3GCZqZAdH/qp4nuM/KzbHZOl+1oyVzqHAM64RWTD2k5BuozY6Yrkl1Js+vzOWivqspwtRdvO2O34TqAFSAYhWRgTMT8owxcwV5YaNe/eTsqKKrpgeSX6dh9Z+arOMPw/dUfYz7pWIVRdlW0W6RPBfOECBmbO+PAo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:35a2d0c0-eaed-446a-91c1-b18680fe9cf8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:523b1c61-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c8b0bc1298e811ee958cff29c719f35b-20231212
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2035976325; Tue, 12 Dec 2023 05:20:06 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 20:20:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 20:20:01 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v4 10/17] drm/mediatek: Support more color formats in OVL
Date: Tue, 12 Dec 2023 20:19:50 +0800
Message-ID: <20231212121957.19231-11-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231212121957.19231-1-shawn.sung@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.858200-8.000000
X-TMASE-MatchedRID: N6Ek0bBNb/E5GkwO9XZv45JAa1C/+FcuEbxKVXd70tXfUZT83lbkEEtH
	ojrK13E4YW+LSuE6vND+UA6OdqfdiY9oUcx9VMLgFEUknJ/kEl7dB/CxWTRRu+rAZ8KTspSz62l
	iZc9EiWzgbP91+i7CtRVExQW3pejuw9QMYAEj5Zv1L4LYH+jdFH8WNOUAlF9V1usLfFvCBSaq/z
	HufHxGjVoL4DB5xh01F0aD5ljt43pMcHZD6gqu7wxMjfifIXfowkvVoA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.858200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7E0BD30B751507242B0EAC6B2A6D9844A95C039D2C0DE733BA5CF34BD308532E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_042013_209373_4DA10F57 
X-CRM114-Status: UNSURE (   8.96  )
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

Support more color formats in Overlay.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 7e217142d0c4..a3f1630af5df 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -130,12 +130,20 @@ static const u32 mt8173_formats[] = {
 static const u32 mt8195_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB2101010,
 	DRM_FORMAT_ARGB2101010,
 	DRM_FORMAT_BGRX8888,
 	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX1010102,
 	DRM_FORMAT_BGRA1010102,
 	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XBGR2101010,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX1010102,
+	DRM_FORMAT_RGBA1010102,
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_BGR888,
 	DRM_FORMAT_RGB565,
@@ -431,12 +439,16 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt,
 		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
 		       OVL_CON_CLRFMT_ARGB8888 :
 		       OVL_CON_CLRFMT_PARGB8888;
+	case DRM_FORMAT_RGBX1010102:
+	case DRM_FORMAT_RGBA1010102:
+		return OVL_CON_CLRFMT_ARGB8888;
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
 		return OVL_CON_BYTE_SWAP |
 		       (blend_mode == DRM_MODE_BLEND_COVERAGE ?
 		       OVL_CON_CLRFMT_ARGB8888 :
 		       OVL_CON_CLRFMT_PARGB8888);
+	case DRM_FORMAT_BGRX1010102:
 	case DRM_FORMAT_BGRA1010102:
 		return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
 	case DRM_FORMAT_XRGB8888:
@@ -444,6 +456,7 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt,
 		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
 		       OVL_CON_CLRFMT_RGBA8888 :
 		       OVL_CON_CLRFMT_PARGB8888;
+	case DRM_FORMAT_XRGB2101010:
 	case DRM_FORMAT_ARGB2101010:
 		return OVL_CON_CLRFMT_RGBA8888;
 	case DRM_FORMAT_XBGR8888:
@@ -452,6 +465,9 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt,
 		       (blend_mode == DRM_MODE_BLEND_COVERAGE ?
 		       OVL_CON_CLRFMT_RGBA8888 :
 		       OVL_CON_CLRFMT_PARGB8888);
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+		return OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP;
 	case DRM_FORMAT_UYVY:
 		return OVL_CON_CLRFMT_UYVY | OVL_CON_MTX_YUV_TO_RGB;
 	case DRM_FORMAT_YUYV:
-- 
2.18.0


