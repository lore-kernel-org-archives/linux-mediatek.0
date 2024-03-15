Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B303C54E66
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 07:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yWtLl6WaCIrsB4FIY5b+16SN3rcRg3wXKdgtsLrlIEc=; b=nv6X9pBpRdKudOGu9qrVWWWwRZ
	ezX49EaVwEJ5vQY3ByxGaeH+klT+E7EySPyw96ZaTt7+ZwB3DMBR7VveGJ9i18ZZ8FYnDaxXdbtKY
	0/GeXmf99FQHPPdrUbSs0veens7ykGaGF0OJu800K3bZLUJbjJBDe1NsSZnssEqGH6AZnMWX5kFOC
	VfM2jRfEtJjocM1uf8vP8gJT3INd82Z6wUvkRk8JwpxXEJG9F1nvEKj1elz/sHHr2sgJiFF8rUVhw
	9f+WF+4iajdKR80aP3g1pA+PKJiBxwP7hPxBoglKnjkuEgUZey0N6QJxCj2kN0yowPAuP+WoJaVTT
	z3gzXnnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl1xk-0000000Gyf1-03kh;
	Fri, 15 Mar 2024 07:26:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl1xg-0000000GycJ-09JB;
	Fri, 15 Mar 2024 07:26:41 +0000
X-UUID: 59efb55ee29d11ee9aa9374d6d45775a-20240315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yWtLl6WaCIrsB4FIY5b+16SN3rcRg3wXKdgtsLrlIEc=;
	b=O+tn2mIrDZOwRoZT03BsfOO7jzzD9zEehK2+jMQSl1EcaHWZyoNdxCCJQ6SSpdGVyhOSyUl1rglnM6LLGdkRsvIaem6Xu457vdunq62YjUnoEKOA7PK4aqRGTZbdfDFlKBC3AMQR0hMS1VRUfE92poDV1IWK6Zz+Y3J6Qy1qyis=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:cf6104a9-2999-45a4-9bd0-31d80b6706bd,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:d36b0985-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 59efb55ee29d11ee9aa9374d6d45775a-20240315
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1172777414; Fri, 15 Mar 2024 00:26:34 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Mar 2024 15:26:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Mar 2024 15:26:30 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] media: mediatek: vcodec: add decoder command to support stateless decoder
Date: Fri, 15 Mar 2024 15:26:29 +0800
Message-ID: <20240315072629.27738-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.498300-8.000000
X-TMASE-MatchedRID: H6JCIvDuX7+GVqG4eYPDVkZakoam9+aepQH4ogtVQP2xK/qamqYywXY3
	TcMnBmkfThbvLLI8RvP+WuUgR5Gm1cJHVFWeMALEHcQQBuf4ZFsuhg66Itb65fzaSz3Z/4aaecZ
	f3B8j81qQ5zXuXE7cooAy6p60ZV62fJ5/bZ6npdiyO81X3yak84h7iKx2XmBbBXO9QsFmS8iQqa
	5F+eWEV9XjWmP/eZGnc0jrJpxlhMB+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.498300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D8F9687C570A89AD469DD8A683BE20B1C7ACB5943D3B5497361E2F29E5FEB1372000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_002640_189075_04E573E8 
X-CRM114-Status: GOOD (  12.21  )
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

The supported decoder commands are different for stateless and
stateful architecture. Adding stateless decoder commands to fix
below v4l2-compliance test error.

Codec ioctls:
    VIDIOC_ENCODER_CMD returned -1 (Inappropriate ioctl for device)
    VIDIOC_TRY_ENCODER_CMD returned -1 (Inappropriate ioctl for device)
 test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
    VIDIOC_G_ENC_INDEX returned -1 (Inappropriate ioctl for device)
 test VIDIOC_G_ENC_INDEX: OK (Not Supported)
    VIDIOC_DECODER_CMD returned -1 (Invalid argument)
    VIDIOC_TRY_DECODER_CMD returned -1 (Invalid argument)
    VIDIOC_TRY_DECODER_CMD returned -1 (Invalid argument)
    fail: v4l2-test-codecs.cpp(126): ret
 test VIDIOC_(TRY_)DECODER_CMD: FAIL

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 65 +++++++++++++++++--
 1 file changed, 59 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index ba742f0e391d..90579dd92cae 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -80,21 +80,20 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_dec_ctx *ctx,
 	return &ctx->q_data[MTK_Q_DATA_DST];
 }
 
-static int vidioc_try_decoder_cmd(struct file *file, void *priv,
-				struct v4l2_decoder_cmd *cmd)
+static int mtk_vcodec_stateful_try_decoder_cmd(struct file *file, void *priv,
+					       struct v4l2_decoder_cmd *cmd)
 {
 	return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
 }
 
-
-static int vidioc_decoder_cmd(struct file *file, void *priv,
-				struct v4l2_decoder_cmd *cmd)
+static int mtk_vcodec_stateful_decoder_cmd(struct file *file, void *priv,
+					   struct v4l2_decoder_cmd *cmd)
 {
 	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
 	struct vb2_queue *src_vq, *dst_vq;
 	int ret;
 
-	ret = vidioc_try_decoder_cmd(file, priv, cmd);
+	ret = mtk_vcodec_stateful_try_decoder_cmd(file, priv, cmd);
 	if (ret)
 		return ret;
 
@@ -128,6 +127,60 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
 	return 0;
 }
 
+static int mtk_vcodec_stateless_try_decoder_cmd(struct file *file, void *priv,
+						struct v4l2_decoder_cmd *cmd)
+{
+	return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, cmd);
+}
+
+static int mtk_vcodec_stateless_decoder_cmd(struct file *file, void *priv,
+					    struct v4l2_decoder_cmd *cmd)
+{
+	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+	int ret;
+
+	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, cmd);
+	if (ret)
+		return ret;
+
+	mtk_v4l2_vdec_dbg(3, ctx, "decoder cmd=%u", cmd->cmd);
+	switch (cmd->cmd) {
+	case V4L2_DEC_CMD_FLUSH:
+		/*
+		 * If the flag of output buffer is set with V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF,
+		 * this command will prevent dequeueing the capture buffer containing the last
+		 * decoded frame. Or do nothing
+		 */
+		break;
+
+	default:
+		mtk_v4l2_vdec_err(ctx, "invalid stateless decoder cmd=%u", cmd->cmd);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int vidioc_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
+{
+	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+
+	if (ctx->dev->vdec_pdata->uses_stateless_api)
+		return mtk_vcodec_stateless_try_decoder_cmd(file, priv, cmd);
+	else
+		return mtk_vcodec_stateful_try_decoder_cmd(file, priv, cmd);
+}
+
+static int vidioc_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
+{
+	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+
+	if (ctx->dev->vdec_pdata->uses_stateless_api)
+		return mtk_vcodec_stateless_decoder_cmd(file, priv, cmd);
+	else
+		return mtk_vcodec_stateful_decoder_cmd(file, priv, cmd);
+}
+
 void mtk_vdec_unlock(struct mtk_vcodec_dec_ctx *ctx)
 {
 	mutex_unlock(&ctx->dev->dec_mutex[ctx->hw_id]);
-- 
2.18.0


