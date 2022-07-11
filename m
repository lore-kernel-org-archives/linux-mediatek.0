Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD28C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 09:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtAo+U7m+G4TxFmfuNOKuh/E/yfOj1NwGaNUQh56JkU=; b=C9aqWcC6Bi8+by2S7cx/hOhFrP
	eW1n/v8+ueCsiVSFPKaAugcQ5j45l5L9oSQlbSpqsGOQ47wAp0U6IGld4eBvl8fJwXigMLrWxUmjv
	iv9x453ihcUUi2tMb+POEB/lOvLRKknQ8mn899OVaXcVIucPPpu7zSnD03/M3sP2EPEfMl5M8AlKh
	nirwdCO1yiJBByuLIbVGYfFMW20AG9J9O21uX/Rrm3CvnGXNTD8zIoXU7z+inrekZqQ1zIsZUPcoq
	4A3p82l7LPiIOSMOsLDf5yu57s4GXfx0pkSh8MJF+5P6FJGe420TNLhQWQXNpKSvCOv7fDk5GK3Rc
	nb6Ed3Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oApX9-00HZbS-RS; Mon, 11 Jul 2022 09:16:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oApWx-00HZRN-Bg; Mon, 11 Jul 2022 09:16:40 +0000
X-UUID: f9cf435bf9a84af59e9d7e40552a51d6-20220711
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:c32a766d-4854-40ef-bba7-deb8e09b22fa,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:00d7f463-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f9cf435bf9a84af59e9d7e40552a51d6-20220711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 13941162; Mon, 11 Jul 2022 02:16:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 11 Jul 2022 16:25:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 11 Jul 2022 16:25:58 +0800
Message-ID: <5e3aa17cad22fc8f321fbcc3159ac510f34dc3ea.camel@mediatek.com>
Subject: Re: [DKIM] [PATCH v21 4/4] media: platform: mtk-mdp3: add Mediatek
 MDP3 driver
From: moudy.ho <moudy.ho@mediatek.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, daoyuan huang
	<daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
	<randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
	<roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>
Date: Mon, 11 Jul 2022 16:25:58 +0800
In-Reply-To: <Ysfo1h75vAIUjcmB@pendragon.ideasonboard.com>
References: <20220706075454.15569-1-moudy.ho@mediatek.com>
	 <20220706075454.15569-5-moudy.ho@mediatek.com>
	 <d93b51b3-9c94-4842-891c-cd3547ae8712@xs4all.nl>
	 <Ysfo1h75vAIUjcmB@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_021639_409298_E28EF5A5 
X-CRM114-Status: GOOD (  28.72  )
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

On Fri, 2022-07-08 at 11:20 +0300, Laurent Pinchart wrote:
> On Fri, Jul 08, 2022 at 10:08:44AM +0200, Hans Verkuil wrote:
> > Hi Moudy,
> > 
> > Some comments below:
> 
> And one more
> 
> > On 7/6/22 09:54, Moudy Ho wrote:
> > > This patch adds driver for Mediatek's Media Data Path ver.3
> > > (MDP3).
> > > It provides the following functions:
> > >   color transform, format conversion, resize, crop, rotate, flip
> > >   and additional image quality enhancement.
> > > 
> > > The MDP3 driver is mainly used for Google Chromebook products to
> > > import the new architecture to set the HW settings as shown
> > > below:
> > >   User -> V4L2 framework
> > >     -> MDP3 driver -> SCP (setting calculations)
> > >       -> MDP3 driver -> CMDQ (GCE driver) -> HW
> > > 
> > > Each modules' related operation control is sited in mtk-mdp3-
> > > comp.c
> > > Each modules' register table is defined in file with "mdp_reg_"
> > > prefix
> > > GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> > > V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> > > Probe, power, suspend/resume, system level functions are defined
> > > in
> > > mtk-mdp3-core.c
> > > 
> > > v4l2-compliance 1.22.1, 32 bits, 32-bit time_t
> > > 
> > > Compliance test for mtk-mdp3 device /dev/video2:
> > > 
> > > Driver Info:
> > > 	Driver name      : mtk-mdp3
> > > 	Card type        : 14001000.mdp3-rdma0
> > 
> > Card type is expected to be a human readable name, and that's not
> > the case
> > here.
> > 
> > > 	Bus info         : platform:mtk-mdp3
> > 
> > <snip>
> > 
> > > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> > > b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> > > new file mode 100644

[snip]

> > > +static const struct vb2_ops mdp_m2m_qops = {
> > > +	.queue_setup	= mdp_m2m_queue_setup,
> > > +	.wait_prepare	= vb2_ops_wait_prepare,
> > > +	.wait_finish	= vb2_ops_wait_finish,
> > > +	.buf_prepare	= mdp_m2m_buf_prepare,
> > > +	.start_streaming = mdp_m2m_start_streaming,
> > > +	.stop_streaming	= mdp_m2m_stop_streaming,
> > > +	.buf_queue	= mdp_m2m_buf_queue,
> > > +	.buf_out_validate = mdp_m2m_buf_out_validate,
> > > +};
> > > +
> > > +static int mdp_m2m_querycap(struct file *file, void *fh,
> > > +			    struct v4l2_capability *cap)
> > > +{
> > > +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> > > +
> > > +	strscpy(cap->driver, MDP_MODULE_NAME, sizeof(cap->driver));
> > > +	strscpy(cap->card, ctx->mdp_dev->pdev->name, sizeof(cap-
> > > >card));
> > 
> > As mentioned at the top, this is not a suitable name for cap->card.
> > 
> > > +	strscpy(cap->bus_info, "platform:mtk-mdp3", sizeof(cap-
> > > >bus_info));
> 
> And don't override bus_info, the value isn't right. The V4L2 core
> should
> do the right thing for platform devices now.
> 

Hi Laurent,

Thanks for the reminder, I'll fix it in the next version along with
what Hans mentioned earlier.

Regards,
Moudy

> > > +	return 0;
> > > +}
> > > +
> > > +static int mdp_m2m_enum_fmt_mplane(struct file *file, void *fh,
> > > +				   struct v4l2_fmtdesc *f)
> > > +{
> > > +	return mdp_enum_fmt_mplane(f);
> > > +}


