Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D64C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:28:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7429B60F94
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7429B60F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXUejpExLbmFRWtXFd5HTD1gQL77Hxa3nOSsjR2NlJE=; b=yLRHP+3shWwyvU
	80hNe77mE3K/0IW9/TbLNThhXpZXq5vmvzpkO3YXnTUkmqcqwBpXpOdwC+TOErAs1Rlll94FMUHsn
	9apGHnEFo69CipujFLyEr/cuUEnvlaa7eWJshI0XLBC4RVkKKXpjrsgf/ynLR8yVnFU+Dd13mRYQG
	v/9YykWXYVpUnPmhHwkK7YOnNdibl9zIAKxBIhmxp/Q1MNyUVVRPcyVZ9226vKeRGnn+3eUj4J6zz
	TzdEfkj0qHw2HNAN7SPszbxymwhOFM1q4WcyVogxNwVV1G3W4oGAD50k1/qp3sEJJIMIbHuAjbVvF
	qfBAYZ9wdtvpZrEy/mVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHsD-006QhW-4x; Wed, 04 Aug 2021 14:27:57 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHs8-006QeE-Oy
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 14:27:54 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:adf4:1f5e:19c9:b75f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3C8FD1F43A32;
 Wed,  4 Aug 2021 15:27:50 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
 dafna3@gmail.com, mchehab@kernel.org, tfiga@chromium.org,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 matthias.bgg@gmail.com, hsinyi@chromium.org, maoguang.meng@mediatek.com,
 irui.wang@mediatek.com, acourbot@chromium.org, Yunfei.Dong@mediatek.com,
 yong.wu@mediatek.com, eizan@chromium.org
Subject: [PATCH 4/5] media: mtk-vcodec: Add two error cases upon vpu irq
 handling
Date: Wed,  4 Aug 2021 16:27:28 +0200
Message-Id: <20210804142729.7231-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
References: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_072752_972863_D9984B4C 
X-CRM114-Status: GOOD (  10.50  )
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

1. Fail if the function mtk_vcodec_fw_map_dm_addr
returns ERR pointer.
2. Fail if the state from the vpu msg is either
VEN_IPI_MSG_ENC_STATE_ERROR or VEN_IPI_MSG_ENC_STATE_PART

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index 32dc844d16f9..234705ba7cd6 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -17,6 +17,8 @@ static int handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
 					     msg->vpu_inst_addr);
 
+	if (IS_ERR(vpu->vsi))
+		return PTR_ERR(vpu->vsi);
 	/* Firmware version field value is unspecified on MT8173. */
 	if (vpu->ctx->dev->venc_pdata->chip == MTK_MT8173)
 		return 0;
@@ -42,6 +44,12 @@ static int handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
 	vpu->state = msg->state;
 	vpu->bs_size = msg->bs_size;
 	vpu->is_key_frm = msg->is_key_frm;
+	if (vpu->state == VEN_IPI_MSG_ENC_STATE_ERROR ||
+	    vpu->state == VEN_IPI_MSG_ENC_STATE_PART) {
+		mtk_vcodec_err(vpu, "bad ipi-enc-state: %s",
+			       vpu->state == VEN_IPI_MSG_ENC_STATE_ERROR ? "ERR" : "PART");
+		return -EINVAL;
+	}
 	return 0;
 }
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
