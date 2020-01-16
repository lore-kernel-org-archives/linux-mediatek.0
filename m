Return-Path: <SRS0=rC0f=3F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F5AC33CB1
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 08:41:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB5D02073A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 08:41:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NoKmGVEP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jKHaj+T3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB5D02073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FiXgiatXey7RKmFbiqnKVXVJb/vTY6xwlefQiMaA43M=; b=NoKmGVEPsUBKAz
	T3JoVeeniNEV/J8Gy8rSjCMwY2qhOj+FhSCgFP3bL+XVHXbzgm7negN+kLeuCkmwul1XWFnMEDnTz
	YiwBf4U6YiYJELpMCBdAcfy3wPmbB2bQtLEO8zBOc2BwtKAOaN8h5lVGx9H+J/BPK6IkC8FSYZgbH
	FZyyb73QpX2StJ7hLaY83epbFeaupp7Y5p3qw17+klex0FAdnMLvgmm0Yh9sDDFV/MYYNfjMqodq/
	kRSyWCBAlajhbM0cPng/izXRKJVdofmRmrUeeRqF051Cb96Hvc/QTIlcOyT0ZpZp5x4JZ4BOWRYdm
	84PKykzcbUeiYn1RYYOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is0iW-0003Oh-JR; Thu, 16 Jan 2020 08:41:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is0iQ-0003Cu-DM; Thu, 16 Jan 2020 08:41:26 +0000
X-UUID: 87389fc747c24af1aaad6a52d8107480-20200116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tTAYhyV1yO1eGfYT9UX2vuD8lvcZaEL8mGmAAGdJsuQ=; 
 b=jKHaj+T3dhIBYni63M+MyokiAkuAbV+2XJziAqrUzTJvQ1SSdOSqp4c0Mj67IBNAD+/ipqaSdR4xh/6pFBw6Om8y8fCoAwJ3OtUN01t/oF1k5oezCWDSipETJLbGRIRvaGEMxaZBsB5dIZxpEi6S97QJFpQt9ELfnCyDUEZhW3E=;
X-UUID: 87389fc747c24af1aaad6a52d8107480-20200116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <gtk_ruiwang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 751620400; Thu, 16 Jan 2020 00:41:14 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 Jan 2020 00:41:12 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 Jan 2020 16:40:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 16 Jan 2020 16:40:20 +0800
From: <gtk_ruiwang@mediatek.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Alexandre Courbot
 <acourbot@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Thomas Gleixner
 <tglx@linutronix.de>, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH][v2] media: mtk-vcodec: reset segment data then trig decoder
Date: Thu, 16 Jan 2020 16:41:02 +0800
Message-ID: <20200116084102.5079-1-gtk_ruiwang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_004122_485890_97AA7D46 
X-CRM114-Status: GOOD (  11.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gtk_ruiwang@mediatek.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 srv_heupstream@mediatek.com, Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: gtk_ruiwang <gtk_ruiwang@mediatek.com>

VP9 bitstream specification indicate segment data should reset to
default when meet key frames, intra only frames or enable error
resilience mode. So memset segmentation map buffer before every
decode process is not appropriate.

Reset segment data only when needed, then start decoder hardware

Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>
---
Changed in v2:
- add bit3&bit4 for kernel and vpu-firmware compatibility 
---
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    | 29 ++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index 24c1f0bf2147..083aeca288f6 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -110,7 +110,11 @@ struct vp9_sf_ref_fb {
  * @buf_len_sz_c : size used to store cbcr plane ufo info (AP-R, VPU-W)
 
  * @profile : profile sparsed from vpu (AP-R, VPU-W)
- * @show_frame : display this frame or not (AP-R, VPU-W)
+ * @show_frame : [BIT(0)] display this frame or not (AP-R, VPU-W)
+ *	[BIT(1)] reset segment data or not (AP-R, VPU-W)
+ *	[BIT(2)] trig decoder hardware or not (AP-R, VPU-W)
+ *	[BIT(3)] notify VPU set decoder behavior (AP-W, VPU-R)
+ *	[BIT(4)] do not reset segment data before every frame (AP-R, VPU-W)
  * @show_existing_frame : inform this frame is show existing frame
  *	(AP-R, VPU-W)
  * @frm_to_show_idx : index to show frame (AP-R, VPU-W)
@@ -494,12 +498,12 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *inst)
 					frm_to_show->fb->base_y.size);
 		}
 		if (!vp9_is_sf_ref_fb(inst, inst->cur_fb)) {
-			if (vsi->show_frame)
+			if (vsi->show_frame & BIT(0))
 				vp9_add_to_fb_disp_list(inst, inst->cur_fb);
 		}
 	} else {
 		if (!vp9_is_sf_ref_fb(inst, inst->cur_fb)) {
-			if (vsi->show_frame)
+			if (vsi->show_frame & BIT(0))
 				vp9_add_to_fb_disp_list(inst, frm_to_show->fb);
 		}
 	}
@@ -800,6 +804,9 @@ static int vdec_vp9_init(struct mtk_vcodec_ctx *ctx)
 	}
 
 	inst->vsi = (struct vdec_vp9_vsi *)inst->vpu.vsi;
+
+	inst->vsi->show_frame |= BIT(3);
+
 	init_all_fb_lists(inst);
 
 	ctx->drv_handle = inst;
@@ -870,13 +877,27 @@ static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 					vsi->sf_frm_sz[idx]);
 			}
 		}
-		memset(inst->seg_id_buf.va, 0, inst->seg_id_buf.size);
+
+		if (!(vsi->show_frame & BIT(4)))
+			memset(inst->seg_id_buf.va, 0, inst->seg_id_buf.size);
+
 		ret = vpu_dec_start(&inst->vpu, data, 3);
 		if (ret) {
 			mtk_vcodec_err(inst, "vpu_dec_start failed");
 			goto DECODE_ERROR;
 		}
 
+		if (vsi->show_frame & BIT(1)) {
+			memset(inst->seg_id_buf.va, 0, inst->seg_id_buf.size);
+
+			if (vsi->show_frame & BIT(2)) {
+				if (vpu_dec_start(&inst->vpu, NULL, 0)) {
+					mtk_vcodec_err(inst, "vpu trig decoder failed");
+					goto DECODE_ERROR;
+				}
+			}
+		}
+
 		ret = validate_vsi_array_indexes(inst, vsi);
 		if (ret) {
 			mtk_vcodec_err(inst, "Invalid values from VPU.");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
