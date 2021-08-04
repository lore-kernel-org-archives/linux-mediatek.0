Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C992C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:28:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D1C260E97
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D1C260E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPOO6EN/gmvDmR5Di0im/2I4OIzkuRHPcN3yfUZ0MOw=; b=ABMiOQo207qYtv
	+BXemLgvYj19PGQtlyGFws/Ez3r7DwxrdHA+04GxdJQ5i/B5bULHQyee5j0KmAu1CNYfXMaM/NtW+
	E3cWOA5u1ZCL0inFot2xhD9w/3eI6yLoD9n/YK15Wh+RVNvhFaTBsgy20ZbvAw0UuJBD35ScOituJ
	tlpoL2jfrvg8i0Nmyk33hPm0AYU7C3Khb5jhzuHvUEbAM2hn4NiNoQ2tgALJ0srNyXO/kIBGeuJs+
	Gd6wli+NhdFhs1Iw5NVlAPTCRMY+RslWjvu/asIDRAAqnyuz9n/ffuTIanYwTuvxtEaS20ymtrdEl
	1TlyzBL4kyFhuUKeWq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHsC-006Qh6-7G; Wed, 04 Aug 2021 14:27:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHs7-006QdY-7w
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 14:27:53 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:adf4:1f5e:19c9:b75f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 687011F43A2A;
 Wed,  4 Aug 2021 15:27:49 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
 dafna3@gmail.com, mchehab@kernel.org, tfiga@chromium.org,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 matthias.bgg@gmail.com, hsinyi@chromium.org, maoguang.meng@mediatek.com,
 irui.wang@mediatek.com, acourbot@chromium.org, Yunfei.Dong@mediatek.com,
 yong.wu@mediatek.com, eizan@chromium.org
Subject: [PATCH 3/5] media: mtk-vcodec: change the venc handler funcs to
 return int
Date: Wed,  4 Aug 2021 16:27:27 +0200
Message-Id: <20210804142729.7231-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
References: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_072751_454452_736F9D8A 
X-CRM114-Status: GOOD (  13.27  )
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

Currently the functions handle_enc_init_msg, handle_enc_encode_msg
return void and set vpu->failure to 1 in case of failure.
Instead, change the functions to return non 0 in case of failure
and then the vpu->failure is updated to their return value.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index be6d8790a41e..32dc844d16f9 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -9,7 +9,7 @@
 #include "venc_ipi_msg.h"
 #include "venc_vpu_if.h"
 
-static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
+static int handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 {
 	const struct venc_vpu_ipi_msg_init *msg = data;
 
@@ -19,7 +19,7 @@ static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 
 	/* Firmware version field value is unspecified on MT8173. */
 	if (vpu->ctx->dev->venc_pdata->chip == MTK_MT8173)
-		return;
+		return 0;
 
 	/* Check firmware version. */
 	mtk_vcodec_debug(vpu, "firmware version: 0x%x\n",
@@ -30,18 +30,19 @@ static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 	default:
 		mtk_vcodec_err(vpu, "unhandled firmware version 0x%x\n",
 			       msg->venc_abi_version);
-		vpu->failure = 1;
-		break;
+		return -EINVAL;
 	}
+	return 0;
 }
 
-static void handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
+static int handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
 {
 	const struct venc_vpu_ipi_msg_enc *msg = data;
 
 	vpu->state = msg->state;
 	vpu->bs_size = msg->bs_size;
 	vpu->is_key_frm = msg->is_key_frm;
+	return 0;
 }
 
 static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
@@ -60,12 +61,12 @@ static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
 
 	switch (msg->msg_id) {
 	case VPU_IPIMSG_ENC_INIT_DONE:
-		handle_enc_init_msg(vpu, data);
+		vpu->failure = handle_enc_init_msg(vpu, data);
 		break;
 	case VPU_IPIMSG_ENC_SET_PARAM_DONE:
 		break;
 	case VPU_IPIMSG_ENC_ENCODE_DONE:
-		handle_enc_encode_msg(vpu, data);
+		vpu->failure = handle_enc_encode_msg(vpu, data);
 		break;
 	case VPU_IPIMSG_ENC_DEINIT_DONE:
 		break;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
