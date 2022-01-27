Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337D2C43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 02:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tMWeqc6UXukqX1npSUc1KooMFk6w773WAYmXY49jj4o=; b=OYBuX3TijouwCP
	Nhy4SRpRFbGd4hAIHdZRuJJ0VdPcFjJlLBLxc+lDf/HD31AjQGOlKR1q7wItWftDu+BglvOE75Y6P
	UHc61pNcvJlshKnQfrXBUsSfYxTAxdsJkVq6OJE2hws2OXXngX1PF4ZLLhemg2ttpBi2yTom4b8wx
	GaAb5/+NX3rQ6pg30oYPVHZFF+aF/y3Nv7asW4rI4yrL81ukLPRdMsY2UpD+r3vkaAzEUgp8Mxpn1
	K2q+CTEv0PsN0AbTTxAQVh0S5rzEswxCkO7OxNc7iVhRZlnNTkKzV86TY3DUj1egCUBjp8AqYOe0u
	iZ3e5NgS+tkRQOpmUKHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCuxH-00E9MH-4k; Thu, 27 Jan 2022 02:56:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCux1-00E9Ax-9M; Thu, 27 Jan 2022 02:55:56 +0000
X-UUID: d6fdafc5b8bf42ae8aefb61a03168fd9-20220126
X-UUID: d6fdafc5b8bf42ae8aefb61a03168fd9-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 625766493; Wed, 26 Jan 2022 19:55:52 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 18:55:50 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 10:55:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Jan 2022 10:55:46 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1, 0/8] support mt8195 decoder
Date: Thu, 27 Jan 2022 10:55:36 +0800
Message-ID: <20220127025544.10854-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_185555_353600_B37518BB 
X-CRM114-Status: GOOD (  10.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Firstly, add mt8195 soc lat hardware and compatible, then add documents.
For vp8 only support MM21 mode, H264/vp9 support MT21C, need to separate
them. Next, initialize vp9 stateless decoder parameters. Lastly, enable
H264 inner racing mode to reduce hardware latency.

Patch 1~4 add mt8195 soc lat hardware and compatible, then add documents.
Patch 5 using different format for different codecs.
Patch 6 prevent kernel crash when scp reboot.
Patch 7 init vp9 stateless decoder parameters.
Patch 8 enable H264 inner racing mode to reduce hardware latency.
---
This patch depends on "support mt8186 decoder"[1]

[1]  https://patchwork.kernel.org/project/linux-mediatek/cover/20220122075606.19373-1-yunfei.dong@mediatek.com
---
Tinghan Shen (1):
  media: mtk-vcodec: prevent kernel crash when scp ipi timeout

Yunfei Dong (7):
  dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for lat soc
  media: mtk-vcodec: Add to support lat soc hardware
  dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8195
  media: mtk-vcodec: Adds compatible for mt8195
  media: mtk-vcodec: Different codec using different capture format
  media: uapi: Init VP9 stateless decode params
  media: mtk-vcodec: Add to support H264 inner racing mode

 .../media/mediatek,vcodec-subdev-decoder.yaml | 50 +++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 41 +++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  8 +++
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 12 +++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 50 +++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 11 ++++
 .../mtk-vcodec/vdec/vdec_h264_req_multi_if.c  | 23 +++++++--
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  5 ++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  8 +++
 10 files changed, 202 insertions(+), 8 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
