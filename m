Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21926C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 09:18:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4E4D6103B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 09:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4E4D6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObD09Tjt2qJ92MYoJAYmZhv9r5OmV7cK1IPME01YV7k=; b=NV/WsEXpQG8LAD
	/aw6+uSEm58pBpvrllXoeTxhFxPhY5NRAs6SxRA9N0Y4Htrv3yoe6Euaf4YIiVabOaBQTODHFFteA
	4czenN7ZYIplXJWNaHz5kEXEHglRAy6TThovhB2btwlKjsRM3o8GJJxwoMIlC9YwvQXnNPBovJJpv
	JV6/pD7gylI/NEJvpG5DVcUIia5eE0s2H5gGh1RB4p2cPzuiQ1m49rQECndj+VpB2VtyiqqB5a4p2
	UMfcHezIR5OIq5ZCwbnH7eaX3ToMT6dGqtNJoCrAZEbotwsYW3dTMuvaRmPo5twfZAAEOY9phRk7r
	AsjZcoOT+6p8lyNRd8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRA0S-00Dc5i-7X; Fri, 17 Sep 2021 09:18:04 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRA0H-00Dc4c-Cc
 for linux-mediatek@lists.infradead.org; Fri, 17 Sep 2021 09:17:54 +0000
Received: by mail-lf1-x12e.google.com with SMTP id p29so30161928lfa.11
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Sep 2021 02:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U+KFp85eGIg3j+xXBPsUkFDbTysqRdcy9QOXEE3yrfg=;
 b=HrMoVzyJcd8uem8o60ameQ66p1cuF7BYcwBiKZyHg6HzAJ1/mPO6rSYnzXIBpvVJxY
 R2qZN95MAWaF8IFX3HyXyFFzZ793fpgmI5bUUKxyN5DZbdETRAu3TzgyR9wOoVnw9iHI
 8El4fDJwcyQ2EtKMvVzMx6GNaRw6vbPZWwRYeGwtBv9m5oD/kF8FfQtli4kR1CCDzW7C
 jl7SlKPE5mVueGinHLO9S1oenwBMf+J9+1d8PjxRGuY10fOez1jiFZJOK9gNNZ9vOUZU
 5SLTYGDJRhQCAMsLX7fQ7d79quczVr+6RbIIWKi/NLvpPnN5TfqpG3BDzLAM1B1cCIqC
 +KeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+KFp85eGIg3j+xXBPsUkFDbTysqRdcy9QOXEE3yrfg=;
 b=PUEkEvrWk+QXF4sslWBf+y7HtNvz84fhYR+MzZJv5g9ekb9qBSUTvuPBb8HFbaQg1e
 i/B0LSjDzo7nr/WPNPCie1jGF0ImeP/FNxLidKCS1a2rIrKRPhRfoHtawNjxl1PMe9E0
 jS7k6C6PNqtP6NddqlMUfK/0h3ux8J3Nyk60mlE/xNSyDDNnGQr92IW/nEcKY+kBs0FQ
 DU0sI6W3GxLNAVUEUH9Jj7wpxtbAyKOCRY7NufvRXXeS5FASfsfXLUyIbsj0SgBvbnCG
 YQBo3yov3GDwAnuss8PtPHPtDkl6UkZakbDZW76YxWm/gSEiDUYJnT96GKhoJzcl3nap
 rcpw==
X-Gm-Message-State: AOAM532ebmHwWGC337qMy7EZYTckWeRDINKESIyHgjXZey6rjpl4DrQM
 fWpn/Anj3y/RppQx3eQm5keLBq07QAUuDYyFRN8BHg==
X-Google-Smtp-Source: ABdhPJzPCC9qx4Soovidg9FbsVH4UyQFz22TaLL0+9TH41TnoI9FCTSOUyclgROpBvrJXqowZBk/+HvYjM6pCl3Q3mU=
X-Received: by 2002:a05:6512:6cd:: with SMTP id
 u13mr7227175lff.184.1631870269158; 
 Fri, 17 Sep 2021 02:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210908013218.29702-1-wenbin.mei@mediatek.com>
 <20210908013218.29702-3-wenbin.mei@mediatek.com>
 <CAPDyKFqTx3wMm6mMy-wY892Nvu-ukqpRS=TSZxYr7e3TJWgF4A@mail.gmail.com>
 <5d5d49747b748db18ca66b9cf82c0e626f9c7638.camel@mediatek.com>
In-Reply-To: <5d5d49747b748db18ca66b9cf82c0e626f9c7638.camel@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Sep 2021 11:17:13 +0200
Message-ID: <CAPDyKFoeiLZwj_uQOc0C-=nAOHqpxU7RmN2iRvdpKbX1oL32ZA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: mediatek: Add HS400 online tuning support
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Avri Altman <avri.altman@wdc.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Yue Hu <huyue2@yulong.com>, Bean Huo <beanhuo@micron.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_021753_459321_67B14648 
X-CRM114-Status: GOOD (  30.16  )
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

On Thu, 16 Sept 2021 at 11:47, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> On Tue, 2021-09-14 at 10:46 +0200, Ulf Hansson wrote:
> > On Wed, 8 Sept 2021 at 03:32, Wenbin Mei <wenbin.mei@mediatek.com>
> > wrote:
> > >
> > > Due to the influence of the corner IC and vcore voltage, for the
> > > stability
> > > of HS400 mode, we Add HS400 mode online tuning support for mediatek
> > > mmc
> > > host.
> >
> > My apologies, but I am not familiar with what 'HS400 online tuning'
> > is? Can you please elaborate on this?
> >
> > Is it specific for a Mediatek eMMC controller - or is a common eMMC
> > feature that is described in the eMMC spec?
> >
> According to JEDEC Spec, there is no need to do tuning under HS400 mode
> since the Rx signal is aligned with the DS signal. However, MediaTek's
> IC need set its "DS delay" internally to ensure it can latch Rx signal
> correctly.
> In previous version, We provide an "hs400-ds-delay" in device tree to
> cover different chipset/PCB design, and it works fine in most cases.
> But, with the development of process technology and the big VCore
> voltage scale range(may have 0.7V/0.6V/0.55V), it is difficult to find
> a suitable "hs400-ds-delay" to cover all of IC corner
> cases(SSSS/TTTT/FFFF).
> So that We must have the ability to do hs400 online tuning.
> It is specific for the Mediatek eMMC controller which support HS400
> mode.

I see, thanks for clarifying. Please put some of this information in
the commit message for the next version, it certainly helps to
understand.

[...]

> > > +static int msdc_send_cxd_data(struct mmc_card *card, struct
> > > mmc_host *host)
> > > +{
> > > +       struct mmc_request mrq = {};
> > > +       struct mmc_command cmd = {};
> > > +       struct mmc_data data = {};
> > > +       unsigned int len = 512;
> > > +       struct scatterlist sg;
> > > +       u8 *ext_csd;
> > > +
> > > +       ext_csd = kzalloc(len, GFP_KERNEL);
> > > +       if (!ext_csd)
> > > +               return -ENOMEM;
> > > +
> > > +       mrq.cmd = &cmd;
> > > +       mrq.data = &data;
> > > +
> > > +       cmd.opcode = MMC_SEND_EXT_CSD;
> > > +       cmd.arg = 0;
> > > +       cmd.flags = MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_ADTC;
> > > +
> > > +       data.blksz = len;
> > > +       data.blocks = 1;
> > > +       data.flags = MMC_DATA_READ;
> > > +       data.sg = &sg;
> > > +       data.sg_len = 1;
> > > +
> > > +       sg_init_one(&sg, ext_csd, len);
> > > +       mmc_set_data_timeout(&data, card);
> > > +       mmc_wait_for_req(host, &mrq);
> > > +
> > > +       kfree(ext_csd);
> > > +
> > > +       if (cmd.error)
> > > +               return cmd.error;
> > > +       if (data.error)
> > > +               return data.error;
> > > +
> > > +       return 0;
> >
> > Why do we need to send a MMC_SEND_EXT_CSD command, exactly?
> >
> > Why can't mmc_send_tuning() work here too? What does the eMMC spec
> > state about this?
> >
> The CMD21 is illegal under hs400 mode so that cannot use the
> mmc_send_tuning(). The CMD8 is suitable because it will receive 1 block
> of non-zero data.

I see.

In that case it seems better to use mmc_get_ext_csd(), from the core,
rather than open coding the above. To do that, you also need to move
the declaration of mmc_get_ext_csd() to include/linux/mmc/host.h.

[...]

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
