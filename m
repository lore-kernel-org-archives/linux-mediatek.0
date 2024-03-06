Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699F7C5475B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 12:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IImJC9e9Da9C3lUM5dgN5QOlSp2BnbxeAklEtHNsfVk=; b=vNYXtaPbeZtS6gu/10yOet3qAI
	ga/BtZP21uL0Gx/09VYfs65+LOe+SRIdjmUlgbjshg1jPiEq8SSi8JPS5ecX0075KEouhzIlt+DM4
	0MOlUXPzvaCtdiWgaCsu+dPME3U3NYICJvEeRkKu2WQrpPq5REEUHkoB2XfinPs+CDQQgztzBPmOd
	40hfxP8YMecIlJBr5Vz2vMlD0grfhMeVxVhjPUPccMnFbscBwuwqqD1Ucxs116V/lYGirmJMilfsD
	LTFiqcuz6lOo8awVNo1Vi4JM+eaO+BHCeironn0JG8e+6mh8wCltTQEJmG75ywbQTd5Vl92rL78WD
	AQKmn6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhqEu-000000009kx-0V3R;
	Wed, 06 Mar 2024 12:19:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhqEs-000000009kA-1JLH;
	Wed, 06 Mar 2024 12:19:15 +0000
X-UUID: ba748170dbb311eebe6b57d01cc416d2-20240306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IImJC9e9Da9C3lUM5dgN5QOlSp2BnbxeAklEtHNsfVk=;
	b=oTwT5u+6ceKN91WgfQKlYtpYIJPanP9fILphVFtsNGhyK9SmADO36Jm5vfQ6nLHcMoXR+jOj28chXZPyU9wWkQl0W2ZKCMA8RUZSgGN7wlWu3yZIX5WSJQaVGpEjmchRPfB1ONT9gbYsjlIMoSPVOixdZ2YWAHodDPQSnhSkfAA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:d58c944d-f5e6-44e3-af34-b75a7075c9d3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:567694ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ba748170dbb311eebe6b57d01cc416d2-20240306
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1260127280; Wed, 06 Mar 2024 05:19:06 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Mar 2024 20:19:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Mar 2024 20:19:03 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2] media: mediatek: vcodec: support 36 bits physical address
Date: Wed, 6 Mar 2024 20:19:02 +0800
Message-ID: <20240306121902.25069-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.625700-8.000000
X-TMASE-MatchedRID: Fdt1IHAXXPKHTNZBcJlnyHQIOMndeKgETJDl9FKHbrk1LB46LFAAkktH
	ojrK13E49ypTh0ieeunHCCukuCUtoobqZZp5NyFKXpVEIlJTuP2d2Wz0X3OaLZsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNWCFMTTr110l3BTbPvva4/GNYa/SjhM7l0EM1EKZ9uM8WvxqZnJiH0w=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.625700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7DE4977BDE382AA717543D2C2D293FFF5A7F45942B469FFE79BB5F9992F8F79F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_041914_383398_9CDD2EFD 
X-CRM114-Status: GOOD (  13.46  )
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

The physical address on the MT8188 platform is larger than 32 bits,
change the type from unsigned int to dma_addr_t to be able to access
the high bits of the address.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
compare with v1:
- change address type from unsigned long to dma_addr_t
- change vp8 address type
---
 .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c | 2 +-
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
index 19407f9bc773..987b3d71b662 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
@@ -449,7 +449,7 @@ static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		       inst->frm_cnt, y_fb_dma, c_fb_dma, fb);
 
 	inst->cur_fb = fb;
-	dec->bs_dma = (unsigned long)bs->dma_addr;
+	dec->bs_dma = (uint64_t)bs->dma_addr;
 	dec->bs_sz = bs->size;
 	dec->cur_y_fb_dma = y_fb_dma;
 	dec->cur_c_fb_dma = c_fb_dma;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index cf48d09b78d7..eea709d93820 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1074,7 +1074,7 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
 	unsigned int mi_row;
 	unsigned int mi_col;
 	unsigned int offset;
-	unsigned int pa;
+	dma_addr_t pa;
 	unsigned int size;
 	struct vdec_vp9_slice_tiles *tiles;
 	unsigned char *pos;
@@ -1109,7 +1109,7 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
 	pos = va + offset;
 	end = va + bs->size;
 	/* truncated */
-	pa = (unsigned int)bs->dma_addr + offset;
+	pa = bs->dma_addr + offset;
 	tb = instance->tile.va;
 	for (i = 0; i < rows; i++) {
 		for (j = 0; j < cols; j++) {
-- 
2.18.0


