Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AAEC5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 15:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1/3J+TPUGV+qRCrsUK4pHSmDe6bCMc8bf4L/tyoPRI=; b=jdUlHJmalqsx2/5cfPEZ2Q6yD2
	3kLbpqyFV0DFDFKFtJhq9OMb/vjiX+32+7lkxFjbcQdBb37MnrxOeuDh7BDYTcxvYF6Nd/Suiw1NZ
	awR1C/287OqH3P7tYjoGPkLdl0U64X0SgFE1uL4aSiOMM3R/T3n2irjHPlLtWTD3eSfSbLRKpjwwR
	N9HFlIoCKJXf2PFFwz/e539lZXrE4a1KX1/p3i575U/K3iQwcpN/CDtVoHEc0PzozcL2mtQoApkgJ
	ONUD0+Uh4qvSHxLBymRhmmnQhisvXPLtXTBRs5cwlWSYAMOFFsjmLPY4TrVtiEobLOen81YO/pWyf
	dVcBeqzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg4a7-00000000qyp-0AIK;
	Fri, 01 Mar 2024 15:13:51 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg4a2-00000000qwD-3iBd;
	Fri, 01 Mar 2024 15:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709306025;
	bh=4rZ9IbsP+jzXlyf93oCqikrl4goIvycpLqfPlaupifE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cFr943yljX1l29kjUPcrBU5FIpLB198EJMjLvS/ryE6Ezqbx+OR9RUYD7cFXVaTsy
	 eKe5Undn9T2NKbYG4IyGD5kPHTNaJx+DjzDYPcJZzmYYyi2SrK0b9xPkU41enEk5Jz
	 Qtezyhl+v/PPqcKZez9sNs/GCjZ4QW6qhH4t5OUZxQgTilW00/9uUsa73MIgfAD3jB
	 HGgsE+kt8PlKqC9YeYh1QUJvSJAo0b3vzP/ZYmL+VStaMcL9NqZPkWFjhusC7w/BCJ
	 uyPf/p9mYObaazGC1OdSdU2vo6N1qn+sNFYUMqRG+HWtBTZfqYbHqaWbIBHZD0LaGI
	 imZWsQW0Jag9w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1253437803EE;
	Fri,  1 Mar 2024 15:13:45 +0000 (UTC)
Date: Fri, 1 Mar 2024 16:13:44 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	angelogioacchino.delregno@collabora.com,
	nicolas.dufresne@collabora.com,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Longfei Wang <longfei.wang@mediatek.com>,
	Maoguang Meng <maoguang.meng@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] media: mediatek: vcodec: Handle VP9 superframe
 bitstream with 8 sub-frames
Message-ID: <20240301151344.o7khwhbasnncw2cc@basti-XPS-13-9310>
References: <20240229030249.3404-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240229030249.3404-1-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_071347_159598_C815E0E6 
X-CRM114-Status: GOOD (  16.01  )
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

Hey Irui,

On 29.02.2024 11:02, Irui Wang wrote:
>The VP9 bitstream has 8 sub-frames into one superframe, the superframe
>index validate failed when reach 8, modify the index checking so that the
>last sub-frame can be decoded normally with stateful vp9 decoder.

I find this commit message a bit confusing, you say that you couldn't
index the last superframe, but then you say that you modify the index
checking so that you can access the last sub-frame.

I would reword this section, here is my suggestion:

The VP9 bitstream uses superframes, which each contain 8 sub-frames,
enable accessing the last superframe by increasing the range of the
index validation as the maximum number of superframes is 8 and not 7.

The rest looks good as already mentioned by Nicolas.

Greetings,
Sebastian

>
>Signed-off-by: Irui Wang <irui.wang@mediatek.com>
>---
>changed with v1:
> - add a new define 'VP9_MAX_SUPER_FRAMES_NUM' for superframes.
>---
> .../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c        | 11 ++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
>index 55355fa70090..039082f600c8 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
>@@ -16,6 +16,7 @@
> #include "../vdec_drv_base.h"
> #include "../vdec_vpu_if.h"
>
>+#define VP9_MAX_SUPER_FRAMES_NUM 8
> #define VP9_SUPER_FRAME_BS_SZ 64
> #define MAX_VP9_DPB_SIZE	9
>
>@@ -133,11 +134,11 @@ struct vp9_sf_ref_fb {
>  */
> struct vdec_vp9_vsi {
> 	unsigned char sf_bs_buf[VP9_SUPER_FRAME_BS_SZ];
>-	struct vp9_sf_ref_fb sf_ref_fb[VP9_MAX_FRM_BUF_NUM-1];
>+	struct vp9_sf_ref_fb sf_ref_fb[VP9_MAX_SUPER_FRAMES_NUM];
> 	int sf_next_ref_fb_idx;
> 	unsigned int sf_frm_cnt;
>-	unsigned int sf_frm_offset[VP9_MAX_FRM_BUF_NUM-1];
>-	unsigned int sf_frm_sz[VP9_MAX_FRM_BUF_NUM-1];
>+	unsigned int sf_frm_offset[VP9_MAX_SUPER_FRAMES_NUM];
>+	unsigned int sf_frm_sz[VP9_MAX_SUPER_FRAMES_NUM];
> 	unsigned int sf_frm_idx;
> 	unsigned int sf_init;
> 	struct vdec_fb fb;
>@@ -526,7 +527,7 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *inst)
> 	/* if this super frame and it is not last sub-frame, get next fb for
> 	 * sub-frame decode
> 	 */
>-	if (vsi->sf_frm_cnt > 0 && vsi->sf_frm_idx != vsi->sf_frm_cnt - 1)
>+	if (vsi->sf_frm_cnt > 0 && vsi->sf_frm_idx != vsi->sf_frm_cnt)
> 		vsi->sf_next_ref_fb_idx = vp9_get_sf_ref_fb(inst);
> }
>
>@@ -735,7 +736,7 @@ static void get_free_fb(struct vdec_vp9_inst *inst, struct vdec_fb **out_fb)
>
> static int validate_vsi_array_indexes(struct vdec_vp9_inst *inst,
> 		struct vdec_vp9_vsi *vsi) {
>-	if (vsi->sf_frm_idx >= VP9_MAX_FRM_BUF_NUM - 1) {
>+	if (vsi->sf_frm_idx > VP9_MAX_SUPER_FRAMES_NUM) {
> 		mtk_vdec_err(inst->ctx, "Invalid vsi->sf_frm_idx=%u.", vsi->sf_frm_idx);
> 		return -EIO;
> 	}
>-- 
>2.18.0
>
>

