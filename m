Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32F8CF043B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 03:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqlp+hC1+rn6mVdWdXR2LN/CqTCqC5lEUqhZ8cUD4OI=; b=0Nq9MxHfXLcVujBKqNeADMhJ3Y
	T8lhm9GHy3VW+qnpaKPjHLTJBNMLWN0U8tdxUVJPh+ynI76J72K7OwqMGiJnFgWYJoQdNkasJ3MY/
	d6LSOkLQz727zre/0XRztBRrHPbiQkmucQSAoIzMs/RyKFuWr1zgTDl8PeBMpQ+zQhSRaqfRfD22a
	gInO/m5OJ4hkipziBY1HKJuVjPPL0u/3KcAMBdwaFEkkcBayc+GI3Gxbw5fzw6btiYCBUKdyMgZAr
	XcspRMgNT1qRrom8dTfXYjCk1QwI/PKDkqKCANoYDfKbDPqLT4/CAKKTgPirPSOtqudNO/Dc5ul2O
	q4wxvYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syNgZ-00000007oLi-2Uoj;
	Wed, 09 Oct 2024 03:48:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syNfD-00000007o32-3mcc;
	Wed, 09 Oct 2024 03:47:05 +0000
X-UUID: 1e1b5a1885f111efba0aef63c0775dbf-20241008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oqlp+hC1+rn6mVdWdXR2LN/CqTCqC5lEUqhZ8cUD4OI=;
	b=oAGx7rT9mLDb/NY13oPRpvA1wwmebFi/Zh/KBtQzGEO6B4hNIZ/OmbKsglaU2zMfDDuuyXRHKllIP/4CET/LmbWKoW7+ic3FNDlvAGew2JVDBwSxgyevUw6feERfjZ/VOJlv7bCfNjMueccX2wDLnxd44TRMNV+YtX1nf3oqryg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:bdfc3210-d2f7-4923-b04b-d51ef8ea1072,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:6d72f764-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 1e1b5a1885f111efba0aef63c0775dbf-20241008
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1345635306; Tue, 08 Oct 2024 20:46:51 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 11:46:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 11:46:47 +0800
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
Subject: [PATCH v11 3/5] drm/mediatek: ovl: Remove the color format comment for ovl_fmt_convert()
Date: Wed, 9 Oct 2024 11:46:44 +0800
Message-ID: <20241009034646.13143-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241009034646.13143-1-jason-jh.lin@mediatek.com>
References: <20241009034646.13143-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.679400-8.000000
X-TMASE-MatchedRID: JqvUv0YB5EcxgGuH6sDPS8u00lnG8+PW4+ZcrqvCDkFcKZwALwMGsyc/
	xZYu98DINdSJDUY9JRESqo3ZUfrHh25/NyTKlG694pdq9sdj8LVaNaxZBRbNWi8zQZ2rR/Opl12
	4J4jWEmtRY9f7h2Xyki1nQIsbRW6GSJvHZYIIxMieAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8ifEz
	J5hPndGVq6wMyJqZhvNqiXCKftsUJWCAG9E8h5zJ99RML1VXr4mL69iLkCQJ1h881CAW22/TF6c
	AEfHrzia3prxka/F+M8fwGD9FLhvHmVKZusLp922v9OjYWA2uMMswg45VMfPadst5iAforfVlxr
	1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.679400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: FF68AA1BB74E71C70A2BE84749CA8EB0F84B94363C9B5A4B3B201A7973343AA92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_204703_967309_3A80055F 
X-CRM114-Status: UNSURE (   9.09  )
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

Since we changed MACROs to be consistent with DRM input color format
naming, the comment for ovl_fmt_conver() is no longer needed.

Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 0d3a9c5e8d26..1ccb700858cf 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -389,11 +389,6 @@ void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt,
 				    unsigned int blend_mode)
 {
-	/* The return value in switch "MEM_MODE_INPUT_FORMAT_XXX"
-	 * is defined in mediatek HW data sheet.
-	 * The alphabet order in XXX is no relation to data
-	 * arrangement in memory.
-	 */
 	switch (fmt) {
 	default:
 	case DRM_FORMAT_RGB565:
-- 
2.43.0


