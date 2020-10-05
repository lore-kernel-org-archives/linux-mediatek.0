Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE82CC4363C
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 01:49:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 849AF2073A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 01:49:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KseDsgqQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nnl422yT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 849AF2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SnY2vjO/kaLCZHZPXeTGHGbhoaDTvRk+uaTB4RnVl3Q=; b=KseDsgqQDgdix/zR8AgcE8Q2o
	Nt5y+5oEt9Brkkn+o9dKJn0izjTyWKHv83GUcNqppQP/n/kqJmYcZ8Jh28daeIdgXe2hpO1nSg/wX
	up52L+QQf5SxyDLP6T6BKIaTffG7wdwkM/7i1CR+8Z6R/rnsECApG0lPzXF60Z4SkIUXClN6EJs+v
	k7X/owrmDlIEflAtZRymBXHoeU7/dGj0MjBqOe5nNt+ZtA+QIN/IUwd2NiUJhUa4g0V/b0575e/Kp
	eJaLqoobP+YKbTfUCqISN1Oy5nNgLMNYer77KLPoBk4czssh6XeobXKJmXZH/zj1pkcRjhIwX5Urv
	rITjqEiPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPFcm-0005qP-N3; Mon, 05 Oct 2020 01:49:12 +0000
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPFch-0005pT-Rp
 for linux-mediatek@lists.infradead.org; Mon, 05 Oct 2020 01:49:09 +0000
Received: by mail-vk1-xa43.google.com with SMTP id r78so1404749vke.11
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Oct 2020 18:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2lmMV2Y8mISG/tvEWlp6fnU0SdlI2sIGYtkotIAtRLw=;
 b=nnl422yTOPm6IkjE14WBio3h2Icx2/pcDWxb45tgMnk31zxzH7+tuWqYKj5XSTm+dr
 zfpvH49lM5TBLAWOaNuyfZpXsyjpPIp3TSJ6Wx9Gn47bRWr7ZSJsVpalVwWRpWVzLiQv
 WFb8GdZkYiLmazRgEepaYR9B0sfsPxR9a4clo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2lmMV2Y8mISG/tvEWlp6fnU0SdlI2sIGYtkotIAtRLw=;
 b=ofA5T0r2l0i+ere2wEmIHDQqfXlUeSiKJkgMTvi4qXQRVwKW7PuO/oylqD1jX9ZGrP
 /M3XHxnuFbmzkrsQasM5QeKR+cU1SXwRCtHjbJ7B8mZgJaQMEhZcL6HLMfyhx36DslQZ
 GPzXGp2e18cEvLN/W5fWDn8rMsoeEpvk5OzzHpr+p/XoNLH+Na0gzEDHUJH/hj/wEh7Y
 3O0E0XgAvd0tCRwbSRsV+GbZCdcdgtr7xNB00YyHBy408RnpR1qFNT3GB6LJoAOi7Z7v
 lYK0+JUYiptvlU9R4Ti3Kj+5JzaNrMK9iDo3XiSDCUF/1VeZIoQNfrFMCQPpvKpgH2yj
 lENw==
X-Gm-Message-State: AOAM5326qcqZeGT1dSeYH5gYjlF4EmPBz/V6rLeaeGiIInuEcgsoLLGv
 vXOkk4ZDcAppSVnYY9pdZ/l6EWlZ5r8W+xGeHu3z9A==
X-Google-Smtp-Source: ABdhPJxVuKZU7HGy8n1aGfozCk+JpbflK7CVf3FkX7vnQkxcs5NLUy3KPbdtKx6uShjXr79sM56BrPINpqDtuPE9sOg=
X-Received: by 2002:a1f:a905:: with SMTP id s5mr1751735vke.10.1601862545471;
 Sun, 04 Oct 2020 18:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
 <20201001160154.3587848-7-enric.balletbo@collabora.com>
 <ee2b40c3-b565-22ed-34f4-4259d546a623@gmail.com>
In-Reply-To: <ee2b40c3-b565-22ed-34f4-4259d546a623@gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 5 Oct 2020 09:48:54 +0800
Message-ID: <CANMq1KDNKsE5oWxsg-zPS1L07dZySjoQc-fRWsXc5ngdi98Kgg@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] soc: mediatek: pm-domains: Add SMI block as bus
 protection block
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_214908_075521_359AD234 
X-CRM114-Status: GOOD (  21.79  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <mbrugger@suse.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 2, 2020 at 4:56 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 01/10/2020 18:01, Enric Balletbo i Serra wrote:
> > From: Matthias Brugger <mbrugger@suse.com>
> >
> > Apart from the infracfg block, the SMI block is used to enable the bus
> > protection for some power domains. Add support for this block.
> >
> > Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > ---
> >
> > Changes in v2: None
> >
> >   drivers/soc/mediatek/mtk-pm-domains.c | 64 ++++++++++++++++++++-------
> >   include/linux/soc/mediatek/infracfg.h |  6 +++
> >   2 files changed, 53 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> > index b5e7c9846c34..38f2630bdd0a 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.c
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> > @@ -56,8 +56,25 @@
> >
> >   #define SPM_MAX_BUS_PROT_DATA               3
> >
> > +#define _BUS_PROT(_mask, _set, _clr, _sta, _update) {        \
> > +             .bus_prot_mask = (_mask),               \
> > +             .bus_prot_set = _set,                   \
> > +             .bus_prot_clr = _clr,                   \
> > +             .bus_prot_sta = _sta,                   \
> > +             .bus_prot_reg_update = _update,         \
> > +     }
> > +
> > +#define BUS_PROT_WR(_mask, _set, _clr, _sta)         \
> > +             _BUS_PROT(_mask, _set, _clr, _sta, false)
> > +
> > +#define BUS_PROT_UPDATE(_mask, _set, _clr, _sta)             \
> > +             _BUS_PROT(_mask, _set, _clr, _sta, true)
> > +
> >   struct scpsys_bus_prot_data {
> >       u32 bus_prot_mask;
> > +     u32 bus_prot_set;
> > +     u32 bus_prot_clr;
> > +     u32 bus_prot_sta;
> >       bool bus_prot_reg_update;
> >   };
> >
> > @@ -69,6 +86,7 @@ struct scpsys_bus_prot_data {
> >    * @sram_pdn_ack_bits: The mask for sram power control acked bits.
> >    * @caps: The flag for active wake-up action.
> >    * @bp_infracfg: bus protection for infracfg subsystem
> > + * @bp_smi: bus protection for smi subsystem
> >    */
> >   struct scpsys_domain_data {
> >       u32 sta_mask;
> > @@ -77,6 +95,7 @@ struct scpsys_domain_data {
> >       u32 sram_pdn_ack_bits;
> >       u8 caps;
> >       const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
> > +     const struct scpsys_bus_prot_data bp_smi[SPM_MAX_BUS_PROT_DATA];
> >   };
> >
> >   struct scpsys_domain {
> > @@ -86,6 +105,7 @@ struct scpsys_domain {
> >       int num_clks;
> >       struct clk_bulk_data *clks;
> >       struct regmap *infracfg;
> > +     struct regmap *smi;
> >   };
> >
> >   struct scpsys_soc_data {
> > @@ -175,9 +195,9 @@ static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, st
> >               if (bpd[i].bus_prot_reg_update)
> >                       regmap_update_bits(regmap, INFRA_TOPAXI_PROTECTEN, mask, mask);
> >               else
> > -                     regmap_write(regmap, INFRA_TOPAXI_PROTECTEN_SET, mask);
> > +                     regmap_write(regmap, bpd[i].bus_prot_set, mask);
> >
> > -             ret = regmap_read_poll_timeout(regmap, INFRA_TOPAXI_PROTECTSTA1,
> > +             ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
> >                                              val, (val & mask) == mask,
> >                                              MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> >               if (ret)
> > @@ -193,7 +213,11 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
> >       int ret;
> >
> >       ret = _scpsys_bus_protect_enable(bpd, pd->infracfg);
> > -     return ret;
> > +     if (ret)
> > +             return ret;
> > +
> > +     bpd = pd->data->bp_smi;
> > +     return _scpsys_bus_protect_enable(bpd, pd->smi);

Not a huge fan or reusing bpd for 2 different things.

I think this is easier to follow:

_scpsys_bus_protect_enable(pd->data->bp_infracfg, pd->infracfg);
...
_scpsys_bus_protect_enable(pd->data->bp_smi, pd->smi);


> >   }
> >  [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
