Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870BBC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 04:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WRqRHvlA2KYk4wE45lxEItT4JI6ZXG0vm+dK2wytYdk=; b=yLipPNakML5qB/
	hpohZ24ywELex94qcSeeur1Ml7X+9blSZrdO1ffLt6yPuFiFdzF8PoS+bnTuijq/jXvGzM1tLVj/3
	lfaZ7daVs8JQCe4qS3VdXW79XG75zyC5Vth3UMNNEoBu7+NVC7usCOLdAKqDViHVYMRLEFaTgkR4m
	sKNv3WqSJlBuqS7nEHn8QP2Z9lBWEGVaxqPaBLRfSZTVEMxM99MDHXIW0zfSHfGinb8X5t8Sjayrp
	N1euglGlRd9Al4z3x+i+A4B2GE/YFavK4teiu316iDQThdLlkIdxx0yeR6uu1c2Vc4UD2UHqjlFfp
	HTk43x8HicA3DzPOuX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDIWq-000H4G-E0; Fri, 28 Jan 2022 04:06:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDIWd-000H0V-9U; Fri, 28 Jan 2022 04:06:16 +0000
X-UUID: 5850840a3d4b41398dc3c95905cf6296-20220127
X-UUID: 5850840a3d4b41398dc3c95905cf6296-20220127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1036471005; Thu, 27 Jan 2022 21:04:47 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 19:54:45 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 28 Jan 2022 11:54:43 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 11:54:41 +0800
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
Subject: [PATCH v2, 0/7] support mt8195 decoder
Date: Fri, 28 Jan 2022 11:54:33 +0800
Message-ID: <20220128035440.24533-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_200615_348572_1B5BA173 
X-CRM114-Status: GOOD (  11.66  )
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
them. Lastly, enable H264 inner racing mode to reduce hardware latency.

Patch 1~4 add mt8195 soc lat hardware and compatible, then add documents.
Patch 5 using different format for different codecs.
Patch 6 prevent kernel crash when scp reboot.
Patch 7 enable H264 inner racing mode to reduce hardware latency.
---
This patch depends on "support mt8186 decoder"[1]

[1]  https://patchwork.kernel.org/project/linux-mediatek/cover/20220122075606.19373-1-yunfei.dong@mediatek.com
---
changed with v1:
- separate "Init VP9 stateless decode params" patch and remove it to another one.
- add reviewed-by in patch v3/v4/v6
---
Tinghan Shen (1):
  media: mtk-vcodec: prevent kernel crash when scp ipi timeout

Yunfei Dong (6):
  dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for lat soc
  media: mtk-vcodec: Add to support lat soc hardware
  dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8195
  media: mtk-vcodec: Adds compatible for mt8195
  media: mtk-vcodec: Different codec using different capture format
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
 9 files changed, 194 insertions(+), 8 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
