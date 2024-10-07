Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0408ACFB440
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 07:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFEgSzsR19g/gZoKiElaar5KRFRdu2C3mWi6oy3D+PE=; b=vdqsL4loVbpoTFcRy8Omk81VkI
	E7oNeR/lIKdytvmrYlkwL6H5AQhzV0Fvg6q+kGix06KVMv4EQ62m1s3NOaAVCqa+sFxQNUECMAZhW
	NlR6s0bmkAxH1KumvELROqAuKzBZ+SW+ezLl2UykMCJ9OHeq2Xo1IhXP/q02TfW5uud06HFgBlkyn
	+wFB6WI0D5W7ZH91SdiQbGZNdOv8+fP3E5R0WZlS0VxY5jRKo8zrpFH6grJVsM8GYVna537QmLbKA
	pGp6TZggC6AOcN6YxNO5o7QnM1qYIwT7M+ddHVGicDIKp2C0eot14g5VQ3PT4GNPXGrmTTmkdgd8h
	PrUMwhpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhp8-00000001Wtn-09gN;
	Mon, 07 Oct 2024 07:06:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhk0-00000001VtJ-3onF;
	Mon, 07 Oct 2024 07:01:14 +0000
X-UUID: ecc4c1f2847911efb3adad29d29602c1-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hFEgSzsR19g/gZoKiElaar5KRFRdu2C3mWi6oy3D+PE=;
	b=mab49E4YGOzqQw4vGf8hHfLHEE3LyPoRwE7ol3zcZXPNL4/i9x3WkN4Q2jly21062CtyfPjkwpnOYgq64C2VBYde3FSIpv/Tq9FtxopN8rs4Sgv7p74a0o7NgatVzg2FEhquIuQMG7gfaGdEfWd8s2XkVOzNB962Dpi3AA7C10c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:d42b405e-a885-48c6-9777-06c3c85da8d1,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:5c1fda64-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: ecc4c1f2847911efb3adad29d29602c1-20241007
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 867427092; Mon, 07 Oct 2024 00:01:06 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 15:01:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 15:01:03 +0800
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
Subject: [PATCH v9 3/5] drm/mediatek: ovl: Remove the color format comment for ovl_fmt_convert()
Date: Mon, 7 Oct 2024 15:00:59 +0800
Message-ID: <20241007070101.23263-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
References: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.679400-8.000000
X-TMASE-MatchedRID: JqvUv0YB5EcxgGuH6sDPS8u00lnG8+PW4+ZcrqvCDkFcKZwALwMGsyc/
	xZYu98DINdSJDUY9JRESqo3ZUfrHh25/NyTKlG694pdq9sdj8LVaNaxZBRbNWi8zQZ2rR/Opl12
	4J4jWEmtRY9f7h2Xyki1nQIsbRW6GSJvHZYIIxMieAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8ifEz
	J5hPndGba+xTwXsc5qqeC1Zf5kfSTM53A5+Z0f0qNJf0+RLn+96jfpBdJfd4N749KQ5eyZEpQEQ
	Sv/NPqP4gzb/+CBJ6+IyRJlDbkVyXmVKZusLp922v9OjYWA2uMMswg45VMfPadst5iAforfVlxr
	1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.679400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0254FD193E5AEA77617F13376B729042DCEDD557A5F76DE370D29A73D78063B52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_000113_015930_AF026071 
X-CRM114-Status: UNSURE (   8.10  )
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
index ddc826c42653..22f17ebfd8b3 100644
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


