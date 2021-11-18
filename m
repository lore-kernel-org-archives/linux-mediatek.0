Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902C9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 09:35:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D0FC61B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 09:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D0FC61B73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7qGSD/fNNhlBzrxHcyOaVz4Q3HhgDt42xacBExe11s=; b=fLDRHtLSJZYgkS
	mAmeLkJJPdMx8n8MUXrV/C3J9oADrKy9E7tfoT/16XWCKvnWYg1mFnZrTH/nECTocnZ8BzTuMXakZ
	GQNyFNIvN/OrKLOF/cWJgu2Ug3HxgtuK9HoAV9AxZbGSt1VMAJ/+CZjAV0iKa9SvcjRZXm6JteQWD
	VQfZgG1UTrbCdY9e3qOR2eYIumSPc/2EuqkWxIGwTmJcLaE8nuxLD7LZV4F2vYOzNwU7lLR6AJpwr
	G7kulbp7X9OSTrmvykDy8DZNA5H+gdXv2hJ+O28aqm/P8dyoHccjbXlHX88hwuPae6fO43mHLEQop
	8Yww0j9yD/A89L5IfvcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mndon-007M66-GM; Thu, 18 Nov 2021 09:34:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mndoj-007M4w-U9
 for linux-mediatek@lists.infradead.org; Thu, 18 Nov 2021 09:34:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so4291444wmz.2
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Nov 2021 01:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D2DiSr4GR4f0kjFqr84VgVUga2wtQ7vPvvBID6YBxB0=;
 b=CiErSrtGCWUEyZLfMvqTPhoO+PVvYr8F4A/5/etcwClx83yVS+uPMJHMAV81hFpwuL
 ijJni+mNbJahK2jRN4xnBWN4RDUl03g5k3nH81jW+Bi8+N+mZcdxgjBQw6ggUb5/Lv+T
 25/OlDXEoVqx+yw1VvwE1F6vhzIew79cm+7RpMypbiXuB91wHPxhurB5VblAa8iz0yBZ
 IEi6YXy2yKHdrHNXqrB6GADYDqg3tqovdTywZD5Be7MGQ8iC05jQKTj7UPC8wAxUGJ7p
 49GezO1MH3RV148uGhPaQZcUy30h5v8dOsxT/JT3vV8g/MHDIzuwS8hcP423hBk7FE46
 El2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2DiSr4GR4f0kjFqr84VgVUga2wtQ7vPvvBID6YBxB0=;
 b=wCSggJKiUoE8RB1acyxfJjwHeWnHs5HRppP367QzVwTNk9wQJcRj3JcpYgso6MC2Cu
 3Jyl6dCOyLHh/3VIx6rCi+UZLH27Tc3LQrXrISYn8//89QbvzWn1W36B0wQMT037yl2K
 glAFrtShmRUHJhWPYHOUSnin7LpuSGH8WeqUkdiiv9TtTvWyFHZVh7PDYeZrLPV9Muhv
 tFVeZVTxXfFKhy/dLHLu/kzj1cWQjVtVI9HVpwfh3/DOz1lbLASqNVQKSkIhZklIepRK
 YboPFkKRiA2DqREVznHKfCN2AJSNfkgSMeM6MMPeRECrPm7JFUvHpXw3/2NMQru9G1du
 7woA==
X-Gm-Message-State: AOAM5304w+sHmChlY2JPR3wdymFUSJkxDGeT/kqa91o4KrMhLtQjtT6f
 5sIP9vcMACD8BktKijHd8YOqH8U+54yqlhIA9/4=
X-Google-Smtp-Source: ABdhPJxAyZQQg4jwIc6CPnTIVq1jJ9tsO++0Yd/XdFFaJWYGlAjIir88iOm9kpfeZWiCt8G3ActVocgcY5UV2vySexI=
X-Received: by 2002:a05:600c:500a:: with SMTP id
 n10mr8907382wmr.136.1637228091333; 
 Thu, 18 Nov 2021 01:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-17-daniel.baluta@oss.nxp.com>
 <YZU75B2JHbYHy40l@sirena.org.uk>
 <e918b4c4-dc85-dcf5-2781-5edfcd1bf1a5@nxp.com>
In-Reply-To: <e918b4c4-dc85-dcf5-2781-5edfcd1bf1a5@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Nov 2021 11:34:38 +0200
Message-ID: <CAEnQRZBCc4bhX-sT43KT6Tb-=RK=J9poxRvEM_H=1oXh0_AsPA@mail.gmail.com>
Subject: Re: [PATCH 16/21] ASoC: SOF: topology: Add support for Mediatek AFE
 DAI
To: Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 AjitKumar.Pandey@amd.com, Balakishore.pati@amd.com, vsreddy@amd.com, 
 Julian.Schroeder@amd.com, vishnuvardhanrao.ravulapati@amd.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?WUMgSHVuZyAo5rSq5aCv5L+KKQ==?= <yc.hung@mediatek.com>, 
 linux-mediatek@lists.infradead.org, 
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_013453_994597_EF3A0BD5 
X-CRM114-Status: GOOD (  20.99  )
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

Hi Mark,

I noticed that you already applied this. Should I resend the entire
series or just a fixup?

On Wed, Nov 17, 2021 at 7:32 PM Daniel Baluta <daniel.baluta@nxp.com> wrote:
>
>
> On 11/17/21 7:29 PM, Mark Brown wrote:
> > On Wed, Nov 17, 2021 at 11:37:29AM +0200, Daniel Baluta wrote:
> >> From: YC Hung <yc.hung@mediatek.com>
> >>
> >> Add new sof dai and config to pass topology file configuration
> >> to SOF firmware running on Mediatek platform DSP core.
> >> Add mediatek audio front end(AFE) to the list of supported sof_dais
> > This breaks an x86 allmodconfig build:
> >
> > /mnt/kernel/sound/soc/sof/mediatek/mt8195/mt8195.c: In function 'mt8195_run':
> > /mnt/kernel/sound/soc/sof/mediatek/mt8195/mt8195.c:207:2: error: implicit declaration of function 'sof_hifixdsp_boot_sequence' [-Werror=implicit-function-declaration]
> >    207 |  sof_hifixdsp_boot_sequence(sdev, adsp_bootup_addr);
> >        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > At top level:
> > /mnt/kernel/sound/soc/sof/mediatek/mt8195/mt8195.c:201:12: error: 'mt8195_run' defined but not used [-Werror=unused-function]
> >    201 | static int mt8195_run(struct snd_sof_dev *sdev)
> >        |            ^~~~~~~~~~
> > cc1: all warnings being treated as errors
> >
> > _boot_sequence is added in "ASoC: SOF: mediatek: Add fw loader and
> > mt8195 dsp ops to load firmware" which is later in the series.
> >
> > mt8195_run should be either global, a static inline or not declared in
> > the header at all.
>
>
> YC,
>
> Please send a fix for this on top of topic/sof-dev. I will take care of
> the squash and resend.
>
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
