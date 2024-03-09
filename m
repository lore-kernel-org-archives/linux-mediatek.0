Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9264C54E41
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Mar 2024 15:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSQiVixPRqEIRSoCHzDwR9XcEcWCJDulryPQLlv8nzA=; b=qUneFD79yLeftyR0JNDOx0LT13
	Kf7J+0FFZHXHSOHQ9DZ15luG5Tuqu4QhinMn13mZT6yxR/1Wkrz6D0GDhGguc8xX6+q+J4RpT8l/2
	zbP7E7IKwjbXd68KrTAFGZ4VA8KUSKhcsvCN0t4mHLo5P560mVHBPI1ODqKoDrOGF68xhO7gBuj3w
	Xv2XH1iMwpMzyz11zcUnChrEecDrNXd0kflnZF/gjTNmfzWS2j81qTpjLzRmRO4Y6Zu2LWeoOT+Sc
	FekYO0teNqTLihNlWV6EV5TgGHE0l2dWwGHTCzfAHE5U/J+2n3YyNFpCRttwv273+DrmJl5EsI8G4
	qAES33yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riyJn-0000000Db9g-1b8k;
	Sat, 09 Mar 2024 15:08:59 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riyJb-0000000Db2I-0vwD;
	Sat, 09 Mar 2024 15:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709996924;
	bh=Isf3PRZPpGIZHZAJaAtHVL0lcRPUzgj1NgJcb5eXOmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BKnHD/+iCjaEdvc2nN3CdUutgbNrwmzgCzP5a4OHFbVTMZrskcy3FE2Upi15zP56Z
	 358R56ieY0rj9Xu45xdiV7Rd/r0+dNQ1xkrROC8wh2uMPUb+Caq5UoCcoiMsrgjxje
	 jmLRFEkW3cZePxx7ynpCQ+7T0SOdDyjmHeXekgg6gv27zPEPBkdd71lPN/hvmjWAeE
	 AItOP7Fp9Fu7IZhRQraX7CFQR18xGjqmlEGllqcKZfJwNiI+kdWEnQLBmJXftKBmvS
	 XrWdobj5IgWhnCHzTbebjblf923B0MACd5jMgJuCPp+sjaZMGw/HTfxImjbwRGQFIl
	 Gth7EMaASAF2g==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2A06D3782091;
	Sat,  9 Mar 2024 15:08:44 +0000 (UTC)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Sat, 09 Mar 2024 16:08:39 +0100
Subject: [PATCH 3/3] media: mediatek: vcodec: Replace false function description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-mediatek-typos-v1-3-fa4aeb59306c@collabora.com>
References: <20240309-mediatek-typos-v1-0-fa4aeb59306c@collabora.com>
In-Reply-To: <20240309-mediatek-typos-v1-0-fa4aeb59306c@collabora.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709996919; l=1595;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=Isf3PRZPpGIZHZAJaAtHVL0lcRPUzgj1NgJcb5eXOmA=;
 b=lkmmxOwN00OH6jVL0bqNRINEQIJHhjC8/OPRFiEsYHdLMCD0/aWE8EuuabCPin/HyTpYlyLWrzZE
 W7YYhQd2DwBn7wC5nZplrybyc3E11suxQq3F/LIfsrZz56MxlP7R
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240309_070847_509199_53C2E3D3 
X-CRM114-Status: GOOD (  10.14  )
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

The function descriptions where falsely copy pasted from another entry,
write more fitting descriptions for the functions.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 .../platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.h    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.h
index 6f624c266246..2d845b1307b6 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.h
@@ -185,7 +185,7 @@ void mtk_vdec_h264_get_ref_list(u8 *ref_list,
 void *mtk_vdec_h264_get_ctrl_ptr(struct mtk_vcodec_dec_ctx *ctx, int id);
 
 /**
- * mtk_vdec_h264_fill_dpb_info - get each CID contrl address.
+ * mtk_vdec_h264_fill_dpb_info - Fill the decoded picture buffer info
  *
  * @ctx:		v4l2 ctx
  * @decode_params:	slice decode params
@@ -225,7 +225,9 @@ void mtk_vdec_h264_copy_slice_hd_params(struct mtk_h264_slice_hd_param *dst_para
 					const struct v4l2_ctrl_h264_decode_params *dec_param);
 
 /**
- * mtk_vdec_h264_copy_scaling_matrix - get each CID contrl address.
+ * mtk_vdec_h264_copy_scaling_matrix - Copy the scaling matrix from a source to
+ *				       a destination.
+ *				       (for example into the slice parameters)
  *
  * @dst_matrix:	scaling list params for hw decoder
  * @src_matrix:	scaling list params from user driver

-- 
2.25.1

