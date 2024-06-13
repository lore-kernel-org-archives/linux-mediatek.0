Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB36C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sB3TQ1hsgFFVf1bnMvCxYjBr6NFgk3dyfi1svtfepEQ=; b=afiq66tVdIPRE+xE0c7WaqKyES
	8bu0qW0KhZ1TKV7hzcigQWroeO65Iy7iNBWlDcf7V8QRI79lnW5EqNw80eD7K7TBAHWcbIO85TSgW
	MBrKRr9iB0mDkhS8zpuVp8fZCi/qlYgAc0Wq7+dyU8+hpRp3w1cHgnU4lSXtp5X2D5xUeefxGQc8o
	D0XfOYg5pJm+J42mVutCJnR5uE2iCgmPP5Nc0uk5dzJkAzs/sNJUh+Xr+goqgjo7L3sPC675WwvOv
	j6kBp3hPU2AVnq652Zjjnou5LrHpxedRf9P9dqu0ueqXXN168fUx82agkCNwkbdRaU+ExjS+y3HNA
	KPwdQBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfJK-0000000FZh0-4BFc;
	Thu, 13 Jun 2024 07:55:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfJI-0000000FZg5-2mM6;
	Thu, 13 Jun 2024 07:55:53 +0000
X-UUID: 58ddeb32295a11efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sB3TQ1hsgFFVf1bnMvCxYjBr6NFgk3dyfi1svtfepEQ=;
	b=hk2ucAmFmOhz4yvnIJdx3aecMSJi8DIoPhEud71nfjdJ6U3de6/+5o2ksYHVHrHmuB79M902lMnhK9sDiZqUqFyc7Qq/jun7ckxkeyieS8AHeHvYTe+ldafUyhGMSKv073BXOsLQApoKRGWPizO/x1lMyBvGkhljGhZuMf1MpXI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:0dc32a02-c7f5-449f-bc6d-35f88f331176,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:c6cb0985-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 58ddeb32295a11efaf04eb0598667787-20240613
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 452612698; Thu, 13 Jun 2024 00:55:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 15:55:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jun 2024 15:55:45 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 0/7] media: mediatek: vcodec: fix v4l2_ctrl_request_complete fail
Date: Thu, 13 Jun 2024 15:55:25 +0800
Message-ID: <20240613075532.32128-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_005552_735405_3822D3FD 
X-CRM114-Status: UNSURE (   7.47  )
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

v4l2_m2m_buf_done is called in lat work queue, v4l2_ctrl_request_complete
is called in core queue. The request status of output queue will be set to
MEDIA_REQUEST_STATE_COMPLETE when v4l2_m2m_buf_done is called, leading to
output queue request complete fail. Must move v4l2_ctrl_request_complete
in front of v4l2_m2m_buf_done.

Patch 1 setting request complete before buffer done
Patch 2 change flush decode from capture to output when stream off
Patch 3 flush decoder before remove all source buffer
Patch 4 using input information to get vb2 buffer
Patch 5 store source vb2 buffer
Patch 6 replace v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
Patch 7 remove media request checking

---
compared with v2:
- add patch 5/6/7 to fix decode again issue
- add fluster test result with mt8195 platform(same with no changed):
  1> ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0 -j1 -t 90
     VP8-TEST-VECTORS 59/61
  2> ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0 -j1 -t 90
     VP9-TEST-VECTORS 276/305
  3> ./fluster.py run -d GStreamer-AV1-V4L2SL-Gst1.0 -j1 -t 90
     AV1-TEST-VECTORS 237/239
  4> ./fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -j1 -t 90
     JVT-AVC_V1       95/135
  5> ./fluster.py run -d GStreamer-H.265-V4L2SL-Gst1.0 -j1 -t 90
     JCT-VC-HEVC_V1   142/147

compared with v1:
- add patch 2/3/4 to fix timing issue.
---
Yunfei Dong (7):
  media: mediatek: vcodec: setting request complete before buffer done
  media: mediatek: vcodec: change flush decode from capture to output
    when stream off
  media: mediatek: vcodec: flush decoder before remove all source buffer
  media: mediatek: vcodec: using input information to get vb2 buffer
  media: mediatek: vcodec: store source vb2 buffer
  media: mediatek: vcodec: replace v4l2_m2m_next_src_buf with
    v4l2_m2m_src_buf_remove
  media: mediatek: vcodec: remove media request checking

 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 52 +++++++++----------
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  4 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 48 ++++++++++++-----
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 18 ++++---
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  4 +-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  4 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 19 ++++---
 .../mediatek/vcodec/decoder/vdec_msg_queue.h  |  4 +-
 8 files changed, 89 insertions(+), 64 deletions(-)

-- 
2.18.0


