Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E44C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 12:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CsMx9E4F3h5K/nRRteF98d+VXIrGq5r1iJm2o4KrOvQ=; b=yA/HsdfLLJ+4XoWS4bBxG9TZuz
	BIV7EuNaqYLH7+fXauPAGIeL+XZv9vwfYHaum46eLLb7R9MHlH5wAPSRJAPYhzQ1RUMqO7hlpH9Jz
	Z22DVkys4HvsqXpN7IxyLjKtdeNRaJ/vsxxyynTaX+O1qOc7w9mQE3JDI1WZ8T9OxRiSBRqH78Nsl
	qF0Ae6rhyoksp3u6PLBK4c/v9gzTXWpn22Oy4GizIZWNFZFVKV6FvdA4rIu2lQC5QcWWs3lcCxACN
	lS/JP+XD78UK4E0Q5L7rLPwTstKx3QK89LSGGFx+ul0FqTy37yjDiZOqolMXdOch6LbfWJauamshD
	JYGaox3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNkj-00G5zl-18;
	Mon, 17 Apr 2023 12:14:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poNkg-00G5xh-1C;
	Mon, 17 Apr 2023 12:14:35 +0000
X-UUID: 676e86e0dd1911ed8687db9d93187ff1-20230417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CsMx9E4F3h5K/nRRteF98d+VXIrGq5r1iJm2o4KrOvQ=;
	b=iYpV0Mw3qLXkty7S5MYWNmIc7XLZ66AbzgX8SgrG4uyaoSUXqfzab7KHcLzlm0gDOYPuBqdvZbtQRa42hLADHNZ7hHirIT2TTWdzrv3oSvXy3L7Qcx6e1iTBLhHS//NpnjySiyyWxEGhMfqdTnwgVOGW3e8hpTw4xAuL8MW4vNU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:8e2bbdef-8b5f-4b3f-9302-5bada3beeffe,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:90639aa1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 676e86e0dd1911ed8687db9d93187ff1-20230417
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 826418759; Mon, 17 Apr 2023 05:14:29 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 17 Apr 2023 20:13:52 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 17 Apr 2023 20:13:51 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho
	<stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,0/4] media: mediatek: vcodec: Fix decoder under flow and plt test fails randomly 
Date: Mon, 17 Apr 2023 20:13:46 +0800
Message-ID: <20230417121350.32186-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_051434_409363_FC7826E3 
X-CRM114-Status: UNSURE (   8.94  )
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

1: Getting decoder under flow error randomly when do stress test with youtube;
2: Video display black when do plt test with one night.

patch 1 avoid unneeded error logging.
patch 2 using decoder status instead of core work count.
patch 3 move core context from device to each instance.
patch 4 using empty lat buffer as the last one to flush decoder.
---
changed with v1:
- re-write commit messgage for patch 1
- squash v1 patch 2 to v1 patch 3 for patch 2
- squash v1 patch 4 to v1 patch 6 for patch 4
---
Yunfei Dong (4):
  media: mediatek: vcodec: Avoid unneeded error logging
  media: mediatek: vcodec: using decoder status instead of core work
    count
  media: mediatek: vcodec: move core context from device to each
    instance
  media: mediatek: vcodec: using empty lat buffer as the last one

 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |   1 -
 .../vcodec/mtk_vcodec_dec_stateless.c         |   2 +-
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   2 -
 .../vcodec/vdec/vdec_h264_req_multi_if.c      |   6 +-
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         |   4 +-
 .../platform/mediatek/vcodec/vdec_msg_queue.c | 105 ++++++++----------
 .../platform/mediatek/vcodec/vdec_msg_queue.h |  28 ++++-
 7 files changed, 74 insertions(+), 74 deletions(-)

-- 
2.18.0


