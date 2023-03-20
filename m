Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91D3C7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 10:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=44gwnn6etR42gJ4ly/JUnLCZiquXaAUZTr3W/QViEQ8=; b=vOwwJXfHtk52eMLnCZaKSaTFAo
	bCMhhmKIj3U0I5SJsDKaDYrlaQPyDAwCQheVPivwPe9lts1EoBfOxImhjDOYDA9Xi3fNQN1WRGQVU
	H/KRfIln8w1Ct9D6h/WU7RLlGfk3iEL2lmre9UvztuyVHeA8Pdkn8KL2fD8lmjFvhNmHq4Mg4RDgL
	cQyz2EVY5ofEAsJXqB2Th86paX+Kjbui5Ut6aUyOOPLXTzD17P2nTnLh8IOG2vgcyyGQqKiEdj6w2
	lHfy2xUxDYx6TY+gicJKcWFMGMXb6L8lM/PVzIkgOTbSWeY+Y1drgnNztq6B31Zjz9QhTZy0QdUhF
	hIkYKIBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCui-008f3t-1X;
	Mon, 20 Mar 2023 10:38:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peCue-008ezD-0N;
	Mon, 20 Mar 2023 10:38:50 +0000
X-UUID: 6292e522c70b11ed86fbcd8805c7ac66-20230320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=44gwnn6etR42gJ4ly/JUnLCZiquXaAUZTr3W/QViEQ8=;
	b=Z5br3u9jkP6hEhnnUKsl/CEYr67C81mQGwjXWZ2uDrlIlzWiMoNHAoDCNH9g1ql+G2gGiiI8WE/0Zr7oLQW4EWNvif6/R4t4O7nmcFtHiI9hsJlqVv+Cw7f2XAx5YYAaZP5wssh/9IUjy5vVXaEbR6ClE6XlKjbq18yiPGgkSBw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:bb3233e1-2b7c-4b9c-a8a9-a75288564c51,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:abb5c8b3-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 6292e522c70b11ed86fbcd8805c7ac66-20230320
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1784345689; Mon, 20 Mar 2023 03:38:43 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 20 Mar 2023 18:28:40 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 20 Mar 2023 18:28:39 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/6 RESEND] media: mediatek: vcodec: Add debugfs file for decode and encode
Date: Mon, 20 Mar 2023 18:28:32 +0800
Message-ID: <20230320102838.8313-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_033848_182751_29CBC5C8 
X-CRM114-Status: GOOD (  10.83  )
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

Need to change kernel driver to open decode and encode debug log at current period,
it's very unreasonable. Adding debugfs common interface to support decode and encode,
using echo command to control debug log level and getting useful information for each
instance.

patch 1 add debugfs common interface.
patch 2~4 support decode.
patch 5~6 support encode
---
Yunfei Dong (6):
  media: mediatek: vcodec: Add debugfs interface to get debug
    information
  media: mediatek: vcodec: Add debug params to control different log
    level
  media: mediatek: vcodec: Add a debugfs file to get different useful
    information
  media: mediatek: vcodec: Get get each instance format type
  media: mediatek: vcodec: Change dbgfs interface to support encode
  media: mediatek: vcodec: Add encode to support dbgfs

 .../media/platform/mediatek/vcodec/Makefile   |   6 +
 .../mediatek/vcodec/mtk_vcodec_dbgfs.c        | 157 ++++++++++++++++++
 .../mediatek/vcodec/mtk_vcodec_dbgfs.h        |  48 ++++++
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |   4 +
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   4 +
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |   2 +
 .../mediatek/vcodec/mtk_vcodec_util.c         |   8 +
 .../mediatek/vcodec/mtk_vcodec_util.h         |  25 ++-
 8 files changed, 251 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h

-- 
2.25.1


