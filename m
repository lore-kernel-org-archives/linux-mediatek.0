Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D56C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 16:07:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99D5A6128D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 16:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99D5A6128D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V9pOW3o04X7sm5m6n0RPjsVtYvxiMOpJQt+UoJBJTaw=; b=br6qiNR9Szm7sEWzGjhL5y0YR
	i11oXAPsI9nPappuucN4/NMIb4dVPfzvLbGi4/fwi/YLs9Hmo3hyBBfZScFtvbmeVISQ0Cnm53A8E
	0UIvlb+VvN7XptJh/eEUE3QcucB/39iFGwypKO8f2mMDQsVJf5Hh7fl4hjVl6piV4gtd/yG6T/1kw
	oz2ooCOF25tQDsfOr8g0x4Y876xFpKiYHtvJdCFj1waAxlfgM/+/YqtWarpFsdpBBRTPoWpCQxOyR
	iKIpVJG2fN3gjqIZwvkfiPaTrwo6T3zGol2+dTyAn4M9oq4EadRxcqk/g5JQPnnw+Y6AVI3vXKbg/
	z2qHEwmtQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUAhy-005PL5-Jr; Wed, 07 Apr 2021 16:07:10 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUAhu-005PIR-0U; Wed, 07 Apr 2021 16:07:08 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MCayD-1lLgVo2ld5-009e9h; Wed, 07 Apr 2021 18:07:03 +0200
Received: by mail-ot1-f43.google.com with SMTP id
 c24-20020a9d6c980000b02902662e210895so18067638otr.9; 
 Wed, 07 Apr 2021 09:07:01 -0700 (PDT)
X-Gm-Message-State: AOAM531+3ui50AUpDjqry90/xdzchUByKvyUzyKDFUdttk7wDZvlsIdv
 O0UuJRAjWNd+LLNyBRvUXpABDvS/kjl1EvfNCKM=
X-Google-Smtp-Source: ABdhPJymSQJTahzo74k3DCXqZLabZ7pj1oDnsEr/iW3XDliuXTMvQkoUagOIuZhBUsyHUIVKVPi0LMKTb9enlCKqF4I=
X-Received: by 2002:a9d:316:: with SMTP id 22mr3544860otv.210.1617811620677;
 Wed, 07 Apr 2021 09:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <22814673-e9fe-f65b-cc0f-b02be4f90d1a@gmail.com>
In-Reply-To: <22814673-e9fe-f65b-cc0f-b02be4f90d1a@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 7 Apr 2021 18:06:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0bp3CUzOQHSX5KYt44j-Njk_u2P=0q-ZQ0HcTBiVVVSA@mail.gmail.com>
Message-ID: <CAK8P3a0bp3CUzOQHSX5KYt44j-Njk_u2P=0q-ZQ0HcTBiVVVSA@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: changes for v5.13 (second round)
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Fabien Parent <fparent@baylibre.com>, 
 Irui Wang <irui.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 DTML <devicetree@vger.kernel.org>
X-Provags-ID: V03:K1:SqazPwvr0nPaIdsyrgk7OHK3V6kOlzxKgJbIO363DKvRLkBm24B
 giZ++hkitYAfI75LlHQw2n0RpiOIrr9ZMZOvyUL1gtnvXg/KOkqEyAlhCUZXdL4C3YvHJ2R
 yxQGXM/9/qXroYh/eOPPLc02Nm7ROgYKN9ZsdoN34gkDK6buFBU7RMWCCYyNVJ5LcEurvjU
 MbS78ttvnjOmqgsclKNBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w1fiFBLEuzc=:o1yGzpkglatoBhKCgBiwix
 QLW/PIe4wGkzcKL5A+dFTg1cjdnnaAmhDHVT8Wwpy7FTAqc7f9jVn8MoZQ1tbJp382H6/A5yG
 Pc1ri7J290HzOdDnYa2K8vnMbHmWPAolTqyx7uu1+6C371Y6SzJj3alkXE4vgkXqvBnUV1Wur
 Is2st962heiljfM+VviqRnNOePTpeS9UanH+fwQORjeiSv7pQj1VJdydY8B11+lFoZDqHXBKt
 GsvovLG/YBmAoPNNWjjEmr0HKCkhLrsq04PjCbg2Y3kQdq51sGO9ViStCcVpSR9cuiV+R/bIj
 jhfNlhQVku3IwiOQ0gmYWb1s/WFwY+TV7wmNc6/AqdtAhz8KNa4dEPK0PLNkxH3Z2Ty4en9rQ
 M5N+yTGxIiv0jAhtn2Wf+qSaFbIfpfqqQ17szL3HIeCzJyDfgoSWviqKp2o8jfAYst3r3EHA7
 hP952i5TZitvBqqIJLmfHEm3g5E7+0E=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_170706_224649_5E5235A2 
X-CRM114-Status: GOOD (  15.09  )
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

On Wed, Apr 7, 2021 at 1:00 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> Hi Olof and Arnd,
>
> Here comes the second round of arm64 DT patches. Hope I'm not too late.
> Basically we add several node to MT8167.
> ----------------------------------------------------------------
> Fabien Parent (6):

>       arm64: dts: mediatek: mt8167: add some DRM nodes

I stumbled over this patch adding a lot of aliases:

+       aliases {
+               aal0 = &aal;
+               ccorr0 = &ccorr;
+               color0 = &color;
+               dither0 = &dither;
+               dsi0 = &dsi;
+               ovl0 = &ovl0;
+               pwm0 = &disp_pwm;
+               rdma0 = &rdma0;
+               rdma1 = &rdma1;
+               wdma0 = &wdma;
+       };


Something doesn't quite feel right about this, and I checked with Rob,
who also thinks this looks wrong. I suppose we need to have a set of
well documented alias types rather than just having drivers make up
new ones on the spot.

I also noticed that some of the referenced nodes are missing a DT
binding file, so those need to be added and reviewed as well.

At this point, I'd prefer to drop the entire branch for v5.13 and have
you work it out for the next release.

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
