Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B34C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 05:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6+jmZ3hHnUVN/Ufb2IEBPJzDaUcxLu8kIG0vFDi2lg=; b=ykNLmXnixd0n1U
	oT3Vw3FX1ptA++JRoXD150Zz20tyflQwp+4iVIJ5GdyWYhXw+QvyrCbwTEUQQZpRbpLIBZ2GRJ4ll
	i4tTFgIOQ5sn+zeoIccF6vNFHWXTIPkIj1YtEMd/KsOJIqnCKfFdoqOA4lCQH7BuezXuvJy8Hzb/A
	CT5hxIheS827PWKrNxKpR/kS3o9wnJ55Lf3/tENRWJTHOAoyuV1nqol70MJul04OVi7mpA2oXiRf7
	Ox80JaO5VUgwE4m7iN6e6RZxzrxPP6E1m6gKQJdUwevd7zu2+crRmZY+uMV2U8BzgmcI9HBbxGCZu
	4c6ajsRWu4TH/6sxSr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Rdt-002HUY-2Q; Wed, 29 Dec 2021 05:36:53 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Rdf-002HPA-CO
 for linux-mediatek@lists.infradead.org; Wed, 29 Dec 2021 05:36:40 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so18937944pjb.5
 for <linux-mediatek@lists.infradead.org>; Tue, 28 Dec 2021 21:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EVZZSsnSEbk7FiSuXX+j6iG5Lve1o+shP8m0TVPd8J8=;
 b=WsQpdWNkOJElVUBxeh5GzoA4UyY1aiQJlLuHojZ6bQZvDE5LeRnTfE0R4JryGCIPsd
 kku9tZLNxpWLlYnq01UZs7WKrRgq535q8NHUDrxwxrIIJ5ZcdnDIh6buMSm/wRS7cXaK
 adC5EF2/u6uO2INPoxF3WWe6G8nMZ/IiHlOxMb5OUDLSa9pQyL8t/n/O1OQhgdTk7KdX
 iDm5JUkuiQ6WE+1D26dnVcDwvo+JmKB91CN0yN+mBxh4Y1pjNnbKPRWYp8QAY13rKSkx
 UE6fDAPAzqEXvUwUmNG6sKbKhgE8HrGTHJrujglxxy4ckQUQpWaM3oSM/OAWjPMe9/7N
 3zqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EVZZSsnSEbk7FiSuXX+j6iG5Lve1o+shP8m0TVPd8J8=;
 b=RgHF3zcrrGKzSZi2gZBu9XL+PSrPwXkK7w2ls1aQMz08JwGStI5u1zfn0VMDibBX4/
 eaYHMaG1RPPTanESOlT20UllxWrSbWEN1RlJS7TyA+ymTBPuVBVbjf/n4PG5Mfi9gcnw
 5JOjzICKkJn6znDG014qgzBnYCMTFYmz4M/YxmUAo9E+7y3RH2cA9NkjrTOvy0LwlfRC
 ZUcp3U8uqdN6A9IPTsqWOqLP0ELcKNA0dfS3MRYxvWI/Td7bOreY01mOTaAJYtYHs1M0
 lsKlyOPY56HhY4YDWxGmBDaVwZFbkHn0D5LsBO4Pd3/2aJMnJeeLyIwYonLlDKR8OBd9
 phbg==
X-Gm-Message-State: AOAM5300YHOxWRu06WXQRbdclCgNqGDn4ujkSRkBRzA7JfnUpnaLYfbw
 hmy2zk9cbu0S32Fsgoc/XOCZzw==
X-Google-Smtp-Source: ABdhPJwEZCf+klU3yVnt1OAgcOs+vsB+j1kqeIrZKK1OcHaKrQKyI3nRkSTVgdzT2hb0Ehi2sQwGTQ==
X-Received: by 2002:a17:902:be0f:b0:149:5535:287b with SMTP id
 r15-20020a170902be0f00b001495535287bmr24413705pls.28.1640756198303; 
 Tue, 28 Dec 2021 21:36:38 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4dea:2b20:ea89:724b])
 by smtp.gmail.com with ESMTPSA id h17sm18129074pfv.217.2021.12.28.21.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 21:36:38 -0800 (PST)
Date: Wed, 29 Dec 2021 13:36:33 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2, 03/12] media: mtk-vcodec: get capture queue buffer
 size from scp
Message-ID: <Ycvz4UrmbngVzIv2@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-4-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211228094146.20505-4-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_213639_452496_F01F9BD6 
X-CRM114-Status: GOOD (  28.05  )
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

On Tue, Dec 28, 2021 at 05:41:37PM +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
[...]
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index 130ecef2e766..87891ebd7246 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -466,6 +466,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
>  			}
>  			ctx->state = MTK_STATE_INIT;
>  		}
> +	} else {
> +		ctx->capture_fourcc = fmt->fourcc;
>  	}
>  
>  	/*
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index a23a7646437c..95e07cf2cd3e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -277,6 +277,7 @@ struct vdec_pic_info {
>   *		     to be used with encoder and stateful decoder.
>   * @is_flushing: set to true if flushing is in progress.
>   * @current_codec: current set input codec, in V4L2 pixel format
> + * @capture_fourcc: capture queue type in V4L2 pixel format
>   *
>   * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
>   * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
> @@ -322,6 +323,7 @@ struct mtk_vcodec_ctx {
>  	bool is_flushing;
>  
>  	u32 current_codec;
> +	u32 capture_fourcc;

What is the purpose of capture_fourcc?  It is not used.

> +/**
> + * struct vdec_ap_ipi_get_param - for AP_IPIMSG_SET_PARAM
> + * @msg_id	: AP_IPIMSG_DEC_START
> + * @inst_id     : instance ID. Used if the ABI version >= 2.
> + * @data	: picture information
> + * @param_type	: get param type
> + * @codec_type	: Codec fourcc
> + */
> +struct vdec_ap_ipi_get_param {
> +	uint32_t msg_id;
> +	uint32_t inst_id;
> +	uint32_t data[4];
> +	uint32_t param_type;
> +	uint32_t codec_type;
> +};

Are AP_IPIMSG_SET_PARAM and AP_IPIMSG_DEC_START typos?

> +/**
> + * struct vdec_vpu_ipi_init_ack - for VPU_IPIMSG_DEC_INIT_ACK
> + * @msg_id	: VPU_IPIMSG_DEC_INIT_ACK
> + * @status	: VPU exeuction result
> + * @ap_inst_addr	: AP vcodec_vpu_inst instance address
> + * @data     : picture information from SCP.
> + * @param_type	: get param type
> + */
> +struct vdec_vpu_ipi_get_param_ack {
> +	uint32_t msg_id;
> +	int32_t status;
> +	uint64_t ap_inst_addr;
> +	uint32_t data[4];
> +	uint32_t param_type;
> +	uint32_t reserved;
> +};

Same here: is VPU_IPIMSG_DEC_INIT_ACK a typo?

What is the purpose of the "reserved" field?

> diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
[...]
> +static void handle_get_param_msg_ack(
> +	const struct vdec_vpu_ipi_get_param_ack *msg)
> +{
> +	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
> +					(unsigned long)msg->ap_inst_addr;

Does it really need to cast twice?

> +
> +	mtk_vcodec_debug(vpu, "+ ap_inst_addr = 0x%llx", msg->ap_inst_addr);
> +
> +	/* param_type is enum vdec_get_param_type */
> +	switch(msg->param_type) {
> +	case 2:

What is 2?  Is it GET_PARAM_PIC_INFO?

> +int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
> +	unsigned int len, unsigned int param_type)
> +{
> +	struct vdec_ap_ipi_get_param msg;
> +	int i;
> +	int err;
> +
> +	mtk_vcodec_debug_enter(vpu);
> +
> +	if (len > ARRAY_SIZE(msg.data)) {
> +		mtk_vcodec_err(vpu, "invalid len = %d\n", len);
> +		return -EINVAL;
> +	}
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.msg_id = AP_IPIMSG_DEC_GET_PARAM;
> +	msg.inst_id = vpu->inst_id;
> +	for (i = 0; i < len; i++)
> +		msg.data[i] = data[i];

Would it be more concise if using memcpy?

> diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> index 4cb3c7f5a3ad..963f8d4877b7 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> @@ -28,6 +28,8 @@ struct mtk_vcodec_ctx;
>   * @wq          : wait queue to wait VPU message ack
>   * @handler     : ipi handler for each decoder
>   * @codec_type     : use codec type to separate different codecs
> + * @capture_type    : used capture type to separate different capture format
> + * @fb_sz  : frame buffer size of each plane
>   */
>  struct vdec_vpu_inst {
>  	int id;
> @@ -42,6 +44,8 @@ struct vdec_vpu_inst {
>  	wait_queue_head_t wq;
>  	mtk_vcodec_ipi_handler handler;
>  	unsigned int codec_type;
> +	unsigned int capture_type;
> +	unsigned int fb_sz[2];
>  };

capture_type is not used in the patch.

Does fb_sz take effect in later patches?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
