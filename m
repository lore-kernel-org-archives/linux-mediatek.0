Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F68C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 07:38:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F56A23600
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 07:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2jCMZUqS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="atpqJKWo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F56A23600
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4ICY4TqStmH+8lRKyKCUDbbjJ00zCEfVRhec7/BT9OE=; b=2jCMZUqSE0DQXoGZ9WiVkaSHx
	8/CwqZSCnLsamTyT3d4V58KszQrQ7DgwrraNvYGRTE8B73tsvUn5i/XaMVMpf33GB24xf38o4zwCU
	OzlZ6EWUli+ntqXereyskfzazsSoWrs4TydrCJzti+i9mXxBmJijvAHANCi36kQvZLQtbW7mEXWzP
	Q6ZF+4dldzcFZYWlWYIvnNxbM2yXQs5MycrkZoyEQ3x0MpFOT2YReEuY5o3v6DUvM53sc+RnE9PCb
	ez5jhSps8T9Ww003AMDWckUn+ysko/LQjypNo/B8Ga+4wsONx5utuOz6mW1+tvkVMo9amOQPTL+m8
	BquadE93g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLiJB-0002Uc-ML; Fri, 25 Sep 2020 07:38:21 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLiIu-0002MN-RY
 for linux-mediatek@lists.infradead.org; Fri, 25 Sep 2020 07:38:07 +0000
Received: by mail-io1-xd44.google.com with SMTP id z25so1698509iol.10
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2020 00:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WSlR7yshzs0vfD4qPWNZEu/SYrxh7Zbl3JNQb6YVoEo=;
 b=atpqJKWoZXGRivEFWDBvGz9MrPw2nALn9XkmQ1aWt6UPrX3SDtd+E97cX8Ctn1fkCX
 Ql/+h8Zc7F7Rh65N4MWlxyD9RAFselx5Ek5XVOG0Vrr9KXAygVLpDX2FO+6orc/CONfx
 Brl/TvfshMxqQBtKSiENR81iGijnMtQrgJEK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WSlR7yshzs0vfD4qPWNZEu/SYrxh7Zbl3JNQb6YVoEo=;
 b=OkOiLJN4SxtTMxFItaSTSJikrTf1GtYrakn/OYfGjNUqQdnhGtFWKqTSQ1rkldT3xN
 JoRROOkgE8Gx8gbJIU3IdTJHt0dqdqWg3k8FDhg6v/5WvWVtyLQoccrUcww1ni0j4pPW
 /dw8zbwxNw/Md55FlcKGqitkOSFQk/ekzsdZpdM6FNjJGqqWQZe4n1NUjimrkFJaOPFj
 1sCz7Lv24lZX4D+cfj5FO8Ku2yWiDlruUEl2NwyVXkzcUFltW9za2ZwTUEwvrkT6fdAr
 /2JhEoog0KFwdSVgTkAujKNi8b/SuTZny9tOZjnlcnn3LFLzIIjxEjG4EaMQAsIi2TbV
 Bg/A==
X-Gm-Message-State: AOAM531iPwtlAGSYDsFMHUNuYfPCeCj2I5ulJwf6nkmaQEgn3Fx62b9S
 ip0ejG6Dzi7HwWTglG7cENMWFmHvpgRxFjVdQd5uyA==
X-Google-Smtp-Source: ABdhPJzUHA+P0LdctUDvSxo8BvBlN6E75g98pitS7hCUaG5V1uFkbP3sHz6ED9DkJYz6tkq+TZIbHgnrWSAdYUfHeDo=
X-Received: by 2002:a6b:6c0c:: with SMTP id a12mr2307062ioh.40.1601019480794; 
 Fri, 25 Sep 2020 00:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <20200910172826.3074357-12-enric.balletbo@collabora.com>
 <730273b4-914a-8a7a-1583-351e6f20df5b@gmail.com>
 <5e1510f4-b0c4-2cff-b3f8-b6715d228149@gmail.com>
In-Reply-To: <5e1510f4-b0c4-2cff-b3f8-b6715d228149@gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 25 Sep 2020 15:37:34 +0800
Message-ID: <CAJMQK-jFwToRxBdVgtHT3wJ970M0NYGu3kLtkGRBDKMMNOHkJw@mail.gmail.com>
Subject: Re: [PATCH 11/12] soc: mediatek: pm-domains: Add support for mt8183
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_033804_948946_D8D91594 
X-CRM114-Status: GOOD (  19.97  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, weiyi.lu@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <mbrugger@suse.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 16, 2020 at 8:19 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 16/09/2020 11:46, Matthias Brugger wrote:
> >
> >
> > On 10/09/2020 19:28, Enric Balletbo i Serra wrote:
> >> From: Matthias Brugger <mbrugger@suse.com>
> >>
> >> Add the needed board data to support mt8183 SoC.
> >>
> >> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> >> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> ---
> >>
> >>   drivers/soc/mediatek/mtk-pm-domains.c | 162 ++++++++++++++++++++++++++
> >>   include/linux/soc/mediatek/infracfg.h |  28 +++++
> >>   2 files changed, 190 insertions(+)
> >>
> >> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c
> >> b/drivers/soc/mediatek/mtk-pm-domains.c
> >> index 29e88adc8ea6..aa434f616fee 100644
> >> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> >> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> > [...]
> >> +/*
> >> + * MT8183 power domain support
> >> + */
> >> +static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
> >> +    [MT8183_POWER_DOMAIN_AUDIO] = {
> >> +        .sta_mask = PWR_STATUS_AUDIO,
> >> +        .ctl_offs = 0x0314,
> >> +        .sram_pdn_bits = GENMASK(11, 8),
> >> +        .sram_pdn_ack_bits = GENMASK(15, 12),
> >> +    },
> >> +    [MT8183_POWER_DOMAIN_CONN] = {
> >> +        .sta_mask = PWR_STATUS_CONN,
> >> +        .ctl_offs = 0x032c,
> >> +        .sram_pdn_bits = 0,
> >> +        .sram_pdn_ack_bits = 0,
> >> +        .bp_infracfg = {
> >> +            BUS_PROT_WR(MT8183_TOP_AXI_PROT_EN_CONN, 0x2a0, 0x2a4, 0x228),
> >
> > We have repeating values triplets for set, clear and status register in infracfg
> > and SMI.
> >
> > Weiyi can you help to get names to this registers? I wasn't able to find
> > anything in the datasheet.
>
> I think for the infracfg part I figured it out:
>
> #define INFRA_TOPAXI_PROTECTEN_SET      0x2a0
> #define INFRA_TOPAXI_PROTECTEN_CLR      0x2a4
> #define INFRA_TOPAXI_PROTECTEN_STA1     0x228
>
> #define INFRA_TOPAXI_PROTECTEN_1_SET    0x2a8
> #define INFRA_TOPAXI_PROTECTEN_1_CLR    0x2ac
> #define INFRA_TOPAXI_PROTECTEN_STA1_1   0x258
>
> #define INFRA_TOPAXI_PROTECTEN_MCU_SET  0x2d4
> #define INFRA_TOPAXI_PROTECTEN_MCU_CLR  0x2d8
> #define INFRA_TOPAXI_PROTECTEN_MM_STA1  0x2ec
>
> Weiyi, can you still provide the register names for the SMI?
>
> Thanks in advance!
> Matthias
>
Hi Matthias,

SMI names are
#define SMI_COMMON_CLAMP_EN 0x3c0
#define SMI_COMMON_CLAMP_EN_SET 0x3c4
#define SMI_COMMON_CLAMP_EN_CLR 0x3c8

Thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
