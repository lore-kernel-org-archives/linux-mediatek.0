Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE7DC27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 09:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vPX1AHD54ZweMud2CAGeNnwrJ7C9fon4sYTRXKnYsD8=; b=kAhXSJRhfTWdfsncYRD/k+F0v8
	1iriY0vhcSVJYvVAAsJA3NZ+zNbl5lV1Pcm0hDNf3rnzPKWNBZ9KxlGGyHlCGcO/+Q2/4IqrMdZfB
	Zpt1UEq3d37mkCLJbk1qPUlrMshUAfVF98uTYM4dWYNVAxV+jMb1qh7Qfb1xl9JNb6E5OHYMKOVCu
	O2yLVXlOAM1o/+cdRkXCP2ByMs+sopM2kNlaMcaBRHsfK1lsakGrkvKqmFx2euBb3S5i/7QCrQaFQ
	H865HnOyDyNlenbxSVQcSU4tYdu39AHW8hjVWSr+Ra5O/L59bMnuedG0g9ny/uMS3U/QfVmt7TfIv
	pm1148oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHgr0-0000000Fz2R-14D0;
	Thu, 13 Jun 2024 09:34:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHgqw-0000000Fyxo-0MgH;
	Thu, 13 Jun 2024 09:34:44 +0000
X-UUID: 24d58468296811efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vPX1AHD54ZweMud2CAGeNnwrJ7C9fon4sYTRXKnYsD8=;
	b=NDoSpHHBM/n23oYXmezy28QrTPQbox3OJBdQUFg7uYJqqb4IwBaU0wUd6KUXF49I+4OwaVNHKy28L3uZ1nJ9pfpLsB+I9+8SL/MBdBXnX3yvgF1SaT1sg7txWOL4cSvd+TX4DzMOQhk/qc6CBRhwMCRFVYVPlNv3yhBsADpOUmw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:024d7b54-86f5-4ede-bdc6-b3dc638431dc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:65d9f193-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 24d58468296811efaf04eb0598667787-20240613
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1511163037; Thu, 13 Jun 2024 02:34:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 17:34:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jun 2024 17:33:59 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 0/3] media: mediatek: vcodec: fix vcodec smatch warning
Date: Thu, 13 Jun 2024 17:33:54 +0800
Message-ID: <20240613093357.583-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_023442_194570_F407F6EE 
X-CRM114-Status: UNSURE (   7.39  )
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

Fix below smatch static checker warning from [bug report]:

The patch 397edc703a10: "media: mediatek: vcodec: add h264 decoder
driver for mt8186" from May 12, 2022 (linux-next), leads to the
following (in development) Smatch static checker warning:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c:351
vdec_h264_slice_decode() potential NULL container_of 'fb'

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:337
vdec_vp8_slice_decode() potential NULL container_of 'fb'

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:728
vdec_h264_slice_single_decode() potential NULL container_of 'fb'

---
Changed with v1:
- Change the return value from -EBUSY to -ENOMEM when the driver can't get
  frame buffer.
---
Yunfei Dong (3):
  media: mediatek: vcodec: fix h264 multi statless decoder smatch
    warning
  media: mediatek: vcodec: fix vp8 stateless decoder smatch warning
  media: mediatek: vcodec: fix h264 stateless decoder smatch warning

 .../mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c    |  9 +++++++--
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c       |  9 +++++++--
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c     | 10 +++++++---
 3 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.18.0


