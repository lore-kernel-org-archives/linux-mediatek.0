Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAC1C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 11:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Sc8Gwb5/VBXc4/8kAJE2lTKRhreTCBJCxEItFeyo+k=; b=xKo20XP3a9y2S6ZxnOP4otTKXc
	MTkQQZV5tn7zvFZyQaXuuXp6t7Eo6Zi3TItYrxe19VL4OZQnPh9LFqSc3eqtQFQTlVJFxfQ5RYJO+
	zRSkhdCdN005tl+cE7iK02k4hmhJPBX9YqcKPKagf7Nzj+OsWI9meXej7AZjdOqyQgVGddTBICxnp
	+OdoD9/Q0W81RyPtvIfNhHM4NLtCmI8uOGLRo8/voFrnQIg7Y6wlFKpHUrsAc/I4G6dHLjYwxE0hy
	NdDAv1NyBAFocqkgdQvEqvIoMnfRKyBNccOBm0XFxq/HdtyeeSGPSgWdWza53gyFO4tNUS8/a7L2f
	4hIfXKcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okl1w-006B6m-Ch; Tue, 18 Oct 2022 11:45:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okl1t-006Avv-Qj; Tue, 18 Oct 2022 11:45:07 +0000
X-UUID: 1761fccc60e3466f9f4c3c2020f56a65-20221018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=9Sc8Gwb5/VBXc4/8kAJE2lTKRhreTCBJCxEItFeyo+k=;
	b=RtsAULFIj89HxzpvfUV3Tnc1HKinIsY8ao3+J6iBbiIoqPqfBpvl9Wk4v6bfgyErQrQeZmJbOk49XtGD8m993WFO586eiHMjd5rwCxm0W9uD9hMRypcUarHXvgsa0MAvJy6wTkpv5MyRgM4pwyV2YUXgdHFhVd7P6C4k5CutqQY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:224af913-eba1-44c2-80ca-89374b4a6f72,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:91732aa3-73e4-48dd-a911-57b5d5484f14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1761fccc60e3466f9f4c3c2020f56a65-20221018
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1640686917; Tue, 18 Oct 2022 04:44:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 18 Oct 2022 19:44:18 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 Oct 2022 19:44:17 +0800
Message-ID: <087750f4a7d334c03a5eda1fd2e2b3573792ec33.camel@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: fix h264 cavlc bitstream fail
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, George Sun <george.sun@mediatek.com>, Xiaoyong Lu
	<xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho
	<stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 18 Oct 2022 19:44:16 +0800
In-Reply-To: <CAGXv+5G5Lr6rCB0D+q9egRFmhAzpGL49dNrQeCT8JpeUT+OiAA@mail.gmail.com>
References: <20221017090208.19041-1-yunfei.dong@mediatek.com>
	 <CAGXv+5G5Lr6rCB0D+q9egRFmhAzpGL49dNrQeCT8JpeUT+OiAA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_044505_905343_7F2F9C7E 
X-CRM114-Status: GOOD (  27.82  )
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

Hi Chen-Yu,

Thanks for your suggestion.
On Tue, 2022-10-18 at 17:55 +0800, Chen-Yu Tsai wrote:
> On Mon, Oct 17, 2022 at 5:02 PM Yunfei Dong <yunfei.dong@mediatek.com
> > wrote:
> > 
> > Some cavlc bistream will decode fail when the frame size is small
> > than
> > 20 bytes. Need to add pending data at the end of the bitstream.
> 
> "magic terminating pattern" instead of "pending data"?
> 
> > For the size of mapped memory is at least one page, adding four
> > bytes data
> > won't lead to access unknown virtual memory.
> 
> Actually we can narrow this down a bit. The minimum dimension (16x16)
> sets the minimum size of the buffer at 256 bytes.
> 
Fix in patch v2.
> > Fixes: 59fba9eed5a7 ("media: mediatek: vcodec: support stateless
> > H.264 decoding for mt8192")
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  .../vcodec/vdec/vdec_h264_req_multi_if.c      | 27
> > ++++++++++++++++---
> >  1 file changed, 24 insertions(+), 3 deletions(-)
> > 
> > diff --git
> > a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> > f.c
> > b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> > f.c
> > index 4cc92700692b..c1583dddcb04 100644
> > ---
> > a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> > f.c
> > +++
> > b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> > f.c
> > @@ -539,6 +539,24 @@ static int vdec_h264_slice_core_decode(struct
> > vdec_lat_buf *lat_buf)
> >         return 0;
> >  }
> > 
> > +static void vdec_h264_insert_startcode(struct mtk_vcodec_dev
> > *vcodec_dev, unsigned char *buf,
> > +                                      size_t *bs_size, struct
> > mtk_h264_pps_param *pps)
> > +{
> > +       struct device *dev = &vcodec_dev->plat_dev->dev;
> > +
> > +       /* cavlc bitstream when entropy_coding_mode_flag is false.
> > */
> > +       if (pps->entropy_coding_mode_flag || *bs_size > 20 ||
> > +           !(of_device_is_compatible(dev->of_node,
> > "mediatek,mt8192-vcodec-dec") ||
> > +           of_device_is_compatible(dev->of_node, "mediatek,mt8195-
> > vcodec-dec")))
> > +               return;
> > +
> 
> There should be a comment here describing what is added.
> 
Fix in patch v2.
> 
> ChenYu
> 
Best Regards,
Yunfei Dong
> > +       buf[*bs_size] = 0;
> > +       buf[*bs_size + 1] = 0;
> > +       buf[*bs_size + 2] = 1;
> > +       buf[*bs_size + 3] = 0xff;
> > +       (*bs_size) += 4;
> > +}
> > +
> >  static int vdec_h264_slice_lat_decode(void *h_vdec, struct
> > mtk_vcodec_mem *bs,
> >                                       struct vdec_fb *fb, bool
> > *res_chg)
> >  {
> > @@ -582,9 +600,6 @@ static int vdec_h264_slice_lat_decode(void
> > *h_vdec, struct mtk_vcodec_mem *bs,
> >         }
> > 
> >         inst->vsi->dec.nal_info = buf[nal_start_idx];
> > -       inst->vsi->dec.bs_buf_addr = (u64)bs->dma_addr;
> > -       inst->vsi->dec.bs_buf_size = bs->size;
> > -
> >         lat_buf->src_buf_req = src_buf_info-
> > >m2m_buf.vb.vb2_buf.req_obj.req;
> >         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
> > &lat_buf->ts_info, true);
> > 
> > @@ -592,6 +607,12 @@ static int vdec_h264_slice_lat_decode(void
> > *h_vdec, struct mtk_vcodec_mem *bs,
> >         if (err)
> >                 goto err_free_fb_out;
> > 
> > +       vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size,
> > +                                  &share_info-
> > >h264_slice_params.pps);
> > +
> > +       inst->vsi->dec.bs_buf_addr = (uint64_t)bs->dma_addr;
> > +       inst->vsi->dec.bs_buf_size = bs->size;
> > +
> >         *res_chg = inst->resolution_changed;
> >         if (inst->resolution_changed) {
> >                 mtk_vcodec_debug(inst, "- resolution changed -");
> > --
> > 2.25.1
> > 


