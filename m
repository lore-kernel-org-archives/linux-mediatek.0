Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DD8C54E67
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UxJYj8Ub0WqcViLUsXIUaPYc9DwJ148RUl4hICOZhNU=; b=o8Ri5JdKVzJ3DW7u4LyGkPkI2U
	SVEouIzff0rNQtb6Hw7TwZLfdgOqWwCLim02qLyv2EH9Rg3iwrTE2Lfzc731WX4HnM/wPKC0pCXQG
	ijithQS4zG3zs8MuwFJVN4kYFyJzMLi4/qMJ3njVl2kIX/aHIWgzTXsp3k/IJnDq1aO3KlfvCa0fT
	D4jcOLqOGYi6KCaauPaXq//i0LraeUapYXEIn0tv+ENEaigEzTsGdv5Jx6n0jJeMmvWGVgscuqWsP
	Fol8AniQtY9M4KDdlAfeBNnTJCT8HwDFVsBO5lw07ydDbodGev0Y35Op5VJ/71G0yfYtAi7dohShF
	l032mRlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkjWE-0000000E74n-20ad;
	Thu, 14 Mar 2024 11:45:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkjWB-0000000E732-2K0n;
	Thu, 14 Mar 2024 11:45:04 +0000
X-UUID: 47ff1448e1f811ee9aa9374d6d45775a-20240314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UxJYj8Ub0WqcViLUsXIUaPYc9DwJ148RUl4hICOZhNU=;
	b=n+gXxgNB4zKf+GXn/ZIyaQ8x6+cMsF1tKzhiMxRw3LY7QZyOF3/lkllOj0BZXbKmud6FGamawwgpM2Tll5TwDvO8bRUDDJyKcRfITW/zvwCqb9b/vSp2EvEF2KCfjJo7769llbiPjDKv90KoAXtJu4nKvlC70geV859jFVUmncY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:6c0088b7-7637-4875-8b23-6bfb72e6bff3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:9c09e5ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 47ff1448e1f811ee9aa9374d6d45775a-20240314
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1887039978; Thu, 14 Mar 2024 04:44:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Mar 2024 19:44:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Mar 2024 19:44:53 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,0/4] media: mediatek: vcodec: fix ctrl request complete fail
Date: Thu, 14 Mar 2024 19:44:48 +0800
Message-ID: <20240314114452.17532-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_044503_623536_9F242D2B 
X-CRM114-Status: UNSURE (   8.27  )
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

Moving v4l2_ctrl_request_complete to before of function
v4l2_m2m_buf_done to make sure the status of request correctly.

Replace v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove to
make sure the src buffer won't be removed for some unknown
reason leading to buffer done error.

Patch 1 setting request complete before buffer done
Patch 3 flush decoder before remove all source buffer
Patch 2 change flush decode from capture to output when stream off
Patch 4 replace v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
---
compared with v1:
- add patch 2/3/4 to fix timing issue.
---
Yunfei Dong (4):
  media: mediatek: vcodec: setting request complete before buffer done
  media: mediatek: vcodec: change flush decode from capture to output
    when stream off
  media: mediatek: vcodec: flush decoder before remove all source buffer
  media: mediatek: vcodec: replace v4l2_m2m_next_src_buf with
    v4l2_m2m_src_buf_remove

 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 52 +++++++++----------
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  3 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 28 +++++++---
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 28 +++++-----
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  3 +-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  3 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 37 ++++++-------
 .../mediatek/vcodec/decoder/vdec_msg_queue.h  |  2 +
 8 files changed, 84 insertions(+), 72 deletions(-)

-- 
2.18.0


