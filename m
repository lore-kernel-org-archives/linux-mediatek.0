Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8F7C25B70
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 13:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqpcqcoJjkFKSwF2F7GjLuy8TwwHoQkHLyekelq8u4I=; b=KkmP82H5xGroo4X0Pe/5GrCpC6
	fVdpRgbjqcG+/WhtIYCBOQrtuXE8bhbyIWJq0R/rEjqQSwESEQHRq7kiEJGxgkKJDeXsEozdThwto
	v9rJcjHrl3THF3IkP84C+GAfyh8IhwWxpoTkR3NrkL3OVhH9Y4HEmk/XnulZXIgDPO21AjQo156yW
	Uo6VpzURbQ9p4xF62Q9mcCNcxTAdUg9GbMnyIzvciHvy0gP48gT7PplDgRXttLTSjxgH5Q4mMeFW+
	zdt4ZGXRZ3xRFl4T2QiFrpAfIarMvQYYdG8JWV3BwHn51UvnbUFXJ1ABhfDILOoIBwKKU+QtLmIz/
	MeWGGizQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvH4W-009sC5-0A;
	Tue, 24 Oct 2023 13:03:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvH2e-009r9L-1b;
	Tue, 24 Oct 2023 13:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SqpcqcoJjkFKSwF2F7GjLuy8TwwHoQkHLyekelq8u4I=; b=i6Qpv8CLdjYVdiNkHfKN7zeM06
	nwVLQzZBzM5nEZ0/IxX5rdcpm8ruEXIDl1jMIQQ4suxmI2g3QUOtypGesveoEyFYZ+pBt6ak8UPtZ
	5iqwcvaF8LG1PlWhleX8amNiUV/kGc+pbvbWAWYdYQEdM7CpTBuwtPDLXMFTHSiB5KyEQGfX6C8aS
	V2EsteF0Pa1gxIRoMgHwGV1oR2xduA4wzp70dPOlaeQoRanj6zS+j5Y86cvCzk4iy+mqrMKqATcQZ
	lDNsktAvKZplPdsrLrt8z6K5CIZ+xGS1YhhlRF83gwSf6zufvppnLTfIbjoELK9ySIwus6KdpgCBY
	hWYNQA4A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvH2V-00FWn3-2T;
	Tue, 24 Oct 2023 13:01:51 +0000
X-UUID: 72ebee9c726d11ee9b7791016c24628a-20231024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SqpcqcoJjkFKSwF2F7GjLuy8TwwHoQkHLyekelq8u4I=;
	b=k7kQw8t0lWYzvfVNuQvOs4GZCkoiFiynLrVH/5RkCUshEi7hxKaEC15dzrNwNBxHLkcf23HWUrn5Ka4SdGoj/iU2G1iDmfyUlsK5xwL7WnqNd+h6xi1K1gW79M6c7lIGPSmf3c4Mm2lz4DbTWHBbzHGX/PqRAMDAERBdPsAxBL4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:86d4ce3a-237a-4e79-8fbd-ac581fe88b52,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:63829394-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 72ebee9c726d11ee9b7791016c24628a-20231024
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2017579705; Tue, 24 Oct 2023 06:01:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Oct 2023 21:00:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Oct 2023 21:00:55 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v11 17/23] drm/mediatek: Refine device table of OVL adaptor
Date: Tue, 24 Oct 2023 21:00:42 +0800
Message-ID: <20231024130048.14749-18-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231024130048.14749-1-shawn.sung@mediatek.com>
References: <20231024130048.14749-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.635000-8.000000
X-TMASE-MatchedRID: j34N8PQvhP8eszLHPCQb9B+WEMjoO9WWCt59Uh3p/NVcKZwALwMGs0fp
	kQx2u0Ks+qmOSYkzMxknOAFYLaUTjQDNPxu11HXj4pdq9sdj8LV9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO1YDuIRWpqxhlN2D/LzWZyyhp22LCZ7ETnRPgiaEFLtWkFM85dtOQqmwPzJ0OlA2ZcbEh
	p6dU4MXJ9jegfk4wi8iIj3rZvs2VuQkKVvpycGDXZrUbEZipAEiWT09mQz7szw9kH8zAy44SIdu
	k5Jkjd3wL6SxPpr1/I=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.635000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 446CFF5E1B8E2EC22FE4634E07705D8F2511343BAFE37762B60C715711A9E9742000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_140147_921808_706147C9 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

- Adjust indentation to align with other files
- Sort device table in alphabetical order
- Add sentinel to device table

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 23c2a7488d81..df6e6cb0a9ef 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -436,17 +436,10 @@ static int ovl_adaptor_comp_get_id(struct device *dev, struct device_node *node,
 }
 
 static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
-	{
-		.compatible = "mediatek,mt8195-vdo1-rdma",
-		.data = (void *)OVL_ADAPTOR_TYPE_MDP_RDMA,
-	}, {
-		.compatible = "mediatek,mt8195-disp-merge",
-		.data = (void *)OVL_ADAPTOR_TYPE_MERGE,
-	}, {
-		.compatible = "mediatek,mt8195-disp-ethdr",
-		.data = (void *)OVL_ADAPTOR_TYPE_ETHDR,
-	},
-	{},
+	{ .compatible = "mediatek,mt8195-disp-ethdr", .data = (void *)OVL_ADAPTOR_TYPE_ETHDR },
+	{ .compatible = "mediatek,mt8195-disp-merge", .data = (void *)OVL_ADAPTOR_TYPE_MERGE },
+	{ .compatible = "mediatek,mt8195-vdo1-rdma", .data = (void *)OVL_ADAPTOR_TYPE_MDP_RDMA },
+	{ /* sentinel */ }
 };
 
 static int compare_of(struct device *dev, void *data)
-- 
2.18.0


