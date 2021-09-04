Return-Path: <SRS0=vCgL=N2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF55C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 03:01:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55D0960555
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 03:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55D0960555
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpxKg+TxQpmZKoTUVvjyg6eIuFM5D46DkJwNc1ADrUE=; b=3wL6VdmPy3L+Q3
	n6SnIU2n48UXZDhwx59wC7zW2d6PJqmdA131zjVt7n2hBxTgDmzOhaYhNT4B+fac7GHpUiEECFMLE
	JrnbhKVYnhIGdIhEboEQx3m6s0j4LuSdh5BV1AG0gUL+7jkWR/5tqd4Y5oRgzt6Ua51Nb9STivGZt
	uHCV6eMOjg/NtmkWdDsbwhBQ9zuJdJN17px3RHnlqyhtSA8t19TQYx9RuQMWXZ1HzpytFsRxTHxMh
	6A5d5AJRlBOgaKU6gLvgJCj/xyNoBeEFvl/o7CYDrkWXVqz6rcGNuiq7fDQmdJmwrq7F7E4fGe94E
	HliF8XOwZVyzzrlEWhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMLvB-00DRC6-LR; Sat, 04 Sep 2021 03:00:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMLuw-00DR7N-20; Sat, 04 Sep 2021 03:00:32 +0000
X-UUID: 8fe2f69939254526baa4c885174dc19f-20210903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NvxseD2YWOEeruwk6CSMT0n8VcIDt0xwqzYZMGEFark=; 
 b=BorB8BXr9h0sr0SPRE+o2oE7Sdthe9ZUQEilFcgDCIL95ckuAkMEe4F42nj1k9rT94MdW9uRg5FgJMdWoxxLoLdbPuXJqZCcfhzFHsFO957vIFJr2zsPqOYTqRctwZ4blAdsQ3wfwEox9zkSORXKMY8UBXLWnaTIjfqOduf0UKY=;
X-UUID: 8fe2f69939254526baa4c885174dc19f-20210903
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 835972838; Fri, 03 Sep 2021 20:00:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 20:00:23 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 4 Sep 2021 11:00:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 4 Sep 2021 11:00:20 +0800
Message-ID: <9208d58f46f5e748daddaa9c96e777985cbbc5c7.camel@mediatek.com>
Subject: Re: [PATCH v6, 15/15] media: mtk-vcodec: Use codec type to separate
 different hardware
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
CC: Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Sat, 4 Sep 2021 11:00:22 +0800
In-Reply-To: <0100e846-7ab0-347e-c737-aa6d86fde4af@collabora.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <20210901083215.25984-16-yunfei.dong@mediatek.com>
 <cf57148f-430b-2023-5f62-b57b12a960b7@collabora.com>
 <5d53649c1fe2d6d6942e1dd31cdf7a0def46acab.camel@mediatek.com>
 <0100e846-7ab0-347e-c737-aa6d86fde4af@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_200030_757464_D63B034C 
X-CRM114-Status: GOOD (  47.50  )
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

Hi Danfa,

Thanks for your suggestion.
On Fri, 2021-09-03 at 14:42 +0200, Dafna Hirschfeld wrote:
> 
> On 02.09.21 08:05, yunfei.dong@mediatek.com wrote:
> > On Wed, 2021-09-01 at 14:17 +0200, Dafna Hirschfeld wrote:
> > Hi Dafna,
> > 
> > Thanks for your suggestion.
> > > Hi
> > > 
> > > On 01.09.21 10:32, Yunfei Dong wrote:
> > > > There are just one core thread, in order to separeate different
> > > > hardware, using codec type to separeate it in scp driver.
> > > 
> > > this code seems to relate to the vpu driver not the scp driver.
> > > Is there a corresponding code added to the vpu driver that test
> > > the
> > > codec_type?
> > > 
> > 
> > Vpu is video processor unit, used to connect with micro processor.
> > In mt8173: vdec_vpu_if.c -> mtk_vpu.c -> micro processor
> > In mt8192/mt8183: vdec_vpu_if.c -> mtk_scp.c ->micro processor
> > 
> > This init/dec start/dec_end interfaces are the same for vpu and
> > scp.
> > > > 
> > > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > ---
> > > >    .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 12 ++++---
> > > >    .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 34
> > > > ++++++++++++++++---
> > > >    .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  4 +++
> > > >    3 files changed, 41 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> > > > b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> > > > index 9d8079c4f976..c488f0c40190 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> > > > +++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> > > > @@ -35,6 +35,8 @@ enum vdec_ipi_msgid {
> > > >     * @msg_id	: vdec_ipi_msgid
> > > >     * @vpu_inst_addr : VPU decoder instance address. Used if
> > > > ABI
> > > > version < 2.
> > > >     * @inst_id     : instance ID. Used if the ABI version >= 2.
> > > > + * @codec_type	: Codec fourcc
> > > > + * @reserved	: reserved param
> > > >     */
> > > >    struct vdec_ap_ipi_cmd {
> > > >    	uint32_t msg_id;
> > > > @@ -42,6 +44,8 @@ struct vdec_ap_ipi_cmd {
> > > >    		uint32_t vpu_inst_addr;
> > > >    		uint32_t inst_id;
> > > >    	};
> > > > +	uint32_t codec_type;
> > > > +	uint32_t reserved;
> > > >    };
> > > >    
> > > >    /**
> > > > @@ -59,12 +63,12 @@ struct vdec_vpu_ipi_ack {
> > > >    /**
> > > >     * struct vdec_ap_ipi_init - for AP_IPIMSG_DEC_INIT
> > > >     * @msg_id	: AP_IPIMSG_DEC_INIT
> > > > - * @reserved	: Reserved field
> > > > + * @codec_type	: Codec fourcc
> > > >     * @ap_inst_addr	: AP video decoder instance address
> > > >     */
> > > >    struct vdec_ap_ipi_init {
> > > >    	uint32_t msg_id;
> > > > -	uint32_t reserved;
> > > > +	uint32_t codec_type;
> > > >    	uint64_t ap_inst_addr;
> > > >    };
> > > >    
> > > > @@ -77,7 +81,7 @@ struct vdec_ap_ipi_init {
> > > >     *	H264 decoder [0]:buf_sz [1]:nal_start
> > > >     *	VP8 decoder  [0]:width/height
> > > >     *	VP9 decoder  [0]:profile, [1][2] width/height
> > > > - * @reserved	: Reserved field
> > > > + * @codec_type	: Codec fourcc
> > > >     */
> > > >    struct vdec_ap_ipi_dec_start {
> > > >    	uint32_t msg_id;
> > > > @@ -86,7 +90,7 @@ struct vdec_ap_ipi_dec_start {
> > > >    		uint32_t inst_id;
> > > >    	};
> > > >    	uint32_t data[3];
> > > > -	uint32_t reserved;
> > > > +	uint32_t codec_type;
> > > >    };
> > > >    
> > > >    /**
> > > > diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> > > > b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> > > > index bfd8e87dceff..c84fac52fe26 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> > > > +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> > > > @@ -100,18 +100,29 @@ static void vpu_dec_ipi_handler(void
> > > > *data,
> > > > unsigned int len, void *priv)
> > > >    
> > > >    static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu,
> > > > void
> > > > *msg, int len)
> > > >    {
> > > > -	int err;
> > > > +	int err, id, msgid;
> > > >    
> > > > -	mtk_vcodec_debug(vpu, "id=%X", *(uint32_t *)msg);
> > > > +	msgid = *(uint32_t *)msg;
> > > > +	mtk_vcodec_debug(vpu, "id=%X", msgid);
> > > >    
> > > >    	vpu->failure = 0;
> > > >    	vpu->signaled = 0;
> > > >    
> > > > -	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, 
> > > > vpu-
> > > > > id, msg,
> > > > 
> > > > +	if (vpu->ctx->dev->vdec_pdata->hw_arch ==
> > > > MTK_VDEC_LAT_SINGLE_CORE) {
> > > > +		if (msgid == AP_IPIMSG_DEC_CORE ||
> > > > +			msgid == AP_IPIMSG_DEC_CORE_END)
> > > > +			id = vpu->core_id;
> > > > +		else
> > > > +			id = vpu->id;
> > > > +	} else {
> > > > +		id = vpu->id;
> > > > +	}
> > > > +
> > > > +	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, 
> > > > id,
> > > > msg,
> > > >    				     len, 2000);
> > > 
> > > so
> > > >    	if (err) {
> > > >    		mtk_vcodec_err(vpu, "send fail vpu_id=%d
> > > > msg_id=%X
> > > > status=%d",
> > > > -			       vpu->id, *(uint32_t *)msg, err);
> > > > +			       id, msgid, err);
> > > >    		return err;
> > > >    	}
> > > >    
> > > > @@ -131,6 +142,7 @@ static int vcodec_send_ap_ipi(struct
> > > > vdec_vpu_inst *vpu, unsigned int msg_id)
> > > >    		msg.vpu_inst_addr = vpu->inst_addr;
> > > >    	else
> > > >    		msg.inst_id = vpu->inst_id;
> > > > +	msg.codec_type = vpu->codec_type;
> > > >    
> > > >    	err = vcodec_vpu_send_msg(vpu, &msg, sizeof(msg));
> > > >    	mtk_vcodec_debug(vpu, "- id=%X ret=%d", msg_id, err);
> > > > @@ -149,14 +161,25 @@ int vpu_dec_init(struct vdec_vpu_inst
> > > > *vpu)
> > > >    
> > > >    	err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev-
> > > > >fw_handler,
> > > > vpu->id,
> > > >    					 vpu->handler, "vdec",
> > > > NULL);
> > > > -	if (err != 0) {
> > > > +	if (err) {
> > > 
> > > could be nice to send a patch with other such fixes,
> > > anyway it is better to send unrelated fixes in a separate patch
> > > 
> > 
> > will fix in next patch.
> > > >    		mtk_vcodec_err(vpu, "vpu_ipi_register fail
> > > > status=%d",
> > > > err);
> > > >    		return err;
> > > >    	}
> > > >    
> > > > +	if (vpu->ctx->dev->vdec_pdata->hw_arch ==
> > > > MTK_VDEC_LAT_SINGLE_CORE) {
> > > > +		err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev-
> > > > > fw_handler,
> > > > 
> > > > +					 vpu->core_id, vpu-
> > > > >handler,
> > > > +					 "vdec", NULL);
> > > > +		if (err) {
> > > > +			mtk_vcodec_err(vpu, "vpu_ipi_register
> > > > core fail
> > > > status=%d", err);
> > > > +			return err;
> > > > +		}
> > > > +	}
> > > > +
> > > >    	memset(&msg, 0, sizeof(msg));
> > > >    	msg.msg_id = AP_IPIMSG_DEC_INIT;
> > > >    	msg.ap_inst_addr = (unsigned long)vpu;
> > > > +	msg.codec_type = vpu->codec_type;
> > > >    
> > > >    	mtk_vcodec_debug(vpu, "vdec_inst=%p", vpu);
> > > >    
> > > > @@ -187,6 +210,7 @@ int vpu_dec_start(struct vdec_vpu_inst
> > > > *vpu,
> > > > uint32_t *data, unsigned int len)
> > > >    
> > > >    	for (i = 0; i < len; i++)
> > > >    		msg.data[i] = data[i];
> > > > +	msg.codec_type = vpu->codec_type;
> > > 
> > > I don't see where is the vpu->codec_type initialzied
> > > 
> > 
> > This patch just add interface to support core hardware decode, in
> > next
> > serial patches based on these will used codec type to separate
> > after
> > these base patches are stable.
> 
> Then why not send it on the same series?
> 
For this patch is the common part, not only one spec(h264/vp9/av1) use
it. And these specs will send in different patch series, in order to
avoid patch dependency, so add this patch in this common series.

> Thanks,
> Dafna
> 
Thanks
Yunfei Dong
> > > Thanks,
> > > Dafna
> > > 
> > 
> > Thanks
> > Yunfei Dong
> > > >    
> > > >    	err = vcodec_vpu_send_msg(vpu, (void *)&msg,
> > > > sizeof(msg));
> > > >    	mtk_vcodec_debug(vpu, "- ret=%d", err);
> > > > diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > > > b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > > > index ae24b75d1649..802660770a87 100644
> > > > --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > > > +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > > > @@ -14,6 +14,7 @@ struct mtk_vcodec_ctx;
> > > >    /**
> > > >     * struct vdec_vpu_inst - VPU instance for video codec
> > > >     * @id          : ipi msg id for each decoder
> > > > + * @core_id     : core id used to separate different hardware
> > > >     * @vsi         : driver structure allocated by VPU side and
> > > > shared to AP side
> > > >     *                for control and info share
> > > >     * @failure     : VPU execution result status, 0: success,
> > > > others: fail
> > > > @@ -26,9 +27,11 @@ struct mtk_vcodec_ctx;
> > > >     * @dev		: platform device of VPU
> > > >     * @wq          : wait queue to wait VPU message ack
> > > >     * @handler     : ipi handler for each decoder
> > > > + * @codec_type     : used codec type to separate different
> > > > codecs
> > > >     */
> > > >    struct vdec_vpu_inst {
> > > >    	int id;
> > > > +	int core_id;
> > > >    	void *vsi;
> > > >    	int32_t failure;
> > > >    	uint32_t inst_addr;
> > > > @@ -38,6 +41,7 @@ struct vdec_vpu_inst {
> > > >    	struct mtk_vcodec_ctx *ctx;
> > > >    	wait_queue_head_t wq;
> > > >    	mtk_vcodec_ipi_handler handler;
> > > > +	unsigned int codec_type;
> > > >    };
> > > >    
> > > >    /**
> > > > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
