Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C25C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 07:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c8zIgAIM9twVEzzFeO8jvD5x33i309731TYIWFJD0ec=; b=Qh7/Nf9ogcUiuaF8bv3+BT6RKt
	0s1/jHRaIktNz2igMo5n5jpiq5CJw91Hkpp6dfY5I3SfmNzxLnr51jY/+XKOFcGkp3WmCxWCmUl9i
	9a7A2ZhJjIEf9vemwvwm/AtX4nrq9e86wXIX7VVD2PU2LBMlh0vUQDe5j8ywQmxIeLv+fgGtvnQH4
	wR1+xJGBcy8oeqUlBCS0nZxm/aaOW9TD5VyWuFjFLpE69DtRnAmKH/k8AW1mlYtKHnmX8dgZ+YMLw
	5ZvhCfc9tjzOUBX7WOArB9wUh/QPaYafsd3yRu5WYxaDrOsiq30sk+w34zkwC8LBcc7hlWhmCnPBK
	MYpIA4Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7mq-00AfOY-2m; Wed, 01 Feb 2023 07:44:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7mn-00AfMf-I6; Wed, 01 Feb 2023 07:44:07 +0000
X-UUID: 2db875dca20411eda08d4d6090ec5a5c-20230201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=c8zIgAIM9twVEzzFeO8jvD5x33i309731TYIWFJD0ec=;
	b=U+USV6SU1X44gtZwSiitysIs4ogeNSZNXFHD+hLVw9W0ObNrzXKENaK9xtdi0sBjOfEoHrQFojwd8ikXOMNi57KXFlBqlaWGxNqmhmbZ/xc0HCXTzCmnj0L0wWtbp7CcZDLzgJvC/pZPsoG5WoGd5ZYz2GSAtVnnNkzIKocAUoA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:0813d975-01d3-49ef-9eaa-a9ab028715b5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:6818908d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 2db875dca20411eda08d4d6090ec5a5c-20230201
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1756086184; Wed, 01 Feb 2023 00:43:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 1 Feb 2023 15:33:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 1 Feb 2023 15:33:17 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho
	<stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,0/7] media: mediatek: vcodec: Fix power_VideoCall test fail
Date: Wed, 1 Feb 2023 15:33:09 +0800
Message-ID: <20230201073316.27923-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_234405_614075_1AF319E5 
X-CRM114-Status: GOOD (  11.54  )
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

Random getting below error message when test power_VideoCall/control.49_vp9:
pc : __list_del_entry_valid+0xb0/0xfc
lr : __list_del_entry_valid+0xac/0xfc

The lat_buf in core list won't be deleted when one instance decode done.
Will access invalid released lat_buf list when queue work continue to decode.
Firstly, remove all unused lat_buf to the top of core list, making sure
these buffers can be decoded in highest priority; lastly, remove all unused
lat_buf when the instance is freed.

patch 1 add params to record lat and core lat_buf count.
patch 2 using each instance lat_buf count replace core ready list.
patch 3 move lat_buf to the top of core list.
patch 4 add core decode done event.
patch 5 remove unused lat_buf.
patch 6 making sure queue_work successfully
patch 7 change lat thread decode error condition
---
changed with v3:
- forgot to add reviewed-by for patch: 1/2/4/5/7
changed with v2:
- fix seek fail for patch 3
changed with v1:
- remove mutex for atomic for patch 1
- add patch 6 to make sure queue_work successfully
- add patch 7 change lat thread decode error condition
---
Yunfei Dong (7):
  media: mediatek: vcodec: add params to record lat and core lat_buf
    count
  media: mediatek: vcodec: using each instance lat_buf count replace
    core ready list
  media: mediatek: vcodec: move lat_buf to the top of core list
  media: mediatek: vcodec: add core decode done event
  media: mediatek: vcodec: remove unused lat_buf
  media: mediatek: vcodec: making sure queue_work successfully
  media: mediatek: vcodec: change lat thread decode error condition

 .../vcodec/mtk_vcodec_dec_stateless.c         |  6 +-
 .../vcodec/vdec/vdec_h264_req_multi_if.c      |  2 +-
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         |  2 +-
 .../platform/mediatek/vcodec/vdec_msg_queue.c | 95 ++++++++++++++++---
 .../platform/mediatek/vcodec/vdec_msg_queue.h | 12 +++
 5 files changed, 100 insertions(+), 17 deletions(-)

-- 
2.18.0


