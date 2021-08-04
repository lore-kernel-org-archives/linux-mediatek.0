Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2E7C4320E
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:28:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06B4160E97
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06B4160E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKztuY/GtYD21/K8E0CqJwgdxpVYDevTwFvZSkNIl5I=; b=m7axTdZ7Rg9jvZ
	f7DNclsL5eWEMu98G1fOWA05DWJs9mFJi8HyJxhJ2+HUhl88cyCuDQO4EBg0R04Kzo4eNgI5oGdf8
	fxMeiU+EzZAsas0PxGrH/TP2RVPbMx+Unwt9D5Oj4jzAI3FLlVV7eKtno8vXhT/97F3hPsUmvoUZW
	2xFxNtq47avzw2ue2arX5WWSPE+UU9teNGihmeT0XZv4AE6f4Ix7BY/SBUmRPlAALm6EBy8z7doEa
	hxrZgG+5N9YIWVVccdqudZ3Bs/mdQKPnObWHaWu3mrQH+Mi+WcMfj0/4+3zD6IIGI4Ou1hfC2k8I8
	XMrcBqTKc3Vcs5tdiUZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHsE-006Qi2-7U; Wed, 04 Aug 2021 14:27:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHs8-006Qeb-Rb
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 14:27:54 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:adf4:1f5e:19c9:b75f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1321D1F43A34;
 Wed,  4 Aug 2021 15:27:51 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
 dafna3@gmail.com, mchehab@kernel.org, tfiga@chromium.org,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 matthias.bgg@gmail.com, hsinyi@chromium.org, maoguang.meng@mediatek.com,
 irui.wang@mediatek.com, acourbot@chromium.org, Yunfei.Dong@mediatek.com,
 yong.wu@mediatek.com, eizan@chromium.org
Subject: [PATCH 5/5] media: mtk-vcodec: venc: Fail if a msg sent to VPU was
 not signaled
Date: Wed,  4 Aug 2021 16:27:29 +0200
Message-Id: <20210804142729.7231-6-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
References: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_072753_084164_6CC95EE9 
X-CRM114-Status: GOOD (  11.97  )
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

Each message sent to the VPU should raise a signal. The signal
handler sets vpu->signaled. Test the field and fail
if it is 0.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index 234705ba7cd6..8331b1bd1971 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -92,6 +92,7 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
 {
 	int status;
 
+	vpu->signaled = 0;
 	mtk_vcodec_debug_enter(vpu);
 
 	if (!vpu->ctx->dev->fw_handler) {
@@ -106,6 +107,8 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
 			       *(uint32_t *)msg, len, status);
 		return -EINVAL;
 	}
+	if (!vpu->signaled)
+		return -EINVAL;
 	if (vpu->failure)
 		return -EINVAL;
 
@@ -122,7 +125,6 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 	mtk_vcodec_debug_enter(vpu);
 
 	init_waitqueue_head(&vpu->wq_hd);
-	vpu->signaled = 0;
 	vpu->failure = 0;
 
 	status = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
