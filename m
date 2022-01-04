Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A66CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 08:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8qFM0hPqyrlYwcw46XPIBqX6Zso3RVoovuiWC9Mdzo=; b=FV/hmJ3lMR3oKj
	OsyWi5Zly6VpDDFmtlN8Ke2bmcaaZBwrCC43rdJySuFBZhvvoCoVxCxApCLgztg0tHUgJVacvilnj
	X55L+Fy5C+aTUmM98gg6TBZWcierZjtx28p4rTPZ/jBs6o+iVl14aOx41e6RWVGgo6ExepHwP/7X8
	ZbAVLs0XByWSubEPkCXx4LtdMbTQ3sRnyQmRg0LWoKmTjLfdpALZUXZYvSauYHsloq+YI/WKZvfAd
	/KDCxfQIIQq43iwhjEMuZ4QWQq9wYKWrlDU6EiI5WOCPF585oPu9CDNmw0GA+0qtkI7SQpdEEe1it
	Xd20Y1NZTRPD4YD9sU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4esz-00AeKF-PH; Tue, 04 Jan 2022 08:09:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4eoA-00Ably-5g; Tue, 04 Jan 2022 08:04:39 +0000
X-UUID: 65c9aa251f44461ba13c94d3c660a281-20220104
X-UUID: 65c9aa251f44461ba13c94d3c660a281-20220104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1032740234; Tue, 04 Jan 2022 01:04:34 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 00:01:56 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 16:01:54 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Jan 2022 16:01:52 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3, 09/13] media: mtk-vcodec: disable vp8 4K capability
Date: Tue, 4 Jan 2022 16:01:34 +0800
Message-ID: <20220104080138.7472-10-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220104080138.7472-1-yunfei.dong@mediatek.com>
References: <20220104080138.7472-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_000438_242042_F118BF24 
X-CRM114-Status: GOOD (  12.48  )
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

For vp8 not support 4K, need to disable it.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 519f2b9d9b5b..34ee4a0092ff 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -532,7 +532,8 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
 		fsize->stepwise = dec_pdata->vdec_framesizes[i].stepwise;
 		if (!(ctx->dev->dec_capability &
-				VCODEC_CAPABILITY_4K_DISABLED)) {
+				VCODEC_CAPABILITY_4K_DISABLED) &&
+				fsize->pixel_format != V4L2_PIX_FMT_VP8_FRAME) {
 			mtk_v4l2_debug(3, "4K is enabled");
 			fsize->stepwise.max_width =
 					VCODEC_DEC_4K_CODED_WIDTH;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
