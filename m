Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81622C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Dec 2022 07:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RV9FBZj19jlJj76zizzD8sDNUjqQGz9+DRIs5bQdvgo=; b=l6O79Od8x6OGwxa9icXusaT6Gs
	0lCXb+X1nr1/r1Z4kH7p60r8sggVhnO9C9VTj0/gTQb9A5BYh818l8jS5GZIkul8TUadGCOow1IO2
	354qK+AE03Whfc0dmrlHspkX/O4PX/JGwZPfQKfirD8F4AeX1NiWUZ4mqm7h5ixibkQE+dVpaaeJI
	b9FQd0KdcykX9zBIQICo1/yJbrduieGBE557+HPxtqrGziP0fp4TMxDwvGXrJjkfPsE8O5gbBxi7D
	ZjrErgMj1FL1TG1iSqCWrB3pz6RkacyOGoydcKP0ssjGWD80VHVD+Qdwzam/DUssVZ8WVlq17OuJk
	FTz4BFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3uWq-00FJzV-Pw; Sat, 10 Dec 2022 07:44:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3uWn-00FJx0-IV; Sat, 10 Dec 2022 07:44:10 +0000
X-UUID: c9d1b689b5f64e0aae7fba58929a723a-20221210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RV9FBZj19jlJj76zizzD8sDNUjqQGz9+DRIs5bQdvgo=;
	b=dpGonxXrGs6UCuur090hQkAr6Q9Ja6LSvMw4j9VSg+YOmtyXc5d+p4dlQyyCHWP+IJeeLfYzpG2+3E+OJXKnpMxZ8BMi9en5AvnBZAfxOm/y9bTyBDbhEJWelks7sUgsyXRujnMvDXbI2M2sL9TO674qpnvvulTTimthE1ClxI4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:03700698-16c1-4a3d-88a9-76d9a2521df6,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:dcaaed0,CLOUDID:8dc231d2-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c9d1b689b5f64e0aae7fba58929a723a-20221210
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 623653073; Sat, 10 Dec 2022 00:44:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 10 Dec 2022 15:32:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Dec 2022 15:32:19 +0800
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
Subject: [PATCH 0/5] media: mediatek: vcodec: Fix power_VideoCall test fail
Date: Sat, 10 Dec 2022 15:32:13 +0800
Message-ID: <20221210073218.17350-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_234409_713993_92D7FE74 
X-CRM114-Status: UNSURE (   7.87  )
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

Random getting below error message when test power_VideoCall/control.49_vp9:
pc : __list_del_entry_valid+0xb0/0xfc
lr : __list_del_entry_valid+0xac/0xfc
sp : ffffffc020f23ce0

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
---
Yunfei Dong (5):
  media: mediatek: vcodec: add params to record lat and core lat_buf
    count
  media: mediatek: vcodec: using each instance lat_buf count replace
    core ready list
  media: mediatek: vcodec: move lat_buf to the top of core list
  media: mediatek: vcodec: add core decode done event
  media: mediatek: vcodec: remove unused lat_buf

 .../platform/mediatek/vcodec/vdec_msg_queue.c | 74 +++++++++++++++++--
 .../platform/mediatek/vcodec/vdec_msg_queue.h | 13 ++++
 2 files changed, 81 insertions(+), 6 deletions(-)

-- 
2.18.0


