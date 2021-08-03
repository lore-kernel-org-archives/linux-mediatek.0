Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB15C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 05:37:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C41360FA0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 05:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C41360FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6g+Zd6YsUeWeIMb1KvmvYzJD9aVUi/Udt22y1oHP1Eo=; b=vKT6El+GZfIAHN
	j/OAI81hF5u7x+r3ky3RFpzPOJl0bChlH4u8twa5GWWOv20qIU16byxtwPVbRHqhyHuywsfEe9CvR
	KbMiozTuvtIqfwogLcSSUswbRLrGKjLgJtulp13tSMvgBjA8bIistPN4FLnEF/DFvhrlGv+7tTNZu
	fJmywkzRTT9qVxkUOW+UVP/46hNK/SPxmRY2TjRwTSAGYiu+aPgxWKPkAgMIEvpdgpDlrzFC5qiFZ
	lz2Rh3lLpznQSM92XZG87hyCoutU3U07HEv9kxnAqcjGcbpqlv5yBDGtCrNZQQonLUAJNcYUM+SyZ
	1Bk2P9hF3xVsWkSgeCfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAn76-001Bg4-L8; Tue, 03 Aug 2021 05:37:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAn73-001BfC-EH
 for linux-mediatek@lists.infradead.org; Tue, 03 Aug 2021 05:37:14 +0000
Received: by mail-pl1-x629.google.com with SMTP id t3so20237335plg.9
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Aug 2021 22:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TzgmYchbci/zhvlgXLAGmYsl7UzG8nnyQecH+/1YGbQ=;
 b=ES55ynagZ88pg0GPjV6f9YmdPOu1QNR8D/oRa8bNQ/T4u9Nxk+qPpJ5UcbEoQilUyZ
 u3+F/HwsLgeupDpIDbgs1unBMYXyLlltf0CudKw6Ac1QXWjntXx+kNos74b2LiMtNEcv
 es9C9D3nxwbVWjEvI1IPePrzDYu2Oqq5AJMmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TzgmYchbci/zhvlgXLAGmYsl7UzG8nnyQecH+/1YGbQ=;
 b=KLx5wMwtowtpqj+6A2hZVjPARxU2Yix1F/VWEO0hN48DOAykFIlC0xqp5GEiSYnMpa
 DnDTExYDHU7542mL5bev9P3x3srIrWdi55FrNUZThWX1TrG7g+0usd7no85hi2op4wS7
 2qzFdX79euPB/Na/mNdSr1MfH8uMagSBy4j6qlm6Boy59pfxGarUD+AesniVJGzIw4jq
 sNEiyVAUl0To3dNFIcz+aE4GyXNMxjG6Rk1uJ7nRNn+V5wAP7vIYthSErU1a1XVgO+kV
 /pGkQRNpdyz6lALTxv8U3Buz68FbGQEmP19N+k2mKvmd4CivWho1md434ShfTWweU5V8
 SoyA==
X-Gm-Message-State: AOAM530xAbG65dg4DZwRZTvXbye6E5sHLPDq9t0s5qr3B8RwBOackVGR
 p2lkNXPxttTdEL0bUDH5wG8jfL3k8sfXWA/HCVaFCg==
X-Google-Smtp-Source: ABdhPJwy22hM/0nLperLTs7oqlOkW3eLaO6jLCVztbfyp37svS9AhfV/dPAYrDNKRL8a0yAc2zvp451Ro7v8cSdVagE=
X-Received: by 2002:a17:902:b788:b029:12c:2888:9589 with SMTP id
 e8-20020a170902b788b029012c28889589mr17319543pls.60.1627969031860; Mon, 02
 Aug 2021 22:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-12-yong.wu@mediatek.com>
 <CAATdQgAfo9oNR5=ogEottHajODngi1ahvKUnEOUczzjreYpPcQ@mail.gmail.com>
 <1626935902.27875.7.camel@mhfsdcap03> <1627540902.13818.3.camel@mhfsdcap03>
In-Reply-To: <1627540902.13818.3.camel@mhfsdcap03>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 3 Aug 2021 13:37:01 +0800
Message-ID: <CAATdQgCf2sNwZWBKOC=HJU7Ur+7J6+uc75UD6xjfMF71Dxr18Q@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] memory: mtk-smi: mt8195: Add initial setting for
 smi-larb
To: Yong Wu <yong.wu@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_223713_526718_2F32D030 
X-CRM114-Status: GOOD (  29.71  )
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

Hi,

On Thu, Jul 29, 2021 at 2:41 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> Hi Ikjoon,
>
> Just a ping.
>
> On Thu, 2021-07-22 at 14:38 +0800, Yong Wu wrote:
> > On Wed, 2021-07-21 at 21:40 +0800, Ikjoon Jang wrote:
> > > On Thu, Jul 15, 2021 at 8:23 PM Yong Wu <yong.wu@mediatek.com> wrote:
> > > >
> > > > To improve the performance, We add some initial setting for smi larbs.
> > > > there are two part:
> > > > 1), Each port has the special ostd(outstanding) value in each larb.
> > > > 2), Two general setting for each larb.

Honestly, I think nobody outside Mediatek will understand this.
Can you please update this to be more generic?
Like "Apply default bus settings for mt8195, without this, XXX
problems can happen.. "?

Or for example, adding brief descriptions on what
MTK_SMI_FLAG_LARB_THRT_EN, MTK_SMI_FLAG_LARB_SW_FLAG,
and MTK_SMI_FLAG_LARB_SW_FLAG[] are for would be better if it's available.

> > > >
> > > > In some SoC, this setting maybe changed dynamically for some special case
> > > > like 4K, and this initial setting is enough in mt8195.
> > > >
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > ---
> > [...]
> > > >  struct mtk_smi {
> > > > @@ -213,12 +228,22 @@ static void mtk_smi_larb_config_port_mt8173(struct device *dev)
> > > >  static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
> > > >  {
> > > >         struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> > > > -       u32 reg;
> > > > +       u32 reg, flags_general = larb->larb_gen->flags_general;
> > > > +       const u8 *larbostd = larb->larb_gen->ostd[larb->larbid];
> > > >         int i;
> > > >
> > > >         if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
> > > >                 return;
> > > >
> > > > +       if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_LARB_THRT_EN))
> > > > +               writel_relaxed(SMI_LARB_THRT_EN, larb->base + SMI_LARB_CMD_THRT_CON);
> > > > +
> > > > +       if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_LARB_SW_FLAG))
> > > > +               writel_relaxed(SMI_LARB_SW_FLAG_1, larb->base + SMI_LARB_SW_FLAG);
> > > > +
> > > > +       for (i = 0; i < SMI_LARB_PORT_NR_MAX && larbostd && !!larbostd[i]; i++)
> > > > +               writel_relaxed(larbostd[i], larb->base + SMI_LARB_OSTDL_PORTx(i));
> > >
> > > All other mtk platform's larbs have the same format for SMI_LARB_OSTDL_PORTx()
> > > registers at the same offset? or is this unique feature for mt8195?
> >
> > All the other Platform's larbs have the same format at the same offset.
>
> In this case, Do you have some other further comment? If no, I will keep
> the current solution for this.

Sorry for the late response,
I have no further comments or any objections on here. Please go ahead for v3.
I just had no idea on the register definitions and wanted to be sure that
newly added register definitions are common to all MTK platforms.

Thanks!

>
> Thanks.
>
> >
> > >
> > > > +
> > > >         for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
> > > >                 reg = readl_relaxed(larb->base + SMI_LARB_NONSEC_CON(i));
> > > >                 reg |= F_MMU_EN;
> > > > @@ -227,6 +252,51 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
> > > >         }
> > > >  }
> > > >
> >
> > [...]
> >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
