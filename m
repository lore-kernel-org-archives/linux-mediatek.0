Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1943DC54E41
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Mar 2024 15:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuPtJOjhFYPaxtRlZq5T8P/iF0PcvZKdQUsKoL9s618=; b=U+mz22XZ3aB9qed+ZTi+pwWufL
	wYHweJ9/mpg3Q4R+vUx/FsMpWxQyCTbGGjFf6m0wyhP/7Yf0ehlHmPDX3CGHzNRG3/vMyu95YZMj4
	w5o6HOkEhP2MXzCufoqbPm3LKM/SCsptOpWebTx12lZyRYV4hl/srItSwR3Zv3ww/Nv15ERdNduYh
	lZdBlFp//ysnnAvPru8LjZjYc97T/TOLHvS99IuCnAtKdG2UGLdzGoVNZ3MuXfnJVT85v4xVPS8fu
	RufflFVED9JpeubLB6XcTtRMRcx/1+FSWy26cIvIjZmfmeDCIXukDhdNmzKLI5OnDFdNIQQACBpWf
	sXabWuRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riyJg-0000000Db6Y-44hl;
	Sat, 09 Mar 2024 15:08:52 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riyJb-0000000Db20-0vj3;
	Sat, 09 Mar 2024 15:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709996923;
	bh=qTEqGKNFjaYsuV/phc8ORQVbsab7C8DxOC4Q/kxtGZo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LC9Yl0ASKsa/CrK1czdWcr/62wJZA8AxMjkFJKCzFtsdBXqD/HHpjZuQ9dVxpwAKR
	 2PIBATnledzYqRbGG7SWlmzYrO8cv9ZtKvi/qzcUGAbfLIJtnuy0l3epdARjqpd2Mf
	 tOnIfF2nCCH0LxWU302IE9Me1He2Izi8jmevYZ4HTQbFmUVQN1LBCdxR9ikfEsS5DA
	 oUFxOF38J/dKX/zjxHdccFt7nXLOgpckZbd3a8MUeadTTlnMDDRkD+5eIVOKDW/z5g
	 vU7EQRsDOUPNVhnJOmiE0Xw8PYf7XDoS950qSY4byKGxT6ullTrVkMHCHsCg1HHa8Q
	 /uo5XZO6oHWoQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E33443782043;
	Sat,  9 Mar 2024 15:08:42 +0000 (UTC)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Sat, 09 Mar 2024 16:08:38 +0100
Subject: [PATCH 2/3] media: mediatek: vcodec: Improve wording & fix grammatic issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-mediatek-typos-v1-2-fa4aeb59306c@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709996919; l=5849;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=qTEqGKNFjaYsuV/phc8ORQVbsab7C8DxOC4Q/kxtGZo=;
 b=rKIInxf1pNxiLqElpsLEecHpA9fojcvJ0hoVMqp5YWocqN/Ve0kgtFxy+Smr1ZCN6obDvVV9IZdK
 K8fYAIdoD0L+bPnjpAMFIsMWjnqNc/Qoxiku51mQKswcIA8Blq63
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240309_070847_454294_46DD1235 
X-CRM114-Status: GOOD (  14.48  )
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
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 2 +-
 .../media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c    | 2 +-
 .../platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 2 +-
 .../platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c    | 2 +-
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c     | 4 ++--
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index a0451116f2e4..f975db4293da 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -71,7 +71,7 @@ enum mtk_vdec_hw_arch {
  * @fb_sz: bitstream size of each plane
  * E.g. suppose picture size is 176x144,
  *      buffer size will be aligned to 176x160.
- * @cap_fourcc: fourcc number(may changed when resolution change)
+ * @cap_fourcc: fourcc number(may change on a resolution change)
  * @reserved: align struct to 64-bit in order to adjust 32-bit and 64-bit os.
  */
 struct vdec_pic_info {
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
index 37c41b673876..668e87bf30e8 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
@@ -27,7 +27,7 @@ struct mtk_h264_dec_slice_param {
 /**
  * struct vdec_h264_dec_info - decode information
  * @dpb_sz		: decoding picture buffer size
- * @resolution_changed  : resolution change happend
+ * @resolution_changed  : flag to notify that a resolution change happend
  * @realloc_mv_buf	: flag to notify driver to re-allocate mv buffer
  * @cap_num_planes	: number planes of capture buffer
  * @bs_dma		: Input bit-stream buffer dma address
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index d5224c9584b6..c4ac6b6f7acf 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -131,7 +131,7 @@ struct vdec_h264_slice_share_info {
 /**
  * struct vdec_h264_slice_inst - h264 decoder instance
  *
- * @slice_dec_num:	how many picture be decoded
+ * @slice_dec_num:	how many pictures to be decoded
  * @ctx:		point to mtk_vcodec_dec_ctx
  * @pred_buf:		HW working prediction buffer
  * @mv_buf:		HW working motion vector buffer
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index a44db6139ff2..349b510d355a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -342,7 +342,7 @@ struct vdec_hevc_slice_share_info {
 /**
  * struct vdec_hevc_slice_inst - hevc decoder instance
  *
- * @slice_dec_num:      how many picture be decoded
+ * @slice_dec_num:      how many pictures to be decoded
  * @ctx:                point to mtk_vcodec_dec_ctx
  * @mv_buf:             HW working motion vector buffer
  * @vpu:                VPU instance
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
index 19407f9bc773..9649f4ec1f2a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
@@ -56,7 +56,7 @@
  * @cur_c_fb_dma      : current plane C frame buffer dma address
  * @bs_dma	      : bitstream dma address
  * @bs_sz	      : bitstream size
- * @resolution_changed: resolution change flag 1 - changed,  0 - not change
+ * @resolution_changed: resolution change flag 1 - changed,  0 - not changed
  * @show_frame	      : display this frame or not
  * @wait_key_frame    : wait key frame coming
  */
@@ -109,7 +109,7 @@ struct vdec_vp8_hw_reg_base {
 /**
  * struct vdec_vp8_vpu_inst - VPU instance for VP8 decode
  * @wq_hd	: Wait queue to wait VPU message ack
- * @signaled	: 1 - Host has received ack message from VPU, 0 - not receive
+ * @signaled	: 1 - Host has received ack message from VPU, 0 - not received
  * @failure	: VPU execution result status 0 - success, others - fail
  * @inst_addr	: VPU decoder instance address
  */
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
index f677e499fefa..e27e728f392e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
@@ -35,7 +35,7 @@
  * @cur_c_fb_dma:	current plane C frame buffer dma address
  * @bs_dma:		bitstream dma address
  * @bs_sz:		bitstream size
- * @resolution_changed:resolution change flag 1 - changed,  0 - not change
+ * @resolution_changed:resolution change flag 1 - changed,  0 - not changed
  * @frame_header_type:	current frame header type
  * @crc:		used to check whether hardware's status is right
  * @reserved:		reserved, currently unused

-- 
2.25.1

