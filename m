Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E80C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 10:16:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C097564E4D
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 10:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C097564E4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xlUto0yyY12hkIMRJ9Bn827a9as5RGbJyKUgnJxlNK0=; b=N2fzSYtBr/T+rBNGuLtKbRiMp
	7dGwwvsLYCyPL1LWaR7VollJNN2x7nRhUWiOgGOAro4TxcjEtCgLmP5p4AxtwqV53sWBaJWBpz/Zq
	qTI7URmpRoqlRmQZTaTMRfHSVLq/sfuYi47JtwUqhq9q2VshQE24qaWO6Z1t0nd4ey1sTTE9qVScA
	srwnzer2U2V8r13+eLstjk8FtP4vPflgAYyazDPEq5DuRMrzcaQgZS9kuwtTcoc6cquq+IGuLaMu+
	A8/Ovb8eXKG6H0PRCi1xmJzxuoPef5f2ma38ciQESYrFUE+NyB6jyVzskNn/KqcmosAYzhpvY8msj
	L7tm8xekw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFDhB-0002N5-Dt; Thu, 25 Feb 2021 10:16:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFDh8-0002L9-Sl
 for linux-mediatek@lists.infradead.org; Thu, 25 Feb 2021 10:16:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id e9so2941005plh.3
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Feb 2021 02:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CzZrf5ZN3dKFJYWBe83SjlOjpZibeUfuJa93ac7YAXk=;
 b=jQ+HHERLSuqcV29Grg3WAhikDj9vUDlXUXBlEp4E5EI257b4HU7uyTT8eY6GWJMoF7
 2YDbh1LC1TY0viJmtlEUakyPipeouh1KUBxw+uD0wvJL/0k13a7Kw721ONcSuziOdcwi
 4UIxHaiKplFL1VtfBw8wFJZ6QcozptuSGnZFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CzZrf5ZN3dKFJYWBe83SjlOjpZibeUfuJa93ac7YAXk=;
 b=TqkD58i1l6USSbAOxKxlIBi1nEwycK4UVUiaJjEkBT9s+P4FH++IwshHWFhKMOec5e
 rWSoqA2nIt+00ltNZdCO3xciNiuaNcELW7GPUYSty4RuOZoG/FCWWM6L0lX3OeuxhOp/
 Tf0JRa+dqvUFE8m7bK4OF+Emq66GJKKBgHRVtAbYNk0nRK5fDSkZZFXDdGWZh3/VwIfd
 1ydghQYuHvWiD7FcXYurzY0nrhmSqQ3i/smYkfLIfUKzcRSWCCKSpEOAMBb6USqUI6HU
 2gwdeqtDLYh5dI3Ho9yi3wDtPmcGXgDUZR9BH81+At/M29FGxXOPdDpWi7onZf6NLoC9
 lw/A==
X-Gm-Message-State: AOAM533vu0o5Mx9sjLAJ190CHgVeuDUujCdC+sdYtd4bm4/BXmICAFrI
 JjMypLfeK3KsgGfh+++INr3FDw==
X-Google-Smtp-Source: ABdhPJxSUJ4T7sf9r5KfvrKdJu6jBTRF3OdWQWVVUucHE6mUQiixAZdQBEGSo5/E6wQ6PxyWQv8jBA==
X-Received: by 2002:a17:90a:d998:: with SMTP id
 d24mr2582834pjv.169.1614248188900; 
 Thu, 25 Feb 2021 02:16:28 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:2550:3154:2c53:b6e7])
 by smtp.gmail.com with ESMTPSA id z2sm5848193pfc.8.2021.02.25.02.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 02:16:28 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v2 1/8] media: mtk-vcodec: vdec: handle firmware version field
Date: Thu, 25 Feb 2021 19:16:05 +0900
Message-Id: <20210225101612.2832444-2-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210225101612.2832444-1-acourbot@chromium.org>
References: <20210225101612.2832444-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_051630_985375_66589D56 
X-CRM114-Status: GOOD (  20.68  )
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
Cc: Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Firmwares for decoders newer than MT8173 will include an ABI version
number in their initialization ack message. Add the capacity to manage
it and make initialization fail if the firmware ABI is of a version that
we don't support.

For MT8173, this ABI version field does not exist ; thus ignore it on
this chip. There should only be one firmware version available for it
anyway.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  4 ++++
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  5 +++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 21 +++++++++++++++++--
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index 48b7524bc8fb..f9db7ef19c28 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -620,6 +620,7 @@ static struct vb2_ops mtk_vdec_frame_vb2_ops = {
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
+	.chip = MTK_MT8173,
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_frame_vb2_ops,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 9221c17a176b..60bc39efa20d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -322,6 +322,8 @@ enum mtk_chip {
  * @vdec_framesizes: supported video decoder frame sizes
  * @num_framesizes: count of video decoder frame sizes
  *
+ * @chip: chip this decoder is compatible with
+ *
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
  */
 
@@ -341,6 +343,8 @@ struct mtk_vcodec_dec_pdata {
 	const struct mtk_codec_framesizes *vdec_framesizes;
 	const int num_framesizes;
 
+	enum mtk_chip chip;
+
 	bool uses_stateless_api;
 };
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index 47a1c1c0fd04..eb66729fda63 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -83,12 +83,17 @@ struct vdec_ap_ipi_dec_start {
  * @status	: VPU exeuction result
  * @ap_inst_addr	: AP vcodec_vpu_inst instance address
  * @vpu_inst_addr	: VPU decoder instance address
+ * @vdec_abi_version:	ABI version of the firmware. Kernel can use it to
+ *			ensure that it is compatible with the firmware.
+ *			This field is not valid for MT8173 and must not be
+ *			accessed for this chip.
  */
 struct vdec_vpu_ipi_init_ack {
 	uint32_t msg_id;
 	int32_t status;
 	uint64_t ap_inst_addr;
 	uint32_t vpu_inst_addr;
+	uint32_t vdec_abi_version;
 };
 
 #endif
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 58b0e6fa8fd2..203089213e67 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -24,6 +24,22 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 	vpu->inst_addr = msg->vpu_inst_addr;
 
 	mtk_vcodec_debug(vpu, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
+
+	/* Firmware version field does not exist on MT8173. */
+	if (vpu->ctx->dev->vdec_pdata->chip == MTK_MT8173)
+		return;
+
+	/* Check firmware version. */
+	mtk_vcodec_debug(vpu, "firmware version 0x%x\n", msg->vdec_abi_version);
+	switch (msg->vdec_abi_version) {
+	case 1:
+		break;
+	default:
+		mtk_vcodec_err(vpu, "unhandled firmware version 0x%x\n",
+			       msg->vdec_abi_version);
+		vpu->failure = 1;
+		break;
+	}
 }
 
 /*
@@ -44,6 +60,9 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 
 	mtk_vcodec_debug(vpu, "+ id=%X", msg->msg_id);
 
+	vpu->failure = msg->status;
+	vpu->signaled = 1;
+
 	if (msg->status == 0) {
 		switch (msg->msg_id) {
 		case VPU_IPIMSG_DEC_INIT_ACK:
@@ -63,8 +82,6 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 	}
 
 	mtk_vcodec_debug(vpu, "- id=%X", msg->msg_id);
-	vpu->failure = msg->status;
-	vpu->signaled = 1;
 }
 
 static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
-- 
2.30.0.617.g56c4b15f3c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
