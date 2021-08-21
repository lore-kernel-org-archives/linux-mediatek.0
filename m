Return-Path: <SRS0=N9OQ=NM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684EFC4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Aug 2021 07:41:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CCDA60E93
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Aug 2021 07:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CCDA60E93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+d1D8beiyCX0PvrHhi6vDMiQv4Gn6UL35MUBLt5iKxw=; b=B9IM1fSvm6aC0/
	VX+zSCSkD6EJDjDsSP51Z5NaGLAMxsNm1F4IldHnDv1HvLwPCNnoCnusekNVkFM0jgvaOMLKDWEZm
	eVnWjBVoZXygbCHNd+hLJpzkBjDeRAI1mxWOKm+ByI/ma+AYKAH+XbwElrJSV/1E99gzN5g7FpyKS
	/qNr3iOqJ7I/HHh7ldnYtFV85wZV89a0ZFhqnVdVwOGuTkKTIVapLrRv+8NqqZ2yfxyOUuPwuUQS+
	XyEGPYs0YoC4SQh69mTdZjWWFe8LvJca2R/QeTgL1RGxbIkbJoTsmDmCr0FgeCTj3Rld5MRTTaD0D
	q/4Ctpu5QXjobHKh4nQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHLch-00CZvW-4J; Sat, 21 Aug 2021 07:40:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHLcZ-00CZuj-RE; Sat, 21 Aug 2021 07:40:57 +0000
X-UUID: 1d3831218a2a4eeb9c6b26911e1c01e3-20210821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BZuld3Pemgzl736JSP8kztfRG7SFrLKgqimIWjvahso=; 
 b=KMemjg/JbriLuYuBRYBhKoqnFZ7P/YW1HOHG0XKDEbZyayIVNDLW3l5iTHrWJJBfPj1XEmEmUge6bV3jXm86CLbo3kbeP72Qycq0NBWKZIz+iehg03/oqlMDH158hMJNZZQLVkJQZuexW2Egui0/poYaNWUj8bEM13WG1vSA+n4=;
X-UUID: 1d3831218a2a4eeb9c6b26911e1c01e3-20210821
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 781060585; Sat, 21 Aug 2021 00:40:48 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 21 Aug 2021 00:40:46 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 21 Aug 2021 15:40:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 21 Aug 2021 15:40:44 +0800
Message-ID: <fce8934ec25d18307df11e2f308a255da5a25ce3.camel@mediatek.com>
Subject: Re: [PATCH v4 3/8] i2c: mediatek: Reset the handshake signal
 between i2c and dma
From: Kewei Xu <kewei.xu@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <wsa@the-dreams.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Rob
 Herring" <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>, Devicetree List
 <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
 <qii.wang@mediatek.com>, <yuhan.wei@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>, <liguo.zhang@mediatek.com>
Date: Sat, 21 Aug 2021 15:40:45 +0800
In-Reply-To: <CAGXv+5EGpUV0eaQ6duZ8y8u2dvc1y3uc2YwWP=07D+ZZpzMCvQ@mail.gmail.com>
References: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
 <1626517079-9057-4-git-send-email-kewei.xu@mediatek.com>
 <CAGXv+5EGpUV0eaQ6duZ8y8u2dvc1y3uc2YwWP=07D+ZZpzMCvQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210821_004053_213492_6A6FFB18 
X-CRM114-Status: GOOD (  28.36  )
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

On Wed, 2021-08-11 at 16:41 +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Sat, Jul 17, 2021 at 6:29 PM Kewei Xu <kewei.xu@mediatek.com>
> wrote:
> > 
> > Due to changes in the hardware design of the handshaking signal
> > between i2c and dma, it is necessary to reset the handshaking
> > signal before each transfer to ensure that the multi-msgs can
> > be transferred correctly.
> 
> This also affects MT8192. Has this been tested on that SoC as well?

Yes, It has been tested on MT8192.

> 
> > Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> > ---
> >  drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c
> > b/drivers/i2c/busses/i2c-mt65xx.c
> > index 222ff765e55d..c0108387f34b 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -47,6 +47,9 @@
> >  #define I2C_RD_TRANAC_VALUE            0x0001
> >  #define I2C_SCL_MIS_COMP_VALUE         0x0000
> >  #define I2C_CHN_CLR_FLAG               0x0000
> > +#define I2C_CLR_DEBUGCTR               0x0000
> > +#define I2C_RELIABILITY                        0x0010
> > +#define I2C_DMAACK_ENABLE              0x0008
> > 
> >  #define I2C_DMA_CON_TX                 0x0000
> >  #define I2C_DMA_CON_RX                 0x0001
> > @@ -850,6 +853,17 @@ static int mtk_i2c_do_transfer(struct mtk_i2c
> > *i2c, struct i2c_msg *msgs,
> > 
> >         reinit_completion(&i2c->msg_complete);
> > 
> > +       if (i2c->dev_comp->apdma_sync) {
> > +               mtk_i2c_writew(i2c, I2C_CLR_DEBUGCTR,
> > OFFSET_DEBUGCTRL);
> > +               writel(I2C_DMA_HANDSHAKE_RST | I2C_DMA_WARM_RST,
> > +                      i2c->pdmabase + OFFSET_RST);
> > +               writel(I2C_DMA_CLR_FLAG, i2c->pdmabase +
> > OFFSET_RST);
> 
> I2C_DMA_WARM_RST is self-clearing. Is I2C_DMA_HANDSHAKE_RST not
> self-clearing? If both are self-clearing, don't you need to wait and
> check for them to cleared? If they aren't self-clearing, do you need
> to delay some time for them to complete?
> 

Thank you for your suggestion. We will appropriately add the delay in
the next version of patch according to the hardware behavior
characteristics. 

Regards
Kewei

> > +               mtk_i2c_writew(i2c, I2C_HANDSHAKE_RST,
> > OFFSET_SOFTRESET);
> > +               mtk_i2c_writew(i2c, I2C_CHN_CLR_FLAG,
> > OFFSET_SOFTRESET);
> 
> Same here. No time delay needed?
> 
> > +               mtk_i2c_writew(i2c, I2C_RELIABILITY |
> > I2C_DMAACK_ENABLE,
> > +                              OFFSET_DEBUGCTRL);
> 
> A comment explaining what the section above does would be nice.
> AFAICU
> this is force resetting the DMA handling.
> 
> 
> Regards
> ChenYu
> 
> > +       }
> > +
> >         control_reg = mtk_i2c_readw(i2c, OFFSET_CONTROL) &
> >                         ~(I2C_CONTROL_DIR_CHANGE | I2C_CONTROL_RS);
> >         if ((i2c->speed_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) ||
> > (left_num >= 1))
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
