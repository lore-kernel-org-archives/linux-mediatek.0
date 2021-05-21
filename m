Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DEFC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:46:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF2236109F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF2236109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGl6FCfbor4G0yRGOra1OWX49c10h4xF8FL2qxIrJSc=; b=MlqIjfsCOyP4KGDxTwXYTewAaN
	qN27ABR7UAsBNauaq9JCFjtqqeomhaKPadU2NyPz1gs815bUqIYLLE/OzJwbqBHtWmW5eSzWL3gJ/
	KCmCC5tiuKCFW6FsZhmN260+/Mw+mR/Urrvij+VDvBE5+p8y2LGsuZHTtpacjkHs+vLlPwXq4gINV
	yt5OuVI7z6zj/LV5coX6laG/0B9mexx7EzZ3fEX5ODoewXhiwWC/hxKRiVAsiQ7PShMfn0CzArg3Q
	9p45/ww/D5WKhCihQvA91OuDhEHdLN+XKHjA3iXHCsyr00cuich720f8ysRiGqZ33QcuuYF9oLA7/
	B3e5Rv5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk0nX-004VL9-Cx; Fri, 21 May 2021 08:46:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk0ml-004V77-Hg; Fri, 21 May 2021 08:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Jwe0RSR68JAdyjk/arYTkdHADdtKWkmpIASNOdagmYc=; b=auQoXC7Ldkb27gqDHfjnntI6rK
 URYw4tPs9xLfsbLmvfOR18uLioL8ubT6TiAvwTFCMX4ky5HYJd+2ij4cgHBUJfH4t2ZPyvR/mhGtD
 3+KuP73yEk66255cdSifco2Cbf4OWWzel4jM0JKghoxiwi4ZVXTz/8H5WTtkj97FwU8KlQOqZTwLA
 7gY2MBmP6evpxQTb3tmI2rZ5QQo/f1p0TmUa/QOqjQY8ITpLaGpx+wMZG7gBQznliEnDIdq/SrIWb
 6l580doNkOH3mZ1zPBa0wHAMWPWcGayklO/VzTnuaz6fgNW8FPFkYONAJ1EX+T82RYLYY0xSUU6V+
 IxSqQ5kQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk0mj-00GxSt-20; Fri, 21 May 2021 08:45:34 +0000
X-UUID: f0d002a53ce34c62ba5e1d80f9f93012-20210521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Jwe0RSR68JAdyjk/arYTkdHADdtKWkmpIASNOdagmYc=; 
 b=ZQeczDeFX0KELG1g45fL0MccgK8NMDbd5ngUVtdLFiEy2kAq3LPi3/LEZeP5VNIE1ldGiPbYbMWaSbBAnUAefuzcd/r/ZREDB1vphzegQNTxlMKAyozYcKsyq4nsE5VoXZbIeIKUBorQYzJmyD1e/WVMxZ1NlDD808Jfn6btElo=;
X-UUID: f0d002a53ce34c62ba5e1d80f9f93012-20210521
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1875068353; Fri, 21 May 2021 00:01:58 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 May 2021 00:01:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 May 2021 15:01:54 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 May 2021 15:01:53 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>, "Longfei
 Wang" <longfei.wang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig
 <frkoenig@chromium.org>, Tzung-Bi Shih <tzungbi@chromium.org>, Irui Wang
 <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,1/6] media: mtk-vcodec: venc: remove redundant code
Date: Fri, 21 May 2021 15:01:34 +0800
Message-ID: <20210521070139.20644-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210521070139.20644-1-irui.wang@mediatek.com>
References: <20210521070139.20644-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_014533_125028_177198EF 
X-CRM114-Status: GOOD (  14.02  )
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

From: Alexandre Courbot <acourbot@chromium.org>

vidioc_try_fmt() does clamp height and width when called on the OUTPUT
queue, so clamping them prior to calling this function is redundant. Set
the queue's parameters after calling vidioc_try_fmt() so we can use the
values it computed.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_enc.c   | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 4831052f475d..42ff13867940 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -443,7 +443,6 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 	struct mtk_q_data *q_data;
 	int ret, i;
 	const struct mtk_video_fmt *fmt;
-	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
 	if (!vq) {
@@ -468,20 +467,13 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 		f->fmt.pix.pixelformat = fmt->fourcc;
 	}
 
-	pix_fmt_mp->height = clamp(pix_fmt_mp->height,
-				MTK_VENC_MIN_H,
-				MTK_VENC_MAX_H);
-	pix_fmt_mp->width = clamp(pix_fmt_mp->width,
-				MTK_VENC_MIN_W,
-				MTK_VENC_MAX_W);
-
-	q_data->visible_width = f->fmt.pix_mp.width;
-	q_data->visible_height = f->fmt.pix_mp.height;
-	q_data->fmt = fmt;
-	ret = vidioc_try_fmt(f, q_data->fmt);
+	ret = vidioc_try_fmt(f, fmt);
 	if (ret)
 		return ret;
 
+	q_data->fmt = fmt;
+	q_data->visible_width = f->fmt.pix_mp.width;
+	q_data->visible_height = f->fmt.pix_mp.height;
 	q_data->coded_width = f->fmt.pix_mp.width;
 	q_data->coded_height = f->fmt.pix_mp.height;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
