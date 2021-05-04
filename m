Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAF5C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 05:47:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5112A613BA
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 05:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5112A613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0ZYGzk6JEMMYAPoQC9V77hUPhbeiJmGvTfgCRcxAx4s=; b=Jnl8hG6vkOgT8HLsVbsN7iSnq
	8jaESmW6BuI29Y/qi+FAL87XkvWjVnU1em4/qLgRgugROUa0qoQhmTxF/RpXs4rcgxblLlIN6aUJG
	LJzxPKYatNxbzcx1RPaHcW21s1+WKncYxSAc4suiRkTScd9IH/hcaukUEWVt0R/abHu4D2gzhCRrw
	exKs21II+btEAeRSCoJGnKdaU0iWOq4i+1gJI1tYGor/IAZeTwqTzzwCJWYHcOEPuvO54G2TiX6Zd
	asGDcLH6SZt5rwKnbb0sKu+tX07X8m7vXxJAl1MttyArJAZA0o6GOfB//IkLHoztPAtrmRO0qQ+1e
	VPRFWDDNw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldntt-00FVmw-5t; Tue, 04 May 2021 05:47:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldntr-00FVmP-Qk
 for linux-mediatek@desiato.infradead.org; Tue, 04 May 2021 05:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=axeiLPF9iFyJx8eBPvuwERp1KcclYLjCN6v3MOk1j9M=; b=TrGVYgOpJ6D0PO5Oj5xUwHCndC
 bNCVHmjH1vTtRtXq7V16ChpG1eaEGS0piDxuiSEJCOLD++mG1fM4fKqSO6izY9+xzLaf+tLvOVAHl
 dFXh6+8NbAbnVHKp1mRhnyvB4lEnEjG8JnLQk1wD3Jebw6s0ICTRftSP3L1C3bkHK5jM4DX38ADQX
 gjzYMoe4uaygqFHlVVWEk20pXUs5mSBq2ZQe86hctbtv/qq7mqegcqBgf5uL9rNzVN1DY0BKuqmoE
 d4ZjdUpZIxCAjjtCJEr7S49q4yDPmENibUexy3MCGCU16s4sYqj3fWABt8GhV6q7ESV5U2D3YpJbB
 wMdCL01A==;
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldntp-003i6s-BI
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 05:47:14 +0000
Received: by mail-il1-x136.google.com with SMTP id i22so5432603ila.11
 for <linux-mediatek@lists.infradead.org>; Mon, 03 May 2021 22:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=axeiLPF9iFyJx8eBPvuwERp1KcclYLjCN6v3MOk1j9M=;
 b=l/PFZQjby4pnUGqaIaIQ9rgD7WqBsUugC2rXNreAK/QKy+DA0v2nvfpEZJsiQz4byR
 otFdCkkR6CyksBh73aUzWdHKn0E4WOWkn/TCCr/U31M4/3aFMGIYoSYkX8JouxyLCKhU
 19AGWePXfrHyOyDxAiurGS2Xt2qhOeu7LT7hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=axeiLPF9iFyJx8eBPvuwERp1KcclYLjCN6v3MOk1j9M=;
 b=jUty63IPArbZ0ha7yuFTmTjBQ5WFJ77+ZxF8Yga9Sg0R/Io1Y2iHm5iAmsDJ8uILuv
 7zdPzjHUvb80sV3ISqjUTeBZfgABFgf0q69O9kaVkDLb/ti7CLP1iDAVP4vRmVvOkD57
 LpzkvJrUeVOAepPqqJm1+7we6Q+Rb6KWTqx6NHdLYJhArDZJpB48/V+E5Nk9dGJGIZai
 3DPj7/6vDEGGoCgiCsHo2pDLGVVnNW6r+3r/KrKUoAc3YuEa8AwjmjeTNZk12qaHjQrW
 iiRgwtTYgXl+ds0rRonPLAIlNefOM1Bl6wkiSC17vS3FjIcwRTBo2TP+BKYFI88fVgd1
 /trA==
X-Gm-Message-State: AOAM5325jd/vADIK7TSmjt1U1nrQc/BKAzcY9CF4F4KvC9FcbgTbnozr
 wHDQCLR1B3g8ekJFsiv18PbnKfvtGxjlJSW36RBL2A==
X-Google-Smtp-Source: ABdhPJyB/v/ICSO+Gj4ey9LsM1hpWoGANefgE97s8XOhkyuqNS1v7S72K1JS5IaaEMizSnjPN+ktubr73LRWTAoPzd4=
X-Received: by 2002:a92:d684:: with SMTP id p4mr19918163iln.150.1620107232382; 
 Mon, 03 May 2021 22:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210503050523.2571758-1-hsinyi@chromium.org>
 <20210503050523.2571758-2-hsinyi@chromium.org>
 <1620101459.15918.4.camel@mtksdaap41>
In-Reply-To: <1620101459.15918.4.camel@mtksdaap41>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 4 May 2021 13:46:46 +0800
Message-ID: <CAJMQK-gZAxKpETOPKNt+A63CaJBACrFEK4S6rtj82WyDxT_fAg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: mediatek: Add optional mediatek,
 gce-events property
To: CK Hu <ck.hu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_224713_408223_93B19DCD 
X-CRM114-Status: GOOD (  20.84  )
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

On Tue, May 4, 2021 at 12:11 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Hsin-yi:
>
> On Mon, 2021-05-03 at 13:05 +0800, Hsin-Yi Wang wrote:
> > mediatek,gce-events property is used by gce clients.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,disp.txt  | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> > index fbb59c9ddda6..939b2da3bdc5 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> > @@ -75,6 +75,10 @@ Optional properties (RDMA function blocks):
> >    mediatek,rdma-fifo-size of mt8183-rdma0 is 5K
> >    mediatek,rdma-fifo-size of mt8183-rdma1 is 2K
> >
> > +Optional properties for display mutex:
> > +- mediatek,gce-events: GCE events used by clients. The event numbers are
> > +  defined in 'dt-bindings/gce/<chip>-gce.h'.
>
> I think mediatek,gce-events should be first defined in [1], and here
> refer to [1].
>
> In addition, mtk-mutex driver is moved into soc folder, so I would like
> to move mtk-mutex binding out of display binding. It's up to you.
>
> [1] Documentation/devicetree/bindings/mailbox/mtk-gce.txt
>
Thanks, I moved the definition here in v3.

> Regards,
> CK
>
> > +
> >  Examples:
> >
> >  mmsys: clock-controller@14000000 {
> > @@ -209,6 +213,8 @@ mutex: mutex@14020000 {
> >       interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
> >       power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> >       clocks = <&mmsys CLK_MM_MUTEX_32K>;
> > +     mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
> > +                           <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
> >  };
> >
> >  od@14023000 {
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
