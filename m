Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCBDC54E66
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hb8pyE6JbS9TMSLtbhXheNJ1PTC1gMJU9q4B8oZPhI4=; b=Df3vOpzqu5WYBUCl3RMXtlkXQr
	sB6Q+NPaMY/Ft6EPdovXB483mzrOd2s/w82mUmdHMcBQSxzFg9Ur8SUfLeq2o1zSyiTQ3pqm758jh
	1EX2uHegMvePB20aLZZbHVl+T797afWNU4Ttq1tDuX/NSQYwCko1WiPGg7wvTe7K6yCccfb1OswSa
	9ky3Ugy7Qj19/At1i9Rz8vFKzDS3JyJ2kAXhX0A6FxPWcsvP7cY0zd/Cp9SwtP84li2WVVdqYs1s7
	iKoqFbxI1HEOR45IumfWcBhuHT4RePgexAvO3M1ps6s91ElcjCYBgGGXq/UY7EALTSoC+HXggitbk
	ZJZ2dmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjymN-00000005Cmt-2PMX;
	Tue, 12 Mar 2024 09:50:39 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjymC-00000005CfT-2BXB;
	Tue, 12 Mar 2024 09:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710237027;
	bh=wx5Od8e0msgGi1gWmjh7X4CMlWtUwg0DpHfFHz+2/cM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dU0hPYq/vzHUOLU+RRnHBQwXFLMIg7g4HZaC7UVgWtpAwBPSngwwT3fTfKywh7VCN
	 CSDMMBz56Au3GcpNKvPx8zc3YOMf4DQSxyeZf7tMRFyhKGWrAqeS7hB/sIEyEcukg+
	 8uiMHpowNjJUi/JzouzS5n5Meu5PnA816vwA0QnCoF4yUtJAegXcPATO48+prPUlEG
	 UHvuIAqgBZlWJYEaXRw7U5kfTwUDOLhnDBX66FggOQXd5JOLZFz3EXJkA2VEAx64m1
	 aT5IBNxdoV8hYYsFNgKM029M+hcEnSY1EbOHOlUoqrSl08AiW16iWwPQ72UHiTcfMZ
	 HyMkueFiVd2NA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B63D13782082;
	Tue, 12 Mar 2024 09:50:26 +0000 (UTC)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Tue, 12 Mar 2024 10:50:20 +0100
Subject: [PATCH v2 2/3] media: mediatek: vcodec: Improve wording & fix
 grammatic issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-mediatek-typos-v2-2-7eaacd8e5401@collabora.com>
References: <20240309-mediatek-typos-v2-0-7eaacd8e5401@collabora.com>
In-Reply-To: <20240309-mediatek-typos-v2-0-7eaacd8e5401@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710237023; l=2834;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=wx5Od8e0msgGi1gWmjh7X4CMlWtUwg0DpHfFHz+2/cM=;
 b=4TRPb9ey+FZFBS7b7sJJt7mXLU+HL5QHI2VaENisPMR47hWK5CjdJJT2JQJbROrKV8u6Rp6PwfjH
 XMYLq/vjAi/IMidrky7RWkRKFt3WrYz7JdQsxY31CpJHf7WkLQOx
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_025028_768414_DEFC6874 
X-CRM114-Status: GOOD (  11.20  )
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

Multiple issues detected while scanning the code by far not a complete
list of required changes but some small improvements.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c  | 2 +-
 .../platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c      | 2 +-
 .../platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
index 37c41b673876..73d5cef33b2a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
@@ -27,7 +27,7 @@ struct mtk_h264_dec_slice_param {
 /**
  * struct vdec_h264_dec_info - decode information
  * @dpb_sz		: decoding picture buffer size
- * @resolution_changed  : resolution change happend
+ * @resolution_changed  : flag to notify that a resolution change happened
  * @realloc_mv_buf	: flag to notify driver to re-allocate mv buffer
  * @cap_num_planes	: number planes of capture buffer
  * @bs_dma		: Input bit-stream buffer dma address
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index d5224c9584b6..2d4611e7fa0b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -131,7 +131,7 @@ struct vdec_h264_slice_share_info {
 /**
  * struct vdec_h264_slice_inst - h264 decoder instance
  *
- * @slice_dec_num:	how many picture be decoded
+ * @slice_dec_num:	Number of frames to be decoded
  * @ctx:		point to mtk_vcodec_dec_ctx
  * @pred_buf:		HW working prediction buffer
  * @mv_buf:		HW working motion vector buffer
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index a44db6139ff2..fe0a8508d632 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -342,7 +342,7 @@ struct vdec_hevc_slice_share_info {
 /**
  * struct vdec_hevc_slice_inst - hevc decoder instance
  *
- * @slice_dec_num:      how many picture be decoded
+ * @slice_dec_num:      Number of frames to be decoded
  * @ctx:                point to mtk_vcodec_dec_ctx
  * @mv_buf:             HW working motion vector buffer
  * @vpu:                VPU instance

-- 
2.25.1

