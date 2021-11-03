Return-Path: <SRS0=yT6o=PW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517DBC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 08:11:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07F48610E5
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 08:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07F48610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2jblrCsdF3ZLYWBf8Jemw2jqBFer6ESJ9q4NLymN/k=; b=nN37m8dvrUKUvH
	PkpV78Tb8jDR22b0A9dA1lFUBEA21S2iwu09U0dnJzoyQKJJWrNUQxcPqY/6AuvolaXiUV9zMHzUq
	dCsSLKU4Hv45ymS1yrschkCEA5LzAYI9cG2wdXD2/VLOpIrlnIOnkgNn4jz+xsCcvHiTUoUdxC7fV
	8f1Fm2KMFn4r634FIyBcNnBg7p1FAoYj9VMhYRv7fg2Tx9ydPWYgb6yag/bi5RC+89vZ+jUmpZ+hj
	v+RShp80xu8K6+yMfRHt2/+KSIah9s68bZlGKxJ+MuO6Vkk6Z7LT4Um+Ff+UIJdatvk51uoYsf3dy
	dfBLh6QHIsvc/LhFlaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miBMu-004Tjr-T7; Wed, 03 Nov 2021 08:11:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miBMs-004Tht-9y
 for linux-mediatek@lists.infradead.org; Wed, 03 Nov 2021 08:11:35 +0000
X-UUID: 37bc2ad6d988485a99356acaf783b288-20211103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VYJwlQewBN6GJbnEUto0c9JoA556ekjEp/y7UAh+224=; 
 b=bj0vc9j62aleMBBXSbenQ5oxkjw85uvy2HNkv4Qs90H3YZ8NiZNK1maFF47B317hf+z2zRHJqBCgnc0ZGNXEhh6i8JXEZHJkeN1R8Zx9qK1i4mvMwrYX9JYnMq79YvIMpSbVFDW35cf098SuzdIP73PdwFhs6Kp3EmZN7jrm2Gs=;
X-UUID: 37bc2ad6d988485a99356acaf783b288-20211103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1596613237; Wed, 03 Nov 2021 01:11:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 01:03:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 3 Nov 2021 16:03:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 3 Nov 2021 16:03:28 +0800
Message-ID: <c01c2c6e2351c915fb6e55b025bf2ab5c449f045.camel@mediatek.com>
Subject: Re: [PATCH v4] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
From: houlong wei <houlong.wei@mediatek.com>
To: <Irui.wang@mediatek.com>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
CC: Linux Media Mailing List <linux-media@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, "kernel@collabora.com"
 <kernel@collabora.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Dafna Hirschfeld <dafna3@gmail.com>, "Tiffany
 Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?="
 <tiffany.lin@mediatek.com>, Andrew-CT Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= <Andrew-CT.Chen@mediatek.com>,
 Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?=
 <Minghsiu.Tsai@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, <houlong.wei@mediatek.com>
Date: Wed, 3 Nov 2021 16:03:28 +0800
In-Reply-To: <9475ac5b-79fe-da0e-ed1c-a91275cad46e@collabora.com>
References: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
 <c59b7f40-d99e-370a-b797-5dc72979df46@xs4all.nl>
 <CAPBb6MW_i1_Lh2ZaF8jGjcV-4XBhjswtyKkZCk3HxKO7LX79Og@mail.gmail.com>
 <9475ac5b-79fe-da0e-ed1c-a91275cad46e@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_011134_362805_2D7ECC87 
X-CRM114-Status: GOOD (  41.65  )
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

Add mtk-vpu driver expert irui.wang in the loop.

On Mon, 2021-10-18 at 15:07 +0800, Dafna Hirschfeld wrote:
> 
> On 18.10.21 03:16, Alexandre Courbot wrote:
> > Hi Hans!
> > 
> > On Mon, Oct 4, 2021 at 6:37 PM Hans Verkuil <hverkuil@xs4all.nl>
> > wrote:
> > > 
> > > On 20/09/2021 19:04, Dafna Hirschfeld wrote:
> > > > From: Alexandre Courbot <acourbot@chromium.org>
> > > > 
> > > > When running memcpy_toio:
> > > > memcpy_toio(send_obj->share_buf, buf, len);
> > > > it was found that errors appear if len is not a multiple of 8:
> > > > 
> > > > [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
> > > 
> > > Why do errors appear? Is that due to a HW bug? Some other reason?
> > 
> > MTK folks would be the best placed to answer this, but since the
> > failure is reported by the firmware I'd suspect either a firmware
> > or
> > hardware limitation.
> > 
> > > 
> > > > 
> > > > This patch ensures the copy of a multiple of 8 size by calling
> > > > round_up(len, 8) when copying
> > > > 
> > > > Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to
> > > > DTCM buffer.")
> > > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > > Signed-off-by: Enric Balletbo i Serra <
> > > > enric.balletbo@collabora.com>
> > > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com
> > > > >
> > > > Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
> > > > ---
> > > > changes since v3:
> > > > 1. multile -> multiple
> > > > 2. add inline doc
> > > > 
> > > > changes since v2:
> > > > 1. do the extra copy only if len is not multiple of 8
> > > > 
> > > > changes since v1:
> > > > 1. change sign-off-by tags
> > > > 2. change values to memset
> > > > 
> > > >   drivers/media/platform/mtk-vpu/mtk_vpu.c | 15 ++++++++++++++-
> > > >   1 file changed, 14 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> > > > b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> > > > index ec290dde59cf..1df031716c8f 100644
> > > > --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> > > > +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> > > > @@ -349,7 +349,20 @@ int vpu_ipi_send(struct platform_device
> > > > *pdev,
> > > >                }
> > > >        } while (vpu_cfg_readl(vpu, HOST_TO_VPU));
> > > > 
> > > > -     memcpy_toio(send_obj->share_buf, buf, len);
> > > > +     /*
> > > > +      * when copying data to the vpu hardware, the memcpy_toio
> > > > operation must copy
> > > > +      * a multiple of 8. Otherwise the processing fails
> > > 
> > > Same here: it needs to explain why the processing fails.
> 
> Is writing 'due to hardware or firmware limitation' enough?
> If not, then we should wait for mediatek people's response to explain
> if they know more
> 
> > > 
> > > > +      */
> > > > +     if (len % 8 != 0) {
> > > > +             unsigned char data[SHARE_BUF_SIZE];
> > > 
> > > Wouldn't it be more robust if you say:
> > > 
> > >                  unsigned char data[sizeof(send_obj->share_buf)];
> > 
> > Definitely yes.
> 
> I'll send v5 fixing this
> 
> > 
> > > 
> > > I also think that the SHARE_BUF_SIZE define needs a comment
> > > stating that it must be a
> > > multiple of 8, otherwise unexpected things can happen.
> > > 
> > > You also noticed that the current SHARE_BUF_SIZE define is too
> > > low, but I saw
> > > no patch correcting this. Shouldn't that be fixed as well?
> > 
> > AFAICT the firmware expects this exact size on its end, so I don't
> > believe it can be changed that easily. But maybe someone from MTK
> > can
> > prove me wrong.
> > 
> 
> I looked further and noted that the structs that are larger than
> 'SHARE_BUF_SIZE'
> (venc_ap_ipi_msg_enc_ext venc_ap_ipi_msg_set_param_ext)
> are used by drivers that don't use this vpu api, so actually
> SHARE_BUF_SIZE is
> not too low and as Corurbot worte probably not changeable.
> 
> 
> Thanks,
> Dafna
> 
> > Cheers,
> > Alex.
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
