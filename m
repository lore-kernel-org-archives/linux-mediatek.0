Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C032C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 13:07:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D9AC61BF9
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 13:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D9AC61BF9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJzdzizW7NEAJ3/7oP+3FUUIipVTI+AsZ9v7Oe0aSk0=; b=JGfU4B5WT+UV02
	Bq3hzh+LwEUHuKMofFtDTUR2w29yBDat39P/Ay/RiyRUacTHbFfHrKWpoTHGEUdNtrp0is+cAkJNj
	PduQRXFMriu0fJNHz820seJrWIeOrlfv8/fPM8RdY1lTSVMBGVAIjturzwGk61hB7imtymlD5gsV6
	XrvhGHNkacNHA/dBT8hHb2I4YqwbNAodDBd5NJL1Wn9MVJcTY5A7pUw/sYen+iEy8MnvfAAPr/hev
	3Yv2gEdlhOSyRRaMGCT4Hb8CQAR2TDXFAoXjGxe2Ifqfiq7XNcoJzs6qTXLm4NUPOetMVVJUk9EWi
	4gNnjNQwxvcmHHGO9AMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnKeR-004mkC-Aw; Wed, 17 Nov 2021 13:06:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnKeN-004mgj-Ds
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 13:06:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id BE34E1F45CE5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637154413; bh=eK5TQh9dYAJXudfnkfcZE75BZ5m9URbPB735KQHfCTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dOWE0rBZfXfQUp8NsYuRmpfE+I8lBgTY5lNHMikZQ6KN7RdCGSAkjDYwGdu6VIOCo
 7T8tKpluWd/pDhHIVxGDMB7SdUYzTdOWv8xWFG99y4timvsB6pyIMI1nRwsXD5yslZ
 HSZFujJJ/Rni/Bk0kM0Edc2prOpXU90AlXGxN68lVngygt1zUYUsqI0eSMfhz88eRO
 Z3LeEekkAa3H3Uqg1RBk78k8pP2f1qaLdSaqvYvHmQ9MXQCGl7I8KB2Y4mdB075MPw
 GWa69wjSnvUjdoZr4Hbg0TSUAiZb7jVxL1W2TmleI/eMJvG1oftUe3SsX0BfsZ8V11
 iS3aYabFR+fKw==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, kernel@collabora.com,
 acourbot@chromium.org, andrew-ct.chen@mediatek.com, courbot@chromium.org,
 dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
 hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 maoguang.meng@mediatek.com, matthias.bgg@gmail.com, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com, tfiga@chromium.org, tiffany.lin@mediatek.com
Subject: [PATCH v2 3/7] media: mtk-vcodec: enc: use "stream_started" flag for
 "stop/start_streaming"
Date: Wed, 17 Nov 2021 15:06:31 +0200
Message-Id: <20211117130635.11633-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_050655_626451_33F0B9B4 
X-CRM114-Status: GOOD (  15.95  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently the mtk-vcodec encoder does runtime pm resume
in "start_streaming" cb if both queues are streaming
and does runtime pm 'put' in "stop_streaming" if both
queues are not streaming.
This is wrong since the same queue might be started and
then stopped causing the driver to turn off the hardware
without turning it on. This cause for example unbalanced
calls to pm_runtime_*

Fixes: 4e855a6efa547 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
to reproduce the issue:
patch v4l-utils as follow:

static void stateful_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,

 	if (fd.streamon(out.g_type()))
 		return;
+	if (fd.streamoff(out.g_type()))
+		return;
+
+	exit(1);

 	fd.s_trace(0);
 	if (exp_fd_p)

and call:
v4l2-ctl -x width=160,height=128,pixelformat=NM12 -v pixelformat=VP80 --stream-mmap --stream-out-mmap -d5
then the file /sys/devices/platform/soc/19002000.vcodec/power/runtime_usage
will show a negative number and further streaming (with e.g, gstreamer) is not possible.

 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h | 4 ++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 9d36e3d27369..84c5289f872b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -259,6 +259,9 @@ struct vdec_pic_info {
  * @decoded_frame_cnt: number of decoded frames
  * @lock: protect variables accessed by V4L2 threads and worker thread such as
  *	  mtk_video_dec_buf.
+ * @stream_started: this flag is turned on when both queues (cap and out) starts streaming
+ *	  and it is turned off once both queues stop streaming. It is used for a correct
+ *	  setup and set-down of the hardware when starting and stopping streaming.
  */
 struct mtk_vcodec_ctx {
 	enum mtk_instance_type type;
@@ -301,6 +304,7 @@ struct mtk_vcodec_ctx {
 
 	int decoded_frame_cnt;
 	struct mutex lock;
+	bool stream_started;
 
 };
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 87a5114bf680..fb3cf804c96a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -890,6 +890,9 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 		goto err_start_stream;
 	}
 
+	if (ctx->stream_started)
+		return 0;
+
 	/* Do the initialization when both start_streaming have been called */
 	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
 		if (!vb2_start_streaming_called(&ctx->m2m_ctx->cap_q_ctx.q))
@@ -928,6 +931,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 		ctx->state = MTK_STATE_HEADER;
 	}
 
+	ctx->stream_started = true;
 	return 0;
 
 err_set_param:
@@ -1002,6 +1006,9 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 		}
 	}
 
+	if (!ctx->stream_started)
+		return;
+
 	if ((q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
 	     vb2_is_streaming(&ctx->m2m_ctx->out_q_ctx.q)) ||
 	    (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
@@ -1023,6 +1030,7 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 		mtk_v4l2_err("pm_runtime_put fail %d", ret);
 
 	ctx->state = MTK_STATE_FREE;
+	ctx->stream_started = false;
 }
 
 static int vb2ops_venc_buf_out_validate(struct vb2_buffer *vb)
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
