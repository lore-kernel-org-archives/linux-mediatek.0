Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C3CC0032E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 03:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xp1z/ij/6MEXRS02xVyH+bWbshJokuMQpgZ/n9ooiu0=; b=q7hVUcHOSTAFoxVjkqxSJ3nyD9
	cdcFZyWFpo4lhXhIHs+1pWP4KoyDkcD9w5GyAY9UtVQNFyIjjItyrcCiKUxCdzCOIuZKZaBVee8Xy
	tA7VLQgq+uN3SoVqb8ld0QN+LPhRhnxMbZuTtE0h4XtCAHclCGkHsK5KUeUuoE2NAynfhi5QcUWSK
	GxSugSgN7HGDdFY1zI/+Vex/7LwFKOCP69FEOFhn6soOltaV5Lz9l0GPZdRCdWDdx/THpl8shBndO
	brJKU2eP4uLrVlJ1wBfZRZoLW3Ex/YahBbwfPo7roTyG1e1OkX2DP6aIQSO1D28BsLUnjXppSHkd8
	ZniU6GyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qulHO-006IGy-0g;
	Mon, 23 Oct 2023 03:06:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qulHJ-006IFE-2x;
	Mon, 23 Oct 2023 03:06:55 +0000
X-UUID: 32c7f364715111ee86758d4a7c00f3a0-20231022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Xp1z/ij/6MEXRS02xVyH+bWbshJokuMQpgZ/n9ooiu0=;
	b=jandzS9H9xMBJ0liixBGr1LMN+qNjRp39HFwYlG8xqUNffW4KDhRBntcwul5Mzr0xk+9LumjeO18+IGeMbbWH5app9dJ8dOrQhG5z3GlX7d9AXSGVKQNtBc6wAM1iY+eA9isiBfrcj5L2fsNpIDHVOqKyOUre5fAIfbCwQfdb/0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:74030e9b-61a5-4913-8ab5-1d4df8caa846,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:296230d7-04a0-4e50-8742-3543eab8cb8e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 32c7f364715111ee86758d4a7c00f3a0-20231022
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1223564952; Sun, 22 Oct 2023 20:06:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 11:06:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 11:06:41 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve
 Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,0/7] media: mediatek: vcodec: Set the correct profile and level for each platform
Date: Mon, 23 Oct 2023 11:06:33 +0800
Message-ID: <20231023030640.16393-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_200653_960284_8B547CBC 
X-CRM114-Status: UNSURE (   8.95  )
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

The supported maximum resolution, bit and frame rate of different platform
for each spec are not always the same, need to set the correct level and
and profile values according to the chip name.

patch 1 get the chip name for each platform
patch 2~3 set h264 and h265 level
patch 4~5 set h264 and h265 profile
patch 6~7 set vp9 level and profile

changed with v1:
- Change the commit message for each patch.
- Change the supported level for mt8195 and mt8192
---
Yunfei Dong (7):
  media: mediatek: vcodec: Get the chip name for each platform
  media: mediatek: vcodec: Set the supported h264 level for each
    platform
  media: mediatek: vcodec: Set the supported h265 level for each
    platform
  media: mediatek: vcodec: Set the supported h264 profile for each
    platform
  media: mediatek: vcodec: Set the supported h265 profile for each
    platform
  media: mediatek: vcodec: Set the supported vp9 level for each platform
  media: mediatek: vcodec: Set the supported vp9 profile for each
    platform

 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |  24 +--
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  26 +++
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  14 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 168 +++++++++++++++++-
 4 files changed, 208 insertions(+), 24 deletions(-)

-- 
2.18.0


