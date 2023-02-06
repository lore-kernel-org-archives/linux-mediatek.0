Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E75C05027
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 12:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DimnXih34BB0ZAqnseU6Ac647p2BGjjyOcF2FMmE3cc=; b=jlK2YRgjXCMKdo9LKHCV86J2YR
	QnEEVpUSi6nC4Zj1l+YFKbnwzu/4Kwjp94kO3gEhEA+I1CPKfZLEq98quZyvOBAqGtODDw7Jre128
	tZCW4aU8vCV5L028QZggufscmetOk/U2dAPPgWoQ4ARHnX3qn1B1DDltfClmKGUmNOgsxP3JOnOnH
	bLTJxYokIN9+rGDrKWycb1OoNEF+YBTFJBaIx62BLhqahnJetNbULVeplwEoIjbCP7dz3NvYjAhBP
	0TUpcL9+Qvgsn7ulHyzwCpV5M5RyeXOqDkAB4Bq2C9s2MqzU9g3ynToWbyBzSeb7/UoQb09bNJC4f
	6DQflfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0Hm-008Pvq-TT; Mon, 06 Feb 2023 12:07:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0Hk-008PuQ-2b; Mon, 06 Feb 2023 12:07:49 +0000
X-UUID: dd121cd4a61611eda08d4d6090ec5a5c-20230206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DimnXih34BB0ZAqnseU6Ac647p2BGjjyOcF2FMmE3cc=;
	b=cY4I6scHpN1X3LHkku21TawjWRRhfBIzwmq2DMtZ3iKwXvXa9GBhsWVagBDrXDVxwXWgDwUxVltFZqP8G3Sxb0FpI7gSmfNGNXOpuYxwicGJ/D6K/rTYx9/R15CmUZRtftEwU3Hkwm665kwE6s5oJhuV/fMnK332LipgRE4dyAU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:07f6ed17-da52-4cf2-8135-f3148e822f9d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.19,REQID:07f6ed17-da52-4cf2-8135-f3148e822f9d,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:885ddb2,CLOUDID:241e9df7-ff42-4fb0-b929-626456a83c14,B
	ulkID:2302062007126680ITER,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: dd121cd4a61611eda08d4d6090ec5a5c-20230206
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 254103009; Mon, 06 Feb 2023 05:07:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 6 Feb 2023 20:07:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 6 Feb 2023 20:07:08 +0800
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
Subject: [PATCH 0/6] media: mediatek: vcodec: Add debugfs file for decode and encode
Date: Mon, 6 Feb 2023 20:07:02 +0800
Message-ID: <20230206120708.19631-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_040748_132157_2C71F784 
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
2.18.0


