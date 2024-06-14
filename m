Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7453C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 02:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEZn22CVYdNgy3llz30TgBu2MjXVr5AFuBOydxXER6E=; b=va0BYC0mTj3+FOo+z7ZV1H5Z88
	vQwPX1lqLXh8KXfML05OCkIXxIp0XnrtUEg1xT1k72eCKcYoX1L3gmdAP+qLOswXGcOBMsZDch8NX
	+qg6fxqrNhe6al16wSjFFxVjk2oHYkuERY0TKf4fK+FaEmguAVgKnwol8X3uvEh7fCm/BkgYygiO4
	StS8CGAWEcTdMzUI6+JtN9g4geHBzwpY2ZkLuyjcUKTtuNnLeh7EbadO/k3kjUQFYaVth5cGhPXe1
	5VVSJkbats9UJEGJVnCY823SyodAoIi+rajbeJT7/mD6d19bTvObry2Hs4G8FNBnC7u0MiuURgHm0
	Jd1h4Fhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHwyA-00000001AYB-43Zn;
	Fri, 14 Jun 2024 02:47:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHwxT-000000019sk-3MyM;
	Fri, 14 Jun 2024 02:46:34 +0000
X-UUID: 4bb77f9c29f811efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JEZn22CVYdNgy3llz30TgBu2MjXVr5AFuBOydxXER6E=;
	b=n16cJO4gc8XwJZ1p0FBONR6AaD9830VmZFb93LcCfrP0meNh89cBmn+xRIX1M57RMnT+wFlL1Z6JipXa8ezPwXWV343S/GhEzJL81+Oa65PJsfp3QzRoO+0U5zzrdjWN2MTeDHY3jLgYlhJwOMNQjHyALtEVKBTUGiNjDRPaiUw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:63ce1dee-5526-4e0b-a88a-8e6b92d05205,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:393d96e,CLOUDID:ce3d8f44-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4bb77f9c29f811efaf04eb0598667787-20240613
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2142971683; Thu, 13 Jun 2024 19:46:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 10:46:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 10:46:23 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v9 11/21] drm/mediatek: Add new color format MACROs in OVL
Date: Fri, 14 Jun 2024 10:46:10 +0800
Message-ID: <20240614024620.19011-12-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240614024620.19011-1-shawn.sung@mediatek.com>
References: <20240614024620.19011-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.032700-8.000000
X-TMASE-MatchedRID: B7xIh5hTocA/mJEvNFL+dbqQyAveNtg65hCwQ3LNHZ0vM0Gdq0fzqfMT
	uIrC6WWhPkn/V88HF8sSqo3ZUfrHh5Coy9iDotiwHcQQBuf4ZFvtMsBKGEjbqZsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNWqnMjmJR+9JCQBf3hdsghh5wY7hpybcOB9VaJFic4bCpj6vpo5Zq+s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.032700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 840A6161F61534913DE749BAA662769628037593C2C1F54BF2FFFC234EF60B802000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_194631_909383_A5FD46A2 
X-CRM114-Status: UNSURE (   9.46  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby
 Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Hsiao Chien Sung <shawn.sung@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Define new color formats to hide the bit operation in the MACROs to make
the switch statement more concise.
Change the MACROs to align the naming rule in DRM.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index fd390fb83d0e..1923bbd96014 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -55,8 +55,10 @@
 #define OVL_CON_BYTE_SWAP	BIT(24)
 #define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
 #define OVL_CON_CLRFMT_RGB	(1 << 12)
-#define OVL_CON_CLRFMT_RGBA8888	(2 << 12)
-#define OVL_CON_CLRFMT_ARGB8888	(3 << 12)
+#define OVL_CON_CLRFMT_ARGB8888	(2 << 12)
+#define OVL_CON_CLRFMT_RGBA8888	(3 << 12)
+#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
 #define OVL_CON_CLRFMT_UYVY	(4 << 12)
 #define OVL_CON_CLRFMT_YUYV	(5 << 12)
 #define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
@@ -393,22 +395,22 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
 	case DRM_FORMAT_RGBA8888:
 	case DRM_FORMAT_RGBX1010102:
 	case DRM_FORMAT_RGBA1010102:
-		return OVL_CON_CLRFMT_ARGB8888;
+		return OVL_CON_CLRFMT_RGBA8888;
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
 	case DRM_FORMAT_BGRX1010102:
 	case DRM_FORMAT_BGRA1010102:
-		return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
+		return OVL_CON_CLRFMT_BGRA8888;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_XRGB2101010:
 	case DRM_FORMAT_ARGB2101010:
-		return OVL_CON_CLRFMT_RGBA8888;
+		return OVL_CON_CLRFMT_ARGB8888;
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
 	case DRM_FORMAT_XBGR2101010:
 	case DRM_FORMAT_ABGR2101010:
-		return OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP;
+		return OVL_CON_CLRFMT_ABGR8888;
 	case DRM_FORMAT_UYVY:
 		return OVL_CON_CLRFMT_UYVY | OVL_CON_MTX_YUV_TO_RGB;
 	case DRM_FORMAT_YUYV:
-- 
2.18.0


