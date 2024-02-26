Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A79DC5478C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 21:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4u38NwFqM/+EUe+opFsYUKv6k6GvUJPckP/CHpwCM40=; b=GFP/r3xr1HJVnTAdH+xg9IHb0x
	kq3q8YY66hDWGRIOhJwK01riK51FnOEgg2iFMjTw+GWyUyvkm6FZzqwYv/fgcO1BQTJpPpufPWQzh
	LIG35f6opXXUON7LLpimhtrybWn5e43WIiDbLi/gwhvWFKZOO3LbB3bM5bExl09hDbv+dx2ltxdxh
	ojvNgmU0xeFNN9LCM8s80gkbBkvghnrswfYBmPRw+YPpiAASEfKU3tzRwl9j5yg8c2hb8f48B8/2w
	2G2gI55aVUE6IbGFQkrA83a/Ea4ujJqirL5TzPU1taj4evp/26Xj9YoeOcNWfiNNaAHPGdY6m+9uV
	qknI0ypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reiOT-00000002fAi-3FGA;
	Mon, 26 Feb 2024 21:20:13 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reiOP-00000002f9F-3KZo;
	Mon, 26 Feb 2024 21:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708982407;
	bh=FOYERU8NmHbg9gmrjoR9sSh2LIJ3GOCMFBBjojIKe7s=;
	h=From:To:Cc:Subject:Date:From;
	b=tGyjfZzNynVi35o31WlvR1PvlfJKFER57QjCs6311NQcOgI/4vA71M8Dltn1h1Z5l
	 31dOZ4A2DY3gdyhD1zo/i9rlLLqykuhaOBC5RetYpA1oskEqv/p18wdhbc1/DxjeCD
	 4bT4orGTbbCyNPREd41qUWGnS5Fta+TLeC3M83YuStrflt8sNXY3mZjqxkDCiwWL3i
	 UO48PDdpwx1MVo0o5wPZV1oQcvrHUUVRZi1srE3ZQXr1BnBpG3ZCk7tu5I+tYtG2VN
	 sL5Fwc6TLFh+cvhLauMicwfffKDEFq3tCEeousne8iOGZ0PE/rfF240a8IQwyL5V1m
	 KyvcyvtPXDlvg==
Received: from nicolas-tpx395.lan (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5223D378111A;
	Mon, 26 Feb 2024 21:20:05 +0000 (UTC)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: Fix oops when HEVC init fails
Date: Mon, 26 Feb 2024 16:19:52 -0500
Message-ID: <20240226211954.400891-1-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_132010_078913_8892A786 
X-CRM114-Status: GOOD (  10.75  )
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

In stateless HEVC case, the instance pointer was saved in the
context regardless if the initialization worked. As the pointer
is freed in failure, this resulted in use after free in the
deinit function.

 Hardware name: Acer Tomato (rev3 - 4) board (DT)
 pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : vcodec_vpu_send_msg+0x4c/0x190 [mtk_vcodec_dec]
 lr : vcodec_send_ap_ipi+0x78/0x170 [mtk_vcodec_dec]
 sp : ffff80008750bc20
 x29: ffff80008750bc20 x28: ffff1299f6d70000 x27: 0000000000000000
 x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
 x23: ffff80008750bc98 x22: 000000000000a003 x21: ffffd45c4cfae000
 x20: 0000000000000010 x19: ffff1299fd668310 x18: 000000000000001a
 x17: 000000040044ffff x16: ffffd45cb15dc648 x15: 0000000000000000
 x14: ffff1299c08da1c0 x13: ffffd45cb1f87a10 x12: ffffd45cb2f5fe80
 x11: 0000000000000001 x10: 0000000000001b30 x9 : ffffd45c4d12b488
 x8 : 1fffe25339380d81 x7 : 0000000000000001 x6 : ffff1299c9c06c00
 x5 : 0000000000000132 x4 : 0000000000000000 x3 : 0000000000000000
 x2 : 0000000000000010 x1 : ffff80008750bc98 x0 : 0000000000000000
 Call trace:
  vcodec_vpu_send_msg+0x4c/0x190 [mtk_vcodec_dec]
  vcodec_send_ap_ipi+0x78/0x170 [mtk_vcodec_dec]
  vpu_dec_deinit+0x1c/0x30 [mtk_vcodec_dec]
  vdec_hevc_slice_deinit+0x30/0x98 [mtk_vcodec_dec]
  vdec_if_deinit+0x38/0x68 [mtk_vcodec_dec]
  mtk_vcodec_dec_release+0x20/0x40 [mtk_vcodec_dec]
  fops_vcodec_release+0x64/0x118 [mtk_vcodec_dec]
  v4l2_release+0x7c/0x100
  __fput+0x80/0x2d8
  __fput_sync+0x58/0x70
  __arm64_sys_close+0x40/0x90
  invoke_syscall+0x50/0x128
  el0_svc_common.constprop.0+0x48/0xf0
  do_el0_svc+0x24/0x38
  el0_svc+0x38/0xd8
  el0t_64_sync_handler+0xc0/0xc8
  el0t_64_sync+0x1a8/0x1b0
 Code: d503201f f9401660 b900127f b900227f (f9400400)

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Fixes: 2674486aac7d ("media: mediatek: vcodec: support stateless hevc decoder")
---
 .../mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index 06ed47df693bf..21836dd6ef85a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -869,7 +869,6 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 	inst->vpu.codec_type = ctx->current_codec;
 	inst->vpu.capture_type = ctx->capture_fourcc;
 
-	ctx->drv_handle = inst;
 	err = vpu_dec_init(&inst->vpu);
 	if (err) {
 		mtk_vdec_err(ctx, "vdec_hevc init err=%d", err);
@@ -898,6 +897,7 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 	mtk_vdec_debug(ctx, "lat hevc instance >> %p, codec_type = 0x%x",
 		       inst, inst->vpu.codec_type);
 
+	ctx->drv_handle = inst;
 	return 0;
 error_free_inst:
 	kfree(inst);
-- 
2.43.2


