Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E55C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 17:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/didL5h/sYGHzQHALjvpk1UK+C5uX4ht1ERRn86zQ0I=; b=I7lr1CSZDlYygyJS5WwlWl+22v
	AdNigHrh/31M75FLAXY11LS3F5B7sa3daHexmjWxSMuKoqk5q9nGnkjOuuA9G2suVqV7tscmYuf9r
	tVFoQ7GJoRNOhSIJfo7hKRwx/P8k3kmZbpj3PoeApNTRLEq9ibNQbcFaU8IH5bFdagEV27hnWY8WL
	xuiFHj+WwV4gaUkbbkjyF8tYNQ/1LL5OJluOIrylEqos8A7Gy4E+1shvY2cktRlyNX59gewbsTMed
	S+TTyB0qMyVOlf3kTGJWfk9YFZXolQl1Bcv0vSeRb1z7NbqXXjIZ+EZHEVUQxIiiRqsLQeOdf7mca
	tg/WCIBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reeqm-00000001zou-1h93;
	Mon, 26 Feb 2024 17:33:12 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reeqT-00000001zbJ-3OC6
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 17:32:57 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-787be5d999aso236179285a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 09:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708968772; x=1709573572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/didL5h/sYGHzQHALjvpk1UK+C5uX4ht1ERRn86zQ0I=;
        b=nveEwGMpRzFl/hyeG6+/vBq51B6nMdmvwvSEp0ct87/gWbN+3m9BUUgRFNHDYYpHBE
         A/0u09GUdpgcncJCBPCfjxKvJ9G8VnYEjg4ns9DFrCuuAgN+6kxrK76VIWwp8X8G+ryq
         3KrxiO+aXlDzgeabXVHXiOVjva8MU4HZfiLwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708968772; x=1709573572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/didL5h/sYGHzQHALjvpk1UK+C5uX4ht1ERRn86zQ0I=;
        b=Cc6SADL14lKevMghIgoTGIRX+MCc7KIf9mGiq0WMIsMjj6M1UmZ4Dl0NrkIdFUu//Y
         djmnTfrwbopmaSSCreRAq7o2wswVGOKrDmgobzbvS1h4Iaj+/+s+GgGbW1yqS9yqwqiO
         W9HyK5UpeV0E7ImP0r7TV0sUGDIwwjKcrDnA93B/BrXwzlEMDnJFan4aYlqKN6ynkDaN
         6Lsdx5Aau37obpK626YazzaXWd2KNcp2yTmTw//cZ+h/pGDTDoVyvPchBR1Bg8S4tj4v
         8uKza3UchQxOY+xhh9h3gL+Rr2TtxSoVcJC43+iunC/UOJ+qa1x27Q235zYVnh24ymjT
         0JEw==
X-Forwarded-Encrypted: i=1; AJvYcCXQFXVcehxa9xW54CZS6P77nJo/LrXeKOXmhiafyjCfMsgp9zbDgQQhrIZ0IXHNxSCB5PPTrm6UOAt69k2FhB/Fy7LvDgzJ4+/tGJK2NE18e+5R
X-Gm-Message-State: AOJu0Yw8SHTQEI6fTKzLDrvvYVq4KXXmfVsitu/nlvLkLnh5tgGt9dN3
	OPJuJFqNv811prD+Q/9sqrfgnUiPcw0YVXGYJIp8g6ck9IpoJYjF04KQUdNNNQ==
X-Google-Smtp-Source: AGHT+IFWEeHuCEfd782RZ+zP9OrwwL1TXNEPqp2q25xR25g7zYLNieWGKgAPjo8acbDElZv5ELPGvw==
X-Received: by 2002:a05:620a:4092:b0:787:a0d2:460e with SMTP id f18-20020a05620a409200b00787a0d2460emr10758707qko.35.1708968772010;
        Mon, 26 Feb 2024 09:32:52 -0800 (PST)
Received: from denia.c.googlers.com (115.25.199.35.bc.googleusercontent.com. [35.199.25.115])
        by smtp.gmail.com with ESMTPSA id b11-20020a05620a04eb00b0078725d0345dsm2672669qkh.2.2024.02.26.09.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 09:32:51 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 26 Feb 2024 17:32:46 +0000
Subject: [PATCH v2 3/3] media: mediatek: vcodedc: Fix
 Wcast-function-type-strict warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fix-clang-warnings-v2-3-fa1bc931d17e@chromium.org>
References: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
In-Reply-To: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Mike Isely <isely@pobox.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_093253_925697_920A5F5F 
X-CRM114-Status: GOOD (  17.30  )
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

Building with LLVM=1 throws the following warning:
drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsigned int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned int, void *)') converts to incompatible function type [-Wcast-function-type-strict]

Constify the types to avoid the warning.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c          | 12 ++++++------
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h    |  2 +-
 .../platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 10 +---------
 drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c |  2 +-
 drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c |  2 +-
 drivers/remoteproc/mtk_scp.c                                 |  4 ++--
 include/linux/remoteproc/mtk_scp.h                           |  2 +-
 include/linux/rpmsg/mtk_rpmsg.h                              |  2 +-
 8 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index 49fc2e9d45dd5..c4f1c49b9d52a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -77,10 +77,10 @@ void mdp_vpu_shared_mem_free(struct mdp_vpu_dev *vpu)
 		dma_free_wc(dev, vpu->config_size, vpu->config, vpu->config_addr);
 }
 
-static void mdp_vpu_ipi_handle_init_ack(void *data, unsigned int len,
+static void mdp_vpu_ipi_handle_init_ack(const void *data, unsigned int len,
 					void *priv)
 {
-	struct mdp_ipi_init_msg *msg = (struct mdp_ipi_init_msg *)data;
+	const struct mdp_ipi_init_msg *msg = data;
 	struct mdp_vpu_dev *vpu =
 		(struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
 
@@ -91,10 +91,10 @@ static void mdp_vpu_ipi_handle_init_ack(void *data, unsigned int len,
 	complete(&vpu->ipi_acked);
 }
 
-static void mdp_vpu_ipi_handle_deinit_ack(void *data, unsigned int len,
+static void mdp_vpu_ipi_handle_deinit_ack(const void *data, unsigned int len,
 					  void *priv)
 {
-	struct mdp_ipi_deinit_msg *msg = (struct mdp_ipi_deinit_msg *)data;
+	const struct mdp_ipi_deinit_msg *msg = data;
 	struct mdp_vpu_dev *vpu =
 		(struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
 
@@ -102,10 +102,10 @@ static void mdp_vpu_ipi_handle_deinit_ack(void *data, unsigned int len,
 	complete(&vpu->ipi_acked);
 }
 
-static void mdp_vpu_ipi_handle_frame_ack(void *data, unsigned int len,
+static void mdp_vpu_ipi_handle_frame_ack(const void *data, unsigned int len,
 					 void *priv)
 {
-	struct img_sw_addr *addr = (struct img_sw_addr *)data;
+	const struct img_sw_addr *addr = data;
 	struct img_ipi_frameparam *param =
 		(struct img_ipi_frameparam *)(unsigned long)addr->va;
 	struct mdp_vpu_dev *vpu =
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
index 300363a40158c..2561b99c95871 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
@@ -23,7 +23,7 @@ enum mtk_vcodec_fw_use {
 
 struct mtk_vcodec_fw;
 
-typedef void (*mtk_vcodec_ipi_handler) (void *data,
+typedef void (*mtk_vcodec_ipi_handler) (const void *data,
 	unsigned int len, void *priv);
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_type type,
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index 9f6e4b59455da..4c34344dc7dcb 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -29,15 +29,7 @@ static int mtk_vcodec_vpu_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
 					   mtk_vcodec_ipi_handler handler,
 					   const char *name, void *priv)
 {
-	/*
-	 * The handler we receive takes a void * as its first argument. We
-	 * cannot change this because it needs to be passed down to the rproc
-	 * subsystem when SCP is used. VPU takes a const argument, which is
-	 * more constrained, so the conversion below is safe.
-	 */
-	ipi_handler_t handler_const = (ipi_handler_t)handler;
-
-	return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
+	return vpu_ipi_register(fw->pdev, id, handler, name, priv);
 }
 
 static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index 82e57ae983d55..a840dd2a48d0e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -97,7 +97,7 @@ static bool vpu_dec_check_ap_inst(struct mtk_vcodec_dec_dev *dec_dev, struct vde
  * This function runs in interrupt context and it means there's an IPI MSG
  * from VPU.
  */
-static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
+static void vpu_dec_ipi_handler(const void *data, unsigned int len, void *priv)
 {
 	struct mtk_vcodec_dec_dev *dec_dev;
 	const struct vdec_vpu_ipi_ack *msg = data;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index 84ad1cc6ad171..ea0c4a281d1a1 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -57,7 +57,7 @@ static bool vpu_enc_check_ap_inst(struct mtk_vcodec_enc_dev *enc_dev, struct ven
 	return ret;
 }
 
-static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
+static void vpu_enc_ipi_handler(const void *data, unsigned int len, void *priv)
 {
 	struct mtk_vcodec_enc_dev *enc_dev;
 	const struct venc_vpu_ipi_msg_common *msg = data;
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index a35409eda0cf2..b508136b416a8 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -78,10 +78,10 @@ static void scp_wdt_handler(struct mtk_scp *scp, u32 scp_to_host)
 		rproc_report_crash(scp_node->rproc, RPROC_WATCHDOG);
 }
 
-static void scp_init_ipi_handler(void *data, unsigned int len, void *priv)
+static void scp_init_ipi_handler(const void *data, unsigned int len, void *priv)
 {
 	struct mtk_scp *scp = priv;
-	struct scp_run *run = data;
+	const struct scp_run *run = data;
 
 	scp->run.signaled = run->signaled;
 	strscpy(scp->run.fw_ver, run->fw_ver, SCP_FW_VER_LEN);
diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index 7c2b7cc9fe6c1..84e579940b8e5 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -8,7 +8,7 @@
 
 #include <linux/platform_device.h>
 
-typedef void (*scp_ipi_handler_t) (void *data,
+typedef void (*scp_ipi_handler_t) (const void *data,
 				   unsigned int len,
 				   void *priv);
 struct mtk_scp;
diff --git a/include/linux/rpmsg/mtk_rpmsg.h b/include/linux/rpmsg/mtk_rpmsg.h
index 363b60178040b..9d67507471fba 100644
--- a/include/linux/rpmsg/mtk_rpmsg.h
+++ b/include/linux/rpmsg/mtk_rpmsg.h
@@ -9,7 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
 
-typedef void (*ipi_handler_t)(void *data, unsigned int len, void *priv);
+typedef void (*ipi_handler_t)(const void *data, unsigned int len, void *priv);
 
 /*
  * struct mtk_rpmsg_info - IPI functions tied to the rpmsg device.

-- 
2.44.0.rc0.258.g7320e95886-goog


