Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DCFC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 06:21:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF4561165
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 06:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DF4561165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EZqiRenpWVBOf8ZR12JbrcpULRluCGtu9EBYPuj3mn0=; b=PYwTEVukw77HFWGkc+GkrjaN9
	c8SwGu5v6D7YxdqeNhDeAhMeCqW7irIOeHuDdwzv2XBGMiZJvhrTn5XC2SkScST0Ow58p7A7MtxJ3
	yT2DO80OfMpXeEHblhv/AF4RbKlWD+n3oN33zuNxqFDOQZr8l9ryrHcoTKOwHDZFaDJPiCXts73t9
	0stLlf6MXsjx0GiIzD5akmm6yH/gCyPvCwKihDSTmJkBGQwvBK25O+Y09WURB7DhVIH4YdMlddwRm
	nDEcuKbEZQxsKV1Tqs1qbeqGUAbGMxbN/Rb57UGhXXuOJF/BS2QJMGIKEuL+GSqUjI7xyYYOVef2D
	JiQU9hgww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUO2D-0074eg-Ib; Thu, 08 Apr 2021 06:20:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUO23-0074cR-Sv; Thu, 08 Apr 2021 06:20:50 +0000
X-UUID: f14f78ab18b74197809a804b1499fa6a-20210407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Iqf9QrO8MkLePhv/L1kye+La4KwF/Sa5szZLfVp1vXE=; 
 b=uGrvtnauESL2DpUU+LgMHmqNVvwxI7irXCMz56ZHlZaAQdjmzv6iVWhoKWkHUkrYVakMPQdRLJ97ycgVHthbObDIFZAqodj9QLsEm1GWklSt4vTLsRVvuk/Y1mVmLwJkH4w0k7Mg0t/u+5YbTluR1so90+g2ELBdILbpJKFRGxc=;
X-UUID: f14f78ab18b74197809a804b1499fa6a-20210407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1624183550; Wed, 07 Apr 2021 23:20:44 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 23:14:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 14:14:09 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Apr 2021 14:14:09 +0800
Message-ID: <1617862449.8874.16.camel@mtksdccf07>
Subject: Re: [PATCH v2 6/6] soc: mediatek: devapc: support mt8192
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>,
 Neal Liu <neal.liu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Jackson-kt.Chang@mediatek.com>
Date: Thu, 8 Apr 2021 14:14:09 +0800
In-Reply-To: <f52189e3-26b2-fd44-7059-f3bf0f79fbae@gmail.com>
References: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
 <1617259087-5502-6-git-send-email-nina-cm.wu@mediatek.com>
 <f52189e3-26b2-fd44-7059-f3bf0f79fbae@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_072048_398982_A252A8FE 
X-CRM114-Status: GOOD (  20.44  )
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

Hi, Matthias

On Tue, 2021-04-06 at 15:55 +0200, Matthias Brugger wrote:
> 
> On 01/04/2021 08:38, Nina Wu wrote:
> > From: Nina Wu <Nina-CM.Wu@mediatek.com>
> > 
> > Add compatible to support mt8192.
> > 
> > Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> > ---
> 
> 
> Looks good, I'd like to see DTS for this as well, although I understand it
> depends on the clock patch series. Please note so in either below the '---' or
> in a cover letter.
> 
> Regards,
> Matthias
> 

I will add devapc nodes in DTS in the next version.

Thanks

> 
> >  drivers/soc/mediatek/mtk-devapc.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> > index af55c01..a5c15b5 100644
> > --- a/drivers/soc/mediatek/mtk-devapc.c
> > +++ b/drivers/soc/mediatek/mtk-devapc.c
> > @@ -251,11 +251,26 @@ static const struct mtk_devapc_data devapc_mt6779 = {
> >  	.vio_shift_con_offset = 0xF20,
> >  };
> >  
> > +static const struct mtk_devapc_data devapc_mt8192 = {
> > +	.vio_mask_offset = 0x0,
> > +	.vio_sta_offset = 0x400,
> > +	.vio_dbg0_offset = 0x900,
> > +	.vio_dbg1_offset = 0x904,
> > +	.vio_dbg2_offset = 0x908,
> > +	.apc_con_offset = 0xF00,
> > +	.vio_shift_sta_offset = 0xF20,
> > +	.vio_shift_sel_offset = 0xF30,
> > +	.vio_shift_con_offset = 0xF10,
> > +};
> > +
> >  static const struct of_device_id mtk_devapc_dt_match[] = {
> >  	{
> >  		.compatible = "mediatek,mt6779-devapc",
> >  		.data = &devapc_mt6779,
> >  	}, {
> > +		.compatible = "mediatek,mt8192-devapc",
> > +		.data = &devapc_mt8192,
> > +	}, {
> >  	},
> >  };
> >  
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
