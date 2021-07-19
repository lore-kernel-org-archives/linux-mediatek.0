Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7EFC07E9B
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 10:27:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 546BE60233
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 10:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 546BE60233
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BJZ3Hp75i2oWnIgUOOPqxfJiN7RZVnsYeT37Kiolt4=; b=d79vl9m0sxCB4m+oa3LsnPAMvt
	60iFU/b5+gNkLFSVJ/2J3qK01lTul6jpvJS2OSSvn8FIa2khobasAM6aeqIUY9PbJCJD0Cd9Kyd4e
	pDAYBbkh7ZWC7SmZogdgOwhm1WBvejashsM9+rdJ7iZmP7ZCnOrNEmBmZ5grhSMeQUKGLfrpZoBj3
	35Kjo97qz1fB0k3gN+wQEkaRURvjCxvkAHrSU0OmEe+Z70M1ewjpm7dh9RcaVkrSnrqRxx08WlZaA
	lchuJwwyFIcPhp2LXVw3lbQfU7zVSXH2SpROdfW5lkDMTo1R6Cb1mg7/8U4NZATlzEG050w/X6DJH
	/nYAToLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5QU8-009GOP-3O; Mon, 19 Jul 2021 10:26:52 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5QTu-009GLt-A4; Mon, 19 Jul 2021 10:26:40 +0000
Received: from [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc] (unknown
 [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 239FD1F42572;
 Mon, 19 Jul 2021 11:26:36 +0100 (BST)
Subject: Re: [PATCH v2, 14/14] media: mtk-vcodec: Use codec type to separate
 different hardware
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Collabora Kernel ML <kernel@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
 <20210717081233.7809-15-yunfei.dong@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <7d2a7f79-850a-bdc7-bbda-ae36c5a5ab4b@collabora.com>
Date: Mon, 19 Jul 2021 12:26:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717081233.7809-15-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_032638_669368_618CD73A 
X-CRM114-Status: GOOD (  29.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 17.07.21 10:12, Yunfei Dong wrote:
> There are just one core thread, in order to separeate different
> hardware, using codec type to separeate it in scp driver.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v2: no changes
> ---
>   .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 12 ++++---
>   .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 34 ++++++++++++++++---
>   .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  4 +++
>   3 files changed, 41 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> index 9d8079c4f976..c488f0c40190 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> @@ -35,6 +35,8 @@ enum vdec_ipi_msgid {
>    * @msg_id	: vdec_ipi_msgid
>    * @vpu_inst_addr : VPU decoder instance address. Used if ABI version < 2.
>    * @inst_id     : instance ID. Used if the ABI version >= 2.
> + * @codec_type	: Codec fourcc
> + * @reserved	: reserved param
>    */
>   struct vdec_ap_ipi_cmd {
>   	uint32_t msg_id;
> @@ -42,6 +44,8 @@ struct vdec_ap_ipi_cmd {
>   		uint32_t vpu_inst_addr;
>   		uint32_t inst_id;
>   	};
> +	uint32_t codec_type;
> +	uint32_t reserved;
>   };
>   
>   /**
> @@ -59,12 +63,12 @@ struct vdec_vpu_ipi_ack {
>   /**
>    * struct vdec_ap_ipi_init - for AP_IPIMSG_DEC_INIT
>    * @msg_id	: AP_IPIMSG_DEC_INIT
> - * @reserved	: Reserved field
> + * @codec_type	: Codec fourcc
>    * @ap_inst_addr	: AP video decoder instance address
>    */
>   struct vdec_ap_ipi_init {
>   	uint32_t msg_id;
> -	uint32_t reserved;
> +	uint32_t codec_type;
>   	uint64_t ap_inst_addr;
>   };
>   
> @@ -77,7 +81,7 @@ struct vdec_ap_ipi_init {
>    *	H264 decoder [0]:buf_sz [1]:nal_start
>    *	VP8 decoder  [0]:width/height
>    *	VP9 decoder  [0]:profile, [1][2] width/height
> - * @reserved	: Reserved field
> + * @codec_type	: Codec fourcc
>    */
>   struct vdec_ap_ipi_dec_start {
>   	uint32_t msg_id;
> @@ -86,7 +90,7 @@ struct vdec_ap_ipi_dec_start {
>   		uint32_t inst_id;
>   	};
>   	uint32_t data[3];
> -	uint32_t reserved;
> +	uint32_t codec_type;
>   };
>   
>   /**
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> index bfd8e87dceff..c84fac52fe26 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> @@ -100,18 +100,29 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
>   
>   static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
>   {
> -	int err;
> +	int err, id, msgid;
>   
> -	mtk_vcodec_debug(vpu, "id=%X", *(uint32_t *)msg);
> +	msgid = *(uint32_t *)msg;
> +	mtk_vcodec_debug(vpu, "id=%X", msgid);
>   
>   	vpu->failure = 0;
>   	vpu->signaled = 0;
>   
> -	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, vpu->id, msg,
> +	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
> +		if (msgid == AP_IPIMSG_DEC_CORE ||
> +			msgid == AP_IPIMSG_DEC_CORE_END)
> +			id = vpu->core_id;
> +		else
> +			id = vpu->id;
> +	} else {
> +		id = vpu->id;
> +	}
> +
> +	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, id, msg,
>   				     len, 2000);
>   	if (err) {
>   		mtk_vcodec_err(vpu, "send fail vpu_id=%d msg_id=%X status=%d",
> -			       vpu->id, *(uint32_t *)msg, err);
> +			       id, msgid, err);
>   		return err;
>   	}
>   
> @@ -131,6 +142,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
>   		msg.vpu_inst_addr = vpu->inst_addr;
>   	else
>   		msg.inst_id = vpu->inst_id;
> +	msg.codec_type = vpu->codec_type;
>   
>   	err = vcodec_vpu_send_msg(vpu, &msg, sizeof(msg));
>   	mtk_vcodec_debug(vpu, "- id=%X ret=%d", msg_id, err);
> @@ -149,14 +161,25 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
>   
>   	err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
>   					 vpu->handler, "vdec", NULL);
> -	if (err != 0) {
> +	if (err) {
>   		mtk_vcodec_err(vpu, "vpu_ipi_register fail status=%d", err);
>   		return err;
>   	}
>   
> +	if (vpu->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE) {
> +		err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler,
> +					 vpu->core_id, vpu->handler,
> +					 "vdec", NULL);

where is vpu->core_id initialized?

Thanks,
Dafna

> +		if (err) {
> +			mtk_vcodec_err(vpu, "vpu_ipi_register core fail status=%d", err);
> +			return err;
> +		}
> +	}
> +
>   	memset(&msg, 0, sizeof(msg));
>   	msg.msg_id = AP_IPIMSG_DEC_INIT;
>   	msg.ap_inst_addr = (unsigned long)vpu;
> +	msg.codec_type = vpu->codec_type;
>   
>   	mtk_vcodec_debug(vpu, "vdec_inst=%p", vpu);
>   
> @@ -187,6 +210,7 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
>   
>   	for (i = 0; i < len; i++)
>   		msg.data[i] = data[i];
> +	msg.codec_type = vpu->codec_type;
>   
>   	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
>   	mtk_vcodec_debug(vpu, "- ret=%d", err);
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> index ae24b75d1649..802660770a87 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> @@ -14,6 +14,7 @@ struct mtk_vcodec_ctx;
>   /**
>    * struct vdec_vpu_inst - VPU instance for video codec
>    * @id          : ipi msg id for each decoder
> + * @core_id     : core id used to separate different hardware
>    * @vsi         : driver structure allocated by VPU side and shared to AP side
>    *                for control and info share
>    * @failure     : VPU execution result status, 0: success, others: fail
> @@ -26,9 +27,11 @@ struct mtk_vcodec_ctx;
>    * @dev		: platform device of VPU
>    * @wq          : wait queue to wait VPU message ack
>    * @handler     : ipi handler for each decoder
> + * @codec_type     : used codec type to separate different codecs
>    */
>   struct vdec_vpu_inst {
>   	int id;
> +	int core_id;
>   	void *vsi;
>   	int32_t failure;
>   	uint32_t inst_addr;
> @@ -38,6 +41,7 @@ struct vdec_vpu_inst {
>   	struct mtk_vcodec_ctx *ctx;
>   	wait_queue_head_t wq;
>   	mtk_vcodec_ipi_handler handler;
> +	unsigned int codec_type;
>   };
>   
>   /**
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
