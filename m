Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A71EC54E5D
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 08:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ymrk5mBiwUCU/ytZC04QGRDtL4o+ZcHTqKjjTVEao+s=; b=lt6cuWXGnxZwH3s0Y9d1jG1Z0I
	A9a0Cja5GqIcAl/l91gUGsninfAdWF4v6TJl/cVgNnH8dFH4D/kta+2GmjOs2uGrrKJfgBNK4kMRH
	xXHNo8YjT1BpuiREAbktpIIGFt2dJMWyW9pPoFwQlWCIhvtsXSufP6Sb3pQ4QFGz4joubPrnomska
	4aijh1PrEcA8su6iJLBR2WVoiaY9FvV96j2z1THUbQR5YRX4HMKqMaRLrCdcyoFClRwa2LWzP1CDq
	hj8I9bXjC0dC1LtWstrPESrj9EMgXLjuO0QW0CPE5ultG7QX+mWb2fsVX+iY+LxqmU48g5J1UHyHM
	m3I7lOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlPAz-00000002hdp-3cZu;
	Sat, 16 Mar 2024 08:13:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlPAw-00000002hcS-3g4M;
	Sat, 16 Mar 2024 08:13:56 +0000
X-UUID: 1e2576b4e36d11eeacdb61a41848c7d2-20240316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ymrk5mBiwUCU/ytZC04QGRDtL4o+ZcHTqKjjTVEao+s=;
	b=k/LSJ+5CwS6xKfszSqocImu22Twza7pP2Rxvi28l9T/LbZ3BrEc8FkCR8er8PK6kcLuH14q2M1cTL6zxeoYP6gHn9E/5xwxO+hdCb6Hn5KQzaqiUrB/SCd8zwJDfFoiow6YzNDeaGwVb6qXe1ITp49L+wg6NBU27qm938xHTpoM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:229c1db3-2a79-404d-98b6-b54ca8c7613a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:981df6ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1e2576b4e36d11eeacdb61a41848c7d2-20240316
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1254390767; Sat, 16 Mar 2024 01:13:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 16 Mar 2024 16:13:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 16 Mar 2024 16:13:45 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2] media: mediatek: vcodec: add decoder command to support stateless decoder
Date: Sat, 16 Mar 2024 16:13:44 +0800
Message-ID: <20240316081344.4262-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_011354_963468_DBF36892 
X-CRM114-Status: GOOD (  14.69  )
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
stateful architecture. Add stateless decoder commands to fix
the v4l2-compliance test error below.

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
changed with v1:
- remove the static function prefix.
- fix some messages not reasonable.
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 60 +++++++++++++++++--
 1 file changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index ba742f0e391d..c2b64a528028 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -80,21 +80,18 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_dec_ctx *ctx,
 	return &ctx->q_data[MTK_Q_DATA_DST];
 }
 
-static int vidioc_try_decoder_cmd(struct file *file, void *priv,
-				struct v4l2_decoder_cmd *cmd)
+static int stateful_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
 {
 	return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
 }
 
-
-static int vidioc_decoder_cmd(struct file *file, void *priv,
-				struct v4l2_decoder_cmd *cmd)
+static int stateful_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
 {
 	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
 	struct vb2_queue *src_vq, *dst_vq;
 	int ret;
 
-	ret = vidioc_try_decoder_cmd(file, priv, cmd);
+	ret = stateful_try_decoder_cmd(file, priv, cmd);
 	if (ret)
 		return ret;
 
@@ -128,6 +125,57 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
 	return 0;
 }
 
+static int stateless_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
+{
+	return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, cmd);
+}
+
+static int stateless_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
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
+		 * If the flag of the output buffer is equals V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF,
+		 * this command will prevent dequeueing the capture buffer containing the last
+		 * decoded frame. Or do nothing
+		 */
+		break;
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
+		return stateless_try_decoder_cmd(file, priv, cmd);
+
+	return stateful_try_decoder_cmd(file, priv, cmd);
+}
+
+static int vidioc_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
+{
+	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
+
+	if (ctx->dev->vdec_pdata->uses_stateless_api)
+		return stateless_decoder_cmd(file, priv, cmd);
+
+	return stateful_decoder_cmd(file, priv, cmd);
+}
+
 void mtk_vdec_unlock(struct mtk_vcodec_dec_ctx *ctx)
 {
 	mutex_unlock(&ctx->dev->dec_mutex[ctx->hw_id]);
-- 
2.18.0


