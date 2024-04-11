Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB19CD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 07:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/c1yvJRz8JdPTs1cqIeERB/b/xbXAhULQ4RA+mlvIg8=; b=lclQZBHHLgNV8YF4iGyq1S2dDr
	OdHgyzpIuNt5scUpyfk7z1ry/hTWsmMwd3093LUaFJnoL7KZNzNhh30Bd6aWXxoMTDvq7HdLt4cR/
	cvNpljUfLDe4s2HBS4/iL2PtxtwVBWDvwQ8QBCrnFjBpo60x7CsMtJf5QopWnehj7N8Osw9E+y1Zd
	xTspG5Ux5rZ+sO/u+Go7AHIVyAr+2MlrL2ReK+GWg80ygdH1x+vXVokK2jk6FretRWFn/YNH1Mx1G
	y96PHMg/+2RZe/js3HXsc35Jc436MEtJ6j+2wiIr7sBTgZNPAmkN1xMccbVrxtf7vPm9AVKff3T/+
	pT3Ttebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoRq-0000000Aj7D-2HBH;
	Thu, 11 Apr 2024 07:02:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoRm-0000000Aj4V-27l5;
	Thu, 11 Apr 2024 07:02:12 +0000
X-UUID: 661c0ce4f7d111eeac1957ae9f99f617-20240411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/c1yvJRz8JdPTs1cqIeERB/b/xbXAhULQ4RA+mlvIg8=;
	b=EEPm3p+GF1lB66eZ6jbesRWIIG9RPKeVSgkGynAJK8jzSot7PuT5r+AUFTNpWFDRs5hgXhG5O1jPdsEqkNR0d8Y7dbUWuv6wM1KwJELswwdKRVY08Z0M2/9soyTxwJAa/xMk5VFNXTN1MLEgMmfaX9qL82kl7m7QO+E7Tug1F5Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:39ce4097-841c-4538-b57f-f98d592bdb51,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:2bcfc8fa-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 661c0ce4f7d111eeac1957ae9f99f617-20240411
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1206823150; Thu, 11 Apr 2024 00:02:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 11 Apr 2024 15:01:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 11 Apr 2024 15:01:28 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3] media: mediatek: vcodec: support 36 bits physical address
Date: Thu, 11 Apr 2024 15:01:27 +0800
Message-ID: <20240411070127.12384-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.258800-8.000000
X-TMASE-MatchedRID: 3Zp7/B+3+xCHTNZBcJlnyHQIOMndeKgE6SXuwUgGH0gjEnikYkL+CP44
	pYPD16CLlTJXKqh1ne29cOdjc/43lb/eELA70ejcxPkB0MIBaXGH7D1bP/FcOkPL6pqegFS6y+l
	ts/rkGMs6hUOcTonr9IAy6p60ZV62fJ5/bZ6npdg7AFczfjr/7BBaNQP2ElZ7sBTQNe6q9JnbyF
	/5J/yVwHQbcUv25Bn5i9UugmfH/Nc=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.258800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2D4870850A06C752B984B2AFA27145AEA4011B1059274BBEA02A26AFBEEA89602000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_000210_583905_51C65C5D 
X-CRM114-Status: GOOD (  13.61  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
compared with v2:
- remove unless cast
---
 .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c | 2 +-
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
index 9649f4ec1f2a..5f848691cea4 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
@@ -449,7 +449,7 @@ static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		       inst->frm_cnt, y_fb_dma, c_fb_dma, fb);
 
 	inst->cur_fb = fb;
-	dec->bs_dma = (unsigned long)bs->dma_addr;
+	dec->bs_dma = bs->dma_addr;
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


