Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F3BC48BF6
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 02:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HBS1I/NOgPbbX1oZFpsgk/1CALyAPNq0suP+PJ3XesU=; b=Ikj5mQHsdVFAKpV8LJqg49SEHe
	eWHZqTKoIFYQwSHzSxz50i3udIKKEy2ruhQ4U0sfCc16uXUlSiei+Lt+DdaZNBUceCi1+MmmcheXU
	jcxc+icnhVClT+n+oZ43wb3SDLG9fgdcfDtwzqzXuRAa1o+vR4VPw/pZutiUdKndk43B9eSU0s2sb
	9iIcKeqPXJHZf/zJY7AnnFxtMlr9xranpSxe/np4WtfznIH7Nr5UqKrQLRP4Ta1Aj00VNeVj8HMFd
	tiIUBrgPVs+sgkx8yT8o9WJaCxvCgmc5brm8+A/cFLaTJiM3Srjgl5+giAh+mg02X5cEbos3ywrxH
	YV9M2sGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfsE4-0000000FwvX-301L;
	Fri, 01 Mar 2024 02:02:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfsE1-0000000Fwu9-1KmL;
	Fri, 01 Mar 2024 02:02:14 +0000
X-UUID: b326b9eed76f11ee91d3e53c4c7db243-20240229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HBS1I/NOgPbbX1oZFpsgk/1CALyAPNq0suP+PJ3XesU=;
	b=F++7zWSIF/rtO46xP5XMrm5P6hDqrY4yxfJE7EF1ORCuygCyGTeNkWAkKbqbhdvgrqqmjmrfCjJqf415/pPlZJq8QWVf6Z0jbytmK5cwzKKrVFW9XA4Ni39QTAdSas+gpZ8SanxipNyasWGa2TbXIxExH8WNGBlI51egEPv/VMI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:42ca0505-8de7-4439-baef-a28f7e9a0c2a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:81bef980-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b326b9eed76f11ee91d3e53c4c7db243-20240229
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 371662975; Thu, 29 Feb 2024 19:02:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Mar 2024 10:01:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Mar 2024 10:01:28 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] media: mediatek: vcodec: support 36bit physical address
Date: Fri, 1 Mar 2024 10:01:26 +0800
Message-ID: <20240301020126.11539-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.986100-8.000000
X-TMASE-MatchedRID: MXmpjVMQBvchu4G5/VkGwwPZZctd3P4B7f6JAS2hKPgUtdRZTmEaIb9n
	SsB9y3SmXfLeWSJ8nKvcFPFR1xoqQh8TzIzimOwPC24oEZ6SpSkj80Za3RRg8Nr8k9p6q6xQ8XR
	JHb0N4gK2+HtcNQgId7UxHy5DZGDPwaVEpyapekM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.986100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 81F330C20FD882D5E9A3FF4558755189B19F9D12D06F1B64C5360A96E6826FDE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_180213_375842_E19D989D 
X-CRM114-Status: GOOD (  11.76  )
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

The physical address is beyond 32bit for mt8188 platform, need
to change the type from unsigned int to unsigned long in case of
the high bit missing.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index cf48d09b78d7..85df3e7c2983 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1074,7 +1074,7 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
 	unsigned int mi_row;
 	unsigned int mi_col;
 	unsigned int offset;
-	unsigned int pa;
+	unsigned long pa;
 	unsigned int size;
 	struct vdec_vp9_slice_tiles *tiles;
 	unsigned char *pos;
@@ -1109,7 +1109,7 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
 	pos = va + offset;
 	end = va + bs->size;
 	/* truncated */
-	pa = (unsigned int)bs->dma_addr + offset;
+	pa = (unsigned long)bs->dma_addr + offset;
 	tb = instance->tile.va;
 	for (i = 0; i < rows; i++) {
 		for (j = 0; j < cols; j++) {
-- 
2.18.0


