Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196DDCF043B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 03:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNf8esuPFXdj1SzZwNlUle77CExMPeToTH21H8ouLYo=; b=PM5lfGTACpb58TJB+UDSYyXE0y
	jfph6Rrf59WGD2nAgvI8lsMb1HxHIITjsIOKI+K/ia9Gj/bko1GktxSnDwOLkTYpbvAt4KfHikC4l
	XjvG6GWrzVESuq9TADWhlpM+Mpl/00ko6NCFtSM0pwxb3P5e0s89fF0eMMHvf+A1cNwugKfnMrScO
	s9YrluWcw9z64KzHrJL6MJ8/F0905cSVVsyeke4H5riT75RmPQyeJlkJKr6N8n6cHycBa3FiIXznb
	jIibyTcgUzp8895kKwu8S9S4+uL/vS2sB7naYajmkDcf65SlXjeCG806Tp6NkTDWc5dYoL96QrQZ7
	3IZR6Jjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syNli-00000007p63-0foD;
	Wed, 09 Oct 2024 03:53:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syNfS-00000007o7t-3U3J;
	Wed, 09 Oct 2024 03:47:20 +0000
X-UUID: 264832a685f111efb3adad29d29602c1-20241008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jNf8esuPFXdj1SzZwNlUle77CExMPeToTH21H8ouLYo=;
	b=XSvHia//1WANEiQuyBmFckMe4xBMCnx2qNINMgJwFf4yueMyc2dH2QtLeeqaYXhJbNBn/l7y2hIQyDHd+/BJFxZaXKzPUXRrIn3DLctMv6umpIbvRRQeqPKe8lvx041dtYhK1ansTbGABxzRq0fvnsYjNatfPAmWffA9Yf+KmXQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:2181b45d-8a3a-46b0-9f75-dcf98d50dbaf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:2cc48226-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 264832a685f111efb3adad29d29602c1-20241008
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 249725039; Tue, 08 Oct 2024 20:47:04 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 11:46:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 11:46:46 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Adam Thiede <me@adamthiede.com>, Yassine Oudjana
	<yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, Alper Nebi Yasak
	<alpernebiyasak@gmail.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v11 1/5] drm/mediatek: ovl: Fix XRGB format breakage for blend_modes unsupported SoCs
Date: Wed, 9 Oct 2024 11:46:42 +0800
Message-ID: <20241009034646.13143-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241009034646.13143-1-jason-jh.lin@mediatek.com>
References: <20241009034646.13143-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.798000-8.000000
X-TMASE-MatchedRID: X679DjmVMOn2fv0LTPfvM4dlc1JaOB1TUAjrAJWsTe/KP6Yywb5aNnv7
	Io91rBfwD2EF2wJcjhdx0DfvHApiHUIjaJSsaV6qY1bQMCMvmn6eEP0DdJrullxTR00Ss4P62ft
	v/5jXki/ZoTly3PGW4GlSWihAdtZ+j2hRzH1UwuAURSScn+QSXt0H8LFZNFG7CKFCmhdu5cUi5y
	5vykNUv9NYWU6hQo6nyU+stpPw3NyDgLduq9LPWKW+UzY9s8NAqCsLjdN80t/JgECrPZSGt/5fz
	FTJ/+DJcVSyL/LZfpwXRoPmWO3jekxwdkPqCq7vDEyN+J8hd+jCS9WgDXVPCp6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.798000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8EF844DF62ED7CF5483EBEC09019DF7B7F35AF7A6138F71D1EFF490F66F76CD22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_204718_944308_9D585FC8 
X-CRM114-Status: GOOD (  13.42  )
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

OVL_CON_AEN is for alpha blending enable.
For the SoC that is supported the blend_modes, OVL_CON_AEN will always
enabled to use constant alpha and then use the ignore_pixel_alpha bit
to do the alpha blending for XRGB8888 format.
Note that ignore pixel alpha bit is not supported if the SoC is not
supported the blend_modes.
So it will break the original setting of XRGB8888 format for the
blend_modes unsupported SoCs, such as MT8173.

To fix the downgrade issue, enable alpha blending only when a valid
blend_mode or has_alpha is set.

Fixes: bc46eb5d5d77 ("drm/mediatek: Support DRM plane alpha in OVL")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 89b439dcf3a6..047cd1796a51 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -473,8 +473,14 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 
 	con = ovl_fmt_convert(ovl, fmt, blend_mode);
 	if (state->base.fb) {
-		con |= OVL_CON_AEN;
 		con |= state->base.alpha & OVL_CON_ALPHA;
+
+		/*
+		 * For blend_modes supported SoCs, always enable alpha blending.
+		 * For blend_modes unsupported SoCs, enable alpha blending when has_alpha is set.
+		 */
+		if (blend_mode || state->base.fb->format->has_alpha)
+			con |= OVL_CON_AEN;
 	}
 
 	/* CONST_BLD must be enabled for XRGB formats although the alpha channel
-- 
2.43.0


