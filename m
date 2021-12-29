Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FCDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 06:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1lWD8xJkb/1NneCgAH+QtkNtg0C94SxxrSsUYwamow=; b=Ig42z9ssBY27H+
	w+tbXPFTwfQcKNVgCXyzVLDJMUbfsfdyXCARAOiANpRrA8qMIEs7I7aZT0ms76kQwdJCoF432bkoV
	goQ7GvNFOS7d6sUrCMy0p/8bVlHk1+Ul+EA+4PGDFAP3czVUqn+mN97gArZUQZuaJsIoQ4t3F7/Fv
	80REh29xyiMhq0brYF40aZBMmV4yoHC8jlNBfkFXNmRnkBV3QjB76DY/6taiAH+jBKPLIkdcLFtbU
	qQdmF8250Kf6rjopODtnyg/gEJV6H5WBYVbvqugXp34H4K8Bvj8pd02dvEgOXuxT6VnSwh8CdktqC
	OXfS8+oFLz2/ycjnojcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2SpH-002Mer-99; Wed, 29 Dec 2021 06:52:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Sp5-002Mcw-3E; Wed, 29 Dec 2021 06:52:33 +0000
X-UUID: 3ac73bca414342b9b786aa12233ad61c-20211228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=q3YWfjU6Q4Biwiymx+/oPiEp77CZ3uaLyS+aHaNVoYo=; 
 b=fDx6y/eVkgkDqbaE+ooL83pTDV2saRr6p6tIjassk1z+bwa8dAbeN7pjary7RZPv5SnJpvdjQZbpm3FdDCC0TqgNK6iD47ZKLC+Ecsq0sdFFV/6HA8gPs7exKnTOjzOjuLnryji5h00DtH3CnvPHPI6d8JskO8kPzMb4MdOZZEk=;
X-UUID: 3ac73bca414342b9b786aa12233ad61c-20211228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1068581387; Tue, 28 Dec 2021 23:52:26 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Dec 2021 22:52:25 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 29 Dec 2021 14:52:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Dec 2021 14:52:21 +0800
Message-ID: <8102ba18b3fdcc19e6b9f53c7a635ffc084c825b.camel@mediatek.com>
Subject: Re: [PATCH v2, 03/12] media: mtk-vcodec: get capture queue buffer
 size from scp
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 29 Dec 2021 14:52:21 +0800
In-Reply-To: <Ycvz4UrmbngVzIv2@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-4-yunfei.dong@mediatek.com>
 <Ycvz4UrmbngVzIv2@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_225231_155785_1B3D8A33 
X-CRM114-Status: GOOD (  34.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tzung-Bi,

Thanks for your suggestion.
On Wed, 2021-12-29 at 13:36 +0800, Tzung-Bi Shih wrote:
> On Tue, Dec 28, 2021 at 05:41:37PM +0800, Yunfei Dong wrote:
> > From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> 
> [...]
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > index 130ecef2e766..87891ebd7246 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > @@ -466,6 +466,8 @@ static int vidioc_vdec_s_fmt(struct file *file,
> > void *priv,
> >  			}
> >  			ctx->state = MTK_STATE_INIT;
> >  		}
> > +	} else {
> > +		ctx->capture_fourcc = fmt->fourcc;
> >  	}
> >  
> >  	/*
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index a23a7646437c..95e07cf2cd3e 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -277,6 +277,7 @@ struct vdec_pic_info {
> >   *		     to be used with encoder and stateful decoder.
> >   * @is_flushing: set to true if flushing is in progress.
> >   * @current_codec: current set input codec, in V4L2 pixel format
> > + * @capture_fourcc: capture queue type in V4L2 pixel format
> >   *
> >   * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
> >   * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
> > @@ -322,6 +323,7 @@ struct mtk_vcodec_ctx {
> >  	bool is_flushing;
> >  
> >  	u32 current_codec;
> > +	u32 capture_fourcc;
> 
> What is the purpose of capture_fourcc?  It is not used.
> 
Need to calculate each plane size according to capture fourcc type from
scp. The plane size of MM21 is different with MT21C. And the capture
fourcc type of different codec maybe different.  
> > +/**
> > + * struct vdec_ap_ipi_get_param - for AP_IPIMSG_SET_PARAM
> > + * @msg_id	: AP_IPIMSG_DEC_START
> > + * @inst_id     : instance ID. Used if the ABI version >= 2.
> > + * @data	: picture information
> > + * @param_type	: get param type
> > + * @codec_type	: Codec fourcc
> > + */
> > +struct vdec_ap_ipi_get_param {
> > +	uint32_t msg_id;
> > +	uint32_t inst_id;
> > +	uint32_t data[4];
> > +	uint32_t param_type;
> > +	uint32_t codec_type;
> > +};
> 
> Are AP_IPIMSG_SET_PARAM and AP_IPIMSG_DEC_START typos?
> 
It's getting message from scp side. It's looks much better to add one
new path from ap to scp.
> > +/**
> > + * struct vdec_vpu_ipi_init_ack - for VPU_IPIMSG_DEC_INIT_ACK
> > + * @msg_id	: VPU_IPIMSG_DEC_INIT_ACK
> > + * @status	: VPU exeuction result
> > + * @ap_inst_addr	: AP vcodec_vpu_inst instance address
> > + * @data     : picture information from SCP.
> > + * @param_type	: get param type
> > + */
> > +struct vdec_vpu_ipi_get_param_ack {
> > +	uint32_t msg_id;
> > +	int32_t status;
> > +	uint64_t ap_inst_addr;
> > +	uint32_t data[4];
> > +	uint32_t param_type;
> > +	uint32_t reserved;
> > +};
> 
> Same here: is VPU_IPIMSG_DEC_INIT_ACK a typo?
> 
It's getting message from scp side. It's looks much better to add one new path from ap to scp.> What is the purpose of the "reserved" field?
> 
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> > b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> 
"Reserved" is used to let the size of struct is 64 alinged. And maybe
used in the future to extend.
> [...]
> > +static void handle_get_param_msg_ack(
> > +	const struct vdec_vpu_ipi_get_param_ack *msg)
> > +{
> > +	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
> > +					(unsigned long)msg-
> > >ap_inst_addr;
> 
> Does it really need to cast twice?
> 
I will check whether it's possible to remove: (unsigned long)
> > .+
> > +	mtk_vcodec_debug(vpu, "+ ap_inst_addr = 0x%llx", msg-
> > >ap_inst_addr);
> > +
> > +	/* param_type is enum vdec_get_param_type */
> > +	switch(msg->param_type) {
> > +	case 2:
> 
> What is 2?  Is it GET_PARAM_PIC_INFO?
> 
Yes, it's GET_PARAM_PIC_INFO.
> > +int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
> > +	unsigned int len, unsigned int param_type)
> > +{
> > +	struct vdec_ap_ipi_get_param msg;
> > +	int i;
> > +	int err;
> > +
> > +	mtk_vcodec_debug_enter(vpu);
> > +
> > +	if (len > ARRAY_SIZE(msg.data)) {
> > +		mtk_vcodec_err(vpu, "invalid len = %d\n", len);
> > +		return -EINVAL;
> > +	}
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.msg_id = AP_IPIMSG_DEC_GET_PARAM;
> > +	msg.inst_id = vpu->inst_id;
> > +	for (i = 0; i < len; i++)
> > +		msg.data[i] = data[i];
> 
> Would it be more concise if using memcpy?
> 
Can be fixed.
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > index 4cb3c7f5a3ad..963f8d4877b7 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > @@ -28,6 +28,8 @@ struct mtk_vcodec_ctx;
> >   * @wq          : wait queue to wait VPU message ack
> >   * @handler     : ipi handler for each decoder
> >   * @codec_type     : use codec type to separate different codecs
> > + * @capture_type    : used capture type to separate different
> > capture format
> > + * @fb_sz  : frame buffer size of each plane
> >   */
> >  struct vdec_vpu_inst {
> >  	int id;
> > @@ -42,6 +44,8 @@ struct vdec_vpu_inst {
> >  	wait_queue_head_t wq;
> >  	mtk_vcodec_ipi_handler handler;
> >  	unsigned int codec_type;
> > +	unsigned int capture_type;
> > +	unsigned int fb_sz[2];
> >  };
> 
> capture_type is not used in the patch.
> 
Capture type will be used in scp to get capture plane size according to
capture buffer type.
> Does fb_sz take effect in later patches?

Don't have effect to later patches.

Thanks,
Yunfei Dong
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
