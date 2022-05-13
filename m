Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212F1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 21:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdQICgm9fF0QkdML1A4s2RZEyiAqEo9WpwJKeEgLoN0=; b=4uxsYqe2Sox0OJ
	+/r76k3aW2xeE6E67KLHB1lnAk6ESRIBJimwe0aqMeBeP/cGqDKlz37wJ+gkiC6TjFeqBu5svkqUj
	KuJGvDrwgcNVSQQE9e1IFpwTxHZDt7+6bPknk5lSeyj8xAFyrqLzbU6w0z2wDBVPKW/DXljRLaHIL
	U0UMBNb7LwqXm9PlpherDWGT4db7avH72YhXFlzPflNz70sq9QMubUSpqJ+D3HyXfkUCTzNqbLHEH
	zfnazeIbG8nJEST7CA2mkGCHiPXglZ76u892h9SWAra+eC6UQaKkdFkerJtp1FEwHBnfpQIMhz5qb
	6vGrbXNbZGjqpcuD2ZPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npcWv-0004D9-96; Fri, 13 May 2022 21:08:57 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npcWs-0004C3-GF; Fri, 13 May 2022 21:08:56 +0000
Received: from mail-yb1-f174.google.com ([209.85.219.174]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MYe6H-1nKX7C1keJ-00VknR; Fri, 13 May 2022 23:08:49 +0200
Received: by mail-yb1-f174.google.com with SMTP id j2so17452498ybu.0;
 Fri, 13 May 2022 14:08:49 -0700 (PDT)
X-Gm-Message-State: AOAM531O4aHRp7xSAHndTEiJ89ssj2qTovt9O3ANWWnB3cneKRypqAWZ
 22wGyuAUb8bstwf3BHNP1MpZcFu4J6dUjOlZgpc=
X-Google-Smtp-Source: ABdhPJxGsYcgRxijDnAxnaZBV41piMiw2krrZa+hZlLUYVk0W4WHqmiRXBg7o8Dt3FWJGLxvwNMsBXyok0kIZoLSF2c=
X-Received: by 2002:a25:d3c2:0:b0:645:74df:f43d with SMTP id
 e185-20020a25d3c2000000b0064574dff43dmr6794203ybf.394.1652476128026; Fri, 13
 May 2022 14:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <b4383f23-0adc-b9de-a1d9-abd1c2f82b27@gmail.com>
 <CAK8P3a0iFq3X6PrLggc=Av9GdWnJU=US659jaUXqH+X4GnbYTA@mail.gmail.com>
 <942eb0ea-3376-f891-e8b2-a57123ddccd7@gmail.com>
In-Reply-To: <942eb0ea-3376-f891-e8b2-a57123ddccd7@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 13 May 2022 23:08:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3-zN3Dn8LeWTDMszGdh0ogAt+t45Z4vyVqi2csFJWaEA@mail.gmail.com>
Message-ID: <CAK8P3a3-zN3Dn8LeWTDMszGdh0ogAt+t45Z4vyVqi2csFJWaEA@mail.gmail.com>
Subject: Re: [GIT PULL] arm: mediatek: DT updates for v5.19
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Yong Wu <yong.wu@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Evan Green <evgreen@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>
X-Provags-ID: V03:K1:y1bL1edFM3BPU9xUWbq2/OPJU1RqPljSPdJGMfWkqPiFrqp+vIj
 nNwVfOYrjMohLeaazFq1GtIcl08TXqZVtNxvKlo+KdmJ7pCNH2sCU8l2RAATKGm4m5xZzGp
 iXyU4OmyM/WRewkC4LDcD49JenO9zwIEqYhXjVsj3VsmeUkLGo6b6hjRabO9oHfZfK/4S+v
 mHFeXyLOMznVzcKWXGXbA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Oq97sB4CtGo=:LolnxOHv9LLpJKGRshudBA
 bpROnmehlZmDujTJRh+JXSL6+DLnby9OdC7f+OwncQeZRzwEItFvzH8MeQXzzXnyK3pbo1LoP
 3zv7dyvu4vdfR2Qe1fI/EnQp95uDuQK8fp1ViwkQtWFBTdwOjaudynKYKcnRVTfwA1vs2Hwg8
 OW2P6zG+Pw90XPT9RDMPkUr4r3dkaUXetiigkQbNBozI7XNaqtX/9mQuWFLKcR3sSh1Bc3nY3
 fPmOMyKXTUVVMQbqAFp8Cp89qyUp1/Gklp2FmJrw2Ciy/LxLE96ygxDQCZPrlCDUah++J9nFm
 XTRRiZ2uBV+BINu0V1hYPOU4fYy3+e5OfCLUx3czn5e+zdweMAEwiZPqf49G4k8Id7iToC5wM
 GXh57nQ5rNFpCqO6doXJR0bJoL4zV/NmN6/bWUgZHslCFol5T5KLouh10lH2b8aFkYb0cYk31
 Y9Ah+Q+YQDAXWyZuD2JSo7XGB1UVHXdkc6ncCNAo3EZzTK680z/ddJouaAy3JS9VlSfsZqCD8
 VMPfTWIdP9zTEB2XB66ZsglIPiHrz65gj1x04IkQnXMvAUUXB6eQJebAztBQoTrf/Y/zzRWNh
 ASrOpMB4TmBy4l4zqtfBO+wj1MellKLTLYNW1DXpoQG8NQ9d/vrb6zAMMvJHSRU0qrrkSFJHI
 FJbB0udp/hE1RcfBhCyYKjyyii9MXOb05ZNt+zWtLkH4f1HQSaTgN6Qlj2f0R+2rCcBnWtCEN
 oOHwZcbaXnqPMk0uBx2ipuz3aSniwuNyydzcJh397N1iUJD86h70zGfiHjpYbzc7RzknFel+J
 ssLOcJEkZIb5iYn/LjNHWw6iCQcCaV3YL/A+qKlOTytdwuOLkk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_140854_870173_504BE18C 
X-CRM114-Status: GOOD (  38.82  )
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

On Fri, May 13, 2022 at 6:06 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> On 13/05/2022 14:11, Arnd Bergmann wrote:
> > On Fri, May 13, 2022 at 1:21 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >> Please have a look on the below 32 bit DT updates for v5.19. Apologies for the
> >> late pull request but I got sick and needed my time to recover.
> >
> >> Yong Wu (1):
> >>         arm: dts: mediatek: Get rid of mediatek, larb for MM nodes
> >
> > Can you clarify what this means for backwards compatibility? I see old kernels
> > used to parse these properties, does that mean that the updated DT is no
> > longer compatible with them?
> >
>
> My understanding is, that backwards compatibility is given when using older DT
> with newer kernel. This should be the common case, normally you update your
> software but nearly never your FW. No compatibility is given when using older
> kernel with newer DT.
>
> I think that's an ongoing debate if we should provide backwards compatibility
> for both kernel and DT.

I agree that the case of old dt with new kernel is more important, but I still
want to hear about it when the other case (new dt on old kernel) breaks,
and why it's done.  There are clearly use cases for both forms of compatibility,
and there are reasons for ignoring them, the key is to communicate it clearly.

> > If you break compatibility, this should only be done for exceptional reasons,
> > and explain the tradeoffs. What is the oldest kernel that is still compatible
> > with the updated DT files, and why can't we just keep the properties around?
> >
>
> First kernel version that does not work with the old DT will be v5.18. This
> patch is the outcome of a change in the yaml file [1] which has a Acked-by from
> Rob. I double checked and I wasn't able to find the mail where Rob did give his
> Acked-by... Yong, can you provide a link to that email? I can see you added the
> Acked-by in v2 of the series.
>
> One thing that comes to mind, that we mark the larb phandle as deprecated in the
> yaml file, instead of deleting it. Then we could keep that in the DT files,
> although newer kernels won't work with that. Another option is, to add the code
> deleted by
> ba3cd6714aed ("media: mtk-jpeg: Get rid of mtk_smi_larb_get/put")
>
> back as fallback for older DTs. Although I fear there is much more things to fix
> in a lot of drivers. DRM, mdp and memory/mtk-smi.c are some that I found in a
> 'quick' look at the problem.
>
> Taking into account that and the fact that we are talking mainly about
> chromebooks and the Bananapi R2 as public available HW, I think we can live with
> the compatibility breakage of newer DTs not working with older kernels.

I'm less worried about the dts files that ship with the kernel than I am about
others that have custom dtbs built into the boot loader but are able to
run mainline kernels. Upgrading kernel and bootloader together is painful
here when you have limited compatibility with older versions, in particular
when you cannot dual-boot multiple kernel versions with the same dtb.

> Anyway as you can see, this patch is just the tip of the ice-berg. So if you
> feel that's something unacceptable we will need to chase people to fix backward
> compatibility.

After some more clarification on IRC, I found that this series has been
in progress since 2019 [2], and as you said, the changes to break compatibility
with pre-5.18 DTB files are getting merged through other trees, so I suppose
also breaking compatibility with old kernels isn't making it much worse.

I'll try to capture this in the merge log.

> [1]
> https://lore.kernel.org/linux-mediatek/20220117070510.17642-2-yong.wu@mediatek.com/

[2] https://lore.kernel.org/lkml/1546318276-18993-2-git-send-email-yong.wu@mediatek.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
