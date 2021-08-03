Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197E1C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:23:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B257960EFD
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B257960EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwi8UzKjy54YeLx8jewAkse/gE323bwatnLiwSkpvYw=; b=DqN4InGROzuKI0
	psTnt9MaXpX5NI7AZIp7GckBm0JZdY91JqD0E0b+ijGnNrv4DaS7f7GcdjOnVjJYaAfLDTJKAhRX/
	nG3OHKE7+YHtvQd7QukhwYcTMSyZ1feblBfE910hiYxSSlpbCdA8D6Nu32bSuJF5ttyjmKbzOCuwu
	VeSjngrtCjafYlEYyEDW11njRQxk3uxTAF6SxyYCwq74vSI3K7y/iL2xOmhwKDt6xJlU9SGwyU1yh
	lGSmwhcH256QcJe4EGuX4SBUTAWGxCza3MrdS8xTHdxz2zXHzLfQ9vJMEEvXhdnjUlH7R13t1Iy2c
	fpomCsrIrsuxveaIq5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mArZQ-001zSE-RU; Tue, 03 Aug 2021 10:22:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mArZO-001zRZ-A6; Tue, 03 Aug 2021 10:22:46 +0000
X-UUID: c3498638573d46d994efb4baf8cb9317-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yvp3yFfptOBZeNtXk/JiHgj9b5yJ3vyyTBlwNL02pbA=; 
 b=Sjk2QhV5Ttpf0VtCc5hWu6e+ClGUg0QJEOjPcNYP18LKcQfjaZMmn0bKu+ZkSlPuysvAN2psMGUOMkRw0q/vFOC+aN/yzCWdjIJZd2OhmPFH1yfPjNyst+u0e/oybffcCZylVGZ2LIWVVwu6zBQZxPve08SfdVGTra2Rnt3f7zc=;
X-UUID: c3498638573d46d994efb4baf8cb9317-20210803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1468952414; Tue, 03 Aug 2021 03:22:41 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 03:13:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 18:13:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Aug 2021 18:13:01 +0800
Message-ID: <2cf2c247cefeb451916fd043e21483bbb59a0147.camel@mediatek.com>
Subject: Re: [PATCH v2 5/8] ASoC: mediatek: mt8195: add platform driver
From: Trevor Wu <trevor.wu@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Chun-Jie Chen <chun-jie.chen@mediatek.com>, <broonie@kernel.org>,
 <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <alsa-devel@alsa-project.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, <bicycle.tsai@mediatek.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Jimmy Cheng-Yi Chiang
 <cychiang@google.com>, Li-Yu Yu <aaronyu@google.com>
Date: Tue, 3 Aug 2021 18:12:48 +0800
In-Reply-To: <CAGXv+5HGYOPHD3xro86xj0q4waJksfS=6NJa1hPU0=n1-Ur1bw@mail.gmail.com>
References: <20210629014736.31153-1-trevor.wu@mediatek.com>
 <20210629014736.31153-6-trevor.wu@mediatek.com>
 <CAGXv+5FzOs+=9PbYAEahVXvdJG1FnRkSUo_r3AVYZzNKGqg0oA@mail.gmail.com>
 <9929a3a20df1a89fc94baf7c75c0c65d9a61de0f.camel@mediatek.com>
 <CAGXv+5HFjM_N_MM5ZddGLcuYVsOXAJwfNuKvB5Cfo0k=nO456g@mail.gmail.com>
 <266fd1f5de56743292ac5fc64664113c0bb0e41a.camel@mediatek.com>
 <CAGXv+5FVWNgCeAseULOJbU3=6ggQ=b=mtP_sEQd0NgtdX-ttiQ@mail.gmail.com>
 <31bcc613abb0f805400faa8b8108100cb578d9b1.camel@mediatek.com>
 <CAGXv+5HOL5j4gjgJa0RLjvf3+Vt2sGZcWU1KQXwjn7DOYy-JWg@mail.gmail.com>
 <fc12d71febfebda12e57b287de0ad2668db20ffa.camel@mediatek.com>
 <CAGXv+5HGYOPHD3xro86xj0q4waJksfS=6NJa1hPU0=n1-Ur1bw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-Spam-Note: CRM114 run bypassed due to message size (1329672 bytes)
X-Spam-Note: SpamAssassin run bypassed due to message size (1329672 bytes)
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

On Mon, 2021-08-02 at 18:21 +0800, Chen-Yu Tsai wrote:
> On Mon, Jul 26, 2021 at 10:31 PM Trevor Wu <trevor.wu@mediatek.com>
> wrote:
> > 
> > On Fri, 2021-07-23 at 14:27 +0800, Chen-Yu Tsai wrote:
> > > On Thu, Jul 22, 2021 at 4:56 PM Trevor Wu <trevor.wu@mediatek.com
> > > >
> > > wrote:
> > > > 
> > > > On Mon, 2021-07-19 at 18:05 +0800, Chen-Yu Tsai wrote:
> > > > > Hi,
> > > > > 
> > > > > On Thu, Jul 15, 2021 at 7:05 PM Trevor Wu <
> > > > > trevor.wu@mediatek.com
> > > > > > 
> > > > > 
> > > > > wrote:
> > > > > > 
> > > > > > On Tue, 2021-07-13 at 14:00 +0800, Chen-Yu Tsai wrote:
> > > > > > > On Mon, Jul 12, 2021 at 11:10 PM Trevor Wu <
> > > > > > > trevor.wu@mediatek.com>
> > > > > > > wrote:
> > > > > > > > 
> > > > > > > > On Mon, 2021-07-12 at 14:57 +0800, Chen-Yu Tsai wrote:
> > > > > > > > >  are all internal Hi,
> > > > > > > > > 
> > > > > > > > > On Tue, Jun 29, 2021 at 9:49 AM Trevor Wu <
> > > > > > > > > trevor.wu@mediatek.com
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > wrote:
> > > > > > > > > > 
> > > > > > > > > > This patch adds mt8195 platform and affiliated
> > > > > > > > > > driver.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> > > > > > > > > > ---
> > > > > > > > > >  sound/soc/mediatek/Kconfig                     |  
> > > > > > > > > >   9
> > > > > > > > > > +
> > > > > > > > > >  sound/soc/mediatek/Makefile                   |   
> > > > > > > > > >  1 +
> > > > > > > > > >  sound/soc/mediatek/mt8195/Makefile            |   
> > > > > > > > > > 11 +
> > > > > > > > > >  sound/soc/mediatek/mt8195/mt8195-afe-
> > > > > > > > > > clk.c    |  899
> > > > > > > > > > +++++
> > > > > > > > > >  sound/soc/mediatek/mt8195/mt8195-afe-
> > > > > > > > > > clk.h    |  201 +
> > > > > > > > > >  sound/soc/mediatek/mt8195/mt8195-afe-common.h
> > > > > > > > > > |  200 +
> > > > > > > > > >  sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |
> > > > > > > > > > 3264
> > > > > > > > > > +++++++++++++++++
> > > > > > > > > >  sound/soc/mediatek/mt8195/mt8195-reg.h        |
> > > > > > > > > > 2793
> > > > > > > > > > ++++++++++++++
> > > > > > > > > >  8 files changed, 7378 insertions(+)
> > > > > > > > > >  create mode 100644
> > > > > > > > > > sound/soc/mediatek/mt8195/Makefile
> > > > > > > > > >  create mode 100644
> > > > > > > > > > sound/soc/mediatek/mt8195/mt8195-
> > > > > > > > > > afe-
> > > > > > > > > > clk.c
> > > > > > > > > >  create mode 100644
> > > > > > > > > > sound/soc/mediatek/mt8195/mt8195-
> > > > > > > > > > afe-
> > > > > > > > > > clk.h
> > > > > > > > > >  create mode 100644
> > > > > > > > > > sound/soc/mediatek/mt8195/mt8195-
> > > > > > > > > > afe-
> > > > > > > > > > common.h
> > > > > > > > > >  create mode 100644
> > > > > > > > > > sound/soc/mediatek/mt8195/mt8195-
> > > > > > > > > > afe-
> > > > > > > > > > pcm.c
> > > > > > > > > >  create mode 100644
> > > > > > > > > > sound/soc/mediatek/mt8195/mt8195-
> > > > > > > > > > reg.h
> > > > > > > > > > 
> > > > > > > > > > diff --git a/sound/soc/mediatek/Kconfig
> > > > > > > > > > b/sound/soc/mediatek/Kconfig
> > > > > > > > > > index 74dae4332d17..3389f382be06 100644
> > > > > > > > > > --- a/sound/soc/mediatek/Kconfig
> > > > > > > > > > +++ b/sound/soc/mediatek/Kconfig
> > > > > > > > > > @@ -184,3 +184,12 @@ config
> > > > > > > > > > SND_SOC_MT8192_MT6359_RT1015_RT5682
> > > > > > > > > >           with the MT6359 RT1015 RT5682 audio
> > > > > > > > > > codec.
> > > > > > > > > >           Select Y if you have such device.
> > > > > > > > > >           If unsure select "N".
> > > > > > > > > > +
> > > > > > > > > > +config SND_SOC_MT8195
> > > > > > > > > > +       tristate "ASoC support for Mediatek MT8195
> > > > > > > > > > chip"
> > > > > > > > > > +       select SND_SOC_MEDIATEK
> > > > > > > > > > +       help
> > > > > > > > > > +         This adds ASoC platform driver support
> > > > > > > > > > for
> > > > > > > > > > Mediatek
> > > > > > > > > > MT8195 chip
> > > > > > > > > > +         that can be used with other codecs.
> > > > > > > > > > +         Select Y if you have such device.
> > > > > > > > > > +         If unsure select "N".
> > > > > > > > > > diff --git a/sound/soc/mediatek/Makefile
> > > > > > > > > > b/sound/soc/mediatek/Makefile
> > > > > > > > > > index f6cb6b8508e3..34778ca12106 100644
> > > > > > > > > > --- a/sound/soc/mediatek/Makefile
> > > > > > > > > > +++ b/sound/soc/mediatek/Makefile
> > > > > > > > > > @@ -5,3 +5,4 @@ obj-$(CONFIG_SND_SOC_MT6797) +=
> > > > > > > > > > mt6797/
> > > > > > > > > >  obj-$(CONFIG_SND_SOC_MT8173) += mt8173/
> > > > > > > > > >  obj-$(CONFIG_SND_SOC_MT8183) += mt8183/
> > > > > > > > > >  obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
> > > > > > > > > > +obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
> > > > > > > > > > diff --git a/sound/soc/mediatek/mt8195/Makefile
> > > > > > > > > > b/sound/soc/mediatek/mt8195/Makefile
> > > > > > > > > > new file mode 100644
> > > > > > > > > > index 000000000000..b2c9fd88f39e
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/sound/soc/mediatek/mt8195/Makefile
> > > > > > > > > > @@ -0,0 +1,11 @@
> > > > > > > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > +
> > > > > > > > > > +# platform driver
> > > > > > > > > > +snd-soc-mt8195-afe-objs := \
> > > > > > > > > > +       mt8195-afe-clk.o \
> > > > > > > > > > +       mt8195-afe-pcm.o \
> > > > > > > > > > +       mt8195-dai-adda.o \
> > > > > > > > > > +       mt8195-dai-etdm.o \
> > > > > > > > > > +       mt8195-dai-pcm.o
> > > > > > > > > > +
> > > > > > > > > > +obj-$(CONFIG_SND_SOC_MT8195) += snd-soc-mt8195-
> > > > > > > > > > afe.o
> > > > > > > > > > diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-
> > > > > > > > > > clk.c
> > > > > > > > > > b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> > > > > > > > > > new file mode 100644
> > > > > > > > > > index 000000000000..57aa799b4f41
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> > > > > > > > > > @@ -0,0 +1,899 @@
> > > > > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > +/*
> > > > > > > > > > + * mt8195-afe-clk.c  --  Mediatek 8195 afe clock
> > > > > > > > > > ctrl
> > > > > > > > > > + *
> > > > > > > > > > + * Copyright (c) 2021 MediaTek Inc.
> > > > > > > > > > + * Author: Bicycle Tsai <bicycle.tsai@mediatek.com
> > > > > > > > > > >
> > > > > > > > > > + *         Trevor Wu <trevor.wu@mediatek.com>
> > > > > > > > > > + */
> > > > > > > > > > +
> > > > > > > > > > +#include <linux/clk.h>
> > > > > > > > > > +
> > > > > > > > > > +#include "mt8195-afe-common.h"
> > > > > > > > > > +#include "mt8195-afe-clk.h"
> > > > > > > > > > +#include "mt8195-reg.h"
> > > > > > > > > > +
> > > > > > > > > > +static const char *aud_clks[MT8195_CLK_NUM] = {
> > > > > > > > > 
> > > > > > > > > Most of these clocks are not described in the device
> > > > > > > > > tree
> > > > > > > > > binding. If
> > > > > > > > > the driver needs to reference them, they should be
> > > > > > > > > described.
> > > > > > > > > We
> > > > > > > > > should
> > > > > > > > > not be hard-coding clock names across different
> > > > > > > > > drivers.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Sorry, I didn't know I have to list all clocks in the
> > > > > > > > dt-
> > > > > > > > binding.
> > > > > > > > Originally, I thought these clocks will be described in
> > > > > > > > the
> > > > > > > > clock
> > > > > > > > binding, so I didn't add them to the binding of afe
> > > > > > > > driver.
> > > > > > > > I will add these clocks to mt8195-afe-pcm.yaml.
> > > > > > > 
> > > > > > > If the device consumes clocks, then the clocks that get
> > > > > > > consumed
> > > > > > > should
> > > > > > > be listed in the device's bindings. This is not related
> > > > > > > to
> > > > > > > the
> > > > > > > clock
> > > > > > > bindings, which is a clock provider.
> > > > > > > 
> > > > > > 
> > > > > > Got it. Thanks.
> > > > > > 
> > > > > > > > > The more important question is, why does the driver
> > > > > > > > > need
> > > > > > > > > to
> > > > > > > > > reference
> > > > > > > > > all of them? Maybe we should take a step back and
> > > > > > > > > draw
> > > > > > > > > out a
> > > > > > > > > clock
> > > > > > > > > tree
> > > > > > > > > diagram for the hardware?
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > The clock structure is PLL -> MUX -> GATE.
> > > > > > > > xtal, pll and divider are the possible clock inputs for
> > > > > > > > MUX.
> > > > > > > > Because we select the clock input of audio module based
> > > > > > > > on
> > > > > > > > the
> > > > > > > > use
> > > > > > > > case, we use clk_get to retrive all clocks which are
> > > > > > > > possible
> > > > > > > > to be
> > > > > > > > used.
> > > > > > > 
> > > > > > > So I see a couple the driver is doing reparenting:
> > > > > > > 
> > > > > > >   a. Reparent audio_h to standard oscillator when ADDA is
> > > > > > > not
> > > > > > > used,
> > > > > > >      presumably to let the APLL be turned off
> > > > > > > 
> > > > > > > Why not just turn off audio_h? It looks like audio_h
> > > > > > > feeds a
> > > > > > > couple
> > > > > > > clock
> > > > > > > gates in the audio subsystem. Just a guess, but is this
> > > > > > > the
> > > > > > > AHB
> > > > > > > bus
> > > > > > > clock?
> > > > > > > Why not just have it parented to "univpll_d7" all the
> > > > > > > time
> > > > > > > then?
> > > > > > > 
> > > > > > 
> > > > > > Sorry, I am not sure if it is the AHB bus clock.
> > > > > > I only know how audio module uses the clock.
> > > > > > audio_h feeds to some clock gate like aud_adc_hires, which
> > > > > > is
> > > > > > used
> > > > > > when
> > > > > > sampling rate is higher than 48kHz, and hardware designer
> > > > > > suggests
> > > > > > us
> > > > > > use apll1_ck when AFE requrires the clock.
> > > > > 
> > > > > I see. So the simplified explanation is high clock rate for
> > > > > high
> > > > > res
> > > > > audio.
> > > > > Would high clock rate work for standard sample rates?
> > > > 
> > > > As far as I know, HW will switch clock to hires clock
> > > > automatically
> > > > when the required rate is high,(ex: aud_adc and aud_adc_hires)
> > > > so
> > > > it
> > > > can't be controlled by driver.
> > > 
> > > I see. That might not be so friendly to the Linux clk driver.
> > > 
> > > > > Would using apll1 or univpll all the time work, instead of
> > > > > reparenting?
> > > > > What's the gain if we do reparenting?
> > > > > 
> > > > 
> > > > As you said before, the gain is apll can be turned off when the
> > > > clock
> > > > is not requrired by ADDA. That's why we didn't use apll all the
> > > > time.
> > > 
> > > Right, and what's the gain from turning it off? Lower power
> > > consumption?
> > > 
> > 
> > Yes. Xtal_26m is supplied to most modules, but APLL1 is mainly used
> > by
> > afe. When audio feature is not used, we hope APLL1 can be turned
> > off to
> > lower power consumption.
> > 
> > > > > > As I know, DSP also requires audio_h.
> > > > > > When we disable the clock in AFE driver, the ref count in
> > > > > > CCF
> > > > > > is
> > > > > > not
> > > > > > becoming zero if DSP still uses it.
> > > > > > But only AFE requires higher clock rate, so we reparent
> > > > > > audio_h
> > > > > > to
> > > > > > 26M
> > > > > > when it's not required in adda module.
> > > > > 
> > > > > I see. Wouldn't reparenting the clock while it is in use by
> > > > > another
> > > > > module
> > > > > cause glitches?
> > > > 
> > > > I checked with the DSP owner.
> > > > audio_h clock is required for DSP bus, but the clock rate is
> > > > not
> > > > important.
> > > > The only thing it cares is audio_h should be powered on, so
> > > > reparenting
> > > > is harmless for DSP.
> > > 
> > > OK.
> > > 
> > > > > > > Also, reparenting really should be done implicitly with
> > > > > > > clk_set_rate()
> > > > > > > with the clock driver supporting reparenting on rate
> > > > > > > changes.
> > > > > > > 
> > > > > > >   b. Assignment of PLLs for I2S/PCM MCLK outputs
> > > > > > > 
> > > > > > > Is there a reason for explicit assignment, other than
> > > > > > > clock
> > > > > > > rate
> > > > > > > conflicts?
> > > > > > > CCF supports requesting and locking the clock rate. And
> > > > > > > again,
> > > > > > > implicit
> > > > > > > reparenting should be the norm. The clock driver's
> > > > > > > purpose is
> > > > > > > to
> > > > > > > fulfill
> > > > > > > any and all clock rate requirements from its consumers.
> > > > > > > The
> > > > > > > consumer
> > > > > > > should
> > > > > > > only need to ask for the clock rate, not a specific
> > > > > > > parent,
> > > > > > > unless
> > > > > > > there
> > > > > > > are details that are not yet covered by the CCF.
> > > > > > > 
> > > > > > 
> > > > > > For MCLK output, we should configure divider to get the
> > > > > > target
> > > > > > rate,
> > > > > > and it can only divide the clock from current parent
> > > > > > source.
> > > > > > So we should do reparent to divider's parent in case the
> > > > > > parent
> > > > > > rate is
> > > > > > not a multiple of target rate.
> > > > > 
> > > > > Right. That is expected. What I'm saying is that the CCF
> > > > > provides
> > > > > the
> > > > > framework for automatically reparenting based on the
> > > > > requested
> > > > > clock
> > > > > rate. This is done in the clock driver's .determine_rate op.
> > > > > 
> > > > > When properly implemented, and also restricting or locking
> > > > > the
> > > > > clock
> > > > > rates
> > > > > of the PLLs, then you can simply request a clock rate on the
> > > > > leaf
> > > > > clock,
> > > > > in this case one of the MCLKs, and the CCF and clock driver
> > > > > would
> > > > > handle
> > > > > everything else. The consumer should not be reparenting
> > > > > clocks
> > > > > manually
> > > > > unless for a very good reason which cannot be satisfied by
> > > > > the
> > > > > CCF.
> > > > > 
> > > > 
> > > > In some use cases, we really need to reparent clock manually.
> > > > For example, spdif in(slave) -> .... -> i2s out(master)
> > > > 
> > > > APLL3/APLL4 are reserved for slave input like earc in or spdif
> > > > in,
> > > > which can refer to the external clock source.(APLL3 syncs with
> > > > earc,
> > > > and APLL4 syncs with spdif in.)
> > > > 
> > > > When i2s out selects the clock source to APLL4, this makes sure
> > > > that
> > > > spdif in and i2s out works in the same clock source.
> > > > If we just use APLL1/APLL2 on i2s out, there is little rate
> > > > mismatch
> > > > between data input and output. Finally, it results in XRUN.
> > > 
> > > I see, that makes more sense.
> > > 
> > > > If we only use set_rate, it's possible that it can't switch to
> > > > the
> > > > expected PLL source, because the rate of APLL3/APLL4 should be
> > > > close to
> > > > APLL1/APLL2.
> > > 
> > > Well, in theory the CCF should choose the one with the closest
> > > rate.
> > > And if APLL3/APLL4 is already tracking the external clock source,
> > > its
> > > clock rate should match.
> > > 
> > > If it's a static requirement, maybe we could replace the *-mclk-
> > > source
> > > DT properties with standard assigned-clocks and assigned-clock-
> > > parents?
> > > This would get handled by CCF directly, and then the only thing
> > > the
> > > clk driver has to do is make sure it doesn't get reparented
> > > again.
> > > 
> > > Or is there a need to do reparenting at runtime?
> > > 
> > 
> > For the use case of APLL3/APLL4, static assignment should be ok.
> > 
> > But I checked with CCF owner, we can't just use
> > clk_set_rate(divider,[    3.694495] <7>.(7)[1:swapper/0]initcall
> > mtk_spi_slave_driver_init+0x0/0x20 returned 0 after 110 usecs
> > [    3.695671]
> > <7>.(7)[1:swapper/0]calling  spi_slave_mt27xx_test_driver_init+0x0/
> > 0x20 @ 1
> > [    3.696677] <7>.(7)[1:swapper/0]initcall
> > spi_slave_mt27xx_test_driver_init+0x0/0x20 returned 0 after 7 usecs
> > [    3.697900]
> > <7>.(7)[1:swapper/0]calling  mtk_spmi_driver_init+0x0/0x20 @ 1
> > [    3.698455] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.699545] <0>-(7)[1:swapper/0]Perf order domain is not ready!
> > [    3.699596] <6>-(7)[1:swapper/0]Perf order domain is not ready!
> > [    3.699635] <6>-(7)[1:swapper/0]Perf order domain is not ready!
> > [    3.699677] <7>-(7)[1:swapper/0]Perf order domain is not ready!
> > [    3.699715] <6>-(7)[1:swapper/0]Perf order domain is not ready!
> > [    3.699763] <7>-(7)[1:swapper/0]Perf order domain is not ready!
> > [    3.699771] <6>.(6)[154:irq/257-pmif_ir]spmimst 0x44 = 0xb0323
> > [    3.701281] <7>.(7)[1:swapper/0]probe of 0-06 returned 1 after
> > 875 usecs
> > [    3.701910] <6>.(6)[154:irq/257-pmif_ir]spmimst 0x48 = 0x0
> > [    3.703358] <7>.(7)[1:swapper/0]platform gpufreq: Linked as a
> > consumer to 0-07
> > [    3.703395] <7>.(6)[154:irq/257-pmif_ir]spmimst 0x4c = 0x0
> > [    3.704671] <7>.(7)[1:swapper/0]probe of 0-07 returned 1 after
> > 1706 usecs
> > [    3.704852] <7>.(6)[154:irq/257-pmif_ir]spmimst 0x50 = 0x0
> > [    3.705690] <7>.(7)[1:swapper/0]probe of 10027000.spmi returned
> > 1 after 6915 usecs
> > [    3.710523] <7>.(7)[1:swapper/0]initcall
> > mtk_spmi_driver_init+0x0/0x20 returned 0 after 11489 usecs
> > [    3.711655]
> > <7>.(7)[1:swapper/0]calling  dummy_init_module+0x0/0xa0 @ 1
> > [    3.712845] <7>.(7)[1:swapper/0]initcall
> > dummy_init_module+0x0/0xa0 returned 0 after 355 usecs
> > [    3.713918]
> > <7>.(7)[1:swapper/0]calling  ifb_init_module+0x0/0xb8 @ 1
> > [    3.715120] <2>-(2)[0:swapper/2]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.715202] <7>.(7)[1:swapper/0]initcall
> > ifb_init_module+0x0/0xb8 returned 0 after 468 usecs
> > [    3.717105]
> > <7>.(7)[1:swapper/0]calling  net_olddevs_init+0x0/0x34 @ 1
> > [    3.717923] <7>.(7)[1:swapper/0]initcall
> > net_olddevs_init+0x0/0x34 returned 0 after 5 usecs
> > [    3.718963]
> > <7>.(7)[1:swapper/0]calling  fixed_mdio_bus_init+0x0/0x118 @ 1
> > [    3.720218] <7>.(7)[1:swapper/0]mdio_bus fixed-0: GPIO lookup
> > for consumer reset
> > [    3.721140] <7>.(7)[1:swapper/0]mdio_bus fixed-0: using lookup
> > tables for GPIO lookup
> > [    3.722116] <7>.(7)[1:swapper/0]mdio_bus fixed-0: No GPIO
> > consumer reset found
> > [    3.723021] <7>.(7)[1:swapper/0]libphy: Fixed MDIO Bus: probed
> > [    3.723756] <7>.(7)[1:swapper/0]initcall
> > fixed_mdio_bus_init+0x0/0x118 returned 0 after 3837 usecs
> > [    3.724871]
> > <7>.(7)[1:swapper/0]calling  phy_module_init+0x0/0x24 @ 1
> > [    3.725707] <7>.(7)[1:swapper/0]initcall
> > phy_module_init+0x0/0x24 returned 0 after 32 usecs
> > [    3.726747] <7>.(7)[1:swapper/0]calling  tun_init+0x0/0xc0 @ 1
> > [    3.727479] <7>.(7)[1:swapper/0]tun: Universal TUN/TAP device
> > driver, 1.6
> > [    3.728514] <7>.(7)[1:swapper/0]initcall tun_init+0x0/0xc0
> > returned 0 after 1010 usecs
> > [    3.729501] <7>.(7)[1:swapper/0]calling  veth_init+0x0/0x1c @ 1
> > [    3.730240] <7>.(7)[1:swapper/0]initcall veth_init+0x0/0x1c
> > returned 0 after 1 usecs
> > [    3.731209]
> > <7>.(7)[1:swapper/0]calling  cavium_ptp_driver_init+0x0/0x28 @ 1
> > [    3.731785] <3>-(3)[0:swapper/3]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.732127] <7>.(7)[1:swapper/0]initcall
> > cavium_ptp_driver_init+0x0/0x28 returned 0 after 37 usecs
> > [    3.734135] <7>.(7)[1:swapper/0]calling  stmmac_init+0x0/0x64 @
> > 1
> > [    3.734903] <7>.(7)[1:swapper/0]initcall stmmac_init+0x0/0x64
> > returned 0 after 7 usecs
> > [    3.735894]
> > <7>.(7)[1:swapper/0]calling  mediatek_dwmac_driver_init+0x0/0x20 @
> > 1
> > [    3.736855] <7>.(7)[1:swapper/0]probe of 11021000.ethernet
> > returned -517 after 0 usecs
> > [    3.737922] <7>.(7)[1:swapper/0]initcall
> > mediatek_dwmac_driver_init+0x0/0x20 returned 0 after 1078 usecs
> > [    3.739107]
> > <7>.(7)[1:swapper/0]calling  dwmac_generic_driver_init+0x0/0x20 @ 1
> > [    3.740209] <7>.(7)[1:swapper/0]initcall
> > dwmac_generic_driver_init+0x0/0x20 returned 0 after 186 usecs
> > [    3.741368] <7>.(7)[1:swapper/0]calling  ppp_init+0x0/0x128 @ 1
> > [    3.742105] <7>.(7)[1:swapper/0]PPP generic driver version 2.4.2
> > [    3.743040] <7>.(7)[1:swapper/0]initcall ppp_init+0x0/0x128
> > returned 0 after 912 usecs
> > [    3.744032] <7>.(7)[1:swapper/0]calling  ppp_async_init+0x0/0x48
> > @ 1
> > [    3.744826] <7>.(7)[1:swapper/0]initcall ppp_async_init+0x0/0x48
> > returned 0 after 0 usecs
> > [    3.745845] <7>.(7)[1:swapper/0]calling  bsdcomp_init+0x0/0x40 @
> > 1
> > [    3.746615] <7>.(7)[1:swapper/0]PPP BSD Compression module
> > registered
> > [    3.747422] <7>.(7)[1:swapper/0]initcall bsdcomp_init+0x0/0x40
> > returned 0 after 787 usecs
> > [    3.748441] <7>.(7)[1:swapper/0]calling  deflate_init+0x0/0x60 @
> > 1
> > [    3.749212] <7>-(7)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.750145] <7>.(7)[1:swapper/0]PPP Deflate Compression module
> > registered
> > [    3.750993] <7>.(7)[1:swapper/0]initcall deflate_init+0x0/0x60
> > returned 0 after 827 usecs
> > [    3.752015] <7>.(7)[1:swapper/0]calling  ppp_mppe_init+0x0/0xd0
> > @ 1
> > [    3.752814] <7>.(7)[1:swapper/0]PPP MPPE Compression module
> > registered
> > [    3.753629] <7>.(7)[1:swapper/0]initcall ppp_mppe_init+0x0/0xd0
> > returned 0 after 812 usecs
> > [    3.754658] <7>.(7)[1:swapper/0]calling  ppp_sync_init+0x0/0x48
> > @ 1
> > [    3.755442] <7>.(7)[1:swapper/0]initcall ppp_sync_init+0x0/0x48
> > returned 0 after 0 usecs
> > [    3.756450] <7>.(7)[1:swapper/0]calling  pppox_init+0x0/0x1c @ 1
> > [    3.757199] <7>.(7)[1:swapper/0]NET: Registered protocol family
> > 24
> > [    3.757970] <7>.(7)[1:swapper/0]initcall pppox_init+0x0/0x1c
> > returned 0 after 753 usecs
> > [    3.758966] <7>.(7)[1:swapper/0]calling  pppoe_init+0x0/0x9c @ 1
> > [    3.759729] <7>.(7)[1:swapper/0]initcall pppoe_init+0x0/0x9c
> > returned 0 after 9 usecs
> > [    3.760705]
> > <7>.(7)[1:swapper/0]calling  pptp_init_module+0x0/0xdc @ 1
> > [    3.761519] <7>.(7)[1:swapper/0]PPTP driver version 0.8.5
> > [    3.762398] <7>.(7)[1:swapper/0]initcall
> > pptp_init_module+0x0/0xdc returned 0 after 856 usecs
> > [    3.763467]
> > <7>.(7)[1:swapper/0]calling  asix_driver_init+0x0/0x28 @ 1
> > [    3.764304] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver asix
> > [    3.765122] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.765194] <7>.(7)[1:swapper/0]initcall
> > asix_driver_init+0x0/0x28 returned 0 after 891 usecs
> > [    3.765200]
> > <7>.(7)[1:swapper/0]calling  ax88179_178a_driver_init+0x0/0x28 @ 1
> > [    3.768118] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver ax88179_178a
> > [    3.769094] <7>.(7)[1:swapper/0]initcall
> > ax88179_178a_driver_init+0x0/0x28 returned 0 after 977 usecs
> > [    3.770243]
> > <7>.(7)[1:swapper/0]calling  cdc_driver_init+0x0/0x28 @ 1
> > [    3.771056] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver cdc_ether
> > [    3.771999] <7>.(7)[1:swapper/0]initcall
> > cdc_driver_init+0x0/0x28 returned 0 after 930 usecs
> > [    3.773050]
> > <7>.(7)[1:swapper/0]calling  net1080_driver_init+0x0/0x28 @ 1
> > [    3.773901] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver net1080
> > [    3.774823] <7>.(7)[1:swapper/0]initcall
> > net1080_driver_init+0x0/0x28 returned 0 after 904 usecs
> > [    3.775920]
> > <7>.(7)[1:swapper/0]calling  cdc_subset_driver_init+0x0/0x28 @ 1
> > [    3.776806] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver cdc_subset
> > [    3.777759] <7>.(7)[1:swapper/0]initcall
> > cdc_subset_driver_init+0x0/0x28 returned 0 after 937 usecs
> > [    3.778885]
> > <7>.(7)[1:swapper/0]calling  zaurus_driver_init+0x0/0x28 @ 1
> > [    3.779728] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver zaurus
> > [    3.780639] <7>.(7)[1:swapper/0]initcall
> > zaurus_driver_init+0x0/0x28 returned 0 after 894 usecs
> > [    3.781722] <7>.(7)[1:swapper/0]calling  usbnet_init+0x0/0x40 @
> > 1
> > [    3.781788] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.782486] <7>.(7)[1:swapper/0]initcall usbnet_init+0x0/0x40
> > returned 0 after 2 usecs
> > [    3.784406]
> > <7>.(7)[1:swapper/0]calling  cdc_ncm_driver_init+0x0/0x28 @ 1
> > [    3.785263] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver cdc_ncm
> > [    3.786185] <7>.(7)[1:swapper/0]initcall
> > cdc_ncm_driver_init+0x0/0x28 returned 0 after 910 usecs
> > [    3.787283]
> > <7>.(7)[1:swapper/0]calling  mtu3_driver_init+0x0/0x20 @ 1
> > [    3.788238] <7>.(7)[1:swapper/0]mtu3 usb: Linked as a consumer
> > to regulator.19
> > [    3.789222] <7>.(7)[1:swapper/0]mtu3 usb: usb supply vbus not
> > found, using dummy regulator
> > [    3.790267] <7>.(7)[1:swapper/0]mtu3 usb: Linked as a consumer
> > to regulator.0
> > [    3.791164] <7>.(7)[1:swapper/0]mtu3 usb: dr_mode: 3, is_u3_dr:
> > 1, u3p_dis_msk: 0, drd: auto
> > [    3.792260] <7>.(7)[1:swapper/0]mtk-tphy usb-phy0:
> > u2_phy_pll_26m_set
> > [    3.793078] <7>.(7)[1:swapper/0]phy phy-usb-phy0.1:
> > u2_phy_props_set, bc12:0, src:0, vrt:0, term:0, rev6:1, dis:0
> > [    3.794448] <7>.(7)[1:swapper/0]mtk-tphy usb-phy0:
> > u2_phy_instance_set_mode_ext submode(2)
> > [    3.795502] <7>.(7)[1:swapper/0]mtu3 usb: irq 290
> > [    3.796099] <7>.(7)[1:swapper/0]mtu3 usb: IP version 0x1006(U3
> > IP)
> > [    3.796983] <7>.(7)[1:swapper/0]mtu3 usb: fifosz/epnum:
> > Tx=0x4000/8, Rx=0x4000/8
> > [    3.797916] <7>.(7)[1:swapper/0]mtu3 usb: max_speed: super-
> > speed-plus
> > [    3.798454] <1>-(1)[0:swapper/1]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.798724] <7>.(7)[1:swapper/0]mtu3 usb: dma mask: 36 bits
> > [    3.801312] <7>.(7)[1:swapper/0]mtu3 usb: role_sw_set role 0
> > [    3.802021] <7>.(7)[1:swapper/0]mtu3 usb: mailbox ID_FLOAT
> > [    3.802706] <7>.(7)[1:swapper/0]mtu3 usb: clk already enabled
> > [    3.803429] <7>.(7)[1:swapper/0]mtu3 usb: phy already enabled
> > [    3.804285]
> > <7>.(7)[1:swapper/0]BOOTPROF:      3804.284162:probe:
> > probe=platform_drv_probe
> > drv=mtu3(0xffffff8009607dd8)    16.101384ms
> > [    3.805797] <7>.(7)[1:swapper/0]probe of usb returned 1 after
> > 17663 usecs
> > [    3.806694] <7>.(7)[1:swapper/0]mtu3 usb1: Linked as a consumer
> > to regulator.19
> > [    3.807667] <7>.(7)[1:swapper/0]mtu3 usb1: Linked as a consumer
> > to regulator.2
> > [    3.808568] <7>.(7)[1:swapper/0]mtu3 usb1: dr_mode: 1, is_u3_dr:
> > 0, u3p_dis_msk: 0, drd: auto
> > [    3.809643] <7>.(7)[1:swapper/0]mtk-tphy usb-phy2:
> > u2_phy_pll_26m_set
> > [    3.810457] <7>.(7)[1:swapper/0]phy phy-usb-phy2.0:
> > u2_phy_props_set, bc12:0, src:0, vrt:0, term:0, rev6:1, dis:0
> > [    3.811760] <7>.(7)[1:swapper/0]mtk-tphy usb-phy2:
> > u2_phy_instance_set_mode_ext submode(2)
> > [    3.813036] <7>.(7)[1:swapper/0]platform 112a0000.xhci1: Linked
> > as a consumer to 11003000.syscon
> > [    3.814133] <7>.(7)[1:swapper/0]platform 112a0000.xhci1: Linked
> > as a consumer to usb-phy2
> > [    3.815119] <2>-(2)[0:swapper/2]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.815281] <7>.(7)[1:swapper/0]mtu3 usb1: xHCI platform device
> > register success...
> > [    3.817050] <7>.(7)[1:swapper/0]probe of usb1 returned 1 after
> > 10401 usecs
> > [    3.818059]
> > <7>.(7)[1:swapper/0]BOOTPROF:      3818.057700:initcall:
> > mtu3_driver_init    29.959154ms
> > [    3.819204] <7>.(7)[1:swapper/0]initcall
> > mtu3_driver_init+0x0/0x20 returned 0 after 30377 usecs
> > [    3.820287] <7>.(7)[1:swapper/0]calling  xhci_hcd_init+0x0/0x28
> > @ 1
> > [    3.821073] <7>.(7)[1:swapper/0]initcall xhci_hcd_init+0x0/0x28
> > returned 0 after 3 usecs
> > [    3.822081] <7>.(7)[1:swapper/0]calling  xhci_pci_init+0x0/0x68
> > @ 1
> > [    3.822888] <7>.(7)[1:swapper/0]initcall xhci_pci_init+0x0/0x68
> > returned 0 after 23 usecs
> > [    3.823911] <7>.(7)[1:swapper/0]calling  xhci_mtk_init+0x0/0x34
> > @ 1
> > [    3.824729] <7>.(7)[1:swapper/0]probe of 11290000.xhci30
> > returned -517 after 0 usecs
> > [    3.825811] <7>.(7)[1:swapper/0]xhci-mtk 112a0000.xhci1:
> > 112a0000.xhci1 supply vbus not found, using dummy regulator
> > [    3.827146] <7>.(7)[1:swapper/0]xhci-mtk 112a0000.xhci1: Linked
> > as a consumer to regulator.0
> > [    3.828200] <7>.(7)[1:swapper/0]xhci-mtk 112a0000.xhci1:
> > 112a0000.xhci1 supply vusb33 not found, using dummy regulator
> > [    3.829751] <7>.(7)[1:swapper/0]xhci-mtk 112a0000.xhci1: xHCI
> > Host Controller
> > [    3.830648] <7>.(7)[1:swapper/0]xhci-mtk 112a0000.xhci1: new USB
> > bus registered, assigned bus number 1
> > [    3.831785] <3>-(3)[0:swapper/3]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.832035] <7>.(7)[1:swapper/0]xhci-mtk 112a0000.xhci1: hcc
> > params 0x01400f99 hci version 0x110 quirks 0x0000000000210010
> > [    3.834130] <7>.(7)[1:swapper/0]xhci-mtk 112a0000.xhci1: irq
> > 465, io mem 0x112a0000
> > [    3.835624] <7>.(7)[1:swapper/0]hub 1-0:1.0: USB hub found
> > [    3.836320] <7>.(7)[1:swapper/0]hub 1-0:1.0: 1 port detected
> > [    3.837232] <7>.(7)[1:swapper/0]probe of 1-0:1.0 returned 1
> > after 1614 usecs
> > [    3.838286] <7>.(7)[1:swapper/0]probe of usb1 returned 1 after
> > 2866 usecs
> > [    3.839309] <7>.(7)[1:swapper/0]xhci-mtk 112a0000.xhci1: xHCI
> > Host Controller
> > [    3.840201] <7>.(7)[1:swapper/0]xhci-mtk 112a0000.xhci1: new USB
> > bus registered, assigned bus number 2
> > [    3.841363] <7>.(7)[1:swapper/0]xhci-mtk 112a0000.xhci1: Host
> > supports USB 3.0 SuperSpeed
> > [    3.842396] <7>.(7)[1:swapper/0]usb usb2: We don't know the
> > algorithms for LPM for this host, disabling LPM.
> > [    3.844018] <7>.(7)[1:swapper/0]hub 2-0:1.0: USB hub found
> > [    3.844709] <7>.(7)[1:swapper/0]hub 2-0:1.0: config failed, hub
> > doesn't have any ports! (err -19)
> > [    3.845823] <7>.(7)[1:swapper/0]probe of 2-0:1.0 returned 0
> > after 1808 usecs
> > [    3.846878] <7>.(7)[1:swapper/0]probe of usb2 returned 1 after
> > 3043 usecs
> > [    3.847915]
> > <7>.(7)[1:swapper/0]BOOTPROF:      3847.913931:probe:
> > probe=platform_drv_probe drv=xhci-
> > mtk(0xffffff800960b2d8)    22.114539ms
> > [    3.848450] <4>-(4)[0:swapper/4]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.849467] <7>.(7)[1:swapper/0]probe of 112a0000.xhci1 returned
> > 1 after 23680 usecs
> > [    3.851372]
> > <7>.(7)[1:swapper/0]BOOTPROF:      3851.370931:initcall:
> > xhci_mtk_init    26.677616ms
> > [    3.852477] <7>.(7)[1:swapper/0]initcall xhci_mtk_init+0x0/0x34
> > returned 0 after 27133 usecs
> > [    3.853528]
> > <7>.(7)[1:swapper/0]calling  usb_storage_driver_init+0x0/0x40 @ 1
> > [    3.854442] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver usb-storage
> > [    3.855412] <7>.(7)[1:swapper/0]initcall
> > usb_storage_driver_init+0x0/0x40 returned 0 after 970 usecs
> > [    3.856549]
> > <7>.(7)[1:swapper/0]calling  alauda_driver_init+0x0/0x40 @ 1
> > [    3.857396] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver ums-alauda
> > [    3.858350] <7>.(7)[1:swapper/0]initcall
> > alauda_driver_init+0x0/0x40 returned 0 after 942 usecs
> > [    3.859437]
> > <7>.(7)[1:swapper/0]calling  cypress_driver_init+0x0/0x40 @ 1
> > [    3.860290] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver ums-cypress
> > [    3.861254] <7>.(7)[1:swapper/0]initcall
> > cypress_driver_init+0x0/0x40 returned 0 after 948 usecs
> > [    3.862348]
> > <7>.(7)[1:swapper/0]calling  datafab_driver_init+0x0/0x40 @ 1
> > [    3.863205] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver ums-datafab
> > [    3.864171] <7>.(7)[1:swapper/0]initcall
> > datafab_driver_init+0x0/0x40 returned 0 after 950 usecs
> > [    3.865116] <5>-(5)[0:swapper/5]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.865265]
> > <7>.(7)[1:swapper/0]calling  freecom_driver_init+0x0/0x40 @ 1
> > [    3.867052] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver ums-freecom
> > [    3.868018] <7>.(7)[1:swapper/0]initcall
> > freecom_driver_init+0x0/0x40 returned 0 after 954 usecs
> > [    3.869113]
> > <7>.(7)[1:swapper/0]calling  isd200_driver_init+0x0/0x40 @ 1
> > [    3.869956] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver ums-isd200
> > [    3.870911] <7>.(7)[1:swapper/0]initcall
> > isd200_driver_init+0x0/0x40 returned 0 after 939 usecs
> > [    3.871999]
> > <7>.(7)[1:swapper/0]calling  jumpshot_driver_init+0x0/0x40 @ 1
> > [    3.872860] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver ums-jumpshot
> > [    3.873836] <7>.(7)[1:swapper/0]initcall
> > jumpshot_driver_init+0x0/0x40 returned 0 after 958 usecs
> > [    3.874941]
> > <7>.(7)[1:swapper/0]calling  karma_driver_init+0x0/0x40 @ 1
> > [    3.875775] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver ums-karma
> > [    3.876720] <7>.(7)[1:swapper/0]initcall
> > karma_driver_init+0x0/0x40 returned 0 after 927 usecs
> > [    3.877793]
> > <7>.(7)[1:swapper/0]calling  onetouch_driver_init+0x0/0x40 @ 1
> > [    3.878655] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver ums-onetouch
> > [    3.879634] <7>.(7)[1:swapper/0]initcall
> > onetouch_driver_init+0x0/0x40 returned 0 after 961 usecs
> > [    3.880739]
> > <7>.(7)[1:swapper/0]calling  sddr09_driver_init+0x0/0x40 @ 1
> > [    3.881579] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver ums-sddr09
> > [    3.881784] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.882534] <7>.(7)[1:swapper/0]initcall
> > sddr09_driver_init+0x0/0x40 returned 0 after 936 usecs
> > [    3.884552]
> > <7>.(7)[1:swapper/0]calling  sddr55_driver_init+0x0/0x40 @ 1
> > [    3.885393] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver ums-sddr55
> > [    3.886347] <7>.(7)[1:swapper/0]initcall
> > sddr55_driver_init+0x0/0x40 returned 0 after 937 usecs
> > [    3.887434]
> > <7>.(7)[1:swapper/0]calling  usbat_driver_init+0x0/0x40 @ 1
> > [    3.888266] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver ums-usbat
> > [    3.889209] <7>.(7)[1:swapper/0]initcall
> > usbat_driver_init+0x0/0x40 returned 0 after 927 usecs
> > [    3.890282] <7>.(7)[1:swapper/0]calling  tv_driver_init+0x0/0x28
> > @ 1
> > [    3.891084] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver trancevibrator
> > [    3.892081] <7>.(7)[1:swapper/0]initcall tv_driver_init+0x0/0x28
> > returned 0 after 979 usecs
> > [    3.893122]
> > <7>.(7)[1:swapper/0]calling  gadget_cfs_init+0x0/0x60 @ 1
> > [    3.893943] <7>.(7)[1:swapper/0]initcall
> > gadget_cfs_init+0x0/0x60 returned 0 after 17 usecs
> > [    3.894984] <7>.(7)[1:swapper/0]calling  acmmod_init+0x0/0x1c @
> > 1
> > [    3.895749] <7>.(7)[1:swapper/0]usb_function_register name=acm
> > [    3.896477] <7>.(7)[1:swapper/0]initcall acmmod_init+0x0/0x1c
> > returned 0 after 711 usecs
> > [    3.897488] <7>.(7)[1:swapper/0]calling  userial_init+0x0/0x1d0
> > @ 1
> > [    3.898276] <7>.(7)[1:swapper/0]initcall userial_init+0x0/0x1d0
> > returned 0 after 6 usecs
> > [    3.899285] <7>-(7)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.900221] <7>.(7)[1:swapper/0]calling  gsermod_init+0x0/0x1c @
> > 1
> > [    3.900992] <7>.(7)[1:swapper/0]usb_function_register name=gser
> > [    3.901731] <7>.(7)[1:swapper/0]initcall gsermod_init+0x0/0x1c
> > returned 0 after 721 usecs
> > [    3.902750] <7>.(7)[1:swapper/0]calling  gether_init+0x0/0xfc @
> > 1
> > [    3.903644] <7>.(7)[1:swapper/0]initcall gether_init+0x0/0xfc
> > returned 0 after 126 usecs
> > [    3.904652] <7>.(7)[1:swapper/0]calling  rndismod_init+0x0/0x1c
> > @ 1
> > [    3.905432] <7>.(7)[1:swapper/0]usb_function_register name=rndis
> > [    3.906182] <7>.(7)[1:swapper/0]initcall rndismod_init+0x0/0x1c
> > returned 0 after 731 usecs
> > [    3.907217]
> > <7>.(7)[1:swapper/0]calling  mass_storagemod_init+0x0/0x1c @ 1
> > [    3.908074] <7>.(7)[1:swapper/0]usb_function_register
> > name=mass_storage
> > [    3.908899] <7>.(7)[1:swapper/0]initcall
> > mass_storagemod_init+0x0/0x1c returned 0 after 805 usecs
> > [    3.910005] <7>.(7)[1:swapper/0]calling  ffsmod_init+0x0/0x1c @
> > 1
> > [    3.910765] <7>.(7)[1:swapper/0]usb_function_register name=ffs
> > [    3.911495] <7>.(7)[1:swapper/0]initcall ffsmod_init+0x0/0x1c
> > returned 0 after 712 usecs
> > [    3.912504] <7>.(7)[1:swapper/0]calling  midimod_init+0x0/0x1c @
> > 1
> > [    3.913275] <7>.(7)[1:swapper/0]usb_function_register name=midi
> > [    3.914013] <7>.(7)[1:swapper/0]initcall midimod_init+0x0/0x1c
> > returned 0 after 720 usecs
> > [    3.915031] <7>.(7)[1:swapper/0]calling  hidmod_init+0x0/0x1c @
> > 1
> > [    3.915123] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.915795] <7>.(7)[1:swapper/0]usb_function_register name=hid
> > [    3.917454] <7>.(7)[1:swapper/0]initcall hidmod_init+0x0/0x1c
> > returned 0 after 1620 usecs
> > [    3.918472]
> > <7>.(7)[1:swapper/0]calling  accessorymod_init+0x0/0x1c @ 1
> > [    3.919299] <7>.(7)[1:swapper/0]usb_function_register
> > name=accessory
> > [    3.920092] <7>.(7)[1:swapper/0]initcall
> > accessorymod_init+0x0/0x1c returned 0 after 772 usecs
> > [    3.921164]
> > <7>.(7)[1:swapper/0]calling  audio_sourcemod_init+0x0/0x1c @ 1
> > [    3.922021] <7>.(7)[1:swapper/0]usb_function_register
> > name=audio_source
> > [    3.922846] <7>.(7)[1:swapper/0]initcall
> > audio_sourcemod_init+0x0/0x1c returned 0 after 805 usecs
> > [    3.923953] <7>.(7)[1:swapper/0]calling  mtpmod_init+0x0/0x1c @
> > 1
> > [    3.924713] <7>.(7)[1:swapper/0]usb_function_register name=mtp
> > [    3.925442] <7>.(7)[1:swapper/0]initcall mtpmod_init+0x0/0x1c
> > returned 0 after 710 usecs
> > [    3.926450] <7>.(7)[1:swapper/0]calling  ptpmod_init+0x0/0x1c @
> > 1
> > [    3.927212] <7>.(7)[1:swapper/0]usb_function_register name=ptp
> > [    3.927940] <7>.(7)[1:swapper/0]initcall ptpmod_init+0x0/0x1c
> > returned 0 after 710 usecs
> > [    3.928948]
> > <7>.(7)[1:swapper/0]calling  input_leds_init+0x0/0x1c @ 1
> > [    3.929753] <7>.(7)[1:swapper/0]initcall
> > input_leds_init+0x0/0x1c returned 0 after 2 usecs
> > [    3.930782] <7>.(7)[1:swapper/0]calling  evdev_init+0x0/0x1c @ 1
> > [    3.931534] <7>.(7)[1:swapper/0]initcall evdev_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    3.931787] <1>-(1)[0:swapper/1]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.932513]
> > <7>.(7)[1:swapper/0]calling  pmic_keys_pdrv_init+0x0/0x20 @ 1
> > [    3.934744] <7>.(7)[1:swapper/0]input: mtk-pmic-keys as
> > /devices/platform/10024000.pwrap/10024000.pwrap:mt6359/mtk-pmic-
> > keys/input/input0
> > [    3.936487] <7>.(7)[1:swapper/0]probe of mtk-pmic-keys returned
> > 1 after 2033 usecs
> > [    3.937437] <7>.(7)[1:swapper/0]initcall
> > pmic_keys_pdrv_init+0x0/0x20 returned 0 after 3073 usecs
> > [    3.938542]
> > <7>.(7)[1:swapper/0]calling  xpad_driver_init+0x0/0x28 @ 1
> > [    3.939383] <7>.(7)[1:swapper/0]usbcore: registered new
> > interface driver xpad
> > [    3.940274] <7>.(7)[1:swapper/0]initcall
> > xpad_driver_init+0x0/0x28 returned 0 after 886 usecs
> > [    3.941336]
> > <7>.(7)[1:swapper/0]calling  uinput_misc_init+0x0/0x1c @ 1
> > [    3.942332] <7>.(7)[1:swapper/0]initcall
> > uinput_misc_init+0x0/0x1c returned 0 after 176 usecs
> > [    3.943400]
> > <7>.(7)[1:swapper/0]calling  mtk_i2c_driver_init+0x0/0x20 @ 1
> > [    3.944836] <7>.(7)[1:swapper/0]i2c 6-0034: Linked as a consumer
> > to 10005000.pinctrl
> > [    3.948451] <5>-(5)[0:swapper/5]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.951508] <7>-(7)[1:swapper/0]Perf order domain is not ready!
> > [    3.951715] <7>.(7)[1:swapper/0]probe of 6-001a returned 1 after
> > 11 usecs
> > [    3.953470] <7>.(7)[1:swapper/0]probe of 6-0064 returned 1 after
> > 5 usecs
> > [    3.954845] <7>.(7)[1:swapper/0]platform odm:extcon_usb: Linked
> > as a consumer to mt6360_chg.2.auto
> > [    3.955992] <7>.(7)[1:swapper/0]platform mt6360_chg.2.auto:
> > Linked as a consumer to usb-phy0
> > [    3.957577] <7>.(7)[1:swapper/0]mt6360_regulator
> > mt6360_pmic.4.auto: DMA mask not set
> > [    3.965119] <3>-(3)[0:swapper/3]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.981783] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    3.998452] <1>-(1)[0:swapper/1]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.003505] <7>.(7)[1:swapper/0]mt6360_regulator
> > mt6360_pmic.4.auto: Successfully probed
> > [    4.004521]
> > <7>.(7)[1:swapper/0]BOOTPROF:      4004.520470:probe:
> > probe=platform_drv_probe
> > drv=mt6360_regulator(0xffffff80095be858)    45.958230ms
> > [    4.006161] <7>.(7)[1:swapper/0]probe of mt6360_pmic.4.auto
> > returned 1 after 48590 usecs
> > [    4.007433] <7>.(7)[1:swapper/0]mt6360_regulator
> > mt6360_ldo.5.auto: DMA mask not set
> > [    4.015117] <5>-(5)[0:swapper/5]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.031784] <7>-(7)[0:swapper/7]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.037204] <4>.(4)[1:swapper/0]mt6360_regulator
> > mt6360_ldo.5.auto: Successfully probed
> > [    4.038205]
> > <4>.(4)[1:swapper/0]BOOTPROF:      4038.204239:probe:
> > probe=platform_drv_probe
> > drv=mt6360_regulator(0xffffff80095be858)    29.799231ms
> > [    4.039849] <4>.(4)[1:swapper/0]probe of mt6360_ldo.5.auto
> > returned 1 after 32419 usecs
> > [    4.041198] <4>.(4)[1:swapper/0]mt6360_pmu 6-0034: Successfully
> > probed
> > [    4.042018]
> > <4>.(4)[1:swapper/0]BOOTPROF:      4042.017470:probe:
> > probe=i2c_device_probe
> > drv=mt6360_pmu(0xffffff80095fba68)    96.130923ms
> > [    4.043571] <4>.(4)[1:swapper/0]mt6360_pmu 6-0034: Dropping the
> > link to usb-phy0
> > [    4.044502] <4>.(4)[1:swapper/0]probe of 6-0034 returned 1 after
> > 98658 usecs
> > [    4.045545] <4>.(4)[1:swapper/0]i2c 6-004e: Linked as a consumer
> > to 6-0034
> > [    4.046433]
> > <4>.(4)[1:swapper/0]BOOTPROF:      4046.432470:probe:
> > probe=platform_drv_probe drv=i2c-
> > mt65xx(0xffffff8009618770)   102.075769ms
> > [    4.048007] <4>.(4)[1:swapper/0]i2c-mt65xx 11d01000.i2c:
> > Dropping the link to usb-phy0
> > [    4.048449] <7>-(7)[0:swapper/7]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.048997] <4>.(4)[1:swapper/0]probe of 11d01000.i2c returned 1
> > after 104690 usecs
> > [    4.051420] <4>.(4)[1:swapper/0]i2c 0-001a: Linked as a consumer
> > to 10005000.pinctrl
> > [    4.052394] <4>.(4)[1:swapper/0]i2c 0-001a: Linked as a consumer
> > to mt6359-regulator
> > [    4.053360] <4>.(4)[1:swapper/0]i2c 0-001a: Linked as a consumer
> > to 10000000.syscon
> > [    4.054682] <4>.(4)[1:swapper/0]i2c-mt65xx 11e00000.i2c:
> > Dropping the link to 10000000.syscon
> > [    4.055750] <4>.(4)[1:swapper/0]i2c-mt65xx 11e00000.i2c:
> > Dropping the link to mt6359-regulator
> > [    4.056827] <4>.(4)[1:swapper/0]probe of 11e00000.i2c returned 1
> > after 5943 usecs
> > [    4.058188] <4>.(4)[1:swapper/0]i2c 1-0010: Linked as a consumer
> > to 10005000.pinctrl
> > [    4.059175] <4>.(4)[1:swapper/0]i2c 1-0010: Linked as a consumer
> > to mt6359-regulator
> > [    4.060140] <4>.(4)[1:swapper/0]i2c 1-0010: Linked as a consumer
> > to 10000000.syscon
> > [    4.061280] <4>.(4)[1:swapper/0]i2c-mt65xx 11e01000.i2c:
> > Dropping the link to 10000000.syscon
> > [    4.062342] <4>.(4)[1:swapper/0]i2c-mt65xx 11e01000.i2c:
> > Dropping the link to mt6359-regulator
> > [    4.063431] <4>.(4)[1:swapper/0]probe of 11e01000.i2c returned 1
> > after 5670 usecs
> > [    4.064794] <4>.(4)[1:swapper/0][KE/NT50358A] name=nt50358a
> > addr=0x3e
> > [    4.065124] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.065603] <4>.(4)[1:swapper/0]probe of 2-003e returned 1 after
> > 818 usecs
> > [    4.067401] <4>.(4)[1:swapper/0]probe of 11e02000.i2c returned 1
> > after 3036 usecs
> > [    4.068740] <4>.(4)[1:swapper/0]i2c 3-002c: Linked as a consumer
> > to odm:audio_power
> > [    4.069720] <4>.(4)[1:swapper/0]i2c 3-002c: Linked as a consumer
> > to 10006000.syscon:power-controller
> > [    4.070858] <4>.(4)[1:swapper/0]i2c 3-002c: Linked as a consumer
> > to 10890000.syscon:audio-controller
> > [    4.072170] <4>.(4)[1:swapper/0]i2c 3-004d: Linked as a consumer
> > to odm:audio_power
> > [    4.073126] <4>.(4)[1:swapper/0]i2c 3-004d: Linked as a consumer
> > to 10006000.syscon:power-controller
> > [    4.074263] <4>.(4)[1:swapper/0]i2c 3-004d: Linked as a consumer
> > to 10890000.syscon:audio-controller
> > [    4.075414] <4>.(4)[1:swapper/0]i2c-mt65xx 11e03000.i2c:
> > Dropping the link to 10006000.syscon:power-controller
> > [    4.076658] <4>.(4)[1:swapper/0]i2c-mt65xx 11e03000.i2c:
> > Dropping the link to odm:audio_power
> > [    4.077720] <4>.(4)[1:swapper/0]i2c-mt65xx 11e03000.i2c:
> > Dropping the link to 10890000.syscon:audio-controller
> > [    4.078969] <4>.(4)[1:swapper/0]probe of 11e03000.i2c returned 1
> > after 10633 usecs
> > [    4.080197] <4>.(4)[1:swapper/0]platform 11021000.ethernet:
> > Linked as a consumer to 4-0022
> > [    4.081278] <4>.(4)[1:swapper/0]platform odm:fusb304: Linked as
> > a consumer to 4-0022
> > [    4.081785] <1>-(1)[0:swapper/1]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.082257] <4>.(4)[1:swapper/0]i2c 0-001a: Linked as a consumer
> > to 4-0022
> > [    4.084066] <4>.(4)[1:swapper/0]i2c 1-0010: Linked as a consumer
> > to 4-0022
> > [    4.084957] <4>.(4)[1:swapper/0]i2c 4-0022: Linked as a consumer
> > to 10005000.pinctrl
> > [    4.085969] <4>.(4)[1:swapper/0]pca953x 4-0022: GPIO lookup for
> > consumer reset
> > [    4.086868] <4>.(4)[1:swapper/0]pca953x 4-0022: using device
> > tree for GPIO lookup
> > [    4.087816] <4>.(4)[1:swapper/0]of_get_named_gpiod_flags: parsed
> > 'reset-gpios' property of node '/i2c@11e04000/gpio-pcal6534@22[0]'
> > - status (0)
> > [    4.089435] <4>.(4)[1:swapper/0]gpio gpiochip0: Persistence not
> > supported for GPIO 4
> > [    4.090420] <4>.(4)[1:swapper/0]pca953x 4-0022: 4-0022 supply
> > vcc not found, using dummy regulator
> > [    4.091572] <4>.(4)[1:swapper/0]pca953x 4-0022: Linked as a
> > consumer to regulator.0
> > [    4.094848] <4>-(4)[1:swapper/0]gpiochip_find_base: found new
> > base at 313
> > [    4.095794] <4>.(4)[1:swapper/0]gpio gpiochip1: (pcal6534):
> > added GPIO chardev (254:1)
> > [    4.096874] <4>.(4)[1:swapper/0]gpiochip_setup_dev: registered
> > GPIOs 313 to 346 on device: gpiochip1 (pcal6534)
> > [    4.098450] <4>-(4)[0:swapper/4]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.099456] <4>-(4)[1:swapper/0]Perf order domain is not ready!
> > [    4.099476] <4>.(4)[1:swapper/0]probe of 4-0022 returned 1 after
> > 13547 usecs
> > [    4.101156] <4>.(4)[1:swapper/0]platform odm:mt8570_sound:
> > Linked as a consumer to 4-0023
> > [    4.102178] <4>.(4)[1:swapper/0]platform odm:consys7921: Linked
> > as a consumer to 4-0023
> > [    4.103188] <4>.(4)[1:swapper/0]platform hifi4dsp_8570: Linked
> > as a consumer to 4-0023
> > [    4.104183] <4>.(4)[1:swapper/0]i2c 3-002c: Linked as a consumer
> > to 4-0023
> > [    4.105047] <4>.(4)[1:swapper/0]i2c 3-004d: Linked as a consumer
> > to 4-0023
> > [    4.105908] <4>.(4)[1:swapper/0]i2c 4-0023: Linked as a consumer
> > to 10005000.pinctrl
> > [    4.106911] <4>.(4)[1:swapper/0]pca953x 4-0023: GPIO lookup for
> > consumer reset
> > [    4.107817] <4>.(4)[1:swapper/0]pca953x 4-0023: using device
> > tree for GPIO lookup
> > [    4.108755] <4>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'reset-gpios' property of node '/i2c@11e04000
> > /gpio-pcal6534@23[0]'
> > [    4.110282] <4>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'reset-gpio' property of node '/i2c@11e04000/gpio-pcal6534@23
> > [0]'
> > [    4.111800] <4>.(4)[1:swapper/0]pca953x 4-0023: using lookup
> > tables for GPIO lookup
> > [    4.112754] <4>.(4)[1:swapper/0]pca953x 4-0023: No GPIO consumer
> > reset found
> > [    4.113641] <4>.(4)[1:swapper/0]pca953x 4-0023: 4-0023 supply
> > vcc not found, using dummy regulator
> > [    4.114773] <4>.(4)[1:swapper/0]pca953x 4-0023: Linked as a
> > consumer to regulator.0
> > [    4.115117] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.118048] <6>-(6)[1:swapper/0]gpiochip_find_base: found new
> > base at 279
> > [    4.118922] <6>.(6)[1:swapper/0]gpio gpiochip2: (pcal6534):
> > added GPIO chardev (254:2)
> > [    4.119933] <6>.(6)[1:swapper/0]gpiochip_setup_dev: registered
> > GPIOs 279 to 312 on device: gpiochip2 (pcal6534)
> > [    4.122058] <4>-(4)[1:swapper/0]Perf order domain is not ready!
> > [    4.122077]
> > <4>.(4)[1:swapper/0]BOOTPROF:      4122.075855:probe:
> > probe=i2c_device_probe
> > drv=pca953x(0xffffff80095aa418)    15.168154ms
> > [    4.124342] <4>.(4)[1:swapper/0]probe of 4-0023 returned 1 after
> > 17463 usecs
> > [    4.125240] <4>.(4)[1:swapper/0]i2c 4-0020: Linked as a consumer
> > to 10005000.pinctrl
> > [    4.126241] <4>.(4)[1:swapper/0]pca953x 4-0020: GPIO lookup for
> > consumer reset
> > [    4.127147] <4>.(4)[1:swapper/0]pca953x 4-0020: using device
> > tree for GPIO lookup
> > [    4.128081] <4>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'reset-gpios' property of node '/i2c@11e04000
> > /gpio-pcal6534@20[0]'
> > [    4.129607] <4>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'reset-gpio' property of node '/i2c@11e04000/gpio-pcal6534@20
> > [0]'
> > [    4.131123] <4>.(4)[1:swapper/0]pca953x 4-0020: using lookup
> > tables for GPIO lookup
> > [    4.131789] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.132080] <4>.(4)[1:swapper/0]pca953x 4-0020: No GPIO consumer
> > reset found
> > [    4.133898] <4>.(4)[1:swapper/0]pca953x 4-0020: 4-0020 supply
> > vcc not found, using dummy regulator
> > [    4.135026] <4>.(4)[1:swapper/0]pca953x 4-0020: Linked as a
> > consumer to regulator.0
> > [    4.138303] <4>-(4)[1:swapper/0]gpiochip_find_base: found new
> > base at 245
> > [    4.139173] <4>.(4)[1:swapper/0]gpio gpiochip3: (pcal6534):
> > added GPIO chardev (254:3)
> > [    4.140170] <4>.(4)[1:swapper/0]gpiochip_setup_dev: registered
> > GPIOs 245 to 278 on device: gpiochip3 (pcal6534)
> > [    4.142287] <5>-(5)[1:swapper/0]Perf order domain is not ready!
> > [    4.142304]
> > <5>.(5)[1:swapper/0]BOOTPROF:      4142.303470:probe:
> > probe=i2c_device_probe
> > drv=pca953x(0xffffff80095aa418)    16.064769ms
> > [    4.144584] <5>.(5)[1:swapper/0]probe of 4-0020 returned 1 after
> > 18371 usecs
> > [    4.145468]
> > <5>.(5)[1:swapper/0]BOOTPROF:      4145.467547:probe:
> > probe=platform_drv_probe drv=i2c-
> > mt65xx(0xffffff8009618770)    65.505000ms
> > [    4.147039] <5>.(5)[1:swapper/0]probe of 11e04000.i2c returned 1
> > after 67121 usecs
> > [    4.148278]
> > <5>.(5)[1:swapper/0]BOOTPROF:      4148.277855:initcall:
> > mtk_i2c_driver_init   204.026616ms
> > [    4.149449] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.150384] <5>.(5)[1:swapper/0]initcall
> > mtk_i2c_driver_init+0x0/0x20 returned 0 after 201305 usecs
> > [    4.151517]
> > <5>.(5)[1:swapper/0]calling  mtk_vcu_driver_init+0x0/0x20 @ 1
> > [    4.152517] <5>.(5)[1:swapper/0]probe of 18000000.vcu returned
> > -517 after 0 usecs
> > [    4.153547] <5>.(5)[1:swapper/0]initcall
> > mtk_vcu_driver_init+0x0/0x20 returned 0 after 1154 usecs
> > [    4.154651]
> > <5>.(5)[1:swapper/0]calling  mtk_vcodec_dec_driver_init+0x0/0x20 @
> > 1
> > [    4.155728] <5>.(5)[1:swapper/0]probe of 18000000.vdec returned
> > -517 after 0 usecs
> > [    4.156781] <5>.(5)[1:swapper/0]initcall
> > mtk_vcodec_dec_driver_init+0x0/0x20 returned 0 after 1173 usecs
> > [    4.157962]
> > <5>.(5)[1:swapper/0]calling  mtk_vdec_larb_driver_init+0x0/0x20 @ 1
> > [    4.158954] <5>.(5)[1:swapper/0]probe of vdec_l21 returned -517
> > after 0 usecs
> > [    4.159849] <5>.(5)[1:swapper/0]probe of vdec_l22 returned -517
> > after 0 usecs
> > [    4.160739] <5>.(5)[1:swapper/0]probe of vdec_l23 returned -517
> > after 0 usecs
> > [    4.161629] <5>.(5)[1:swapper/0]probe of vdec_l24 returned -517
> > after 0 usecs
> > [    4.162532] <5>.(5)[1:swapper/0]initcall
> > mtk_vdec_larb_driver_init+0x0/0x20 returned 0 after 3572 usecs
> > [    4.163706]
> > <5>.(5)[1:swapper/0]calling  mtk_vcodec_enc_driver_init+0x0/0x20 @
> > 1
> > [    4.164783] <5>.(5)[1:swapper/0]probe of 1a020000.venc returned
> > -517 after 0 usecs
> > [    4.165122] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.165804] <5>.(5)[1:swapper/0]initcall
> > mtk_vcodec_enc_driver_init+0x0/0x20 returned 0 after 1147 usecs
> > [    4.167847]
> > <5>.(5)[1:swapper/0]calling  mtk_venc_larb_driver_init+0x0/0x20 @ 1
> > [    4.168836] <5>.(5)[1:swapper/0]probe of venc_l19 returned -517
> > after 0 usecs
> > [    4.169727] <5>.(5)[1:swapper/0]probe of venc_l20 returned -517
> > after 0 usecs
> > [    4.170630] <5>.(5)[1:swapper/0]initcall
> > mtk_venc_larb_driver_init+0x0/0x20 returned 0 after 1827 usecs
> > [    4.171805]
> > <5>.(5)[1:swapper/0]calling  mtk_jpeg_driver_init+0x0/0x20 @ 1
> > [    4.172765] <5>.(5)[1:swapper/0]probe of 1a030000.jpgenc
> > returned -517 after 0 usecs
> > [    4.173730] <5>.(5)[1:swapper/0]probe of 1a040000.jpgdec
> > returned -517 after 0 usecs
> > [    4.174696] <5>.(5)[1:swapper/0]probe of 1a050000.jpgdec
> > returned -517 after 0 usecs
> > [    4.175668] <5>.(5)[1:swapper/0]probe of 1b030000.jpgenc
> > returned -517 after 0 usecs
> > [    4.176634] <5>.(5)[1:swapper/0]probe of 1b040000.jpgdec
> > returned -517 after 0 usecs
> > [    4.177651] <5>.(5)[1:swapper/0]initcall
> > mtk_jpeg_driver_init+0x0/0x20 returned 0 after 4870 usecs
> > [    4.178767]
> > <5>.(5)[1:swapper/0]calling  mtk_hcp_driver_init+0x0/0x20 @ 1
> > [    4.179676] <5>.(5)[1:swapper/0]probe of hcp@0 returned -517
> > after 0 usecs
> > [    4.180551] <5>.(5)[1:swapper/0]initcall
> > mtk_hcp_driver_init+0x0/0x20 returned 0 after 910 usecs
> > [    4.181646]
> > <5>.(5)[1:swapper/0]calling  mtk_imgsys_driver_init+0x0/0x20 @ 1
> > [    4.182526] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.183500] <5>.(5)[1:swapper/0]probe of 15000000.imgsys_fw
> > returned -517 after 0 usecs
> > [    4.184542] <5>.(5)[1:swapper/0]initcall
> > mtk_imgsys_driver_init+0x0/0x20 returned 0 after 1052 usecs
> > [    4.185680]
> > <5>.(5)[1:swapper/0]calling  mtk_imgsys_me_driver_init+0x0/0x20 @ 1
> > [    4.186628] <5>.(5)[1:swapper/0]probe of 15320000.ipesys_me
> > returned -517 after 0 usecs
> > [    4.187666] <5>.(5)[1:swapper/0]initcall
> > mtk_imgsys_me_driver_init+0x0/0x20 returned 0 after 1049 usecs
> > [    4.188837] <5>.(5)[1:swapper/0]calling  mtk_cam_init+0x0/0x20 @
> > 1
> > [    4.189705] <5>.(5)[1:swapper/0]mtk-cam 16000000.camisp:
> > mtk_cam_probe
> > [    4.190661] <5>.(5)[1:swapper/0]probe of camisp_l13 returned
> > -517 after 0 usecs
> > [    4.191581] <5>.(5)[1:swapper/0]probe of camisp_l14 returned
> > -517 after 0 usecs
> > [    4.192899] <5>.(5)[1:swapper/0]seninf
> > 16007000.seninf_top:seninf_csi_port_0: ctx->port = 0
> > [    4.193941] <5>.(5)[1:swapper/0]seninf
> > 16007000.seninf_top:seninf_csi_port_0: read csi efuse returned with
> > error cell -1
> > [    4.195298] <5>.(5)[1:swapper/0]seninf
> > 16007000.seninf_top:seninf_csi_port_0: Failed to read efuse data
> > [    4.196482] <5>.(5)[1:swapper/0]seninf
> > 16007000.seninf_top:seninf_csi_port_0: seninf_probe: port=0
> > [    4.197604] <5>.(5)[1:swapper/0]probe of
> > 16007000.seninf_top:seninf_csi_port_0 returned 1 after 4720 usecs
> > [    4.198450] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.198922] <5>.(5)[1:swapper/0]seninf
> > 16007000.seninf_top:seninf_csi_port_1: ctx->port = 1
> > [    4.200779] <5>.(5)[1:swapper/0]seninf
> > 16007000.seninf_top:seninf_csi_port_1: read csi efuse returned with
> > error cell -1
> > [    4.202130] <5>.(5)[1:swapper/0]seninf
> > 16007000.seninf_top:seninf_csi_port_1: Failed to read efuse data
> > [    4.203312] <5>.(5)[1:swapper/0]seninf
> > 16007000.seninf_top:seninf_csi_port_1: seninf_probe: port=1
> > [    4.204433] <5>.(5)[1:swapper/0]probe of
> > 16007000.seninf_top:seninf_csi_port_1 returned 1 after 5522 usecs
> > [    4.205798] <5>.(5)[1:swapper/0]seninf-core 16007000.seninf_top:
> > Linked as a consumer to regulator.3
> > [    4.206938] <5>.(5)[1:swapper/0]seninf-core 16007000.seninf_top:
> > dfs[0] freq 273000000 volt 550000
> > [    4.208058] <5>.(5)[1:swapper/0]seninf-core 16007000.seninf_top:
> > dfs[1] freq 392000000 volt 600000
> > [    4.209173] <5>.(5)[1:swapper/0]seninf-core 16007000.seninf_top:
> > dfs[2] freq 416000000 volt 650000
> > [    4.210287] <5>.(5)[1:swapper/0]seninf-core 16007000.seninf_top:
> > dfs[3] freq 499000000 volt 750000
> > [    4.211472] <5>.(5)[1:swapper/0]seninf-core 16007000.seninf_top:
> > seninf_core_probe
> > [    4.212438]
> > <5>.(5)[1:swapper/0]BOOTPROF:      4212.437240:probe:
> > probe=platform_drv_probe drv=seninf-
> > core(0xffffff800962b528)    19.782000ms
> > [    4.214023] <5>.(5)[1:swapper/0]probe of 16007000.seninf_top
> > returned 1 after 21385 usecs
> > [    4.215117] <7>-(7)[0:swapper/7]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.215150] <5>.(5)[1:swapper/0]probe of 160b0000.camsv1
> > returned -517 after 0 usecs
> > [    4.217013] <5>.(5)[1:swapper/0]probe of 160b1000.camsv2
> > returned -517 after 0 usecs
> > [    4.217980] <5>.(5)[1:swapper/0]probe of 160b2000.camsv3
> > returned -517 after 0 usecs
> > [    4.218946] <5>.(5)[1:swapper/0]probe of 160b3000.camsv4
> > returned -517 after 0 usecs
> > [    4.219916] <5>.(5)[1:swapper/0]probe of 160b4000.camsv5
> > returned -517 after 0 usecs
> > [    4.220882] <5>.(5)[1:swapper/0]probe of 160b5000.camsv6
> > returned -517 after 0 usecs
> > [    4.221925] <5>.(5)[1:swapper/0]probe of 16030000.cam_raw_a
> > returned -517 after 0 usecs
> > [    4.222924] <5>.(5)[1:swapper/0]probe of 16070000.cam_raw_b
> > returned -517 after 0 usecs
> > [    4.224003] <5>.(5)[1:swapper/0]probe of 16050000.cam_yuv_a
> > returned -517 after 0 usecs
> > [    4.225002] <5>.(5)[1:swapper/0]probe of 16090000.cam_yuv_b
> > returned -517 after 0 usecs
> > [    4.226342] <5>.(5)[1:swapper/0]mtk-cam 16000000.camisp: #: raw
> > 2, yuv 2, larb 2, sv 6, seninf 2
> > [    4.227716]
> > <6>.(6)[1:swapper/0]BOOTPROF:      4227.714393:probe:
> > probe=platform_drv_probe drv=mtk-
> > cam(0xffffff800962adb8)    38.050846ms
> > [    4.229274] <6>.(6)[1:swapper/0]probe of 16000000.camisp
> > returned 1 after 39627 usecs
> > [    4.230311]
> > <6>.(6)[1:swapper/0]BOOTPROF:      4230.310086:initcall:
> > mtk_cam_init    40.699000ms
> > [    4.231417] <6>.(6)[1:swapper/0]initcall mtk_cam_init+0x0/0x20
> > returned 0 after 40828 usecs
> > [    4.231789] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.232463]
> > <6>.(6)[1:swapper/0]calling  camdbg_module_init+0x0/0x38 @ 1
> > [    4.234236] <6>.(6)[1:swapper/0]initcall
> > camdbg_module_init+0x0/0x38 returned 0 after 7 usecs
> > [    4.235302]
> > <6>.(6)[1:swapper/0]calling  mtk_aie_driver_init+0x0/0x20 @ 1
> > [    4.236191] <6>.(6)[1:swapper/0]probe of 15310000.aie returned
> > -517 after 0 usecs
> > [    4.237162] <6>.(6)[1:swapper/0]initcall
> > mtk_aie_driver_init+0x0/0x20 returned 0 after 989 usecs
> > [    4.238256] <6>.(6)[1:swapper/0]calling  uvc_init+0x0/0x58 @ 1
> > [    4.239034] <6>.(6)[1:swapper/0]usbcore: registered new
> > interface driver uvcvideo
> > [    4.239972] <6>.(6)[1:swapper/0]USB Video Class driver (1.1.1)
> > [    4.240701] <6>.(6)[1:swapper/0]initcall uvc_init+0x0/0x58
> > returned 0 after 1676 usecs
> > [    4.241688]
> > <6>.(6)[1:swapper/0]calling  syscon_reboot_mode_driver_init+0x0/0x2
> > 0 @ 1
> > [    4.242719] <6>.(6)[1:swapper/0]initcall
> > syscon_reboot_mode_driver_init+0x0/0x20 returned 0 after 62 usecs
> > [    4.243925]
> > <6>.(6)[1:swapper/0]calling  mtk_pd_adapter_init+0x0/0x20 @ 1
> > [    4.244841] <6>.(6)[1:swapper/0]initcall
> > mtk_pd_adapter_init+0x0/0x20 returned 0 after 67 usecs
> > [    4.245925]
> > <6>.(6)[1:swapper/0]calling  mtk_thermal_driver_init+0x0/0x20 @ 1
> > [    4.246967] <6>.(6)[1:swapper/0]initcall
> > mtk_thermal_driver_init+0x0/0x20 returned 0 after 149 usecs
> > [    4.248108]
> > <6>.(6)[1:swapper/0]calling  soc_temp_lvts_init+0x0/0x20 @ 1
> > [    4.248452] <1>-(1)[0:swapper/1]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.249052] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > [lvts_cal] This sample is not calibrated, fake !!
> > [    4.251169] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > [lvts_cal] golden_temp = 50
> > [    4.252224] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > [lvts_cal] num:g_count:g_count_rc 0:35000:2750 1:35000:2750
> > 2:35000:2750 3:35000:2750 4:35000:2750 5:35000:2750 6:35000:2750
> > 7:35000:2750 8:35000:2750 9:35000:2750 10:35000:2750 11:35000:2750
> > 12:35000:2750 13:35000:2750 14:35000:2750 15:35000:2750
> > 16:35000:2750
> > [    4.257431] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_polling_speed 0, LVTSMONCTL1_0= 0x10000c,LVTSMONCTL2_0= 0x10001
> > [    4.258913] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_hw_filter 0, LVTSMSRCTL0_0= 0x492
> > [    4.260076] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > lvts0: read all 2 sensors in 1120 us, one in 444 us
> > [    4.261404] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_polling_speed 1, LVTSMONCTL1_0= 0x10000c,LVTSMONCTL2_0= 0x10001
> > [    4.262886] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_hw_filter 1, LVTSMSRCTL0_0= 0x492
> > [    4.264047] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > lvts1: read all 2 sensors in 1120 us, one in 444 us
> > [    4.265119] <2>-(2)[0:swapper/2]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.265376] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_polling_speed 2, LVTSMONCTL1_0= 0x10000c,LVTSMONCTL2_0= 0x10001
> > [    4.267773] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_hw_filter 2, LVTSMSRCTL0_0= 0x492
> > [    4.268931] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > lvts2: read all 4 sensors in 2240 us, one in 444 us
> > [    4.270260] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_polling_speed 3, LVTSMONCTL1_0= 0x10000c,LVTSMONCTL2_0= 0x10001
> > [    4.271745] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_hw_filter 3, LVTSMSRCTL0_0= 0x492
> > [    4.272903] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > lvts3: read all 2 sensors in 1120 us, one in 444 us
> > [    4.274231] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_polling_speed 4, LVTSMONCTL1_0= 0x10000c,LVTSMONCTL2_0= 0x10001
> > [    4.275715] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_hw_filter 4, LVTSMSRCTL0_0= 0x492
> > [    4.276874] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > lvts4: read all 2 sensors in 1120 us, one in 444 us
> > [    4.278202] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_polling_speed 5, LVTSMONCTL1_0= 0x10000c,LVTSMONCTL2_0= 0x10001
> > [    4.279686] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_hw_filter 5, LVTSMSRCTL0_0= 0x492
> > [    4.280844] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > lvts5: read all 3 sensors in 1680 us, one in 444 us
> > [    4.281786] <3>-(3)[0:swapper/3]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.282173] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_polling_speed 6, LVTSMONCTL1_0= 0x10000c,LVTSMONCTL2_0= 0x10001
> > [    4.284572] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_hw_filter 6, LVTSMSRCTL0_0= 0x492
> > [    4.285730] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > lvts6: read all 2 sensors in 1120 us, one in 444 us
> > [    4.287041] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_tc_hw_reboot_threshold: LVTS0, the dominator sensing point= 1
> > [    4.288506] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_tc_hw_reboot_threshold: LVTS1, the dominator sensing point= 0
> > [    4.289968] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_tc_hw_reboot_threshold: LVTS2, the dominator sensing point= 0
> > [    4.291432] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_tc_hw_reboot_threshold: LVTS3, the dominator sensing point= 0
> > [    4.292894] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_tc_hw_reboot_threshold: LVTS4, the dominator sensing point= 1
> > [    4.294356] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_tc_hw_reboot_threshold: LVTS5, the dominator sensing point= 1
> > [    4.295820] <6>.(6)[1:swapper/0]mtk-soc-temp-lvts 1100b000.lvts:
> > set_tc_hw_reboot_threshold: LVTS6, the dominator sensing point= 0
> > [    4.297939]
> > <6>.(6)[1:swapper/0]BOOTPROF:      4297.938394:probe:
> > probe=platform_drv_probe drv=mtk-soc-temp-
> > lvts(0xffffff8009639a48)    48.948000ms
> > [    4.298451] <4>-(4)[0:swapper/4]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.299595] <6>.(6)[1:swapper/0]probe of 1100b000.lvts returned
> > 1 after 50622 usecs
> > [    4.301551]
> > <6>.(6)[1:swapper/0]BOOTPROF:      4301.550547:initcall:
> > soc_temp_lvts_init    52.605308ms
> > [    4.302710] <6>.(6)[1:swapper/0]initcall
> > soc_temp_lvts_init+0x0/0x20 returned 0 after 52505 usecs
> > [    4.303819]
> > <6>.(6)[1:swapper/0]calling  pmic_temp_driver_init+0x0/0x20 @ 1
> > [    4.304764] <6>.(6)[1:swapper/0]initcall
> > pmic_temp_driver_init+0x0/0x20 returned 0 after 75 usecs
> > [    4.305869]
> > <6>.(6)[1:swapper/0]calling  gadc_thermal_driver_init+0x0/0x20 @ 1
> > [    4.306831] <6>.(6)[1:swapper/0]initcall
> > gadc_thermal_driver_init+0x0/0x20 returned 0 after 60 usecs
> > [    4.307973]
> > <6>.(6)[1:swapper/0]calling  mtk_wdt_driver_init+0x0/0x20 @ 1
> > [    4.308846] <6>.(6)[1:swapper/0]watchdog0, mtk wdt stop, wdd-
> > >status=0
> > [    4.309711] <6>.(6)[1:swapper/0]mtk-wdt 10007000.watchdog:
> > Watchdog enabled (timeout=31 sec, nowayout=0)
> > [    4.310899] <6>.(6)[1:swapper/0]probe of 10007000.watchdog
> > returned 1 after 2067 usecs
> > [    4.311957] <6>.(6)[1:swapper/0]initcall
> > mtk_wdt_driver_init+0x0/0x20 returned 0 after 3063 usecs
> > [    4.313060] <6>.(6)[1:swapper/0]calling  dm_init+0x0/0x70 @ 1
> > [    4.313853] <6>.(6)[1:swapper/0]device-mapper: uevent: version
> > 1.0.3
> > [    4.314704] <6>.(6)[1:swapper/0]device-mapper: ioctl: 4.39.0-
> > ioctl (2018-04-03) initialised: dm-devel@redhat.com
> > [    4.315118] <5>-(5)[0:swapper/5]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.315976] <6>.(6)[1:swapper/0]initcall dm_init+0x0/0x70
> > returned 0 after 2147 usecs
> > [    4.317875] <6>.(6)[1:swapper/0]calling  dm_bufio_init+0x0/0x164
> > @ 1
> > [    4.318759] <6>.(6)[1:swapper/0]initcall dm_bufio_init+0x0/0x164
> > returned 0 after 88 usecs
> > [    4.319795] <6>.(6)[1:swapper/0]calling  dm_crypt_init+0x0/0x44
> > @ 1
> > [    4.320577] <6>.(6)[1:swapper/0]initcall dm_crypt_init+0x0/0x44
> > returned 0 after 0 usecs
> > [    4.321585]
> > <6>.(6)[1:swapper/0]calling  dm_snapshot_init+0x0/0x248 @ 1
> > [    4.322427] <6>.(6)[1:swapper/0]initcall
> > dm_snapshot_init+0x0/0x248 returned 0 after 17 usecs
> > [    4.323492] <6>.(6)[1:swapper/0]calling  dm_verity_init+0x0/0x44
> > @ 1
> > [    4.324285] <6>.(6)[1:swapper/0]initcall dm_verity_init+0x0/0x44
> > returned 0 after 0 usecs
> > [    4.325303]
> > <6>.(6)[1:swapper/0]calling  cpufreq_gov_powersave_init+0x0/0x1c @
> > 1
> > [    4.326227] <6>.(6)[1:swapper/0]initcall
> > cpufreq_gov_powersave_init+0x0/0x1c returned 0 after 1 usecs
> > [    4.327377]
> > <6>.(6)[1:swapper/0]calling  cpufreq_gov_userspace_init+0x0/0x1c @
> > 1
> > [    4.328298] <6>.(6)[1:swapper/0]initcall
> > cpufreq_gov_userspace_init+0x0/0x1c returned 0 after 0 usecs
> > [    4.329446]
> > <6>.(6)[1:swapper/0]calling  cpufreq_gov_dbs_init+0x0/0x1c @ 1
> > [    4.330302] <6>.(6)[1:swapper/0]initcall
> > cpufreq_gov_dbs_init+0x0/0x1c returned 0 after 0 usecs
> > [    4.331388]
> > <6>.(6)[1:swapper/0]calling  mtk_cpufreq_hw_driver_init+0x0/0x20 @
> > 1
> > [    4.331789] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.335418] <6>.(6)[1:swapper/0]energy_model: pd0: hertz/watts
> > ratio non-monotonically decreasing: em_cap_state 1 >= em_cap_state0
> > [    4.336978] <6>.(6)[1:swapper/0]energy_model: Created perf
> > domain 0-3
> > [    4.338125] <6>.(6)[1:swapper/0]energy_model: Created perf
> > domain 4-7
> > [    4.339008] <6>.(6)[58:kworker/6:1]Initializing perf order
> > domain:
> > [    4.339800] <6>.(6)[58:kworker/6:1]cpu=0, cpu_perf=525
> > [    4.339807] <6>.(0)[0:swapper/0]CPU1: update max cpu_capacity
> > 525
> > [    4.341199] <6>.(6)[58:kworker/6:1]cpu=4, cpu_perf=1024
> > [    4.341849] <6>.(6)[58:kworker/6:1]Sort perf_domains from little
> > to big:
> > [    4.342683] <6>.(6)[58:kworker/6:1]    cpumask: 0x0f
> > [    4.343307] <6>.(6)[58:kworker/6:1]    cpumask: 0xf0
> > [    4.343377] <4>.(0)[0:swapper/0]CPU4: update max cpu_capacity
> > 1024
> > [    4.343504] <6>.(4)[1:swapper/0]probe of 11bc10.performance-
> > controller returned 1 after 11181 usecs
> > [    4.343927] <4>.(6)[58:kworker/6:1]Initializing perf order
> > domain done
> > [    4.344790] <4>.(4)[1:swapper/0]initcall
> > mtk_cpufreq_hw_driver_init+0x0/0x20 returned 0 after 12185 usecs
> > [    4.347833] <4>.(4)[1:swapper/0]calling  arm_idle_init+0x0/0xc8
> > @ 1
> > [    4.348465] <1>-(1)[0:swapper/1]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.349817] <4>.(4)[1:swapper/0]initcall arm_idle_init+0x0/0xc8
> > returned 0 after 1174 usecs
> > [    4.350857]
> > <4>.(4)[1:swapper/0]calling  mmc_pwrseq_simple_driver_init+0x0/0x20
> > @ 1
> > [    4.351914] <4>.(4)[1:swapper/0]initcall
> > mmc_pwrseq_simple_driver_init+0x0/0x20 returned 0 after 92 usecs
> > [    4.353105]
> > <4>.(4)[1:swapper/0]calling  mmc_pwrseq_emmc_driver_init+0x0/0x20 @
> > 1
> > [    4.354094] <4>.(4)[1:swapper/0]initcall
> > mmc_pwrseq_emmc_driver_init+0x0/0x20 returned 0 after 57 usecs
> > [    4.355269] <4>.(4)[1:swapper/0]calling  mmc_blk_init+0x0/0x120
> > @ 1
> > [    4.356100] <4>.(4)[1:swapper/0]initcall mmc_blk_init+0x0/0x120
> > returned 0 after 49 usecs
> > [    4.357118]
> > <4>.(4)[1:swapper/0]calling  mt_msdc_driver_init+0x0/0x20 @ 1
> > [    4.358356] <4>.(4)[1:swapper/0]mtk-msdc 11230000.mmc: GPIO
> > lookup for consumer wp
> > [    4.359306] <4>.(4)[1:swapper/0]mtk-msdc 11230000.mmc: using
> > device tree for GPIO lookup
> > [    4.360319] <4>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'wp-gpios' property of node '/mmc@11230000[0]'
> > [    4.361629] <4>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'wp-gpio' property of node '/mmc@11230000[0]'
> > [    4.362927] <4>.(4)[1:swapper/0]mtk-msdc 11230000.mmc: using
> > lookup tables for GPIO lookup
> > [    4.363960] <4>.(4)[1:swapper/0]mtk-msdc 11230000.mmc: No GPIO
> > consumer wp found
> > [    4.364998] <4>.(4)[1:swapper/0]mtk-msdc 11230000.mmc: Linked as
> > a consumer to regulator.35
> > [    4.365130] <2>-(2)[0:swapper/2]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.366063] <4>.(4)[1:swapper/0]mtk-msdc 11230000.mmc: Linked as
> > a consumer to regulator.42
> > [    4.368090] <4>.(4)[1:swapper/0]mmc0: CQHCI version 5.10
> > [    4.381796] <3>-(3)[0:swapper/3]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.395231]
> > <4>.(4)[1:swapper/0]BOOTPROF:      4395.224471:probe:
> > probe=platform_drv_probe drv=mtk-
> > msdc(0xffffff800963d938)    36.822154ms
> > [    4.396847] <4>.(4)[1:swapper/0]probe of 11230000.mmc returned 1
> > after 38824 usecs
> > [    4.398001]
> > <4>.(4)[1:swapper/0]BOOTPROF:      4398.000317:initcall:
> > mt_msdc_driver_init    40.033769ms
> > [    4.398449] <5>-(5)[0:swapper/5]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.399193] <4>.(4)[1:swapper/0]initcall
> > mt_msdc_driver_init+0x0/0x20 returned 0 after 40261 usecs
> > [    4.401225]
> > <4>.(4)[1:swapper/0]calling  led_pwm_driver_init+0x0/0x20 @ 1
> > [    4.402168] <4>.(4)[1:swapper/0]initcall
> > led_pwm_driver_init+0x0/0x20 returned 0 after 95 usecs
> > [    4.403263]
> > <4>.(4)[1:swapper/0]calling  timer_led_trigger_init+0x0/0x1c @ 1
> > [    4.404151] <4>.(4)[1:swapper/0]initcall
> > timer_led_trigger_init+0x0/0x1c returned 0 after 3 usecs
> > [    4.405258] <4>.(4)[1:swapper/0]calling  hid_init+0x0/0x7c @ 1
> > [    4.406010] <4>.(4)[1:swapper/0]hidraw: raw HID events driver
> > (C) Jiri Kosina
> > [    4.406907] <4>.(4)[1:swapper/0]initcall hid_init+0x0/0x7c
> > returned 0 after 899 usecs
> > [    4.407893] <4>.(4)[1:swapper/0]calling  uhid_misc_init+0x0/0x1c
> > @ 1
> > [    4.408716] <4>.(4)[1:swapper/0]initcall uhid_misc_init+0x0/0x1c
> > returned 0 after 26 usecs
> > [    4.409745]
> > <4>.(4)[1:swapper/0]calling  hid_generic_init+0x0/0x28 @ 1
> > [    4.410583] <4>.(4)[1:swapper/0]initcall
> > hid_generic_init+0x0/0x28 returned 0 after 25 usecs
> > [    4.411637] <4>.(4)[1:swapper/0]calling  a4_driver_init+0x0/0x28
> > @ 1
> > [    4.412435] <4>.(4)[1:swapper/0]initcall a4_driver_init+0x0/0x28
> > returned 0 after 6 usecs
> > [    4.413453]
> > <4>.(4)[1:swapper/0]calling  apple_driver_init+0x0/0x28 @ 1
> > [    4.414287] <4>.(4)[1:swapper/0]initcall
> > apple_driver_init+0x0/0x28 returned 0 after 11 usecs
> > [    4.415353] <4>-(4)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.416285]
> > <4>.(4)[1:swapper/0]calling  belkin_driver_init+0x0/0x28 @ 1
> > [    4.417126] <4>.(4)[1:swapper/0]initcall
> > belkin_driver_init+0x0/0x28 returned 0 after 6 usecs
> > [    4.418187] <4>.(4)[1:swapper/0]calling  ch_driver_init+0x0/0x28
> > @ 1
> > [    4.418983] <4>.(4)[1:swapper/0]initcall ch_driver_init+0x0/0x28
> > returned 0 after 5 usecs
> > [    4.420010] <4>.(4)[1:swapper/0]calling  ch_driver_init+0x0/0x28
> > @ 1
> > [    4.420814] <4>.(4)[1:swapper/0]initcall ch_driver_init+0x0/0x28
> > returned 0 after 7 usecs
> > [    4.421833] <4>.(4)[1:swapper/0]calling  cp_driver_init+0x0/0x28
> > @ 1
> > [    4.422629] <4>.(4)[1:swapper/0]initcall cp_driver_init+0x0/0x28
> > returned 0 after 4 usecs
> > [    4.423651] <4>.(4)[1:swapper/0]calling  dr_driver_init+0x0/0x28
> > @ 1
> > [    4.424450] <4>.(4)[1:swapper/0]initcall dr_driver_init+0x0/0x28
> > returned 0 after 7 usecs
> > [    4.425467] <4>.(4)[1:swapper/0]calling  ez_driver_init+0x0/0x28
> > @ 1
> > [    4.426264] <4>.(4)[1:swapper/0]initcall ez_driver_init+0x0/0x28
> > returned 0 after 5 usecs
> > [    4.427286]
> > <4>.(4)[1:swapper/0]calling  gyration_driver_init+0x0/0x28 @ 1
> > [    4.428147] <4>.(4)[1:swapper/0]initcall
> > gyration_driver_init+0x0/0x28 returned 0 after 4 usecs
> > [    4.429229] <4>.(4)[1:swapper/0]calling  ks_driver_init+0x0/0x28
> > @ 1
> > [    4.430024] <4>.(4)[1:swapper/0]initcall ks_driver_init+0x0/0x28
> > returned 0 after 3 usecs
> > [    4.431041]
> > <4>.(4)[1:swapper/0]calling  kye_driver_init+0x0/0x28 @ 1
> > [    4.431848] <4>-(4)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.433074] <5>.(5)[1:swapper/0]initcall
> > kye_driver_init+0x0/0x28 returned 0 after 268 usecs
> > [    4.434177] <5>.(5)[1:swapper/0]calling  lg_driver_init+0x0/0x28
> > @ 1
> > [    4.435004] <5>.(5)[1:swapper/0]initcall lg_driver_init+0x0/0x28
> > returned 0 after 27 usecs
> > [    4.436092]
> > <5>.(5)[1:swapper/0]calling  magicmouse_driver_init+0x0/0x28 @ 1
> > [    4.437004] <5>.(5)[1:swapper/0]initcall
> > magicmouse_driver_init+0x0/0x28 returned 0 after 26 usecs
> > [    4.438124] <5>.(5)[1:swapper/0]calling  ms_driver_init+0x0/0x28
> > @ 1
> > [    4.438937] <5>.(5)[1:swapper/0]initcall ms_driver_init+0x0/0x28
> > returned 0 after 15 usecs
> > [    4.439989] <5>.(5)[1:swapper/0]calling  mr_driver_init+0x0/0x28
> > @ 1
> > [    4.440811] <5>.(5)[1:swapper/0]initcall mr_driver_init+0x0/0x28
> > returned 0 after 23 usecs
> > [    4.441844] <5>.(5)[1:swapper/0]calling  mt_driver_init+0x0/0x28
> > @ 1
> > [    4.442658] <5>.(5)[1:swapper/0]initcall mt_driver_init+0x0/0x28
> > returned 0 after 15 usecs
> > [    4.443710]
> > <5>.(5)[1:swapper/0]calling  nintendo_hid_driver_init+0x0/0x28 @ 1
> > [    4.444617] <5>.(5)[1:swapper/0]initcall
> > nintendo_hid_driver_init+0x0/0x28 returned 0 after 5 usecs
> > [    4.445742] <5>.(5)[1:swapper/0]calling  pl_driver_init+0x0/0x28
> > @ 1
> > [    4.446539] <5>.(5)[1:swapper/0]initcall pl_driver_init+0x0/0x28
> > returned 0 after 5 usecs
> > [    4.447585] <5>.(5)[1:swapper/0]calling  pl_driver_init+0x0/0x28
> > @ 1
> > [    4.448383] <5>.(5)[1:swapper/0]initcall pl_driver_init+0x0/0x28
> > returned 0 after 6 usecs
> > [    4.449406] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.450338]
> > <5>.(5)[1:swapper/0]calling  samsung_driver_init+0x0/0x28 @ 1
> > [    4.451203] <5>.(5)[1:swapper/0]initcall
> > samsung_driver_init+0x0/0x28 returned 0 after 6 usecs
> > [    4.452274]
> > <5>.(5)[1:swapper/0]calling  sjoy_driver_init+0x0/0x28 @ 1
> > [    4.453094] <5>.(5)[1:swapper/0]initcall
> > sjoy_driver_init+0x0/0x28 returned 0 after 6 usecs
> > [    4.454133] <5>.(5)[1:swapper/0]calling  sony_init+0x0/0x54 @ 1
> > [    4.454877] <5>.(5)[1:swapper/0]initcall sony_init+0x0/0x54
> > returned 0 after 5 usecs
> > [    4.455849] <5>.(5)[1:swapper/0]calling  sp_driver_init+0x0/0x28
> > @ 1
> > [    4.456648] <5>.(5)[1:swapper/0]initcall sp_driver_init+0x0/0x28
> > returned 0 after 7 usecs
> > [    4.457665] <5>.(5)[1:swapper/0]calling  ga_driver_init+0x0/0x28
> > @ 1
> > [    4.458462] <5>.(5)[1:swapper/0]initcall ga_driver_init+0x0/0x28
> > returned 0 after 4 usecs
> > [    4.459500] <5>.(5)[1:swapper/0]calling  tm_driver_init+0x0/0x28
> > @ 1
> > [    4.460298] <5>.(5)[1:swapper/0]initcall tm_driver_init+0x0/0x28
> > returned 0 after 6 usecs
> > [    4.461315] <5>.(5)[1:swapper/0]calling  ts_driver_init+0x0/0x28
> > @ 1
> > [    4.462112] <5>.(5)[1:swapper/0]initcall ts_driver_init+0x0/0x28
> > returned 0 after 5 usecs
> > [    4.463136]
> > <5>.(5)[1:swapper/0]calling  twinhan_driver_init+0x0/0x28 @ 1
> > [    4.463991] <5>.(5)[1:swapper/0]initcall
> > twinhan_driver_init+0x0/0x28 returned 0 after 8 usecs
> > [    4.465062] <5>.(5)[1:swapper/0]calling  zp_driver_init+0x0/0x28
> > @ 1
> > [    4.465855] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.466792] <5>.(5)[1:swapper/0]initcall zp_driver_init+0x0/0x28
> > returned 0 after 6 usecs
> > [    4.467816] <5>.(5)[1:swapper/0]calling  hid_init+0x0/0x70 @ 1
> > [    4.468570] <5>.(5)[1:swapper/0]usbcore: registered new
> > interface driver usbhid
> > [    4.469481] <5>.(5)[1:swapper/0]usbhid: USB HID core driver
> > [    4.470176] <5>.(5)[1:swapper/0]initcall hid_init+0x0/0x70
> > returned 0 after 1595 usecs
> > [    4.471165]
> > <5>.(5)[1:swapper/0]calling  i2c_hid_driver_init+0x0/0x20 @ 1
> > [    4.472045] <5>.(5)[1:swapper/0]initcall
> > i2c_hid_driver_init+0x0/0x20 returned 0 after 33 usecs
> > [    4.473141] <5>.(5)[1:swapper/0]calling  ashmem_init+0x0/0x10c @
> > 1
> > [    4.473977] <5>.(5)[1:swapper/0]ashmem: initialized
> > [    4.474586] <5>.(5)[1:swapper/0]initcall ashmem_init+0x0/0x10c
> > returned 0 after 659 usecs
> > [    4.475619]
> > <5>.(5)[1:swapper/0]calling  ion_page_pool_init+0x0/0x8 @ 1
> > [    4.476443] <5>.(5)[1:swapper/0]initcall
> > ion_page_pool_init+0x0/0x8 returned 0 after 0 usecs
> > [    4.477494]
> > <5>.(5)[1:swapper/0]calling  ccu_rproc_driver_init+0x0/0x20 @ 1
> > [    4.478460] <5>.(5)[1:swapper/0]probe of 17080000.ccu_rproc
> > returned -517 after 0 usecs
> > [    4.479481] <5>.(5)[1:swapper/0]initcall
> > ccu_rproc_driver_init+0x0/0x20 returned 0 after 1091 usecs
> > [    4.480606]
> > <5>.(5)[1:swapper/0]calling  ccu_rproc1_driver_init+0x0/0x20 @ 1
> > [    4.481557] <5>.(5)[1:swapper/0]probe of ccu_rproc1 returned
> > -517 after 0 usecs
> > [    4.482468] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.483419] <5>.(5)[1:swapper/0]initcall
> > ccu_rproc1_driver_init+0x0/0x20 returned 0 after 1888 usecs
> > [    4.484556]
> > <5>.(5)[1:swapper/0]calling  extcon_class_init+0x0/0x58 @ 1
> > [    4.485381] <5>.(5)[1:swapper/0]initcall
> > extcon_class_init+0x0/0x58 returned 0 after 1 usecs
> > [    4.486451]
> > <5>.(5)[1:swapper/0]calling  mt635x_auxadc_driver_init+0x0/0x20 @ 1
> > [    4.487493] <5>.(5)[1:swapper/0]mt635x-auxadc mt635x-auxadc: no
> > imix_r, ret=-22
> > [    4.488475] <5>.(5)[1:swapper/0]mt635x-auxadc mt635x-auxadc:
> > mt635x_auxadc_probe done
> > [    4.489455] <5>.(5)[1:swapper/0]probe of mt635x-auxadc returned
> > 1 after 2025 usecs
> > [    4.490403] <5>.(5)[1:swapper/0]initcall
> > mt635x_auxadc_driver_init+0x0/0x20 returned 0 after 2959 usecs
> > [    4.491582]
> > <5>.(5)[1:swapper/0]calling  mt6360_adc_driver_init+0x0/0x20 @ 1
> > [    4.492531] <5>.(5)[1:swapper/0]mt6360_adc mt6360_adc.1.auto:
> > DMA mask not set
> > [    4.500183] <5>-(5)[0:swapper/5]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.515140] <4>-(4)[0:swapper/4]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    4.612611] <4>-(4)[0:swapper/4]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    5.364425] <4>-(4)[0:swapper/4]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    5.365385] <4>-(4)[0:swapper/4]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    5.428296] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    5.428339] <7>.(7)[7:kworker/u16:0]warning: SCP DVFS is OFF
> > [    5.430024] <7>.(7)[7:kworker/u16:0][SCP]scp_register_feature
> > request_freq fail
> > [    5.431811] <0>-(0)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.036323] <4>-(4)[0:swapper/4]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.038436] <0>.(0)[1:swapper/0]mt6360_adc mt6360_adc.1.auto:
> > Successfully probed
> > [    6.039490]
> > <0>.(0)[1:swapper/0]BOOTPROF:      6039.479705:probe:
> > probe=platform_drv_probe
> > drv=mt6360_adc(0xffffff8009644d00)  1546.011157ms
> > [    6.041205] <0>.(0)[1:swapper/0]probe of mt6360_adc.1.auto
> > returned 1 after 1548674 usecs
> > [    6.042382]
> > <0>.(0)[1:swapper/0]BOOTPROF:      6042.374090:initcall:
> > mt6360_adc_driver_init  1549.898850ms
> > [    6.043705] <0>.(0)[1:swapper/0]initcall
> > mt6360_adc_driver_init+0x0/0x20 returned 0 after 1514871 usecs
> > [    6.044930] <0>.(0)[1:swapper/0]calling  dsu_pmu_init+0x0/0x58 @
> > 1
> > [    6.048465] <4>-(4)[0:swapper/4]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.050981] <0>.(0)[1:swapper/0]probe of dsu-pmu returned 1
> > after 3616 usecs
> > [    6.052460] <0>.(0)[1:swapper/0]initcall dsu_pmu_init+0x0/0x58
> > returned 0 after 6560 usecs
> > [    6.053533] <0>.(0)[1:swapper/0]calling  binder_init+0x0/0x13c @
> > 1
> > [    6.053543] <0>.(4)[56:kworker/4:1]mtk-msdc 11230000.mmc: phase:
> > [map:fffffffe] [maxlen:31] [final:16]
> > [    6.055801] <0>.(0)[1:swapper/0]initcall binder_init+0x0/0x13c
> > returned 0 after 181 usecs
> > [    6.056850]
> > <0>.(0)[1:swapper/0]calling  mt635x_efuse_driver_init+0x0/0x20 @ 1
> > [    6.058487] <0>.(0)[1:swapper/0]probe of mt6359-efuse returned 1
> > after 182 usecs
> > [    6.058586] <4>.(4)[56:kworker/4:1]mmc0: Command Queue Engine
> > enabled
> > [    6.059516] <0>.(0)[1:swapper/0]initcall
> > mt635x_efuse_driver_init+0x0/0x20 returned 0 after 1697 usecs
> > [    6.060281] <4>.(4)[56:kworker/4:1]mmc0: new HS400 MMC card at
> > address 0001
> > [    6.061441]
> > <0>.(0)[1:swapper/0]calling  optee_driver_init+0x0/0x650 @ 1
> > [    6.062975] <4>.(4)[56:kworker/4:1]mmcblk0: mmc0:0001 S0J57X
> > 29.6 GiB
> > [    6.063726] <0>.(0)[1:swapper/0]optee: probing for conduit
> > method from DT.
> > [    6.064125] <4>.(4)[56:kworker/4:1]mmcblk0boot0: mmc0:0001
> > S0J57X partition 1 31.5 MiB
> > [    6.064874] <0>.(0)[1:swapper/0]optee: revision 3.10 (6c7ad106)
> > [    6.065062] <4>.(0)[1:swapper/0]optee: initialized driver
> > [    6.065830] <0>-(4)[56:kworker/4:1]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [    6.066577] <4>.(0)[1:swapper/0]initcall
> > optee_driver_init+0x0/0x650 returned 0 after 3290 usecs
> > [    6.067413] <0>.(4)[56:kworker/4:1]mmcblk0boot1: mmc0:0001
> > S0J57X partition 2 31.5 MiB
> > [    6.068248] <4>.(0)[1:swapper/0]calling  icc_init+0x0/0x4c @ 1
> > [    6.069373] <0>.(4)[56:kworker/4:1]mmcblk0rpmb: mmc0:0001 S0J57X
> > partition 3 4.00 MiB, chardev (242:0)
> > [    6.070352] <0>.(0)[1:swapper/0]initcall icc_init+0x0/0x4c
> > returned 0 after 21 usecs
> > [    6.073223]
> > <0>.(0)[1:swapper/0]calling  mtk_mmqos_mt8195_driver_init+0x0/0x20
> > @ 1
> > [    6.076001] <0>.(0)[1:swapper/0]mtk-smi-common 1c01b000.smi:
> > Linked as a consumer to regulator.3
> > [    6.077271] <0>.(0)[1:swapper/0]mtk-smi-common 14012000.smi:
> > Linked as a consumer to regulator.3
> > [    6.079199] <4>.(4)[56:kworker/4:1] mmcblk0: p1 p2 p3 p4 p5 p6
> > p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23
> > p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40
> > p41 p42 p43 p44 p45 p46 p47 p48 p49 p50 p51 p52 p53 p54
> > [    6.079566] <0>.(0)[1:swapper/0]probe of interconnect returned 1
> > after 4886 usecs
> > [    6.081979] <0>-(0)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.084099] <0>.(0)[1:swapper/0]initcall
> > mtk_mmqos_mt8195_driver_init+0x0/0x20 returned 0 after 9684 usecs
> > [    6.084229]
> > <4>.(4)[56:kworker/4:1]BOOTPROF:      6084.224936:probe:
> > probe=mmc_bus_probe drv=mmcblk(0xffffff800963d6f8)    21.769000ms
> > [    6.085311]
> > <0>.(0)[1:swapper/0]calling  alsa_hwdep_init+0x0/0x38 @ 1
> > [    6.086821] <4>.(4)[56:kworker/4:1]probe of mmc0:0001 returned 1
> > after 24405 usecs
> > [    6.087654] <0>.(0)[1:swapper/0]initcall
> > alsa_hwdep_init+0x0/0x38 returned 0 after 15 usecs
> > [    6.089620]
> > <0>.(0)[1:swapper/0]calling  alsa_timer_init+0x0/0x1e4 @ 1
> > [    6.090502] <0>.(0)[1:swapper/0]initcall
> > alsa_timer_init+0x0/0x1e4 returned 0 after 60 usecs
> > [    6.091782]
> > <6>.(6)[1:swapper/0]calling  snd_hrtimer_init+0x0/0xf4 @ 1
> > [    6.092602] <6>.(6)[1:swapper/0]initcall
> > snd_hrtimer_init+0x0/0xf4 returned 0 after 3 usecs
> > [    6.093643] <6>.(6)[1:swapper/0]calling  alsa_pcm_init+0x0/0x80
> > @ 1
> > [    6.094429] <6>.(6)[1:swapper/0]initcall alsa_pcm_init+0x0/0x80
> > returned 0 after 3 usecs
> > [    6.095504]
> > <6>.(6)[1:swapper/0]calling  alsa_rawmidi_init+0x0/0x34 @ 1
> > [    6.096331] <6>.(6)[1:swapper/0]initcall
> > alsa_rawmidi_init+0x0/0x34 returned 0 after 1 usecs
> > [    6.097382] <6>.(6)[1:swapper/0]calling  alsa_seq_init+0x0/0x64
> > @ 1
> > [    6.098205] <6>.(6)[1:swapper/0]initcall alsa_seq_init+0x0/0x64
> > returned 0 after 40 usecs
> > [    6.099226] <6>-(6)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.100182]
> > <6>.(6)[1:swapper/0]calling  alsa_seq_dummy_init+0x0/0x14 @ 1
> > [    6.101034] <6>.(6)[1:swapper/0]initcall
> > alsa_seq_dummy_init+0x0/0x14 returned 0 after 4 usecs
> > [    6.102108]
> > <6>.(6)[1:swapper/0]calling  seq_midisynth_driver_init+0x0/0x20 @ 1
> > [    6.103031] <6>.(6)[1:swapper/0]initcall
> > seq_midisynth_driver_init+0x0/0x20 returned 0 after 11 usecs
> > [    6.104190]
> > <6>.(6)[1:swapper/0]calling  usb_audio_driver_init+0x0/0x28 @ 1
> > [    6.105111] <6>.(6)[1:swapper/0]usbcore: registered new
> > interface driver snd-usb-audio
> > [    6.106099] <6>.(6)[1:swapper/0]initcall
> > usb_audio_driver_init+0x0/0x28 returned 0 after 1015 usecs
> > [    6.107247] <6>.(6)[1:swapper/0]calling  snd_soc_init+0x0/0xcc @
> > 1
> > [    6.108338] <6>.(6)[1:swapper/0]snd-soc-dummy snd-soc-dummy:
> > ASoC: dai register snd-soc-dummy #1
> > [    6.109434] <6>.(6)[1:swapper/0]snd-soc-dummy snd-soc-dummy:
> > ASoC: dynamically register DAI snd-soc-dummy
> > [    6.110626] <6>.(6)[1:swapper/0]snd-soc-dummy snd-soc-dummy:
> > ASoC: Registered DAI 'snd-soc-dummy-dai'
> > [    6.111814] <6>.(6)[1:swapper/0]snd-soc-dummy snd-soc-dummy:
> > ASoC: dai register snd-soc-dummy #0
> > [    6.112914] <6>.(6)[1:swapper/0]probe of snd-soc-dummy returned
> > 1 after 4609 usecs
> > [    6.113923] <6>.(6)[1:swapper/0]initcall snd_soc_init+0x0/0xcc
> > returned 0 after 5766 usecs
> > [    6.114953]
> > <6>.(6)[1:swapper/0]calling  mt6359_platform_driver_init+0x0/0x20 @
> > 1
> > [    6.115894] <6>-(6)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.116882] <6>.(6)[1:swapper/0]mt6359-sound mt6359-sound:
> > mt6359_platform_driver_probe(), dev name mt6359-sound
> > [    6.118189] <6>.(6)[1:swapper/0]mt6359-sound mt6359-sound:
> > Linked as a consumer to regulator.15
> > [    6.119320] <6>.(6)[1:swapper/0]mt6359-sound mt6359-sound: ASoC:
> > dai register mt6359-sound #2
> > [    6.120381] <6>.(6)[1:swapper/0]mt6359-sound mt6359-sound: ASoC:
> > dynamically register DAI mt6359-sound
> > [    6.121541] <6>.(6)[1:swapper/0]mt6359-sound mt6359-sound: ASoC:
> > Registered DAI 'mt6359-snd-codec-aif1'
> > [    6.122710] <6>.(6)[1:swapper/0]mt6359-sound mt6359-sound: ASoC:
> > dynamically register DAI mt6359-sound
> > [    6.123879] <6>.(6)[1:swapper/0]mt6359-sound mt6359-sound: ASoC:
> > Registered DAI 'mt6359-snd-codec-aif2'
> > [    6.125052] <6>.(6)[1:swapper/0]probe of mt6359-sound returned 1
> > after 8181 usecs
> > [    6.125991] <6>.(6)[1:swapper/0]initcall
> > mt6359_platform_driver_init+0x0/0x20 returned 0 after 8943 usecs
> > [    6.127184]
> > <6>.(6)[1:swapper/0]calling  accdet_soc_init+0x0/0x2c @ 1
> > [    6.128287] <6>.(6)[1:swapper/0]accdet mic_vol=8, plugout_deb=1
> > mic_mode=2 eint_pol=4
> > [    6.129263] <6>.(6)[1:swapper/0]accdet caps=145
> > [    6.129966] <6>.(6)[1:swapper/0]pmic-codec-accdet mt635x-accdet: 
> > ASoC: DAPM unknown pin Headset
> > [    6.131116] <6>.(6)[1:swapper/0]input: mt63xx-accdet Headset as
> > /devices/platform/10024000.pwrap/10024000.pwrap:mt6359/mt635x-
> > accdet/sound/card0/input1
> > [    6.132804] <6>-(6)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.134100] <6>.(6)[1:swapper/0]accdet_get_efuse moisture_vdd
> > efuse=0x112e, moisture_vdd_offset=17 mv
> > [    6.135416] <6>.(6)[1:swapper/0]accdet_get_efuse moisture_efuse
> > efuse=0x5500,moisture_offset=0 mv
> > [    6.136519] <6>.(6)[1:swapper/0]accdet_get_efuse
> > efuse=0x5500,auxadc_val=-63mv
> > [    6.139182] <5>.(5)[1:swapper/0]probe of mt635x-accdet returned
> > 1 after 10982 usecs
> > [    6.140160] <5>.(5)[1:swapper/0]initcall
> > accdet_soc_init+0x0/0x2c returned 0 after 11886 usecs
> > [    6.141232]
> > <5>.(5)[1:swapper/0]calling  hdmi_codec_driver_init+0x0/0x20 @ 1
> > [    6.142170] <5>.(5)[1:swapper/0]hdmi-audio-codec hdmi-audio-
> > codec.0.auto: ASoC: dai register hdmi-audio-codec.0.auto #1
> > [    6.143590] <5>.(5)[1:swapper/0]hdmi-audio-codec hdmi-audio-
> > codec.0.auto: ASoC: dynamically register DAI hdmi-audio-
> > codec.0.auto
> > [    6.145029] <5>.(5)[1:swapper/0]hdmi-audio-codec hdmi-audio-
> > codec.0.auto: ASoC: Registered DAI 'i2s-hifi'
> > [    6.146230] <5>.(5)[1:swapper/0]probe of hdmi-audio-codec.0.auto 
> > returned 1 after 4078 usecs
> > [    6.147316] <5>.(5)[1:swapper/0]initcall
> > hdmi_codec_driver_init+0x0/0x20 returned 0 after 5083 usecs
> > [    6.148458] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.149392]
> > <5>.(5)[1:swapper/0]calling  mt8195_afe_pcm_driver_init+0x0/0x20 @
> > 1
> > [    6.152036] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: mt8195_dai_hostless_register()
> > [    6.153277] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: mtk_afe_combine_sub_dai(), num of
> > dai 56
> > [    6.154636] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: mt8195_afe_runtime_resume
> > [    6.155964] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: No cache defaults, reading back
> > from HW
> > [    6.160586] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: mt8195_afe_runtime_suspend
> > [    6.161972] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: mt8195_afe_runtime_resume
> > [    6.163825] <5>.(5)[53:kworker/5:1]mt8195-audio
> > 10890000.syscon:audio-controller: mt8195_afe_runtime_suspend
> > [    6.165092] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dai register
> > 10890000.syscon:audio-controller #0
> > [    6.166586] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.167536] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dai register
> > 10890000.syscon:audio-controller #56
> > [    6.169037] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.170626] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'DL2'
> > [    6.171826] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.173415] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'DL3'
> > [    6.174604] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.176197] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'DL6'
> > [    6.177387] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.178975] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'DL7'
> > [    6.180169] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.181758] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'DL8'
> > [    6.182947] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.183881] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.185469] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'DL10'
> > [    6.186669] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.188261] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'DL11'
> > [    6.189461] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.191052] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'UL1'
> > [    6.192241] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.193830] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'UL2'
> > [    6.195020] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.196612] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'UL3'
> > [    6.197801] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.199389] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.200323] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'UL4'
> > [    6.201514] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.203105] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'UL5'
> > [    6.204294] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.205883] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'UL6'
> > [    6.207075] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.208662] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'UL8'
> > [    6.209851] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.211442] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'UL9'
> > [    6.212631] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.214219] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'UL10'
> > [    6.215422] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.216354] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.217942] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'PCM1'
> > [    6.219145] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.220733] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'MULTI_IN1'
> > [    6.221987] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.223579] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'MULTI_IN2'
> > [    6.224832] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.226421] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'HW_GAIN1'
> > [    6.227666] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.229254] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'HW_GAIN2'
> > [    6.230498] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.232088] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.233020] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI
> > 'ADDA_HOSTLESS_LPBK'
> > [    6.234371] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.235962] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI
> > 'DMIC_HOSTLESS_RECORD'
> > [    6.237333] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.238922] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI
> > 'DL_VIRTUAL_SOURCE'
> > [    6.240264] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.241852] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC0'
> > [    6.243076] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.244665] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC1'
> > [    6.245886] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.247476] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC2'
> > [    6.248699] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.249630] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.251221] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC3'
> > [    6.252442] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.254031] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC4'
> > [    6.255256] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.256844] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC5'
> > [    6.258065] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.259656] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC6'
> > [    6.260878] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.262466] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC7'
> > [    6.263690] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.265278] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.266210] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC8'
> > [    6.267434] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.269023] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC9'
> > [    6.270245] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.271836] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC10'
> > [    6.273069] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.274657] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC11'
> > [    6.275892] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.277481] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC12'
> > [    6.278713] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.280304] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC13'
> > [    6.281537] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.283126] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.284060] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC14'
> > [    6.285293] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.286881] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC15'
> > [    6.288116] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.289704] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC16'
> > [    6.290937] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.292528] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC17'
> > [    6.293760] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.295351] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC18'
> > [    6.296584] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.298172] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'GASRC19'
> > [    6.299405] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.300339] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.301928] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'DPTX'
> > [    6.303131] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.304720] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'ETDM1_IN'
> > [    6.305962] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.307553] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'ETDM2_IN'
> > [    6.308796] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.310384] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'ETDM1_OUT'
> > [    6.311641] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.313229] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'ETDM2_OUT'
> > [    6.314483] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.316074] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.317005] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'ETDM3_OUT'
> > [    6.318260] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.319852] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'DMIC'
> > [    6.321053] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.322641] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'SPDIF_OUT'
> > [    6.323898] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.325486] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'SPDIF_IN'
> > [    6.326728] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.328319] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'DL_SRC'
> > [    6.329541] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.331132] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'UL_SRC1'
> > [    6.332365] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.333296] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: dynamically register DAI
> > 10890000.syscon:audio-controller
> > [    6.334885] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: ASoC: Registered DAI 'UL_SRC2'
> > [    6.336134]
> > <5>.(5)[1:swapper/0]BOOTPROF:      6336.133475:probe:
> > probe=platform_drv_probe drv=mt8195-
> > audio(0xffffff8009650ab8)   185.651154ms
> > [    6.337741] <5>.(5)[1:swapper/0]probe of 10890000.syscon:audio-
> > controller returned 1 after 187288 usecs
> > [    6.338926]
> > <5>.(5)[1:swapper/0]BOOTPROF:      6338.925552:initcall:
> > mt8195_afe_pcm_driver_init   188.611847ms
> > [    6.340175] <5>.(5)[1:swapper/0]initcall
> > mt8195_afe_pcm_driver_init+0x0/0x20 returned 0 after 185411 usecs
> > [    6.341376]
> > <5>.(5)[1:swapper/0]calling  mt8195_adsp_pcm_driver_init+0x0/0x20 @
> > 1
> > [    6.342482] <5>.(5)[1:swapper/0]mt8195-audio
> > 10890000.syscon:audio-controller: mt8195_afe_runtime_resume
> > [    6.344113] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm:
> > mt8195_adsp_pcm_parse_of, dsp-boot-run=1, read_val=1
> > [    6.345749] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: dai
> > register 10890000.syscon:audio-controller:mt8195-adsp-pcm #0
> > [    6.347582] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: dai
> > register 10890000.syscon:audio-controller:mt8195-adsp-pcm #6
> > [    6.349408] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.350339] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: dynamically
> > register DAI 10890000.syscon:audio-controller:mt8195-adsp-pcm
> > [    6.352266] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: Registered
> > DAI 'FE_HOSTLESS_VA'
> > [    6.353736] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: dynamically
> > register DAI 10890000.syscon:audio-controller:mt8195-adsp-pcm
> > [    6.355662] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: Registered
> > DAI 'FE_VA'
> > [    6.357034] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: dynamically
> > register DAI 10890000.syscon:audio-controller:mt8195-adsp-pcm
> > [    6.358956] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: Registered
> > DAI 'FE_MICR'
> > [    6.360353] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: dynamically
> > register DAI 10890000.syscon:audio-controller:mt8195-adsp-pcm
> > [    6.362276] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: Registered
> > DAI 'BE_TDM_IN'
> > [    6.363694] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: dynamically
> > register DAI 10890000.syscon:audio-controller:mt8195-adsp-pcm
> > [    6.365616] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.366549] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: Registered
> > DAI 'BE_UL9_IN'
> > [    6.367967] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: dynamically
> > register DAI 10890000.syscon:audio-controller:mt8195-adsp-pcm
> > [    6.369890] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm: ASoC: Registered
> > DAI 'BE_UL2_IN'
> > [    6.371310] <5>.(5)[1:swapper/0]mt8195-adsp
> > 10890000.syscon:audio-controller:mt8195-adsp-pcm:
> > mt8195_adsp_pcm_dev_probe initialized.
> > [    6.372797]
> > <5>.(5)[1:swapper/0]BOOTPROF:      6372.796168:probe:
> > probe=platform_drv_probe drv=mt8195-
> > adsp(0xffffff800966c608)    28.682462ms
> > [    6.374381] <5>.(5)[1:swapper/0]probe of 10890000.syscon:audio-
> > controller:mt8195-adsp-pcm returned 1 after 30286 usecs
> > [    6.375721] <5>.(5)[53:kworker/5:1]mt8195-audio
> > 10890000.syscon:audio-controller: mt8195_afe_runtime_suspend
> > [    6.376962]
> > <5>.(5)[1:swapper/0]BOOTPROF:      6376.961552:initcall:
> > mt8195_adsp_pcm_driver_init    34.652231ms
> > [    6.378232] <5>.(5)[1:swapper/0]initcall
> > mt8195_adsp_pcm_driver_init+0x0/0x20 returned 0 after 35081 usecs
> > [    6.379438]
> > <5>.(5)[1:swapper/0]calling  butterscotch_driver_init+0x0/0x20 @ 1
> > [    6.380613] <5>.(5)[1:swapper/0]probe of sound returned 0 after
> > 195 usecs
> > [    6.381476] <5>.(5)[1:swapper/0]initcall
> > butterscotch_driver_init+0x0/0x20 returned 0 after 1111 usecs
> > [    6.382635] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.383577]
> > <5>.(5)[1:swapper/0]calling  mt8570_adsp_pcm_driver_init+0x0/0x20 @
> > 1
> > [    6.384631] <5>.(5)[1:swapper/0]mt8570-adsp-pcm odm:audio_spi:
> > ASoC: dai register odm:audio_spi #0
> > [    6.385748] <5>.(5)[1:swapper/0]mt8570-adsp-pcm odm:audio_spi:
> > ASoC: dai register odm:audio_spi #2
> > [    6.386862] <5>.(5)[1:swapper/0]mt8570-adsp-pcm odm:audio_spi:
> > ASoC: dynamically register DAI odm:audio_spi
> > [    6.388107] <5>.(5)[1:swapper/0]mt8570-adsp-pcm odm:audio_spi:
> > ASoC: Registered DAI 'FE_MICR'
> > [    6.389168] <5>.(5)[1:swapper/0]mt8570-adsp-pcm odm:audio_spi:
> > ASoC: dynamically register DAI odm:audio_spi
> > [    6.390379] <5>.(5)[1:swapper/0]mt8570-adsp-pcm odm:audio_spi:
> > ASoC: Registered DAI 'BE_MICR'
> > [    6.391449] <5>.(5)[1:swapper/0]mt8570-adsp-pcm odm:audio_spi:
> > mt8570_adsp_pcm_dev_probe initialized.
> > [    6.392603] <5>.(5)[1:swapper/0]probe of odm:audio_spi returned
> > 1 after 8012 usecs
> > [    6.393562] <5>.(5)[1:swapper/0]initcall
> > mt8570_adsp_pcm_driver_init+0x0/0x20 returned 0 after 8840 usecs
> > [    6.394752]
> > <5>.(5)[1:swapper/0]calling  mt8570_adsp_card_driver_init+0x0/0x20
> > @ 1
> > [    6.395778] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > GPIO lookup for consumer dmic_clk_en_io
> > [    6.396937] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > using device tree for GPIO lookup
> > [    6.398049] <5>.(5)[1:swapper/0]of_get_named_gpiod_flags: parsed
> > 'dmic_clk_en_io-gpios' property of node '/odm/mt8570_sound[0]' -
> > status (0)
> > [    6.399619] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    6.900122] <7>.(7)[0:swapper/7][mtk_net][rtnl_lock]There is no
> > process hold rtnl lock
> > [    6.900132] <5>-(5)[0:swapper/5]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    7.412352] <5>-(5)[0:swapper/5]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.020129] <5>-(5)[0:swapper/5]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.021164] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding SPI_RSV0_FE
> > [    8.022206] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding SPI_MIC_FE
> > [    8.023285] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding SPI_RSV1_FE
> > [    8.024304] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding SPI_RSV2_FE
> > [    8.025321] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding SPI_RSV3_FE
> > [    8.026336] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding SPI_RSV4_FE
> > [    8.027373] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding PCMP_RSV1_FE
> > [    8.028398] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding SPI_RSV6_FE
> > [    8.029414] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding SPI_RSV7_FE
> > [    8.030429] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding SPI_RSV8_FE
> > [    8.031458] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding COMRPP_RSV1_FE
> > [    8.032501] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.033437] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding COMRPP_RSV2_FE
> > [    8.034478] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding COMRPP_RSV3_FE
> > [    8.035523] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding COMRPP_RSV4_FE
> > [    8.036565] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding SPI MIC BE
> > [    8.037562] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding SPI_RSV1_BE
> > [    8.038571] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: binding SPI_RSV2_BE
> > [    8.039661] <5>.(5)[1:swapper/0]mt8570-adsp-pcm odm:audio_spi:
> > ASoC: adding FE_MICR widget
> > [    8.040692] <5>.(5)[1:swapper/0]mt8570-adsp-pcm odm:audio_spi:
> > ASoC: adding SPI MIC Capture widget
> > [    8.041821] <5>.(5)[1:swapper/0]mt8570-adsp-pcm odm:audio_spi:
> > mt8570_adsp_pcm_pcm_probe register callback for audio controller
> > fail -22
> > [    8.043352] <5>.(5)[1:swapper/0]mt8570-adsp-pcm odm:audio_spi:
> > ASoC: failed to probe component -517
> > [    8.044500] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > ASoC: failed to instantiate card -517
> > [    8.045667] <5>.(5)[1:swapper/0]mt8570-sound odm:mt8570_sound:
> > mt8570_adsp_card_dev_probe snd_soc_register_card fail -517
> > [    8.047065]
> > <5>.(5)[1:swapper/0]BOOTPROF:      8047.062787:probe:
> > probe=platform_drv_probe drv=mt8570-
> > sound(0xffffff80096712e0)  1651.261157ms
> > [    8.048655] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.049612] <5>.(5)[1:swapper/0]probe of odm:mt8570_sound
> > returned 0 after 1653850 usecs
> > [    8.050750]
> > <5>.(5)[1:swapper/0]BOOTPROF:      8050.749710:initcall:
> > mt8570_adsp_card_driver_init  1655.041004ms
> > [    8.052026] <5>.(5)[1:swapper/0]initcall
> > mt8570_adsp_card_driver_init+0x0/0x20 returned 0 after 1617500
> > usecs
> > [    8.053260]
> > <5>.(5)[1:swapper/0]calling  fb_dai_link_driver_init+0x0/0x20 @ 1
> > [    8.054557] <5>.(5)[1:swapper/0]probe of odm:fb_dai_link_amp
> > returned 1 after 58 usecs
> > [    8.055573] <5>.(5)[1:swapper/0]probe of
> > odm:fb_dai_link_dbmdx_tdm0 returned 1 after 16 usecs
> > [    8.056668] <5>.(5)[1:swapper/0]initcall
> > fb_dai_link_driver_init+0x0/0x20 returned 0 after 2458 usecs
> > [    8.057815]
> > <5>.(5)[1:swapper/0]calling  fb_i2s_mclk_driver_init+0x0/0x20 @ 1
> > [    8.059044] <5>.(5)[1:swapper/0]probe of odm:afe_i2so_mclk
> > returned 1 after 213 usecs
> > [    8.060053] <5>.(5)[1:swapper/0]initcall
> > fb_i2s_mclk_driver_init+0x0/0x20 returned 0 after 1316 usecs
> > [    8.061203] <5>.(5)[1:swapper/0]calling  sock_diag_init+0x0/0x48
> > @ 1
> > [    8.062063] <5>.(5)[1:swapper/0]initcall sock_diag_init+0x0/0x48
> > returned 0 after 65 usecs
> > [    8.063106] <5>.(5)[1:swapper/0]calling  llc_init+0x0/0x2c @ 1
> > [    8.063837] <5>.(5)[1:swapper/0]initcall llc_init+0x0/0x2c
> > returned 0 after 2 usecs
> > [    8.064790] <5>.(5)[1:swapper/0]calling  snap_init+0x0/0x44 @ 1
> > [    8.065530] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.066463] <5>.(5)[1:swapper/0]initcall snap_init+0x0/0x44
> > returned 0 after 1 usecs
> > [    8.067431] <5>.(5)[1:swapper/0]calling  blackhole_init+0x0/0x1c
> > @ 1
> > [    8.068225] <5>.(5)[1:swapper/0]initcall blackhole_init+0x0/0x1c
> > returned 0 after 2 usecs
> > [    8.069243]
> > <5>.(5)[1:swapper/0]calling  police_init_module+0x0/0x24 @ 1
> > [    8.070081] <5>.(5)[1:swapper/0]initcall
> > police_init_module+0x0/0x24 returned 0 after 3 usecs
> > [    8.071146]
> > <5>.(5)[1:swapper/0]calling  mirred_init_module+0x0/0x68 @ 1
> > [    8.071990] <5>.(5)[1:swapper/0]Mirror/redirect action on
> > [    8.072665] <5>.(5)[1:swapper/0]initcall
> > mirred_init_module+0x0/0x68 returned 0 after 668 usecs
> > [    8.073748]
> > <5>.(5)[1:swapper/0]calling  ipt_init_module+0x0/0x78 @ 1
> > [    8.074553] <5>.(5)[1:swapper/0]initcall
> > ipt_init_module+0x0/0x78 returned 0 after 2 usecs
> > [    8.075587]
> > <5>.(5)[1:swapper/0]calling  htb_module_init+0x0/0x1c @ 1
> > [    8.076390] <5>.(5)[1:swapper/0]initcall
> > htb_module_init+0x0/0x1c returned 0 after 0 usecs
> > [    8.077419]
> > <5>.(5)[1:swapper/0]calling  ingress_module_init+0x0/0x50 @ 1
> > [    8.078265] <5>.(5)[1:swapper/0]initcall
> > ingress_module_init+0x0/0x50 returned 0 after 0 usecs
> > [    8.079339] <5>.(5)[1:swapper/0]calling  init_u32+0x0/0x9c @ 1
> > [    8.080066] <5>.(5)[1:swapper/0]u32 classifier
> > [    8.080620] <5>.(5)[1:swapper/0]    Performance counters on
> > [    8.081315] <5>.(5)[1:swapper/0]    input device check on
> > [    8.081989] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.082921] <5>.(5)[1:swapper/0]    Actions configured
> > [    8.083566] <5>.(5)[1:swapper/0]initcall init_u32+0x0/0x9c
> > returned 0 after 3417 usecs
> > [    8.084552] <5>.(5)[1:swapper/0]calling  init_fw+0x0/0x1c @ 1
> > [    8.085268] <5>.(5)[1:swapper/0]initcall init_fw+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.086211] <5>.(5)[1:swapper/0]calling  cls_flow_init+0x0/0x1c
> > @ 1
> > [    8.086992] <5>.(5)[1:swapper/0]initcall cls_flow_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.088002]
> > <5>.(5)[1:swapper/0]calling  cls_bpf_init_mod+0x0/0x1c @ 1
> > [    8.088815] <5>.(5)[1:swapper/0]initcall
> > cls_bpf_init_mod+0x0/0x1c returned 0 after 0 usecs
> > [    8.089854] <5>.(5)[1:swapper/0]calling  init_em_u32+0x0/0x1c @
> > 1
> > [    8.090613] <5>.(5)[1:swapper/0]initcall init_em_u32+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.091601] <5>.(5)[1:swapper/0]calling  nfnetlink_init+0x0/0x64
> > @ 1
> > [    8.092397] <5>.(5)[1:swapper/0]initcall nfnetlink_init+0x0/0x64
> > returned 0 after 4 usecs
> > [    8.093415]
> > <5>.(5)[1:swapper/0]calling  nfnetlink_queue_init+0x0/0xb8 @ 1
> > [    8.094280] <5>.(5)[1:swapper/0]initcall
> > nfnetlink_queue_init+0x0/0xb8 returned 0 after 8 usecs
> > [    8.095369]
> > <5>.(5)[1:swapper/0]calling  nfnetlink_log_init+0x0/0xbc @ 1
> > [    8.096208] <5>.(5)[1:swapper/0]initcall
> > nfnetlink_log_init+0x0/0xbc returned 0 after 4 usecs
> > [    8.097268]
> > <5>.(5)[1:swapper/0]calling  nf_conntrack_standalone_init+0x0/0xa4
> > @ 1
> > [    8.098403] <5>.(5)[1:swapper/0]initcall
> > nf_conntrack_standalone_init+0x0/0xa4 returned 0 after 185 usecs
> > [    8.099594] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.100539]
> > <5>.(5)[1:swapper/0]calling  nf_ct_proto_gre_init+0x0/0x5c @ 1
> > [    8.101398] <5>.(5)[1:swapper/0]initcall
> > nf_ct_proto_gre_init+0x0/0x5c returned 0 after 2 usecs
> > [    8.102480] <5>.(5)[1:swapper/0]calling  ctnetlink_init+0x0/0xa4
> > @ 1
> > [    8.103277] <5>.(5)[1:swapper/0]initcall ctnetlink_init+0x0/0xa4
> > returned 0 after 1 usecs
> > [    8.104295]
> > <5>.(5)[1:swapper/0]calling  nf_conntrack_amanda_init+0x0/0xcc @ 1
> > [    8.105199] <5>.(5)[1:swapper/0]initcall
> > nf_conntrack_amanda_init+0x0/0xcc returned 0 after 4 usecs
> > [    8.106324]
> > <5>.(5)[1:swapper/0]calling  nf_conntrack_ftp_init+0x0/0x178 @ 1
> > [    8.107209] <5>.(5)[1:swapper/0]initcall
> > nf_conntrack_ftp_init+0x0/0x178 returned 0 after 2 usecs
> > [    8.108313]
> > <5>.(5)[1:swapper/0]calling  nf_conntrack_h323_init+0x0/0x84 @ 1
> > [    8.109195] <5>.(5)[1:swapper/0]initcall
> > nf_conntrack_h323_init+0x0/0x84 returned 0 after 4 usecs
> > [    8.110299]
> > <5>.(5)[1:swapper/0]calling  nf_conntrack_irc_init+0x0/0x174 @ 1
> > [    8.111182] <5>.(5)[1:swapper/0]initcall
> > nf_conntrack_irc_init+0x0/0x174 returned 0 after 2 usecs
> > [    8.112287]
> > <5>.(5)[1:swapper/0]calling  nf_conntrack_netbios_ns_init+0x0/0x2c
> > @ 1
> > [    8.113231] <5>.(5)[1:swapper/0]initcall
> > nf_conntrack_netbios_ns_init+0x0/0x2c returned 0 after 1 usecs
> > [    8.114399]
> > <5>.(5)[1:swapper/0]calling  nf_conntrack_pptp_init+0x0/0x1c @ 1
> > [    8.115280] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.116214] <5>.(5)[1:swapper/0]initcall
> > nf_conntrack_pptp_init+0x0/0x1c returned 0 after 1 usecs
> > [    8.117318]
> > <5>.(5)[1:swapper/0]calling  nf_conntrack_sane_init+0x0/0x16c @ 1
> > [    8.118212] <5>.(5)[1:swapper/0]initcall
> > nf_conntrack_sane_init+0x0/0x16c returned 0 after 6 usecs
> > [    8.119331]
> > <5>.(5)[1:swapper/0]calling  nf_conntrack_tftp_init+0x0/0x13c @ 1
> > [    8.120220] <5>.(5)[1:swapper/0]initcall
> > nf_conntrack_tftp_init+0x0/0x13c returned 0 after 1 usecs
> > [    8.121335] <5>.(5)[1:swapper/0]calling  nf_nat_init+0x0/0xf8 @
> > 1
> > [    8.122133] <5>.(5)[1:swapper/0]initcall nf_nat_init+0x0/0xf8
> > returned 0 after 38 usecs
> > [    8.123136]
> > <5>.(5)[1:swapper/0]calling  nf_nat_amanda_init+0x0/0x24 @ 1
> > [    8.123971] <5>.(5)[1:swapper/0]initcall
> > nf_nat_amanda_init+0x0/0x24 returned 0 after 0 usecs
> > [    8.125032]
> > <5>.(5)[1:swapper/0]calling  nf_nat_ftp_init+0x0/0x24 @ 1
> > [    8.125834] <5>.(5)[1:swapper/0]initcall
> > nf_nat_ftp_init+0x0/0x24 returned 0 after 0 usecs
> > [    8.126863]
> > <5>.(5)[1:swapper/0]calling  nf_nat_irc_init+0x0/0x24 @ 1
> > [    8.127669] <5>.(5)[1:swapper/0]initcall
> > nf_nat_irc_init+0x0/0x24 returned 0 after 0 usecs
> > [    8.128698]
> > <5>.(5)[1:swapper/0]calling  nf_nat_tftp_init+0x0/0x24 @ 1
> > [    8.129512] <5>.(5)[1:swapper/0]initcall
> > nf_nat_tftp_init+0x0/0x24 returned 0 after 0 usecs
> > [    8.130551]
> > <5>.(5)[1:swapper/0]calling  nf_conncount_modinit+0x0/0x90 @ 1
> > [    8.131429] <5>.(5)[1:swapper/0]initcall
> > nf_conncount_modinit+0x0/0x90 returned 0 after 18 usecs
> > [    8.132522] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.133454] <5>.(5)[1:swapper/0]calling  xt_init+0x0/0x144 @ 1
> > [    8.134184] <5>.(5)[1:swapper/0]initcall xt_init+0x0/0x144
> > returned 0 after 3 usecs
> > [    8.135141] <5>.(5)[1:swapper/0]calling  tcpudp_mt_init+0x0/0x20
> > @ 1
> > [    8.135935] <5>.(5)[1:swapper/0]initcall tcpudp_mt_init+0x0/0x20
> > returned 0 after 1 usecs
> > [    8.136953] <5>.(5)[1:swapper/0]calling  mark_mt_init+0x0/0x5c @
> > 1
> > [    8.137723] <5>.(5)[1:swapper/0]initcall mark_mt_init+0x0/0x5c
> > returned 0 after 0 usecs
> > [    8.138719]
> > <5>.(5)[1:swapper/0]calling  connmark_mt_init+0x0/0x64 @ 1
> > [    8.139535] <5>.(5)[1:swapper/0]initcall
> > connmark_mt_init+0x0/0x64 returned 0 after 0 usecs
> > [    8.140575] <5>.(5)[1:swapper/0]calling  xt_nat_init+0x0/0x20 @
> > 1
> > [    8.141335] <5>.(5)[1:swapper/0]initcall xt_nat_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.142321]
> > <5>.(5)[1:swapper/0]calling  classify_tg_init+0x0/0x20 @ 1
> > [    8.143137] <5>.(5)[1:swapper/0]initcall
> > classify_tg_init+0x0/0x20 returned 0 after 0 usecs
> > [    8.144176]
> > <5>.(5)[1:swapper/0]calling  connsecmark_tg_init+0x0/0x1c @ 1
> > [    8.145021] <5>.(5)[1:swapper/0]initcall
> > connsecmark_tg_init+0x0/0x1c returned 0 after 0 usecs
> > [    8.146091] <5>.(5)[1:swapper/0]calling  xt_ct_tg_init+0x0/0x60
> > @ 1
> > [    8.146872] <5>.(5)[1:swapper/0]initcall xt_ct_tg_init+0x0/0x60
> > returned 0 after 0 usecs
> > [    8.147882] <5>.(5)[1:swapper/0]calling  hl_tg_init+0x0/0x20 @ 1
> > [    8.148630] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.149563] <5>.(5)[1:swapper/0]initcall hl_tg_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.150537] <5>.(5)[1:swapper/0]calling  netmap_tg_init+0x0/0x20
> > @ 1
> > [    8.151331] <5>.(5)[1:swapper/0]initcall netmap_tg_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.152348] <5>.(5)[1:swapper/0]calling  nflog_tg_init+0x0/0x1c
> > @ 1
> > [    8.153130] <5>.(5)[1:swapper/0]initcall nflog_tg_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.154136]
> > <5>.(5)[1:swapper/0]calling  nfqueue_tg_init+0x0/0x20 @ 1
> > [    8.154939] <5>.(5)[1:swapper/0]initcall
> > nfqueue_tg_init+0x0/0x20 returned 0 after 0 usecs
> > [    8.155970]
> > <5>.(5)[1:swapper/0]calling  redirect_tg_init+0x0/0x20 @ 1
> > [    8.156782] <5>.(5)[1:swapper/0]initcall
> > redirect_tg_init+0x0/0x20 returned 0 after 0 usecs
> > [    8.157821]
> > <5>.(5)[1:swapper/0]calling  secmark_tg_init+0x0/0x1c @ 1
> > [    8.158623] <5>.(5)[1:swapper/0]initcall
> > secmark_tg_init+0x0/0x1c returned 0 after 0 usecs
> > [    8.159654] <5>.(5)[1:swapper/0]calling  tproxy_tg_init+0x0/0x20
> > @ 1
> > [    8.160446] <5>.(5)[1:swapper/0]initcall tproxy_tg_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.161463] <5>.(5)[1:swapper/0]calling  tcpmss_tg_init+0x0/0x20
> > @ 1
> > [    8.162255] <5>.(5)[1:swapper/0]initcall tcpmss_tg_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.163275] <5>.(5)[1:swapper/0]calling  trace_tg_init+0x0/0x1c
> > @ 1
> > [    8.164056] <5>.(5)[1:swapper/0]initcall trace_tg_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.165063]
> > <5>.(5)[1:swapper/0]calling  idletimer_tg_init+0x0/0x120 @ 1
> > [    8.165897] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.166861] <5>.(5)[1:swapper/0]initcall
> > idletimer_tg_init+0x0/0x120 returned 0 after 31 usecs
> > [    8.167938] <5>.(5)[1:swapper/0]calling  bpf_mt_init+0x0/0x20 @
> > 1
> > [    8.168698] <5>.(5)[1:swapper/0]initcall bpf_mt_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.169682]
> > <5>.(5)[1:swapper/0]calling  comment_mt_init+0x0/0x1c @ 1
> > [    8.170485] <5>.(5)[1:swapper/0]initcall
> > comment_mt_init+0x0/0x1c returned 0 after 0 usecs
> > [    8.171516]
> > <5>.(5)[1:swapper/0]calling  connbytes_mt_init+0x0/0x1c @ 1
> > [    8.172340] <5>.(5)[1:swapper/0]initcall
> > connbytes_mt_init+0x0/0x1c returned 0 after 0 usecs
> > [    8.173389]
> > <5>.(5)[1:swapper/0]calling  connlimit_mt_init+0x0/0x1c @ 1
> > [    8.174213] <5>.(5)[1:swapper/0]initcall
> > connlimit_mt_init+0x0/0x1c returned 0 after 0 usecs
> > [    8.175266]
> > <5>.(5)[1:swapper/0]calling  conntrack_mt_init+0x0/0x20 @ 1
> > [    8.176091] <5>.(5)[1:swapper/0]initcall
> > conntrack_mt_init+0x0/0x20 returned 0 after 0 usecs
> > [    8.177140] <5>.(5)[1:swapper/0]calling  ecn_mt_init+0x0/0x20 @
> > 1
> > [    8.177899] <5>.(5)[1:swapper/0]initcall ecn_mt_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.178884] <5>.(5)[1:swapper/0]calling  esp_mt_init+0x0/0x20 @
> > 1
> > [    8.179646] <5>.(5)[1:swapper/0]initcall esp_mt_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.180631]
> > <5>.(5)[1:swapper/0]calling  hashlimit_mt_init+0x0/0xa8 @ 1
> > [    8.181472] <5>.(5)[1:swapper/0]initcall
> > hashlimit_mt_init+0x0/0xa8 returned 0 after 16 usecs
> > [    8.182534] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.183470] <5>.(5)[1:swapper/0]calling  helper_mt_init+0x0/0x1c
> > @ 1
> > [    8.184262] <5>.(5)[1:swapper/0]initcall helper_mt_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.185280] <5>.(5)[1:swapper/0]calling  hl_mt_init+0x0/0x20 @ 1
> > [    8.186029] <5>.(5)[1:swapper/0]initcall hl_mt_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.187003]
> > <5>.(5)[1:swapper/0]calling  iprange_mt_init+0x0/0x20 @ 1
> > [    8.187809] <5>.(5)[1:swapper/0]initcall
> > iprange_mt_init+0x0/0x20 returned 0 after 0 usecs
> > [    8.188837] <5>.(5)[1:swapper/0]calling  l2tp_mt_init+0x0/0x20 @
> > 1
> > [    8.189607] <5>.(5)[1:swapper/0]initcall l2tp_mt_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.190603] <5>.(5)[1:swapper/0]calling  length_mt_init+0x0/0x20
> > @ 1
> > [    8.191398] <5>.(5)[1:swapper/0]initcall length_mt_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.192415] <5>.(5)[1:swapper/0]calling  limit_mt_init+0x0/0x1c
> > @ 1
> > [    8.193195] <5>.(5)[1:swapper/0]initcall limit_mt_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.194201] <5>.(5)[1:swapper/0]calling  mac_mt_init+0x0/0x1c @
> > 1
> > [    8.194960] <5>.(5)[1:swapper/0]initcall mac_mt_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.195949]
> > <5>.(5)[1:swapper/0]calling  multiport_mt_init+0x0/0x20 @ 1
> > [    8.196773] <5>.(5)[1:swapper/0]initcall
> > multiport_mt_init+0x0/0x20 returned 0 after 0 usecs
> > [    8.197823] <5>.(5)[1:swapper/0]calling  owner_mt_init+0x0/0x1c
> > @ 1
> > [    8.198603] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.199539] <5>.(5)[1:swapper/0]initcall owner_mt_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.200546]
> > <5>.(5)[1:swapper/0]calling  physdev_mt_init+0x0/0x1c @ 1
> > [    8.201349] <5>.(5)[1:swapper/0]initcall
> > physdev_mt_init+0x0/0x1c returned 0 after 0 usecs
> > [    8.202377]
> > <5>.(5)[1:swapper/0]calling  pkttype_mt_init+0x0/0x1c @ 1
> > [    8.203183] <5>.(5)[1:swapper/0]initcall
> > pkttype_mt_init+0x0/0x1c returned 0 after 0 usecs
> > [    8.204211] <5>.(5)[1:swapper/0]calling  policy_mt_init+0x0/0x20
> > @ 1
> > [    8.205003] <5>.(5)[1:swapper/0]initcall policy_mt_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.206020] <5>.(5)[1:swapper/0]calling  quota_mt_init+0x0/0x1c
> > @ 1
> > [    8.206800] <5>.(5)[1:swapper/0]initcall quota_mt_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.207808] <5>.(5)[1:swapper/0]calling  quota_mt2_init+0x0/0xe0
> > @ 1
> > [    8.208609] <5>.(5)[1:swapper/0]initcall quota_mt2_init+0x0/0xe0
> > returned 0 after 9 usecs
> > [    8.209627] <5>.(5)[1:swapper/0]calling  realm_mt_init+0x0/0x1c
> > @ 1
> > [    8.210408] <5>.(5)[1:swapper/0]initcall realm_mt_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.211419] <5>.(5)[1:swapper/0]calling  recent_mt_init+0x0/0x8c
> > @ 1
> > [    8.212215] <5>.(5)[1:swapper/0]initcall recent_mt_init+0x0/0x8c
> > returned 0 after 3 usecs
> > [    8.213233] <5>.(5)[1:swapper/0]calling  sctp_mt_init+0x0/0x20 @
> > 1
> > [    8.214003] <5>.(5)[1:swapper/0]initcall sctp_mt_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.215000] <5>.(5)[1:swapper/0]calling  socket_mt_init+0x0/0x20
> > @ 1
> > [    8.215794] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.216728] <5>.(5)[1:swapper/0]initcall socket_mt_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.217746] <5>.(5)[1:swapper/0]calling  state_mt_init+0x0/0x1c
> > @ 1
> > [    8.218527] <5>.(5)[1:swapper/0]initcall state_mt_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.219536]
> > <5>.(5)[1:swapper/0]calling  statistic_mt_init+0x0/0x1c @ 1
> > [    8.220360] <5>.(5)[1:swapper/0]initcall
> > statistic_mt_init+0x0/0x1c returned 0 after 0 usecs
> > [    8.221410] <5>.(5)[1:swapper/0]calling  string_mt_init+0x0/0x1c
> > @ 1
> > [    8.222202] <5>.(5)[1:swapper/0]initcall string_mt_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.223224] <5>.(5)[1:swapper/0]calling  tcpmss_mt_init+0x0/0x20
> > @ 1
> > [    8.224016] <5>.(5)[1:swapper/0]initcall tcpmss_mt_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.225033] <5>.(5)[1:swapper/0]calling  time_mt_init+0x0/0x80 @
> > 1
> > [    8.225803] <5>.(5)[1:swapper/0]xt_time: kernel timezone is
> > -0000
> > [    8.226563] <5>.(5)[1:swapper/0]initcall time_mt_init+0x0/0x80
> > returned 0 after 741 usecs
> > [    8.227583] <5>.(5)[1:swapper/0]calling  u32_mt_init+0x0/0x1c @
> > 1
> > [    8.228342] <5>.(5)[1:swapper/0]initcall u32_mt_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.229329]
> > <5>.(5)[1:swapper/0]calling  gre_offload_init+0x0/0x5c @ 1
> > [    8.230143] <5>.(5)[1:swapper/0]initcall
> > gre_offload_init+0x0/0x5c returned 0 after 1 usecs
> > [    8.231186]
> > <5>.(5)[1:swapper/0]calling  sysctl_ipv4_init+0x0/0x58 @ 1
> > [    8.231999] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.232997] <5>.(5)[1:swapper/0]initcall
> > sysctl_ipv4_init+0x0/0x58 returned 0 after 63 usecs
> > [    8.234046] <5>.(5)[1:swapper/0]calling  ipip_init+0x0/0xa0 @ 1
> > [    8.234785] <5>.(5)[1:swapper/0]ipip: IPv4 and MPLS over IPv4
> > tunneling driver
> > [    8.235847] <5>.(5)[1:swapper/0]initcall ipip_init+0x0/0xa0
> > returned 0 after 1036 usecs
> > [    8.236845] <5>.(5)[1:swapper/0]calling  gre_init+0x0/0x48 @ 1
> > [    8.237570] <5>.(5)[1:swapper/0]gre: GRE over IPv4 demultiplexor
> > driver
> > [    8.238395] <5>.(5)[1:swapper/0]initcall gre_init+0x0/0x48
> > returned 0 after 804 usecs
> > [    8.239377] <5>.(5)[1:swapper/0]calling  vti_init+0x0/0x150 @ 1
> > [    8.240114] <5>.(5)[1:swapper/0]IPv4 over IPsec tunneling driver
> > [    8.240942] <5>.(5)[1:swapper/0]initcall vti_init+0x0/0x150
> > returned 0 after 807 usecs
> > [    8.241928] <5>.(5)[1:swapper/0]calling  ah4_init+0x0/0x80 @ 1
> > [    8.242656] <5>.(5)[1:swapper/0]initcall ah4_init+0x0/0x80
> > returned 0 after 1 usecs
> > [    8.243616] <5>.(5)[1:swapper/0]calling  esp4_init+0x0/0x80 @ 1
> > [    8.244355] <5>.(5)[1:swapper/0]initcall esp4_init+0x0/0x80
> > returned 0 after 0 usecs
> > [    8.245319] <5>.(5)[1:swapper/0]calling  ipcomp4_init+0x0/0x80 @
> > 1
> > [    8.246090] <5>.(5)[1:swapper/0]initcall ipcomp4_init+0x0/0x80
> > returned 0 after 0 usecs
> > [    8.247089] <5>.(5)[1:swapper/0]calling  ipip_init+0x0/0xb8 @ 1
> > [    8.247828] <5>.(5)[1:swapper/0]initcall ipip_init+0x0/0xb8
> > returned 0 after 1 usecs
> > [    8.248791] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.249723]
> > <5>.(5)[1:swapper/0]calling  xfrm4_beet_init+0x0/0x20 @ 1
> > [    8.250525] <5>.(5)[1:swapper/0]initcall
> > xfrm4_beet_init+0x0/0x20 returned 0 after 0 usecs
> > [    8.251557] <5>.(5)[1:swapper/0]calling  tunnel4_init+0x0/0x64 @
> > 1
> > [    8.252328] <5>.(5)[1:swapper/0]initcall tunnel4_init+0x0/0x64
> > returned 0 after 0 usecs
> > [    8.253325]
> > <5>.(5)[1:swapper/0]calling  xfrm4_transport_init+0x0/0x20 @ 1
> > [    8.254181] <5>.(5)[1:swapper/0]initcall
> > xfrm4_transport_init+0x0/0x20 returned 0 after 0 usecs
> > [    8.255268]
> > <5>.(5)[1:swapper/0]calling  xfrm4_mode_tunnel_init+0x0/0x20 @ 1
> > [    8.256146] <5>.(5)[1:swapper/0]initcall
> > xfrm4_mode_tunnel_init+0x0/0x20 returned 0 after 0 usecs
> > [    8.257249]
> > <5>.(5)[1:swapper/0]calling  nf_nat_l3proto_ipv4_init+0x0/0x5c @ 1
> > [    8.258150] <5>.(5)[1:swapper/0]initcall
> > nf_nat_l3proto_ipv4_init+0x0/0x5c returned 0 after 2 usecs
> > [    8.259279] <5>.(5)[1:swapper/0]calling  nf_defrag_init+0x0/0x1c
> > @ 1
> > [    8.260071] <5>.(5)[1:swapper/0]initcall nf_defrag_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.261089] <5>.(5)[1:swapper/0]calling  init+0x0/0x128 @ 1
> > [    8.261783] <5>.(5)[1:swapper/0]initcall init+0x0/0x128 returned
> > 0 after 0 usecs
> > [    8.262705]
> > <5>.(5)[1:swapper/0]calling  nf_nat_helper_pptp_init+0x0/0x88 @ 1
> > [    8.263598] <5>.(5)[1:swapper/0]initcall
> > nf_nat_helper_pptp_init+0x0/0x88 returned 0 after 0 usecs
> > [    8.264713]
> > <5>.(5)[1:swapper/0]calling  nf_nat_proto_gre_init+0x0/0x20 @ 1
> > [    8.265580] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.266513] <5>.(5)[1:swapper/0]initcall
> > nf_nat_proto_gre_init+0x0/0x20 returned 0 after 0 usecs
> > [    8.267610] <5>.(5)[1:swapper/0]calling  ip_tables_init+0x0/0xb4
> > @ 1
> > [    8.268407] <5>.(5)[1:swapper/0]initcall ip_tables_init+0x0/0xb4
> > returned 0 after 6 usecs
> > [    8.269425]
> > <5>.(5)[1:swapper/0]calling  iptable_filter_init+0x0/0x64 @ 1
> > [    8.270314] <5>.(5)[1:swapper/0]initcall
> > iptable_filter_init+0x0/0x64 returned 0 after 40 usecs
> > [    8.271402]
> > <5>.(5)[1:swapper/0]calling  iptable_mangle_init+0x0/0x88 @ 1
> > [    8.272258] <5>.(5)[1:swapper/0]initcall
> > iptable_mangle_init+0x0/0x88 returned 0 after 9 usecs
> > [    8.273329]
> > <5>.(5)[1:swapper/0]calling  iptable_nat_init+0x0/0x50 @ 1
> > [    8.274151] <5>.(5)[1:swapper/0]initcall
> > iptable_nat_init+0x0/0x50 returned 0 after 9 usecs
> > [    8.275194]
> > <5>.(5)[1:swapper/0]calling  iptable_raw_init+0x0/0xac @ 1
> > [    8.276022] <5>.(5)[1:swapper/0]initcall
> > iptable_raw_init+0x0/0xac returned 0 after 13 usecs
> > [    8.277073]
> > <5>.(5)[1:swapper/0]calling  iptable_security_init+0x0/0x88 @ 1
> > [    8.277946] <5>.(5)[1:swapper/0]initcall
> > iptable_security_init+0x0/0x88 returned 0 after 6 usecs
> > [    8.279040] <5>.(5)[1:swapper/0]calling  ah_mt_init+0x0/0x1c @ 1
> > [    8.279798] <5>.(5)[1:swapper/0]initcall ah_mt_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.280773]
> > <5>.(5)[1:swapper/0]calling  masquerade_tg_init+0x0/0x48 @ 1
> > [    8.281613] <5>.(5)[1:swapper/0]initcall
> > masquerade_tg_init+0x0/0x48 returned 0 after 5 usecs
> > [    8.282674] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.283611] <5>.(5)[1:swapper/0]calling  reject_tg_init+0x0/0x1c
> > @ 1
> > [    8.284402] <5>.(5)[1:swapper/0]initcall reject_tg_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.285419]
> > <5>.(5)[1:swapper/0]calling  arp_tables_init+0x0/0x88 @ 1
> > [    8.286227] <5>.(5)[1:swapper/0]initcall
> > arp_tables_init+0x0/0x88 returned 0 after 5 usecs
> > [    8.287260]
> > <5>.(5)[1:swapper/0]calling  arpt_mangle_init+0x0/0x1c @ 1
> > [    8.288074] <5>.(5)[1:swapper/0]initcall
> > arpt_mangle_init+0x0/0x1c returned 0 after 0 usecs
> > [    8.289113]
> > <5>.(5)[1:swapper/0]calling  arptable_filter_init+0x0/0x88 @ 1
> > [    8.289982] <5>.(5)[1:swapper/0]initcall
> > arptable_filter_init+0x0/0x88 returned 0 after 11 usecs
> > [    8.291081] <5>.(5)[1:swapper/0]calling  inet_diag_init+0x0/0x94
> > @ 1
> > [    8.291875] <5>.(5)[1:swapper/0]initcall inet_diag_init+0x0/0x94
> > returned 0 after 1 usecs
> > [    8.292892] <5>.(5)[1:swapper/0]calling  tcp_diag_init+0x0/0x1c
> > @ 1
> > [    8.293674] <5>.(5)[1:swapper/0]initcall tcp_diag_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.294681] <5>.(5)[1:swapper/0]calling  udp_diag_init+0x0/0x50
> > @ 1
> > [    8.295466] <5>.(5)[1:swapper/0]initcall udp_diag_init+0x0/0x50
> > returned 0 after 0 usecs
> > [    8.296474]
> > <5>.(5)[1:swapper/0]calling  bictcp_register+0x0/0x1c @ 1
> > [    8.297278] <5>.(5)[1:swapper/0]initcall
> > bictcp_register+0x0/0x1c returned 0 after 2 usecs
> > [    8.298307]
> > <5>.(5)[1:swapper/0]calling  cubictcp_register+0x0/0x80 @ 1
> > [    8.299131] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.300066] <5>.(5)[1:swapper/0]initcall
> > cubictcp_register+0x0/0x80 returned 0 after 0 usecs
> > [    8.301116] <5>.(5)[1:swapper/0]calling  xfrm_user_init+0x0/0x60
> > @ 1
> > [    8.301907] <5>.(5)[1:swapper/0]Initializing XFRM netlink socket
> > [    8.302664] <5>.(5)[1:swapper/0]initcall xfrm_user_init+0x0/0x60
> > returned 0 after 738 usecs
> > [    8.303707] <5>.(5)[1:swapper/0]calling  xfrmi_init+0x0/0xc8 @ 1
> > [    8.304455] <5>.(5)[1:swapper/0]IPsec XFRM device driver
> > [    8.305124] <5>.(5)[1:swapper/0]initcall xfrmi_init+0x0/0xc8
> > returned 0 after 652 usecs
> > [    8.306121] <5>.(5)[1:swapper/0]calling  inet6_init+0x0/0x328 @
> > 1
> > [    8.306974] <5>.(5)[1:swapper/0]NET: Registered protocol family
> > 10
> > [    8.308547] <5>.(5)[1:swapper/0]Segment Routing with IPv6
> > [    8.309247] <5>.(5)[1:swapper/0]initcall inet6_init+0x0/0x328
> > returned 0 after 2306 usecs
> > [    8.310265] <5>.(5)[1:swapper/0]calling  ah6_init+0x0/0x80 @ 1
> > [    8.310994] <5>.(5)[1:swapper/0]initcall ah6_init+0x0/0x80
> > returned 0 after 2 usecs
> > [    8.311975] <5>.(5)[1:swapper/0]calling  esp6_init+0x0/0x80 @ 1
> > [    8.312714] <5>.(5)[1:swapper/0]initcall esp6_init+0x0/0x80
> > returned 0 after 0 usecs
> > [    8.313678] <5>.(5)[1:swapper/0]calling  ipcomp6_init+0x0/0x80 @
> > 1
> > [    8.314449] <5>.(5)[1:swapper/0]initcall ipcomp6_init+0x0/0x80
> > returned 0 after 0 usecs
> > [    8.315450] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.316383]
> > <5>.(5)[1:swapper/0]calling  xfrm6_tunnel_init+0x0/0xf0 @ 1
> > [    8.317220] <5>.(5)[1:swapper/0]initcall
> > xfrm6_tunnel_init+0x0/0xf0 returned 0 after 12 usecs
> > [    8.318280] <5>.(5)[1:swapper/0]calling  tunnel6_init+0x0/0x7c @
> > 1
> > [    8.319056] <5>.(5)[1:swapper/0]initcall tunnel6_init+0x0/0x7c
> > returned 0 after 0 usecs
> > [    8.320053]
> > <5>.(5)[1:swapper/0]calling  xfrm6_transport_init+0x0/0x20 @ 1
> > [    8.320910] <5>.(5)[1:swapper/0]initcall
> > xfrm6_transport_init+0x0/0x20 returned 0 after 1 usecs
> > [    8.321992]
> > <5>.(5)[1:swapper/0]calling  xfrm6_mode_tunnel_init+0x0/0x20 @ 1
> > [    8.322869] <5>.(5)[1:swapper/0]initcall
> > xfrm6_mode_tunnel_init+0x0/0x20 returned 0 after 0 usecs
> > [    8.323976] <5>.(5)[1:swapper/0]calling  xfrm6_ro_init+0x0/0x20
> > @ 1
> > [    8.324756] <5>.(5)[1:swapper/0]initcall xfrm6_ro_init+0x0/0x20
> > returned 0 after 0 usecs
> > [    8.325762]
> > <5>.(5)[1:swapper/0]calling  xfrm6_beet_init+0x0/0x20 @ 1
> > [    8.326565] <5>.(5)[1:swapper/0]initcall
> > xfrm6_beet_init+0x0/0x20 returned 0 after 0 usecs
> > [    8.327596] <5>.(5)[1:swapper/0]calling  mip6_init+0x0/0xc4 @ 1
> > [    8.328333] <5>.(5)[1:swapper/0]mip6: Mobile IPv6
> > [    8.328921] <5>.(5)[1:swapper/0]initcall mip6_init+0x0/0xc4
> > returned 0 after 573 usecs
> > [    8.329906]
> > <5>.(5)[1:swapper/0]calling  ip6_tables_init+0x0/0xb4 @ 1
> > [    8.330715] <5>.(5)[1:swapper/0]initcall
> > ip6_tables_init+0x0/0xb4 returned 0 after 7 usecs
> > [    8.331746]
> > <5>.(5)[1:swapper/0]calling  ip6table_filter_init+0x0/0x64 @ 1
> > [    8.332602] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.333551] <5>.(5)[1:swapper/0]initcall
> > ip6table_filter_init+0x0/0x64 returned 0 after 16 usecs
> > [    8.334644]
> > <5>.(5)[1:swapper/0]calling  ip6table_mangle_init+0x0/0x88 @ 1
> > [    8.335517] <5>.(5)[1:swapper/0]initcall
> > ip6table_mangle_init+0x0/0x88 returned 0 after 12 usecs
> > [    8.336609]
> > <5>.(5)[1:swapper/0]calling  ip6table_raw_init+0x0/0xac @ 1
> > [    8.337448] <5>.(5)[1:swapper/0]initcall
> > ip6table_raw_init+0x0/0xac returned 0 after 15 usecs
> > [    8.338510]
> > <5>.(5)[1:swapper/0]calling  nf_nat_l3proto_ipv6_init+0x0/0x5c @ 1
> > [    8.339414] <5>.(5)[1:swapper/0]initcall
> > nf_nat_l3proto_ipv6_init+0x0/0x5c returned 0 after 1 usecs
> > [    8.340539] <5>.(5)[1:swapper/0]calling  nf_defrag_init+0x0/0x60
> > @ 1
> > [    8.341347] <5>.(5)[1:swapper/0]initcall nf_defrag_init+0x0/0x60
> > returned 0 after 16 usecs
> > [    8.342375] <5>.(5)[1:swapper/0]calling  frag_mt6_init+0x0/0x1c
> > @ 1
> > [    8.343161] <5>.(5)[1:swapper/0]initcall frag_mt6_init+0x0/0x1c
> > returned 0 after 0 usecs
> > [    8.344167]
> > <5>.(5)[1:swapper/0]calling  ipv6header_mt6_init+0x0/0x1c @ 1
> > [    8.345012] <5>.(5)[1:swapper/0]initcall
> > ipv6header_mt6_init+0x0/0x1c returned 0 after 0 usecs
> > [    8.346083]
> > <5>.(5)[1:swapper/0]calling  rpfilter_mt_init+0x0/0x1c @ 1
> > [    8.346896] <5>.(5)[1:swapper/0]initcall
> > rpfilter_mt_init+0x0/0x1c returned 0 after 0 usecs
> > [    8.347938]
> > <5>.(5)[1:swapper/0]calling  reject_tg6_init+0x0/0x1c @ 1
> > [    8.348741] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.349672] <5>.(5)[1:swapper/0]initcall
> > reject_tg6_init+0x0/0x1c returned 0 after 0 usecs
> > [    8.350700]
> > <5>.(5)[1:swapper/0]calling  vti6_tunnel_init+0x0/0x118 @ 1
> > [    8.351703] <5>.(5)[1:swapper/0]initcall
> > vti6_tunnel_init+0x0/0x118 returned 0 after 168 usecs
> > [    8.352775] <5>.(5)[1:swapper/0]calling  sit_init+0x0/0xe0 @ 1
> > [    8.353502] <5>.(5)[1:swapper/0]sit: IPv6, IPv4 and MPLS over
> > IPv4 tunneling driver
> > [    8.354544] <5>.(5)[1:swapper/0]initcall sit_init+0x0/0xe0
> > returned 0 after 1016 usecs
> > [    8.355540]
> > <5>.(5)[1:swapper/0]calling  ip6_tunnel_init+0x0/0xec @ 1
> > [    8.356433] <5>.(5)[1:swapper/0]initcall
> > ip6_tunnel_init+0x0/0xec returned 0 after 87 usecs
> > [    8.357473] <5>.(5)[1:swapper/0]calling  packet_init+0x0/0x90 @
> > 1
> > [    8.358233] <5>.(5)[1:swapper/0]NET: Registered protocol family
> > 17
> > [    8.359008] <5>.(5)[1:swapper/0]initcall packet_init+0x0/0x90
> > returned 0 after 759 usecs
> > [    8.360023]
> > <5>.(5)[1:swapper/0]calling  ipsec_pfkey_init+0x0/0x90 @ 1
> > [    8.360839] <5>.(5)[1:swapper/0]NET: Registered protocol family
> > 15
> > [    8.361609] <5>.(5)[1:swapper/0]initcall
> > ipsec_pfkey_init+0x0/0x90 returned 0 after 755 usecs
> > [    8.362669] <5>.(5)[1:swapper/0]calling  br_init+0x0/0xc8 @ 1
> > [    8.363406] <5>.(5)[1:swapper/0]initcall br_init+0x0/0xc8
> > returned 0 after 16 usecs
> > [    8.364360]
> > <5>.(5)[1:swapper/0]calling  br_netfilter_init+0x0/0xcc @ 1
> > [    8.365184] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.366123] <5>.(5)[1:swapper/0]Bridge firewalling registered
> > [    8.366838] <5>.(5)[1:swapper/0]initcall
> > br_netfilter_init+0x0/0xcc returned 0 after 705 usecs
> > [    8.367915] <5>.(5)[1:swapper/0]calling  l2tp_init+0x0/0x84 @ 1
> > [    8.368665] <5>.(5)[1:swapper/0]l2tp_core: L2TP core driver,
> > V2.0
> > [    8.369424] <5>.(5)[1:swapper/0]initcall l2tp_init+0x0/0x84
> > returned 0 after 754 usecs
> > [    8.370409] <5>.(5)[1:swapper/0]calling  pppol2tp_init+0x0/0x90
> > @ 1
> > [    8.371199] <5>.(5)[1:swapper/0]l2tp_ppp: PPPoL2TP kernel
> > driver, V2.0
> > [    8.372012] <5>.(5)[1:swapper/0]initcall pppol2tp_init+0x0/0x90
> > returned 0 after 796 usecs
> > [    8.373039]
> > <5>.(5)[1:swapper/0]calling  vlan_proto_init+0x0/0xcc @ 1
> > [    8.373841] <5>.(5)[1:swapper/0]8021q: 802.1Q VLAN Support v1.8
> > [    8.374585] <5>.(5)[1:swapper/0]initcall
> > vlan_proto_init+0x0/0xcc returned 0 after 727 usecs
> > [    8.375639] <5>.(5)[1:swapper/0]calling  sctp_init+0x0/0x588 @ 1
> > [    8.376401] <5>.(5)[1:swapper/0]sctp: Hash tables configured
> > (bind 256/256)
> > [    8.377349] <5>.(5)[1:swapper/0]initcall sctp_init+0x0/0x588
> > returned 0 after 939 usecs
> > [    8.378346] <5>.(5)[1:swapper/0]calling  sctp_diag_init+0x0/0x1c
> > @ 1
> > [    8.379146] <5>.(5)[1:swapper/0]initcall sctp_diag_init+0x0/0x1c
> > returned 0 after 1 usecs
> > [    8.380165] <5>.(5)[1:swapper/0]calling  mt6360_init+0x0/0x80 @
> > 1
> > [    8.380925] <5>.(5)[1:swapper/0]mt6360_init (2.0.3_MTK)
> > [    8.381670] <5>.(5)[1:swapper/0]mt6360_init usb_type_c node
> > found
> > [    8.382431] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.383458] <5>.(5)[1:swapper/0]mt6360_i2c_probe
> > [    8.384036] <5>.(5)[1:swapper/0]mt6360_i2c_probe I2C
> > functionality : ok
> > [    8.386457] <5>.(5)[1:swapper/0]0
> > [    8.386590] <3>.(3)[70:pd_dbg_info]///PD dbg info 481d
> > [    8.386888] <5>.(5)[1:swapper/0]pr_info : t2-t1 = 435
> > [    8.386900] <3>.(5)[1:swapper/0]1
> > [    8.387627] <5>.(3)[70:pd_dbg_info]<    8.386>0
> > [    8.387627] <5><    8.386>pd_dbg_info : t2-t1 = 15
> > [    8.387627] <5><    8.386>1
> > [    8.387627] <5><    8.386>pd_dbg_info : t2-t1 = 1
> > [    8.387627] <5><    8.386>2
> > [    8.387627] <5><    8.386>pd_dbg_
> > [    8.387636] <3>.(5)[1:swapper/0]info : t2-t1 = 0
> > [    8.387636] <3><    8.386>3
> > [    8.387636] <3><    8.386>pd_dbg_info : t2-t1 = 0
> > [    8.387636] <3><    8.386>4
> > [    8.387636] <3><    8.386>pd_dbg_info : t2-t1 = 0
> > [    8.387636] <3><    8.386>5
> > [    8.387636] <3><
> > [    8.388238] <5>.(5)[1:swapper/0]pr_info : t2-t1 = 1338
> > [    8.388665] <5>.(3)[70:pd_dbg_info]   8.386>pd_dbg_info : t2-t1
> > = 0
> > [    8.388665] <5><    8.386>6
> > [    8.388665] <5><    8.386>pd_dbg_info : t2-t1 = 0
> > [    8.388665] <5><    8.386>7
> > [    8.388665] <5><    8.386>pd_dbg_info : t2-t1 = 0
> > [    8.388676] <5>.(3)[70:pd_dbg_info]
> > [    8.388676] <5><    8.386>8
> > [    8.388676] <5><    8.386>pd_dbg_info : t2-t1 = 0
> > [    8.388676] <5><    8.386>9
> > [    8.388676] <5><    8.386>pd_dbg_info : t2-t1 = 0
> > [    8.391514] <5>.(5)[1:swapper/0]2
> > [    8.391517] <5>.(5)[1:swapper/0]pr_info : t2-t1 = 2
> > [    8.391518] <5>.(5)[1:swapper/0]3
> > [    8.391520] <5>.(5)[1:swapper/0]pr_info : t2-t1 = 1
> > [    8.391522] <5>.(5)[1:swapper/0]4
> > [    8.391524] <5>.(5)[1:swapper/0]pr_info : t2-t1 = 1
> > [    8.391526] <5>.(5)[1:swapper/0]5
> > [    8.391528] <5>.(5)[1:swapper/0]pr_info : t2-t1 = 1
> > [    8.391530] <5>.(5)[1:swapper/0]6
> > [    8.391531] <5>.(5)[1:swapper/0]pr_info : t2-t1 = 1
> > [    8.391533] <5>.(5)[1:swapper/0]7
> > [    8.391535] <5>.(5)[1:swapper/0]pr_info : t2-t1 = 1
> > [    8.391537] <5>.(5)[1:swapper/0]8
> > [    8.391539] <5>.(5)[1:swapper/0]pr_info : t2-t1 = 1
> > [    8.391541] <5>.(5)[1:swapper/0]9
> > [    8.391543] <5>.(5)[1:swapper/0]pr_info : t2-t1 = 1
> > [    8.391547] <5>.(5)[1:swapper/0]mt6360_parse_dt
> > [    8.391599] <5>.(5)[1:swapper/0]of_get_named_gpiod_flags: parsed
> > 'mt6360pd,intr_gpio' property of node '/i2c@11d01000/usb_type_c@4e[
> > 0]' - status (0)
> > [    8.400194] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.411606] <5>.(5)[1:swapper/0]usb_type_c 6-004e:
> > mt6360_i2c_probe chipID = 0x3493
> > [    8.412563] <5>.(5)[1:swapper/0]tcpc_device_register register
> > tcpc device (type_c_port0)
> > [    8.413635] <5>.(5)[1:swapper/0]PD Timer number = 59
> > [    8.414984] <5>.(5)[1:swapper/0]tcpci_timer_init : init OK
> > [    8.415728] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.416678] <5>.(5)[1:swapper/0]pd_parse_pdata
> > [    8.417244] <5>.(5)[1:swapper/0]pd_parse_pdata src pdo data =
> > [    8.417964] <5>.(5)[1:swapper/0]pd_parse_pdata 0: 0x00019096
> > [    8.418676] <5>.(5)[1:swapper/0]pd_parse_pdata snk pdo data =
> > [    8.419406] <5>.(5)[1:swapper/0]pd_parse_pdata 0: 0x000190c8
> > [    8.420117] <5>.(5)[1:swapper/0]pd_parse_pdata id vdos data =
> > [    8.420836] <5>.(5)[1:swapper/0]pd_parse_pdata 0: 0xd10029cf
> > [    8.421545] <5>.(5)[1:swapper/0]pd_parse_pdata 1: 0x00000000
> > [    8.422254] <5>.(5)[1:swapper/0]pd_parse_pdata 2: 0x63600000
> > [    8.422963] <5>.(5)[1:swapper/0]pd_parse_pdata charging_policy =
> > 49
> > [    8.423759] <5>.(5)[1:swapper/0]pd_parse_pdata_bats Battery NR =
> > 1
> > [    8.424541] <5>.(5)[1:swapper/0]pd_parse_pdata_bats
> > fix_bat_info[0].mfrs_info.vid = 0x29cf, .mfrs_info.pid = 0x6360,
> > .mfrs_string = bat1, .bat_design_cap = 3000
> > [    8.426328] <5>.(5)[1:swapper/0]pd_parse_pdata_countries get
> > country nr fail
> > [    8.427226] <5>.(5)[1:swapper/0]pd_parse_log_src_cap_ext vid =
> > 0x29cf, pid = 0x6360, xid = 0x0, fw_ver = 0x0, hw_ver = 0x0
> > [    8.428602] <5>.(5)[1:swapper/0]pd_parse_log_src_cap_ext
> > voltage_regulation = 0, hold_time_ms = 0, compliance = 0x0,
> > touch_current = 0x0, peak_current = 0 0 0
> > [    8.430362] <5>.(5)[1:swapper/0]pd_parse_log_src_cap_ext
> > touch_temp = 0, source_inputs = 0x0, batteries = 0x0, source_pdp =
> > 0x7
> > [    8.431792] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.432724] <5>.(5)[1:swapper/0]pd_parse_pdata_mfrs VID =
> > 0x29cf, PID = 0x6360
> > [    8.433624] <5>.(5)[1:swapper/0]pd_parse_pdata_mfrs PD
> > mfrs_string = RichtekTCPC
> > [    8.434548] <5>.(5)[1:swapper/0]dpm_caps: local_dr_power
> > [    8.435212] <5>.(5)[1:swapper/0]dpm_caps: local_dr_data
> > [    8.435863] <5>.(5)[1:swapper/0]dpm_caps: local_ext_power
> > [    8.436535] <5>.(5)[1:swapper/0]dpm_caps: local_usb_comm
> > [    8.437196] <5>.(5)[1:swapper/0]dpm_caps: local_usb_suspend
> > [    8.437891] <5>.(5)[1:swapper/0]dpm_caps: local_high_cap
> > [    8.438552] <5>.(5)[1:swapper/0]dpm_caps: local_give_back
> > [    8.439229] <5>.(5)[1:swapper/0]dpm_caps: local_no_suspend
> > [    8.439913] <5>.(5)[1:swapper/0]dpm_caps: local_vconn_supply
> > [    8.440617] <5>.(5)[1:swapper/0]dpm_caps:
> > attemp_discover_cable_dfp
> > [    8.441397] <5>.(5)[1:swapper/0]dpm_caps: attemp_enter_dp_mode
> > [    8.442124] <5>.(5)[1:swapper/0]dpm_caps: attemp_discover_cable
> > [    8.442861] <5>.(5)[1:swapper/0]dpm_caps: attemp_discover_id
> > [    8.443570] <5>.(5)[1:swapper/0]dpm_caps: pr_reject_as_source
> > [    8.444285] <5>.(5)[1:swapper/0]dpm_caps: pr_reject_as_sink
> > [    8.444980] <5>.(5)[1:swapper/0]dpm_caps: pr_check_gp_source
> > [    8.445685] <5>.(5)[1:swapper/0]dpm_caps: pr_check_gp_sink
> > [    8.446369] <5>.(5)[1:swapper/0]dpm_caps: dr_reject_as_dfp
> > [    8.447055] <5>.(5)[1:swapper/0]dpm_caps: dr_reject_as_ufp
> > [    8.447739] <5>.(5)[1:swapper/0]dpm_caps = 0x0000e18b
> > [    8.448471] <5>-(5)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    8.449402] <5>.(5)[1:swapper/0]dp_parse_svid_data get
> > displayport data fail
> > [    8.451004] <5>.(5)[1:swapper/0]tcpc type_c_port0: add
> > typec_mux_switch-switch
> > [    8.451133] <3>.(3)[70:pd_dbg_info]///PD dbg info 33d
> > [    8.452057] <5>.(5)[1:swapper/0]usb_type_c 6-004e:
> > mt6360_tcpcdev_init PD REV30
> > [    8.452563] <3>.(3)[70:pd_dbg_info]<    8.450>TCPC-
> > PE:pd_core_init
> > [    8.480346] <5>-(5)[0:swapper/5]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    9.416113] <5>-(5)[0:swapper/5]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    9.460350] <5>-(5)[0:swapper/5]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    9.972141] <5>-(5)[0:swapper/5]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    9.973167] <5>.(5)[1:swapper/0]usb_type_c 6-004e:
> > mt6360_init_alert name = type_c_port0, gpio = 447
> > [    9.974338] <5>.(5)[1:swapper/0]usb_type_c 6-004e:
> > mt6360_init_alert IRQ number = 127
> > [    9.976233] <1>.(1)[1:swapper/0]usb_type_c 6-004e:
> > mt6360_i2c_probe successfully!
> > [    9.977215]
> > <1>.(1)[1:swapper/0]BOOTPROF:      9977.212099:probe:
> > probe=i2c_device_probe
> > drv=usb_type_c(0xffffff80095f98e0)  1593.778158ms
> > [    9.978850] <1>.(1)[1:swapper/0]probe of 6-004e returned 1 after
> > 1595452 usecs
> > [    9.979942]
> > <1>.(1)[1:swapper/0]BOOTPROF:      9979.939099:initcall:
> > mt6360_init  1599.006158ms
> > [    9.981036] <1>.(1)[1:swapper/0]initcall mt6360_init+0x0/0x80
> > returned 0 after 1562604 usecs
> > [    9.982098] <1>-(1)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [    9.983049]
> > <1>.(1)[1:swapper/0]calling  mt8570_audio_ipi_driver_init+0x0/0x58
> > @ 1
> > [    9.984016] <1>.(1)[1:swapper/0]scp_ipi_queue_init(),
> > opendsp_id: could not found send handler for dsp 1!!
> > [    9.985321] <1>.(1)[1:swapper/0]initcall
> > mt8570_audio_ipi_driver_init+0x0/0x58 returned 0 after 1273 usecs
> > [    9.986531]
> > <1>.(1)[1:swapper/0]calling  mt6360_pmu_chg_init+0x0/0x20 @ 1
> > [    9.988710] <1>.(1)[1:swapper/0]mt6360_pmu_chg
> > mt6360_chg.2.auto: DMA mask not set
> > [    9.989685] <1>.(1)[1:swapper/0]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_pmu_chg_probe
> > [   10.036228] <1>-(1)[0:swapper/1]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   10.416475] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   10.484352] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   11.508346] <5>.(5)[0:swapper/5][mtk_net][rtnl_lock]There is no
> > process hold rtnl lock
> > [   11.508446] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   12.020396] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   12.052549] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   12.532471] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   13.556436] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   13.557773] <0>.(0)[1:swapper/0]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_chg_init_setting
> > [   13.558833] <0>.(0)[1:swapper/0]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_get_boot_mode: failed to get boot mode
> > phandle
> > [   13.570110] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   14.036555] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   14.038035] <0>.(0)[1:swapper/0]mt6360_pmu_chg
> > mt6360_chg.2.auto: __mt6360_enable_usbchgen: en = 0
> > [   14.039241] <0>.(0)[1:swapper/0]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_set_usbsw_state: state = 1
> > [   14.040452] <0>.(0)[1:swapper/0]mtk-tphy usb-phy0:
> > u2_phy_instance_set_mode_ext submode(2)
> > [   14.580473] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   14.581811] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   15.604442] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   16.052559] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   16.372439] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   16.373628] <0>.(0)[1:swapper/0]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_read_zcv: zcv = (0x00, 0x25, 46mV)
> > [   16.375616] <0>.(0)[1:swapper/0]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_chg_init_setting: BATSYSUV occurred
> > [   16.378534] <0>.(0)[7:kworker/u16:0]accdet_init() done.
> > [   16.379402]
> > <0>.(0)[7:kworker/u16:0]config_digital_init_by_mode() disable
> > digital moisture.
> > [   16.380527] <0>.(0)[7:kworker/u16:0]accdet_init_once done!
> > [   16.381228] <0>.(0)[7:kworker/u16:0]delay_init_work_callback()
> > done
> > [   16.382032] <0>-(0)[7:kworker/u16:0]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   16.384248] <6>.(6)[176:mivr_thread.mt6]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_chg_mivr_task_threadfn ++
> > [   16.385658] <0>.(0)[1:swapper/0]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_boost_set_current_limit: select otg_oc =
> > 500000
> > [   16.628383] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   17.652438] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.068558] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.084551] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.104548] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.124598] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.144603] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.164607] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.165596] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.184556] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.204556] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.224600] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.244613] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.264603] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.265591] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.284559] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.304429] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.324598] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.344594] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.364597] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.365584] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.384551] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.404549] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.424601] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.444596] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.464605] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.465594] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.484552] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.504552] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.524602] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.544604] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.564588] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.565575] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.584552] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.604555] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.624463] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.644593] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.664614] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.665602] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.681822] <0>-(0)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.704559] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.724610] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.744596] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.764596] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.765588] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.784555] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.804552] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.824594] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.844605] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.864599] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.865589] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.884546] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.904552] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.924592] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.944602] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.964599] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.965589] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   18.984549] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.004555] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.024608] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.044601] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.064599] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.065589] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.084554] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.104550] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.124604] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.144601] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.164596] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.165587] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.184550] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.204550] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.224593] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.244606] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.264599] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.265590] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.284549] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.304551] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.324601] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.344599] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.364598] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.365587] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.384555] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.404556] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.424606] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.444596] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.464591] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.465581] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.484550] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.504563] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.524595] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.544598] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.564600] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.565588] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.584552] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.604556] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.624608] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.644602] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.664598] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.665587] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.684554] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.700431] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.715135] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.731801] <0>-(0)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.743629] <0>.(0)[1:swapper/0]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_pmu_chg_probe: successfully probed
> > [   19.744908]
> > <0>.(0)[1:swapper/0]BOOTPROF:     19744.897354:probe:
> > probe=platform_drv_probe
> > drv=mt6360_pmu_chg(0xffffff8009637620)  9755.183793ms
> > [   19.746612] <0>.(0)[1:swapper/0]probe of mt6360_chg.2.auto
> > returned 1 after 9757937 usecs
> > [   19.747817]
> > <0>.(0)[1:swapper/0]BOOTPROF:     19747.808123:initcall:
> > mt6360_pmu_chg_init  9760.392639ms
> > [   19.749005] <0>-(0)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.749959] <0>.(0)[1:swapper/0]initcall
> > mt6360_pmu_chg_init+0x0/0x20 returned 0 after 9533742 usecs
> > [   19.751579] <0>.(0)[1:swapper/0]calling  init_oops_id+0x0/0x3c @
> > 1
> > [   19.752373] <0>.(0)[1:swapper/0]initcall init_oops_id+0x0/0x3c
> > returned 0 after 9 usecs
> > [   19.753387]
> > <0>.(0)[1:swapper/0]calling  sched_init_debug+0x0/0x50 @ 1
> > [   19.754278] <0>.(0)[1:swapper/0]initcall
> > sched_init_debug+0x0/0x50 returned 0 after 61 usecs
> > [   19.755372] <0>.(0)[1:swapper/0]calling  eas_stats_init+0x0/0x94
> > @ 1
> > [   19.756200] <0>.(0)[1:swapper/0]initcall eas_stats_init+0x0/0x94
> > returned 0 after 19 usecs
> > [   19.757242]
> > <0>.(0)[1:swapper/0]calling  pm_qos_power_init+0x0/0xd8 @ 1
> > [   19.758409] <0>.(0)[1:swapper/0]initcall
> > pm_qos_power_init+0x0/0xd8 returned 0 after 318 usecs
> > [   19.759532]
> > <0>.(0)[1:swapper/0]calling  pm_debugfs_init+0x0/0x34 @ 1
> > [   19.760356] <0>.(0)[1:swapper/0]initcall
> > pm_debugfs_init+0x0/0x34 returned 0 after 9 usecs
> > [   19.761391]
> > <0>.(0)[1:swapper/0]calling  wakeup_reason_init+0x0/0xf8 @ 1
> > [   19.762288] <0>.(0)[1:swapper/0]initcall
> > wakeup_reason_init+0x0/0xf8 returned 0 after 52 usecs
> > [   19.763455] <0>.(0)[55:kworker/0:1]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_charger_get_online: online = 0
> > [   19.764682] <0>.(0)[55:kworker/0:1]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_charger_get_online: online = 0
> > [   19.765891] <0>-(0)[55:kworker/0:1]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   19.766899]
> > <0>.(0)[1:swapper/0]calling  printk_late_init+0x0/0x170 @ 1
> > [   19.767802] <0>.(0)[1:swapper/0]initcall
> > printk_late_init+0x0/0x170 returned 0 after 42 usecs
> > [   19.768895] <0>.(0)[55:kworker/0:1]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_charger_get_online: online = 0
> > [   19.770136]
> > <0>.(0)[1:swapper/0]calling  tk_debug_sleep_time_init+0x0/0x4c @ 1
> > [   19.771074] <0>.(0)[1:swapper/0]initcall
> > tk_debug_sleep_time_init+0x0/0x4c returned 0 after 28 usecs
> > [   19.772218] <0>.(0)[1:swapper/0]calling  taskstats_init+0x0/0x50
> > @ 1
> > [   19.773056] <0>.(0)[1:swapper/0]registered taskstats version 1
> > [   19.773788] <0>.(0)[1:swapper/0]initcall taskstats_init+0x0/0x50
> > returned 0 after 754 usecs
> > [   19.774834]
> > <0>.(0)[1:swapper/0]calling  load_system_certificate_list+0x0/0x130
> > @ 1
> > [   19.775801] <0>.(0)[1:swapper/0]Loading compiled-in X.509
> > certificates
> > [   19.776620] <0>.(0)[1:swapper/0]initcall
> > load_system_certificate_list+0x0/0x130 returned 0 after 798 usecs
> > [   19.777827]
> > <0>.(0)[1:swapper/0]calling  fault_around_debugfs+0x0/0x48 @ 1
> > [   19.778703] <0>.(0)[1:swapper/0]initcall
> > fault_around_debugfs+0x0/0x48 returned 0 after 13 usecs
> > [   19.779812]
> > <0>.(0)[1:swapper/0]calling  max_swapfiles_check+0x0/0x8 @ 1
> > [   19.780653] <0>.(0)[1:swapper/0]initcall
> > max_swapfiles_check+0x0/0x8 returned 0 after 0 usecs
> > [   19.781719]
> > <0>.(0)[1:swapper/0]calling  check_early_ioremap_leak+0x0/0x64 @ 1
> > [   19.782623] <0>-(0)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.783573] <0>.(0)[1:swapper/0]initcall
> > check_early_ioremap_leak+0x0/0x64 returned 0 after 1 usecs
> > [   19.784703]
> > <0>.(0)[1:swapper/0]calling  set_hardened_usercopy+0x0/0x7c @ 1
> > [   19.785575] <0>.(0)[1:swapper/0]initcall
> > set_hardened_usercopy+0x0/0x7c returned 1 after 0 usecs
> > [   19.786672] <0>.(0)[1:swapper/0]calling  fscrypt_init+0x0/0xac @
> > 1
> > [   19.787579] <0>.(0)[1:swapper/0]Key type ._fscrypt registered
> > [   19.788534] <6>.(6)[1:swapper/0]Key type .fscrypt registered
> > [   19.789251] <6>.(6)[1:swapper/0]Key type fscrypt-provisioning
> > registered
> > [   19.790095] <6>.(6)[1:swapper/0]initcall fscrypt_init+0x0/0xac
> > returned 0 after 2575 usecs
> > [   19.791210] <6>.(6)[1:swapper/0]calling  fsverity_init+0x0/0x7c
> > @ 1
> > [   19.792093] <6>.(6)[1:swapper/0]initcall fsverity_init+0x0/0x7c
> > returned 0 after 94 usecs
> > [   19.793114] <6>.(6)[1:swapper/0]calling  pstore_init+0x0/0x88 @
> > 1
> > [   19.794151] <6>.(6)[1:swapper/0]pstore: Using compression:
> > deflate
> > [   19.794937] <6>.(6)[1:swapper/0]initcall pstore_init+0x0/0x88
> > returned 0 after 1038 usecs
> > [   19.795966]
> > <6>.(6)[1:swapper/0]calling  init_root_keyring+0x0/0x14 @ 1
> > [   19.796804] <6>.(6)[1:swapper/0]initcall
> > init_root_keyring+0x0/0x14 returned 0 after 12 usecs
> > [   19.797866]
> > <6>.(6)[1:swapper/0]calling  integrity_fs_init+0x0/0x10 @ 1
> > [   19.798693] <6>-(6)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.799640] <6>.(6)[1:swapper/0]initcall
> > integrity_fs_init+0x0/0x10 returned -19 after 0 usecs
> > [   19.800715] <6>.(6)[1:swapper/0]calling  prandom_reseed+0x0/0x8c
> > @ 1
> > [   19.801515] <6>.(6)[1:swapper/0]initcall prandom_reseed+0x0/0x8c
> > returned 0 after 7 usecs
> > [   19.802537]
> > <6>.(6)[1:swapper/0]calling  pinctrl_mtk_debug_v2_init+0x0/0xc8 @ 1
> > [   19.803463] <6>.(6)[1:swapper/0]initcall
> > pinctrl_mtk_debug_v2_init+0x0/0xc8 returned 0 after 7 usecs
> > [   19.804602]
> > <6>.(6)[1:swapper/0]calling  pci_resource_alignment_sysfs_init+0x0/
> > 0x24 @ 1
> > [   19.805603] <6>.(6)[1:swapper/0]initcall
> > pci_resource_alignment_sysfs_init+0x0/0x24 returned 0 after 3 usecs
> > [   19.806826] <6>.(6)[1:swapper/0]calling  pci_sysfs_init+0x0/0x60
> > @ 1
> > [   19.807627] <6>.(6)[1:swapper/0]initcall pci_sysfs_init+0x0/0x60
> > returned 0 after 1 usecs
> > [   19.808647] <6>.(6)[1:swapper/0]calling  mtk_pcie_init+0x0/0x20
> > @ 1
> > [   19.809616] <6>.(6)[1:swapper/0]probe of 112f0000.pcie returned
> > -517 after 1 usecs
> > [   19.810904] <6>.(6)[1:swapper/0]initcall mtk_pcie_init+0x0/0x20
> > returned 0 after 1437 usecs
> > [   19.811954]
> > <6>.(6)[1:swapper/0]calling  clk_debug_init+0x0/0x124 @ 1
> > [   19.815118] <6>-(6)[1:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.826105] <6>.(6)[1:swapper/0]initcall
> > clk_debug_init+0x0/0x124 returned 0 after 13016 usecs
> > [   19.827212]
> > <6>.(6)[1:swapper/0]calling  sync_state_resume_initcall+0x0/0x18 @
> > 1
> > [   19.828136] <6>.(6)[1:swapper/0]initcall
> > sync_state_resume_initcall+0x0/0x18 returned 0 after 1 usecs
> > [   19.829285]
> > <6>.(6)[1:swapper/0]calling  deferred_probe_initcall+0x0/0x1a8 @ 1
> > [   19.830305] <6>.(6)[164:kworker/6:2][cmdq] cmdq_sec_probe
> > [   19.831815] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   19.832206] <6>.(6)[164:kworker/6:2][cmdq]
> > [SEC]cmdq_sec_init_context
> > [   19.833571] <6>.(6)[164:kworker/6:2][cmdq] [SEC]init_context:
> > status:0x0
> > [   19.834407] <6>.(6)[164:kworker/6:2][cmdq] cmdq_sec_allocate_wsm
> > tee:0x000000001801cfda size:83224 idx:0
> > [   19.835677] <6>.(6)[164:kworker/6:2][cmdq] cmdq_sec_allocate_wsm
> > tee:0x000000001801cfda size:1198816 idx:1
> > [   19.836920] <6>.(6)[164:kworker/6:2][cmdq] cmdq_sec_allocate_wsm
> > tee:0x000000001801cfda size:520424 idx:2
> > [   19.838164] <6>.(6)[164:kworker/6:2][cmdq] [SEC]open_session:
> > status:0x0
> > [   19.839154] <6>.(6)[164:kworker/6:2][cmdq] cmdq_util_track_ctrl
> > cmdq:00000000dcd140b2 sec:true
> > [   19.840228] <6>.(6)[164:kworker/6:2]MMP: mmprofile_enable():
> > enable: 1
> > [   19.841055] <6>.(6)[164:kworker/6:2]MMP:
> > mmprofile_force_start(): start: 1
> > [   19.841914] <6>.(6)[164:kworker/6:2][cmdq]
> > cmdq:00000000dcd140b2(0) va:00000000d0908343 pa:0x0000000010320000
> > [   19.843185] <6>.(6)[164:kworker/6:2]probe of
> > 10320000.gce_mbox_sec returned 1 after 12932 usecs
> > [   19.844305] <6>.(6)[164:kworker/6:2][cmdq] cmdq_sec_probe
> > [   19.846287] <6>.(6)[164:kworker/6:2][cmdq]
> > [SEC]cmdq_sec_init_context
> > [   19.847119] <6>.(6)[164:kworker/6:2][cmdq] [SEC]init_context:
> > status:0x0
> > [   19.847955] <6>.(6)[164:kworker/6:2][cmdq] cmdq_sec_allocate_wsm
> > tee:0x00000000bb6c1cdc size:83224 idx:0
> > [   19.849138] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   19.850149] <6>.(6)[164:kworker/6:2][cmdq] cmdq_sec_allocate_wsm
> > tee:0x00000000bb6c1cdc size:1198816 idx:1
> > [   19.851394] <6>.(6)[164:kworker/6:2][cmdq] cmdq_sec_allocate_wsm
> > tee:0x00000000bb6c1cdc size:520424 idx:2
> > [   19.852621] <6>.(6)[164:kworker/6:2][cmdq] [SEC]open_session:
> > status:0x0
> > [   19.853512] <6>.(6)[164:kworker/6:2][cmdq] cmdq_util_track_ctrl
> > cmdq:00000000ebd1ed19 sec:true
> > [   19.854584] <6>.(6)[164:kworker/6:2]MMP: mmprofile_enable():
> > enable: 1
> > [   19.855410] <6>.(6)[164:kworker/6:2]MMP:
> > mmprofile_force_start(): start: 1
> > [   19.856266] <6>.(6)[164:kworker/6:2][cmdq]
> > cmdq:00000000ebd1ed19(1) va:00000000ab39dbe3 pa:0x0000000010330000
> > [   19.857526] <6>.(6)[164:kworker/6:2]probe of
> > 10330000.gce_mbox_d_sec returned 1 after 13239 usecs
> > [   19.858719] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > parsed 'gpio' property of node '/odm/audio_power[0]' - status (0)
> > [   20.052328] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   20.724363] <1>-(1)[0:swapper/1]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   21.748346] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   21.749305] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   21.762010]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     21762.000051:probe:
> > probe=platform_drv_probe drv=reg-fixed-
> > voltage(0xffffff80095b7cd0)  1903.282235ms
> > [   21.763824] <6>.(6)[164:kworker/6:2]probe of odm:audio_power
> > returned 1 after 1905158 usecs
> > [   21.765007] <6>.(6)[164:kworker/6:2][MDP]CMDQ driver probe begin
> > [   21.765770] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   21.766881] <6>.(6)[164:kworker/6:2][MDP][CMDQ] platform_dev:
> > dev:00000000a8b19995 PA:0x0000000010320000 VA:ffffff800ca90000
> > irqId:265 irqSecId:0
> > [   21.768536] <6>.(6)[164:kworker/6:2][MDP]set dma mask bit:34
> > result:0
> > [   21.769526] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mmsys_config):0xffffff800c3ea000
> > [   21.770515] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mmsys2_config):0xffffff800c3ec000
> > [   21.771530] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_split):0xffffff800c3ee000
> > [   21.772486] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_rdma0):0xffffff800c3f5000
> > [   21.773439] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_rdma1):0xffffff800c3fd000
> > [   21.774391] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_rdma2):0xffffff800c98c000
> > [   21.775353] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_rdma3):0xffffff800c98e000
> > [   21.776305] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_stitch):0xffffff800c9b2000
> > [   21.777264] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_fg0):0xffffff800c9b4000
> > [   21.778192] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_fg1):0xffffff800c9b6000
> > [   21.779131] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_fg2):0xffffff800c9bd000
> > [   21.780063] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_fg3):0xffffff800c9c5000
> > [   21.780993] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_hdr0):0xffffff800c9cd000
> > [   21.781931] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   21.782916] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_hdr1):0xffffff800c9d5000
> > [   21.783861] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_hdr2):0xffffff800c9dd000
> > [   21.784800] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_hdr3):0xffffff800c9e5000
> > [   21.785739] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_aal0):0xffffff800c9ed000
> > [   21.786677] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_aal1):0xffffff800c9f5000
> > [   21.787624] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_aal2):0xffffff800c9fd000
> > [   21.788562] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_aal3):0xffffff800ca05000
> > [   21.789498] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_rsz0):0xffffff800ca61000
> > [   21.790432] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_rsz1):0xffffff800ca63000
> > [   21.791370] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_rsz2):0xffffff800ca65000
> > [   21.792304] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_rsz3):0xffffff800ca6d000
> > [   21.793239] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_tdshp0):0xffffff800ca75000
> > [   21.794195] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_tdshp1):0xffffff800ca7d000
> > [   21.795155] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_tdshp2):0xffffff800ca85000
> > [   21.796114] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_tdshp3):0xffffff800ca8d000
> > [   21.797072] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_color0):0xffffff800ca95000
> > [   21.798029] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_color1):0xffffff800ca97000
> > [   21.798984] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   21.799968] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_color2):0xffffff800ca99000
> > [   21.800923] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_color3):0xffffff800ca9b000
> > [   21.801879] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_ovl0):0xffffff800ca9d000
> > [   21.802813] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_ovl1):0xffffff800ca9f000
> > [   21.803750] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_pad0):0xffffff800caa1000
> > [   21.804684] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_pad1):0xffffff800caa3000
> > [   21.805618] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_pad2):0xffffff800caa5000
> > [   21.806551] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_pad3):0xffffff800caa7000
> > [   21.807488] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_tcc0):0xffffff800caa9000
> > [   21.808423] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_tcc1):0xffffff800caab000
> > [   21.809357] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_wrot0):0xffffff800caad000
> > [   21.810301] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_wrot1):0xffffff800caaf000
> > [   21.811249] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_wrot2):0xffffff800cab1000
> > [   21.812194] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mdp_wrot3):0xffffff800cab3000
> > [   21.813139] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mm_mutex):0xffffff800cab5000
> > [   21.814071] <6>.(6)[164:kworker/6:2][MDP]DEV: VA
> > ref(mm_mutex2):0xffffff800cab7000
> > [   21.815116] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   21.816421] <6>.(6)[164:kworker/6:2][MDP]DEV: PA ref(mm_mutex):
> > start:0x000000001400f000
> > [   21.817571] <6>.(6)[164:kworker/6:2]mtk_mdp 14001000.mdp_rdma0:
> > Linked as a consumer to regulator.3
> > [   21.818699] <6>.(6)[164:kworker/6:2][MDP]i:0, freq:218000000
> > [   21.819410] <6>.(6)[164:kworker/6:2][MDP]i:1, freq:312000000
> > [   21.820116] <6>.(6)[164:kworker/6:2][MDP]i:2, freq:416000000
> > [   21.820821] <6>.(6)[164:kworker/6:2][MDP]i:3, freq:594000000
> > [   21.822764] <6>.(6)[164:kworker/6:2][MDP]chan 11
> > 0x00000000c4916618 dev:0x00000000a8b19995
> > [   21.825002] <6>.(6)[164:kworker/6:2][MDP]chan 12
> > 0x000000003e406df5 dev:0x00000000a8b19995
> > [   21.826670] <6>.(6)[164:kworker/6:2][MDP]chan 13
> > 0x0000000066a2aabf dev:0x00000000a8b19995
> > [   21.832119] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   21.833137] <6>.(6)[164:kworker/6:2][MDP]chan 14
> > 0x00000000d3e2f899 dev:0x00000000a8b19995
> > [   21.834967] <6>.(6)[164:kworker/6:2][MDP]chan 16
> > 0x00000000f849ac62 dev:0x00000000a8b19995
> > [   21.840706] <6>.(6)[164:kworker/6:2][MDP]chan 21
> > 0x0000000029a25023 dev:0x00000000a8b19995
> > [   21.846563] <6>.(6)[164:kworker/6:2][MDP]chan 22
> > 0x000000009137fdc3 dev:0x00000000a8b19995
> > [   21.847692] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:7 @cmdq_mbox_create,181
> > [   21.848849] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   21.849828] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:8 @cmdq_mbox_create,181
> > [   21.850976] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:9 @cmdq_mbox_create,181
> > [   21.852130] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:10 @cmdq_mbox_create,181
> > [   21.853288] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:11 @cmdq_mbox_create,181
> > [   21.854446] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:12 @cmdq_mbox_create,181
> > [   21.855608] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:13 @cmdq_mbox_create,181
> > [   21.856766] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:14 @cmdq_mbox_create,181
> > [   21.857925] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:15 @cmdq_mbox_create,181
> > [   21.859087] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:16 @cmdq_mbox_create,181
> > [   21.860245] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:17 @cmdq_mbox_create,181
> > [   21.861403] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:18 @cmdq_mbox_create,181
> > [   21.862561] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:19 @cmdq_mbox_create,181
> > [   21.863722] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:20 @cmdq_mbox_create,181
> > [   21.864880] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:21 @cmdq_mbox_create,181
> > [   21.866039] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   21.867015] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:22 @cmdq_mbox_create,181
> > [   21.868175] <6>.(6)[164:kworker/6:2][cmdq][err] channel request
> > fail:-19, idx:23 @cmdq_mbox_create,181
> > [   21.869354] <6>.(6)[164:kworker/6:2][MDP]available thread pool:
> > max:24
> > [   21.882036] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   21.898646] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   21.916143] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   21.932349] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   21.952202] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   21.964314] <6>.(6)[164:kworker/6:2]MMP: mmprofile_enable():
> > enable: 1
> > [   21.965149] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   21.966150] <6>.(6)[164:kworker/6:2]MMP:
> > mmprofile_force_start(): start: 1
> > [   21.967019] <6>.(6)[164:kworker/6:2][MDP]cmdq_mdp_init
> > [   21.977043]
> > <6>.(6)[164:kworker/6:2][MDP]cmdq_core_register_status_dump
> > notifier:0x0000000095de7b5d
> > [   21.978444] <6>.(6)[164:kworker/6:2][MDP]MDP limit dev create
> > end
> > [   21.979254] <6>.(6)[164:kworker/6:2][MDP]CMDQ driver probe end
> > [   21.980020]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     21980.016743:probe:
> > probe=platform_drv_probe
> > drv=mtk_mdp(0xffffff80095ed3a0)   214.996616ms
> > [   21.981645] <6>.(6)[164:kworker/6:2]probe of 14001000.mdp_rdma0
> > returned 1 after 216713 usecs
> > [   21.982718] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   21.983812] <6>.(6)[164:kworker/6:2]mediatek,mt7921_consys
> > odm:consys7921: GPIO lookup for consumer 3v3
> > [   21.984985] <6>.(6)[164:kworker/6:2]mediatek,mt7921_consys
> > odm:consys7921: using device tree for GPIO lookup
> > [   21.986226] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > parsed '3v3-gpios' property of node '/odm/consys7921[0]' - status
> > (0)
> > [   22.068350] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   22.772267] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   22.773449] <6>.(6)[164:kworker/6:2]mediatek,mt7921_consys
> > odm:consys7921: GPIO lookup for consumer pmu
> > [   22.774631] <6>.(6)[164:kworker/6:2]mediatek,mt7921_consys
> > odm:consys7921: using device tree for GPIO lookup
> > [   22.775977] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > parsed 'pmu-gpios' property of node '/odm/consys7921[0]' - status
> > (0)
> > [   23.474824] <6>-(6)[0:swapper/6][thread:0] 1970-01-01
> > 00:00:23.451755 UTC;android time 1970-01-01 00:00:23.451755
> > [   23.476208] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   23.796344] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   24.052319] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   24.053356]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     24053.350672:probe:
> > probe=platform_drv_probe
> > drv=mediatek,mt7921_consys(0xffffff80095efbc0)  2069.521159ms
> > [   24.055211] <6>.(6)[164:kworker/6:2]probe of odm:consys7921
> > returned 1 after 2071440 usecs
> > [   24.056317] <6>.(6)[164:kworker/6:2]probe of ion returned -517
> > after 1 usecs
> > [   24.058767] <6>.(6)[164:kworker/6:2]mtk-tphy usb-phy1: Dropping
> > the link to 1000c000.syscon
> > [   24.059886] <6>.(6)[164:kworker/6:2]probe of usb-phy1 returned 1
> > after 2647 usecs
> > [   24.060924] <6>.(6)[164:kworker/6:2]mtk-pcie-phy 11e80000.phy0:
> > pcie pipe_clk not found
> > [   24.062089] <6>.(6)[164:kworker/6:2]probe of 11e80000.phy0
> > returned 1 after 1209 usecs
> > [   24.063356] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs: Linked
> > as a consumer to 1100b000.lvts
> > [   24.064544] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs: Linked
> > as a consumer to 13000000.mali
> > [   24.065633] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.066615] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs: fail
> > to get svs platform data: -517
> > [   24.067702] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs:
> > Dropping the link to 13000000.mali
> > [   24.068757] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs:
> > Dropping the link to 1100b000.lvts
> > [   24.069821] <6>.(6)[164:kworker/6:2]probe of 1100b000.svs
> > returned 0 after 6628 usecs
> > [   24.071364] <6>.(6)[164:kworker/6:2]mtk-smi-common 14012000.smi:
> > Linked as a consumer to 14018000.mm-iommu
> > [   24.073004] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 1c019000.larb (ops 0xffffff8008fdf788)
> > [   24.074244] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 1c103000.larb (ops 0xffffff8008fdf788)
> > [   24.075498] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 14013000.larb (ops 0xffffff8008fdf788)
> > [   24.076737] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 14f03000.larb (ops 0xffffff8008fdf788)
> > [   24.077975] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 14e05000.larb (ops 0xffffff8008fdf788)
> > [   24.079227] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 15340000.larb (ops 0xffffff8008fdf788)
> > [   24.080464] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 16002000.larb (ops 0xffffff8008fdf788)
> > [   24.081700] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 16012000.larb (ops 0xffffff8008fdf788)
> > [   24.082936] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.083919] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 17201000.larb (ops 0xffffff8008fdf788)
> > [   24.085156] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 1b010000.larb (ops 0xffffff8008fdf788)
> > [   24.086391] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 1803e000.larb (ops 0xffffff8008fdf788)
> > [   24.087633] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 1800e000.larb (ops 0xffffff8008fdf788)
> > [   24.088869] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 16142000.larb (ops 0xffffff8008fdf788)
> > [   24.090105] <6>.(6)[164:kworker/6:2]mtk-iommu 14018000.mm-iommu: 
> > bound 16014000.larb (ops 0xffffff8008fdf788)
> > [   24.091353]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     24091.352210:probe:
> > probe=platform_drv_probe drv=mtk-
> > iommu(0xffffff80095c30d8)    20.178846ms
> > [   24.092963] <6>.(6)[164:kworker/6:2]probe of 14018000.mm-iommu
> > returned 1 after 21811 usecs
> > [   24.094035] <6>.(6)[164:kworker/6:2]probe of 19010000.apu-iommu
> > returned -517 after 0 usecs
> > [   24.095106] <6>.(6)[164:kworker/6:2]probe of 19015000.apu-iommu
> > returned -517 after 0 usecs
> > [   24.096295] <6>.(6)[164:kworker/6:2]mtk-smi-common 1c01b000.smi:
> > Linked as a consumer to 1c01f000.mm-iommu
> > [   24.097691] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 1c018000.larb (ops 0xffffff8008fdf788)
> > [   24.098926] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.099910] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 1c102000.larb (ops 0xffffff8008fdf788)
> > [   24.101145] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 14f02000.larb (ops 0xffffff8008fdf788)
> > [   24.102379] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 14e04000.larb (ops 0xffffff8008fdf788)
> > [   24.103617] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 15001000.larb (ops 0xffffff8008fdf788)
> > [   24.104852] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 15120000.larb (ops 0xffffff8008fdf788)
> > [   24.106087] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 15230000.larb (ops 0xffffff8008fdf788)
> > [   24.107325] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 16001000.larb (ops 0xffffff8008fdf788)
> > [   24.108560] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 16013000.larb (ops 0xffffff8008fdf788)
> > [   24.109795] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 1a010000.larb (ops 0xffffff8008fdf788)
> > [   24.111030] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 1802e000.larb (ops 0xffffff8008fdf788)
> > [   24.112266] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 1800d000.larb (ops 0xffffff8008fdf788)
> > [   24.113501] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 16141000.larb (ops 0xffffff8008fdf788)
> > [   24.114736] <6>.(6)[164:kworker/6:2]mtk-iommu 1c01f000.mm-iommu: 
> > bound 16015000.larb (ops 0xffffff8008fdf788)
> > [   24.115972] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.116950]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     24116.949979:probe:
> > probe=platform_drv_probe drv=mtk-
> > iommu(0xffffff80095c30d8)    20.753077ms
> > [   24.118556] <6>.(6)[164:kworker/6:2]probe of 1c01f000.mm-iommu
> > returned 1 after 22370 usecs
> > [   24.119780] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1c01a000.vdosys_config to group 0
> > [   24.120810] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Linked as a consumer to 1c018000.larb
> > [   24.122121] <6>.(6)[164:kworker/6:2]probe of
> > 1c01a000.vdosys_config returned 0 after 2497 usecs
> > [   24.123373] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1c000000.disp_ovl to group 0
> > [   24.124348] <6>.(6)[164:kworker/6:2]mediatek-disp-ovl
> > 1c000000.disp_ovl: Linked as a consumer to 1c018000.larb
> > [   24.125650] <6>.(6)[164:kworker/6:2]mediatek-disp-ovl
> > 1c000000.disp_ovl: mtk_ddp_comp_set_larb: DDP_COMPONENT_OVL0 need
> > larb device
> > [   24.127129] <6>.(6)[164:kworker/6:2]DDP_COMPONENT_OVL0: smi-id:0
> > [   24.127887] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=0
> > [   24.129117] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.129995] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.131003] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.132013] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.133004] <6>.(6)[164:kworker/6:2]probe of 1c000000.disp_ovl
> > returned 1 after 9681 usecs
> > [   24.134099] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1c00a000.disp_ovl to group 0
> > [   24.135078] <6>.(6)[164:kworker/6:2]mediatek-disp-ovl
> > 1c00a000.disp_ovl: Linked as a consumer to 1c019000.larb
> > [   24.136366] <6>.(6)[164:kworker/6:2]mediatek-disp-ovl
> > 1c00a000.disp_ovl: mtk_ddp_comp_set_larb: DDP_COMPONENT_OVL1 need
> > larb device
> > [   24.137835] <6>.(6)[164:kworker/6:2]DDP_COMPONENT_OVL1: smi-id:1
> > [   24.138584] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=1
> > [   24.138828] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.138829] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.138830] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.142701] <6>.(6)[164:kworker/6:2]probe of 1c00a000.disp_ovl
> > returned 1 after 8645 usecs
> > [   24.143784] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1c002000.disp_rdma to group 0
> > [   24.144770] <6>.(6)[164:kworker/6:2]mediatek-disp-rdma
> > 1c002000.disp_rdma: Linked as a consumer to 1c018000.larb
> > [   24.146077] <6>.(6)[164:kworker/6:2]mediatek-disp-rdma
> > 1c002000.disp_rdma: mtk_ddp_comp_set_larb: DDP_COMPONENT_RDMA0 need
> > larb device
> > [   24.147584] <6>.(6)[164:kworker/6:2]DDP_COMPONENT_RDMA0: smi-
> > id:0
> > [   24.148358] <6>.(6)[164:kworker/6:2]probe of 1c002000.disp_rdma
> > returned 1 after 4600 usecs
> > [   24.149397] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.150411] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1c00c000.disp_rdma to group 0
> > [   24.151401] <6>.(6)[164:kworker/6:2]mediatek-disp-rdma
> > 1c00c000.disp_rdma: Linked as a consumer to 1c019000.larb
> > [   24.152703] <6>.(6)[164:kworker/6:2]mediatek-disp-rdma
> > 1c00c000.disp_rdma: mtk_ddp_comp_set_larb: DDP_COMPONENT_RDMA1 need
> > larb device
> > [   24.154206] <6>.(6)[164:kworker/6:2]DDP_COMPONENT_RDMA1: smi-
> > id:1
> > [   24.154976] <6>.(6)[164:kworker/6:2]probe of 1c00c000.disp_rdma
> > returned 1 after 4580 usecs
> > [   24.156021] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=2
> > [   24.156265] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.156266] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.156267] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.160168] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1c001000.disp_wdma to group 0
> > [   24.161153] <6>.(6)[164:kworker/6:2]mediatek-disp-wdma
> > 1c001000.disp_wdma: Linked as a consumer to 1c018000.larb
> > [   24.162424] <6>.(6)[164:kworker/6:2]mtk_disp_wdma_probe+
> > [   24.163124] <6>.(6)[164:kworker/6:2]mediatek-disp-wdma
> > 1c001000.disp_wdma: mtk_ddp_comp_set_larb: DDP_COMPONENT_WDMA0 need
> > larb device
> > [   24.164627] <6>.(6)[164:kworker/6:2]DDP_COMPONENT_WDMA0: smi-
> > id:0
> > [   24.165386] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.166370] <6>.(6)[164:kworker/6:2]mtk_disp_wdma_probe-
> > [   24.167036] <6>.(6)[164:kworker/6:2]probe of 1c001000.disp_wdma
> > returned 1 after 6888 usecs
> > [   24.168118] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1c00b000.disp_wdma to group 0
> > [   24.169104] <6>.(6)[164:kworker/6:2]mediatek-disp-wdma
> > 1c00b000.disp_wdma: Linked as a consumer to 1c019000.larb
> > [   24.170373] <6>.(6)[164:kworker/6:2]mtk_disp_wdma_probe+
> > [   24.171071] <6>.(6)[164:kworker/6:2]mediatek-disp-wdma
> > 1c00b000.disp_wdma: mtk_ddp_comp_set_larb: DDP_COMPONENT_WDMA1 need
> > larb device
> > [   24.172576] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=3
> > [   24.172817] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.172818] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.172819] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.176673] <6>.(6)[164:kworker/6:2]DDP_COMPONENT_WDMA1: smi-
> > id:1
> > [   24.177440] <6>.(6)[164:kworker/6:2]mtk_disp_wdma_probe-
> > [   24.178105] <6>.(6)[164:kworker/6:2]probe of 1c00b000.disp_wdma
> > returned 1 after 9999 usecs
> > [   24.179298] <6>.(6)[164:kworker/6:2]mt8195-pinctrl
> > 10005000.pinctrl: pin_config_group_set op failed for group 108
> > [   24.180575] <6>.(6)[164:kworker/6:2]panel-boe-tv101wum-nl6
> > 1c008000.disp_dsi0.0: Error applying setting, reverse things back
> > [   24.181969] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.182953] <6>.(6)[164:kworker/6:2]panel-boe-tv101wum-nl6
> > 1c008000.disp_dsi0.0: GPIO lookup for consumer avdd
> > [   24.184203] <6>.(6)[164:kworker/6:2]panel-boe-tv101wum-nl6
> > 1c008000.disp_dsi0.0: using device tree for GPIO lookup
> > [   24.185502] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > parsed 'avdd-gpios' property of node '/disp_dsi0@1c008000/panel@0[0
> > ]' - status (0)
> > [   24.187122] <6>.(6)[164:kworker/6:2]gpio gpiochip0: Persistence
> > not supported for GPIO 138
> > [   24.188154] <6>.(6)[164:kworker/6:2]panel-boe-tv101wum-nl6
> > 1c008000.disp_dsi0.0: GPIO lookup for consumer avee
> > [   24.189398] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=4
> > [   24.189635] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.189635] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.189636] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.193491] <6>.(6)[164:kworker/6:2]panel-boe-tv101wum-nl6
> > 1c008000.disp_dsi0.0: using device tree for GPIO lookup
> > [   24.194780] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > parsed 'avee-gpios' property of node '/disp_dsi0@1c008000/panel@0[0
> > ]' - status (0)
> > [   24.196396] <6>.(6)[164:kworker/6:2]gpio gpiochip0: Persistence
> > not supported for GPIO 139
> > [   24.197464] <6>.(6)[164:kworker/6:2]panel-boe-tv101wum-nl6
> > 1c008000.disp_dsi0.0: Linked as a consumer to regulator.57
> > [   24.198783] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.200056] <6>.(6)[164:kworker/6:2]panel-boe-tv101wum-nl6
> > 1c008000.disp_dsi0.0: GPIO lookup for consumer enable
> > [   24.201327] <6>.(6)[164:kworker/6:2]panel-boe-tv101wum-nl6
> > 1c008000.disp_dsi0.0: using device tree for GPIO lookup
> > [   24.202628] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > parsed 'enable-gpios' property of node '/disp_dsi0@1c008000/panel@0
> > [0]' - status (0)
> > [   24.204291] <6>.(6)[164:kworker/6:2]gpio gpiochip0: Persistence
> > not supported for GPIO 108
> > [   24.205322] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=5
> > [   24.205577] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.205579] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.205581] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.209453] <6>.(6)[164:kworker/6:2]panel-boe-tv101wum-nl6
> > 1c008000.disp_dsi0.0: GPIO lookup for consumer leden
> > [   24.210708] <6>.(6)[164:kworker/6:2]panel-boe-tv101wum-nl6
> > 1c008000.disp_dsi0.0: using device tree for GPIO lookup
> > [   24.212001] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > parsed 'leden-gpios' property of node '/disp_dsi0@1c008000/panel@0[
> > 0]' - status (0)
> > [   24.213626] <6>.(6)[164:kworker/6:2]gpio gpiochip0: Persistence
> > not supported for GPIO 137
> > [   24.214669]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     24214.668441:probe:
> > probe=mipi_dsi_drv_probe drv=panel-boe-tv101wum-
> > nl6(0xffffff80095d9c00)    31.710154ms
> > [   24.216412] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.217395] <6>.(6)[164:kworker/6:2]probe of
> > 1c008000.disp_dsi0.0 returned 1 after 38184 usecs
> > [   24.218597]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     24218.596518:probe:
> > probe=platform_drv_probe drv=mtk-
> > dsi(0xffffff80095cb280)    39.409615ms
> > [   24.220184] <6>.(6)[164:kworker/6:2]mtk-dsi 1c008000.disp_dsi0:
> > Dropping the link to 10005000.pinctrl
> > [   24.221334] <6>.(6)[164:kworker/6:2]mtk-dsi 1c008000.disp_dsi0:
> > Dropping the link to mt6360_ldo.5.auto
> > [   24.222492] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=6
> > [   24.222737] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.222738] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.222739] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.226600] <6>.(6)[164:kworker/6:2]probe of 1c008000.disp_dsi0
> > returned 1 after 47425 usecs
> > [   24.227719] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1c104000.disp_pseudo_ovl0 to group 0
> > [   24.228784] <6>.(6)[164:kworker/6:2]mediatek-disp-pseudo-ovl
> > 1c104000.disp_pseudo_ovl0: Linked as a consumer to 1c102000.larb
> > [   24.230243] <6>.(6)[164:kworker/6:2]mediatek-disp-pseudo-ovl
> > 1c104000.disp_pseudo_ovl0: mtk_ddp_comp_set_larb:
> > DDP_COMPONENT_PSEUDO_OVL need larb device
> > [   24.231944] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.232919] <6>.(6)[164:kworker/6:2]DDP_COMPONENT_PSEUDO_OVL:
> > smi-id:0
> > [   24.233821] <6>.(6)[164:kworker/6:2]probe of
> > 1c104000.disp_pseudo_ovl0 returned 1 after 6129 usecs
> > [   24.234985] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1c114000.disp_ethdr to group 0
> > [   24.235986] <6>.(6)[164:kworker/6:2]mediatek-disp-ethdr
> > 1c114000.disp_ethdr: Linked as a consumer to 1c103000.larb
> > [   24.237318] <6>.(6)[164:kworker/6:2]mediatek-disp-ethdr
> > 1c114000.disp_ethdr: mtk_ddp_comp_set_larb: DDP_COMPONENT_ETHDR
> > need larb device
> > [   24.238843] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=7
> > [   24.239084] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.239086] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.239087] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.242942] <6>.(6)[164:kworker/6:2]DDP_COMPONENT_ETHDR: smi-
> > id:1
> > [   24.243767] <6>.(6)[164:kworker/6:2]probe of 1c114000.disp_ethdr
> > returned 1 after 8802 usecs
> > [   24.244869] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > vdosys0_client to group 0
> > [   24.245812] <6>.(6)[164:kworker/6:2]mediatek-disp-power
> > vdosys0_client: Linked as a consumer to 1c018000.larb
> > [   24.247066] <6>.(6)[164:kworker/6:2]probe of vdosys0_client
> > returned 1 after 2221 usecs
> > [   24.248139] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > disp_pseudo_ovl_l2 to group 0
> > [   24.249125] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.250100] <6>.(6)[164:kworker/6:2]mtk-pseudo-ovl-larb
> > disp_pseudo_ovl_l2: Linked as a consumer to 1c102000.larb
> > [   24.251405] <6>.(6)[164:kworker/6:2]probe of disp_pseudo_ovl_l2
> > returned 1 after 3316 usecs
> > [   24.252498] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > disp_pseudo_ovl_l3 to group 0
> > [   24.253485] <6>.(6)[164:kworker/6:2]mtk-pseudo-ovl-larb
> > disp_pseudo_ovl_l3: Linked as a consumer to 1c103000.larb
> > [   24.254781] <6>.(6)[164:kworker/6:2]probe of disp_pseudo_ovl_l3
> > returned 1 after 2311 usecs
> > [   24.255826] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=8
> > [   24.256065] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.256067] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.256069] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.259953] <6>.(6)[164:kworker/6:2]probe of ged returned -517
> > after 0 usecs
> > [   24.260868] <6>.(6)[164:kworker/6:2][GPU/DVFS]
> > @__mt_gpufreq_pdrv_probe start
> > [   24.262155] <6>.(6)[164:kworker/6:2]gpufreq gpufreq: Linked as a
> > consumer to regulator.49
> > [   24.263200] <6>.(6)[164:kworker/6:2]gpufreq gpufreq: Linked as a
> > consumer to regulator.29
> > [   24.264396] <6>.(6)[164:kworker/6:2][GPU/DVFS] Preloader init
> > freq is 700000
> > [   24.265274] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.266609] <6>.(6)[164:kworker/6:2][GPU/DVFS]
> > @__mt_gpufreq_pdrv_probe done
> > [   24.267500] <6>.(6)[164:kworker/6:2]probe of gpufreq returned 1
> > after 6644 usecs
> > [   24.268452] <6>.(6)[164:kworker/6:2]probe of 13000000.mali
> > returned -517 after 0 usecs
> > [   24.269511] <6>.(6)[164:kworker/6:2]apusys-power-controller
> > apusys-power-controller: Linked as a consumer to regulator.41
> > [   24.270973] <6>.(6)[164:kworker/6:2]apusys-power-controller
> > apusys-power-controller: try devm_regulator_get on apusys_top
> > [   24.272341] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=9
> > [   24.272577] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.272578] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.272579] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.276466] <6>.(6)[164:kworker/6:2]apusys-power-controller
> > apusys-power-controller: Linked as a consumer to regulator.13
> > [   24.278001] <6>.(6)[164:kworker/6:2]apusys-power-controller
> > apusys-power-controller: genpd add domains apusys_top
> > [   24.279284] <6>.(6)[164:kworker/6:2]apusys-power-controller
> > apusys-power-controller: try devm_regulator_get on apusys_vpu0
> > [   24.280684] <6>.(6)[164:kworker/6:2]apusys-power-controller
> > apusys-power-controller: genpd add domains apusys_vpu0
> > [   24.281970] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.282945] <6>.(6)[164:kworker/6:2]apusys-power-controller
> > apusys-power-controller: try devm_regulator_get on apusys_vpu1
> > [   24.284326] <6>.(6)[164:kworker/6:2]apusys-power-controller
> > apusys-power-controller: genpd add domains apusys_vpu1
> > [   24.285615] <6>.(6)[164:kworker/6:2]apusys-power-controller
> > apusys-power-controller: try devm_regulator_get on apusys_dla0
> > [   24.286991] <6>.(6)[164:kworker/6:2]apusys-power-controller
> > apusys-power-controller: genpd add domains apusys_dla0
> > [   24.288285] <6>.(6)[164:kworker/6:2]apusys-power-controller
> > apusys-power-controller: try devm_regulator_get on apusys_dla1
> > [   24.289658] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=10
> > [   24.289895] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.289896] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.289897] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.293768] <6>.(6)[164:kworker/6:2]apusys-power-controller
> > apusys-power-controller: genpd add domains apusys_dla1
> > [   24.295064]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     24295.063980:probe:
> > probe=platform_drv_probe drv=apusys-power-
> > controller(0xffffff80095e1e08)    25.583462ms
> > [   24.296816] <6>.(6)[164:kworker/6:2]apusys-power-controller
> > apusys-power-controller: Dropping the link to 190f3000.syscon
> > [   24.298183] <6>.(6)[164:kworker/6:2]probe of apusys-power-
> > controller returned 1 after 28712 usecs
> > [   24.299287] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.301899] <6>.(6)[164:kworker/6:2]probe of
> > 190f1000.apusys_power returned 1 after 1600 usecs
> > [   24.303124] <6>.(6)[164:kworker/6:2]probe of
> > 19021000.apusys_reviser returned -517 after 1 usecs
> > [   24.304751] <6>.(6)[164:kworker/6:2]probe of
> > 1906e000.apusys_mnoc returned 1 after 446 usecs
> > [   24.305814] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=11
> > [   24.306428] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.306431] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.306435] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.310397] <6>.(6)[164:kworker/6:2][apusys]mdw_probe +
> > [   24.311066] <6>.(6)[164:kworker/6:2][apusys]mdw_probe
> > [mdw_probe] g_ion_device is NULL
> > [   24.312066] <6>.(6)[164:kworker/6:2]probe of apusys returned 0
> > after 1698 usecs
> > [   24.313076] <6>.(6)[164:kworker/6:2]apusys_sample apusys_sample:
> > [sample_probe] apusys_init = 0
> > [   24.314166] <6>.(6)[164:kworker/6:2]probe of apusys_sample
> > returned 0 after 1106 usecs
> > [   24.315172] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.316186] <6>.(6)[164:kworker/6:2]probe of 19025000.edma0
> > returned -517 after 0 usecs
> > [   24.317201] <6>.(6)[164:kworker/6:2]probe of 19026000.edma1
> > returned -517 after 0 usecs
> > [   24.318226] <6>.(6)[164:kworker/6:2]edma edma: [edma_probe]
> > apusys_init = 0
> > [   24.319099] <6>.(6)[164:kworker/6:2]probe of edma returned 0
> > after 881 usecs
> > [   24.320058] <6>.(6)[164:kworker/6:2]scp_dvfs_pdrv_probe()
> > [   24.320750] <6>.(6)[164:kworker/6:2]scp_dvfs scp-dvfs.0: Linked
> > as a consumer to regulator.4
> > [   24.321827] <6>.(6)[164:kworker/6:2]scp_dvfs scp-dvfs.0: Linked
> > as a consumer to regulator.14
> > [   24.322888] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=12
> > [   24.323132] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.323133] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.323134] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.327010] <6>.(6)[164:kworker/6:2]SCP_VREQ_VAO pinmux setting
> > is correct - 0x55511111
> > [   24.328096] <6>.(6)[164:kworker/6:2]probe of scp-dvfs.0 returned
> > 1 after 8047 usecs
> > [   24.329125] <6>.(6)[164:kworker/6:2][cmdq] gce
> > dev:000000002c49545f va:00000000534f8856 pa:0x0000000010320000
> > [   24.330419] <6>.(6)[58:kworker/6:1]apusys_power
> > 190f1000.apusys_power: Linked as a consumer to regulator.41
> > [   24.331653] <6>.(6)[58:kworker/6:1]apusys_power
> > 190f1000.apusys_power: Linked as a consumer to regulator.13
> > [   24.332865] <6>-(6)[58:kworker/6:1]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.333840] <6>.(6)[58:kworker/6:1]apusys_power
> > 190f1000.apusys_power: Linked as a consumer to regulator.12
> > [   24.337210] <6>.(6)[58:kworker/6:1][apu_power_2.0][error]
> > find_out_device_by_user empty list
> > [   24.338572] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=13
> > [   24.339767] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.340602] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   24.341567] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   24.343161] <6>.(6)[164:kworker/6:2][cmdq] cmdq_test_probe
> > test:00000000aba4591a dev:000000002e73aed1 clt:00000000144fee14
> > loop:00000000387207d3 sec:000000006d374135
> > [   24.345015] <6>.(6)[164:kworker/6:2][cmdq] subsys[0]:99
> > [   24.345668] <6>.(6)[164:kworker/6:2][cmdq] subsys[1]:0
> > [   24.346336]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     24346.335057:probe:
> > probe=platform_drv_probe drv=cmdq-
> > test(0xffffff80095ed120)    17.231077ms
> > [   24.347983] <6>.(6)[164:kworker/6:2]probe of cmdq-test returned
> > 1 after 18894 usecs
> > [   24.348942] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.350035] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > mdp_larb4 to group 1
> > [   24.350930] <6>.(6)[164:kworker/6:2]mdp-larb mdp_larb4: Linked
> > as a consumer to 14013000.larb
> > [   24.352082] <6>.(6)[164:kworker/6:2]probe of mdp_larb4 returned
> > 1 after 2103 usecs
> > [   24.353175] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > mdp_larb5 to group 1
> > [   24.354067] <6>.(6)[164:kworker/6:2]mdp-larb mdp_larb5: Linked
> > as a consumer to 14f02000.larb
> > [   24.355157] <6>.(6)[164:kworker/6:2]probe of mdp_larb5 returned
> > 1 after 2081 usecs
> > [   24.356106] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=14
> > [   24.356370] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.356371] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.356374] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.360307] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > mdp_larb6 to group 1
> > [   24.361198] <6>.(6)[164:kworker/6:2]mdp-larb mdp_larb6: Linked
> > as a consumer to 14f03000.larb
> > [   24.362267] <6>.(6)[164:kworker/6:2]probe of mdp_larb6 returned
> > 1 after 1985 usecs
> > [   24.363307] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 14e02000.wpe to group 1
> > [   24.364230] <6>.(6)[164:kworker/6:2]vpp-wpe 14e02000.wpe: Linked
> > as a consumer to 14e04000.larb
> > [   24.365313] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.366337] <6>.(6)[164:kworker/6:2][WPE][WPE_probe] - E. WPE
> > driver probe.
> > [   24.366343] <6>.(6)[164:kworker/6:2][WPE][WPE_probe] clk_cnt:25
> > [   24.368010] <6>.(6)[164:kworker/6:2][WPE][WPE_probe]
> > nr_WPE_devs=1, devnode(wpe)
> > [   24.368930] <6>.(6)[164:kworker/6:2][WPE][WPE_RegCharDev] - E.
> > [   24.368934] <6>.(6)[164:kworker/6:2][WPE][WPE_RegCharDev] - X.
> > [   24.369822] <6>.(6)[164:kworker/6:2]vpp-wpe 14e02000.wpe: Linked
> > as a consumer to regulator.3
> > [   24.371617] <6>.(6)[164:kworker/6:2][WPE][WPE_probe] - X. WPE
> > driver probe.
> > [   24.371626] <6>.(6)[164:kworker/6:2]probe of 14e02000.wpe
> > returned 1 after 8365 usecs
> > [   24.372496] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=15
> > [   24.372745] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.372746] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.372747] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.377671] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 14e03000.wpe to group 1
> > [   24.378594] <6>.(6)[164:kworker/6:2]vpp-wpe 14e03000.wpe: Linked
> > as a consumer to 14e05000.larb
> > [   24.379687] <6>.(6)[164:kworker/6:2][WPE][WPE_probe] - E. WPE
> > driver probe.
> > [   24.379693] <6>.(6)[164:kworker/6:2][WPE][WPE_probe] clk_cnt:24
> > [   24.381345] <6>.(6)[164:kworker/6:2][WPE][WPE_probe]
> > nr_WPE_devs=2, devnode(wpe)
> > [   24.382267] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   24.383245] <6>.(6)[164:kworker/6:2][WPE][WPE_probe] - X. WPE
> > driver probe.
> > [   24.383251] <6>.(6)[164:kworker/6:2]probe of 14e03000.wpe
> > returned 1 after 5609 usecs
> > [   24.385157] <6>.(6)[164:kworker/6:2]fusb304 odm:fusb304: Linked
> > as a consumer to regulator.17
> > [   24.386635] <6>.(6)[164:kworker/6:2]fusb304 odm:fusb304: GPIO
> > lookup for consumer enable
> > [   24.387650] <6>.(6)[164:kworker/6:2]fusb304 odm:fusb304: using
> > device tree for GPIO lookup
> > [   24.388680] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=16
> > [   24.388925] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.388927] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   24.388928] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   24.392803] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > parsed 'enable-gpios' property of node '/odm/fusb304[0]' - status
> > (0)
> > [   24.820076] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=17
> > [   24.821648] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.822489] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   24.823459] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   24.824453] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   24.825392] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=18
> > [   24.826923] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   24.827763] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   24.828732] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   25.844301] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=19
> > [   25.845886] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   25.846727] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   25.847696] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   25.848684] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   26.068281] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=20
> > [   26.069864] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   26.070706] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   26.071675] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   26.072659] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   26.073635] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=21
> > [   26.075165] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   26.076005] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   26.076973] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   26.078024] <6>.(6)[164:kworker/6:2]fusb304 odm:fusb304: GPIO
> > lookup for consumer sel
> > [   26.079001] <6>.(6)[164:kworker/6:2]fusb304 odm:fusb304: using
> > device tree for GPIO lookup
> > [   26.080089] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > parsed 'sel-gpios' property of node '/odm/fusb304[0]' - status (0)
> > [   26.868098] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=22
> > [   26.869674] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   26.870516] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   26.871486] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   26.872476] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   26.873454] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=23
> > [   26.874988] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   26.875827] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   26.876795] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   27.892298] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=24
> > [   27.893886] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   27.894727] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   27.895696] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   27.896685] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   28.084278] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=25
> > [   28.085863] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   28.086703] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   28.087673] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   28.088657] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   28.089627] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=26
> > [   28.091164] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   28.092004] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   28.092972] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   28.094010] <6>.(6)[164:kworker/6:2]fusb304 odm:fusb304:
> > fusb304_switch_set 0
> > [   28.916261] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=27
> > [   28.917838] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   28.918679] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   28.919649] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   28.920636] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   28.921613] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=28
> > [   28.923147] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   28.923988] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   28.924956] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   29.940299] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=29
> > [   29.941884] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   29.942726] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   29.943696] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   29.944686] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   29.945735] <6>.(6)[164:kworker/6:2]fusb304 odm:fusb304:
> > fusb304_probe done
> > [   29.946639]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     29946.634916:probe:
> > probe=platform_drv_probe
> > drv=fusb304(0xffffff80095f9ed8)  5561.471167ms
> > [   29.948346] <6>.(6)[164:kworker/6:2]probe of odm:fusb304
> > returned 1 after 5563217 usecs
> > [   29.949350] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   29.950621] <6>.(6)[164:kworker/6:2]hifi4dsp-8570: release
> > mt8570 hw sysrst by pulling corresponding pin to high
> > [   29.951917] <6>.(6)[164:kworker/6:2]hifi4dsp-8570 hifi4dsp_8570:
> > GPIO lookup for consumer mt8570_reset
> > [   29.953081] <6>.(6)[164:kworker/6:2]hifi4dsp-8570 hifi4dsp_8570:
> > using device tree for GPIO lookup
> > [   29.954203] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=30
> > [   29.954807] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   29.954810] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   29.954814] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   29.958725] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > parsed 'mt8570_reset-gpios' property of node '/hifi4dsp_8570[0]' -
> > status (0)
> > [   30.068248] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=31
> > [   30.069701] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   30.070540] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   30.071508] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   30.072511] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=32
> > [   30.074045] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   30.074884] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   30.075853] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   30.076833] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   30.964280] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=33
> > [   30.965859] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   30.966699] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   30.967670] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   30.968693] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   31.988297] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=34
> > [   31.989884] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   31.990726] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   31.991695] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   31.992683] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   31.993822]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     31993.817306:probe:
> > probe=platform_drv_probe drv=hifi4dsp-
> > 8570(0xffffff80095faa58)  2043.172158ms
> > [   31.995603] <6>.(6)[164:kworker/6:2]probe of hifi4dsp_8570
> > returned 1 after 2045041 usecs
> > [   31.997809] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: Cannot get CSR clock
> > [   31.998847] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   31.999863] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: no reset control found
> > [   32.000934] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: GPIO lookup for consumer 3v3
> > [   32.002054] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: using device tree for GPIO lookup
> > [   32.003230] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=35
> > [   32.003839] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   32.003843] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   32.003846] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   32.007769] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > parsed '3v3-gpios' property of node '/ethernet@11021000[0]' -
> > status (0)
> > [   32.084264] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=36
> > [   32.085773] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   32.086613] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   32.087583] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   32.088565] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   32.089538] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=37
> > [   32.091072] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   32.091911] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   32.092879] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   33.012286] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=38
> > [   33.013868] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   33.014709] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   33.015679] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   33.016666] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   34.036292] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=39
> > [   34.037880] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   34.038722] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   34.039692] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   34.040681] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   34.041752] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: GPIO lookup for consumer 1v8
> > [   34.042872] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: using device tree for GPIO lookup
> > [   34.044156] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > can't parse '1v8-gpios' property of node '/ethernet@11021000[0]'
> > [   34.045582] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > can't parse '1v8-gpio' property of node '/ethernet@11021000[0]'
> > [   34.046997] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: using lookup tables for GPIO lookup
> > [   34.048206] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: No GPIO consumer 1v8 found
> > [   34.049305] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   34.050290] <6>.(6)[164:kworker/6:2]------------[ cut here ]--
> > ----------
> > [   34.051177] <6>-(6)[164:kworker/6:2]WARNING: CPU: 6 PID: 164 at
> > devm_gpiod_put+0x64/0x70
> > [   34.052188] <6>-(6)[164:kworker/6:2]Modules linked in:
> > [   34.052842] <6>-(6)[164:kworker/6:2]CPU: 6 PID: 164 Comm:
> > kworker/6:2 Tainted: G S                4.19.127+ #6
> > [   34.054091] <6>-(6)[164:kworker/6:2]Hardware name:
> > MT8195V/C(ENG) (DT)
> > [   34.054922] <6>-(6)[164:kworker/6:2]Workqueue: events
> > deferred_probe_work_func
> > [   34.055829] <6>-(6)[164:kworker/6:2]pstate: 60c00009 (nZCv daif
> > +PAN +UAO)
> > [   34.056692] <6>-(6)[164:kworker/6:2]pc :
> > devm_gpiod_put+0x64/0x70
> > [   34.057457] <6>-(6)[164:kworker/6:2]lr :
> > devm_gpiod_put+0x64/0x70
> > [   34.058220] <6>-(6)[164:kworker/6:2]sp : ffffff800c3e3a70
> > [   34.058896] <6>-(6)[164:kworker/6:2]x29: ffffff800c3e3a80 x28:
> > 0000000000000402
> > [   34.059823] <6>-(6)[164:kworker/6:2]x27: ffffff800950e018 x26:
> > 00000000ffe7590d
> > [   34.060749] <6>-(6)[164:kworker/6:2]x25: ffffff80096b4000 x24:
> > ffffff8009025fa8
> > [   34.061676] <6>-(6)[164:kworker/6:2]x23: ffffffc1e048ee80 x22:
> > 0000000000000000
> > [   34.062601] <6>-(6)[164:kworker/6:2]x21: 0000000000000007 x20:
> > 0000000000000000
> > [   34.063526] <6>-(6)[164:kworker/6:2]x19: ffffffc1e5692010 x18:
> > 0000000000003874
> > [   34.064451] <6>-(6)[164:kworker/6:2]x17: 0000000000000000 x16:
> > ffffff8008ee9bd4
> > [   34.065377] <6>-(6)[164:kworker/6:2]x15: ffffff80090fdbaf x14:
> > 000000000000003f
> > [   34.066302] <6>-(6)[164:kworker/6:2]x13: 0000000000000d34 x12:
> > 0000000000000000
> > [   34.067227] <6>-(6)[164:kworker/6:2]x11: 0000000000000000 x10:
> > ffffffffffffffff
> > [   34.068152] <6>-(6)[164:kworker/6:2]x9 : 44fa49f344eccc00 x8 :
> > 44fa49f344eccc00
> > [   34.069077] <6>-(6)[164:kworker/6:2]x7 : 63205b2d2d2d2d2d x6 :
> > ffffff800978fe58
> > [   34.070002] <6>-(6)[164:kworker/6:2]x5 : 00000000000000a4 x4 :
> > 000000000000000c
> > [   34.070928] <6>-(6)[164:kworker/6:2]x3 : 000000000000004c x2 :
> > 0000000000000001
> > [   34.071854] <6>-(6)[164:kworker/6:2]x1 : 0000000000000000 x0 :
> > 0000000000000039
> > [   34.072781] <6>-(6)[164:kworker/6:2]Call trace:
> > [   34.073354] <6>-(6)[164:kworker/6:2] devm_gpiod_put+0x64/0x70
> > [   34.074081] <6>-(6)[164:kworker/6:2]
> > external_phy_power_ctrl+0x9c/0xb4
> > [   34.074900] <6>-(6)[164:kworker/6:2]
> > mediatek_dwmac_init+0x1c0/0x1fc
> > [   34.075699] <6>-(6)[164:kworker/6:2]
> > mediatek_dwmac_probe+0x338/0x41c
> > [   34.076509] <6>-(6)[164:kworker/6:2]
> > platform_drv_probe+0x7c/0xb4
> > [   34.077273] <6>-(6)[164:kworker/6:2] really_probe+0x500/0x6c0
> > [   34.077995] <6>-(6)[164:kworker/6:2]
> > driver_probe_device+0xbc/0x13c
> > [   34.078783] <6>-(6)[164:kworker/6:2]
> > __device_attach_driver+0x11c/0x1b8
> > [   34.079614] <6>-(6)[164:kworker/6:2] bus_for_each_drv+0x7c/0xc4
> > [   34.080357] <6>-(6)[164:kworker/6:2] __device_attach+0xbc/0x180
> > [   34.081101] <6>-(6)[164:kworker/6:2]
> > device_initial_probe+0x10/0x18
> > [   34.081887] <6>-(6)[164:kworker/6:2] bus_probe_device+0x30/0x90
> > [   34.082630] <6>-(6)[164:kworker/6:2]
> > deferred_probe_work_func+0xa0/0xf8
> > [   34.083462] <6>-(6)[164:kworker/6:2]
> > process_one_work+0x274/0x438
> > [   34.084227] <6>-(6)[164:kworker/6:2] worker_thread+0x30c/0x4a8
> > [   34.084960] <6>-(6)[164:kworker/6:2] kthread+0x114/0x124
> > [   34.085629] <6>-(6)[164:kworker/6:2] ret_from_fork+0x10/0x18
> > [   34.086340] <6>-(6)[164:kworker/6:2]---[ end trace
> > 9f4d9a97f2dc25fb ]---
> > [   34.087183] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=40
> > [   34.088769] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   34.089653] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   34.090664] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   34.091692] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   34.093379] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: User ID: 0x11, Synopsys ID: 0x51
> > [   34.094549] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet:        DWMAC4/5
> > [   34.095475] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: DMA HW capability register supported
> > [   34.096677] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: RX Checksum Offload Engine supported
> > [   34.097878] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: TX Checksum insertion supported
> > [   34.099028] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   34.100009] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: Wake-Up On Lan supported
> > [   34.101102] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: TSO supported
> > [   34.102059] <6>.(6)[164:kworker/6:2]dwmac-mediatek
> > 11021000.ethernet: Using 40 bits DMA width
> > [   34.103123] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=41
> > [   34.103419] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   34.103420] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   34.103422] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   34.107377] <6>.(6)[164:kworker/6:2]mdio_bus stmmac-0: GPIO
> > lookup for consumer reset
> > [   34.108352] <6>.(6)[164:kworker/6:2]mdio_bus stmmac-0: using
> > device tree for GPIO lookup
> > [   34.109362] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > can't parse 'reset-gpios' property of node '/ethernet@11021000/mdio
> > [0]'
> > [   34.110855] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > can't parse 'reset-gpio' property of node '/ethernet@11021000/mdio[
> > 0]'
> > [   34.112340] <6>.(6)[164:kworker/6:2]mdio_bus stmmac-0: using
> > lookup tables for GPIO lookup
> > [   34.113368] <6>.(6)[164:kworker/6:2]mdio_bus stmmac-0: No GPIO
> > consumer reset found
> > [   34.114331] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > parsed 'snps,reset-gpio' property of node '/ethernet@11021000[0]' -
> > status (0)
> > [   34.115902] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   35.060097] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=42
> > [   35.061678] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   35.062519] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   35.063488] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   35.064480] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   35.065452] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   35.828356] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=43
> > [   35.829937] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   35.830778] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   35.831747] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   35.832726] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   36.084301] <2>-(2)[0:swapper/2]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   36.085300] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=44
> > [   36.088200] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   36.089057] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   36.090041] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   37.108304] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=45
> > [   37.109898] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.110741] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   37.111711] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   37.112697] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   37.113732] <6>.(6)[164:kworker/6:2]libphy: stmmac: probed
> > [   37.115154] <0>-(0)[225:kworker/u16:0]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.116803] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > can't parse 'reset-gpios' property of node '/ethernet@11021000
> > /mdio/eth_phy0@1[0]'
> > [   37.118428] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=46
> > [   37.118968] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.118972] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.118975] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.123067] <6>.(6)[164:kworker/6:2]probe of stmmac-0:01
> > returned 1 after 50 usecs
> > [   37.124673] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > can't parse 'reset-gpios' property of node '/ethernet@11021000
> > /mdio/eth_phy2@4[0]'
> > [   37.126427] <6>.(6)[164:kworker/6:2]probe of stmmac-0:04
> > returned 1 after 31 usecs
> > [   37.127845] <6>.(6)[164:kworker/6:2][mtk_net][rtnl_unlock]
> > rtnl_lock is held by [1] from [8374583096] to [37127840780]
> > [   37.129240]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     37129.237087:probe:
> > probe=platform_drv_probe drv=dwmac-
> > mediatek(0xffffff8009605530)  5131.821012ms
> > [   37.130919] <6>.(6)[164:kworker/6:2]probe of 11021000.ethernet
> > returned 1 after 5134021 usecs
> > [   37.132006] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.133348] <6>.(6)[164:kworker/6:2]xhci-mtk 11290000.xhci30:
> > Linked as a consumer to regulator.1
> > [   37.134509] <6>.(6)[164:kworker/6:2]xhci-mtk 11290000.xhci30:
> > Linked as a consumer to regulator.19
> > [   37.135631] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=47
> > [   37.136128] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.136130] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.136133] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.140458] <6>.(6)[164:kworker/6:2]mtk-tphy usb-phy1:
> > u2_phy_pll_26m_set
> > [   37.141324] <6>.(6)[164:kworker/6:2]phy phy-usb-phy1.5:
> > u2_phy_props_set, bc12:0, src:0, vrt:0, term:0, rev6:1, dis:0
> > [   37.143125] <6>.(6)[164:kworker/6:2]mtk-tphy usb-phy1:
> > u2_phy_instance_set_mode_ext submode(2)
> > [   37.144211] <6>.(6)[164:kworker/6:2]xhci-mtk 11290000.xhci30:
> > xHCI Host Controller
> > [   37.145166] <6>.(6)[164:kworker/6:2]xhci-mtk 11290000.xhci30:
> > new USB bus registered, assigned bus number 3
> > [   37.146592] <6>.(6)[164:kworker/6:2]xhci-mtk 11290000.xhci30:
> > hcc params 0x01400f99 hci version 0x110 quirks 0x0000000000210010
> > [   37.148055] <6>.(6)[164:kworker/6:2]xhci-mtk 11290000.xhci30:
> > irq 293, io mem 0x11290000
> > [   37.149066] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.150326] <6>.(6)[164:kworker/6:2]hub 3-0:1.0: USB hub found
> > [   37.151073] <6>.(6)[164:kworker/6:2]hub 3-0:1.0: 1 port detected
> > [   37.151826] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=48
> > [   37.152176] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.152178] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.152180] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.156113] <6>.(6)[164:kworker/6:2]probe of 3-0:1.0 returned 1
> > after 5794 usecs
> > [   37.157056] <6>.(6)[164:kworker/6:2]probe of usb3 returned 1
> > after 6786 usecs
> > [   37.157957] <6>.(6)[164:kworker/6:2]xhci-mtk 11290000.xhci30:
> > xHCI Host Controller
> > [   37.158901] <6>.(6)[164:kworker/6:2]xhci-mtk 11290000.xhci30:
> > new USB bus registered, assigned bus number 4
> > [   37.160122] <6>.(6)[164:kworker/6:2]xhci-mtk 11290000.xhci30:
> > Host supports USB 3.2 Enhanced SuperSpeed
> > [   37.161304] <6>.(6)[164:kworker/6:2]usb usb4: We don't know the
> > algorithms for LPM for this host, disabling LPM.
> > [   37.162652] <6>.(6)[164:kworker/6:2]hub 4-0:1.0: USB hub found
> > [   37.163391] <6>.(6)[164:kworker/6:2]hub 4-0:1.0: 1 port detected
> > [   37.164168] <6>.(6)[164:kworker/6:2]probe of 4-0:1.0 returned 1
> > after 1518 usecs
> > [   37.165104] <6>.(6)[164:kworker/6:2]probe of usb4 returned 1
> > after 2478 usecs
> > [   37.165994] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.166985]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     37166.983857:probe:
> > probe=platform_drv_probe drv=xhci-
> > mtk(0xffffff800960b2d8)    33.708077ms
> > [   37.168582] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=49
> > [   37.168881] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.168882] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.168884] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.172761] <6>.(6)[164:kworker/6:2]probe of 11290000.xhci30
> > returned 1 after 39511 usecs
> > [   37.173935] <6>.(6)[164:kworker/6:2][VCU] vdec_log_info
> > 000000003248c1c4 1024 vcuid 0 vcu_ptr 00000000903ca4e0
> > [   37.181799] <4>-(4)[0:swapper/4]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   37.185074] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=50
> > [   37.186622] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.186824] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.187463] <6>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   37.187467] <6>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   37.190629] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.191822] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.192993] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.194162] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.195335] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.196504] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.197674] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.198849] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.199829] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.200999] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.202175] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=51
> > [   37.202477] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.202478] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.202480] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.206347] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.207518] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.208688] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.209857] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.211026] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.212197] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.213367] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.214536] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.215707] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.216683] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.217852] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.219020] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=52
> > [   37.219274] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.219275] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.219276] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.223143] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.224311] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.225480] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.226649] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.227822] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.228991] <6>.(6)[164:kworker/6:2][cmdq][err] can't parse gce-
> > events property @cmdq_dev_get_event,367
> > [   37.230160] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:venc_cmdq_pause_done
> > @cmdq_dev_get_event,361
> > [   37.231697] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:venc_mb_done
> > @cmdq_dev_get_event,361
> > [   37.233146] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.234121] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:venc_128B_cnt_done
> > @cmdq_dev_get_event,361
> > [   37.235635] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=53
> > [   37.235870] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.235871] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.235871] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.239788] <6>.(6)[164:kworker/6:2]mtk_vcu 18000000.vcu: [VCU]
> > Data extend memory (len:3145728) phy=0x220000000
> > virt=0x000000002ac948e6 iova=0x0
> > [   37.241409] <6>.(6)[164:kworker/6:2]mtk_vcu 18000000.vcu: [VCU]
> > initialization completed
> > [   37.242421]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     37242.419857:probe:
> > probe=platform_drv_probe
> > drv=mtk_vcu(0xffffff800961a368)    68.491923ms
> > [   37.244022] <6>.(6)[164:kworker/6:2]probe of 18000000.vcu
> > returned 1 after 70115 usecs
> > [   37.245165] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 18000000.vdec to group 2
> > [   37.246099] <6>.(6)[164:kworker/6:2]mtk-vcodec-dec
> > 18000000.vdec: Linked as a consumer to 1800e000.larb
> > [   37.248403] <6>.(6)[164:kworker/6:2][MTK_V4L2] level=0
> > mtk_vcodec_dec_probe(),385: decoder registered as /dev/video0
> > [   37.248473] <1>-(1)[234:mtk-vcodec-dec]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.249859] <6>.(6)[164:kworker/6:2]mtk-vcodec-dec
> > 18000000.vdec: Linked as a consumer to regulator.3
> > [   37.251902] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=54
> > [   37.252140] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.252142] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.252143] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.256290] <6>.(6)[164:kworker/6:2]probe of 18000000.vdec
> > returned 1 after 11189 usecs
> > [   37.257570] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > vdec_l21 to group 2
> > [   37.258450] <6>.(6)[164:kworker/6:2]mtk-vdec-larb vdec_l21:
> > Linked as a consumer to 1802e000.larb
> > [   37.259663] <6>.(6)[164:kworker/6:2][MTK_V4L2][ERROR]
> > mtk_vdec_larb_probe:363: mtk_vdec_larb_probe enable larb 21
> > [   37.259663] <6>
> > [   37.261162] <6>.(6)[164:kworker/6:2]probe of vdec_l21 returned 1
> > after 3788 usecs
> > [   37.262224] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > vdec_l22 to group 2
> > [   37.263111] <6>.(6)[164:kworker/6:2]mtk-vdec-larb vdec_l22:
> > Linked as a consumer to 1803e000.larb
> > [   37.264274] <6>.(6)[164:kworker/6:2][MTK_V4L2][ERROR]
> > mtk_vdec_larb_probe:363: mtk_vdec_larb_probe enable larb 22
> > [   37.264274] <6>
> > [   37.265767] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.266746] <6>.(6)[164:kworker/6:2]probe of vdec_l22 returned 1
> > after 4600 usecs
> > [   37.267751] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > vdec_l23 to group 2
> > [   37.268631] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=55
> > [   37.268875] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.268876] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.268877] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.272746] <6>.(6)[164:kworker/6:2]mtk-vdec-larb vdec_l23:
> > Linked as a consumer to 1800e000.larb
> > [   37.273894] <6>.(6)[164:kworker/6:2][MTK_V4L2][ERROR]
> > mtk_vdec_larb_probe:363: mtk_vdec_larb_probe enable larb 23
> > [   37.273894] <6>
> > [   37.275395] <6>.(6)[164:kworker/6:2]probe of vdec_l23 returned 1
> > after 7668 usecs
> > [   37.276550] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > vdec_l24 to group 2
> > [   37.277430] <6>.(6)[164:kworker/6:2]mtk-vdec-larb vdec_l24:
> > Linked as a consumer to 1800d000.larb
> > [   37.278540] <6>.(6)[164:kworker/6:2][MTK_V4L2][ERROR]
> > mtk_vdec_larb_probe:363: mtk_vdec_larb_probe enable larb 24
> > [   37.278540] <6>
> > [   37.280040] <6>.(6)[164:kworker/6:2]probe of vdec_l24 returned 1
> > after 3666 usecs
> > [   37.281041] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1a020000.venc to group 2
> > [   37.281974] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.282952] <6>.(6)[164:kworker/6:2]mtk-vcodec-enc
> > 1a020000.venc: Linked as a consumer to 1a010000.larb
> > [   37.284907] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=56
> > [   37.287736] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.288591] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   37.289208] <6>.(6)[164:kworker/6:2][MTK_V4L2] level=0
> > mtk_vcodec_enc_probe(),358: encoder registered as /dev/video1
> > [   37.289575] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   37.291216] <6>.(6)[164:kworker/6:2]mtk-vcodec-enc
> > 1a020000.venc: Linked as a consumer to regulator.3
> > [   37.293862] <6>.(6)[164:kworker/6:2]probe of 1a020000.venc
> > returned 1 after 12845 usecs
> > [   37.295770] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > venc_l19 to group 2
> > [   37.296658] <6>.(6)[164:kworker/6:2]mtk-venc-larb venc_l19:
> > Linked as a consumer to 1a010000.larb
> > [   37.297784] <6>.(6)[164:kworker/6:2][MTK_V4L2][ERROR]
> > mtk_venc_larb_probe:246: mtk_venc_larb_probe enable larb 19
> > [   37.297784] <6>
> > [   37.299284] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.300289] <6>.(6)[164:kworker/6:2]probe of venc_l19 returned 1
> > after 5275 usecs
> > [   37.301367] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > venc_l20 to group 2
> > [   37.302245] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=57
> > [   37.302485] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.302486] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.302487] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.306357] <6>.(6)[164:kworker/6:2]mtk-venc-larb venc_l20:
> > Linked as a consumer to 1b010000.larb
> > [   37.307469] <6>.(6)[164:kworker/6:2][MTK_V4L2][ERROR]
> > mtk_venc_larb_probe:246: mtk_venc_larb_probe enable larb 20
> > [   37.307469] <6>
> > [   37.308964] <6>.(6)[164:kworker/6:2]probe of venc_l20 returned 1
> > after 7700 usecs
> > [   37.309994] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1a030000.jpgenc to group 2
> > [   37.310948] <6>.(6)[164:kworker/6:2]mtk-jpeg 1a030000.jpgenc:
> > Linked as a consumer to 1a010000.larb
> > [   37.312182] <6>.(6)[164:kworker/6:2]mtk-jpeg 1a030000.jpgenc:
> > jpeg enc device registered as /dev/video2 (81,2)
> > [   37.313430] <6>.(6)[164:kworker/6:2]probe of 1a030000.jpgenc
> > returned 1 after 3493 usecs
> > [   37.314556] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1a040000.jpgdec to group 2
> > [   37.315514] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.316490] <6>.(6)[164:kworker/6:2]mtk-jpeg 1a040000.jpgdec:
> > Linked as a consumer to 1a010000.larb
> > [   37.317657] <6>.(6)[164:kworker/6:2]mtk-jpeg 1a040000.jpgdec:
> > jpeg dec device registered as /dev/video3 (81,3)
> > [   37.318903] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=58
> > [   37.319148] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.319150] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.319151] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.323021] <6>.(6)[164:kworker/6:2]probe of 1a040000.jpgdec
> > returned 1 after 8540 usecs
> > [   37.324148] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1a050000.jpgdec to group 2
> > [   37.325102] <6>.(6)[164:kworker/6:2]mtk-jpeg 1a050000.jpgdec:
> > Linked as a consumer to 1a010000.larb
> > [   37.326265] <6>.(6)[164:kworker/6:2]mtk-jpeg 1a050000.jpgdec:
> > jpeg dec device registered as /dev/video4 (81,4)
> > [   37.327517] <6>.(6)[164:kworker/6:2]probe of 1a050000.jpgdec
> > returned 1 after 3447 usecs
> > [   37.328594] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1b030000.jpgenc to group 2
> > [   37.329547] <6>.(6)[164:kworker/6:2]mtk-jpeg 1b030000.jpgenc:
> > Linked as a consumer to 1b010000.larb
> > [   37.330713] <6>.(6)[164:kworker/6:2]mtk-jpeg 1b030000.jpgenc:
> > jpeg enc device registered as /dev/video5 (81,5)
> > [   37.331962] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.332941] <6>.(6)[164:kworker/6:2]probe of 1b030000.jpgenc
> > returned 1 after 4376 usecs
> > [   37.334027] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 1b040000.jpgdec to group 2
> > [   37.334982] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=59
> > [   37.335215] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.335217] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.335217] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.339087] <6>.(6)[164:kworker/6:2]mtk-jpeg 1b040000.jpgdec:
> > Linked as a consumer to 1b010000.larb
> > [   37.340253] <6>.(6)[164:kworker/6:2]mtk-jpeg 1b040000.jpgdec:
> > jpeg dec device registered as /dev/video6 (81,6)
> > [   37.341500] <6>.(6)[164:kworker/6:2]probe of 1b040000.jpgdec
> > returned 1 after 7509 usecs
> > [   37.342544] <6>.(6)[164:kworker/6:2]probe of hcp@0 returned -517
> > after 0 usecs
> > [   37.343498] <6>.(6)[164:kworker/6:2]probe of 15000000.imgsys_fw
> > returned -517 after 0 usecs
> > [   37.344596] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 15320000.ipesys_me to group 1
> > [   37.345584] <6>.(6)[164:kworker/6:2]camera-me
> > 15320000.ipesys_me: Linked as a consumer to 15340000.larb
> > [   37.346757] <6>.(6)[164:kworker/6:2]mtk imgsys me probe start
> > [   37.347489] <6>.(6)[164:kworker/6:2]mtk imgsys me probe done
> > [   37.348198] <6>.(6)[164:kworker/6:2]probe of 15320000.ipesys_me
> > returned 1 after 3627 usecs
> > [   37.349237] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.350378] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > camisp_l13 to group 1
> > [   37.351284] <6>.(6)[164:kworker/6:2]mtk-cam-larb camisp_l13:
> > Linked as a consumer to 16001000.larb
> > [   37.352400] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=60
> > [   37.352641] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.352643] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.352645] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.356517] <6>.(6)[164:kworker/6:2]mtk-cam-larb camisp_l13:
> > mtk_cam_larb_probe
> > [   37.357453] <6>.(6)[164:kworker/6:2]probe of camisp_l13 returned
> > 1 after 7193 usecs
> > [   37.358543] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > camisp_l14 to group 1
> > [   37.359448] <6>.(6)[164:kworker/6:2]mtk-cam-larb camisp_l14:
> > Linked as a consumer to 16002000.larb
> > [   37.360565] <6>.(6)[164:kworker/6:2]mtk-cam-larb camisp_l14:
> > mtk_cam_larb_probe
> > [   37.361481] <6>.(6)[164:kworker/6:2]probe of camisp_l14 returned
> > 1 after 3026 usecs
> > [   37.362538] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b0000.camsv1: mtk_camsv_probe
> > [   37.363574] <6>.(6)[164:kworker/6:2]probe of 160b0000.camsv1
> > returned 1 after 1094 usecs
> > [   37.364638] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b1000.camsv2: mtk_camsv_probe
> > [   37.365581] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.366583] <6>.(6)[164:kworker/6:2]probe of 160b1000.camsv2
> > returned 1 after 1956 usecs
> > [   37.367642] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b2000.camsv3: mtk_camsv_probe
> > [   37.368586] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=61
> > [   37.368831] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.368832] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.368833] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.372728] <6>.(6)[164:kworker/6:2]probe of 160b2000.camsv3
> > returned 1 after 5094 usecs
> > [   37.373791] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b3000.camsv4: mtk_camsv_probe
> > [   37.374764] <6>.(6)[164:kworker/6:2]probe of 160b3000.camsv4
> > returned 1 after 984 usecs
> > [   37.375817] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b4000.camsv5: mtk_camsv_probe
> > [   37.376786] <6>.(6)[164:kworker/6:2]probe of 160b4000.camsv5
> > returned 1 after 978 usecs
> > [   37.377825] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b5000.camsv6: mtk_camsv_probe
> > [   37.378788] <6>.(6)[164:kworker/6:2]probe of 160b5000.camsv6
> > returned 1 after 970 usecs
> > [   37.379930] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 16030000.cam_raw_a to group 1
> > [   37.380918] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16030000.cam_raw_a: Linked as a consumer to 16012000.larb
> > [   37.382108] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.383135] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16030000.cam_raw_a: mtk_raw_probe
> > [   37.384089] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16030000.cam_raw_a: clk_num:7
> > [   37.384978] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=62
> > [   37.385214] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.385215] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.385216] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.389099] <6>.(6)[164:kworker/6:2]probe of 16030000.cam_raw_a
> > returned 1 after 9265 usecs
> > [   37.390274] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 16070000.cam_raw_b to group 1
> > [   37.391269] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16070000.cam_raw_b: Linked as a consumer to 16014000.larb
> > [   37.392510] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16070000.cam_raw_b: mtk_raw_probe
> > [   37.393464] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16070000.cam_raw_b: clk_num:7
> > [   37.394366] <6>.(6)[164:kworker/6:2]probe of 16070000.cam_raw_b
> > returned 1 after 4185 usecs
> > [   37.395545] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 16050000.cam_yuv_a to group 1
> > [   37.396531] <6>.(6)[164:kworker/6:2]mtk-cam yuv
> > 16050000.cam_yuv_a: Linked as a consumer to 16013000.larb
> > [   37.397768] <6>.(6)[164:kworker/6:2]mtk-cam yuv
> > 16050000.cam_yuv_a: mtk_yuv_probe
> > [   37.398700] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.399698] <6>.(6)[164:kworker/6:2]mtk-cam yuv
> > 16050000.cam_yuv_a: clk_num:3
> > [   37.400597] <6>.(6)[164:kworker/6:2]probe of 16050000.cam_yuv_a
> > returned 1 after 5143 usecs
> > [   37.401637] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=63
> > [   37.401884] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.401885] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.401887] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.405892] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 16090000.cam_yuv_b to group 1
> > [   37.406880] <6>.(6)[164:kworker/6:2]mtk-cam yuv
> > 16090000.cam_yuv_b: Linked as a consumer to 16015000.larb
> > [   37.408120] <6>.(6)[164:kworker/6:2]mtk-cam yuv
> > 16090000.cam_yuv_b: mtk_yuv_probe
> > [   37.409067] <6>.(6)[164:kworker/6:2]mtk-cam yuv
> > 16090000.cam_yuv_b: clk_num:3
> > [   37.409968] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > mtk_cam_master_bind
> > [   37.410918] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16030000.cam_raw_a: mtk_raw_component_bind: id=0
> > [   37.412020] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound 16030000.cam_raw_a (ops 0xffffff800904ed28)
> > [   37.413264] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16070000.cam_raw_b: mtk_raw_component_bind: id=1
> > [   37.414358] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound 16070000.cam_raw_b (ops 0xffffff800904ed28)
> > [   37.415605] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.416580] <6>.(6)[164:kworker/6:2]mtk-cam yuv
> > 16050000.cam_yuv_a: mtk_yuv_component_bind: id=0
> > [   37.417672] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound 16050000.cam_yuv_a (ops 0xffffff800904ed38)
> > [   37.418917] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=64
> > [   37.419151] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.419152] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.419153] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.423016] <6>.(6)[164:kworker/6:2]mtk-cam yuv
> > 16090000.cam_yuv_b: mtk_yuv_component_bind: id=1
> > [   37.424111] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound 16090000.cam_yuv_b (ops 0xffffff800904ed38)
> > [   37.425356] <6>.(6)[164:kworker/6:2]mtk-cam-larb camisp_l13:
> > mtk_cam_pm_component_bind: dev:0xe5754410, id=13
> > [   37.426589] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound camisp_l13 (ops 0xffffff800904ef00)
> > [   37.427749] <6>.(6)[164:kworker/6:2]mtk-cam-larb camisp_l14:
> > mtk_cam_pm_component_bind: dev:0xe5754810, id=14
> > [   37.428982] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound camisp_l14 (ops 0xffffff800904ef00)
> > [   37.430141] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b0000.camsv1: mtk_camsv_component_bind: id=0
> > [   37.431247] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound 160b0000.camsv1 (ops 0xffffff8009051748)
> > [   37.432459] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.433433] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b1000.camsv2: mtk_camsv_component_bind: id=1
> > [   37.434536] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound 160b1000.camsv2 (ops 0xffffff8009051748)
> > [   37.435749] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=65
> > [   37.435982] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.435983] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.435984] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.439849] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b2000.camsv3: mtk_camsv_component_bind: id=2
> > [   37.440953] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound 160b2000.camsv3 (ops 0xffffff8009051748)
> > [   37.442163] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b3000.camsv4: mtk_camsv_component_bind: id=3
> > [   37.443269] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound 160b3000.camsv4 (ops 0xffffff8009051748)
> > [   37.444481] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b4000.camsv5: mtk_camsv_component_bind: id=4
> > [   37.445584] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound 160b4000.camsv5 (ops 0xffffff8009051748)
> > [   37.446796] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b5000.camsv6: mtk_camsv_component_bind: id=5
> > [   37.447901] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound 160b5000.camsv6 (ops 0xffffff8009051748)
> > [   37.449113] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.450114] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound 16007000.seninf_top:seninf_csi_port_0 (ops
> > 0xffffff800904f940)
> > [   37.451566] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=66
> > [   37.451799] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.451800] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.451801] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.455671] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > bound 16007000.seninf_top:seninf_csi_port_1 (ops
> > 0xffffff800904f940)
> > [   37.457121] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16030000.cam_raw_a: Linked as a consumer to 16050000.cam_yuv_a
> > [   37.458365] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16070000.cam_raw_b: Linked as a consumer to 16090000.cam_yuv_b
> > [   37.459612] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b0000.camsv1: Linked as a consumer to camisp_l13
> > [   37.460758] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b1000.camsv2: Linked as a consumer to camisp_l14
> > [   37.461907] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b2000.camsv3: Linked as a consumer to camisp_l13
> > [   37.463055] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b3000.camsv4: Linked as a consumer to camisp_l14
> > [   37.464202] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b4000.camsv5: Linked as a consumer to camisp_l13
> > [   37.465349] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.466324] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b5000.camsv6: Linked as a consumer to camisp_l14
> > [   37.467491] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16030000.cam_raw_a: mtk_raw_pipeline_register: mtk-cam raw-0
> > [   37.468713] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=67
> > [   37.468948] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.468949] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.468950] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.473045] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16070000.cam_raw_b: mtk_raw_pipeline_register: mtk-cam raw-1
> > [   37.474457] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b0000.camsv1: mtk_camsv_pipeline_register: mtk-cam camsv-0
> > [   37.475741] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b1000.camsv2: mtk_camsv_pipeline_register: mtk-cam camsv-1
> > [   37.477004] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b2000.camsv3: mtk_camsv_pipeline_register: mtk-cam camsv-2
> > [   37.478268] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b3000.camsv4: mtk_camsv_pipeline_register: mtk-cam camsv-3
> > [   37.479540] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b4000.camsv5: mtk_camsv_pipeline_register: mtk-cam camsv-4
> > [   37.480804] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b5000.camsv6: mtk_camsv_pipeline_register: mtk-cam camsv-5
> > [   37.482058] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.483041] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-0 mtk-cam raw-0
> > [   37.484170] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-0 mtk-cam raw-1
> > [   37.485296] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=68
> > [   37.485532] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.485533] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.485534] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.489398] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-0 mtk-cam camsv-0
> > [   37.490544] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-0 mtk-cam camsv-1
> > [   37.491695] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-0 mtk-cam camsv-2
> > [   37.492842] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-0 mtk-cam camsv-3
> > [   37.493989] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-0 mtk-cam camsv-4
> > [   37.495137] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-0 mtk-cam camsv-5
> > [   37.496284] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-1 mtk-cam raw-0
> > [   37.497409] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-1 mtk-cam raw-1
> > [   37.498534] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.499510] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-1 mtk-cam camsv-0
> > [   37.500657] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-1 mtk-cam camsv-1
> > [   37.501803] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=69
> > [   37.502040] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.502040] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.502041] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.505904] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-1 mtk-cam camsv-2
> > [   37.507054] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-1 mtk-cam camsv-3
> > [   37.508200] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-1 mtk-cam camsv-4
> > [   37.509347] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > create pad link seninf-1 mtk-cam camsv-5
> > [   37.510763] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > Linked as a consumer to regulator.3
> > [   37.511868] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > [mtk_cam_dvfs_init] idx=0, clk=273000000 volt=550000
> > [   37.513143] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > [mtk_cam_dvfs_init] idx=1, clk=392000000 volt=600000
> > [   37.514420] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > [mtk_cam_dvfs_init] idx=2, clk=416000000 volt=650000
> > [   37.515699] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.516674] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > [mtk_cam_dvfs_init] idx=3, clk=499000000 volt=750000
> > [   37.518046] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16030000.cam_raw_a: [mtk_cam_qos_init] raw_engine_id=0, port_num=23
> > [   37.519344] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=70
> > [   37.519583] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.519584] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.519585] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.523546] <6>.(6)[164:kworker/6:2]mtk-cam raw
> > 16070000.cam_raw_b: [mtk_cam_qos_init] raw_engine_id=1, port_num=46
> > [   37.524846] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b0000.camsv1: [mtk_cam_qos_init] sv_engine_id=0, port_num=1
> > [   37.526114] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b1000.camsv2: [mtk_cam_qos_init] sv_engine_id=1, port_num=2
> > [   37.527385] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b2000.camsv3: [mtk_cam_qos_init] sv_engine_id=2, port_num=3
> > [   37.528652] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b3000.camsv4: [mtk_cam_qos_init] sv_engine_id=3, port_num=4
> > [   37.529919] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b4000.camsv5: [mtk_cam_qos_init] sv_engine_id=4, port_num=5
> > [   37.531189] <6>.(6)[164:kworker/6:2]mtk-cam camsv
> > 160b5000.camsv6: [mtk_cam_qos_init] sv_engine_id=5, port_num=6
> > [   37.532455] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.533430] <6>.(6)[164:kworker/6:2]mtk-cam 16000000.camisp:
> > mtk_cam_master_bind success
> > [   37.534449]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     37534.448088:probe:
> > probe=platform_drv_probe drv=mtk-cam
> > yuv(0xffffff800962af88)   126.357231ms
> > [   37.536071] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=71
> > [   37.536310] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.536311] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.536312] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.540188] <6>.(6)[164:kworker/6:2]probe of 16090000.cam_yuv_b
> > returned 1 after 134388 usecs
> > [   37.541358] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 15310000.aie to group 1
> > [   37.542281] <6>.(6)[164:kworker/6:2]mtk-aie-5.3 15310000.aie:
> > Linked as a consumer to 15340000.larb
> > [   37.543740] <6>.(6)[164:kworker/6:2]mtk-aie-5.3 15310000.aie:
> > Linked as a consumer to regulator.3
> > [   37.545152] <6>.(6)[164:kworker/6:2]mtk_smi_sspm_init sspm smi
> > resv va:0xffffff800de70000, pa:0x0x0000000080bf5000, size:0x9000
> > [   37.546593] <6>.(6)[164:kworker/6:2]mtk-aie-5.3 15310000.aie:
> > AIE : Success to mtk_aie_probe
> > [   37.547672] <6>.(6)[164:kworker/6:2]probe of 15310000.aie
> > returned 1 after 6354 usecs
> > [   37.548647] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.549720] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 17080000.ccu_rproc to group 3
> > [   37.550708] <6>.(6)[164:kworker/6:2]ccu_rproc
> > 17080000.ccu_rproc: Linked as a consumer to 17201000.larb
> > [   37.551882] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=72
> > [   37.552114] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.552115] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.552116] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.556102] <6>.(6)[164:kworker/6:2][ccu_rproc][mtk_ccu_probe]
> > ccu_base pa: 0x17080000, size: 0x1000
> > [   37.557238] <6>.(6)[164:kworker/6:2][ccu_rproc][mtk_ccu_probe]
> > ccu_base va: 0xffffff800cf53000
> > [   37.558312] <6>.(6)[164:kworker/6:2][ccu_rproc][mtk_ccu_probe]
> > dmem_base pa: 0x17020000, size: 0x20000
> > [   37.559474] <6>.(6)[164:kworker/6:2][ccu_rproc][mtk_ccu_probe]
> > dmem_base va: 0xffffff800de80000
> > [   37.560559] <6>.(6)[164:kworker/6:2][ccu_rproc][mtk_ccu_probe]
> > pmem_base pa: 0x17000000, size: 0x20000
> > [   37.561716] <6>.(6)[164:kworker/6:2][ccu_rproc][mtk_ccu_probe]
> > pmem_base va: 0xffffff800dec0000
> > [   37.562850] <6>.(6)[164:kworker/6:2][ccu_rproc][mtk_ccu_probe]
> > ccu_probe irq_num: 442
> > [   37.565137] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.566650] <6>.(6)[164:kworker/6:2]ccu_rproc
> > 17080000.ccu_rproc: success: size(400000), va(ffffff800e501000),
> > mva(243c00000)
> > [   37.568127] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=73
> > [   37.568724] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.568727] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.568732] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.572693] <6>.(6)[164:kworker/6:2]remoteproc remoteproc0:
> > ccu_rproc is available
> > [   37.573712]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     37573.708088:probe:
> > probe=platform_drv_probe
> > drv=ccu_rproc(0xffffff8009643df0)    17.624461ms
> > [   37.575365] <6>.(6)[164:kworker/6:2]probe of 17080000.ccu_rproc
> > returned 1 after 25677 usecs
> > [   37.576662] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > ccu_rproc1 to group 4
> > [   37.577564] <6>.(6)[164:kworker/6:2]ccu_rproc1 ccu_rproc1:
> > Linked as a consumer to 17201000.larb
> > [   37.578735] <6>.(6)[164:kworker/6:2]probe of ccu_rproc1 returned
> > 1 after 2163 usecs
> > [   37.580052] <6>.(6)[164:kworker/6:2]mt8195-sound sound: Linked
> > as a consumer to regulator.43
> > [   37.581147] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   37.582025] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.583009] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   37.583893] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   37.584775] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=74
> > [   37.585026] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.585027] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.585029] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.588903] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   37.589783] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   37.590664] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   37.591557] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   37.592447] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   37.593325] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   37.594204] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   37.595085] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   37.595964] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   37.596844] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   37.597725] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   37.598603] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.599582] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   37.600460] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   37.601350] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   37.602336] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=75
> > [   37.602573] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.602574] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.602575] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.606442] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   37.607367] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   37.608342] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   37.609264] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   37.610294] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   37.611187] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   37.612076] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   37.613009] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   37.614118] <6>.(6)[164:kworker/6:2]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   37.615365] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.616344]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     37616.343550:probe:
> > probe=platform_drv_probe drv=mt8195-
> > sound(0xffffff800966ce50)    36.397231ms
> > [   37.618001] <6>.(6)[164:kworker/6:2]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   37.619018] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=76
> > [   37.619254] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.619255] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.619256] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.623164] <6>.(6)[164:kworker/6:2]probe of sound returned 0
> > after 43361 usecs
> > [   37.624173] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: GPIO lookup for consumer dmic_clk_en_io
> > [   37.625374] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: using device tree for GPIO lookup
> > [   37.626525] <6>.(6)[164:kworker/6:2]of_get_named_gpiod_flags:
> > parsed 'dmic_clk_en_io-gpios' property of node
> > '/odm/mt8570_sound[0]' - status (0)
> > [   37.629547] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding SPI_RSV0_FE
> > [   37.630624] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding SPI_MIC_FE
> > [   37.631725] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding SPI_RSV1_FE
> > [   37.632783] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.633770] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding SPI_RSV2_FE
> > [   37.634829] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=77
> > [   37.635439] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.635443] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.635446] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.639354] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding SPI_RSV3_FE
> > [   37.640412] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding SPI_RSV4_FE
> > [   37.641470] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding PCMP_RSV1_FE
> > [   37.642538] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding SPI_RSV6_FE
> > [   37.643609] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding SPI_RSV7_FE
> > [   37.644662] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding SPI_RSV8_FE
> > [   37.645712] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding COMRPP_RSV1_FE
> > [   37.646794] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding COMRPP_RSV2_FE
> > [   37.647880] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding COMRPP_RSV3_FE
> > [   37.648962] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.649937] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding COMRPP_RSV4_FE
> > [   37.651020] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding SPI MIC BE
> > [   37.652062] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=78
> > [   37.652296] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.652297] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.652297] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.656163] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding SPI_RSV1_BE
> > [   37.657214] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: binding SPI_RSV2_BE
> > [   37.658312] <6>.(6)[164:kworker/6:2]mt8570-adsp-pcm
> > odm:audio_spi: ASoC: adding FE_MICR widget
> > [   37.659387] <6>.(6)[164:kworker/6:2]mt8570-adsp-pcm
> > odm:audio_spi: ASoC: adding SPI MIC Capture widget
> > [   37.665119] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.668086] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=79
> > [   37.669296] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.670172] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.671179] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.681786] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.684751] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=80
> > [   37.685963] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.686840] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.687847] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.698452] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.701411] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=81
> > [   37.702618] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.703496] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.704503] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.706105] <6>.(6)[164:kworker/6:2][IPI][DMA]
> > mt8570_init_audio_ipi_dma(), dma 000000006b6d3a80, phy
> > 00000000224b5cd8/0x60000000, vir
> > 000000006b6d3a80/0xffffff800e000000, sz 0x500000, checksum 13952,
> > offset 14080
> > [   37.708686] <6>.(6)[58:kworker/6:1]hifi4dsp-8570 hifi4dsp_8570:
> > Direct firmware load for hifi4dsp_8570.bin failed with error -2
> > [   37.710121] <6>.(6)[58:kworker/6:1]hifi4dsp-8570 hifi4dsp_8570:
> > Falling back to syfs fallback for: hifi4dsp_8570.bin
> > [   37.711549] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 0 late -2
> > [   37.712793] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 1 late -2
> > [   37.714037] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 2 late -2
> > [   37.715285] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.716263] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 3 late -2
> > [   37.717507] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 4 late -2
> > [   37.718751] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=82
> > [   37.718986] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.718986] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.718988] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.722853] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 5 late -2
> > [   37.724100] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 6 late -2
> > [   37.725344] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 7 late -2
> > [   37.726588] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 8 late -2
> > [   37.727835] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 9 late -2
> > [   37.729079] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 10 late -2
> > [   37.730334] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 11 late -2
> > [   37.731591] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 12 late -2
> > [   37.732845] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.733820] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 13 late -2
> > [   37.735075] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=83
> > [   37.735308] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.735309] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.735309] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.739174] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 14 late -2
> > [   37.740428] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 15 late -2
> > [   37.741682] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 16 late -2
> > [   37.742936] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 0 late -1
> > [   37.744183] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 1 late -1
> > [   37.745427] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 2 late -1
> > [   37.746671] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 3 late -1
> > [   37.747916] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 4 late -1
> > [   37.749159] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.750134] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 5 late -1
> > [   37.751379] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 6 late -1
> > [   37.752624] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=84
> > [   37.752860] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.752861] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.752862] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.756726] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 7 late -1
> > [   37.757969] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 8 late -1
> > [   37.759214] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 9 late -1
> > [   37.760458] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 10 late -1
> > [   37.761712] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 11 late -1
> > [   37.762966] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 12 late -1
> > [   37.764222] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 13 late -1
> > [   37.765476] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.766450] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 14 late -1
> > [   37.767707] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 15 late -1
> > [   37.768961] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=85
> > [   37.769189] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.769190] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.769191] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.773055] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 16 late -1
> > [   37.774309] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 0 late 0
> > [   37.775544] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 1 late 0
> > [   37.776778] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 2 late 0
> > [   37.778010] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 3 late 0
> > [   37.779245] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 4 late 0
> > [   37.780477] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 5 late 0
> > [   37.781709] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 6 late 0
> > [   37.782943] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.783920] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 7 late 0
> > [   37.785153] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=86
> > [   37.785385] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.785385] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.785387] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.789251] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 8 late 0
> > [   37.790484] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 9 late 0
> > [   37.791719] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 10 late 0
> > [   37.792962] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 11 late 0
> > [   37.794206] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 12 late 0
> > [   37.795452] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 13 late 0
> > [   37.796696] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 14 late 0
> > [   37.797940] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 15 late 0
> > [   37.799184] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.800162] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 16 late 0
> > [   37.801405] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=87
> > [   37.801638] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.801639] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.801640] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.805504] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 0 late 1
> > [   37.806735] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 1 late 1
> > [   37.807970] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 2 late 1
> > [   37.809203] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 3 late 1
> > [   37.810436] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 4 late 1
> > [   37.811670] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 5 late 1
> > [   37.812903] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 6 late 1
> > [   37.814135] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 7 late 1
> > [   37.815370] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.816344] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 8 late 1
> > [   37.817577] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 9 late 1
> > [   37.818811] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=88
> > [   37.819040] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.819041] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.819042] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.822905] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 10 late 1
> > [   37.824151] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 11 late 1
> > [   37.825395] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 12 late 1
> > [   37.826637] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 13 late 1
> > [   37.827882] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 14 late 1
> > [   37.829125] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 15 late 1
> > [   37.830369] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 16 late 1
> > [   37.831615] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 0 late 2
> > [   37.832847] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.833855] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #0 SPI_RSV0FE snd-soc-dummy-
> > dai-0
> > [   37.835219] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=89
> > [   37.835452] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.835453] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.835453] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.839323] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.840642] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 1 late 2
> > [   37.841890] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #1 SPI MIC Capture (*)
> > [   37.843137] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> FE_MICR mapping ok
> > [   37.844348] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 2 late 2
> > [   37.845598] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #2 SPI_RSV1FE snd-soc-dummy-
> > dai-2
> > [   37.846960] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.848281] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 3 late 2
> > [   37.849514] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.850505] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #3 SPI_RSV2FE snd-soc-dummy-
> > dai-3
> > [   37.851870] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=90
> > [   37.852099] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.852100] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.852101] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.855967] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.857286] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 4 late 2
> > [   37.858538] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #4 SPI_RSV3FE snd-soc-dummy-
> > dai-4
> > [   37.859904] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.861223] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 5 late 2
> > [   37.862475] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #5 SPI_RSV4FE snd-soc-dummy-
> > dai-5
> > [   37.863841] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.865160] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.866134] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 6 late 2
> > [   37.867387] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #6 PCMP_RSV1FE snd-soc-
> > dummy-dai-6
> > [   37.868760] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=91
> > [   37.868992] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.868993] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.868994] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.872858] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.874177] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 7 late 2
> > [   37.875428] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #7 SPI_RSV6FE snd-soc-dummy-
> > dai-7
> > [   37.876790] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.878108] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 8 late 2
> > [   37.879367] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #8 SPI_RSV7FE snd-soc-dummy-
> > dai-8
> > [   37.880729] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.882049] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.883023] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 9 late 2
> > [   37.884275] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #9 SPI_RSV8FE snd-soc-dummy-
> > dai-9
> > [   37.885637] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=92
> > [   37.885871] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.885872] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.885873] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.889737] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.891059] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 10 late 2
> > [   37.892321] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #10 COMRPP_RSV1FE snd-soc-
> > dummy-dai-10
> > [   37.893737] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.895058] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 11 late 2
> > [   37.896316] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #11 COMRPP_RSV2FE snd-soc-
> > dummy-dai-11
> > [   37.897733] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.899053] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.900030] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 12 late 2
> > [   37.901290] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #12 COMRPP_RSV3FE snd-soc-
> > dummy-dai-12
> > [   37.902707] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=93
> > [   37.902939] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.902940] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.902941] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.906806] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.908128] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 13 late 2
> > [   37.909388] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #13 COMRPP_RSV4FE snd-soc-
> > dummy-dai-13
> > [   37.910803] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.912125] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 14 late 2
> > [   37.913376] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #14 ((null))
> > [   37.914512] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> BE_MICR mapping ok
> > [   37.915726] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.916701] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 15 late 2
> > [   37.917951] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #15 ((null))
> > [   37.919087] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=94
> > [   37.919319] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.919320] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.919321] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.923187] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.924506] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: probe mt8570-sound dai link 16 late 2
> > [   37.925757] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: ASoC: registered pcm #16 ((null))
> > [   37.926893] <6>.(6)[164:kworker/6:2]mt8570-sound
> > odm:mt8570_sound: snd-soc-dummy-dai <-> snd-soc-dummy-dai mapping
> > ok
> > [   37.929234]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     37929.231551:probe:
> > probe=platform_drv_probe drv=mt8570-
> > sound(0xffffff80096712e0)   305.055078ms
> > [   37.930911] <6>.(6)[164:kworker/6:2]probe of odm:mt8570_sound
> > returned 1 after 306751 usecs
> > [   37.932004] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.933349] <6>.(6)[164:kworker/6:2]mtk-pcie 112f0000.pcie: host
> > bridge /pcie@112f0000 ranges:
> > [   37.934440] <6>.(6)[164:kworker/6:2]mtk-pcie
> > 112f0000.pcie:   MEM 0x20000000..0x23ffffff -> 0x20000000
> > [   37.935609] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=95
> > [   37.936227] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.936231] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.936234] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.940394] <6>.(6)[164:kworker/6:2]mtk-pcie 112f0000.pcie: host
> > bridge domain number 0
> > [   37.941560] <6>.(6)[164:kworker/6:2]mtk-pcie 112f0000.pcie:
> > current sw version: E1
> > [   37.942579] <6>.(6)[164:kworker/6:2]mtk-pcie-phy 11e80000.phy0:
> > Failed to read efuse value
> > [   37.948571] <7>-(7)[0:swapper/7]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   37.951593] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=96
> > [   37.954442] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.955298] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   37.956281] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   37.965132] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   37.968003] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=97
> > [   37.969549] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.970389] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   37.971358] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   37.980140] <6>.(6)[164:kworker/6:2]mtk-pcie 112f0000.pcie: PCIe
> > link up success!
> > [   37.981107] <6>.(6)[164:kworker/6:2]mtk-pcie 112f0000.pcie: PCI
> > host bridge to bus 0000:00
> > [   37.982137] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.983121] <6>.(6)[164:kworker/6:2]pci_bus 0000:00: root bus
> > resource [bus 00-ff]
> > [   37.984065] <6>.(6)[164:kworker/6:2]pci_bus 0000:00: root bus
> > resource [mem 0x20000000-0x23ffffff]
> > [   37.985180] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=98
> > [   37.985433] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   37.985434] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   37.985435] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   37.989318] <6>.(6)[164:kworker/6:2]pci 0000:00:00.0:
> > [14c3:8195] type 01 class 0x060400
> > [   37.990346] <6>.(6)[164:kworker/6:2]pci 0000:00:00.0: reg 0x10:
> > [mem 0x00000000-0x00003fff 64bit pref]
> > [   37.991559] <6>.(6)[164:kworker/6:2]pci 0000:00:00.0: supports
> > D1 D2
> > [   37.992352] <6>.(6)[164:kworker/6:2]pci 0000:00:00.0: PME#
> > supported from D0 D1 D2 D3hot D3cold
> > [   37.995444] <6>.(6)[164:kworker/6:2]pci 0000:00:00.0: bridge
> > configuration invalid ([bus 00-00]), reconfiguring
> > [   37.996766] <6>.(6)[164:kworker/6:2]pci 0000:01:00.0:
> > [14c3:7961] type 00 class 0x028000
> > [   37.997814] <6>.(6)[164:kworker/6:2]pci 0000:01:00.0: reg 0x10:
> > [mem 0x00000000-0x000fffff 64bit pref]
> > [   37.998972] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   37.999967] <6>.(6)[164:kworker/6:2]pci 0000:01:00.0: reg 0x18:
> > [mem 0x00000000-0x00003fff 64bit pref]
> > [   38.001140] <6>.(6)[164:kworker/6:2]pci 0000:01:00.0: reg 0x20:
> > [mem 0x00000000-0x00000fff 64bit pref]
> > [   38.002300] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=99
> > [   38.002550] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.002551] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.002552] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.006512] <6>.(6)[164:kworker/6:2]pci 0000:01:00.0: supports
> > D1 D2
> > [   38.007306] <6>.(6)[164:kworker/6:2]pci 0000:01:00.0: PME#
> > supported from D0 D1 D2 D3hot D3cold
> > [   38.009846] <6>.(6)[164:kworker/6:2]pci_bus 0000:01: busn_res:
> > [bus 01-ff] end is updated to 01
> > [   38.010944] <6>.(6)[164:kworker/6:2]pci 0000:00:00.0: BAR 9:
> > assigned [mem 0x20000000-0x201fffff 64bit pref]
> > [   38.012173] <6>.(6)[164:kworker/6:2]pci 0000:00:00.0: BAR 0:
> > assigned [mem 0x20200000-0x20203fff 64bit pref]
> > [   38.013402] <6>.(6)[164:kworker/6:2]pci 0000:01:00.0: BAR 0:
> > assigned [mem 0x20000000-0x200fffff 64bit pref]
> > [   38.014636] <6>.(6)[164:kworker/6:2]pci 0000:01:00.0: BAR 2:
> > assigned [mem 0x20100000-0x20103fff 64bit pref]
> > [   38.015862] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.016848] <6>.(6)[164:kworker/6:2]pci 0000:01:00.0: BAR 4:
> > assigned [mem 0x20104000-0x20104fff 64bit pref]
> > [   38.018072] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=100
> > [   38.018313] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.018315] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.018317] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.022204] <6>.(6)[164:kworker/6:2]pci 0000:00:00.0: PCI bridge
> > to [bus 01]
> > [   38.023089] <6>.(6)[164:kworker/6:2]pci 0000:00:00.0:   bridge
> > window [mem 0x20000000-0x201fffff 64bit pref]
> > [   38.024360]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     38024.359320:probe:
> > probe=platform_drv_probe drv=mtk-
> > pcie(0xffffff80095ab728)    91.035770ms
> > [   38.025962] <6>.(6)[164:kworker/6:2]probe of 112f0000.pcie
> > returned 1 after 92753 usecs
> > [   38.027075] <6>.(6)[164:kworker/6:2]iommu: Adding device ion to
> > group 0
> > [   38.027903] <6>.(6)[164:kworker/6:2]ion-drv ion: Linked as a
> > consumer to 1c018000.larb
> > [   38.028898] <6>.(6)[164:kworker/6:2][ION]ion_drv_probe, start
> > [   38.029678] <6>.(6)[164:kworker/6:2][ION]ion_heap_create: heap
> > ion_system_heap created, type 0 ,base 0, size 0
> > [   38.031811] <3>-(3)[2:kthreadd]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   38.033994] <6>.(6)[164:kworker/6:2][ION]ion_sec_heap_create
> > enter:ion_sec_heap
> > [   38.034922] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=101
> > [   38.035515] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.035520] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.035523] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.039474] <6>.(6)[164:kworker/6:2][ION]ion_sec_heap_create
> > enter:ion_sec_heap_protected
> > [   38.040506] <6>.(6)[164:kworker/6:2][ION]ion_sec_heap_create
> > enter:ion_sec_heap_2d_fr
> > [   38.041501] <6>.(6)[164:kworker/6:2][ION]ion_sec_heap_create
> > enter:ion_sec_heap_wfd
> > [   38.042467] <6>.(6)[164:kworker/6:2][ION]ion_sec_heap_create
> > enter:ion_sec_heap_happ
> > [   38.043470] <6>.(6)[164:kworker/6:2][ION]ion_sec_heap_create
> > enter:ion_sec_heap_happ_mem
> > [   38.044483] <6>.(6)[164:kworker/6:2][ION]ion_sec_heap_create
> > enter:ion_sec_heap_sdsp
> > [   38.045451] <6>.(6)[164:kworker/6:2][ION]ion_sec_heap_create
> > enter:ion_sec_heap_sdsp_shared
> > [   38.047402] <6>.(6)[164:kworker/6:2][ION]ion_drv_probe, done
> > [   38.048118]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     38048.117089:probe:
> > probe=platform_drv_probe drv=ion-
> > drv(0xffffff8009643900)    19.216308ms
> > [   38.049700] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.050695] <6>.(6)[164:kworker/6:2]probe of ion returned 1
> > after 23716 usecs
> > [   38.051337] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=102
> > [   38.051718] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs: Linked
> > as a consumer to 1100b000.lvts
> > [   38.053655] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs: Linked
> > as a consumer to 13000000.mali
> > [   38.054411] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.054738] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs: fail
> > to get svs platform data: -517
> > [   38.054746] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs:
> > Dropping the link to 13000000.mali
> > [   38.055593] <6>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   38.055605] <6>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   38.059656] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs:
> > Dropping the link to 1100b000.lvts
> > [   38.060718] <6>.(6)[164:kworker/6:2]probe of 1100b000.svs
> > returned 0 after 9069 usecs
> > [   38.062032] <6>.(6)[164:kworker/6:2]apusys_power
> > 190f1000.apusys_power: Linked as a consumer to 19010000.apu-iommu
> > [   38.063362] <6>.(6)[164:kworker/6:2]probe of 19010000.apu-iommu
> > returned 1 after 1490 usecs
> > [   38.064465] <6>.(6)[164:kworker/6:2]apusys_power
> > 190f1000.apusys_power: Linked as a consumer to 19015000.apu-iommu
> > [   38.065754] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.066746] <6>.(6)[164:kworker/6:2]probe of 19015000.apu-iommu
> > returned 1 after 2321 usecs
> > [   38.067923] <6>.(6)[164:kworker/6:2]drm_mmp_init
> > [   38.068501] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=103
> > [   38.068743] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.068744] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.068745] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.072632] <6>.(6)[164:kworker/6:2]MMP: mmprofile_enable():
> > enable: 1
> > [   38.073609] <6>.(6)[164:kworker/6:2]MMP:
> > mmprofile_force_start(): start: 1
> > [   38.075993] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_ovl@1c000000
> > [   38.077320] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_wdma@1c001000
> > [   38.078657] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_rdma@1c002000
> > [   38.080002] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_color@1c003000
> > [   38.081350] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_ccorr@1c004000
> > [   38.082691] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.083681] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_aal@1c005000
> > [   38.085004] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=104
> > [   38.085244] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.085245] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.085246] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.089131] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_gamma@1c006000
> > [   38.090479] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_dither@1c007000
> > [   38.091842] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_dsi0@1c008000
> > [   38.093179] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_dsc_wrap@1c009000
> > [   38.094558] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_ovl@1c00a000
> > [   38.095888] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_wdma@1c00b000
> > [   38.097225] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_rdma@1c00c000
> > [   38.098554] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.099538] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_color@1c00d000
> > [   38.100887] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_ccorr@1c00e000
> > [   38.102229] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=105
> > [   38.102465] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.102466] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.102467] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.106350] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_aal@1c00f000
> > [   38.107678] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_gamma@1c010000
> > [   38.109028] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_dither@1c011000
> > [   38.110392] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_vpp_merge0@1c014000
> > [   38.111866] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_pseudo_ovl0@1c104000
> > [   38.113277] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_vpp_merge5@1c110000
> > [   38.114685] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_dpi1@1c112000
> > [   38.116017] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.117007] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Adding component match for 
> > disp_ethdr@1c114000
> > [   38.118348] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=106
> > [   38.118584] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.118585] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.118586] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.123057] <6>.(6)[164:kworker/6:2]Cannot find disp pinctrl!
> > [   38.123275] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c000000.disp_ovl (ops
> > 0xffffff8008fc3448)
> > [   38.125357] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c001000.disp_wdma (ops
> > 0xffffff8008fc4d30)
> > [   38.126738] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c002000.disp_rdma (ops
> > 0xffffff8008fc3f40)
> > [   38.128121] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c003000.disp_color (ops
> > 0xffffff8008fc1228)
> > [   38.129506] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c004000.disp_ccorr (ops
> > 0xffffff8008fc19b0)
> > [   38.130892] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c005000.disp_aal (ops
> > 0xffffff8008fc25d0)
> > [   38.132260] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.133238] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c006000.disp_gamma (ops
> > 0xffffff8008fc2070)
> > [   38.134626] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=107
> > [   38.134870] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.134872] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.134873] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.138751] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c007000.disp_dither (ops
> > 0xffffff8008fc2c70)
> > [   38.140160] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c008000.disp_dsi0 (ops
> > 0xffffff8008fc9df0)
> > [   38.141535] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c009000.disp_dsc_wrap (ops
> > 0xffffff8008fcc900)
> > [   38.142962] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c00a000.disp_ovl (ops
> > 0xffffff8008fc3448)
> > [   38.144330] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c00b000.disp_wdma (ops
> > 0xffffff8008fc4d30)
> > [   38.145708] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c00c000.disp_rdma (ops
> > 0xffffff8008fc3f40)
> > [   38.147083] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c00d000.disp_color (ops
> > 0xffffff8008fc1228)
> > [   38.148468] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.149446] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c00e000.disp_ccorr (ops
> > 0xffffff8008fc19b0)
> > [   38.150831] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c00f000.disp_aal (ops
> > 0xffffff8008fc25d0)
> > [   38.152197] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=108
> > [   38.152435] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.152436] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.152437] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.156314] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c010000.disp_gamma (ops
> > 0xffffff8008fc2070)
> > [   38.157699] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c011000.disp_dither (ops
> > 0xffffff8008fc2c70)
> > [   38.159099] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c014000.disp_vpp_merge0 (ops
> > 0xffffff8008fccd68)
> > [   38.160566] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c104000.disp_pseudo_ovl0 (ops
> > 0xffffff8008fcd348)
> > [   38.162016] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c110000.disp_vpp_merge5 (ops
> > 0xffffff8008fccd68)
> > [   38.163457] <6>.(6)[164:kworker/6:2]mtk_dpi_bind+
> > [   38.164049] <6>.(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: Found bridge node: hdmi@1c300000
> > [   38.165196] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.166175] <6>.(6)[164:kworker/6:2][HDMI]
> > mtk_hdmi_bridge_attach,2845 start
> > [   38.167067] <6>.(6)[164:kworker/6:2][HDMI]
> > mtk_hdmi_connetor_init_property,2577 create colorspace & colordepth
> > property
> > [   38.168409] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=109
> > [   38.168644] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.168646] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.168647] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.172522] <6>.(6)[164:kworker/6:2][HDMI]
> > mtk_hdmi_bridge_attach,2883 end
> > [   38.173378] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c112000.disp_dpi1 (ops
> > 0xffffff8008fd0388)
> > [   38.174753] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: bound 1c114000.disp_ethdr (ops
> > 0xffffff8008fcd770)
> > [   38.176168] <6>.(6)[164:kworker/6:2]mtk_drm_crtc_create+
> > [   38.176894] <6>.(6)[164:kworker/6:2][drm]
> > mtk_crtc_init_gce_obj(), CLIENT_CFG, 0
> > [   38.177359] <6>.(6)[164:kworker/6:2][drm]
> > mtk_crtc_init_gce_obj(), CLIENT_TRIG_LOOP, 0
> > [   38.178493] <6>.(6)[164:kworker/6:2][drm]
> > mtk_crtc_init_gce_obj(), CLIENT_SODI_LOOP, 0
> > [   38.179510] <6>.(6)[164:kworker/6:2][drm]
> > mtk_crtc_init_gce_obj(), CLIENT_SUB_CFG, 0
> > [   38.180997] <6>-(6)[164:kworker/6:2][drm]
> > mtk_crtc_init_gce_obj(), CLIENT_DSI_CFG, 0
> > [   38.181981] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.184188] <6>-(6)[0:swapper/6][drm] mtk_crtc_init_gce_obj(),
> > CLIENT_SEC_CFG, 0
> > [   38.184610] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=110
> > [   38.186797] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.187633] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   38.188598] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   38.189604] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_wdma1_eof0
> > @cmdq_dev_get_event,361
> > [   38.191109] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_dsi0_sof0
> > @cmdq_dev_get_event,361
> > [   38.196606] <6>.(6)[164:kworker/6:2]mtk_drm_crtc_create-CRTC0
> > create successfully
> > [   38.197541] <6>.(6)[164:kworker/6:2]mtk_drm_crtc_create+
> > [   38.198242] <0>-(0)[0:swapper/0][drm] mtk_crtc_init_gce_obj(),
> > CLIENT_CFG, 1
> > [   38.198490] <0>-(0)[0:swapper/0]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   38.200454] <1>-(1)[0:swapper/1][drm] mtk_crtc_init_gce_obj(),
> > CLIENT_TRIG_LOOP, 1
> > [   38.201472] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=111
> > [   38.204883] <6>.(6)[164:kworker/6:2][drm]
> > mtk_crtc_init_gce_obj(), CLIENT_SODI_LOOP, 1
> > [   38.204902] <1>-(1)[0:swapper/1][drm] mtk_crtc_init_gce_obj(),
> > CLIENT_SUB_CFG, 1
> > [   38.205281] <6>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.205907] <1>.(6)[164:kworker/6:2][drm]
> > mtk_crtc_init_gce_obj(), CLIENT_DSI_CFG, 1
> > [   38.205911] <1>-(1)[0:swapper/1][drm] mtk_crtc_init_gce_obj(),
> > CLIENT_SEC_CFG, 1
> > [   38.206843] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   38.210529] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   38.215293] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   38.216727] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_token_stream_eof1
> > @cmdq_dev_get_event,361
> > [   38.218304] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=112
> > [   38.218554] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.218555] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.218557] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.222473] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_token_stream_dirty1
> > @cmdq_dev_get_event,361
> > [   38.224054] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_wait_dpi1_te
> > @cmdq_dev_get_event,361
> > [   38.225557] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_token_esd_eof1
> > @cmdq_dev_get_event,361
> > [   38.227088] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_rdma0_eof1
> > @cmdq_dev_get_event,361
> > [   38.228569] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_wdma0_eof1
> > @cmdq_dev_get_event,361
> > [   38.230050] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_wdma1_eof1
> > @cmdq_dev_get_event,361
> > [   38.231532] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_token_stream_block1
> > @cmdq_dev_get_event,361
> > [   38.233117] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.234093] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_token_cabc_eof1
> > @cmdq_dev_get_event,361
> > [   38.235629] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=113
> > [   38.235876] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.235878] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.235879] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.239755] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_dsi0_sof1
> > @cmdq_dev_get_event,361
> > [   38.241878] <6>.(6)[164:kworker/6:2]mtk_drm_crtc_create-CRTC1
> > create successfully
> > [   38.242815] <6>.(6)[164:kworker/6:2]mtk_drm_crtc_create+
> > [   38.243550] <6>.(6)[164:kworker/6:2][drm]
> > mtk_crtc_init_gce_obj(), CLIENT_CFG, 2
> > [   38.247959] <6>-(6)[164:kworker/6:2][drm]
> > mtk_crtc_init_gce_obj(), CLIENT_TRIG_LOOP, 2
> > [   38.248891] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.250857] <6>.(6)[164:kworker/6:2][drm]
> > mtk_crtc_init_gce_obj(), CLIENT_SODI_LOOP, 2
> > [   38.250859] <6>-(6)[164:kworker/6:2][drm]
> > mtk_crtc_init_gce_obj(), CLIENT_SUB_CFG, 2
> > [   38.251865] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=114
> > [   38.252119] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.252120] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.252122] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.256965] <6>.(6)[164:kworker/6:2][drm]
> > mtk_crtc_init_gce_obj(), CLIENT_DSI_CFG, 2
> > [   38.256967] <6>.(6)[164:kworker/6:2][drm]
> > mtk_crtc_init_gce_obj(), CLIENT_SEC_CFG, 2
> > [   38.257933] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_wdma1_eof
> > @cmdq_dev_get_event,361
> > [   38.260375] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_token_stream_eof2
> > @cmdq_dev_get_event,361
> > [   38.261932] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_token_stream_dirty2
> > @cmdq_dev_get_event,361
> > [   38.263513] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_wait_wdma1_te
> > @cmdq_dev_get_event,361
> > [   38.265026] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_token_esd_eof2
> > @cmdq_dev_get_event,361
> > [   38.266551] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.267529] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_rdma0_eof2
> > @cmdq_dev_get_event,361
> > [   38.269010] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=115
> > [   38.269248] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.269249] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.269250] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.273128] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_wdma1_eof2
> > @cmdq_dev_get_event,361
> > [   38.274608] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_token_stream_block2
> > @cmdq_dev_get_event,361
> > [   38.276189] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_token_cabc_eof2
> > @cmdq_dev_get_event,361
> > [   38.277724] <6>.(6)[164:kworker/6:2][cmdq][err] no gce-event-
> > names property or no such event:disp_dsi0_sof2
> > @cmdq_dev_get_event,361
> > [   38.279940] <6>.(6)[164:kworker/6:2]mtk_drm_crtc_create-CRTC2
> > create successfully
> > [   38.280895] <6>.(6)[164:kworker/6:2][drm] Supports vblank
> > timestamp caching Rev 2 (21.10.2013).
> > [   38.281981] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.282957] <6>.(6)[164:kworker/6:2][drm] Driver supports
> > precise vblank timestamp query.
> > [   38.284174] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: Linked as a consumer to regulator.3
> > [   38.285403] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=116
> > [   38.285644] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.285645] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.285646] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.289530] <6>.(6)[164:kworker/6:2]mtk_fbdev_init+
> > [   38.290176] <6>.(6)[164:kworker/6:2]mtk_fbdev_probe+
> > [   38.294479] <6>.(6)[164:kworker/6:2][drm:mtk_drm_gem_create]
> > cookie = 00000000e7c96724 dma_addr = 0x00000000f9a00000 size =
> > 4608000
> > [   38.296009] <6>.(6)[164:kworker/6:2]mtk_fbdev_probe-
> > [   38.296717] <6>.(6)[164:kworker/6:2]mediatek-drm
> > 1c01a000.vdosys_config: fb0:  frame buffer device
> > [   38.297894] <6>.(6)[164:kworker/6:2]mtk_fbdev_init-
> > [   38.298508] <6>-(6)[164:kworker/6:2]mediatek-dpi
> > 1c112000.disp_dpi1: mtk_crtc is NULL
> > [   38.299503] <6>.(6)[164:kworker/6:2][fps]:
> > drm_invoke_fps_chg_callbacks,new_fps =60
> > [   38.300458] <6>.(6)[164:kworker/6:2]width:1200, height:1920
> > [   38.301244] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=117
> > [   38.302366] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.303242] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.304250] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L3
> > not complete until EOF!
> > [   38.305430] <6>.(6)[164:kworker/6:2]CRTC0 hold wakelock
> > mtk_drm_crtc_first_enable 4181
> > [   38.306420] <6>.(6)[164:kworker/6:2][mtk_disp_mutex_submit_sof
> > line:6557]
> > [   38.306851] <6>.(6)[164:kworker/6:2][disp_aal]Cannot find LED
> > node from dts
> > [   38.308570] <6>.(6)[164:kworker/6:2][disp_aal]get pwm cust info
> > fail
> > [   38.309361]
> > <6>.(6)[164:kworker/6:2][disp_aal]disp_aal_get_cust_led mode=0
> > [   38.315122] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   38.512297] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=118
> > [   38.513579] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.514419] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   38.515389] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L3 not
> > complete until EOF!
> > [   38.516403] <6>-(6)[0:swapper/6]mediatek-dpi 1c112000.disp_dpi1:
> > mtk_crtc is NULL
> > [   38.516609] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.517539] <6>.(6)[164:kworker/6:2][fps]:
> > drm_invoke_fps_chg_callbacks,new_fps =0
> > [   38.518249] <0>-(0)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=119
> > [   38.519202] <6>.(6)[164:kworker/6:2]CRTC1 hold wakelock
> > mtk_drm_crtc_first_enable 4181
> > [   38.521124] <0>-(0)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   38.521191] <0>-
> > (0)[256:pf_release_thre][mtk_disp_mutex_submit_sof line:6557]
> > [   38.522129] <0>-(0)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   38.524172] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.524999] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.526156]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.527204] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.528080] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.528904] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.530059]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.565527] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=120
> > [   38.565907] <6>.(6)[164:kworker/6:2][drm] Initialized mediatek
> > 1.0.0 20150513 for 1c01a000.vdosys_config on minor 0
> > [   38.567166] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.568654] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   38.568869]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     38568.864860:probe:
> > probe=platform_drv_probe drv=mediatek-
> > drm(0xffffff80095c6f28)   500.958001ms
> > [   38.569820] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.571270] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=121
> > [   38.571568] <0>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.572203] <6>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.573188] <0>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.574082] <6>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.574929] <0>.(6)[164:kworker/6:2]probe of
> > 1c01a000.vdosys_config returned 1 after 507052 usecs
> > [   38.575922]
> > <6>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.577182]
> > <6>.(6)[164:kworker/6:2][GPU/GED][INFO]@ged_pdrv_probe start
> > [   38.581570] <6>.(6)[164:kworker/6:2]probe of ged returned 1
> > after 4412 usecs
> > [   38.582532] <6>.(6)[164:kworker/6:2]kbase_platform_device_probe
> > start
> > [   38.583363] <6>.(6)[164:kworker/6:2]mali 13000000.mali: Kernel
> > DDK version r26p0-01eac0
> > [   38.584361]
> > <6>.(6)[164:kworker/6:2][GPU/MALI][INFO]@mtk_platform_init:
> > initialize successfully
> > [   38.585454] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=122
> > [   38.585546] <6>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.585556] <6>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.585567] <6>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.585577]
> > <6>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.585589] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.585590] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.593101] <6>.(6)[164:kworker/6:2]mtk-power-controller
> > 10006000.syscon:power-controller: Linked as a consumer to
> > regulator.49
> > [   38.595402] <6>.(6)[164:kworker/6:2]mali 13000000.mali: GPU
> > identified as 0x3 arch 9.0.9 r0p1 status 0
> > [   38.597741] <6>.(6)[164:kworker/6:2]mali 13000000.mali: No
> > memory group manager is configured
> > [   38.599954] <6>.(6)[164:kworker/6:2]mali 13000000.mali: devfreq
> > init done
> > [   38.601167] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=123
> > [   38.601235] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.601332] <0>.(6)[164:kworker/6:2]mali 13000000.mali: Probed
> > as mali0
> > [   38.601345]
> > <2>.(6)[164:kworker/6:2]BOOTPROF:     38601.344322:probe:
> > probe=platform_drv_probe
> > drv=mali(0xffffff80095db470)    18.804077ms
> > [   38.601357] <6>.(6)[164:kworker/6:2]probe of 13000000.mali
> > returned 1 after 18843 usecs
> > [   38.601554] <2>.(6)[164:kworker/6:2]iommu: Adding device
> > 19021000.apusys_reviser to group 5
> > [   38.601614] <6>.(6)[164:kworker/6:2]apusys_drv_reviser
> > 19021000.apusys_reviser: [reviser_probe] apusys_init = 0
> > [   38.601620] <6>.(6)[164:kworker/6:2]probe of
> > 19021000.apusys_reviser returned 0 after 204 usecs
> > [   38.601760] <6>.(6)[164:kworker/6:2][apusys]mdw_probe +
> > [   38.601761] <6>.(6)[164:kworker/6:2][apusys]mdw_probe
> > [mdw_probe] g_ion_device okay
> > [   38.602057] <6>.(6)[164:kworker/6:2][apusys]mdw_probe -
> > [   38.602064] <6>.(6)[164:kworker/6:2]probe of apusys returned 1
> > after 324 usecs
> > [   38.602090] <6>.(6)[164:kworker/6:2]apusys_sample apusys_sample:
> > [sample_probe] apusys_init okay
> > [   38.602529] <6>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.602570] <6>.(6)[164:kworker/6:2]probe of apusys_sample
> > returned 1 after 489 usecs
> > [   38.602685] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 19025000.edma0 to group 6
> > [   38.602852] <6>.(6)[164:kworker/6:2]probe of 19025000.edma0
> > returned 1 after 223 usecs
> > [   38.602938] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 19026000.edma1 to group 6
> > [   38.602968] <2>.(6)[164:kworker/6:2]probe of 19026000.edma1
> > returned 1 after 76 usecs
> > [   38.602982] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.603013] <2>.(6)[164:kworker/6:2]edma edma: [edma_probe]
> > apusys_init okay
> > [   38.603715] <6>.(6)[164:kworker/6:2]edma probe done
> > [   38.603727] <2>.(6)[164:kworker/6:2]probe of edma returned 1
> > after 724 usecs
> > [   38.603808] <6>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   38.604983] <2>.(6)[164:kworker/6:2]iommu: Adding device hcp@0
> > to group 1
> > [   38.605410] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.606406] <2>.(6)[164:kworker/6:2]mtk_hcp hcp@0: Linked as a
> > consumer to 15001000.larb
> > [   38.607460]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.617816] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=124
> > [   38.617929] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.617931] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.618045] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.618886] <2>.(6)[164:kworker/6:2]mtk_hcp hcp@0: Linked as a
> > consumer to 15120000.larb
> > [   38.619905] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.620675] <2>.(6)[164:kworker/6:2]mtk_hcp hcp@0: Linked as a
> > consumer to 15230000.larb
> > [   38.621567] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.622169] <2>.(6)[164:kworker/6:2]mtk_hcp hcp@0: - E. hcp
> > driver probe.
> > [   38.623101]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.634731] <2>-(2)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=125
> > [   38.635483] <2>-(2)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   38.635492] <2>-(2)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   38.641545] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.641662]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     38641.660783:probe:
> > probe=platform_drv_probe
> > drv=mtk_hcp(0xffffff800961b018)    19.482000ms
> > [   38.642409] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.644011] <6>.(6)[164:kworker/6:2]probe of hcp@0 returned 1
> > after 40190 usecs
> > [   38.644801] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.646485] <6>.(6)[164:kworker/6:2]iommu: Adding device
> > 15000000.imgsys_fw to group 1
> > [   38.646848]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.647844] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: Linked as a consumer to 15001000.larb
> > [   38.650031] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: Linked as a consumer to 15120000.larb
> > [   38.651225] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=126
> > [   38.651273] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.651277] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.651281] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.651286]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.651344] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.651345] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.658013] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: Linked as a consumer to 15230000.larb
> > [   38.659297]
> > <6>.(6)[164:kworker/6:2]mtk_imgsys_hw_working_buf_pool_init:
> > working buffer size 0x19ea10, pool size should be 0x26df180
> > [   38.660777] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.660778] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.661493] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.662208] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.662923] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.663642] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.664357] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.665076] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.665793] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.666508] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.667225] <6>-(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.667946] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=127
> > [   38.668000] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.668004] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.668009] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.668013]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.668062] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.668063] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.675447] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.675447] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.676162] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.676877] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.677591] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.678306] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.679022] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.679739] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.680454] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.681170] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.681889] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.682603] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.683321] <6>.(6)[164:kworker/6:2]DIP_FRAMEPARAM_SZ:1698320
> > [   38.684406] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: mtk_imgsys_pipe_load_default_fmt:L0I0I Input:
> > invalid idx(4), must < num_fmts(2)
> > [   38.685123] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=128
> > [   38.685232] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.685233] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.685307] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.686887] <2>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: mtk_imgsys_pipe_load_default_fmt:L0I1I Input:
> > invalid idx(4), must < num_fmts(2)
> > [   38.687900] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.688764] <2>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: mtk_imgsys_pipe_load_default_fmt:L1I0I Input:
> > invalid idx(4), must < num_fmts(2)
> > [   38.689774] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.690629] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: mtk_imgsys_pipe_load_default_fmt:L1I1I Input:
> > invalid idx(4), must < num_fmts(2)
> > [   38.692288]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.693084] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: mtk_imgsys_pipe_load_default_fmt:STATI Input:
> > invalid idx(4), must < num_fmts(2)
> > [   38.700173] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: mtk_imgsys_pipe_load_default_fmt:L0RMVI Input:
> > invalid idx(4), must < num_fmts(2)
> > [   38.701833] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=129
> > [   38.701937] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.701950] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.701951] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.701952] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.701964] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.702949] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: mtk_imgsys_pipe_load_default_fmt:L1RMVI Input:
> > invalid idx(4), must < num_fmts(2)
> > [   38.703842]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.704621] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: mtk_imgsys_pipe_load_default_fmt:MILO Output:
> > invalid idx(4), must < num_fmts(2)
> > [   38.711953] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: mtk_imgsys_pipe_load_default_fmt:L0WMVO Output:
> > invalid idx(4), must < num_fmts(2)
> > [   38.713624] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: mtk_imgsys_pipe_load_default_fmt:L1WMVO Output:
> > invalid idx(4), must < num_fmts(2)
> > [   38.715307] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: mtk_imgsys_pipe_load_default_fmt:CONFO Output:
> > invalid idx(4), must < num_fmts(2)
> > [   38.716968] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: mtk_imgsys_pipe_load_default_fmt:WMAPO Output:
> > invalid idx(4), must < num_fmts(2)
> > [   38.718628] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=130
> > [   38.718738] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.718751] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.718752] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.718753] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.718765] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.719755] <2>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: mtk_imgsys_pipe_load_default_fmt:FMVO Output:
> > invalid idx(4), must < num_fmts(2)
> > [   38.726139]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.734479] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=131
> > [   38.734636] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.735731] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.736369] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.737204] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   38.738021] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.740130]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.744481] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: +,
> > dev(0xe5750c10), num(1)
> > [   38.751212] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=132
> > [   38.752588] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.753430] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   38.754244] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init:
> > cmdq_mbox_create(0, 0xdf6a0380)
> > [   38.754421] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.756279] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.757091] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.758236]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.759774] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init:
> > cmdq_mbox_create(1, 0xdf6a0580)
> > [   38.765270] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init:
> > cmdq_mbox_create(2, 0xdf6a0780)
> > [   38.767835] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=133
> > [   38.768927] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.769761] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   38.770659] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init:
> > cmdq_mbox_create(3, 0xdf6a0980)
> > [   38.770826] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.772604] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.773411] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.774551]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.775922] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init:
> > cmdq_mbox_create(4, 0xdf6a0b80)
> > [   38.781233] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init:
> > cmdq_mbox_create(5, 0xdf6a0d80)
> > [   38.784494] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=134
> > [   38.785619] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.786455] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   38.786479] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init:
> > cmdq_mbox_create(6, 0xdf64c000)
> > [   38.787531] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.789301] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.790117] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.791302]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.792845] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init:
> > cmdq_mbox_create(7, 0xdf6a1080)
> > [   38.793831] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 0 is (traw_cq_thread0_frame_done, 1)
> > [   38.794973] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 1 is (traw_cq_thread1_frame_done, 2)
> > [   38.796153] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 2 is (traw_cq_thread2_frame_done, 3)
> > [   38.797293] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 3 is (traw_cq_thread3_frame_done, 4)
> > [   38.798460] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 4 is (traw_cq_thread4_frame_done, 5)
> > [   38.799613] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 5 is (traw_cq_thread5_frame_done, 6)
> > [   38.800753] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 6 is (traw_cq_thread6_frame_done, 7)
> > [   38.801926] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=135
> > [   38.801978] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.801983] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.801987] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.801990]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.802235] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.802239] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.808933] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 7 is (traw_cq_thread7_frame_done, 8)
> > [   38.810071] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 8 is (traw_cq_thread8_frame_done, 9)
> > [   38.811212] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 9 is (traw_cq_thread9_frame_done, 10)
> > [   38.812360] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 10 is (traw_cq_thread10_frame_done, 11)
> > [   38.813529] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 11 is (traw_cq_thread11_frame_done, 12)
> > [   38.814700] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 12 is (traw_cq_thread12_frame_done, 13)
> > [   38.815878] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 13 is (traw_cq_thread13_frame_done, 14)
> > [   38.817048] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 14 is (traw_cq_thread14_frame_done, 15)
> > [   38.818225] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=136
> > [   38.818273] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.818277] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.818282] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.818286]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.818361] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.818362] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.825030] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 15 is (ltraw_cq_thread0_frame_done, 17)
> > [   38.826198] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 16 is (ltraw_cq_thread1_frame_done, 18)
> > [   38.827371] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 17 is (ltraw_cq_thread2_frame_done, 19)
> > [   38.828539] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 18 is (ltraw_cq_thread3_frame_done, 20)
> > [   38.829708] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 19 is (ltraw_cq_thread4_frame_done, 21)
> > [   38.830877] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 20 is (ltraw_cq_thread5_frame_done, 22)
> > [   38.832053] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 21 is (ltraw_cq_thread6_frame_done, 23)
> > [   38.833221] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 22 is (ltraw_cq_thread7_frame_done, 24)
> > [   38.834396] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 23 is (ltraw_cq_thread8_frame_done, 25)
> > [   38.835565] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=137
> > [   38.835685] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.835686] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.835746] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.836681] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 24 is (ltraw_cq_thread9_frame_done, 26)
> > [   38.837566] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.838570] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 25 is (ltraw_cq_thread10_frame_done, 27)
> > [   38.839467] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.840601] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 26 is (ltraw_cq_thread11_frame_done, 28)
> > [   38.841410]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.842586] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 27 is (ltraw_cq_thread12_frame_done, 29)
> > [   38.847087] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 28 is (ltraw_cq_thread13_frame_done, 30)
> > [   38.848267] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 29 is (ltraw_cq_thread14_frame_done, 31)
> > [   38.849449] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 30 is (dip_cq_thread0_frame_done, 65)
> > [   38.850595] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 31 is (dip_cq_thread1_frame_done, 66)
> > [   38.851750] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=138
> > [   38.851819] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.851826] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.851834] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.851842]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.851868] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.851869] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.858535] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 32 is (dip_cq_thread2_frame_done, 67)
> > [   38.859684] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 33 is (dip_cq_thread3_frame_done, 68)
> > [   38.860831] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 34 is (dip_cq_thread4_frame_done, 69)
> > [   38.861978] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 35 is (dip_cq_thread5_frame_done, 70)
> > [   38.863126] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 36 is (dip_cq_thread6_frame_done, 71)
> > [   38.864272] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 37 is (dip_cq_thread7_frame_done, 72)
> > [   38.865423] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 38 is (dip_cq_thread8_frame_done, 73)
> > [   38.866570] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 39 is (dip_cq_thread9_frame_done, 74)
> > [   38.867724] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 40 is (dip_cq_thread10_frame_done, 75)
> > [   38.868881] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=139
> > [   38.868987] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.868988] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.869099] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.869983] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 41 is (dip_cq_thread11_frame_done, 76)
> > [   38.870875] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.871873] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 42 is (dip_cq_thread12_frame_done, 77)
> > [   38.871874] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 43 is (dip_cq_thread13_frame_done, 78)
> > [   38.871875] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 44 is (dip_cq_thread14_frame_done, 79)
> > [   38.871876] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 45 is (pqa_cq_thread0_frame_done, 81)
> > [   38.871878] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 46 is (pqa_cq_thread1_frame_done, 82)
> > [   38.871879] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 47 is (pqa_cq_thread2_frame_done, 83)
> > [   38.871880] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 48 is (pqa_cq_thread3_frame_done, 84)
> > [   38.871881] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 49 is (pqa_cq_thread4_frame_done, 85)
> > [   38.871882] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 50 is (pqa_cq_thread5_frame_done, 86)
> > [   38.871883] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 51 is (pqa_cq_thread6_frame_done, 87)
> > [   38.871884] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 52 is (pqa_cq_thread7_frame_done, 88)
> > [   38.871885] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 53 is (pqa_cq_thread8_frame_done, 89)
> > [   38.871886] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 54 is (pqa_cq_thread9_frame_done, 90)
> > [   38.871888] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 55 is (pqa_cq_thread10_frame_done, 91)
> > [   38.871889] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 56 is (pqa_cq_thread11_frame_done, 92)
> > [   38.871890] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 57 is (pqa_cq_thread12_frame_done, 93)
> > [   38.871891] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 58 is (pqa_cq_thread13_frame_done, 94)
> > [   38.871892] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 59 is (pqa_cq_thread14_frame_done, 95)
> > [   38.871893] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 60 is (pqb_cq_thread0_frame_done, 97)
> > [   38.871902] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 61 is (pqb_cq_thread1_frame_done, 98)
> > [   38.872772] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.873923] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 62 is (pqb_cq_thread2_frame_done, 99)
> > [   38.874737]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.875886] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 63 is (pqb_cq_thread3_frame_done, 100)
> > [   38.875888] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 64 is (pqb_cq_thread4_frame_done, 101)
> > [   38.875889] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 65 is (pqb_cq_thread5_frame_done, 102)
> > [   38.875890] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 66 is (pqb_cq_thread6_frame_done, 103)
> > [   38.875891] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 67 is (pqb_cq_thread7_frame_done, 104)
> > [   38.875893] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 68 is (pqb_cq_thread8_frame_done, 105)
> > [   38.875894] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 69 is (pqb_cq_thread9_frame_done, 106)
> > [   38.875895] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 70 is (pqb_cq_thread10_frame_done, 107)
> > [   38.875897] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 71 is (pqb_cq_thread11_frame_done, 108)
> > [   38.875898] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 72 is (pqb_cq_thread12_frame_done, 109)
> > [   38.875899] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 73 is (pqb_cq_thread13_frame_done, 110)
> > [   38.875900] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 74 is (pqb_cq_thread14_frame_done, 111)
> > [   38.875901] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 75 is (wpe_eis_cq_thread0_frame_done, 121)
> > [   38.875903] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 76 is (wpe_eis_cq_thread1_frame_done, 122)
> > [   38.875912] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 77 is (wpe_eis_cq_thread2_frame_done, 123)
> > [   38.885112] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=140
> > [   38.885223] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.885224] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.885225] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.885235] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.886379] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 78 is (wpe_eis_cq_thread3_frame_done, 124)
> > [   38.887553] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.888682] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 79 is (wpe_eis_cq_thread4_frame_done, 125)
> > [   38.889837]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.890990] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 80 is (wpe_eis_cq_thread5_frame_done, 126)
> > [   38.901212] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=141
> > [   38.901317] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.901330] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.901331] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.901332] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.901344] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.902498] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 81 is (wpe_eis_cq_thread6_frame_done, 127)
> > [   38.903694]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.904825] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 82 is (wpe_eis_cq_thread7_frame_done, 128)
> > [   38.918898] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=142
> > [   38.919004] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.919005] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.919127] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.919996] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 83 is (wpe_eis_cq_thread8_frame_done, 129)
> > [   38.920860] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.921734] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 84 is (wpe_eis_cq_thread9_frame_done, 130)
> > [   38.922748] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.923545] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 85 is (wpe_eis_cq_thread10_frame_done, 131)
> > [   38.923546] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 86 is (wpe_eis_cq_thread11_frame_done, 132)
> > [   38.923548] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 87 is (wpe_eis_cq_thread12_frame_done, 133)
> > [   38.923549] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 88 is (wpe_eis_cq_thread13_frame_done, 134)
> > [   38.923550] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 89 is (wpe_eis_cq_thread14_frame_done, 135)
> > [   38.923552] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 90 is (wpe_tnr_cq_thread0_frame_done, 136)
> > [   38.923553] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 91 is (wpe_tnr_cq_thread1_frame_done, 137)
> > [   38.923554] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 92 is (wpe_tnr_cq_thread2_frame_done, 138)
> > [   38.923556] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 93 is (wpe_tnr_cq_thread3_frame_done, 139)
> > [   38.923557] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 94 is (wpe_tnr_cq_thread4_frame_done, 140)
> > [   38.923559] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 95 is (wpe_tnr_cq_thread5_frame_done, 141)
> > [   38.923564] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 96 is (wpe_tnr_cq_thread6_frame_done, 142)
> > [   38.924773]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.925905] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 97 is (wpe_tnr_cq_thread7_frame_done, 143)
> > [   38.934980] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=143
> > [   38.935088] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.935101] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.935102] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.935103] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.935115] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.936315] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 98 is (wpe_tnr_cq_thread8_frame_done, 144)
> > [   38.937336]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.938532] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 99 is (wpe_tnr_cq_thread9_frame_done, 145)
> > [   38.951449] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=144
> > [   38.951558] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.951560] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.951565] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.951571] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.952788] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 100 is (wpe_tnr_cq_thread10_frame_done, 146)
> > [   38.953997] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.955193] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 101 is (wpe_tnr_cq_thread11_frame_done, 147)
> > [   38.955194] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 102 is (wpe_tnr_cq_thread12_frame_done, 148)
> > [   38.955196] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 103 is (wpe_tnr_cq_thread13_frame_done, 149)
> > [   38.955197] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 104 is (wpe_tnr_cq_thread14_frame_done, 150)
> > [   38.955198] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 105 is (me_done, 154)
> > [   38.955200] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 106 is (wpe_eis_sync_token, 33)
> > [   38.955202] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 107 is (wpe_tnr_sync_token, 34)
> > [   38.955203] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 108 is (traw_sync_token, 35)
> > [   38.955205] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 109 is (ltraw_sync_token, 36)
> > [   38.955211] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 110 is (dip_sync_token, 37)
> > [   38.956420]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.957616] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 111 is (pqdip_a_sync_token, 38)
> > [   38.967959] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=145
> > [   38.968064] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.968077] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.968078] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.968079] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.968092] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.969223] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 112 is (pqdip_b_sync_token, 39)
> > [   38.970439]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.971436] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 113 is (sw_sync_token_pool_1, 41)
> > [   38.971438] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 114 is (sw_sync_token_pool_2, 42)
> > [   38.971439] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 115 is (sw_sync_token_pool_3, 43)
> > [   38.971441] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 116 is (sw_sync_token_pool_4, 44)
> > [   38.971442] <2>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 117 is (sw_sync_token_pool_5, 45)
> > [   38.971444] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 118 is (sw_sync_token_pool_6, 46)
> > [   38.971445] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 119 is (sw_sync_token_pool_7, 47)
> > [   38.971447] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 120 is (sw_sync_token_pool_8, 48)
> > [   38.971448] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 121 is (sw_sync_token_pool_9, 49)
> > [   38.971450] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 122 is (sw_sync_token_pool_10, 50)
> > [   38.971451] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 123 is (sw_sync_token_pool_11, 51)
> > [   38.971453] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 124 is (sw_sync_token_pool_12, 52)
> > [   38.971454] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 125 is (sw_sync_token_pool_13, 53)
> > [   38.971456] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 126 is (sw_sync_token_pool_14, 54)
> > [   38.971457] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 127 is (sw_sync_token_pool_15, 55)
> > [   38.971459] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 128 is (sw_sync_token_pool_16, 56)
> > [   38.971460] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 129 is (sw_sync_token_pool_17, 57)
> > [   38.971469] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 130 is (sw_sync_token_pool_18, 58)
> > [   38.984447] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=146
> > [   38.984559] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   38.984560] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   38.984561] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   38.984572] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   38.985541] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 131 is (sw_sync_token_pool_19, 59)
> > [   38.986632] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   38.987710] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 132 is (sw_sync_token_pool_20, 60)
> > [   38.987711] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 133 is (sw_sync_token_pool_21, 157)
> > [   38.987713] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 134 is (sw_sync_token_pool_22, 158)
> > [   38.987715] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 135 is (sw_sync_token_pool_23, 159)
> > [   38.987716] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 136 is (sw_sync_token_pool_24, 160)
> > [   38.987718] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 137 is (sw_sync_token_pool_25, 161)
> > [   38.987720] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 138 is (sw_sync_token_pool_26, 162)
> > [   38.987721] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 139 is (sw_sync_token_pool_27, 163)
> > [   38.987723] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 140 is (sw_sync_token_pool_28, 164)
> > [   38.987729] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 141 is (sw_sync_token_pool_29, 165)
> > [   38.988786]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   38.989842] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 142 is (sw_sync_token_pool_30, 166)
> > [   39.001829] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=147
> > [   39.001934] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.001947] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.001948] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.001949] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.001961] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.003056] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 143 is (sw_sync_token_pool_31, 167)
> > [   39.003058] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 144 is (sw_sync_token_pool_32, 168)
> > [   39.003060] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 145 is (sw_sync_token_pool_33, 169)
> > [   39.003061] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 146 is (sw_sync_token_pool_34, 170)
> > [   39.003063] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 147 is (sw_sync_token_pool_35, 171)
> > [   39.003065] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 148 is (sw_sync_token_pool_36, 172)
> > [   39.003066] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 149 is (sw_sync_token_pool_37, 173)
> > [   39.003068] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 150 is (sw_sync_token_pool_38, 174)
> > [   39.003070] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 151 is (sw_sync_token_pool_39, 175)
> > [   39.003071] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 152 is (sw_sync_token_pool_40, 176)
> > [   39.003073] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 153 is (sw_sync_token_camsys_pool_1, 177)
> > [   39.003075] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 154 is (sw_sync_token_camsys_pool_2, 178)
> > [   39.003077] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 155 is (sw_sync_token_camsys_pool_3, 179)
> > [   39.003079] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 156 is (sw_sync_token_camsys_pool_4, 180)
> > [   39.003089] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 157 is (sw_sync_token_camsys_pool_5, 181)
> > [   39.004207]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.005305] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 158 is (sw_sync_token_camsys_pool_6, 182)
> > [   39.018626] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=148
> > [   39.018703] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.018710] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.018719] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.018727]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.018744] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.018745] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.034493] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=149
> > [   39.034575] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.034584] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.034594] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.034602]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.034612] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.034613] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.051414] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=150
> > [   39.051503] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.051513] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.051524] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.051534]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.051535] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.051536] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.068274] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=151
> > [   39.068385] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.068386] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.068387] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.068397] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.069200] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 159 is (sw_sync_token_camsys_pool_7, 183)
> > [   39.070353] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.071350] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 160 is (sw_sync_token_camsys_pool_8, 184)
> > [   39.071353] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 161 is (sw_sync_token_camsys_pool_9, 185)
> > [   39.071355] <6>.(6)[164:kworker/6:2]imgsys_cmdq_init: event idx
> > 162 is (sw_sync_token_camsys_pool_10, 186)
> > [   39.071567] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: Linked as a consumer to regulator.3
> > [   39.072270]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.073273] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmdvfs_init] opp=0, idx=0,
> > clk=249000000 volt=550000
> > [   39.084734] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=152
> > [   39.084825] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.084835] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.084846] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.084856]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.084858] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.084859] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.101793] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=153
> > [   39.101904] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.101905] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.101906] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.101917] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.102773] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmdvfs_init] opp=0, idx=1,
> > clk=343000000 volt=600000
> > [   39.103616] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.104717] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmdvfs_init] opp=0, idx=2,
> > clk=458000000 volt=650000
> > [   39.104725] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmdvfs_init] opp=0, idx=3,
> > clk=650000000 volt=750000
> > [   39.105745]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.106611] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmdvfs_init] opp=1, idx=0,
> > clk=273000000 volt=550000
> > [   39.106619] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmdvfs_init] opp=1, idx=1,
> > clk=364000000 volt=600000
> > [   39.117705] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=154
> > [   39.117795] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.117805] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.117816] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.117826]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.117827] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.117828] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.128437] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmdvfs_init] opp=1, idx=2,
> > clk=458000000 volt=650000
> > [   39.129906] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmdvfs_init] opp=1, idx=3,
> > clk=546000000 volt=750000
> > [   39.131396] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=0,
> > path=00000000a7817f71, name=l9_imgi_t1_a, bw=0
> > [   39.133015] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=1,
> > path=000000006429f43d, name=l9_imgbi_t1_a, bw=0
> > [   39.134641] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=155
> > [   39.134751] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.134754] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.134759] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.134765] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.135760] <2>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=2,
> > path=00000000fcfbe457, name=l9_imgci_t1_a, bw=0
> > [   39.135767] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=3,
> > path=000000001989aea3, name=l9_smti_t1_a, bw=0
> > [   39.135774] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=4,
> > path=00000000b50477d5, name=l9_tncsti_t1_a, bw=0
> > [   39.135783] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=5,
> > path=00000000a87330ce, name=l9_tncsti_t4_a, bw=0
> > [   39.136656] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.137525] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=6,
> > path=00000000af86b6a2, name=l9_yuvo_t1_a, bw=0
> > [   39.138546]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.139345] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=7,
> > path=0000000033a71877, name=l9_timgo_t1_a, bw=0
> > [   39.139353] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=8,
> > path=00000000db8f6999, name=l9_yuvo_t2_a, bw=0
> > [   39.139362] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=9,
> > path=00000000292000de, name=l9_yuvo_t5_a, bw=0
> > [   39.139371] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=10,
> > path=00000000ccadef47, name=l9_tncso_t1_a, bw=0
> > [   39.151247] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=156
> > [   39.151336] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.151345] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.151356] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.151366]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.151368] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.151369] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.162896] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=11,
> > path=000000006354e90a, name=l9_smto_t1_a, bw=0
> > [   39.164529] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=12,
> > path=0000000012aac0ed, name=l9_tncsto_t1_a, bw=0
> > [   39.166182] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=13,
> > path=000000005ce34cb3, name=l9_imgi_t1_b, bw=0
> > [   39.167812] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=157
> > [   39.167916] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.167917] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.167973] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.168911] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=14,
> > path=00000000931784e4, name=l9_imgbi_t1_b, bw=0
> > [   39.169803] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.170808] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=15,
> > path=000000008902c4fb, name=l9_imgci_t1_b, bw=0
> > [   39.171711] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.173306] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=16,
> > path=00000000cff8287b, name=l9_smti_t1_b, bw=0
> > [   39.174121]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.175753] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=17,
> > path=00000000a7225c14, name=l9_yuvo_t2_b, bw=0
> > [   39.175766] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=18,
> > path=0000000055599701, name=l9_yuvo_t5_b, bw=0
> > [   39.182784] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=19,
> > path=00000000056b4bc7, name=l9_smto_t1_b, bw=0
> > [   39.184413] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=158
> > [   39.184514] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.184523] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.184525] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.184529] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.184534] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.184543]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.185530] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=20,
> > path=00000000e904f271, name=l10_imgi_d1_a, bw=0
> > [   39.192849] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=21,
> > path=000000003d11e924, name=l10_imgci_d1_a, bw=0
> > [   39.194501] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=22,
> > path=0000000059ea6b8a, name=l10_depi_d1_a, bw=0
> > [   39.196146] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=23,
> > path=0000000007741faf, name=l10_dmgi_d1_a, bw=0
> > [   39.197790] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=24,
> > path=000000001c2d9269, name=l10_vipi_d1_a, bw=0
> > [   39.199439] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=25,
> > path=0000000026de7acd, name=l10_tnrwi_d1_a, bw=0
> > [   39.201085] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=159
> > [   39.201195] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.201196] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.201197] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.201208] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.202198] <2>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=26,
> > path=00000000f8edb550, name=l10_reci_d1_a, bw=0
> > [   39.203095] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.203947] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=27,
> > path=00000000ba093e63, name=l10_smti_d1_a, bw=0
> > [   39.204962]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.205764] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=28,
> > path=0000000099c0153d, name=l10_smti_d6_a, bw=0
> > [   39.212813] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=29,
> > path=000000005f53595f, name=l10_img3o_d1_a, bw=0
> > [   39.214471] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=30,
> > path=00000000fe10028d, name=l10_img4o_d1_a, bw=0
> > [   39.216134] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=31,
> > path=00000000781be879, name=l10_img3co_d1_a, bw=0
> > [   39.217793] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=160
> > [   39.217904] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.217905] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.217906] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.217917] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.218907] <2>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=32,
> > path=000000005d003abb, name=l10_feo_d1_a, bw=0
> > [   39.219785] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.220653] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=33,
> > path=000000009bcfcf62, name=l10_img2o_d1_a, bw=0
> > [   39.221659]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.222468] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=34,
> > path=00000000ecb9848c, name=l10_tnrwo_d1_a, bw=0
> > [   39.229523] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=35,
> > path=00000000be98ea77, name=l10_smto_d1_a, bw=0
> > [   39.231170] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=36,
> > path=000000008c36a801, name=l10_pimgi_p1_a, bw=0
> > [   39.232829] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=37,
> > path=00000000f17786f2, name=l10_pimgbi_p1_a, bw=0
> > [   39.234488] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=161
> > [   39.234593] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.234606] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.234607] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.234608] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.234620] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.235611] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=38,
> > path=0000000014d62cdb, name=l10_pimgci_p1_a, bw=0
> > [   39.235629] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=39,
> > path=000000003fefb4ff, name=l10_wrot_p1_a, bw=0
> > [   39.236497]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.237299] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=40,
> > path=000000009e037dfe, name=l10_pimgi_p1_b, bw=0
> > [   39.246258] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=41,
> > path=00000000c4317baf, name=l10_pimgbi_p1_b, bw=0
> > [   39.247929] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=42,
> > path=0000000037bd2e3e, name=l10_pimgci_p1_b, bw=0
> > [   39.249602] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=43,
> > path=00000000f834340f, name=l10_wrot_p1_b, bw=0
> > [   39.251244] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=162
> > [   39.251323] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.251332] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.251341] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.251350]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.251362] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.251363] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.258046] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=44,
> > path=0000000012df1e64, name=l11_wpe_eis_rdma0_a, bw=0
> > [   39.259762] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=45,
> > path=000000001a5a43e8, name=l11_wpe_eis_rdma1_a, bw=0
> > [   39.261476] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=46,
> > path=00000000934599cb, name=l11_wpe_eis_wdma0_a, bw=0
> > [   39.263195] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=47,
> > path=00000000d30c34e8, name=l11_wpe_eis_cq0_a, bw=0
> > [   39.264889] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=48,
> > path=0000000022e7adf1, name=l11_wpe_eis_cq1_a, bw=0
> > [   39.266585] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=49,
> > path=00000000de965e36, name=l11_wpe_tnr_rdma0_a, bw=0
> > [   39.268290] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=163
> > [   39.268393] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.268394] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.268425] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.269400] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=50,
> > path=000000004a249666, name=l11_wpe_tnr_rdma1_a, bw=0
> > [   39.270279] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.271297] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=51,
> > path=000000000255774d, name=l11_wpe_tnr_wdma0_a, bw=0
> > [   39.271318] <2>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=52,
> > path=00000000765aafb3, name=l11_wpe_tnr_cq0_a, bw=0
> > [   39.272181] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.273883] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=53,
> > path=00000000ad644f28, name=l11_wpe_tnr_cq1_a, bw=0
> > [   39.274685]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.276394] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=54,
> > path=000000007f30f8e1, name=l12_me_rdma, bw=0
> > [   39.283524] <6>.(6)[164:kworker/6:2]camera-dip
> > 15000000.imgsys_fw: [mtk_imgsys_mmqos_init] idx=55,
> > path=0000000052758214, name=l12_me_wdma, bw=0
> > [   39.285138] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=164
> > [   39.285211] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.285219] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.285228] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.285235]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.285255] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.285256] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.291939]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     39291.937785:probe:
> > probe=platform_drv_probe drv=camera-
> > dip(0xffffff800961b1b0)   632.723309ms
> > [   39.293578] <6>.(6)[164:kworker/6:2]probe of 15000000.imgsys_fw
> > returned 1 after 647816 usecs
> > [   39.295121] <6>.(6)[164:kworker/6:2]mt8195-sound sound: Linked
> > as a consumer to regulator.43
> > [   39.296211] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   39.297093] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   39.297974] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   39.298858] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   39.299741] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   39.300619] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   39.301514] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=165
> > [   39.301624] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.301637] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.301638] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.301640] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.301652] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.302635] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   39.303541]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.304308] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   39.310100] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   39.310978] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   39.311859] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   39.312737] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   39.313615] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   39.314494] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   39.315380] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   39.316260] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   39.317148] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   39.318138] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=166
> > [   39.318244] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.318257] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.318258] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.318259] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.318271] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.319251] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   39.319253] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   39.319254] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   39.319261] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   39.319263] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   39.319266] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   39.319268] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   39.319279] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   39.320149]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.320946] <6>.(6)[164:kworker/6:2]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   39.333860]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     39333.859785:probe:
> > probe=platform_drv_probe drv=mt8195-
> > sound(0xffffff800966ce50)    38.840308ms
> > [   39.335499] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=167
> > [   39.335608] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.335611] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.335616] <2>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.335621] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.336629] <2>.(6)[164:kworker/6:2]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   39.337487] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.338372] <6>.(6)[164:kworker/6:2]probe of sound returned 0
> > after 43500 usecs
> > [   39.339414]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.340297] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs: Linked
> > as a consumer to 1100b000.lvts
> > [   39.345380] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs: Linked
> > as a consumer to 13000000.mali
> > [   39.346469] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs:
> > svs_efuse[10] = 0x0?
> > [   39.347374] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs: svs is
> > not supported
> > [   39.348276] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs:
> > Dropping the link to 13000000.mali
> > [   39.349330] <6>.(6)[164:kworker/6:2]mtk-svs 1100b000.svs:
> > Dropping the link to 1100b000.lvts
> > [   39.350383] <6>.(6)[164:kworker/6:2]mtk-svs: probe of
> > 1100b000.svs failed with error -1
> > [   39.351144] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=168
> > [   39.351391] <6>.(6)[164:kworker/6:2]probe of 1100b000.svs
> > returned 0 after 11173 usecs
> > [   39.351481] <1>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.351491] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.351502] <1>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.351512]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.353048] <6>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.353433] <6>.(6)[164:kworker/6:2]apusys_drv_reviser
> > 19021000.apusys_reviser: [reviser_probe] apusys_init okay
> > [   39.354184] <6>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.355809] <6>.(6)[164:kworker/6:2]probe of
> > 19021000.apusys_reviser returned 1 after 2387 usecs
> > [   39.361545] <6>.(6)[164:kworker/6:2]mt8195-sound sound: Linked
> > as a consumer to regulator.43
> > [   39.362629] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   39.363525] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   39.364404] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   39.365287] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   39.366165] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   39.367043] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   39.367610] <2>-(2)[294:reviser][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=169
> > [   39.367946] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   39.367988] <2>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.367991] <6>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.367995] <2>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.367999]
> > <6>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.369142] <6>-(2)[294:reviser][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.369764] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   39.370622] <6>-(2)[294:reviser][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.371425] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   39.377125] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   39.378007] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   39.378886] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   39.379774] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   39.380654] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   39.381536] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   39.382424] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   39.383319] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   39.384270] <4>-(4)[294:reviser][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=170
> > [   39.384315] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   39.384443] <4>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.384458] <6>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.384473] <4>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.384488]
> > <6>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.385371] <6>-(4)[294:reviser][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.386171] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   39.387024] <4>-(4)[294:reviser][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.387829] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   39.391037] <4>.(4)[294:reviser][reviser]reviser_mem_alloc
> > mem(0x8000000/58720256/0xffffff8015601000)
> > [   39.391784] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   39.392740] <6>.(4)[294:reviser][reviser]reviser_memory_func
> > reviser memory init
> > [   39.393650] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   39.397637] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   39.398532] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   39.399472] <6>.(6)[164:kworker/6:2]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   39.400585] <6>.(6)[164:kworker/6:2]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   39.401839] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=171
> > [   39.401956] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.401969] <6>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.401970] <0>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.401972] <6>-(6)[164:kworker/6:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.401984] <6>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.402973]
> > <6>.(6)[164:kworker/6:2]BOOTPROF:     39402.972554:probe:
> > probe=platform_drv_probe drv=mt8195-
> > sound(0xffffff800966ce50)    41.483230ms
> > [   39.403875]
> > <6>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.404675] <6>.(6)[164:kworker/6:2]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   39.411367] <6>.(6)[164:kworker/6:2]probe of sound returned 0
> > after 49996 usecs
> > [   39.412937] <7>.(7)[73:kworker/7:1]mt8195-sound sound: Linked as
> > a consumer to regulator.43
> > [   39.414011] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   39.414886] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   39.415777] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   39.416649] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   39.417539] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   39.418416] <7>-(7)[73:kworker/7:1][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=172
> > [   39.418724] <0>-(7)[73:kworker/7:1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.418728] <7>-(7)[73:kworker/7:1][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.418881] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.419755] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   39.419761] <0>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   39.419775] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   39.420657] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.421654] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   39.422524] <7>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.423406] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   39.423411] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   39.423422] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   39.424315]
> > <7>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.425179] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   39.432494] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   39.433368] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   39.434253] <7>-(7)[73:kworker/7:1][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=173
> > [   39.434488] <0>-(7)[73:kworker/7:1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.434490] <7>-(7)[73:kworker/7:1][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.434634] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.435486] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   39.435490] <0>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   39.435494] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   39.435498] <0>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   39.435502] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   39.435510] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   39.435522] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   39.436404] <7>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.437399] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   39.438269] <7>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.439150] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   39.439156] <7>.(7)[73:kworker/7:1]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   39.439171] <7>.(7)[73:kworker/7:1]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   39.440150]
> > <7>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.441064]
> > <7>.(7)[73:kworker/7:1]BOOTPROF:     39441.062477:probe:
> > probe=platform_drv_probe drv=mt8195-
> > sound(0xffffff800966ce50)    28.243385ms
> > [   39.450917] <7>-(7)[73:kworker/7:1][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=174
> > [   39.451020] <7>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.451031] <7>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.451042] <7>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.451077]
> > <7>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.451097] <7>-(7)[73:kworker/7:1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.451099] <7>-(7)[73:kworker/7:1][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.460398] <7>.(7)[73:kworker/7:1]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   39.461434] <7>.(7)[73:kworker/7:1]probe of sound returned 0
> > after 48776 usecs
> > [   39.462365]
> > <7>.(7)[1:swapper/0]BOOTPROF:     39462.363862:initcall:
> > deferred_probe_initcall 19632.176431ms
> > [   39.463588] <7>.(7)[1:swapper/0]initcall
> > deferred_probe_initcall+0x0/0x1a8 returned 0 after 19173244 usecs
> > [   39.464797]
> > <7>.(7)[1:swapper/0]calling  genpd_power_off_unused+0x0/0x90 @ 1
> > [   39.465694] <7>.(7)[1:swapper/0]initcall
> > genpd_power_off_unused+0x0/0x90 returned 0 after 15 usecs
> > [   39.466809]
> > <7>.(7)[1:swapper/0]calling  genpd_debug_init+0x0/0x1b8 @ 1
> > [   39.467640] <7>-(7)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=175
> > [   39.467750] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.467763] <7>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.467764] <0>-(7)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.467765] <0>-(7)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.467778] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.469108] <4>.(7)[1:swapper/0]initcall
> > genpd_debug_init+0x0/0x1b8 returned 0 after 384 usecs
> > [   39.469590]
> > <4>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.470382] <4>.(7)[1:swapper/0]calling  tz_client_init+0x0/0x44
> > @ 1
> > [   39.472269] <4>.(4)[295:ree_service][CMDQ_TZ][MSG]-->init: core
> > [   39.477379] <4>.(4)[295:ree_service][CMDQ_TZ][MSG]-->init: core
> > done
> > [   39.478544] <4>.(4)[295:ree_service][CMDQ_TZ][ERR]regiter secure
> > irq 131, status:0
> > [   39.478915]
> > <4>.(4)[295:ree_service][CMDQ_TZ][LOG]MTEE_RequestIrq
> > CMDQ_SECURE_IRQ success[131]
> > [   39.481364] <4>.(4)[295:ree_service][dovi_tz] tz_dovi_init
> > [   39.482436] <4>.(4)[295:ree_service][hdmi]MTEE_HDMIInit()
> > [   39.484237] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=176
> > [   39.484423] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.485329] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.486054] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.486886] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.487724] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.488675] <4>.(4)[295:ree_service][DEVAPC] INFRA Violation (R)
> > - Vio Addr: 0x13fbf000, High: 0x80, Bus ID: 0x91, Domain ID: 0x0
> > [   39.489803]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.491501] <4>.(4)[295:ree_service][DEVAPC] INFRA Violation (R)
> > - Vio Addr: 0x10211104, High: 0x80, Bus ID: 0x91, Domain ID: 0x0
> > [   39.494103] <4>.(4)[295:ree_service][DEVAPC] INFRA Violation (R)
> > - Vio Addr: 0x14e00000, High: 0x80, Bus ID: 0x122, Domain ID: 0x0
> > [   39.495973] <4>.(4)[295:ree_service][DEVAPC][TEE] RequestIrq is
> > successful: (0)
> > [   39.497620]
> > <5>.(5)[1:swapper/0]BOOTPROF:     39497.615478:probe:
> > probe=platform_drv_probe
> > drv=mtk_tz(0xffffff80095e1d28)    26.915923ms
> > E/LD:  init_elf:438 sys_open_ta_bin(5b[   39.499608]
> > <5>.(5)[53:kworker/5:1]mt8195-sound sound: Linked as a consumer to
> > regulator.43
> > c52d1c-[   39.500718] <5>.(5)[53:kworker/5:1]mt8195-sound sound:
> > ASoC: binding DL2_FE
> > [   39.501612] <5>-(5)[53:kworker/5:1][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=177
> > 
> > [   39.501913] <5>-(5)[53:kworker/5:1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.501918] <0>-(5)[53:kworker/5:1][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.503094] <5>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.503810] <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   39.504799] <5>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.505656] <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   39.506537] <5>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > E[   39.507343] <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > /[   39.507349] <5>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > TC[   39.507354] <5>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > :? [   39.507361] <5>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > 0 [   39.507366] <5>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > i[   39.507371] <5>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > nit[   39.507381] <5>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > _w[   39.508252]
> > <5>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > i[   39.509391] <5>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > th_ld[   39.517531] <5>.(5)[1:swapper/0]probe of mtee returned 1
> > after 46859 usecs
> > elf:232 ldelf fai[l   39.518394] <5>-(5)[1:swapper/0][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=178
> > e[   39.518575] <5>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > d w[   39.518577] <5>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > ith res: 0[   39.521465]
> > <5>.(5)[1:swapper/0]BOOTPROF:     39521.463555:initcall:
> > tz_client_init    51.075077ms
> > xf[   39.522602] <5>.(5)[1:swapper/0]initcall
> > tz_client_init+0x0/0x44 returned 0 after 50991 usecs
> > ff[   39.523676] <5>.(5)[1:swapper/0]calling  tz_ndbg_init+0x0/0x3c
> > @ 1
> > [   39.524507] <5>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > 
> > [   39.524819] <0>.(0)[1:swapper/0]initcall tz_ndbg_init+0x0/0x3c
> > returned 0 after 317 usecs
> > [   39.525385] <5>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > E/TC[   39.526415]
> > <0>.(0)[1:swapper/0]calling  mdla_mod_init+0x0/0x48 @ 1
> > :[   39.526466] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > ? 0[   39.526469] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> >  [   39.526473] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > te[   39.526477]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > e_[   39.527299] <5>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > t[   39.527307] <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > a_[   39.528910] <5>.(0)[1:swapper/0]iommu: Adding device
> > 19034000.mdla to group 6
> > open_session:728 Failed. Re[   39.528983]
> > <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC: binding UL10_FE
> > turn[   39.529807] <0>.(0)[1:swapper/0]mtk_mdla 19034000.mdla: ver
> > = 81950200
> >  [   39.530933] <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > e[   39.530935] <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > r[   39.530938] <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > ro[   39.530942] <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > r[   39.531985] <0>.(0)[1:swapper/0]mtk_mdla 19034000.mdla: core
> > number = 2, sw_cfg = 0x28
> >  0[   39.532847] <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > x[   39.533727] <0>.(0)[1:swapper/0]mtk_mdla 19034000.mdla:
> > mdla_v2_0_init()
> > ff[   39.534624] <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > ff[   39.534628] <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > 00[   39.534631] <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > 0[   39.534635] <0>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > c[   39.534640] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=179
> > [   39.534646] <0>.(5)[53:kworker/5:1]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > 
> > [   39.534653]
> > <0>.(5)[53:kworker/5:1]BOOTPROF:     39534.652093:probe:
> > probe=platform_drv_probe drv=mt8195-
> > sound(0xffffff800966ce50)    35.136077ms
> > [   39.534683] <4>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.534686] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.534688] <1>.(5)[53:kworker/5:1]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   39.534690] <7>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.534694]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.534716] <7>.(5)[53:kworker/5:1]probe of sound returned 0
> > after 35351 usecs
> > [   39.534908] <1>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.534911] <7>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.549365] <1>.(4)[298:update_tz_count]ret=-65524
> > [   39.549368] <7>.(4)[298:update_tz_count]CreateSession error
> > -65536
> > [   39.550959] <7>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=180
> > [   39.551007] <7>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.551225] <7>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.551228] <7>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.551354] <7>.(7)[1:swapper/0]mtk_mdla 19034000.mdla: Device
> > Tree Probing
> > [   39.551500] <7>.(7)[1:swapper/0]mtk_mdla 19034000.mdla:
> > IORESOURCE_MEM (num = 0) at 0x19034000 mapped to 0x19034fff
> > [   39.551502] <7>.(7)[1:swapper/0]mtk_mdla 19034000.mdla:
> > IORESOURCE_MEM (num = 1) at 0x19036000 mapped to 0x19036fff
> > [   39.551505] <7>.(7)[1:swapper/0]mtk_mdla 19034000.mdla:
> > IORESOURCE_MEM (num = 2) at 0x19035000 mapped to 0x19035fff
> > [   39.551506] <7>.(7)[1:swapper/0]mtk_mdla 19034000.mdla:
> > IORESOURCE_MEM (num = 3) at 0x19038000 mapped to 0x19038fff
> > [   39.551508] <1>.(7)[1:swapper/0]mtk_mdla 19034000.mdla:
> > IORESOURCE_MEM (num = 4) at 0x1903a000 mapped to 0x1903afff
> > [   39.551511] <7>.(7)[1:swapper/0]mtk_mdla 19034000.mdla:
> > IORESOURCE_MEM (num = 5) at 0x19039000 mapped to 0x19039fff
> > [   39.551546] <1>.(7)[1:swapper/0]mtk_mdla 19034000.mdla:
> > request_irq 382 done
> > [   39.551555] <7>.(7)[1:swapper/0]mtk_mdla 19034000.mdla:
> > request_irq 383 done
> > [   39.552885] <7>.(7)[1:swapper/0][apusys][warn] mdw_rsc_add_dev
> > dev overwrite idx(0->1)
> > [   39.553670] <7>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.555399] <7>.(7)[1:swapper/0][apusys][warn] mdw_rsc_add_dev
> > dev overwrite idx(0->1)
> > [   39.555851] <7>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.557247] <7>.(7)[1:swapper/0]mtk_mdla 19034000.mdla:
> > mdla_probe: done
> > [   39.557577]
> > <7>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.558560]
> > <7>.(7)[1:swapper/0]BOOTPROF:     39558.556093:probe:
> > probe=platform_drv_probe
> > drv=mtk_mdla(0xffffff80095e63d8)    28.739616ms
> > [   39.568343] <7>-(7)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=181
> > [   39.568476] <7>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.568478] <7>-(7)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.568481] <7>-(7)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.568490] <7>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.568504] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.570179] <7>.(7)[296:kworker/7:2]mt8195-sound sound: Linked
> > as a consumer to regulator.43
> > [   39.571145]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.571345] <7>.(5)[1:swapper/0]probe of 19034000.mdla returned
> > 1 after 42523 usecs
> > [   39.571515] <1>.(5)[1:swapper/0]mdla_init() done
> > [   39.571520]
> > <7>.(5)[1:swapper/0]BOOTPROF:     39571.519555:initcall:
> > mdla_mod_init    43.419385ms
> > [   39.571523] <1>.(5)[1:swapper/0]initcall mdla_mod_init+0x0/0x48
> > returned 0 after 42407 usecs
> > [   39.571526] <7>.(5)[1:swapper/0]calling  vpu_init+0x0/0x2b0 @ 1
> > [   39.571760] <7>.(5)[1:swapper/0]vpu_init_bin: mapped vpu
> > firmware: pa: 0xbed90000, size: 0x1070000, kva: 0xffffff801a000000
> > [   39.571761] <7>.(5)[1:swapper/0]vpu_init_bin: header: 0x921000,
> > preload:0x92b000
> > [   39.572449] <7>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   39.585106] <7>-(7)[296:kworker/7:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=182
> > [   39.585242] <7>-(7)[296:kworker/7:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.585244] <7>-(7)[296:kworker/7:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.585307] <7>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.586069] <7>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   39.587212] <7>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.588255] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   39.589275] <7>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.590222] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   39.590811]
> > <7>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.591908] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   39.591911] <7>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   39.591913] <7>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   39.591916] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   39.591918] <7>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   39.591920] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   39.591930] <7>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   39.601511] <4>-(7)[296:kworker/7:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=183
> > [   39.601619] <7>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.601632] <4>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.601633] <7>-(7)[296:kworker/7:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.601634] <4>-(7)[296:kworker/7:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.601647] <7>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.602446] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   39.602742] <7>.(4)[1:swapper/0]iommu: Adding device
> > 19030000.vpu_core0 to group 7
> > [   39.602793] <4>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > [vpu_probe] apusys_init okay
> > [   39.602887] <7>.(4)[1:swapper/0]vpu 19030000.vpu_core0: mapped
> > reg: 0xffffff800df7d000: 0x19030000 ~ 0x19030fff
> > [   39.602900] <4>.(4)[1:swapper/0]vpu 19030000.vpu_core0: mapped
> > dmem: 0xffffff8014f80000: 0x1d400000 ~ 0x1d43ffff
> > [   39.602905] <7>.(4)[1:swapper/0]vpu 19030000.vpu_core0: mapped
> > imem: 0xffffff8015440000: 0x1d440000 ~ 0x1d46ffff
> > [   39.602919] <4>.(4)[1:swapper/0]vpu 19030000.vpu_core0: mapped
> > dbg: 0xffffff8014f58000: 0xd190000 ~ 0xd193fff
> > [   39.602922] <7>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_iova_dts: reset-vector: addr: 7da00000h, size: 00100000h, bin:
> > 00000000h
> > [   39.602924] <4>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_iova_dts: main-prog: addr: 7db00000h, size: 00300000h, bin:
> > 00100000h
> > [   39.602925] <7>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_iova_dts: kernel-lib: addr: 7de00000h, size: 00500000h, bin:
> > ffffffffh
> > [   39.602927] <4>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_iova_dts: iram-data: addr: 00000000h, size: 00010000h, bin:
> > 00900000h
> > [   39.602928] <7>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_iova_dts: work-buf: addr: 00000000h, size: 00012000h, bin:
> > ffffffffh
> > [   39.602929] <4>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_iova_dts: algo: addr: 00000000h, size: 00100000h, bin:
> > 00800000h
> > [   39.602957] <7>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 100000, mapped iova:
> > 0x382500000 (dynamic alloc)
> > [   39.602969] <1>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 100000, mapped iova:
> > 0x37da00000 (static alloc)
> > [   39.602991] <7>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 300000, mapped iova:
> > 0x37db00000 (static alloc)
> > [   39.602995] <1>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 12000, mapped iova:
> > 0x3824e0000 (dynamic alloc)
> > [   39.602998] <7>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 10000, mapped iova:
> > 0x3824d0000 (dynamic alloc)
> > [   39.603010] <1>.(4)[1:swapper/0]vpu_init_dev_irq: vpu0: IRQ: 380
> > [   39.603030] <7>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 2000, mapped iova:
> > 0x3824ce000 (dynamic alloc)
> > [   39.603032] <4>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 2000, mapped iova:
> > 0x3824cc000 (dynamic alloc)
> > [   39.603034] <7>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 2000, mapped iova:
> > 0x3824ca000 (dynamic alloc)
> > [   39.603035] <4>.(4)[1:swapper/0]vpu_init_dev_pwr: vpu0:
> > apu_power_device_register call
> > [   39.603068] <7>.(4)[1:swapper/0]vpu_init_dev_algo_normal: vpu0,
> > total algo count: 0
> > [   39.603071] <4>.(4)[1:swapper/0]vpu_init_dev_algo_normal:
> > vpu0(61h): vpu_flo_d2d_k7: off: 800000, mva: 82500000, len: 7f4ae
> > [   39.603080] <7>.(4)[1:swapper/0]vpu_init_dev_algo_normal: vpu0,
> > total algo count: 1
> > [   39.603082] <1>.(4)[1:swapper/0]vpu_init_dev_algo_normal: vpu0,
> > total algo count: 1
> > [   39.603105] <7>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 20000, mapped iova:
> > 0x371400000 (static alloc)
> > [   39.603107] <1>.(4)[1:swapper/0]preload_iova_alloc: vpu0:
> > addr:0x71400000, size: 0x20000, bin: 0x92B000, mva: 0x371400000
> > [   39.603110] <4>.(4)[1:swapper/0]vpu_init_dev_algo_preload_entry:
> > vpu0(61h): vpu_flo_d2d_k7 <PROG>: off: 92b000, mva: 371400000,
> > size: 20000, addr: 71400000
> > [   39.603129] <4>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 37000, mapped iova:
> > 0x382480000 (dynamic alloc)
> > [   39.603130] <4>.(4)[1:swapper/0]preload_iova_alloc: vpu0:
> > addr:0x0, size: 0x37000, bin: 0x94B000, mva: 0x382480000
> > [   39.603132] <4>.(4)[1:swapper/0]vpu_init_dev_algo_preload_entry:
> > vpu0(61h): vpu_flo_d2d_k7 <IRAM>: off: 94b000, mva: 382480000,
> > size: 37000, addr: 0
> > [   39.603149] <4>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 10000, mapped iova:
> > 0x371900000 (static alloc)
> > [   39.603150] <4>.(4)[1:swapper/0]preload_iova_alloc: vpu0:
> > addr:0x71900000, size: 0x10000, bin: 0x982000, mva: 0x371900000
> > [   39.603152] <4>.(4)[1:swapper/0]vpu_init_dev_algo_preload_entry:
> > vpu0(61h): vpu_flo_d2d_ksample <PROG>: off: 982000, mva: 371900000,
> > size: 10000, addr: 71900000
> > [   39.603157] <4>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 4000, mapped iova:
> > 0x38247c000 (dynamic alloc)
> > [   39.603158] <1>.(4)[1:swapper/0]preload_iova_alloc: vpu0:
> > addr:0x0, size: 0x4000, bin: 0x992000, mva: 0x38247c000
> > [   39.603160] <4>.(4)[1:swapper/0]vpu_init_dev_algo_preload_entry:
> > vpu0(61h): vpu_flo_d2d_ksample <IRAM>: off: 992000, mva: 38247c000,
> > size: 4000, addr: 0
> > [   39.603317] <1>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 240000, mapped iova:
> > 0x370000000 (static alloc)
> > [   39.603318] <4>.(4)[1:swapper/0]preload_iova_alloc: vpu0:
> > addr:0x70000000, size: 0x240000, bin: 0xA01000, mva: 0x370000000
> > [   39.603320] <1>.(4)[1:swapper/0]vpu_init_dev_algo_preload_entry:
> > vpu0(61h): apu_lib_apunn <PROG>: off: a01000, mva: 370000000, size:
> > 240000, addr: 70000000
> > [   39.603325] <1>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_map_sg_to_iova: sg_dma_address: size: 2000, mapped iova:
> > 0x38247a000 (dynamic alloc)
> > [   39.603326] <1>.(4)[1:swapper/0]preload_iova_alloc: vpu0:
> > addr:0x0, size: 0x2000, bin: 0xC41000, mva: 0x38247a000
> > [   39.603355]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.604462] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   39.605340] <4>.(4)[1:swapper/0]vpu_init_dev_algo_preload_entry:
> > vpu0(61h): apu_lib_apunn <IRAM>: off: c41000, mva: 38247a000, size:
> > 2000, addr: 0
> > [   39.606347] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   39.608199] <4>.(4)[1:swapper/0]vpu 19030000.vpu_core0:
> > vpu_probe: succeed
> > [   39.609002] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   39.609894] <4>.(4)[1:swapper/0]probe of 19030000.vpu_core0
> > returned 1 after 7189 usecs
> > [   39.610758] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   39.611695] <4>.(4)[1:swapper/0]iommu: Adding device
> > 19031000.vpu_core1 to group 7
> > [   39.612517] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   39.613505] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > [vpu_probe] apusys_init okay
> > [   39.614358] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   39.614360] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   39.615229] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1: mapped
> > reg: 0xffffff800dfc5000: 0x19031000 ~ 0x19031fff
> > [   39.616047] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   39.617066] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1: mapped
> > dmem: 0xffffff8015480000: 0x1d500000 ~ 0x1d53ffff
> > [   39.618193] <4>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=184
> > [   39.618201] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   39.618204] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   39.618206] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   39.618210] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   39.618213] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   39.618221] <4>.(7)[296:kworker/7:2]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   39.618228]
> > <4>.(7)[296:kworker/7:2]BOOTPROF:     39618.227401:probe:
> > probe=platform_drv_probe drv=mt8195-
> > sound(0xffffff800966ce50)    48.130923ms
> > [   39.618255] <4>.(7)[296:kworker/7:2]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   39.618281] <4>.(7)[296:kworker/7:2]probe of sound returned 0
> > after 48324 usecs
> > [   39.618306] <4>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.618320] <4>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.618334] <4>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.618348]
> > <4>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.618349] <4>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.618350] <4>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.618562] <4>.(7)[296:kworker/7:2]mt8195-sound sound: Linked
> > as a consumer to regulator.43
> > [   39.619245] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1: mapped
> > imem: 0xffffff8018e40000: 0x1d540000 ~ 0x1d56ffff
> > [   39.620213] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   39.621168] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1: mapped
> > dbg: 0xffffff8014f70000: 0xd194000 ~ 0xd197fff
> > [   39.622404] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   39.623682] <1>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_iova_dts: reset-vector: addr: 7e300000h, size: 00100000h, bin:
> > 00400000h
> > [   39.624938] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   39.626170] <1>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_iova_dts: main-prog: addr: 7e400000h, size: 00300000h, bin:
> > 00500000h
> > [   39.627652] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   39.627653] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   39.627656] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   39.629104] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_iova_dts: kernel-lib: addr: 7e700000h, size: 00500000h, bin:
> > ffffffffh
> > [   39.630562] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   39.632018] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_iova_dts: iram-data: addr: 00000000h, size: 00010000h, bin:
> > 00910000h
> > [   39.632019] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_iova_dts: work-buf: addr: 00000000h, size: 00012000h, bin:
> > ffffffffh
> > [   39.633456] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   39.634853] <4>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=185
> > [   39.634966] <4>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.634974] <4>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.634975] <4>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.634993] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_map_sg_to_iova: sg_dma_address: size: 100000, mapped iova:
> > 0x37e300000 (static alloc)
> > [   39.635017] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_map_sg_to_iova: sg_dma_address: size: 300000, mapped iova:
> > 0x37e400000 (static alloc)
> > [   39.635024] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_map_sg_to_iova: sg_dma_address: size: 12000, mapped iova:
> > 0x382440000 (dynamic alloc)
> > [   39.635027] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_map_sg_to_iova: sg_dma_address: size: 10000, mapped iova:
> > 0x382430000 (dynamic alloc)
> > [   39.635037] <4>.(4)[1:swapper/0]vpu_init_dev_irq: vpu1: IRQ: 381
> > [   39.635060] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_map_sg_to_iova: sg_dma_address: size: 2000, mapped iova:
> > 0x38242e000 (dynamic alloc)
> > [   39.635064] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_map_sg_to_iova: sg_dma_address: size: 2000, mapped iova:
> > 0x38242c000 (dynamic alloc)
> > [   39.635066] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_map_sg_to_iova: sg_dma_address: size: 2000, mapped iova:
> > 0x38242a000 (dynamic alloc)
> > [   39.635067] <4>.(4)[1:swapper/0]vpu_init_dev_pwr: vpu1:
> > apu_power_device_register call
> > [   39.635090] <4>.(4)[1:swapper/0]vpu_init_dev_algo_normal: vpu1,
> > total algo count: 0
> > [   39.635094] <4>.(4)[1:swapper/0]vpu_init_dev_algo_normal:
> > vpu1(62h): vpu_flo_d2d_k7: off: 87f4b0, mva: 8257f4b0, len: 7f4ae
> > [   39.635102] <4>.(4)[1:swapper/0]vpu_init_dev_algo_normal: vpu1,
> > total algo count: 1
> > [   39.635104] <4>.(4)[1:swapper/0]vpu_init_dev_algo_normal: vpu1,
> > total algo count: 1
> > [   39.635128] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_map_sg_to_iova: sg_dma_address: size: 20000, mapped iova:
> > 0x375400000 (static alloc)
> > [   39.635129] <4>.(4)[1:swapper/0]preload_iova_alloc: vpu1:
> > addr:0x75400000, size: 0x20000, bin: 0x996000, mva: 0x375400000
> > [   39.635132] <4>.(4)[1:swapper/0]vpu_init_dev_algo_preload_entry:
> > vpu1(62h): vpu_flo_d2d_k7 <PROG>: off: 996000, mva: 375400000,
> > size: 20000, addr: 75400000
> > [   39.635153] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_map_sg_to_iova: sg_dma_address: size: 37000, mapped iova:
> > 0x3823c0000 (dynamic alloc)
> > [   39.635154] <4>.(4)[1:swapper/0]preload_iova_alloc: vpu1:
> > addr:0x0, size: 0x37000, bin: 0x9B6000, mva: 0x3823c0000
> > [   39.635156] <4>.(4)[1:swapper/0]vpu_init_dev_algo_preload_entry:
> > vpu1(62h): vpu_flo_d2d_k7 <IRAM>: off: 9b6000, mva: 3823c0000,
> > size: 37000, addr: 0
> > [   39.635175] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_map_sg_to_iova: sg_dma_address: size: 10000, mapped iova:
> > 0x375900000 (static alloc)
> > [   39.635176] <4>.(4)[1:swapper/0]preload_iova_alloc: vpu1:
> > addr:0x75900000, size: 0x10000, bin: 0x9ED000, mva: 0x375900000
> > [   39.635178] <4>.(4)[1:swapper/0]vpu_init_dev_algo_preload_entry:
> > vpu1(62h): vpu_flo_d2d_ksample <PROG>: off: 9ed000, mva: 375900000,
> > size: 10000, addr: 75900000
> > [   39.635183] <4>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_map_sg_to_iova: sg_dma_address: size: 4000, mapped iova:
> > 0x3823bc000 (dynamic alloc)
> > [   39.635184] <4>.(4)[1:swapper/0]preload_iova_alloc: vpu1:
> > addr:0x0, size: 0x4000, bin: 0x9FD000, mva: 0x3823bc000
> > [   39.635186] <1>.(4)[1:swapper/0]vpu_init_dev_algo_preload_entry:
> > vpu1(62h): vpu_flo_d2d_ksample <IRAM>: off: 9fd000, mva: 3823bc000,
> > size: 4000, addr: 0
> > [   39.635348] <1>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_map_sg_to_iova: sg_dma_address: size: 240000, mapped iova:
> > 0x374000000 (static alloc)
> > [   39.635349] <1>.(4)[1:swapper/0]preload_iova_alloc: vpu1:
> > addr:0x74000000, size: 0x240000, bin: 0xC43000, mva: 0x374000000
> > [   39.635351] <1>.(4)[1:swapper/0]vpu_init_dev_algo_preload_entry:
> > vpu1(62h): apu_lib_apunn <PROG>: off: c43000, mva: 374000000, size:
> > 240000, addr: 74000000
> > [   39.635355] <1>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_map_sg_to_iova: sg_dma_address: size: 2000, mapped iova:
> > 0x3823ba000 (dynamic alloc)
> > [   39.635356] <1>.(4)[1:swapper/0]preload_iova_alloc: vpu1:
> > addr:0x0, size: 0x2000, bin: 0xE83000, mva: 0x3823ba000
> > [   39.635358] <1>.(4)[1:swapper/0]vpu_init_dev_algo_preload_entry:
> > vpu1(62h): apu_lib_apunn <IRAM>: off: e83000, mva: 3823ba000, size:
> > 2000, addr: 0
> > [   39.635379] <1>.(4)[1:swapper/0][apusys][warn] mdw_rsc_add_dev
> > dev overwrite idx(0->1)
> > [   39.635822] <1>.(4)[1:swapper/0][apusys][warn] mdw_rsc_add_dev
> > dev overwrite idx(0->1)
> > [   39.636168] <1>.(4)[1:swapper/0]vpu 19031000.vpu_core1:
> > vpu_probe: succeed
> > [   39.636175]
> > <1>.(4)[1:swapper/0]BOOTPROF:     39636.174324:probe:
> > probe=platform_drv_probe drv=vpu(0xffffff80095e7458)    22.666538ms
> > [   39.636190] <1>.(4)[1:swapper/0]probe of 19031000.vpu_core1
> > returned 1 after 24528 usecs
> > [   39.636323]
> > <1>.(4)[1:swapper/0]BOOTPROF:     39636.322863:initcall:
> > vpu_init    64.791462ms
> > [   39.636327] <1>.(4)[1:swapper/0]initcall vpu_init+0x0/0x2b0
> > returned 0 after 63279 usecs
> > [   39.636330]
> > <1>.(4)[1:swapper/0]calling  apusys_devapc_init+0x0/0x28 @ 1
> > [   39.636492] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   39.636494] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   39.636495] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   39.636498] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   39.636499] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   39.636503] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   39.636538] <1>.(4)[1:swapper/0]initcall
> > apusys_devapc_init+0x0/0x28 returned 0 after 200 usecs
> > [   39.636540] <1>.(4)[1:swapper/0]calling  scp_late_init+0x0/0x2c
> > @ 1
> > [   39.636541] <1>.(4)[1:swapper/0][SCP] scp_late_init
> > [   39.636555] <1>.(4)[1:swapper/0]initcall scp_late_init+0x0/0x2c
> > returned 0 after 13 usecs
> > [   39.636557]
> > <1>.(4)[1:swapper/0]calling  cmdq_util_init+0x0/0x1f8 @ 1
> > [   39.636559] <1>.(4)[1:swapper/0][cmdq] cmdq_util_init begin
> > [   39.636734] <1>.(4)[1:swapper/0][cmdq] data:          (null)
> > val:0x1 bit_feature:0x2
> > [   39.636735] <1>.(4)[1:swapper/0][cmdq] cmdq_util_init end
> > [   39.636738] <1>.(4)[1:swapper/0]initcall
> > cmdq_util_init+0x0/0x1f8 returned 0 after 174 usecs
> > [   39.636740] <1>.(4)[1:swapper/0]calling  mdp_late_init+0x0/0x68
> > @ 1
> > [   39.636741] <1>.(4)[1:swapper/0][MDP]mdp_late_init begin
> > [   39.636754] <1>.(4)[1:swapper/0][MDP]mdp_late_init end
> > [   39.636756] <1>.(4)[1:swapper/0]initcall mdp_late_init+0x0/0x68
> > returned 0 after 13 usecs
> > [   39.636757]
> > <1>.(4)[1:swapper/0]calling  cmdq_core_late_init+0x0/0x48 @ 1
> > [   39.636758] <1>.(4)[1:swapper/0][MDP]CMDQ driver late init begin
> > [   39.636760] <1>.(4)[1:swapper/0]initcall
> > cmdq_core_late_init+0x0/0x48 returned 0 after 1 usecs
> > [   39.636762] <1>.(4)[1:swapper/0]calling  hdmirx_init+0x0/0x4c @
> > 1
> > [   39.636763] <1>.(4)[1:swapper/0][RX]hdmirx_init
> > [   39.636969] <1>.(4)[1:swapper/0][RX]hdmirx_probe
> > [   39.636978] <1>.(4)[1:swapper/0][RX]no efuse
> > [   39.636979] <1>.(4)[1:swapper/0][RX]uevent_dev_register,
> > 0xffffffc1dba10130
> > [   39.636987] <1>.(4)[1:swapper/0][RX]create_switch_class susesess
> > [   39.637008] <1>.(4)[1:swapper/0][RX]device create ok,index:0x1
> > [   39.637031]
> > <1>.(4)[1:swapper/0][RX]class_dev=0xffffffc1db8cfb00,
> > class_dev=0xffffffc1e180f800
> > [   39.637072] <1>.(4)[1:swapper/0][RX]RX_ADR=0xffffff800dfdd000
> > [   39.637074] <1>.(4)[1:swapper/0][RX]TX_ADR=0xffffff800dfe5000
> > [   39.637076] <1>.(4)[1:swapper/0][RX]V_ADR=0xffffff800dfed000
> > [   39.637079] <1>.(4)[1:swapper/0][RX]A_ADR=0xffffff8014d0c000
> > [   39.637091] <1>.(4)[1:swapper/0][RX]S_ADR=0xffffff800dff5800
> > [   39.637093] <1>.(4)[1:swapper/0][RX]E_ADR=0xffffff800dffd400
> > [   39.637095] <1>.(4)[1:swapper/0][RX]AP_ADR=0xffffff8014d09000
> > [   39.637097] <1>.(4)[1:swapper/0][RX]CK_ADR=0xffffff8014d21000
> > [   39.637099] <1>.(4)[1:swapper/0][RX]R_ADR=0xffffff8014d23000
> > [   39.637127] <1>.(4)[1:swapper/0]hdmirx 1c400000.hdmirx: Linked
> > as a consumer to regulator.27
> > [   39.637524] <1>.(4)[1:swapper/0]hdmirx 1c400000.hdmirx: Linked
> > as a consumer to regulator.39
> > [   39.637578] <1>.(4)[1:swapper/0]hdmirx 1c400000.hdmirx: Linked
> > as a consumer to regulator.3
> > [   39.637590] <1>.(4)[1:swapper/0][RX]hdmi rx irq: 428
> > [   39.637593] <1>.(4)[1:swapper/0][RX]hdmi rx phy irq: 429
> > [   39.637613] <1>.(4)[1:swapper/0][RX]hdmi2cmd_debug_init
> > [   39.637643]
> > <1>.(4)[1:swapper/0][RX]pdev=0xffffffc1e57b7800,dev=0xffffffc1e57b7
> > 810,phydev=0x0,myhdmi=0xffffffc1dba10080
> > [   39.637644] <1>.(4)[1:swapper/0][RX]hdmirx_toprgu_rst
> > [   39.637645] <1>.(4)[1:swapper/0][RX]enable power domain and CG
> > [   39.637656] <1>.(4)[1:swapper/0][RX]main state(0->0)
> > [   39.637969] <1>.(4)[1:swapper/0][RX]hdmi_rx_power_on
> > [   39.637970] <1>.(4)[1:swapper/0][RX]hdmi_rx_task_init
> > [   39.637971] <1>.(4)[1:swapper/0][RX]main state(0->1)
> > [   39.638009] <1>.(4)[1:swapper/0]probe of 1c400000.hdmirx
> > returned 1 after 1160 usecs
> > [   39.638014] <1>.(5)[309:hdmirx_timer_kt][RX]myhdmi->is_rx_init=1
> > [   39.638015] <1>.(5)[309:hdmirx_timer_kt][RX]myhdmi->main_cmd=0
> > [   39.638016] <1>.(5)[309:hdmirx_timer_kt][RX]myhdmi-
> > >is_rx_task_disable=0
> > [   39.638055] <1>.(4)[1:swapper/0]initcall hdmirx_init+0x0/0x4c
> > returned 0 after 1259 usecs
> > [   39.638058]
> > <1>.(4)[1:swapper/0]calling  post_sspm_set_emi_mpu+0x0/0x94 @ 1
> > [   39.638071] <1>.(4)[1:swapper/0]initcall
> > post_sspm_set_emi_mpu+0x0/0x94 returned 0 after 10 usecs
> > [   39.638074] <1>.(4)[1:swapper/0]calling  mtk_qos_init+0x0/0x20 @
> > 1
> > [   39.638128] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.638186] <1>.(4)[1:swapper/0]qos ipi is ready!
> > [   39.638487] <0>.(5)[1:swapper/0]qos: rec phy_addr = 0x803f2800,
> > virt_addr=0xffffff800b102800, size = 4096
> > [   39.638519] <1>.(5)[1:swapper/0]qos ipi cmd 16 ack fail,
> > ackdata=0
> > [   39.638534] <0>.(5)[1:swapper/0]probe of 11bb00.qos returned 1
> > after 433 usecs
> > [   39.638550] <1>.(4)[310:qos_ipi_recv]qos_ipi_recv_thread start!
> > [   39.638657] <0>.(5)[1:swapper/0]initcall mtk_qos_init+0x0/0x20
> > returned 0 after 562 usecs
> > [   39.638659]
> > <0>.(5)[1:swapper/0]calling  platform_cm_mgr_init+0x0/0x20 @ 1
> > [   39.638710] <0>.(5)[1:swapper/0]SSPM is ready to service CM IPI
> > [   39.638877] <0>.(5)[1:swapper/0]#@# cm_mgr_check_dram_type(35)
> > ddr_type 0x6, ddr_hz 4266, cm_mgr_idx 0x0
> > [   39.638911] <0>.(5)[1:swapper/0][CM_MGR] platform-cm_mgr
> > cm_mgr_base=000000004e44f03c
> > [   39.638913] <0>.(5)[1:swapper/0]#@#
> > cm_mgr_check_dts_setting(618) opp_count -2
> > [   39.638914] <0>.(5)[1:swapper/0]#@#
> > cm_mgr_check_dts_setting(647) cm_mgr_enable 1
> > [   39.638915] <0>.(5)[1:swapper/0]#@#
> > cm_mgr_check_dts_setting(658) cm_mgr_use_bcpu_weight 0
> > [   39.638916] <0>.(5)[1:swapper/0]#@#
> > cm_mgr_check_dts_setting(669) cm_mgr_use_cpu_to_dram_map 0
> > [   39.638918] <0>.(5)[1:swapper/0]#@#
> > cm_mgr_check_dts_setting(680) cm_mgr_use_cpu_to_dram_map_new 0
> > [   39.638920] <0>.(5)[1:swapper/0]#@#
> > cm_mgr_check_dts_setting(687) cpu_power_bcpu_weight_max 100
> > [   39.638921] <0>.(5)[1:swapper/0]#@#
> > cm_mgr_check_dts_setting(694) cpu_power_bcpu_weight_min 100
> > [   39.638924] <0>.(5)[1:swapper/0][CM_MGR] platform-cm_mgr_probe
> > Done.
> > [   39.638930] <0>.(5)[1:swapper/0]probe of c530000.cm_mgr returned
> > 1 after 244 usecs
> > [   39.638995] <0>.(5)[1:swapper/0]initcall
> > platform_cm_mgr_init+0x0/0x20 returned 0 after 325 usecs
> > [   39.638996] <0>.(5)[1:swapper/0]calling  init_perfmgr+0x0/0x90 @
> > 1
> > [   39.639159] <0>.(5)[1:swapper/0]probe of perfmgr returned 1
> > after 15 usecs
> > [   39.639255] <0>.(5)[1:swapper/0]probe of dram_ctrl returned 1
> > after 16 usecs
> > [   39.639294] <0>.(5)[1:swapper/0]initcall init_perfmgr+0x0/0x90
> > returned 0 after 289 usecs
> > [   39.639295] <0>.(5)[1:swapper/0]calling  mtk_leds_init+0x0/0x6c
> > @ 1
> > [   39.639297] <0>.(5)[1:swapper/0]leds_mtk_pwm mtk_leds_init(602)
> > :Leds init
> > [   39.639354] <0>.(5)[1:swapper/0]leds_mtk_pwm mtk_leds_probe(502)
> > :probe begain +++
> > [   39.639356] <0>.(5)[1:swapper/0]leds_mtk_pwm mtk_leds_probe(505)
> > :Load dts node nums: 1
> > [   39.639360] <0>.(5)[1:swapper/0]leds_mtk_pwm
> > mtk_leds_parse_dt(426) :Fail to read default-trigger property
> > [   39.639362] <0>.(5)[1:swapper/0]leds_mtk_pwm
> > mtk_leds_parse_dt(432) :Fail to read active-low property
> > [   39.639364] <0>.(5)[1:swapper/0]leds_mtk_pwm
> > mtk_leds_parse_dt(436) :No led-bits, use default value 8
> > [   39.639365] <0>.(5)[1:swapper/0]leds_mtk_pwm
> > mtk_leds_parse_dt(449) :No trans-bits, use default value 10
> > [   39.639367] <0>.(5)[1:swapper/0]leds_mtk_pwm
> > mtk_leds_parse_dt(467) :parse lcd-backlight(0) leds dt: lcd-
> > backlight, (null), 0, 255, 8
> > [   39.639392] <0>.(5)[1:swapper/0]leds_mtk_pwm led_data_init(346)
> > :lcd-backlight devm_led_classdev_register ok!
> > [   39.639407] <0>.(5)[1:swapper/0]leds_mtk_pwm
> > led_pwm_config_add(385) :set led pwm OK! info.config.pwm_period_ns
> > = 500000!
> > [   39.639414] <0>.(5)[1:swapper/0]leds_mtk_pwm led_debug_log(135)
> > :[Light] Set lcd-backlight directly T:39.639,L:102 L:102 map:409
> > [   39.639440] <0>.(5)[1:swapper/0]leds_mtk_pwm
> > mtk_leds_parse_dt(482) :load dts ok!
> > [   39.639442] <0>.(5)[1:swapper/0]leds_mtk_pwm mtk_leds_probe(528)
> > :probe end ---
> > [   39.639446] <0>.(5)[1:swapper/0]probe of pwmleds returned 1
> > after 99 usecs
> > [   39.639457] <0>.(5)[1:swapper/0]initcall mtk_leds_init+0x0/0x6c
> > returned 0 after 156 usecs
> > [   39.639458]
> > <0>.(5)[1:swapper/0]calling  adaptor_drv_init+0x0/0x24 @ 1
> > [   39.639639] <0>.(5)[1:swapper/0]imgsensor 0-001a: Linked as a
> > consumer to regulator.22
> > [   39.639672] <0>.(5)[1:swapper/0]imgsensor 0-001a: GPIO lookup
> > for consumer rst
> > [   39.639673] <0>.(5)[1:swapper/0]imgsensor 0-001a: using device
> > tree for GPIO lookup
> > [   39.639686] <0>.(5)[1:swapper/0]of_get_named_gpiod_flags: parsed
> > 'rst-gpios' property of node '/i2c@11e00000/sensor0[0]' - status
> > (0)
> > [   39.639751] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   39.639754] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   39.639759] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   39.641381] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.641386]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.643004] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   39.643006] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   39.643007] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   39.643011] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   39.643012] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   39.643016] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   39.643841] <0>.(4)[1:swapper/0]imgsensor 0-001a: GPIO lookup
> > for consumer pdn
> > [   39.645381] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   39.646990] <0>.(4)[1:swapper/0]imgsensor 0-001a: using device
> > tree for GPIO lookup
> > [   39.648608] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   39.648616] <0>.(7)[296:kworker/7:2]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   39.649609] <0>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'pdn-gpios' property of node '/i2c@11e00000/sensor0[0]'
> > [   39.650554]
> > <0>.(7)[296:kworker/7:2]BOOTPROF:     39650.553786:probe:
> > probe=platform_drv_probe drv=mt8195-
> > sound(0xffffff800966ce50)    32.053385ms
> > [   39.651944] <0>-(7)[296:kworker/7:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=186
> > [   39.651948] <0>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'pdn-gpio' property of node '/i2c@11e00000/sensor0[0]'
> > [   39.651952] <0>.(4)[1:swapper/0]imgsensor 0-001a: using lookup
> > tables for GPIO lookup
> > [   39.651953] <0>.(4)[1:swapper/0]imgsensor 0-001a: No GPIO
> > consumer pdn found
> > [   39.651954] <0>.(4)[1:swapper/0]imgsensor 0-001a: GPIO lookup
> > for consumer avdd
> > [   39.651955] <0>.(4)[1:swapper/0]imgsensor 0-001a: using device
> > tree for GPIO lookup
> > [   39.651966] <0>.(4)[1:swapper/0]of_get_named_gpiod_flags: parsed
> > 'avdd-gpios' property of node '/i2c@11e00000/sensor0[0]' - status
> > (0)
> > [   39.652068] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.652072] <0>-(7)[296:kworker/7:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.652076] <0>-(7)[296:kworker/7:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   39.652082] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.652096] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.653069] <0>.(7)[296:kworker/7:2]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   39.654038]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.655635] <0>.(7)[296:kworker/7:2]probe of sound returned 0
> > after 37250 usecs
> > [   39.655679] <0>.(4)[1:swapper/0]imgsensor 0-001a: GPIO lookup
> > for consumer dvdd
> > [   39.655832] <0>.(7)[296:kworker/7:2]mt8195-sound sound: Linked
> > as a consumer to regulator.43
> > [   39.655856] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   39.655859] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   39.655860] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   39.655862] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   39.655863] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   39.655865] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   39.655866] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   39.655867] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   39.655869] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   39.655870] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   39.655872] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   39.655873] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   39.655875] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   39.655876] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   39.655877] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   39.655879] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   39.655881] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   39.655882] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   39.655884] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   39.655885] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   39.655888] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   39.655890] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   39.655892] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   39.655893] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   39.655895] <0>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   39.655900] <0>.(7)[296:kworker/7:2]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   39.655909] <0>.(7)[296:kworker/7:2]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   39.655919] <0>.(7)[296:kworker/7:2]probe of sound returned 0
> > after 221 usecs
> > [   39.668091] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=187
> > [   39.668205] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.668213] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.668220] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.668233] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.669837] <0>.(4)[1:swapper/0]imgsensor 0-001a: using device
> > tree for GPIO lookup
> > [   39.671146] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.672826] <0>.(4)[1:swapper/0]of_get_named_gpiod_flags: parsed
> > 'dvdd-gpios' property of node '/i2c@11e00000/sensor0[0]' - status
> > (0)
> > [   39.674448]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.680679] <0>.(4)[1:swapper/0]imgsensor 0-001a: GPIO lookup
> > for consumer dovdd
> > [   39.685012] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=188
> > [   39.685324] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.685328] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.685433] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.686207] <0>.(4)[1:swapper/0]imgsensor 0-001a: using device
> > tree for GPIO lookup
> > [   39.687122] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.688127] <0>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'dovdd-gpios' property of node '/i2c@11e00000/sensor0[0]'
> > [   39.689003] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.689947] <0>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'dovdd-gpio' property of node '/i2c@11e00000/sensor0[0]'
> > [   39.690936]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.691915] <0>.(4)[1:swapper/0]imgsensor 0-001a: using lookup
> > tables for GPIO lookup
> > [   39.700984] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=189
> > [   39.701037] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.701042] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.701048] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.701053]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.701097] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.701098] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.717963] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=190
> > [   39.718072] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.718075] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.718080] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.718085] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.718973] <0>.(4)[1:swapper/0]imgsensor 0-001a: No GPIO
> > consumer dovdd found
> > [   39.720482] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.721339] <0>.(4)[1:swapper/0]imgsensor 0-001a: GPIO lookup
> > for consumer afvdd
> > [   39.722794]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.723666] <0>.(4)[1:swapper/0]imgsensor 0-001a: using device
> > tree for GPIO lookup
> > [   39.723669] <0>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'afvdd-gpios' property of node '/i2c@11e00000/sensor0[0]'
> > [   39.723671] <0>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'afvdd-gpio' property of node '/i2c@11e00000/sensor0[0]'
> > [   39.723672] <0>.(4)[1:swapper/0]imgsensor 0-001a: using lookup
> > tables for GPIO lookup
> > [   39.723672] <0>.(4)[1:swapper/0]imgsensor 0-001a: No GPIO
> > consumer afvdd found
> > [   39.723675] <0>.(4)[1:swapper/0]imgsensor 0-
> > 001a:  adaptor_hw_power_on i2c_bus 0
> > [   39.723680] <0>.(4)[1:swapper/0]imgsensor 0-001a:
> > adaptor_hw_power_on power ref cnt = 0
> > [   39.734191] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=191
> > [   39.734262] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.734269] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.734278] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.734286]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.734309] <0>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.734310] <1>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.751616] <1>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=192
> > [   39.751685] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.751692] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.751700] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.751707]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.751731] <1>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.751732] <1>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.768316] <5>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=193
> > [   39.768427] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.768428] <1>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.768429] <5>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.768437] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.785315] <5>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=194
> > [   39.786263] <5>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   39.786275] <5>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   39.801764] <5>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=195
> > [   39.802691] <5>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   39.802702] <5>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   39.817773] <5>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=196
> > [   39.818708] <5>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   39.818720] <5>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   39.834278] <5>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=197
> > [   39.835208] <5>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   39.835219] <5>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   39.843192] <5>.(0)[1:swapper/0]imgsensor 0-001a:
> > adaptor_hw_power_on
> > [   39.843697] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.845027] <5>.(0)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   39.845659]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.846559]
> > <5>.(0)[1:swapper/0]imx686_camera_sensor[return_sensor_id]
> > imx686_camera_sensor[return_sensor_id] 0x16 = ff
> > [   39.847303] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.847306] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.847309] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.847312]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.851150] <1>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=198
> > [   39.851178] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.851183] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.851187] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.851190]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.851447] <1>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.851451] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.867736] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=199
> > [   39.867771] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.867775] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.867779] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.867783]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.868016] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.868019] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.884820] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=200
> > [   39.884855] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.884858] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.884863] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.884866]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.885089] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.885092] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.900896] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=201
> > [   39.900924] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.900928] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.900932] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.900936]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.901163] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.901166] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.917839] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=202
> > [   39.917871] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.917875] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.917879] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.917882]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.918106] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.918109] <1>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.934820] <1>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=203
> > [   39.934849] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.934853] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.934856] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.934859]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.935089] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.935091] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.951342] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=204
> > [   39.951361] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.951365] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.951368] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.951372]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.951610] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.951613] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.967840] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=205
> > [   39.967856] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.967860] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.967864] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.967867]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.968108] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.968111] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   39.984282] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=206
> > [   39.984311] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   39.984315] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   39.984318] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   39.984322]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   39.984552] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   39.984555] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.001717] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=207
> > [   40.001982] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.001985] <5>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.002035] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.003920] <5>.(5)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.004819] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.005665]
> > <5>.(5)[1:swapper/0]imx686_camera_sensor[return_sensor_id]
> > imx686_camera_sensor[return_sensor_id] 0x17 = ff
> > [   40.006599] <1>.(5)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.007673] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.009618] <1>.(5)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.010499]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.011440]
> > <1>.(5)[1:swapper/0]imx686_camera_sensor[get_imgsensor_id]
> > imx686_camera_sensor[get_imgsensor_id] Read sensor id fail, write
> > id: 0x20, id: 0xffff
> > [   40.012436] <1>.(5)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.017959] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=208
> > [   40.018041] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.018051] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.018062] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.018072]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.018085] <5>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.018086] <5>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.035018] <5>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=209
> > [   40.035131] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.035134] <5>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.035139] <5>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.035145] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.036161]
> > <5>.(5)[1:swapper/0]imx686_camera_sensor[return_sensor_id]
> > imx686_camera_sensor[return_sensor_id] 0x16 = ff
> > [   40.037119] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.038896] <5>.(5)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.040006]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.041006]
> > <5>.(5)[1:swapper/0]imx686_camera_sensor[return_sensor_id]
> > imx686_camera_sensor[return_sensor_id] 0x17 = ff
> > [   40.051252] <5>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=210
> > [   40.051332] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.051343] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.051355] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.051366]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.051582] <5>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.051586] <5>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.067613] <5>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=211
> > [   40.067723] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.067726] <5>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.067731] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.067736] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.069671] <1>.(5)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.070535] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.071540] <1>.(5)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.072253]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.073387]
> > <1>.(5)[1:swapper/0]imx686_camera_sensor[get_imgsensor_id]
> > imx686_camera_sensor[get_imgsensor_id] Read sensor id fail, write
> > id: 0x34, id: 0xffff
> > [   40.073396] <1>.(5)[1:swapper/0]imgsensor 0-001a:
> > adaptor_hw_power_off power ref cnt = 1
> > [   40.084587] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=212
> > [   40.084672] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.084682] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.084693] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.084704]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.084718] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.084719] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.101258] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=213
> > [   40.101367] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.101381] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.101382] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.101384] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.101395] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.109588] <1>.(5)[1:swapper/0]imgsensor 0-001a:
> > adaptor_hw_power_off
> > [   40.110366]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.111252] <1>.(5)[1:swapper/0]imgsensor 0-
> > 001a:  adaptor_hw_power_on i2c_bus 0
> > [   40.117848] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=214
> > [   40.117913] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.117920] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.117929] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.117937]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.117979] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.117981] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.134603] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=215
> > [   40.134707] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.134720] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.134721] <5>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.134722] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.134734] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.135560] <1>.(5)[1:swapper/0]imgsensor 0-001a:
> > adaptor_hw_power_on power ref cnt = 0
> > [   40.150835] <1>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=216
> > [   40.151795] <1>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.151807] <1>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.167385] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=217
> > [   40.167945]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.169050] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.169574] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.170407] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.171407] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.181939] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.183084]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.184110] <1>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=218
> > [   40.184401] <1>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.184404] <1>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.187415] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.188275] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.189081] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.190221]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.565482] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=219
> > [   40.566739] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.567578] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.568598] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=220
> > [   40.569806] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.570644] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.571657] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.572516] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.573324] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.574463]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.588401] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=221
> > [   40.588498] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.590253] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.590326] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.591144] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.591922] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.593069]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.594230] <0>.(0)[1:swapper/0]imgsensor 0-001a:
> > adaptor_hw_power_on
> > [   40.596174] <0>.(0)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.597036]
> > <0>.(0)[1:swapper/0]IMX577_camera_sensor[return_sensor_id]
> > IMX577_camera_sensor[return_sensor_id] 0x16 = ff
> > [   40.660201] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=222
> > [   40.660220] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.662052] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.662133] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.662880] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.663720] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.663768] <1>.(0)[309:hdmirx_timer_kt][RX]main state(1->2)
> > [   40.663775] <1>.(0)[309:hdmirx_timer_kt][RX]hdmirx_toprgu_rst
> > [   40.663784] <0>.(0)[309:hdmirx_timer_kt][RX]hdmi2_hw_init
> > [   40.663816] <3>.(0)[309:hdmirx_timer_kt][RX]2080=0x0847
> > [   40.664967]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.666749] <3>.(0)[309:hdmirx_timer_kt][RX]invalid pixel clock
> > [   40.667451] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.667463] <3>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.667474] <0>-(0)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=223
> > [   40.667481] <3>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.667494]
> > <3>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.667789] <0>.(3)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.667801]
> > <0>.(3)[1:swapper/0]IMX577_camera_sensor[return_sensor_id]
> > IMX577_camera_sensor[return_sensor_id] 0x17 = ff
> > [   40.668033] <3>.(3)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.668407] <0>-(0)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.668419] <3>-(0)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.668631] <0>.(3)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.669173] <0>.(0)[309:hdmirx_timer_kt][RX]invalid pixel clock
> > [   40.669841]
> > <3>.(3)[1:swapper/0]IMX577_camera_sensor[get_imgsensor_id]
> > IMX577_camera_sensor[get_imgsensor_id] Read sensor id fail, write
> > id: 0x20, id: 0xffff
> > [   40.670852] <0>.(0)[309:hdmirx_timer_kt][RX]invalid pixel clock
> > [   40.672018] <1>.(3)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.672530] <0>.(0)[309:hdmirx_timer_kt][RX]s:no_signal to
> > no_signal,4294902459ms
> > [   40.673312]
> > <1>.(3)[1:swapper/0]IMX577_camera_sensor[return_sensor_id]
> > IMX577_camera_sensor[return_sensor_id] 0x16 = ff
> > [   40.675555] <1>.(0)[309:hdmirx_timer_kt][RX]no txapi_signal_off
> > [   40.677458] <1>.(3)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.678713] <3>.(0)[309:hdmirx_timer_kt][RX]hdcp init
> > [   40.679586]
> > <1>.(3)[1:swapper/0]IMX577_camera_sensor[return_sensor_id]
> > IMX577_camera_sensor[return_sensor_id] 0x17 = ff
> > [   40.680505] <3>.(0)[309:hdmirx_timer_kt][RX]hdcp rom size is
> > 29372
> > [   40.682516] <1>.(3)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.683901] <3>-(0)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=224
> > [   40.685037] <3>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.685134] <3>.(3)[1:swapper/0]imgsensor 0-001a: i2c transfer
> > failed (-6)
> > [   40.685138]
> > <3>.(3)[1:swapper/0]IMX577_camera_sensor[get_imgsensor_id]
> > IMX577_camera_sensor[get_imgsensor_id] Read sensor id fail, write
> > id: 0x34, id: 0xffff
> > [   40.685144] <3>.(3)[1:swapper/0]imgsensor 0-001a:
> > adaptor_hw_power_off power ref cnt = 1
> > [   40.686038] <3>-(0)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.686544] <3>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.687477] <0>-(0)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.689576] <1>.(3)[1:swapper/0]imgsensor 0-001a:
> > adaptor_hw_power_off
> > [   40.690429] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.691077] <1>.(3)[1:swapper/0]imgsensor 0-001a: no sensor
> > found
> > [   40.692414]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.693209]
> > <1>.(3)[1:swapper/0]BOOTPROF:     40693.205788:probe:
> > probe=i2c_device_probe
> > drv=imgsensor(0xffffff80095f4d18)  1053.656695ms
> > [   40.700562] <3>-(0)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=225
> > [   40.701369] <3>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.701428] <3>.(3)[1:swapper/0]imgsensor 0-001a: Dropping the
> > link to regulator.22
> > [   40.701482] <3>.(3)[1:swapper/0]imgsensor: probe of 0-001a
> > failed with error -5
> > [   40.701487] <3>.(3)[1:swapper/0]probe of 0-001a returned 0 after
> > 1062005 usecs
> > [   40.702033] <3>.(3)[1:swapper/0]imgsensor 1-0010: Linked as a
> > consumer to regulator.22
> > [   40.702146] <3>.(3)[1:swapper/0]imgsensor 1-0010: GPIO lookup
> > for consumer rst
> > [   40.702151] <3>.(3)[1:swapper/0]imgsensor 1-0010: using device
> > tree for GPIO lookup
> > [   40.702182] <3>.(3)[1:swapper/0]of_get_named_gpiod_flags: parsed
> > 'rst-gpios' property of node '/i2c@11e01000/sensor1[0]' - status
> > (0)
> > [   40.702690] <3>-(0)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.703187] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.704313] <3>-(0)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.705074] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.706906] <3>.(3)[1:swapper/0]imgsensor 1-0010: GPIO lookup
> > for consumer pdn
> > [   40.707629]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.717223] <3>-(0)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=226
> > [   40.717630] <3>.(3)[1:swapper/0]imgsensor 1-0010: using device
> > tree for GPIO lookup
> > [   40.717647] <3>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.717650] <3>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.717654] <3>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.717658]
> > <3>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.718668] <3>-(0)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.719470] <3>.(3)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'pdn-gpios' property of node '/i2c@11e01000/sensor1[0]'
> > [   40.720585] <3>-(0)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.721488] <3>.(3)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'pdn-gpio' property of node '/i2c@11e01000/sensor1[0]'
> > [   40.733080] <3>.(3)[1:swapper/0]imgsensor 1-0010: using lookup
> > tables for GPIO lookup
> > [   40.733884] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=227
> > [   40.734073] <3>.(3)[1:swapper/0]imgsensor 1-0010: No GPIO
> > consumer pdn found
> > [   40.734110] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.734113] <3>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.734117] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.734120]
> > <3>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.735233] <3>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.735981] <3>.(3)[1:swapper/0]imgsensor 1-0010: GPIO lookup
> > for consumer avdd
> > [   40.736835] <3>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.737640] <3>.(3)[1:swapper/0]imgsensor 1-0010: using device
> > tree for GPIO lookup
> > [   40.743733] <4>.(4)[1:swapper/0]of_get_named_gpiod_flags: parsed
> > 'avdd-gpios' property of node '/i2c@11e01000/sensor1[0]' - status
> > (0)
> > [   40.745240] <4>.(4)[1:swapper/0]gpio-319 (avdd): gpiod_request:
> > status -16
> > [   40.746098] <4>.(4)[1:swapper/0]imgsensor 1-0010: GPIO lookup
> > for consumer dvdd
> > [   40.747008] <4>.(4)[1:swapper/0]imgsensor 1-0010: using device
> > tree for GPIO lookup
> > [   40.747974] <4>.(4)[1:swapper/0]of_get_named_gpiod_flags: parsed
> > 'dvdd-gpios' property of node '/i2c@11e01000/sensor1[0]' - status
> > (0)
> > [   40.750544] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=228
> > [   40.750661] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.751689] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.752479] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.753394] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.754211] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.755350] <4>.(4)[1:swapper/0]imgsensor 1-0010: GPIO lookup
> > for consumer dovdd
> > [   40.756430]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.757346] <4>.(4)[1:swapper/0]imgsensor 1-0010: using device
> > tree for GPIO lookup
> > [   40.759333] <4>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'dovdd-gpios' property of node '/i2c@11e01000/sensor1[0]'
> > [   40.760762] <4>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'dovdd-gpio' property of node '/i2c@11e01000/sensor1[0]'
> > [   40.762180] <4>.(4)[1:swapper/0]imgsensor 1-0010: using lookup
> > tables for GPIO lookup
> > [   40.763158] <4>.(4)[1:swapper/0]imgsensor 1-0010: No GPIO
> > consumer dovdd found
> > [   40.764057] <4>.(4)[1:swapper/0]imgsensor 1-0010: GPIO lookup
> > for consumer afvdd
> > [   40.764977] <4>.(4)[1:swapper/0]imgsensor 1-0010: using device
> > tree for GPIO lookup
> > [   40.765930] <4>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'afvdd-gpios' property of node '/i2c@11e01000/sensor1[0]'
> > [   40.767205] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=229
> > [   40.767376] <4>.(4)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'afvdd-gpio' property of node '/i2c@11e01000/sensor1[0]'
> > [   40.767459] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.767469] <4>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.767479] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.767489]
> > <4>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.768490] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.769799] <4>.(4)[1:swapper/0]imgsensor 1-0010: using lookup
> > tables for GPIO lookup
> > [   40.770655] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.771458] <4>.(4)[1:swapper/0]imgsensor 1-0010: No GPIO
> > consumer afvdd found
> > [   40.772891] <5>.(5)[309:hdmirx_timer_kt]prom[0]0x2
> > [   40.773598] <5>.(4)[1:swapper/0]imgsensor 1-
> > 0010:  adaptor_hw_power_on i2c_bus 1
> > [   40.774517] <5>.(5)[309:hdmirx_timer_kt]prom[1]0x0
> > [   40.775493] <5>.(4)[1:swapper/0]imgsensor 1-0010:
> > adaptor_hw_power_on power ref cnt = 0
> > [   40.776543] <5>.(5)[309:hdmirx_timer_kt]prom[2]0x21
> > [   40.781166] <5>.(5)[309:hdmirx_timer_kt]prom[3]0x2
> > [   40.781767] <5>.(5)[309:hdmirx_timer_kt]prom[4]0x0
> > [   40.782366] <5>.(5)[309:hdmirx_timer_kt]prom[5]0xe0
> > [   40.782975] <5>.(5)[309:hdmirx_timer_kt]prom[6]0xff
> > [   40.783587] <5>.(5)[309:hdmirx_timer_kt]prom[7]0xff
> > [   40.784202] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=230
> > [   40.784308] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.784321] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.784322] <1>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.784323] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.784335] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.785360] <5>.(5)[309:hdmirx_timer_kt]prom[8]0xff
> > [   40.786230]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.787026] <6>.(5)[309:hdmirx_timer_kt]prom[9]0xff
> > [   40.791122] <5>.(6)[1:swapper/0]gpiod_direction_output: invalid
> > GPIO (errorpointer)
> > [   40.791772] <5>.(5)[309:hdmirx_timer_kt]prom[10]0xff
> > [   40.793931] <5>.(5)[309:hdmirx_timer_kt]prom[11]0x2
> > [   40.794541] <5>.(5)[309:hdmirx_timer_kt]prom[12]0x57
> > [   40.795168] <5>.(5)[309:hdmirx_timer_kt]prom[13]0x77
> > [   40.795789] <5>.(5)[309:hdmirx_timer_kt]prom[14]0xff
> > [   40.796409] <5>.(5)[309:hdmirx_timer_kt]prom[15]0xff
> > [   40.797030] <5>.(5)[309:hdmirx_timer_kt]prom[16]0xff
> > [   40.797652] <5>.(5)[309:hdmirx_timer_kt]prom[17]0xff
> > [   40.798273] <5>.(5)[309:hdmirx_timer_kt]prom[18]0xff
> > [   40.798899] <5>.(5)[309:hdmirx_timer_kt]prom[19]0x2
> > [   40.799510] <5>.(5)[309:hdmirx_timer_kt][RX]hdcp ram size is
> > 16384
> > [   40.800529] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=231
> > [   40.801675] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.802596] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.803799] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.804680] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.805504] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.806660]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.817191] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=232
> > [   40.818323] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.819243] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.820428] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.821308] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.822133] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.823325]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.833853] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=233
> > [   40.834986] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.835906] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.837075] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.837953] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.838778] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.839967]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.842439] <5>.(5)[309:hdmirx_timer_kt]pram[0]0x2
> > [   40.843037] <5>.(5)[309:hdmirx_timer_kt]pram[1]0x0
> > [   40.843640] <5>.(5)[309:hdmirx_timer_kt]pram[2]0x25
> > [   40.844250] <5>.(5)[309:hdmirx_timer_kt]pram[3]0x2
> > [   40.844847] <5>.(5)[309:hdmirx_timer_kt]pram[4]0x1
> > [   40.845446] <5>.(5)[309:hdmirx_timer_kt]pram[5]0xa9
> > [   40.846055] <5>.(5)[309:hdmirx_timer_kt]pram[6]0xff
> > [   40.846664] <5>.(5)[309:hdmirx_timer_kt]pram[7]0xff
> > [   40.847112] <6>.(6)[1:swapper/0]imgsensor 1-0010:
> > adaptor_hw_power_on
> > [   40.847276] <5>.(5)[309:hdmirx_timer_kt]pram[8]0xff
> > [   40.848692] <5>.(5)[309:hdmirx_timer_kt]pram[9]0xff
> > [   40.848790] <6>.(6)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   40.849301] <5>.(5)[309:hdmirx_timer_kt]pram[10]0xff
> > [   40.850156]
> > <6>.(6)[1:swapper/0]imx686_camera_sensor[return_sensor_id]
> > imx686_camera_sensor[return_sensor_id] 0x16 = ff
> > [   40.850774] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=234
> > [   40.850891] <6>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.850892] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.850904] <6>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.850918] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.850931]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.852305] <6>.(6)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   40.853149] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.854006]
> > <5>.(6)[1:swapper/0]imx686_camera_sensor[return_sensor_id]
> > imx686_camera_sensor[return_sensor_id] 0x17 = ff
> > [   40.854930] <6>.(5)[309:hdmirx_timer_kt]pram[11]0x2
> > [   40.856965] <5>.(6)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   40.857872] <6>.(5)[309:hdmirx_timer_kt]pram[12]0x0
> > [   40.859890] <5>.(6)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   40.861122] <6>.(5)[309:hdmirx_timer_kt]pram[13]0xb0
> > [   40.861730]
> > <5>.(6)[1:swapper/0]imx686_camera_sensor[get_imgsensor_id]
> > imx686_camera_sensor[get_imgsensor_id] Read sensor id fail, write
> > id: 0x20, id: 0xffff
> > [   40.862585] <6>.(5)[309:hdmirx_timer_kt]pram[14]0xff
> > [   40.863367] <5>.(6)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   40.864051] <5>.(5)[309:hdmirx_timer_kt]pram[15]0xff
> > [   40.864670]
> > <6>.(6)[1:swapper/0]imx686_camera_sensor[return_sensor_id]
> > imx686_camera_sensor[return_sensor_id] 0x16 = ff
> > [   40.866422] <5>.(5)[309:hdmirx_timer_kt]pram[16]0xff
> > [   40.867905] <6>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=235
> > [   40.868009] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.868010] <6>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.868026] <5>.(6)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   40.868045] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.868058] <6>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.868072] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.868084]
> > <6>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.868630] <5>.(5)[309:hdmirx_timer_kt]pram[17]0xff
> > [   40.869970]
> > <6>.(6)[1:swapper/0]imx686_camera_sensor[return_sensor_id]
> > imx686_camera_sensor[return_sensor_id] 0x17 = ff
> > [   40.870588] <6>.(5)[309:hdmirx_timer_kt]pram[18]0xff
> > [   40.871811] <5>.(6)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   40.872539] <5>.(5)[309:hdmirx_timer_kt]pram[19]0x2
> > [   40.874549] <5>.(6)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   40.875301]
> > <6>.(5)[309:hdmirx_timer_kt][RX]hdcp2_load_hdcp2x_to_sram
> > [   40.875510]
> > <5>.(5)[309:hdmirx_timer_kt][RX]hdcp2_load_dec_hdcp1x_key_to_sram
> > [   40.876114]
> > <5>.(6)[1:swapper/0]imx686_camera_sensor[get_imgsensor_id]
> > imx686_camera_sensor[get_imgsensor_id] Read sensor id fail, write
> > id: 0x34, id: 0xffff
> > [   40.877761] <5>.(5)[309:hdmirx_timer_kt][RX]HDCP2 Err:Check CCHK
> > done fail
> > [   40.878253] <6>.(6)[1:swapper/0]imgsensor 1-0010:
> > adaptor_hw_power_off power ref cnt = 1
> > [   40.880612] <5>.(5)[309:hdmirx_timer_kt][RX]aud2 Start
> > [   40.882408] <6>.(6)[1:swapper/0]gpiod_direction_output: invalid
> > GPIO (errorpointer)
> > [   40.883186]
> > <5>.(5)[309:hdmirx_timer_kt][RX]VSW_NFY_UNLOCK,4294902512
> > [   40.883190] <6>.(5)[309:hdmirx_timer_kt][RX]uevent
> > name:SWITCH_NAME=hdmi ,state:SWITCH_STATE=255
> > [   40.884005] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=236
> > [   40.884133] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.884147] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.884161] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.884176]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.884196] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.884198] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.886967] <5>.(6)[1:swapper/0]imgsensor 1-0010:
> > adaptor_hw_power_off
> > [   40.887726] <5>.(5)[309:hdmirx_timer_kt][RX]uevent
> > name:SWITCH_NAME=hdmi ,state:SWITCH_STATE=2
> > [   40.888727] <5>.(6)[1:swapper/0]imgsensor 1-
> > 0010:  adaptor_hw_power_on i2c_bus 1
> > [   40.889369] <1>.(5)[309:hdmirx_timer_kt][RX]dvi state from
> > DVI_NO_SIGNAL to DVI_NO_SIGNAL,4294902513
> > [   40.890321] <5>.(6)[1:swapper/0]imgsensor 1-0010:
> > adaptor_hw_power_on power ref cnt = 0
> > [   40.891132] <1>.(5)[309:hdmirx_timer_kt][RX]Rx Ri =0x5f91
> > [   40.900919] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=237
> > [   40.901026] <1>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.901027] <5>-(5)[309:hdmirx_timer_kt][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.901044] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.901956] <1>.(5)[309:hdmirx_timer_kt][RX]5v =
> > 0x2,4294902516ms
> > [   40.903156] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.904094] <1>.(5)[309:hdmirx_timer_kt][RX]hdmi_rx_notify: 0
> > [   40.904102] <1>.(5)[309:hdmirx_timer_kt][RX]uevent
> > name:SWITCH_NAME=hdmi ,state:SWITCH_STATE=255
> > [   40.904789] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.905811] <1>.(5)[309:hdmirx_timer_kt][RX]uevent
> > name:SWITCH_NAME=hdmi ,state:SWITCH_STATE=0
> > [   40.906744]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.907111] <1>.(6)[1:swapper/0]gpiod_direction_output: invalid
> > GPIO (errorpointer)
> > [   40.907786] <1>.(5)[309:hdmirx_timer_kt][RX]uevent
> > name:SWITCH_NAME=hdmi ,state:SWITCH_STATE=12
> > [   40.907799]
> > <1>.(5)[309:hdmirx_timer_kt][RX]hdmi2com_scdc_status_clr
> > [   40.917459] <1>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=238
> > [   40.918215] <1>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   40.918224] <1>-(1)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   40.922120] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.922984] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.923809] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.924954]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.936054] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=239
> > [   40.937473] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.938317] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.939414] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.940279] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.941092] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.942237]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.952045] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=240
> > [   40.953121] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.953955] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.955093] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.955986] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.956800] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.957946]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.972004] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=241
> > [   40.972127] <0>.(0)[1:swapper/0]imgsensor 1-0010:
> > adaptor_hw_power_on
> > [   40.973090] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.973974] <0>.(0)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   40.974610] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.975627]
> > <0>.(0)[1:swapper/0]IMX577_camera_sensor[return_sensor_id]
> > IMX577_camera_sensor[return_sensor_id] 0x16 = ff
> > [   40.976595] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.978707] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.978840] <0>.(0)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   40.979577] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.980438]
> > <0>.(0)[1:swapper/0]IMX577_camera_sensor[return_sensor_id]
> > IMX577_camera_sensor[return_sensor_id] 0x17 = ff
> > [   40.981581]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.984117] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=242
> > [   40.984218] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   40.984233] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   40.984247] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   40.984260]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   40.984857] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   40.984862] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   40.991833] <0>.(0)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   40.996347] <0>.(0)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   40.997265]
> > <0>.(0)[1:swapper/0]IMX577_camera_sensor[get_imgsensor_id]
> > IMX577_camera_sensor[get_imgsensor_id] Read sensor id fail, write
> > id: 0x20, id: 0xffff
> > [   40.999339] <0>.(0)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   41.000217]
> > <0>.(0)[1:swapper/0]IMX577_camera_sensor[return_sensor_id]
> > IMX577_camera_sensor[return_sensor_id] 0x16 = ff
> > [   41.001678] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=243
> > [   41.001760] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.001774] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.001790] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.001805]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.002650] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.002662] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.020128] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=244
> > [   41.022067] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.022923] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.024124] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.024195] <0>.(0)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   41.025010] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.025881]
> > <0>.(0)[1:swapper/0]IMX577_camera_sensor[return_sensor_id]
> > IMX577_camera_sensor[return_sensor_id] 0x17 = ff
> > [   41.026692] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.028405] <0>.(0)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   41.029264]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.030322] <0>.(0)[1:swapper/0]imgsensor 1-0010: i2c transfer
> > failed (-6)
> > [   41.031190] <4>.(4)[0:swapper/4][RX]timer out, set HPD to 1
> > [   41.032032]
> > <0>.(0)[1:swapper/0]IMX577_camera_sensor[get_imgsensor_id]
> > IMX577_camera_sensor[get_imgsensor_id] Read sensor id fail, write
> > id: 0x34, id: 0xffff
> > [   41.032042] <0>.(0)[1:swapper/0]imgsensor 1-0010:
> > adaptor_hw_power_off power ref cnt = 1
> > [   41.034545] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=245
> > [   41.034598] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.034605] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.034612] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.034619]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.035032] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.035037] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.056124] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=246
> > [   41.057461] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.058301] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.059398] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.059402] <1>.(0)[1:swapper/0]gpiod_direction_output: invalid
> > GPIO (errorpointer)
> > [   41.061267] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.061333] <0>.(0)[1:swapper/0]imgsensor 1-0010:
> > adaptor_hw_power_off
> > [   41.062077] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.062893] <0>.(0)[1:swapper/0]imgsensor 1-0010: no sensor
> > found
> > [   41.064077]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.064860]
> > <0>.(0)[1:swapper/0]BOOTPROF:     41064.857174:probe:
> > probe=i2c_device_probe
> > drv=imgsensor(0xffffff80095f4d18)   363.097847ms
> > [   41.067175] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=247
> > [   41.067458] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.067547] <4>.(0)[1:swapper/0]imgsensor 1-0010: Dropping the
> > link to regulator.22
> > [   41.067600] <1>.(0)[1:swapper/0]imgsensor: probe of 1-0010
> > failed with error -5
> > [   41.067605] <4>.(0)[1:swapper/0]probe of 1-0010 returned 0 after
> > 366076 usecs
> > [   41.067708]
> > <1>.(0)[1:swapper/0]BOOTPROF:     41067.706020:initcall:
> > adaptor_drv_init  1428.239542ms
> > [   41.067716] <0>.(0)[1:swapper/0]initcall
> > adaptor_drv_init+0x0/0x24 returned 0 after 1394777 usecs
> > [   41.067725]
> > <1>.(0)[1:swapper/0]calling  mtk_usb_extcon_init+0x0/0x20 @ 1
> > [   41.068625] <0>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.068975] <0>.(0)[1:swapper/0]mtk-extcon-usb odm:extcon_usb:
> > Linked as a consumer to regulator.60
> > [   41.068983] <0>.(0)[1:swapper/0]mtk-extcon-usb odm:extcon_usb:
> > vbus-current=1800000
> > [   41.068993] <0>.(0)[1:swapper/0]mtk-extcon-usb odm:extcon_usb:
> > GPIO lookup for consumer id
> > [   41.068997] <0>.(0)[1:swapper/0]mtk-extcon-usb odm:extcon_usb:
> > using device tree for GPIO lookup
> > [   41.069016] <0>.(0)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'id-gpios' property of node '/odm/extcon_usb[0]'
> > [   41.069024] <0>.(0)[1:swapper/0]of_get_named_gpiod_flags: can't
> > parse 'id-gpio' property of node '/odm/extcon_usb[0]'
> > [   41.069033] <0>.(0)[1:swapper/0]mtk-extcon-usb odm:extcon_usb:
> > using lookup tables for GPIO lookup
> > [   41.069037] <0>.(0)[1:swapper/0]mtk-extcon-usb odm:extcon_usb:
> > No GPIO consumer id found
> > [   41.069043] <0>.(0)[1:swapper/0]mtk-extcon-usb odm:extcon_usb:
> > failed to get id gpio
> > [   41.069198] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.070154] <0>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.070777] <0>.(0)[55:kworker/0:1]mt8195-sound sound: Linked as
> > a consumer to regulator.43
> > [   41.070867] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   41.070891] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   41.070898] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   41.070909] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   41.070918] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   41.070926] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   41.070934] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   41.070942] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   41.070949] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   41.070957] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   41.070965] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   41.070976] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   41.070984] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   41.070996] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   41.071004] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   41.071012] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   41.071020] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   41.071027] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   41.071033] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   41.071042] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   41.071083] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.071133] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   41.071142] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   41.071151] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   41.071159] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   41.071167] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   41.071191] <0>.(0)[55:kworker/0:1]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   41.071229] <0>.(0)[55:kworker/0:1]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   41.071264] <0>.(0)[55:kworker/0:1]probe of sound returned 0
> > after 1025 usecs
> > [   41.071352] <0>.(0)[1:swapper/0]probe of odm:extcon_usb returned
> > 1 after 2667 usecs
> > [   41.071529] <0>.(0)[1:swapper/0]initcall
> > mtk_usb_extcon_init+0x0/0x20 returned 0 after 3707 usecs
> > [   41.071534]
> > <0>.(0)[1:swapper/0]calling  log_store_late_init+0x0/0x288 @ 1
> > [   41.071539] <0>.(0)[1:swapper/0]log_store: set boot phase, last
> > boot phase is 0.
> > [   41.071541] <0>.(0)[1:swapper/0]log_store: not boot up, don't
> > store log to expdb
> > [   41.071547] <0>.(0)[1:swapper/0]log store:sram_dram_buff addr
> > 0x7ffbf000, size 0x40000.
> > [   41.071608] <0>.(0)[1:swapper/0][PHY
> > layout]log_store_mem:0x7ffbf000-0x7fffefff (0x40000)
> > [   41.071615] <0>.(0)[1:swapper/0]buff 00000000a7f25ae7, sig
> > cdab3412 size 40000 pl 20, sz 7aff lk 7b1f, sz 1013c p c, l c
> > [   41.071636] <0>.(0)[1:swapper/0]initcall
> > log_store_late_init+0x0/0x288 returned 0 after 94 usecs
> > [   41.071640]
> > <0>.(0)[1:swapper/0]calling  rt_pd_manager_init+0x0/0x20 @ 1
> > [   41.071983] <0>.(0)[1:swapper/0]initcall
> > rt_pd_manager_init+0x0/0x20 returned 0 after 328 usecs
> > [   41.073103]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.074203] <0>.(0)[1:swapper/0]calling  gpio_keys_init+0x0/0x20
> > @ 1
> > [   41.083979] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=248
> > [   41.083986] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.083991] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.083996] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.084001]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.084350] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.084355] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.100537] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=249
> > [   41.100569] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.100574] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.100578] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.100582]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.100819] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.100823] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.117252] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=250
> > [   41.117287] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.117291] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.117295] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.117298]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.117521] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.117524] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.134336] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=251
> > [   41.134368] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.134372] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.134375] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.134379]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.134606] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.134609] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.150497] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=252
> > [   41.150530] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.150534] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.150537] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.150541]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.150767] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.150770] <0>-(0)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.163314] <7>.(7)[1:swapper/0]of_get_named_gpiod_flags: parsed
> > 'gpios' property of node '/gpio_key/volinc_key[0]' - status (0)
> > [   41.164788] <7>.(7)[1:swapper/0]gpio gpiochip0: Persistence not
> > supported for GPIO 106
> > [   41.165931] <7>.(7)[1:swapper/0]input: gpio_key as
> > /devices/platform/gpio_key/input/input2
> > [   41.167102] <7>-(7)[296:kworker/7:2][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=253
> > [   41.168197] <7>-(7)[296:kworker/7:2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.169074] <7>-(7)[296:kworker/7:2][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   41.170190] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.170288] <7>.(7)[296:kworker/7:2]mt8195-sound sound: Linked
> > as a consumer to regulator.43
> > [   41.171096] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.171258] <4>.(4)[1:swapper/0]probe of gpio_key returned 1
> > after 8008 usecs
> > [   41.171282] <1>.(4)[1:swapper/0]initcall gpio_keys_init+0x0/0x20
> > returned 0 after 8138 usecs
> > [   41.171284]
> > <4>.(4)[1:swapper/0]calling  mtk_charger_init+0x0/0x20 @ 1
> > [   41.172126] <1>.(4)[1:swapper/0]mtk_charger_probe: starts
> > [   41.172141] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   41.172144] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   41.172146] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   41.172147] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   41.172149] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   41.172151] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   41.172153] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   41.172155] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   41.172157] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   41.172159] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   41.172160] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   41.172162] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   41.172164] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   41.172166] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   41.172167] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   41.172169] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   41.172170] <1>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   41.172172] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   41.172174] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   41.172175] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   41.172179] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   41.172181] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   41.172183] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   41.172185] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   41.172187] <4>.(7)[296:kworker/7:2]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   41.172193] <4>.(7)[296:kworker/7:2]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   41.172204] <4>.(7)[296:kworker/7:2]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   41.172216] <1>.(7)[296:kworker/7:2]probe of sound returned 0
> > after 2074 usecs
> > [   41.172939] <4>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.173824] <1>.(4)[1:swapper/0]mtk_charger_parse_dt: size:0x3
> > tag:0x41000802 bootmode:0x0 boottype:0x1
> > [   41.174885]
> > <4>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.175711] <4>.(4)[1:swapper/0]found Basic
> > [   41.175746] <4>.(4)[1:swapper/0]mtk_charger_start_timer: alarm
> > timer start:0, 51 152698540
> > [   41.184342] <4>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=254
> > [   41.184467] <4>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.184468] <4>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.184486] <4>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.185356] <4>-(4)[1:swapper/0]alarmtimer_enqueue, 51152698540
> > [   41.186244] <4>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.187176] <4>.(4)[1:swapper/0]mtk_charger_get_atm_mode:
> > atm_enabled = 0
> > [   41.188046] <4>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.188977] <4>.(4)[1:swapper/0]thermal thermal_zone18:
> > power_allocator: sustainable_power will be estimated
> > [   41.189807]
> > <4>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.190721] <4>.(4)[1:swapper/0]thermal thermal_zone19:
> > power_allocator: sustainable_power will be estimated
> > [   41.200581] <4>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=255
> > [   41.200688] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.200701] <4>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.200702] <4>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.200703] <4>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.200715] <4>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.201729] <4>.(4)[1:swapper/0]: No pd adapter found
> > [   41.202640]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.204156]
> > <4>.(4)[1:swapper/0]BOOTPROF:     41204.154251:probe:
> > probe=platform_drv_probe
> > drv=charger(0xffffff8009637de0)    32.022692ms
> > [   41.218114] <5>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=256
> > [   41.218216] <4>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.218230] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.218244] <4>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.218245] <5>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.218247] <4>-(4)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.218257]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.219436] <4>.(4)[56:kworker/4:1]mt8195-sound sound: Linked as
> > a consumer to regulator.43
> > [   41.223925] <5>.(5)[1:swapper/0]probe of odm:charger returned 1
> > after 52578 usecs
> > [   41.224491] <1>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   41.225493]
> > <4>.(5)[1:swapper/0]BOOTPROF:     41225.492328:initcall:
> > mtk_charger_init    54.204462ms
> > [   41.227008] <1>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   41.227960] <4>.(5)[1:swapper/0]initcall
> > mtk_charger_init+0x0/0x20 returned 0 after 55344 usecs
> > [   41.228806] <1>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   41.229607] <4>.(5)[1:swapper/0]calling  mtk_pd_init+0x0/0x20 @
> > 1
> > [   41.230744] <1>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   41.231670] <4>.(5)[1:swapper/0]initcall mtk_pd_init+0x0/0x20
> > returned 0 after 89 usecs
> > [   41.232543] <4>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   41.232544] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   41.232546] <4>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   41.233551] <3>.(5)[1:swapper/0]calling  wk_proc_init+0x0/0x70 @
> > 1
> > [   41.233556] <4>.(5)[1:swapper/0]initcall wk_proc_init+0x0/0x70
> > returned 0 after 2 usecs
> > [   41.234595] <3>-(4)[56:kworker/4:1][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=257
> > [   41.234643] <3>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.234704] <3>-(4)[56:kworker/4:1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.234706] <3>-(4)[56:kworker/4:1][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   41.234708] <0>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   41.234709] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   41.234712] <0>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   41.234713] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   41.234715] <0>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   41.234717] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   41.234720] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   41.234721] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   41.234723] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   41.234725] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   41.234727] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   41.234729] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   41.234730] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   41.234735] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   41.234737] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   41.234739] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   41.234741] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   41.234744] <3>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   41.234749] <0>.(4)[56:kworker/4:1]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   41.234754]
> > <3>.(4)[56:kworker/4:1]BOOTPROF:     41234.753405:probe:
> > probe=platform_drv_probe drv=mt8195-
> > sound(0xffffff800966ce50)    15.375000ms
> > [   41.234771] <0>.(4)[56:kworker/4:1]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   41.234786] <3>.(4)[56:kworker/4:1]probe of sound returned 0
> > after 15514 usecs
> > [   41.235558]
> > <3>.(5)[1:swapper/0]calling  of_fdt_raw_init+0x0/0x78 @ 1
> > [   41.235628] <3>.(4)[56:kworker/4:1]psy_charger_get_property
> > psp:4
> > [   41.235762] <3>.(5)[1:swapper/0]initcall
> > of_fdt_raw_init+0x0/0x78 returned 0 after 196 usecs
> > [   41.235763] <3>.(5)[1:swapper/0]calling  ccd_init+0x0/0x20 @ 1
> > [   41.235915] <3>.(5)[1:swapper/0]iommu: Adding device
> > 16030000.remoteproc_ccd to group 1
> > [   41.235919] <3>.(5)[1:swapper/0]mtk_ccd 16030000.remoteproc_ccd:
> > Linked as a consumer to 16012000.larb
> > [   41.235960] <3>.(5)[1:swapper/0]mtk_ccd 16030000.remoteproc_ccd:
> > ccd is created: 00000000d8bc6a6e
> > [   41.235962] <3>.(5)[1:swapper/0]mtk_ccd 16030000.remoteproc_ccd:
> > Reg baseaddr [0]: 0x16030000 0x10000
> > [   41.235963] <3>.(5)[1:swapper/0]mtk_ccd 16030000.remoteproc_ccd:
> > ipi id: 0
> > [   41.235966] <3>.(5)[1:swapper/0]mtk_ccd 16030000.remoteproc_ccd:
> > mtk_rpmsg_create_rproc_subdev mtk_ccd_msgdev addr: 1008
> > [   41.235975] <3>.(5)[1:swapper/0]mtk_ccd 16030000.remoteproc_ccd:
> > mtk_rpmsg_create_rpmsgdev 0000000070de4043, info->src(3f0),
> > id_min(1008), id_max(1013)
> > [   41.235978] <1>.(5)[1:swapper/0]mtk_ccd 16030000.remoteproc_ccd:
> > ccd msgdev addr: 1008
> > [   41.236000] <3>.(5)[1:swapper/0]mtk_ccd 16030000.remoteproc_ccd:
> > __rpmsg_create_ept: 1008
> > [   41.236001] <1>.(5)[1:swapper/0]mtk_ccd 16030000.remoteproc_ccd:
> > ccd_msgdev_probe : mtk_ccd_msgdev
> > [   41.236245] <3>.(5)[53:kworker/5:1]mt8195-sound sound: Linked as
> > a consumer to regulator.43
> > [   41.236274] <1>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   41.236278] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   41.236281] <1>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   41.236283] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   41.236286] <1>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   41.236288] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   41.236290] <1>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   41.236292] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   41.236293] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   41.236295] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   41.236296] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   41.236299] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   41.236300] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   41.236302] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   41.236304] <1>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   41.236306] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   41.236308] <1>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   41.236310] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   41.236312] <1>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   41.236314] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   41.236320] <1>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   41.236322] <3>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   41.236324] <1>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   41.236326] <1>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   41.236328] <1>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   41.236334] <1>.(5)[53:kworker/5:1]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   41.236350] <1>.(5)[53:kworker/5:1]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   41.236364] <1>.(5)[53:kworker/5:1]probe of sound returned 0
> > after 281 usecs
> > [   41.236394] <1>.(5)[1:swapper/0]probe of
> > 16030000.remoteproc_ccd.mtk_ccd_msgdev.1008.-1 returned 1 after 397
> > usecs
> > [   41.236412] <1>.(5)[1:swapper/0]remoteproc remoteproc1:
> > remoteproc_ccd is available
> > [   41.236429] <1>.(5)[53:kworker/5:1]remoteproc remoteproc1:
> > powering up remoteproc_ccd
> > [   41.236431] <6>.(5)[53:kworker/5:1]remoteproc remoteproc1:
> > Booting fw image remoteproc_scp, size 100
> > [   41.236433] <1>.(5)[53:kworker/5:1]mtk_ccd
> > 16030000.remoteproc_ccd: remote_ccd loaded!
> > [   41.236435] <6>.(5)[53:kworker/5:1]mtk_ccd
> > 16030000.remoteproc_ccd: ccd started: 00000000a563d335
> > [   41.236436] <1>.(5)[53:kworker/5:1]remoteproc remoteproc1:
> > remote processor remoteproc_ccd is now up
> > [   41.236450] <6>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.236610] <1>.(5)[53:kworker/5:1]mt8195-sound sound: Linked as
> > a consumer to regulator.43
> > [   41.236634] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   41.236636] <1>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   41.236637] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   41.236639] <1>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   41.236641] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   41.236642] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   41.236644] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   41.236645] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   41.236647] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   41.236648] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   41.236650] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   41.236651] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   41.236653] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   41.236654] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   41.236656] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   41.236657] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   41.236659] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   41.236660] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   41.236662] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   41.236663] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   41.236666] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   41.236668] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   41.236670] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   41.236672] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   41.236674] <6>.(5)[53:kworker/5:1]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   41.236679] <6>.(5)[53:kworker/5:1]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   41.236689] <6>.(5)[53:kworker/5:1]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   41.236698] <6>.(5)[53:kworker/5:1]probe of sound returned 0
> > after 211 usecs
> > [   41.236711] <6>.(5)[1:swapper/0]probe of 16030000.remoteproc_ccd
> > returned 1 after 906 usecs
> > [   41.236745] <6>.(5)[1:swapper/0]initcall ccd_init+0x0/0x20
> > returned 0 after 955 usecs
> > [   41.236748]
> > <6>.(5)[1:swapper/0]calling  tcp_congestion_default+0x0/0x24 @ 1
> > [   41.236751] <1>.(5)[1:swapper/0]initcall
> > tcp_congestion_default+0x0/0x24 returned 0 after 1 usecs
> > [   41.236753]
> > <4>.(5)[1:swapper/0]calling  ip_auto_config+0x0/0x3bc @ 1
> > [   41.236759] <1>.(5)[1:swapper/0]initcall
> > ip_auto_config+0x0/0x3bc returned 0 after 4 usecs
> > [   41.236761]
> > <4>.(5)[1:swapper/0]calling  regulatory_init_db+0x0/0xbc @ 1
> > [   41.236768] <1>.(5)[1:swapper/0]cfg80211: Loading compiled-in
> > X.509 certificates for regulatory database
> > [   41.237587] <4>.(4)[56:kworker/4:1]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_charger_get_online: online = 0
> > [   41.238465] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.238807] <4>.(6)[1:swapper/0]cfg80211: Loaded X.509 cert
> > 'sforshee: 00b28ddf47aef9cea7'
> > [   41.238835] <4>.(6)[1:swapper/0]initcall
> > regulatory_init_db+0x0/0xbc returned 0 after 2011 usecs
> > [   41.238895] <4>.(6)[164:kworker/6:2]platform regulatory.0:
> > Direct firmware load for regulatory.db failed with error -2
> > [   41.238901] <4>.(6)[164:kworker/6:2]platform regulatory.0:
> > Falling back to syfs fallback for: regulatory.db
> > [   41.238958]
> > <4>.(6)[1:swapper/0]calling  clear_boot_tracer+0x0/0x3c @ 1
> > [   41.238964] <4>.(6)[1:swapper/0]initcall
> > clear_boot_tracer+0x0/0x3c returned 0 after 0 usecs
> > [   41.238971]
> > <4>.(6)[1:swapper/0]calling  fb_logo_late_init+0x0/0x14 @ 1
> > [   41.238976] <4>.(6)[1:swapper/0]initcall
> > fb_logo_late_init+0x0/0x14 returned 0 after 0 usecs
> > [   41.238982]
> > <4>.(6)[1:swapper/0]calling  clk_disable_unused+0x0/0x1c4 @ 1
> > [   41.239559] <1>.(4)[56:kworker/4:1]is_charger_exist:0
> > [   41.239574] <4>.(4)[56:kworker/4:1]psy_charger_get_property
> > psp:4
> > [   41.239664] <1>.(6)[1:swapper/0]initcall
> > clk_disable_unused+0x0/0x1c4 returned 0 after 656 usecs
> > [   41.239669]
> > <1>.(6)[1:swapper/0]calling  regulator_init_complete+0x0/0x64 @ 1
> > [   41.239689] <2>.(6)[1:swapper/0]initcall
> > regulator_init_complete+0x0/0x64 returned 0 after 16 usecs
> > [   41.239699]
> > <1>.(6)[1:swapper/0]calling  emimpu_ap_region_init+0x0/0x6c @ 1
> > [   41.239703] <2>.(6)[1:swapper/0]emimpu_ap_region_init: enable AP
> > region
> > [   41.239722] <1>.(6)[1:swapper/0]initcall
> > emimpu_ap_region_init+0x0/0x6c returned 0 after 18 usecs
> > [   41.239726]
> > <2>.(6)[1:swapper/0]calling  mt8195_logger_init+0x0/0x1d0 @ 1
> > [   41.240460]
> > <2>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.241214] <2>.(4)[56:kworker/4:1]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_charger_get_online: online = 0
> > [   41.243176] <2>.(3)[122:kworker/3:1]psy_charger_get_property
> > psp:4
> > [   41.243959] <2>.(4)[56:kworker/4:1]is_charger_exist:0
> > [   41.243970] <2>.(4)[56:kworker/4:1]psy_charger_get_property
> > psp:3
> > [   41.244866] <2>.(3)[122:kworker/3:1]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_charger_get_online: online = 0
> > [   41.245740] <2>.(4)[56:kworker/4:1]psy_charger_get_property
> > psp:8
> > [   41.246520] <2>.(3)[122:kworker/3:1]is_charger_exist:0
> > [   41.247526] <2>.(4)[56:kworker/4:1]psy_charger_get_property
> > psp:12
> > [   41.247530] <2>.(4)[56:kworker/4:1]get_pmic_vbus Couldn't get
> > chg_psy
> > [   41.247532] <2>.(4)[56:kworker/4:1]get_pmic_vbus vbus:170343176
> > [   41.247534] <2>.(4)[56:kworker/4:1]get_vbus: get vbus failed: -1
> > [   41.247537] <2>.(4)[56:kworker/4:1]psy_charger_get_property
> > psp:46
> > [   41.247540] <2>.(4)[56:kworker/4:1]psy_charger_get_property
> > psp:30
> > [   41.247543] <2>.(4)[56:kworker/4:1]get_charger_charging_current:
> > get charging current failed: -524
> > [   41.247544]
> > <2>.(4)[56:kworker/4:1]get_charger_charging_current:-524
> > [   41.247549] <2>.(4)[56:kworker/4:1]psy_charger_get_property
> > psp:35
> > [   41.247551] <2>.(4)[56:kworker/4:1]get_charger_input_current:
> > get input current failed: -524
> > [   41.247552] <2>.(4)[56:kworker/4:1]get_charger_input_current:-
> > 524
> > [   41.250421] <2>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=258
> > [   41.250437] <2>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.250444] <2>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.250453] <2>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.250461]
> > <2>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.251374] <2>.(3)[122:kworker/3:1]psy_charger_get_property
> > psp:4
> > [   41.252784] <2>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.253085] <2>.(3)[122:kworker/3:1]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_charger_get_online: online = 0
> > [   41.253955] <2>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.254828] <1>.(3)[122:kworker/3:1]is_charger_exist:0
> > [   41.267073] <5>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=259
> > [   41.267081] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.267085] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.267090] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.267095]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.267808] <1>.(3)[122:kworker/3:1]psy_charger_get_property
> > psp:3
> > [   41.269383] <5>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.270655] <5>.(3)[122:kworker/3:1]psy_charger_get_property
> > psp:8
> > [   41.271663] <5>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.283732] <5>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=260
> > [   41.284248] <5>.(3)[122:kworker/3:1]psy_charger_get_property
> > psp:12
> > [   41.285484] <5>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.286242] <5>.(3)[122:kworker/3:1]get_pmic_vbus Couldn't get
> > chg_psy
> > [   41.287356] <5>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.287364] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.288404] <5>.(3)[122:kworker/3:1]get_pmic_vbus vbus:174504712
> > [   41.289270] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.290138] <5>.(3)[122:kworker/3:1]get_vbus: get vbus failed:
> > -1
> > [   41.291006] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.291880] <5>.(3)[122:kworker/3:1]psy_charger_get_property
> > psp:46
> > [   41.291884] <5>.(3)[122:kworker/3:1]psy_charger_get_property
> > psp:30
> > [   41.292753]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.293631]
> > <5>.(3)[122:kworker/3:1]get_charger_charging_current: get charging
> > current failed: -524
> > [   41.300392] <5>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=261
> > [   41.300597]
> > <5>.(3)[122:kworker/3:1]get_charger_charging_current:-524
> > [   41.301722] <5>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.302341] <5>.(3)[122:kworker/3:1]psy_charger_get_property
> > psp:35
> > [   41.303315] <5>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.303324] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.304235] <5>.(3)[122:kworker/3:1]get_charger_input_current:
> > get input current failed: -524
> > [   41.305198] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.306097] <5>.(3)[122:kworker/3:1]get_charger_input_current:-
> > 524
> > [   41.307127] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.316430] <5>.(6)[1:swapper/0][name:spm&][SPM] find
> > 'mediatek,toprgu' node failed
> > [   41.317062] <5>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=262
> > [   41.317299]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.317529] <3>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.317535] <3>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.318592] <3>.(6)[1:swapper/0][name:spm&][SPM] find
> > 'mediatek,adsp_core_0' node failed
> > [   41.319427] <3>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.320605] <3>.(6)[1:swapper/0][name:spm&][SPM] find
> > 'mediatek,adsp_core_1' node failed
> > [   41.321668] <3>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.322481]
> > <3>.(6)[1:swapper/0]BOOTPROF:     41322.480020:initcall:
> > mt8195_logger_init    82.747692ms
> > [   41.323525] <3>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.324384] <3>.(6)[1:swapper/0]initcall
> > mt8195_logger_init+0x0/0x1d0 returned 0 after 82669 usecs
> > [   41.325256]
> > <3>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.326122]
> > <3>.(6)[1:swapper/0]calling  mtk_iommu_sec_init+0x0/0x138 @ 1
> > [   41.333957] <3>-(6)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=263
> > [   41.334047] <3>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.334052] <3>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.334057] <3>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.334061]
> > <3>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.334084] <3>-(6)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.334085] <3>-(6)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.351228] <3>-(6)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=264
> > [   41.351337] <5>-(6)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.351338] <3>-(6)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.351360] <3>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.353237] <3>.(4)[295:ree_service][DEVAPC] INFRA Violation (R)
> > - Vio Addr: 0x13fbf000, High: 0x80, Bus ID: 0x99, Domain ID: 0x0
> > [   41.353331] <3>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.354411] <3>.(4)[295:ree_service][DEVAPC] INFRA Violation (R)
> > - Vio Addr: 0x1021109c, High: 0x80, Bus ID: 0x99, Domain ID: 0x0
> > [   41.355211] <3>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.356319] <3>.(4)[295:ree_service][DEVAPC] INFRA Violation (R)
> > - Vio Addr: 0x14f00110, High: 0x80, Bus ID: 0x132, Domain ID: 0x0
> > [   41.357228]
> > <3>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.358715] <3>.(4)[295:ree_service][DEVAPC] INFRA Violation (R)
> > - Vio Addr: 0x10211094, High: 0x80, Bus ID: 0x99, Domain ID: 0x0
> > [   41.368032] <0>-(4)[295:ree_service][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=265
> > [   41.368265] <0>-(4)[295:ree_service][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.368268] <0>-(4)[295:ree_service][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   41.368355] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.369513] <0>.(4)[295:ree_service][TZ_M4U]m4u session create
> > 0x0
> > [   41.369796] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.371786]
> > <0>.(2)[295:ree_service][TZ_M4U]sec_pt_va=0x0x81464000,
> > pa=0x81464000, align=0x4000
> > [   41.372569] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.374115] <0>.(2)[295:ree_service][TZ_M4U]tee mem:
> > (va0x81441800 pa0x81441800-0xa0e00000 sz505M),4gb 0
> > [   41.374568]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.375804] <0>.(2)[295:ree_service][TZ_M4U]init NonsecPa
> > be560000 Va 0x0xa0e08000, total sec mva sz:0x2f9be800
> > [   41.383862] <0>-(2)[295:ree_service][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=266
> > [   41.383909] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.383914] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.383918] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.383923]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.384171] <0>-(2)[295:ree_service][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.384175] <1>-(2)[295:ree_service][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   41.401559] <0>-(2)[295:ree_service][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=267
> > [   41.401825] <1>-(2)[295:ree_service][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.401828] <0>-(2)[295:ree_service][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   41.401883] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.403135]
> > <7>.(5)[1:swapper/0]BOOTPROF:     41403.131944:initcall:
> > mtk_iommu_sec_init    50.869923ms
> > [   41.403477] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.404399] <0>.(5)[1:swapper/0]initcall
> > mtk_iommu_sec_init+0x0/0x138 returned 0 after 50952 usecs
> > [   41.405261] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.406062]
> > <0>.(5)[1:swapper/0]calling  tcpc_class_complete_init+0x0/0x38 @ 1
> > [   41.407223]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.408220] <0>.(5)[1:swapper/0]__tcpc_class_complete_work =
> > type_c_port0
> > [   41.417520] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=268
> > [   41.417661] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.417671] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.417680] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.417681] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.417689]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.417690] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.433993] <0>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=269
> > [   41.434124] <1>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.434129] <0>-(5)[1:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.434134] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.434140] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.435188] <1>.(3)[70:pd_dbg_info]///PD dbg info 42d
> > [   41.436123] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.436131]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.451148] <0>-(3)[70:pd_dbg_info][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=270
> > [   41.451234] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.451243] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.451254] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.451263]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.451819] <0>-(3)[70:pd_dbg_info][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.451828] <0>-(3)[70:pd_dbg_info][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   41.454844] <0>.(5)[1:swapper/0]usb_type_c 6-004e:
> > mt6360_init_alert_mask
> > [   41.455688] <0>.(3)[70:pd_dbg_info]<   41.435>mt6360_tcpc_init()
> > line-1967:
> > [   41.467016] <1>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=271
> > [   41.467077] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.467082] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.467087] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.467092]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.483681] <0>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.484160] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.484907] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.485893] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.486771] <0>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.487789] <0>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=272
> > [   41.488301] <0>.(0)[1:swapper/0]tcpc_device_irq_enable : tcpc
> > irq enable OK!
> > [   41.488310]
> > <0>.(0)[1:swapper/0]BOOTPROF:     41488.308559:initcall:
> > tcpc_class_complete_init    80.088846ms
> > [   41.488315] <0>.(0)[1:swapper/0]initcall
> > tcpc_class_complete_init+0x0/0x38 returned 0 after 78221 usecs
> > [   41.488320]
> > <0>.(0)[1:swapper/0]calling  mtk_dvfsrc_helper_init+0x0/0x50 @ 1
> > [   41.488646]
> > <0>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.488865] <0>.(0)[1:swapper/0]mtk-dvfsrc-helper
> > 10012000.dvfsrc:dvfsrc-helper: dvfsrc vopp[0] = 550000
> > [   41.488869] <4>.(0)[1:swapper/0]mtk-dvfsrc-helper
> > 10012000.dvfsrc:dvfsrc-helper: dvfsrc vopp[1] = 600000
> > [   41.488872] <0>.(0)[1:swapper/0]mtk-dvfsrc-helper
> > 10012000.dvfsrc:dvfsrc-helper: dvfsrc vopp[2] = 650000
> > [   41.488875] <4>.(0)[1:swapper/0]mtk-dvfsrc-helper
> > 10012000.dvfsrc:dvfsrc-helper: dvfsrc vopp[3] = 750000
> > [   41.488969] <0>.(0)[1:swapper/0]mtk-dvfsrc-helper
> > 10012000.dvfsrc:dvfsrc-helper: Linked as a consumer to regulator.6
> > [   41.489005] <4>.(0)[1:swapper/0]mtk-dvfsrc-helper
> > 10012000.dvfsrc:dvfsrc-helper: Linked as a consumer to regulator.3
> > [   41.489030] <0>.(0)[1:swapper/0]mtk-dvfsrc-helper
> > 10012000.dvfsrc:dvfsrc-helper: Linked as a consumer to regulator.4
> > [   41.489746] <0>.(0)[55:kworker/0:1]mt8195-sound sound: Linked as
> > a consumer to regulator.43
> > [   41.489796] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   41.489809] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   41.490091] <0>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.490096] <0>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.490649] <0>.(1)[1:swapper/0]probe of 10012000.dvfsrc:dvfsrc-
> > helper returned 1 after 1905 usecs
> > [   41.491746] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   41.493340] <0>.(1)[1:swapper/0]probe of 10012000.dvfsrc:dvfsrc-
> > met returned 1 after 41 usecs
> > [   41.493781] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   41.494821] <7>.(1)[1:swapper/0]initcall
> > mtk_dvfsrc_helper_init+0x0/0x50 returned 0 after 6340 usecs
> > [   41.495068] <0>.(3)[70:pd_dbg_info]///PD dbg info 830d
> > [   41.495070] <7>.(3)[70:pd_dbg_info]<   41.466>TCPC-
> > TYPEC:typec_init: TrySNK
> > [   41.495070] <7><   41.467>TCPC-TYPEC:PowerOffCharge
> > [   41.495070] <7><   41.467>TCPC-TYPEC:** Unattached.SNK
> > [   41.495070] <7><   41.
> > [   41.495073] <0>.(3)[70:pd_dbg_info]467>mt6360_set_cc() line-
> > 1288: mt6360_set_cc 4
> > [   41.495073] <0><   41.470>mt6360_set_cc() line-1288:
> > mt6360_set_cc 2
> > [   41.495073] <0><   41.489>mt6360_alert_ven
> > [   41.495075] <7>.(3)[70:pd_dbg_info]dor_defined_handler() line-
> > 1683: Vend INT1:0x21
> > [   41.495075] <7><   41.489>mt6360_alert_vendor_defined_handler()
> > line-1684: Mask INT1:0x09
> > [   41.495075] <7><   4
> > [   41.495078]
> > <0>.(3)[70:pd_dbg_info]1.489>mt6360_alert_vendor_defined_handler()
> > line-1683: Vend INT3:0x14
> > [   41.495078] <0><   41.489>mt6360_alert_vendor_defined_handler()
> > line-1684
> > [   41.495080] <0>.(3)[70:pd_dbg_info]: Mask INT3:0x00
> > [   41.495080] <0><   41.489>mt6360_alert_vendor_defined_handler()
> > line-1683: Vend INT5:0x08
> > [   41.495080] <0><   41.489>mt6360_alert_vendor_defin
> > [   41.495083] <0>.(3)[70:pd_dbg_info]ed_handler() line-1684: Mask
> > INT5:0x00
> > [   41.495083] <0><   41.489>TCPC-TCPC:FaultAlert=0x80
> > [   41.495083] <0><   41.490>TCPC-TYPEC:[CC_Alert] 0/5
> > [   41.495083] <0><   41.490>TC
> > [   41.495086] <0>.(3)[70:pd_dbg_info]PC-TYPEC:** AttachWait.SNK
> > [   41.495086] <0><   41.491>TCPC-TCPC:ps_change=2
> > [   41.495648] <2>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   41.496596]
> > <0>.(1)[1:swapper/0]calling  of_platform_sync_state_init+0x0/0x24 @
> > 1
> > [   41.497451] <2>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   41.498692] <0>.(1)[1:swapper/0]initcall
> > of_platform_sync_state_init+0x0/0x24 returned 0 after 428 usecs
> > [   41.499403] <2>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   41.500238]
> > <0>.(1)[1:swapper/0]calling  alsa_sound_last_init+0x0/0x8c @ 1
> > [   41.500341] <2>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=273
> > [   41.500348] <0>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.500352] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.500356] <0>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.500360]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.500632] <0>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.500636] <0>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.501246] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   41.502207] <0>.(1)[1:swapper/0]ALSA device list:
> > [   41.503160] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   41.503994] <0>.(1)[1:swapper/0]  #0: mt63xx-accdet
> > [   41.504959] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   41.505813] <0>.(1)[1:swapper/0]  #1: mt8570-sound
> > [   41.506617] <5>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   41.507254] <0>.(1)[1:swapper/0]initcall
> > alsa_sound_last_init+0x0/0x8c returned 0 after 4926 usecs
> > [   41.508392] <5>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   41.517006] <0>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=274
> > [   41.517019] <5>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.517026] <0>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.517034] <0>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.517041]
> > <0>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.517822] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   41.519283] <0>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.519644] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   41.520432] <0>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.521579] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   41.533665] <0>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=275
> > [   41.533673] <0>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.533677] <0>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.533683] <0>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.533687]
> > <0>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.534492] <1>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   41.535958] <0>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.536866] <1>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   41.538043] <0>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.539362] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   41.550323] <0>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=276
> > [   41.550328] <0>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.550332] <0>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.550335] <0>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.550338]
> > <0>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.550471] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   41.551882] <0>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.552262] <3>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   41.554694] <0>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.556938] <3>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   41.566984] <0>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=277
> > [   41.567151] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   41.568269] <0>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.568947] <4>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   41.569819] <0>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.571002] <4>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   41.571887] <0>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.572745] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   41.573684] <0>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.574555] <0>.(0)[55:kworker/0:1]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   41.575350] <0>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.575354]
> > <0>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.576499]
> > <0>.(0)[55:kworker/0:1]BOOTPROF:     41576.496636:probe:
> > probe=platform_drv_probe drv=mt8195-
> > sound(0xffffff800966ce50)    86.906692ms
> > [   41.583646] <0>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=278
> > [   41.583655] <0>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.583658] <0>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.583662] <0>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.583665]
> > <0>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.583739] <0>.(0)[55:kworker/0:1]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   41.584848] <0>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.585723] <7>.(0)[55:kworker/0:1]probe of sound returned 0
> > after 96356 usecs
> > [   41.586561] <0>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.588077] <7>.(0)[55:kworker/0:1]mt8195-sound sound: Linked as
> > a consumer to regulator.43
> > [   41.600308] <0>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=279
> > [   41.600317] <7>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.600320] <0>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.600324] <3>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.600327]
> > <0>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.600526] <3>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   41.601625] <0>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.602206] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   41.603177] <0>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.610812] <0>.(3)[70:pd_dbg_info]///PD dbg info 78d
> > [   41.611620] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   41.611627] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   41.611672] <0>.(1)[7:kworker/u16:0]mtk-extcon-usb
> > odm:extcon_usb: old_state=0, new_state=1
> > [   41.611675] <0>.(2)[173:tcpc_timer_type]mtk-typec-mux-switch
> > typec_mux_switch: mtk_typec_switch_set 0 1
> > [   41.611680] <0>.(2)[173:tcpc_timer_type]fusb304 odm:fusb304:
> > fusb304_switch_set 1
> > [   41.611683] <2>.(2)[173:tcpc_timer_type]fusb304 odm:fusb304:
> > fusb304_switch_set TYPEC_ORIENTATION_NORMAL
> > [   41.612528] <0>.(3)[70:pd_dbg_info]<   41.610>TCPC-
> > TYPEC:[CC_Change] 0/5
> > [   41.612528] <0><   41.610>TCPC-TYPEC:** Attached.SNK
> > [   41.613493] <2>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   41.616971] <0>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=280
> > [   41.616978] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.616981] <0>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.616985] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.616989]
> > <0>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.617174] <2>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   41.618325] <0>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.619018] <2>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   41.619938] <0>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.633632] <2>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=281
> > [   41.633638] <0>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.633642] <0>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.633645] <0>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.633649]
> > <0>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.634301] <4>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   41.635466] <0>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.636174] <4>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   41.637212] <0>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.638157] <4>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   41.639061] <0>.(3)[70:pd_dbg_info]///PD dbg info 133d
> > [   41.639825] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   41.640951] <0>.(3)[70:pd_dbg_info]<   41.611>mt6360_set_cc()
> > line-1288: mt6360_set_cc 2
> > [   41.640951] <0><   41.611>TCPC-TYPEC:Attached-> SINK
> > [   41.640951] <0><   41.611>TCPC-TCPC:usb_port_attac
> > [   41.640954] <0>.(3)[70:pd_dbg_info]hed
> > [   41.641961] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   41.650294] <0>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=282
> > [   41.651009] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   41.652445] <0>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.653670] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   41.654534] <0>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.655491] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   41.656343] <0>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.657138] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   41.658273] <7>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.659290] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   41.660164] <7>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.661000] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   41.661877]
> > <0>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.662841] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   41.666957] <0>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=283
> > [   41.666963] <0>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.666967] <0>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.666970] <0>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.666974]
> > <0>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.667601] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   41.668731] <0>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.669301] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   41.670164] <0>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.671140] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   41.683618] <0>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=284
> > [   41.683624] <0>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.683627] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.683631] <0>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.683634]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.684178] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   41.685243] <2>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.685954] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   41.687087] <2>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.700279] <0>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=285
> > [   41.701133] <0>.(0)[55:kworker/0:1]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   41.702191] <0>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.703090] <0>.(0)[55:kworker/0:1]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   41.704077] <0>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.704960]
> > <0>.(0)[55:kworker/0:1]BOOTPROF:     41704.957560:probe:
> > probe=platform_drv_probe drv=mt8195-
> > sound(0xffffff800966ce50)   117.000538ms
> > [   41.705800] <0>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.706738] <0>.(0)[55:kworker/0:1]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   41.707683] <0>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.707687] <3>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.707690]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.716942] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=286
> > [   41.717081] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.717100] <3>.(0)[55:kworker/0:1]probe of sound returned 0
> > after 129336 usecs
> > [   41.718463] <2>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.719248] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.720177] <2>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.721044] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.725775]
> > <1>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.728065] <1>.(1)[1:swapper/0]Freeing unused kernel memory:
> > 1152K
> > [   41.728976]
> > <1>.(1)[1:swapper/0]BOOTPROF:     41728.966791:Kernel_init_done
> > [   41.729863] <1>.(1)[1:swapper/0]Run /init as init process
> > [   41.733608] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=287
> > [   41.734798] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   41.735584] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.736561] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.737423] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.738230] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.739384]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.745222] <4>.(4)[1:init]init: init first stage started!
> > [   41.745967] <4>.(4)[1:init]init: Unable to open /lib/modules,
> > skipping module loading.
> > [   41.747183] <4>.(4)[1:init]init: Switching root to
> > '/first_stage_ramdisk'
> > [   41.748294] <4>.(4)[1:init]init: [libfs_mgr]ReadFstabFromDt():
> > failed to read fstab from dt
> > [   41.749592] <4>.(4)[1:init]init: [libfs_mgr]Warning: unknown
> > flag: resize
> > [   41.750470] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=288
> > [   41.750588] <4>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.750603] <4>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.750619] <4>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.750634]
> > <4>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.750681] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   41.750683] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.757496] <4>.(4)[1:init]init: Using Android DT directory
> > /proc/device-tree/firmware/android/
> > [   41.766928] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=289
> > [   41.768000] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   41.768782] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.769842] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.770725] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.771591] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.772750]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.780309] <4>.(4)[1:init]init: [libfs_mgr]superblock
> > s_max_mnt_count:65535,/dev/block/by-name/md_udc
> > [   41.781542] <4>.(4)[1:init]init: [libfs_mgr]Filesystem on
> > /dev/block/by-name/md_udc was not cleanly shutdown; state flags:
> > 0x1, incompat feature flags: 0x46
> > [   41.783445] <4>.(4)[1:init]init: [libfs_mgr]check_fs():
> > mount(/dev/block/by-name/md_udc,/metadata,ext4)=-1: No such file or
> > directory
> > [   41.784960] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=290
> > [   41.785099] <4>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.785114] <4>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.785131] <4>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.785147]
> > <4>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.785226] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   41.785229] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.792035] <4>.(4)[1:init]init: [libfs_mgr]Running
> > /system/bin/e2fsck on /dev/block/mmcblk0p12
> > [   41.795015] <4>.(4)[1:init]e2fsck: e2fsck 1.45.4 (23-Sep-2019)
> > [   41.798550] <7>.(7)[1:init]e2fsck: /dev/block/by-name/md_udc:
> > recovering journal
> > [   41.800283] <2>-(2)[324:e2fsck][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=291
> > [   41.801573] <2>-(2)[324:e2fsck][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.802403] <2>-(2)[324:e2fsck][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.803449] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.804355] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.805179] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.806343]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.815717] <5>.(5)[1:init]e2fsck: Pass 1: Checking inodes,
> > blocks, and sizes
> > [   41.816964] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=292
> > [   41.818199] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.819036] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.820076] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.820944] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.821790] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.822948]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.824242] <5>.(5)[1:init]e2fsck: Pass 2: Checking directory
> > structure
> > [   41.826872] <4>.(4)[1:init]e2fsck: Pass 3: Checking directory
> > connectivity
> > [   41.827777] <4>.(4)[1:init]e2fsck: Pass 4: Checking reference
> > counts
> > [   41.828579] <4>.(4)[1:init]e2fsck: Pass 5: Checking group
> > summary information
> > [   41.831160] <4>.(4)[1:init]e2fsck: /dev/block/by-name/md_udc:
> > 27/5792 files (0.0% non-contiguous), 1239/5786 blocks
> > [   41.833609] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=293
> > [   41.834857] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.835694] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.836741] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.837618] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.838432] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.839621]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.843141] <5>.(5)[1:init]EXT4-fs (mmcblk0p12): mounted
> > filesystem with ordered data mode. Opts: discard
> > [   41.850312] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=294
> > [   41.850390] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.851400] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.852153] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.852987] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.853794] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.855923]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.866926] <1>-(1)[2:kthreadd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=295
> > [   41.866958] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.868795] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.868839] <1>-(1)[2:kthreadd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.869621] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.870454] <1>-(1)[2:kthreadd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.871624]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.882354] <1>.(1)[1:init]EXT4-fs (dm-2): mounted filesystem
> > without journal. Opts:
> > [   41.883564] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=296
> > [   41.884773] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   41.885557] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.886539] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.887462] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.888285] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.889450]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.900238] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=297
> > [   41.901878] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   41.902675] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.903790] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.904697] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.905520] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.906688]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.908833] <1>.(1)[1:init]EXT4-fs (dm-1): mounted filesystem
> > without journal. Opts:
> > [   41.914411] <1>.(1)[1:init]EXT4-fs (dm-0): mounted filesystem
> > without journal. Opts:
> > [   41.916885] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=298
> > [   41.918097] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.918935] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.919952] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.920856] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.921681] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.922821]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.933553] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=299
> > [   41.934814] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   41.935602] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.936588] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.937465] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.938274] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.939493]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.942479] <1>.(1)[1:init]init: 22 output lines suppressed due
> > to ratelimiting
> > [   41.950211] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=300
> > [   41.951396] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   41.952181] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.953231] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.954093] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.954915] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.956101]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.966876] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=301
> > [   41.968148] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.968988] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.970048] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.970948] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.971782] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.972949]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   41.983537] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=302
> > [   41.984866] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   41.985707] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   41.986758] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   41.987636] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   41.988471] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   41.989631]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.000200] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=303
> > [   42.001529] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.002370] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.003413] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.004279] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.005137] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.006281]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.016871] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=304
> > [   42.018560] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.019411] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.020457] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.021364] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.022176] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.023379]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.033518] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=305
> > [   42.034726] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.035564] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.036593] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.037455] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.038281] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.039455]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.050187] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=306
> > [   42.051469] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.052256] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.053269] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.054135] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.054975] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.056129]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.066843] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=307
> > [   42.068004] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.068788] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.069762] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.070628] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.071465] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.072611]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.083518] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=308
> > [   42.085157] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.085954] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.087094] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.088069] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.088894] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.090048]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.096177] <1>.(1)[1:init]init: [libfs_mgr]Warning: unknown
> > flag: resize
> > [   42.098238] <1>.(1)[1:init]init: DM_DEV_STATUS failed for
> > system_ext_a: No such device or address
> > [   42.099401] <1>.(1)[1:init]init: Could not update logical
> > partition
> > [   42.100220] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=309
> > [   42.100260] <1>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.100266] <1>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.100271] <1>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.100276]
> > <1>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.100585] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.100590] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.107063] <1>.(1)[1:init]init: Loading SELinux policy
> > [   42.116840] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=310
> > [   42.118528] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.119378] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.120484] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.121360] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.122279] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.123476]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.133496] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=311
> > [   42.134775] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.135562] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.136556] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.137421] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.138229] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.139392]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.150154] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=312
> > [   42.151314] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.152098] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.153064] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.153925] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.154731] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.155886]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.156324] <5>.(5)[1:init]SELinux:  policy capability
> > network_peer_controls=1
> > [   42.157796] <5>.(5)[1:init]SELinux:  policy capability
> > open_perms=1
> > [   42.158578] <5>.(5)[1:init]SELinux:  policy capability
> > extended_socket_class=1
> > [   42.159488] <5>.(5)[1:init]SELinux:  policy capability
> > always_check_network=0
> > [   42.160377] <5>.(5)[1:init]SELinux:  policy capability
> > cgroup_seclabel=0
> > [   42.161212] <5>.(5)[1:init]SELinux:  policy capability
> > nnp_nosuid_transition=1
> > [   42.166813] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=313
> > [   42.167871] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.168652] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.169651] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.170520] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.171365] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.172518]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.183474] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=314
> > [   42.184497] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.185278] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.186307] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.187213] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.188034] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.189186]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.200136] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=315
> > [   42.201145] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.201926] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.203021] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.203931] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.204751] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.205902]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.216899] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=316
> > [   42.218107] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.218945] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.220172] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.221062] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.221883] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.223037]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.236257] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=317
> > [   42.237534] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.238374] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.239579] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.240467] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.241294] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.242328] <4>.(4)[52:kauditd]audit: type=1403 audit(42.216:2):
> > auid=4294967295 ses=4294967295 lsm=selinux res=1
> > [   42.242452]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.243928] <4>.(4)[1:init]selinux: SELinux: Loaded policy from
> > /vendor/etc/selinux/precompiled_sepolicy
> > [   42.245961] <4>.(4)[1:init]selinux:
> > [   42.246813] <0>.(0)[52:kauditd]audit: type=1404 audit(42.220:3):
> > enforcing=1 old_enforcing=0 auid=4294967295 ses=4294967295
> > enabled=1 old-enabled=1 lsm=selinux res=1
> > [   42.252227] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=318
> > [   42.252260] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.253483] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.254050] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.254884] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.255722] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.257787]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.266923] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=319
> > [   42.268195] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.269036] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.270225] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.271176] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.271990] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.273135]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.284193] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=320
> > [   42.285633] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.286477] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.287595] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.288468] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.289299] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.290459]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.290977] <4>.(4)[1:init]selinux: SELinux: Loaded
> > file_contexts
> > [   42.292247] <4>.(4)[1:init]selinux:
> > [   42.300118] <7>-(7)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=321
> > [   42.301269] <7>-(7)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.302054] <7>-(7)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.303135] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.304020] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.304847] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.306005]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.312734] <7>.(7)[1:init]init: init second stage started!
> > [   42.316859] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=322
> > [   42.318771] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.319627] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.320825] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.321696] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.322502] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.323676]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.333547] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=323
> > [   42.334784] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.335624] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.336803] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.337701] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.338526] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.339763]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.350170] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=324
> > [   42.352093] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.352947] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.354075] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.354946] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.355830] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.356974]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.366765] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=325
> > [   42.367980] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.368765] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.369745] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.370607] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.371452] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.372593]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.383428] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=326
> > [   42.384618] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.385403] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.386388] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.387269] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.388077] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.389218]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.393040] <5>.(5)[1:init]init: Using Android DT directory
> > /proc/device-tree/firmware/android/
> > [   42.394834] <5>.(5)[1:init]init: Init cannot set
> > 'ro.boot.hardware' to 'mt8195': Read-only property was already set
> > [   42.396240] <5>.(5)[1:init]init: Init cannot set
> > 'ro.boot.hardware' to 'mt8195': Read-only property was already set
> > [   42.397695] <5>.(5)[1:init]init: Init cannot set
> > 'ro.boot.serialno' to '0123456789ABCDEF': Read-only property was
> > already set
> > [   42.400084] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=327
> > [   42.401146] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.401928] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.402939] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.403851] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.404128] <5>.(5)[1:init]init: Overriding previous 'ro.'
> > property 'ro.iorapd.enable':'true' with new value 'false'
> > [   42.404667] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.407160]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.407913] <5>.(5)[1:init]init: Do not have permissions to set
> > 'dalvik.vm.mtk-stack-trace-file' to '/data/anr/mtk_traces.txt' in
> > property file '/vendor/build.prop': SELinux permission check failed
> > [   42.410405] <5>.(5)[1:init]init: Do not have permissions to set
> > 'ro.mtk_sec_video_path_support' to '1' in property file
> > '/vendor/build.prop': SELinux permission check failed
> > [   42.413986] <5>.(5)[1:init]init: Couldn't load property file
> > '/factory/factory.prop': open() failed: No such file or directory:
> > No such file or directory
> > [   42.416743] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=328
> > [   42.417763] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.418544] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.419575] <5>.(5)[1:init]init: Setting product property
> > ro.product.brand to 'alps' (from ro.product.odm.brand)
> > [   42.419638] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.421723] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.422549] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.423744]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.433409] <6>-(6)[341:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=329
> > [   42.434457] <6>-(6)[341:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.435260] <6>-(6)[341:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.436391] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.437272] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.438101] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.439279]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.450073] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=330
> > [   42.451269] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.452108] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.453266] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.454167] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.455003] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.456212]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.466736] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=331
> > [   42.466878] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.467835] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.468607] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.469437] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.470249] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.472369]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.483416] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=332
> > [   42.484614] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.485454] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.486611] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.487537] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.488356] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.489505]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.500053] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=333
> > [   42.501144] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.501980] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.503084] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.503967] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.504792] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.505948]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.516733] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=334
> > [   42.518381] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.519178] <1>-(1)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.520229] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.521106] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.522004] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.523259]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.533385] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=335
> > [   42.534601] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.535438] <1>-(1)[0:swapper/1][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.536461] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.537349] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.538175] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.539349]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.550057] <0>-(0)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=336
> > [   42.551895] <0>-(0)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.552696] <0>-(0)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.553770] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.554656] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.555558] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.556719]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.566706] <4>-(4)[343:linkerconfig][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=337
> > [   42.567867] <4>-(4)[343:linkerconfig][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   42.568757] <4>-(4)[343:linkerconfig][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   42.569934] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.570838] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.571711] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.572881]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.583399] <0>-(0)[13:migration/0][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=338
> > [   42.583507] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.584804] <0>-(0)[13:migration/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.585266] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.586134] <0>-(0)[13:migration/0][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   42.586940] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.589116]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.600035] <6>-(6)[345:apexd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=339
> > [   42.600209] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.601218] <6>-(6)[345:apexd][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.601846] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.602658] <6>-(6)[345:apexd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.603542] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.605561]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.616689] <6>-(6)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=340
> > [   42.616745] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.617789] <6>-(6)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.618522] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.619347] <1>-(6)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.621194] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.621738] <6>.(6)[344:ueventd]ueventd: ueventd started!
> > [   42.622347]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.624774] <6>.(6)[344:ueventd]selinux: SELinux: Loaded
> > file_contexts
> > [   42.625594] <6>.(6)[344:ueventd]selinux:
> > [   42.626227] <6>.(6)[344:ueventd]ueventd: Parsing file
> > /system/etc/ueventd.rc...
> > [   42.628266] <6>.(6)[344:ueventd]ueventd: Parsing file
> > /vendor/ueventd.rc...
> > [   42.630198] <6>.(6)[344:ueventd]ueventd: Parsing file
> > /odm/ueventd.rc...
> > [   42.631077] <6>.(6)[344:ueventd]ueventd: Unable to read config
> > file '/odm/ueventd.rc': open() failed: No such file or directory
> > [   42.632519] <6>.(6)[344:ueventd]ueventd: Parsing file
> > /ueventd.mt8195.rc...
> > [   42.633349] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=341
> > [   42.633420] <6>.(6)[344:ueventd]ueventd: Unable to read config
> > file '/ueventd.mt8195.rc': open() failed: No such file or directory
> > [   42.633527] <7>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.633541] <7>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.633557] <7>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.633571]
> > <7>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.634457] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.640417] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.645852] <7>.(7)[345:apexd]apexd: This device does not
> > support updatable APEX. Exiting
> > [   42.650014] <6>-(6)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=342
> > [   42.650132] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.651093] <6>-(6)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.651881] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.652666] <6>-(6)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.653482] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.655613]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.661488] <6>.(6)[344:ueventd]psy_charger_get_property psp:4
> > [   42.662226] <6>.(6)[344:ueventd]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_charger_get_online: online = 0
> > [   42.663409] <6>.(6)[344:ueventd]is_charger_exist:0
> > [   42.664008] <6>.(6)[344:ueventd]psy_charger_get_property psp:3
> > [   42.664737] <6>.(6)[344:ueventd]psy_charger_get_property psp:8
> > [   42.665467] <6>.(6)[344:ueventd]psy_charger_get_property psp:12
> > [   42.666206] <6>.(6)[344:ueventd]get_pmic_vbus Couldn't get
> > chg_psy
> > [   42.666689] <2>-(2)[346:boringssl_self_][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=343
> > [   42.666986] <6>.(6)[344:ueventd]get_pmic_vbus vbus:419543560
> > [   42.667124] <6>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.667134] <2>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.667145] <6>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.667156]
> > <2>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.668744] <6>-(2)[346:boringssl_self_][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   42.669699] <6>.(6)[344:ueventd]get_vbus: get vbus failed: -1
> > [   42.670403] <6>-(2)[346:boringssl_self_][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   42.671535] <6>.(6)[344:ueventd]psy_charger_get_property psp:46
> > [   42.675965] <6>.(6)[344:ueventd]psy_charger_get_property psp:30
> > [   42.676702] <6>.(6)[344:ueventd]get_charger_charging_current:
> > get charging current failed: -524
> > [   42.677786] <6>.(6)[344:ueventd]get_charger_charging_current:-
> > 524
> > [   42.678548] <6>.(6)[344:ueventd]psy_charger_get_property psp:35
> > [   42.679341] <6>.(6)[344:ueventd]get_charger_input_current: get
> > input current failed: -524
> > [   42.680360] <6>.(6)[344:ueventd]get_charger_input_current:-524
> > [   42.681225] <6>.(6)[344:ueventd]psy_charger_get_property psp:4
> > [   42.681965] <6>.(6)[344:ueventd]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_charger_get_online: online = 0
> > [   42.683149] <6>.(6)[344:ueventd]is_charger_exist:0
> > [   42.683333] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=344
> > [   42.683753] <6>.(6)[344:ueventd]psy_charger_get_property psp:3
> > [   42.683807] <5>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.683812] <6>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.683817] <5>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.683822]
> > <6>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.684800] <6>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.685413] <6>.(6)[344:ueventd]psy_charger_get_property psp:8
> > [   42.686268] <6>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.687114] <6>.(6)[344:ueventd]psy_charger_get_property psp:12
> > [   42.692502] <6>.(6)[344:ueventd]get_pmic_vbus Couldn't get
> > chg_psy
> > [   42.693280] <6>.(6)[344:ueventd]get_pmic_vbus vbus:419543560
> > [   42.693985] <6>.(6)[344:ueventd]get_vbus: get vbus failed: -1
> > [   42.694707] <6>.(6)[344:ueventd]psy_charger_get_property psp:46
> > [   42.695457] <6>.(6)[344:ueventd]psy_charger_get_property psp:30
> > [   42.696193] <6>.(6)[344:ueventd]get_charger_charging_current:
> > get charging current failed: -524
> > [   42.697286] <6>.(6)[344:ueventd]get_charger_charging_current:-
> > 524
> > [   42.698044] <6>.(6)[344:ueventd]psy_charger_get_property psp:35
> > [   42.698784] <6>.(6)[344:ueventd]get_charger_input_current: get
> > input current failed: -524
> > [   42.699815] <6>.(6)[344:ueventd]get_charger_input_current:-524
> > [   42.699994] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=345
> > [   42.700620] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.701592] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.702352] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.703179] <1>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.704995] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.706145]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.707582] <6>.(6)[344:ueventd]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_charger_get_online: online = 0
> > [   42.709169] <4>.(4)[344:ueventd]mt6360_pmu_chg
> > mt6360_chg.2.auto: mt6360_charger_get_online: online = 0
> > [   42.716668] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=346
> > [   42.716802] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.717929] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.718504] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.719332] <1>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.721173] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.722330]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.733322] <4>-(4)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=347
> > [   42.733407] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.734385] <4>-(4)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.735172] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.735980] <4>-(4)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.736792] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.738897]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.749986] <4>-(4)[353:ueventd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=348
> > [   42.750082] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.751046] <4>-(4)[353:ueventd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.751818] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.752627] <4>-(4)[353:ueventd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.753433] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.753562]
> > <1>.(5)[342:init]BOOTPROF:     42753.559562:INIT:early-init
> > [   42.756412]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.765196] <2>.(2)[356:ueventd]ueventd: firmware: loading
> > 'regulatory.db' for
> > '/devices/platform/regulatory.0/firmware/regulatory.db'
> > [   42.766647] <6>-(6)[354:ueventd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=349
> > [   42.766729] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.767770] <6>-(6)[354:ueventd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.768533] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.769364] <6>-(6)[354:ueventd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.770170] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.772276]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.778340] <6>.(6)[58:kworker/6:1]hifi4dsp-8570:
> > fixup_hifi4dsp_early_setting enter
> > [   42.782473] <6>.(6)[58:kworker/6:1]hifi4dsp_scpsys_power_on:
> > Succeeded to power on mtcmos dsp1
> > [   42.783307] <7>-(7)[354:ueventd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=350
> > [   42.783311] <7>.(4)[56:kworker/4:1]rd 0-7: Disabling EAS,
> > schedutil is mandatory
> > [   42.783367] <7>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.783371] <7>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.783376] <7>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.783380]
> > <7>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.789335] <7>-(7)[354:ueventd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.790170] <7>-(7)[354:ueventd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.792803] <6>.(6)[58:kworker/6:1]hifi4dsp_scpsys_power_on:
> > Succeeded to power on mtcmos aud_afe
> > [   42.795498] <6>.(6)[58:kworker/6:1]hifi4dsp_scpsys_power_on:
> > Succeeded to power on mtcmos dsp_sram0
> > [   42.798193] <6>.(6)[58:kworker/6:1]hifi4dsp_scpsys_power_on:
> > Succeeded to power on mtcmos dsp_sram1
> > [   42.799968] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=351
> > [   42.800015] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.801022] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.801773] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.802605] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.803425] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.805513]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.805884] <6>.(6)[58:kworker/6:1]hifi4dsp_scpsys_power_on:
> > Succeeded to power on mtcmos dsp_sram2
> > [   42.809292] <6>.(6)[58:kworker/6:1]hifi4dsp_scpsys_power_on:
> > Succeeded to power on mtcmos dsp_sram3
> > [   42.812018] <6>.(6)[58:kworker/6:1]hifi4dsp_scpsys_power_on:
> > Succeeded to power on mtcmos dsp_sram4
> > [   42.814705] <6>.(6)[58:kworker/6:1]hifi4dsp_scpsys_power_on:
> > Succeeded to power on mtcmos dsp_sram5
> > [   42.816629] <6>-(6)[58:kworker/6:1][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=352
> > [   42.816680] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.817712] <6>-(6)[58:kworker/6:1][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.818463] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.819326] <1>-(6)[58:kworker/6:1][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   42.821160] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.822305]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.823972] <6>.(6)[58:kworker/6:1]hifi4dsp_scpsys_power_on:
> > Succeeded to power on mtcmos dsp_sram6
> > [   42.826823] <6>.(6)[58:kworker/6:1]hifi4dsp_scpsys_power_on:
> > Succeeded to power on mtcmos dsp_sram7
> > [   42.827966] <6>.(6)[58:kworker/6:1]hifi4dsp-8570:
> > fixup_hifi4dsp_early_setting exit
> > [   42.828919] <6>.(6)[58:kworker/6:1]hifi4dsp-8570: firmware
> > hifi4dsp_8570.bin load success, size = 257508
> > [   42.833291] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=353
> > [   42.833351] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.834346] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.835118] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.835929] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.836733] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.838833]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.849956] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=354
> > [   42.850010] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.850966] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   42.851730] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.852488] <5>-(5)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.853293] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.855351]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.863957] <5>.(5)[1:init]Registered swp emulation handler
> > [   42.866617] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=355
> > [   42.866674] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.867676] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.868444] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.869276] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.870082] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.872198]
> > <7>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.874522]
> > <4>.(4)[342:init]BOOTPROF:     42874.518639:INIT:init
> > [   42.876844] <7>.(7)[342:init]Trying to create more than 6
> > SchedTune boosting groups
> > console:/ $ [   42.883286] <2>-(2)[363:servicemanager][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=356
> > [   42.883293] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.884236]
> > <2>.(4)[342:init]BOOTPROF:     42884.233793:INIT:late-init
> > [   42.884590] <1>-(2)[363:servicemanager][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   42.885191] <2>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.886003] <1>-(2)[363:servicemanager][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   42.886915] <4>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.887747]
> > <1>.(4)[342:init]BOOTPROF:     42887.744024:INIT:early-fs
> > [   42.888769]
> > <4>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.890061] <1>.(4)[342:init]BOOTPROF:     42890.059639:INIT:fs
> > [   42.891020] <1>.(1)[361:logd]logd.auditd: start
> > [   42.899947] <0>-(0)[365:vndservicemanag][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=357
> > [   42.899996] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.901260] <0>-(0)[365:vndservicemanag][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   42.901871] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.902794] <0>-(0)[365:vndservicemanag][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   42.903618] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.905216]
> > <4>.(4)[342:init]BOOTPROF:     42905.213947:INIT:Mount_START
> > [   42.905784]
> > <4>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.916603] <5>-(5)[373:android.hardwar][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=358
> > [   42.916652] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.917748] <5>-(5)[373:android.hardwar][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   42.918520] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.919436] <2>-(5)[373:android.hardwar][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   42.921307] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.922447]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.924628] <6>.(6)[1:init]e2fsck: e2fsck 1.45.4 (23-Sep-2019)
> > [   42.930215] <6>.(6)[1:init]e2fsck: /dev/block/by-name/protect1:
> > recovering journal
> > [   42.933264] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=359
> > [   42.933311] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.934323] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.935113] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.935924] <2>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.937714] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.938854]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.939262] <6>.(6)[58:kworker/6:1]hifi4dsp-8570: DSP0 boot from
> > base addr : 0x1E030000
> > [   42.941284] <5>.(5)[1:init]e2fsck: Pass 1: Checking inodes,
> > blocks, and sizes
> > [   42.941967] <6>.(6)[58:kworker/6:1]hifi4dsp-8570: load bin done
> > and start to run now.
> > [   42.942183] <5>.(5)[1:init]e2fsck: Pass 2: Checking directory
> > structure
> > [   42.943985] <5>.(5)[1:init]e2fsck: Pass 3: Checking directory
> > connectivity
> > [   42.944841] <5>.(5)[1:init]e2fsck: Pass 4: Checking reference
> > counts
> > [   42.945632] <5>.(5)[1:init]e2fsck: Pass 5: Checking group
> > summary information
> > [   42.946522] <5>.(5)[1:init]e2fsck: /dev/block/by-name/protect1:
> > 11/2048 files (0.0% non-contiguous), 1097/2048 blocks
> > [   42.949927] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=360
> > [   42.949983] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.950985] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.951078] <2>.(4)[1:init]EXT4-fs (mmcblk0p14): mounted
> > filesystem with ordered data mode. Opts:
> > noauto_da_alloc,commit=1,nodelalloc
> > [   42.951760] <7>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.952566] <2>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.954060] <4>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.955750] <2>.(4)[1:init]e2fsck: e2fsck 1.45.4 (23-Sep-2019)
> > [   42.955834]
> > <4>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.957321] <4>.(4)[1:init]e2fsck: /dev/block/by-name/protect2:
> > recovering journal
> > [   42.966588] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=361
> > [   42.966644] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.967648] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.968414] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.969245] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.970049] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.972156]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.974556] <4>.(4)[1:init]EXT4-fs (mmcblk0p15): mounted
> > filesystem with ordered data mode. Opts:
> > noauto_da_alloc,commit=1,nodelalloc
> > [   42.983250] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=362
> > [   42.983328] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   42.984308] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   42.985056] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   42.985888] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   42.986692] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   42.988810]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   42.999911] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=363
> > [   42.999971] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.000965] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.001717] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.002549] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.003371] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.005460]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.009607] <5>.(5)[1:init]EXT4-fs (mmcblk0p5): mounted
> > filesystem with ordered data mode. Opts:
> > noauto_da_alloc,commit=1,nodelalloc
> > [   43.016575] <5>-(5)[387:e2fsck][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=364
> > [   43.016632] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.017625] <5>-(5)[387:e2fsck][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.018372] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.019191] <2>-(5)[387:e2fsck][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.020974] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.022115]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.023338] <1>.(1)[145:scp_recv_thread]mt8570-adsp-pcm
> > odm:audio_spi: dsp ready
> > [   43.033236] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=365
> > [   43.033288] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.034299] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.035044] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.035875] <5>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.035924] <2>.(5)[1:init]EXT4-fs (mmcblk0p4): mounted
> > filesystem with ordered data mode. Opts:
> > noauto_da_alloc,commit=1,nodelalloc
> > [   43.036701] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.040288]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.049898] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=366
> > [   43.049964] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.050956] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.051725] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.052537] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.053342] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.055463]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.063032]
> > <4>.(4)[342:init]BOOTPROF:     43063.029563:INIT:Mount_END
> > [   43.066565] <6>-(6)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=367
> > [   43.067575] <6>-(6)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   43.068355] <6>-(6)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.069382] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.070252] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.070837] <6>.(6)[1:init]zram0: detected capacity change from
> > 0 to 4174811136
> > [   43.071080] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.073120]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.080768] <6>.(6)[1:init]Adding 4076960k swap on
> > /dev/block/zram0.  Priority:-2 extents:1 across:4076960k SS
> > [   43.083222] <6>-(6)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=368
> > [   43.084226] <6>-(6)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   43.085006] <6>-(6)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.085974] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.086836] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.087659] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.088811]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.099019]
> > <4>.(4)[342:init]BOOTPROF:     43099.015717:INIT:post-fs
> > [   43.099889] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=369
> > [   43.099942] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.101112] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.101698] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.102532] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.103350] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.104159] <4>.(4)[342:init]gadgets_make name=g1
> > [   43.104578] <2>.(4)[342:init]os_desc_use_store Use OS DESC
> > [   43.105436]
> > <4>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.106446] <4>.(4)[342:init]function_make name=accessory.gs2
> > [   43.108625] <4>.(4)[342:init]function_make name=audio_source.gs3
> > [   43.109548] <4>.(4)[342:init]function_make name=ffs.adb
> > [   43.110204] <4>.(4)[342:init]file system registered
> > [   43.110958] <4>.(4)[342:init]function_make name=mtp.gs0
> > [   43.112022] <4>.(4)[342:init]interf_grp_compatible_id_store
> > ext_compat_id=MTP
> > [   43.113079] <4>.(4)[342:init]function_make name=ptp.gs1
> > [   43.113901] <4>.(4)[342:init]function_make name=rndis.gs4
> > [   43.114583] <4>.(4)[342:init]using random self ethernet address
> > [   43.115333] <4>.(4)[342:init]using random host ethernet address
> > [   43.116229] <4>.(4)[342:init]function_make name=midi.gs5
> > [   43.116912] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=370
> > [   43.116969] <4>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.116973] <4>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.116977] <4>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.116982]
> > <4>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.117031] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   43.117033] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.123697] <4>.(4)[342:init]function_make name=acm.gs0
> > [   43.124387] <4>.(4)[342:init]acm_alloc_instance opts->port_num=0
> > [   43.125360] <4>.(4)[342:init]function_make name=acm.gs1
> > [   43.126030] <4>.(4)[342:init]acm_alloc_instance opts->port_num=1
> > [   43.126928] <4>.(4)[342:init]function_make name=acm.gs2
> > [   43.127608] <4>.(4)[342:init]acm_alloc_instance opts->port_num=2
> > [   43.128527] <4>.(4)[342:init]function_make name=acm.gs3
> > [   43.129198] <4>.(4)[342:init]acm_alloc_instance opts->port_num=3
> > [   43.130100] <4>.(4)[342:init]function_make
> > name=mass_storage.usb0
> > [   43.130861] <4>.(4)[342:init]Mass Storage Function, version:
> > 2009/09/11
> > [   43.131734] <4>.(4)[342:init]LUN: removable file: (no medium)
> > [   43.132615] <4>.(4)[342:init]function_make name=hid.gs0
> > [   43.133282] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=371
> > [   43.133346] <4>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.133350] <4>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.133354] <4>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.133359]
> > <4>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.133399] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   43.133400] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.140076] <4>.(4)[342:init]function_make name=via_modem.gs0
> > [   43.141018] <4>.(4)[342:init]function_make name=via_ets.gs0
> > [   43.141870] <4>.(4)[342:init]function_make name=via_atc.gs0
> > [   43.142644] <4>.(4)[342:init]config_desc_make name=b.1
> > [   43.143688] <4>.(4)[342:init]os_desc_b_vendor_code_store Vendor
> > Code=1
> > [   43.149875] <1>-(1)[395:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=372
> > [   43.149932] <3>.(3)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.151072] <1>-(1)[395:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   43.151676] <3>.(3)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.152457] <1>-(1)[395:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.153261] <3>.(3)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.155335]
> > <3>.(3)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.157424]
> > <5>.(5)[342:init]BOOTPROF:     43157.419717:INIT:late-fs
> > [   43.166533] <6>-(6)[402:wait_for_keymas][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=373
> > [   43.166547] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.167676] <6>-(6)[402:wait_for_keymas][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   43.168475] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.169372] <6>-(6)[402:wait_for_keymas][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   43.170177] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.172119] <6>.(6)[402:wait_for_keymas]wait_for_keymaster:
> > Waiting for Keymaster device
> > [   43.172408]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.175708] <6>.(6)[402:wait_for_keymas]HidlServiceManagement:
> > getService: Trying again for android.hardware.keymaster@4.0::IKeyma
> > sterDevice/default...
> > [   43.183198] <2>-(2)[397:aee_aedv64][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=374
> > [   43.183206] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.184455] <2>-(2)[397:aee_aedv64][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.185076] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.185940] <2>-(2)[397:aee_aedv64][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   43.186744] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.188898]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.199016] <3>.(3)[375:logd.auditd]type=1400 audit(43.172:4):
> > avc: denied { read } for comm="aee_aedv" name="powerup_reason"
> > dev="sysfs" ino=26375 scontext=u:r:aee_aedv:s0
> > tcontext=u:object_r:sysfs:s0 tclass=file permissive=0
> > [   43.199856] <5>-(5)[401:android.hardwar][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=375
> > [   43.199904] <5>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.199908] <5>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.199913] <5>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.199917]
> > <5>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.206454] <5>-(5)[401:android.hardwar][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   43.207374] <5>-(5)[401:android.hardwar][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   43.212432] <4>.(4)[295:ree_service]MTEE_PTAKeymaster_Serivce
> > enter(0).
> > E/TA:  TA_InvokeCommandEntryPoint:45 OPTEE_Keymaster_Serivce
> > enter(19).
> > E/TA:  TA_log:19 Keymaster_TA:The version information from
> > bootloader, os_version: 1128474, os_patchlevel: 208000
> > [   43.216517] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=376
> > E/T[   43.216615] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > A:  T[   43.217596] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > A_log:1[   43.218395] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > 9 [   43.219289] <0>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > Keymas[   43.221149] <0>.(0)[256:pf_release_thre]cant get sync info
> > for session_id:0x00000000, timeline_id:-1
> > t[   43.222291]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > er_TA:The version information set by ap, os_version: 110000,
> > os_patchlevel: 202101
> > E/TA:  TA_InvokeCommandEntryPoint:45 OPTEE_Keymaster_Serivce
> > enter(20).
> > [   43.228880] <3>.(3)[402:wait_for_keymas]wait_for_keymaster: List
> > of Keymaster HALs found:
> > [   43.230153] <7>.(7)[402:wait_for_keymas]wait_for_keymaster:
> > Keymaster HAL #1: OPTEEKeymaster from MediaTek SecurityLevel:
> > TRUSTED_ENVIRONMENT HAL: android.hardware.keymaster@4.1::IKeymaster
> > Device/default
> > E/TA:  TA_InvokeCommandEntryPoint:45 OPTEE_Keymaster_Serivce
> > enter(18).
> > [   43.233525] <6>-(6)[401:keymaster@4.0-s][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=377
> > [   43.233557] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.234669] <6>-(6)[401:keymaster@4.0-s][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   43.235440] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.236334] <6>-(6)[401:keymaster@4.0-s][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   43.237138] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > E/TA[   43.239354]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > :  TA_InvokeCommandEntryPoint:45 OPTEE_Keymaster_Serivce enter(25).
> > E/TA:  TA_InvokeCommandEntryPoint:206 OPTEE_Keymaster_Dispatch
> > cmd=25,output=0x40192880, output_size=40.
> > E/TA:  TA_InvokeCommandEntryPoint:217 OPTEE_Keymaster_Serivce
> > cmd=25 excute success,copy output data.
> > E/TA:  TA_InvokeCommandEntryPoint:222 OPTEE_Keymaster_Serivce
> > out(25), ret:0
> > [   43.246598] <7>.(7)[402:wait_for_keymas]wait_for_keymaster:
> > Computing HMAC with params { (seed: , nonce:
> > 0ab2719e2cbce754b1caff5cb2d33544737b7f4723484cfa1ac9fff653ebf854) }
> > [   43.248561] <7>.(7)[402:wait_for_keymas]wait_for_keymaster:
> > Computing HMAC for OPTEEKeymaster from MediaTek SecurityLevel:
> > TRUSTED_ENVIRONMENT HAL: android.hardware.keymaster@4.1::IKeymaster
> > Device/default
> > [   43.250836] <7>-(7)[402:wait_for_keymas][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=378
> > [   43.250885] <7>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.250890] <7>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.250894] <7>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.250898]
> > <7>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.250959] <7>-(7)[402:wait_for_keymas][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   43.250960] <7>-(7)[402:wait_for_keymas][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > E/TA:  TA_InvokeCommandEntryPoint:45 OPTEE_Keymaster_Serivce
> > enter(18).
> > E/TA:  TA_InvokeCommandEntryPoint:45 OPTEE_Keymaster_Serivce
> > enter(26).
> > E/TA:  TA_InvokeCommandEntryPoint:206 OPTEE_Keymaster_Dispatch
> > cmd=26,output=0x40192790, output_size=40.
> > E/TA:  TA_InvokeCommandEntryPoint:217 OPTEE_Keymaster_Serivce
> > cmd=26 excute success,copy output data.
> > E/TA:  TA_InvokeCommandEntryPoint:222 OPTEE_Keymaster_Serivce
> > out(26), ret:0
> > [   43.265641] <7>.(7)[402:wait_for_keymas]wait_for_keymaster:
> > Using OPTEEKeymaster from MediaTek for encryption.  Security level:
> > TRUSTED_ENVIRONMENT, HAL: android.hardware.keymaster@4.1::IKeymaste
> > rDevice/default
> > [   43.266502] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=379
> > [   43.267984] <7>.(7)[402:wait_for_keymas]wait_for_keymaster:
> > Keymaster device ready
> > [   43.268015] <6>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.268019] <6>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.268023] <6>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.268027]
> > <6>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.269016] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.274475] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.276078]
> > <6>.(6)[342:init]BOOTPROF:     43276.074333:INIT:Mount_START --late
> > [   43.281090] <5>.(5)[1:init]EXT4-fs (mmcblk0p53): Ignoring
> > removed nomblk_io_submit option
> > [   43.283174] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=380
> > [   43.283230] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.284228] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.284978] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.285811] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.286615] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.288736]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.299826] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=381
> > [   43.300881] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.301714] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.302772] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.303652] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.304463] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.305609]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.316485] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=382
> > [   43.317535] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.318368] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.319429] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.320304] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.321113] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.322258]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.333149] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=383
> > [   43.334199] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.335033] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.336088] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.336960] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.337770] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.338916]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.349809] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=384
> > [   43.350858] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.351692] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.352726] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.353597] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.354408] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.355566]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.370735] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=385
> > [   43.371804] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.372639] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.373685] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.374558] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.375402] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.376547]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.383152] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=386
> > [   43.383223] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.384229] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.384975] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.385807] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.386612] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.388734]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.400032] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=387
> > [   43.401109] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.401944] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.402983] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.403878] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.404691] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.405837]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.424030] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=388
> > [   43.424115] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.425094] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.425840] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.426671] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.427503] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.429587]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.436006] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=389
> > [   43.437068] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.437903] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.438950] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.439851] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.440666] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.441810]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.449834] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=390
> > [   43.451084] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.451922] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.452953] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.453820] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.454631] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.455810]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.471956] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=391
> > [   43.473038] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.473642] <6>-(6)[0:swapper/6][thread:0] 1970-01-01
> > 00:00:43.450591 UTC;android time 1970-01-01 00:00:43.450591
> > [   43.473873] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.476207] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.477082] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.477893] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.479038]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.483199] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=392
> > [   43.483224] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.484257] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.485004] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.485836] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.486641] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.488759]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.499768] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=393
> > [   43.500823] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.501657] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.502695] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.503608] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.504419] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.505565]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.520009] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=394
> > [   43.521075] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.521910] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.522956] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.523852] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.524664] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.525809]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.533093] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=395
> > [   43.534152] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.534986] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.536001] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.536875] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.537685] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.538830]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.549755] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=396
> > [   43.550806] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.551640] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.552653] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.553525] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.554336] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.555507]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.566416] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=397
> > [   43.567466] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.568302] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.569373] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.570242] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.571066] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.572211]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.583158] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=398
> > [   43.584221] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.585056] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.586094] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.586965] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.587806] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.588952]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.599820] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=399
> > [   43.601045] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.601883] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.602882] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.603761] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.604573] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.605718]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.616402] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=400
> > [   43.617456] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.618290] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.619305] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.620178] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.620990] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.622135]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.633064] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=401
> > [   43.634116] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.634950] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.635982] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.636853] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.637664] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.638808]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.649726] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=402
> > [   43.650776] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.651610] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.652645] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.653516] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.654326] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.655498]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.666388] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=403
> > [   43.667441] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.668275] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.669291] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.670160] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.670971] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.672141]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.683057] <7>-(7)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=404
> > [   43.684053] <7>-(7)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   43.684833] <7>-(7)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.685820] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.686690] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.687513] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.688659]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.700005] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=405
> > [   43.701071] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.701905] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.702965] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.703869] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.704680] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.705824]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.716379] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=406
> > [   43.717447] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.718282] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.719304] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.720170] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.720981] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.722126]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.733035] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=407
> > [   43.734087] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.734921] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.735975] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.736848] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.737659] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.738804]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.749698] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=408
> > [   43.750752] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.751587] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.752631] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.753501] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.754312] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.755480]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.766365] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=409
> > [   43.767435] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.768269] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.769295] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.770173] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.770985] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.772153]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.783022] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=410
> > [   43.784078] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.784912] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.785948] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.786824] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.787674] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.788819]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.799685] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=411
> > [   43.800737] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.801572] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.802596] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.803476] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.804289] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.805434]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.820005] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=412
> > [   43.821072] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.821906] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.822953] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.823849] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.824661] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.825806]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.833007] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=413
> > [   43.834062] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.834896] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.835912] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.836785] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.837596] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.838741]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.849669] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=414
> > [   43.850720] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.851554] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.852575] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.853451] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.854265] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.855438]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.866332] <7>-(7)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=415
> > [   43.867326] <7>-(7)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   43.868106] <7>-(7)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.869124] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.869992] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.870804] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.871962]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.882995] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=416
> > [   43.884056] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.884891] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.885932] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.886806] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.887658] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.888804]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.899655] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=417
> > [   43.900707] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.901541] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.902557] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.903456] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.904268] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.905411]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.916317] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=418
> > [   43.917371] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.918205] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.919251] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.920124] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.920935] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.922080]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.932979] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=419
> > [   43.934033] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.934867] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.935887] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.936758] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.937570] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.938714]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.949641] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=420
> > [   43.950692] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.951526] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.952570] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.953442] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.954252] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.955423]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.966303] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=421
> > [   43.967359] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.968193] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.969219] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.970087] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.970899] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.972071]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.982965] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=422
> > [   43.984019] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   43.984854] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   43.985893] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   43.986761] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   43.987598] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   43.988743]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   43.999644] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=423
> > [   44.000694] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.001528] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.002566] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.003449] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.004255] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.005401]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.024011] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=424
> > [   44.025077] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.025912] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.027099] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.027972] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.028779] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.029923]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.031840] <4>.(4)[1:init]EXT4-fs (mmcblk0p53): 14 orphan
> > inodes deleted
> > [   44.032686] <4>.(4)[1:init]EXT4-fs (mmcblk0p53): recovery
> > complete
> > [   44.033467] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=425
> > [   44.033507] <4>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.033511] <4>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.033514] <4>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.033518]
> > <4>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.033583] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   44.033584] <4>-(4)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.045907] <4>.(4)[1:init]EXT4-fs (mmcblk0p53): mounted
> > filesystem with ordered data mode. Opts: errors=remount-
> > ro,nomblk_io_submit
> > [   44.049615] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=426
> > [   44.049672] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.050677] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.051444] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.052251] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.053055] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.055171]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.066278] <6>-(6)[327:kworker/6:1H][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=427
> > [   44.067389] <6>-(6)[327:kworker/6:1H][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   44.068277] <6>-(6)[327:kworker/6:1H][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   44.069377] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.070249] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.071075] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.072221]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.082939] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=428
> > [   44.083996] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.084829] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.085865] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.086734] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.087561] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.088705]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.099706] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=429
> > [   44.099753] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.100769] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.101516] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.102348] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.103176] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.105256]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.120018] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=430
> > [   44.121087] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.121921] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.122955] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.123858] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.124669] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.125812]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.144011] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=431
> > [   44.145080] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.145915] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.146954] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.147857] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.148681] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.149831] <0>-(0)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=432
> > [   44.150099] <0>-(0)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   44.150102] <0>-(0)[256:pf_release_thre][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   44.153143]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.154157] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.155020] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.155837] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.156981]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.166248] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=433
> > [   44.167301] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.168136] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.169170] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.170037] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.170847] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.172012]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.182908] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=434
> > [   44.183958] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.184792] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.185828] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.186698] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.187542] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.188686]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.199571] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=435
> > [   44.200623] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.201457] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.202491] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.203371] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.204182] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.205325]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.216236] <7>-(7)[417:e2fsck][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=436
> > [   44.217278] <7>-(7)[417:e2fsck][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.218102] <7>-(7)[417:e2fsck][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.219106] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.219976] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.220787] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.221930]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.232954] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=437
> > [   44.234167] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.235005] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.236033] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.236899] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.237710] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.238855]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.249556] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=438
> > [   44.250605] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.251438] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.252454] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.253325] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.254136] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.255309]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.274433] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=439
> > [   44.274495] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.275113] <4>.(6)[0:swapper/6][mtk_net][rtnl_lock]There is no
> > process hold rtnl lock
> > [   44.275494] <0>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.276275] <4>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.277258] <0>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.278095] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.281020]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.282927] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=440
> > [   44.284139] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.284977] <0>-(0)[0:swapper/0][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.285975] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.286840] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.287673] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.288817]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.304059] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=441
> > [   44.305140] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.305973] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.307014] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.307911] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.308721] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.309865]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.316207] <7>-(7)[417:e2fsck][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=442
> > [   44.317263] <7>-(7)[417:e2fsck][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.318087] <7>-(7)[417:e2fsck][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.319107] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.319969] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.320787] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.321932]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.332870] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=443
> > [   44.333932] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.334765] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.335804] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.336695] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.337507] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.338651]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.349529] <4>-(4)[417:e2fsck][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=444
> > [   44.350573] <4>-(4)[417:e2fsck][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.351397] <4>-(4)[417:e2fsck][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.352429] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.353299] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.354110] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.355263]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.366190] <4>-(4)[417:e2fsck][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=445
> > [   44.367233] <4>-(4)[417:e2fsck][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.368057] <4>-(4)[417:e2fsck][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.369088] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.369949] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.370756] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.371909]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.382851] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=446
> > [   44.383902] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.384736] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.385771] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.386639] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.387463] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.388607]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.394643] <7>.(7)[1:init]EXT4-fs (mmcblk0p53): mounted
> > filesystem with ordered data mode. Opts:
> > noauto_da_alloc,errors=panic
> > [   44.399516] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=447
> > [   44.400567] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.401401] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.402424] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.403307] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.404118] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.405258]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.412613]
> > <6>.(6)[342:init]BOOTPROF:     44412.609951:INIT:Mount_END --late
> > [   44.416179] <4>-(4)[420:vdc][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=448
> > [   44.417196] <4>-(4)[420:vdc][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   44.417987] <4>-(4)[420:vdc][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.418969] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.419852] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.420661] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.421800]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.431786] <4>.(4)[421:apexd]apexd: This device does not
> > support updatable APEX. Exiting
> > [   44.432834] <4>.(4)[421:apexd]apexd: Marking APEXd as activated
> > [   44.432840] <7>-(7)[1:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=449
> > [   44.433636] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.434573] <7>-(7)[1:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   44.435339] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.436099] <7>-(7)[1:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.436904] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.438957]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.449501] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=450
> > [   44.450561] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.451396] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.452424] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.453296] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.454108] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.455268]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.466162] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=451
> > [   44.467212] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.468046] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.469066] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.469938] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.470749] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.471910]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.482827] <4>-(4)[422:chattr][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=452
> > [   44.482884] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.483876] <4>-(4)[422:chattr][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.484649] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.485471] <4>-(4)[422:chattr][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.486276] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.488372]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.499489] <6>-(6)[424:vdc][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=453
> > [   44.499542] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.500502] <6>-(6)[424:vdc][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   44.501253] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.502042] <6>-(6)[424:vdc][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.502846] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.504916]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.506896] <2>.(2)[424:vdc]vdc: Waited 0ms for vold
> > [   44.516150] <6>-(6)[425:vold_prepare_su][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=454
> > [   44.517296] <6>-(6)[425:vold_prepare_su][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   44.518216] <6>-(6)[425:vold_prepare_su][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   44.519331] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.520197] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.521004] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.522143]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.532813] <6>-(6)[427:apexd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=455
> > [   44.533854] <6>-(6)[427:apexd][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   44.534666] <6>-(6)[427:apexd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.535699] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.536562] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.537370] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.537702] <6>.(6)[427:apexd]apexd: This device does not
> > support updatable APEX. Exiting
> > [   44.538509]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.539584] <6>.(6)[427:apexd]apexd: Marking APEXd as ready
> > [   44.549375]
> > <6>.(6)[342:init]BOOTPROF:     44549.371874:INIT:post-fs-data
> > [   44.549474] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=456
> > [   44.550296] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.551279] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.552048] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.552880] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.553684] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.555796]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.566174] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=457
> > [   44.566223] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.567400] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.568001] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.568836] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.569639] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.571758]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.582843] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=458
> > [   44.582899] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.583899] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.584668] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.585501] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.586304] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.588408]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.599461] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=459
> > [   44.599521] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.600517] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.601267] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.602100] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.602904] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.605017]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.611408] <1>.(1)[375:logd.auditd]type=1400 audit(44.584:5):
> > avc: denied { getattr } for comm="init" path="/data/misc/wifi"
> > dev="mmcblk0p53" ino=40985 scontext=u:r:vendor_init:s0
> > tcontext=u:object_r:wifi_data_file:s0 tclass=dir permissive=0
> > [   44.614244] <1>.(1)[375:logd.auditd]type=1400 audit(44.584:6):
> > avc: denied { search } for comm="init" name="wifi" dev="mmcblk0p53"
> > ino=40985 scontext=u:r:vendor_init:s0
> > tcontext=u:object_r:wifi_data_file:s0 tclass=dir permissive=0
> > [   44.614573] <6>.(6)[342:init]BOOTPROF:     44614.571644:post-fs-
> > data: on modem start
> > [   44.616121] <0>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=460
> > [   44.616242] <0>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.616243] <0>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.616864] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.616885] <0>.(1)[375:logd.auditd]type=1400 audit(44.588:7):
> > avc: denied { write } for comm="init" name="misc" dev="mmcblk0p53"
> > ino=40961 scontext=u:r:vendor_init:s0
> > tcontext=u:object_r:system_data_file:s0 tclass=dir permissive=0
> > [   44.616937] <0>.(1)[375:logd.auditd]type=1400 audit(44.588:8):
> > avc: denied { search } for comm="init" name="wifi" dev="mmcblk0p53"
> > ino=40985 scontext=u:r:vendor_init:s0
> > tcontext=u:object_r:wifi_data_file:s0 tclass=dir permissive=0
> > [   44.616987] <0>.(1)[375:logd.auditd]type=1400 audit(44.588:9):
> > avc: denied { getattr } for comm="init" path="/data/misc/dhcp"
> > dev="mmcblk0p53" ino=40989 scontext=u:r:vendor_init:s0
> > tcontext=u:object_r:dhcp_data_file:s0 tclass=dir permissive=0
> > [   44.617039] <0>.(1)[375:logd.auditd]type=1400 audit(44.588:10):
> > avc: denied { setattr } for comm="init" name="dhcp"
> > dev="mmcblk0p53" ino=40989 scontext=u:r:vendor_init:s0
> > tcontext=u:object_r:dhcp_data_file:s0 tclass=dir permissive=0
> > [   44.617089] <0>.(1)[375:logd.auditd]type=1400 audit(44.588:11):
> > avc: denied { write } for comm="init" name="misc" dev="mmcblk0p53"
> > ino=40961 scontext=u:r:vendor_init:s0
> > tcontext=u:object_r:system_data_file:s0 tclass=dir permissive=0
> > [   44.632784] <5>-(5)[430:getprop][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=461
> > [   44.634316] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.635350] <5>-(5)[430:getprop][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.636049] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.636880] <5>-(5)[430:getprop][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.638018]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.639993] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.640855] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.641666] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.642805]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.649446] <5>-(5)[432:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=462
> > [   44.649502] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.650473] <5>-(5)[432:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   44.651238] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.652022] <5>-(5)[432:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.652826] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.654893]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.666109] <4>-(4)[435:flags_health_ch][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=463
> > [   44.666175] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.667255] <4>-(4)[435:flags_health_ch][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   44.668016] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.668934] <4>-(4)[435:flags_health_ch][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   44.669738] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.670396] <1>.(2)[368:logd.daemon]logd.daemon: reinit
> > [   44.672601]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.682770] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=464
> > [   44.682827] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.683829] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.684601] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.685433] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.686237] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.688343]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.693740] <5>.(5)[437:update_verifier]update_verifier: Started
> > with arg 1: nonencrypted
> > [   44.697132] <0>.(0)[437:update_verifier]update_verifier: Booting
> > slot 0: isSlotMarkedSuccessful=1
> > [   44.698260] <0>.(0)[437:update_verifier]update_verifier: Leaving
> > update_verifier.
> > [   44.699432] <4>-(4)[436:bpfloader][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=465
> > [   44.699489] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.700508] <4>-(4)[436:bpfloader][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.701258] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.702112] <4>-(4)[436:bpfloader][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   44.702916] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.705056]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.706304]
> > <6>.(6)[342:init]BOOTPROF:     44706.300721:INIT:zygote-start
> > [   44.707351]
> > <6>.(6)[342:init]BOOTPROF:     44707.348413:INIT:early-boot
> > [   44.716097] <6>-(6)[341:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=466
> > [   44.716158] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.717123] <6>-(6)[341:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   44.717872] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.718672] <6>-(6)[341:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.719491] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.721543]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.732765] <2>-(2)[446:android.hardwar][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=467
> > [   44.732772] <4>.(4)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.734083] <2>-(2)[446:android.hardwar][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   44.734675] <4>.(4)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.735598] <4>-(2)[446:android.hardwar][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   44.737469] <4>.(4)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.738605]
> > <4>.(4)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.749424] <3>-(3)[464:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=468
> > [   44.749437] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.750621] <3>-(3)[464:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   44.751229] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.752007] <3>-(3)[464:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.752811] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.754903]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.758764] <6>.(6)[466:watchdogd]watchdogd: watchdogd started
> > (interval 20, margin 10)!
> > [   44.759832] <6>.(6)[466:watchdogd]watchdog0, mtk wdt ping, wdd-
> > >status=0
> > [   44.760910] <6>.(6)[466:watchdogd]watchdog0, mtk wdt start, wdd-
> > >status=8
> > [   44.761757] <6>.(6)[466:watchdogd]watchdog: watchdog0: userspace
> > call watchdog_start, wdd->status=9, wd_data->status=5, err=0.
> > [   44.763192] <6>.(6)[466:watchdogd]watchdog0, mtk wdt ping, wdd-
> > >status=9
> > [   44.764031] <6>.(6)[466:watchdogd]watchdog0, mtk wdt ping, wdd-
> > >status=9
> > [   44.766083] <5>-(5)[476:nvram_daemon][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=469
> > [   44.766101] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.766418] <5>.(7)[466:watchdogd]watchdog0, mtk wdt ping, wdd-
> > >status=9
> > [   44.767196] <2>-(5)[476:nvram_daemon][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   44.767991] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.768822] <2>-(5)[476:nvram_daemon][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   44.771558] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.772700]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.779857] <6>.(6)[164:kworker/6:2]cfg80211: failed to load
> > regulatory.db
> > [   44.782743] <7>-(7)[477:fsverity_init][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=470
> > [   44.782796] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.783865] <7>-(7)[477:fsverity_init][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   44.784630] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.785527] <7>-(7)[477:fsverity_init][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   44.786330] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.788512]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.799404] <5>-(5)[456:android.hardwar][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=471
> > [   44.799465] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.800546] <5>-(5)[456:android.hardwar][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   44.801298] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.802215] <2>-(5)[456:android.hardwar][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   44.804097] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.805239]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.816066] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=472
> > [   44.816112] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.817123] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.817872] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.818703] <2>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.820503] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.821647]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.832725] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=473
> > [   44.832773] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.833775] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.834532] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.835363] <2>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.837150] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.838289]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.849391] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=474
> > [   44.849444] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.850447] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.851214] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.852029] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.852833] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.854937]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.854942] <1>.(1)[451:android.hardwar]healthd: No battery
> > devices found
> > [   44.855208]
> > <1>.(6)[342:init]BOOTPROF:     44855.205952:INIT:boot
> > [   44.859518] <1>.(1)[451:health@2.1-serv]healthd: battery none
> > chg=
> > [   44.866061] <3>-(3)[329:kworker/3:1H][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=475
> > [   44.866110] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.867342] <3>-(3)[329:kworker/3:1H][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   44.867955] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.868844] <3>-(3)[329:kworker/3:1H][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   44.869647] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.871817]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.879255] <4>.(4)[342:init]fpsgo: loading out-of-tree module
> > taints kernel.
> > [   44.880181] <4>.(4)[342:init]fpsgo: Unknown symbol xgf_ko_init
> > (err -2)
> > [   44.881020] <4>.(4)[342:init]fpsgo: Unknown symbol
> > xgf_est_runtime (err -2)
> > [   44.881901] <4>.(4)[342:init]fpsgo: Unknown symbol xgf_stat_xchg
> > (err -2)
> > [   44.882749] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=476
> > [   44.882761] <4>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.882765] <4>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.882769] <4>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.882773]
> > <4>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.882870] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   44.882871] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.889376] <4>.(4)[342:init]fpsgo: Unknown symbol
> > xgf_est_runtime_fp (err -2)
> > [   44.890274] <4>.(4)[342:init]fpsgo: Unknown symbol
> > xgf_stat_xchg_fp (err -2)
> > [   44.891159] <4>.(4)[342:init]fpsgo: Unknown symbol
> > notify_xgf_ko_ready (err -2)
> > [   44.899376] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=477
> > [   44.899423] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.900431] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.901192] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.902015] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.902820] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.904946]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.908158] <7>.(7)[342:init]calling  init_module+0x0/0x18
> > [kdrv_xc] @ 342
> > [   44.909440] <7>.(7)[342:init]EDID block is all zeroes
> > [   44.910073] <7>.(7)[342:init][HDMI] mtk_hdmi_get_raw_edid,2342
> > EDID invalid
> > [   44.910948] <7>.(7)[342:init]initcall init_module+0x0/0x18
> > [kdrv_xc] returned 0 after 1878 usecs
> > [   44.916038] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=478
> > [   44.916087] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.916830] <5>.(7)[342:init]kdrv_alg: no symbol version for
> > KDrv_XC_RegisterALGInterface
> > [   44.917093] <1>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.917846] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.918862] <1>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.919712] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.922074] <7>.(7)[342:init]calling  init_module+0x0/0x5a4
> > [kdrv_alg] @ 342
> > [   44.922603]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.923655] <7>.(7)[342:init]initcall init_module+0x0/0x5a4
> > [kdrv_alg] returned 0 after 155 usecs
> > [   44.924255] <7>.(4)[454:android.hardwar][CEC]
> > mtk_cec_adap_enable,337,enable=1
> > [   44.924256] <7>.(4)[454:android.hardwar][CEC]
> > mtk_cec_power_enable,299,enable=1
> > [   44.924264] <7>.(4)[454:android.hardwar][CEC] mtk_cec_init
> > [   44.924269] <7>.(4)[454:android.hardwar][CEC]
> > mtk_cec_rx_timing_config
> > [   44.924274] <7>.(4)[454:android.hardwar][CEC] mtk_cec_rx_reset
> > [   44.924277] <7>.(4)[454:android.hardwar][CEC]
> > mtk_cec_tx_timing_config
> > [   44.924287] <7>.(4)[454:android.hardwar][CEC] mtk_cec_tx_reset
> > [   44.924293] <7>.(4)[454:android.hardwar][CEC]
> > mtk_cec_logic_addr_config
> > [   44.924294] <7>.(4)[454:android.hardwar][CEC]
> > mtk_cec_set_logic_addr
> > [   44.924295] <1>.(4)[454:android.hardwar][CEC]
> > mtk_cec_set_logic_addr
> > [   44.924296] <7>.(4)[454:android.hardwar][CEC]
> > mtk_cec_set_logic_addr
> > [   44.924325] <1>.(4)[454:android.hardwar][CEC]
> > mtk_cec_adap_log_addr,360,logical_address=255
> > [   44.932748] <7>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.932805] <1>-(7)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=479
> > [   44.932922] <1>-(7)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   44.933605] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.934393] <1>-(7)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.935455] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.940889]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.947514] <7>.(7)[342:init]calling  init_module+0x0/0xe4
> > [kdrv_dolby_vision] @ 342
> > [   44.948562] <5>.(5)[295:ree_service][dovi_tz]
> > tz_dovi_create_session
> > [   44.949367] <5>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=480
> > [   44.949412] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.949641] <5>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.949645] <1>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   44.950394] <1>.(5)[295:ree_service][dovi_tz]
> > tz_dovi_create_session
> > [   44.951200] <7>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.953162] <7>.(7)[295:ree_service][dovi_tz] share mem init:
> > buffer[0xa0e18000][0xa0e18000] size[68408] [68408] mem 0xa0e18000
> > [   44.953784] <7>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.953788]
> > <7>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.958738] <7>.(7)[295:ree_service][dovi_tz] md_parser_inited =
> > 1
> > [   44.959582] <7>.(7)[342:init]initcall init_module+0x0/0xe4
> > [kdrv_dolby_vision] returned 0 after 10833 usecs
> > [   44.961900] <4>.(4)[342:init]Store => 0xf0
> > [   44.962416] <4>.(4)[342:init]Set CPU[4] On
> > [   44.962927] <4>.(4)[342:init]Set CPU[5] On
> > [   44.963461] <4>.(4)[342:init]Set CPU[6] On
> > [   44.963994] <4>.(4)[342:init]Set CPU[7] On
> > [   44.966025] <7>-(7)[504:iptables][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=481
> > [   44.966101] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.967095] <7>-(7)[504:iptables][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.967859] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.968687] <7>-(7)[504:iptables][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   44.969491] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.971621]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.976280] <6>.(6)[342:init]calling  init_module+0x0/0xf20
> > [btmtk_usb_unify] @ 342
> > [   44.977238] <6>.(6)[342:init][btmtk_info] main_driver_init: MTK
> > BT Driver Version : 7.0.2021042301
> > [   44.978353] <6>.(6)[342:init][btmtk_info] main_init
> > [   44.978981] <6>.(6)[342:init][btmtk_info] main_init supported
> > intf count <4>
> > [   44.979882] <6>.(6)[342:init][btmtk_warn] main_init: No Exported
> > Func Found [RegisterPdwncCallback], just skip!
> > [   44.981136] <6>.(6)[342:init][btmtk_info] main_init: Register
> > reboot_notifier callback success.
> > [   44.982219] <6>.(6)[342:init][btmtk_info]
> > btmtk_allocate_dev_memory
> > [   44.982685] <7>-(7)[511:ip6tables][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=482
> > [   44.982737] <6>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   44.982741] <7>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   44.982746] <6>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   44.982750]
> > <7>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   44.983002] <6>.(6)[342:init][btmtk_info] btmtk_set_chip_state:
> > UNKNOWN(0) -> INIT(1)
> > [   44.984076] <6>-(7)[511:ip6tables][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   44.984827] <6>.(6)[342:init][btmtk_info] btmtk_fops_set_state:
> > FOPS_UNKNOWN(0) -> FOPS_INIT(1)
> > [   44.985628] <6>-(7)[511:ip6tables][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   44.986762] <6>.(6)[342:init][btmtk_info]
> > btmtk_allocate_dev_memory
> > [   44.992521] <6>.(6)[342:init][btmtk_info] btmtk_set_chip_state:
> > UNKNOWN(0) -> INIT(1)
> > [   44.993496] <6>.(6)[342:init][btmtk_info] btmtk_fops_set_state:
> > FOPS_UNKNOWN(0) -> FOPS_INIT(1)
> > [   44.994586] <6>.(6)[342:init][btmtk_info]
> > btmtk_allocate_dev_memory
> > [   44.995370] <6>.(6)[342:init][btmtk_info] btmtk_set_chip_state:
> > UNKNOWN(0) -> INIT(1)
> > [   44.996343] <6>.(6)[342:init][btmtk_info] btmtk_fops_set_state:
> > FOPS_UNKNOWN(0) -> FOPS_INIT(1)
> > [   44.997425] <6>.(6)[342:init][btmtk_info]
> > btmtk_allocate_dev_memory
> > [   44.998205] <6>.(6)[342:init][btmtk_info] btmtk_set_chip_state:
> > UNKNOWN(0) -> INIT(1)
> > [   44.999182] <6>.(6)[342:init][btmtk_info] btmtk_fops_set_state:
> > FOPS_UNKNOWN(0) -> FOPS_INIT(1)
> > [   44.999349] <5>-(5)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=483
> > [   45.000318] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.000414] <5>.(6)[342:init][btmtk_info] btmtk_set_chip_state:
> > INIT(1) -> DISCONNECT(2)
> > [   45.000416] <1>.(6)[342:init][btmtk_info] btmtk_set_chip_state:
> > INIT(1) -> DISCONNECT(2)
> > [   45.000418] <1>.(6)[342:init][btmtk_info] btmtk_set_chip_state:
> > INIT(1) -> DISCONNECT(2)
> > [   45.000420] <1>.(6)[342:init][btmtk_info] btmtk_set_chip_state:
> > INIT(1) -> DISCONNECT(2)
> > [   45.000422] <1>.(6)[342:init][btmtk_info] btmtk_cif_register
> > [   45.000468] <1>.(6)[342:init]usbcore: registered new interface
> > driver btusb
> > [   45.000470] <1>.(6)[342:init][btmtk_info] btmtk_cif_register,
> > usb registration success!
> > [   45.000472] <1>.(6)[342:init][btmtk_info] btmtk_fops_init: Start
> > [   45.000473] <1>.(6)[342:init][btmtk_info] btmtk_fops_init:
> > g_fwlog init
> > [   45.000543] <1>.(6)[342:init]Bluetooth: btmtk_fops_init:
> > BT_majorfwlog 503, devIDfwlog 527433728
> > [   45.000544] <1>.(6)[342:init][btmtk_info] main_driver_init: Done
> > [   45.000554]
> > <1>.(6)[342:init]BOOTPROF:     45000.552491:initcall: init_module
> > [btmtk_usb_unify]    23.308231ms
> > [   45.000560] <1>.(6)[342:init]initcall init_module+0x0/0xf20
> > [btmtk_usb_unify] returned 0 after 22771 usecs
> > [   45.001396] <1>-(5)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.002145] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.003148] <4>-(5)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.016010] <1>-(4)[470:gpuservice][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=484
> > [   45.016391] <4>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.017038] <1>.(5)[342:init]calling  init_module+0x0/0x1000
> > [dbmdx_core] @ 342
> > [   45.017538] <1>-(4)[470:gpuservice][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.017594] <5>.(5)[342:init]initcall init_module+0x0/0x1000
> > [dbmdx_core] returned 0 after 532 usecs
> > [   45.018403]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.019536] <5>-(4)[470:gpuservice][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   45.021111] <1>.(5)[342:init]calling  init_module+0x0/0x1000
> > [dbmdx_log] @ 342
> > [   45.021327] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.022702] <1>.(5)[342:init]initcall init_module+0x0/0x1000
> > [dbmdx_log] returned 0 after 232 usecs
> > [   45.023475] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.023480] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.029303]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.029388] <6>.(6)[342:init]calling  init_module+0x0/0x1000
> > [snd_soc_dbmdx_codec] @ 342
> > [   45.032154] <6>.(6)[342:init]initcall init_module+0x0/0x1000
> > [snd_soc_dbmdx_codec] returned 0 after 787 usecs
> > [   45.032672] <7>-(7)[503:oem-iptables-in][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=485
> > [   45.032750] <7>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.032754] <0>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.032759] <7>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.032763]
> > <7>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.034709] <7>.(0)[450:android.hardwar][HDMI]
> > hdmi_conn_detect,2189 hpd state = 0
> > [   45.035390] <7>-(7)[503:oem-iptables-in][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   45.040095] <7>-(7)[503:oem-iptables-in][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   45.041792] <6>.(6)[342:init]calling  init_module+0x0/0x1000
> > [tas58xx] @ 342
> > [   45.042866] <6>.(6)[342:init]tas58xx 3-002c: GPIO lookup for
> > consumer pdn
> > [   45.043763] <6>.(6)[342:init]tas58xx 3-002c: using device tree
> > for GPIO lookup
> > [   45.044669] <6>.(6)[342:init]of_get_named_gpiod_flags: can't
> > parse 'pdn-gpios' property of node '/i2c@11e03000/tas5805m_lr@2c[0]
> > '
> > [   45.046124] <6>.(6)[342:init]of_get_named_gpiod_flags: parsed
> > 'pdn-gpio' property of node '/i2c@11e03000/tas5805m_lr@2c[0]' -
> > status (0)
> > [   45.048827] <6>.(6)[342:init]tas58xx 3-002c: Linked as a
> > consumer to regulator.61
> > [   45.049333] <5>-(5)[533:ip6tables][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=486
> > [   45.049397] <6>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.049401] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.049405] <6>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.049409]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.049805] <5>.(6)[342:init]tas58xx 3-002c: 3-002c supply pvdd
> > not found, using dummy regulator
> > [   45.050834] <5>-(5)[533:ip6tables][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.051609] <5>.(6)[342:init]tas58xx 3-002c: Linked as a
> > consumer to regulator.0
> > [   45.052378] <5>-(5)[533:ip6tables][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   45.066003] <2>-(2)[364:hwservicemanage][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=487
> > [   45.066051] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.067081] <6>.(6)[342:init]tas58xx 3-002c: Request firmware:
> > tas5805m_tuning_lr_edb.bin
> > [   45.067322] <1>-(2)[364:hwservicemanage][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   45.067326] <6>-(2)[364:hwservicemanage][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   45.067926] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.069183] <6>.(6)[342:init]BOOTPROF:     45069.181260:probe:
> > probe=i2c_device_probe drv=tas58xx(tas58xx_regmap
> > [tas58xx])    26.461692ms
> > [   45.069846] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.071258] <6>.(6)[238:kworker/6:3]mt8195-sound sound: Linked
> > as a consumer to regulator.43
> > [   45.071716]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.073274] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   45.074485] <6>.(1)[342:init]probe of 3-002c returned 1 after
> > 31783 usecs
> > [   45.075541] <6>.(6)[164:kworker/6:2]tas58xx 3-002c: Firmware
> > release: tas5805m_tuning_lr_edb.bin
> > [   45.079382] <6>.(6)[164:kworker/6:2]tas58xx 3-002c: ASoC: dai
> > register 3-002c #1
> > [   45.080303] <6>.(6)[164:kworker/6:2]tas58xx 3-002c: ASoC:
> > dynamically register DAI 3-002c
> > [   45.081321] <6>.(6)[164:kworker/6:2]tas58xx 3-002c: ASoC:
> > Registered DAI 'tas58xx-i2s'
> > [   45.081780] <4>.(4)[342:init]tas58xx 3-004d: GPIO lookup for
> > consumer pdn
> > [   45.082315] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   45.082657] <4>-(5)[545:iptables][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=488
> > [   45.082720] <6>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.082724] <4>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.082729] <6>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.082733]
> > <6>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.082774] <4>-(5)[545:iptables][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.082776] <6>-(5)[545:iptables][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   45.083165] <4>.(4)[342:init]tas58xx 3-004d: using device tree
> > for GPIO lookup
> > [   45.083173] <6>.(4)[342:init]of_get_named_gpiod_flags: can't
> > parse 'pdn-gpios' property of node '/i2c@11e03000/tas5805m_w@4d[0]'
> > [   45.084044] <4>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   45.084047] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   45.084049] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   45.084051] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   45.084053] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   45.084055] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   45.084058] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   45.084060] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   45.084062] <7>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   45.084064] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   45.084066] <7>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   45.084067] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   45.084069] <7>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   45.084071] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   45.084073] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   45.084075] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   45.085035] <5>.(4)[342:init]of_get_named_gpiod_flags: parsed
> > 'pdn-gpio' property of node '/i2c@11e03000/tas5805m_w@4d[0]' -
> > status (0)
> > [   45.085882] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   45.087873] <5>.(4)[342:init]tas58xx 3-004d: Linked as a
> > consumer to regulator.61
> > [   45.088831] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   45.089726] <5>.(4)[342:init]tas58xx 3-004d: 3-004d supply pvdd
> > not found, using dummy regulator
> > [   45.090675] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   45.091602] <5>.(4)[342:init]tas58xx 3-004d: Linked as a
> > consumer to regulator.0
> > [   45.092994] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   45.099320] <5>-(7)[550:iptables][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=489
> > [   45.099372] <6>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.099376] <5>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.099381] <6>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.099385]
> > <5>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.100063] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   45.101028] <6>-(7)[550:iptables][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.101796] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   45.102671] <6>-(7)[550:iptables][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   45.103569] <5>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   45.107141] <6>.(5)[342:init]tas58xx 3-004d: Request firmware:
> > tas5825_tuning_w_edb.bin
> > [   45.107457] <6>.(6)[238:kworker/6:3]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   45.108832] <6>.(5)[342:init]BOOTPROF:     45108.830722:probe:
> > probe=i2c_device_probe drv=tas58xx(tas58xx_regmap
> > [tas58xx])    32.301616ms
> > [   45.109710]
> > <6>.(6)[238:kworker/6:3]BOOTPROF:     45109.709799:probe:
> > probe=platform_drv_probe drv=mt8195-
> > sound(0xffffff800966ce50)    38.540154ms
> > [   45.110758] <6>.(5)[342:init]probe of 3-004d returned 1 after
> > 34250 usecs
> > [   45.111575] <6>.(6)[238:kworker/6:3]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   45.112727]
> > <6>.(5)[342:init]BOOTPROF:     45112.725337:initcall: init_module
> > [tas58xx]    70.048077ms
> > [   45.113741] <4>.(6)[238:kworker/6:3]probe of sound returned 0
> > after 42712 usecs
> > [   45.115042] <6>.(5)[53:kworker/5:1]tas58xx 3-004d: Firmware
> > release: tas5825_tuning_w_edb.bin
> > [   45.115578] <4>.(7)[342:init]initcall init_module+0x0/0x1000
> > [tas58xx] returned 0 after 71189 usecs
> > [   45.115829] <6>.(6)[238:kworker/6:3]mt8195-sound sound: Linked
> > as a consumer to regulator.43
> > [   45.115982] <4>-(7)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=490
> > [   45.116040] <6>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.116044] <6>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.116049] <6>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.116053]
> > <6>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.116104] <6>-(7)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   45.116106] <6>-(7)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.116543] <6>.(5)[53:kworker/5:1]tas58xx 3-004d: ASoC: dai
> > register 3-004d #1
> > [   45.117418] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   45.118192] <6>.(5)[53:kworker/5:1]tas58xx 3-004d: ASoC:
> > dynamically register DAI 3-004d
> > [   45.119340] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   45.123047] <6>.(5)[53:kworker/5:1]tas58xx 3-004d: ASoC:
> > Registered DAI 'tas58xx-i2s'
> > [   45.123975] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   45.132643] <7>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=491
> > [   45.132710] <6>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.132714] <7>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.132719] <6>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.132723]
> > <7>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.133553] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   45.134571] <6>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.135526] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   45.136643] <6>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.137692] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   45.149305] <6>-(7)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=492
> > [   45.149383] <6>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.149387] <6>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.149392] <6>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.149396]
> > <6>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.149649] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   45.150699] <6>-(7)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.151447] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   45.152245] <7>-(7)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.153380] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   45.165967] <7>-(7)[467:audioserver][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=493
> > [   45.166046] <6>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.166050] <7>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.166055] <6>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.166059]
> > <6>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.166309] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   45.167460] <6>-(7)[467:audioserver][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.168227] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   45.169210] <6>-(7)[467:audioserver][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   45.170066] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   45.177521] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   45.178400] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   45.179279] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   45.180157] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   45.181046] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   45.182032] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   45.182629] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=494
> > [   45.182714] <6>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.182718] <4>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.182723] <6>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.182727]
> > <4>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.182953] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   45.183979] <6>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   45.184721] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   45.185521] <6>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.186660] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   45.192310] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   45.193200] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   45.194088] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   45.195020] <6>.(6)[238:kworker/6:3]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   45.196141] <6>.(6)[238:kworker/6:3]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   45.197394]
> > <6>.(6)[238:kworker/6:3]BOOTPROF:     45197.393260:probe:
> > probe=platform_drv_probe drv=mt8195-
> > sound(0xffffff800966ce50)    81.653462ms
> > [   45.199066] <6>.(6)[238:kworker/6:3]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   45.199291] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=495
> > [   45.199305] <6>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.199309] <4>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.199313] <4>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.199317]
> > <4>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.200115] <4>.(6)[238:kworker/6:3]probe of sound returned 0
> > after 84488 usecs
> > [   45.201105] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   45.206498] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.215952] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=496
> > [   45.215965] <1>.(1)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.216976] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   45.217725] <1>.(1)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.218523] <1>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.220301] <1>.(1)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.221442]
> > <1>.(1)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.232613] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=497
> > [   45.232663] <0>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.233638] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   45.234394] <0>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.235184] <0>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.236942] <0>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.238082]
> > <0>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.244638] <4>.(4)[342:init]calling  init_module+0x0/0x39c
> > [wlan_drv_gen4_mt7921] @ 342
> > [   45.245649] <4>.(4)[342:init][wlan]Set ALL DBG module log level
> > to [0x2f]
> > [   45.246494] <4>.(4)[342:init][wlan]Reset ALL DBG module log
> > level to DEFAULT!
> > [   45.246570]
> > <4>.(4)[342:init][wlan][342]rlmDomainCountryCodeUpdateSanity:(RLM
> > ERROR) prGlueInfo is NULL!
> > [   45.248654] <4>.(4)[342:init][wlan][342]mtk_reg_notify:(RLM
> > ERROR) sanity check failed, skip!
> > [   45.249277] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=498
> > [   45.249330] <4>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.249334] <7>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.249339] <4>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.249343]
> > <7>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.249753]
> > <4>.(4)[342:init][wlan][342]wlanCreateWirelessDevice:(INIT INFO)
> > Create wireless device success
> > [   45.250770] <4>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.251519]
> > <4>.(4)[342:init][wlan][342]glP2pCreateWirelessDevice:(INIT INFO)
> > glP2pCreateWirelessDevice (00000000b381dc5d)
> > [   45.252313] <4>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.253554] <4>.(4)[342:init]iommu: Adding device 0000:01:00.0
> > to group 8
> > [   45.259789] <4>.(4)[342:init]pci 0000:00:00.0: enabling device
> > (0000 -> 0002)
> > [   45.260685] <4>.(4)[342:init]wlan 0000:01:00.0: enabling device
> > (0000 -> 0002)
> > [   45.261588] <4>.(4)[342:init][wlan][342]mtk_pci_probe:(INIT
> > INFO) pci_enable_device done!
> > [   45.262609] <4>.(4)[342:init][wlan][342]wlanProbe:(INIT INFO)
> > enter wlanProbe
> > [   45.263542] <4>.(4)[342:init][wlan][342]glBusInit:(INIT INFO)
> > ioremap for device 0000:01:00.0, region 0x100000 @ 0x20000000
> > [   45.265114] <4>.(4)[342:init][wlan][342]wlanNetCreate:(INIT
> > INFO) net_device prDev(0x00000000d3113224) allocated
> > [   45.265945] <1>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=499
> > [   45.266411] <4>.(4)[342:init][wlan][342]wlanCfgInit:(INIT INFO)
> > Init wifi config len 0 max entry 256
> > [   45.266465] <1>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.266469] <4>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.266474] <1>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.266478]
> > <1>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.267686] <1>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.268786]
> > <1>.(4)[342:init][wlan][342]wlanInitFeatureOption:(INIT ERROR) get
> > MacAddr fail, use defaul
> > [   45.269427] <1>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.275581] <4>.(4)[342:init][wlan][342]kalRequestFirmware:(INIT
> > INFO) kalRequestFirmware(): wifi.cfg OK
> > [   45.276789] <4>.(4)[342:init][wlan][342]wlanCfgInit:(INIT INFO)
> > Init wifi config len 1001 max entry 256
> > [   45.278131]
> > <4>.(4)[342:init][wlan][342]wlanInitFeatureOption:(INIT ERROR) get
> > MacAddr fail, use defaul
> > [   45.279492] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > wlanCfgParse()
> > [   45.280409] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = DisRoaming, SIZE = 10
> > [   45.281640] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 1, SIZE = 1
> > [   45.282604] <1>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=500
> > [   45.282655] <4>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.282660] <1>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.282664] <4>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.282668]
> > <1>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.282777] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.284059] <4>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.284649] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [1]
> > [   45.285453] <4>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.286587] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = LdpcTx, SIZE = 6
> > [   45.292737] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 1, SIZE = 1
> > [   45.293860] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.294758] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [1]
> > [   45.295881] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = LdpcRx, SIZE = 6
> > [   45.297058] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 1, SIZE = 1
> > [   45.298183] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.299083] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [1]
> > [   45.299262] <5>-(5)[440:app_process64][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=501
> > [   45.300206] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = StaHT, SIZE = 5
> > [   45.300261] <5>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.300265] <4>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.300269] <4>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.300273]
> > <4>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.301312] <4>-(5)[440:app_process64][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.302389] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 1, SIZE = 1
> > [   45.302391] <4>.(4)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.303246] <4>-(5)[440:app_process64][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.310222] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [1]
> > [   45.311360] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = StaVHT, SIZE = 6
> > [   45.312538] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 1, SIZE = 1
> > [   45.313662] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.314561] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [1]
> > [   45.315680] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = MacOverride, SIZE = 11
> > [   45.315923] <5>-(5)[440:app_process64][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=502
> > [   45.316933] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 0, SIZE = 1
> > [   45.316985] <5>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.316989] <6>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.316994] <5>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.316998]
> > <6>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.318041] <6>-(5)[440:app_process64][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.319075] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.319928] <6>-(5)[440:app_process64][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.320728] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [0]
> > [   45.320730] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = MacAddr, SIZE = 7
> > [   45.327996] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 00:0c:e7:66:32:dd, SIZE = 17
> > [   45.329303] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.330200] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [00:0c:e7:66:32:dd]
> > [   45.331490] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = Nss, SIZE = 3
> > [   45.332587] <5>-(5)[440:app_process64][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=503
> > [   45.332645] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 2, SIZE = 1
> > [   45.332701] <5>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.332705] <6>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.332709] <6>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.332713]
> > <6>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.333750] <6>-(5)[440:app_process64][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.334768] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.334770] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [2]
> > [   45.335624] <6>-(5)[440:app_process64][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.342519] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = Sta5gBw, SIZE = 7
> > [   45.343727] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 2, SIZE = 1
> > [   45.344850] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.345749] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [2]
> > [   45.346864] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = TxMaxAmsduInAmpduLen, SIZE = 20
> > [   45.348210] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 8192, SIZE = 4
> > [   45.349248] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=504
> > [   45.349374] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.349442] <5>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.349447] <6>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.349452] <5>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.349457]
> > <6>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.350425] <6>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.351212] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [8192]
> > [   45.352066] <6>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.352867] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = RxMaxMpduLen, SIZE = 12
> > [   45.359237] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 2, SIZE = 1
> > [   45.360361] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.361262] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [2]
> > [   45.362378] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = CtiaMode, SIZE = 8
> > [   45.363581] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 0, SIZE = 1
> > [   45.364719] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.365647] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [0]
> > [   45.365918] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=505
> > [   45.365974] <6>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.365979] <7>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.365984] <6>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.365989]
> > <7>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.366765] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = TpTestMode, SIZE = 10
> > [   45.367811] <6>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.368565] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 0, SIZE = 1
> > [   45.369365] <6>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.370498] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.370500] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [0]
> > [   45.377693] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = EfuseBufferModeCal, SIZE = 18
> > [   45.379013] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 0, SIZE = 1
> > [   45.380141] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.381051] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [0]
> > [   45.382168] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = RegP2pIfAtProbe, SIZE = 15
> > [   45.383118] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=506
> > [   45.383483] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 1, SIZE = 1
> > [   45.383552] <3>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.383556] <6>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.383560] <3>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.383564]
> > <6>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.384671] <6>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.385524] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.385527] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [1]
> > [   45.386385] <6>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.387187] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = Wow, SIZE = 3
> > [   45.394315] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 1, SIZE = 1
> > [   45.395442] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.396340] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [1]
> > [   45.397457] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = WowOnMdtim, SIZE = 10
> > [   45.398699] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 1, SIZE = 1
> > [   45.399236] <1>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=507
> > [   45.399830] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.399883] <1>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.399886] <6>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.399890] <1>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.399894]
> > <6>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.401113] <6>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.401740] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [1]
> > [   45.401743] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = ScreenoffDTIMPeriod, SIZE = 19
> > [   45.402600] <6>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.403401] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 1, SIZE = 1
> > [   45.411070] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.411967] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [1]
> > [   45.413082] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = KeepFullPwr, SIZE = 11
> > [   45.414324] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 0, SIZE = 1
> > [   45.415456] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.416360] <6>-(6)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=508
> > [   45.416406] <6>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.416410] <6>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.416414] <6>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.416417]
> > <6>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.416476] <6>-(6)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   45.416477] <6>-(6)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.422945] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [0]
> > [   45.424064] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = Probe256QAM, SIZE = 11
> > [   45.425310] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 0, SIZE = 1
> > [   45.426437] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.427340] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [0]
> > [   45.428455] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = VhtIeIn2G, SIZE = 9
> > [   45.429665] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 0, SIZE = 1
> > [   45.430803] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.431709] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [0]
> > [   45.432561] <1>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=509
> > [   45.432828] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = TdlsBufferSTASleep, SIZE = 18
> > [   45.432897] <1>.(0)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.432901] <6>.(0)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.432905] <1>.(0)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.432909]
> > <6>.(0)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.434104] <6>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.435177] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 0, SIZE = 1
> > [   45.436017] <6>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.436815] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.436818] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [0]
> > [   45.444044] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = ChipResetRecover, SIZE = 16
> > [   45.445340] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 0, SIZE = 1
> > [   45.446465] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.447366] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [0]
> > [   45.448494] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = StaHTBfee, SIZE = 9
> > [   45.449219] <4>-(4)[440:zygote64][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=510
> > [   45.449708] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 1, SIZE = 1
> > [   45.449772] <4>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.449776] <6>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.449780] <4>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.449784]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.450767] <6>-(4)[440:zygote64][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.451786] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.452637] <6>-(4)[440:zygote64][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   45.453438] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [1]
> > [   45.459411] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = EnableSerL0p5, SIZE = 13
> > [   45.460674] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 0, SIZE = 1
> > [   45.461798] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.462696] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [0]
> > [   45.463813] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 0 STATE_TEXT = EnableSerL1, SIZE = 11
> > [   45.465056] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT
> > INFO)  nargs= 1 STATE_TEXT = 0, SIZE = 1
> > [   45.465885] <1>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=511
> > [   45.465954] <6>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.465958] <1>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.465963] <6>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.465967]
> > <1>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.466183] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT INFO)
> > STATE_NEWLINE
> > [   45.467472] <6>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.468057] <6>.(6)[342:init][wlan][342]wlanCfgParse:(INIT WARN)
> > Save to driver temp buffer as [0]
> > [   45.468068] <6>.(6)[342:init][wlan][342]glLoadNvram:(INIT INFO)
> > g_NvramFsm = 0
> > [   45.468863] <6>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.469995] <6>.(6)[342:init][wlan][342]glLoadNvram:(INIT WARN)
> > Nvram not available
> > [   45.470045] <6>.(6)[342:init][wlan][342]wlanAdapterStart:(INIT
> > INFO) wlanAdapterStart(): Acquiring LP-OWN
> > [   45.479041] <6>.(6)[342:init][wlan][342]glBusConfigASPM:(INIT
> > INFO) ASPM STATUS 0
> > [   45.479975] <6>.(6)[342:init][wlan][342]halSetDriverOwn:(INIT
> > INFO) DRIVER OWN Done[1972 us]
> > [   45.481024] <6>.(6)[342:init][wlan][342]wlanAdapterStart:(INIT
> > INFO) wlanAdapterStart(): Acquiring LP-OWN-end
> > [   45.482549] <1>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=512
> > [   45.482615] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.483850] <1>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.484473] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.485047]
> > <1>.(6)[342:init][wlan][342]halInitMsduTokenInfo:(HAL INFO) Msdu
> > Token Init: Tot[1536] Used[0]
> > [   45.485054]
> > <2>.(6)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x03] SEQ[1] LEN[76]
> > [   45.485134]
> > <2>.(6)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x03] SEQ[2] LEN[76]
> > [   45.485211] <2>.(6)[342:init][wlan][342]wlanSetChipEcoInfo:(INIT
> > INFO) Chip ID[7961] Version[E2] HW[0x00008a10] SW[0x00008a01]
> > [   45.485218] <2>.(6)[342:init][wlan][342]wlanDownloadFW:(INIT
> > INFO) wlanDownloadFW:: Check ready_bits(=0x3)
> > [   45.485221] <2>.(6)[342:init][wlan][342]wlanDownloadPatch:(INIT
> > INFO) Patch download start
> > [   45.485223]
> > <2>.(6)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x03] SEQ[3] LEN[76]
> > [   45.485382] <2>-(1)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.486185] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.497096]
> > <2>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.499206] <5>-(5)[441:app_process32][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=513
> > [   45.499285] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.500328] <5>-(5)[441:app_process32][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.501089] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.501985] <5>-(5)[441:app_process32][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.502789] <2>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.503943]
> > <6>.(6)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x10] SEQ[4] LEN[68]
> > [   45.504978]
> > <6>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.507403]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionGetPatchInfoV2:(INIT
> > INFO) PATCH INFO: platform[ALPS] HW/SW ver[0x108A108A]
> > ver[0xFFFFFFFF]
> > [   45.509049]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionGetPatchInfoV2:(INIT
> > INFO) date[20210706001824a
> > [   45.509049] <4>]
> > [   45.510444]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionGetPatchInfoV2:(INIT
> > INFO)   Patch ver: 0x11223344, Section num: 0x1, subsys: 0x4
> > [   45.511987]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionGetPatchInfoV2:(INIT
> > INFO)   Section 0: type = 0x40002, offset = 0xa0, size = 0x16780
> > [   45.513553]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionGetPatchInfoV2:(INIT
> > INFO)   Target address: 0x900000, length: 0x16780
> > [   45.514958]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionDownloadStage:(INIT
> > INFO) FormatV2 num_of_regoin[1] datamode[0x80000000]
> > [   45.515868] <5>-(5)[441:app_process32][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=514
> > [   45.515930] <4>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.515934] <5>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.515939] <5>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.515943]
> > <4>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.516410]
> > <5>.(4)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x05] SEQ[5] LEN[76]
> > [   45.517517] <4>-(5)[441:app_process32][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.519609]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x07] SEQ[6] LEN[68]
> > [   45.520194] <4>-(5)[441:app_process32][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.521204]
> > <4>.(4)[342:init][wlan][342]wlanPatchSendComplete:(INIT INFO) PATCH
> > FINISH CMD send, waiting for RSP
> > [   45.528207]
> > <4>.(4)[342:init][wlan][342]wlanPatchSendComplete:(INIT INFO) PATCH
> > FINISH EVT success!!
> > [   45.529361] <4>.(4)[342:init][wlan][342]wlanDownloadPatch:(INIT
> > INFO) Patch download end[0].
> > [   45.530410]
> > <4>.(4)[342:init][wlan][342]mt7961DownloadBtPatch:(INIT INFO) BT
> > Patch download start
> > [   45.532530] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=515
> > [   45.532586] <2>.(2)[256:pf_release_thre]session id is wrong,
> > session=0x0!!
> > [   45.533585] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.534334] <2>.(2)[256:pf_release_thre]invalid session
> > id:0x00000000
> > [   45.534494] <2>.(3)[450:composer@2.2-se][HDMI]
> > mtk_drm_ioctl_enable_hdmi
> > [   45.534497] <2>.(3)[450:composer@2.2-se][HDMI]
> > mtk_hdmi_enable_disable,3308 enable = 1
> > [   45.534502] <2>.(3)[450:composer@2.2-se][HDMI]
> > mtk_hdmi_enable_disable,3314 [pm]Power Domain On 1
> > [   45.534504] <2>.(3)[450:composer@2.2-se][HDMI]
> > mtk_hdmi_clk_enable
> > [   45.534676] <2>.(3)[450:composer@2.2-se][HDMI]
> > mtk_hdmi_enable_disable,3331 request hdmi interrupt success
> > [   45.534682] <2>-(3)[450:composer@2.2-se][HDMI] mtk_hdmi_isr,1976
> > INT MASK0=0x0000000f, INT MASK1=0x00000000
> > [   45.534686] <2>-(3)[450:composer@2.2-se][HDMI] mtk_hdmi_isr,1979
> > INT STATUS0=0x2000001a, INT STATUS1=0x00050001
> > [   45.534688] <2>-(3)[450:composer@2.2-se][HDMI] mtk_hdmi_isr,2005
> > HPD/PORD IRQ
> > [   45.534690] <2>-(3)[450:composer@2.2-se][HDMI] mtk_hdmi_isr,2006
> > wait 40ms for HPD/PORD stable
> > [   45.535044] <2>-(3)[450:composer@2.2-se]lcm_fps_ctx_get CRTC:0
> > max=17659000, min=15664923, sum=499856847, num=32, fps=6001
> > [   45.535164] <2>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.547027]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionGetBtPatchInfo:(INIT
> > INFO) PATCH INFO: platform[ALPS] HW/SW ver[0x8A008A]
> > ver[0xFFFFFFFF]
> > [   45.547674] <0>.(2)[256:pf_release_thre]cant get sync info for
> > session_id:0x00000000, timeline_id:-1
> > [   45.547679]
> > <4>.(2)[256:pf_release_thre]mtk_release_present_fence:532
> > layer_info is null
> > [   45.549197] <0>-(0)[613:composer@2.2-se][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=516
> > [   45.549243] <4>.(2)[256:pf_release_thre]not found session info
> > for session_id:0x00010000,insert 000000000ef5589a to array index:0
> > [   45.549320]
> > <0>.(4)[342:init][wlan][342]wlanImageSectionGetBtPatchInfo:(INIT
> > INFO) date[20210706002049]
> > [   45.550714] <4>-(0)[613:composer@2.2-se][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   45.551469]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionGetBtPatchInfo:(INIT
> > INFO)   Patch ver: 0x0, Section num: 0x4, subsys: 0x0
> > [   45.552495] <4>-(0)[613:composer@2.2-se][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   45.553941]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionGetBtPatchInfo:(INIT
> > WARN) BT Patch is not 16-byte aligned
> > [   45.559843]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionGetBtPatchInfo:(INIT
> > INFO) BT Patch addr=0x900000: size=100992, ptr=0x000000002ce30c41
> > [   45.561436]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x11] SEQ[7] LEN[76]
> > [   45.562771]
> > <4>.(4)[342:init][wlan][342]wlanBtPatchSendSemaControl:(INIT INFO)
> > send Get BT Patch Sema success
> > [   45.564035]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x05] SEQ[8] LEN[76]
> > [   45.565863] <3>-(3)[371:logd.writer][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=517
> > [   45.566698]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x07] SEQ[9] LEN[68]
> > [   45.567134] <3>-(3)[371:logd.writer][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.568162]
> > <4>.(4)[342:init][wlan][342]wlanPatchSendComplete:(INIT INFO) PATCH
> > FINISH CMD send, waiting for RSP
> > [   45.569030] <3>-(3)[371:logd.writer][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   45.572360]
> > <4>.(4)[342:init][wlan][342]wlanPatchSendComplete:(INIT INFO) PATCH
> > FINISH EVT success!!
> > [   45.573498]
> > <4>.(4)[342:init][wlan][342]mt7961DownloadBtPatch:(INIT INFO) BT
> > Patch download success
> > [   45.574657] <4>.(4)[342:init][wlan][342]wlanDownloadFW:(INIT
> > INFO) FW download Start
> > [   45.579120] <3>.(3)[313:kworker/u16:3][HDMI]
> > mtk_hdmi_hpd_work_handle,2072 Hot Plug State NOT Change! hpd=0
> > [   45.582531] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=518
> > [   45.583748] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.584586] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.591631]
> > <4>.(4)[342:init][wlan][342]wlanGetConnacTailerInfo:(INIT INFO) N9
> > INFO: chip_info[13:E2] region_num[4]
> > [   45.592936]
> > <4>.(4)[342:init][wlan][342]wlanGetConnacTailerInfo:(INIT INFO)
> > date[20210706001904] version[____00000020210706001904]
> > [   45.594430]
> > <4>.(4)[342:init][wlan][342]fwDlGetReleaseInfoSection:(INIT INFO)
> > Release info tag[0] len[68]
> > [   45.595640]
> > <4>.(4)[342:init][wlan][342]fwDlGetReleaseInfoSection:(INIT INFO)
> > Release info tag[1] len[64] padding[0]
> > [   45.596978]
> > <4>.(4)[342:init][wlan][342]fwDlGetReleaseManifest:(INIT INFO)
> > Release manifest: t-neptune-main-sta-2017-
> > MT7961_SDK1_2_L_x86_Gen4m-20210706001601
> > [   45.598730]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionDownloadStage:(INIT
> > INFO) DL Offset[0] addr[0x00911000] len[365456]
> > datamode[0x8000004f]
> > [   45.599178] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=519
> > [   45.600357]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x01] SEQ[10] LEN[76]
> > [   45.601392] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.603410] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.615847] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=520
> > [   45.617146] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.618059] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.632502] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=521
> > [   45.633523] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   45.634325] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.649169] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=522
> > [   45.650461] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.651374] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.665825] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=523
> > [   45.666843] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   45.667645] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.682496] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=524
> > [   45.683789] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.684703] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.699159] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=525
> > [   45.700468] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.701381] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.715819] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=526
> > [   45.717117] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.718031] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.732482] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=527
> > [   45.733783] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.734696] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.749143] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=528
> > [   45.750444] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.751358] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.765798] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=529
> > [   45.766823] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   45.767625] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.782467] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=530
> > [   45.783770] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.784685] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.799123] <6>-(6)[441:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=531
> > [   45.800152] <6>-(6)[441:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   45.800955] <6>-(6)[441:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.815791] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=532
> > [   45.815882]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionDownloadStage:(INIT
> > INFO) DL Offset[365456] addr[0x02015c00] len[271312]
> > datamode[0x8000004f]
> > [   45.817089] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.818498]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x01] SEQ[11] LEN[76]
> > [   45.819409] <4>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.823492]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionDownloadStage:(INIT
> > INFO) DL Offset[636768] addr[0x00404400] len[15312]
> > datamode[0x8000004f]
> > [   45.825147]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x01] SEQ[12] LEN[76]
> > [   45.827612]
> > <4>.(4)[342:init][wlan][342]wlanImageSectionDownloadStage:(INIT
> > INFO) DL Offset[652080] addr[0xe0260000] len[131024]
> > datamode[0x8000004f]
> > [   45.829280]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x01] SEQ[13] LEN[76]
> > [   45.832003]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillInitCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x02] SEQ[14] LEN[72]
> > [   45.832451] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=533
> > [   45.833321] <4>.(4)[342:init][wlan][342]wlanConfigWifiFunc:(INIT
> > INFO) FW_START CMD send, waiting for RSP
> > [   45.834592] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.836422] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.849107] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=534
> > [   45.850128] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   45.850929] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.865773] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=535
> > [   45.867066] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.867980] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.882439] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=536
> > [   45.883735] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.884648] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.899093] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=537
> > [   45.900116] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   45.900918] <4>-(4)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.915755] <5>-(5)[624:Jit thread pool][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=538
> > [   45.916898] <5>-(5)[624:Jit thread pool][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   45.917818] <5>-(5)[624:Jit thread pool][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   45.932423] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=539
> > [   45.933715] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.934629] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.938562] <4>.(4)[342:init][wlan][342]wlanConfigWifiFunc:(INIT
> > INFO) FW_START EVT success!!
> > [   45.939671] <4>.(4)[342:init][wlan][342]wlanDownloadFW:(INIT
> > INFO) FW download End
> > [   45.940614] <4>.(4)[342:init][wlan][342]wlanAdapterStart:(INIT
> > INFO) Waiting for Ready bit..
> > [   45.941663] <4>.(4)[342:init][wlan][342]wlanCheckWifiFunc:(INIT
> > INFO) Check ready_bits(=0x3)
> > [   45.942713] <4>.(4)[342:init][wlan][342]wlanCheckWifiFunc:(INIT
> > INFO) Ready bit asserted
> > [   45.943726]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x00] SEQ[15] SET[1] LEN[64]
> > [   45.945067]
> > <4>.(4)[342:init][wlan][342]wlanQueryNicCapabilityV2:(INIT INFO)
> > Support NIC_CAPABILITY_V2 feature
> > [   45.946310]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x8A] SEQ[16] SET[0] LEN[64]
> > [   45.949087] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=540
> > [   45.950372]
> > <4>.(4)[342:init][wlan][342]nicCmdEventQueryNicCsumOffload:(INIT
> > INFO) nicCmdEventQueryNicCsumOffload: ucIsSupportCsumOffload = 1
> > [   45.950388] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   45.951981]
> > <4>.(4)[342:init][wlan][342]nicCfgChipCapMacCap:(INIT INFO)
> > ucHwBssIdNum: 4.
> > [   45.952863] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   45.953866]
> > <4>.(4)[342:init][wlan][342]nicCfgChipCapMacCap:(INIT INFO)
> > ucWtblEntryNum: 20.
> > [   45.953869]
> > <4>.(4)[342:init][wlan][342]nicCfgChipCapMacCap:(INIT INFO)
> > ucWmmSetNum: 4.
> > [   45.956944]
> > <4>.(4)[342:init][wlan][342]nicCfgChipAdieHwVersion:(INIT INFO) A
> > DieID = 0x0
> > [   45.957960]
> > <4>.(4)[342:init][wlan][342]nicCmdEventQueryNicWfdmaRealloc:(INIT
> > INFO) version=0 IsSupport=1 ReallocCmdRsc=15
> > [   45.959346] <4>.(4)[342:init][wlan][342]wlanPrintVersion:(SW4
> > INFO)
> > [   45.959346] <4>N9 FW version -0.0.0[DEC] ()
> > [   45.959346] <4>Tailer Ver[2:1] ____000000 (20210706001904) info
> > 13:E2
> > [   45.959346] <4>Release manifest: t-neptune-main-sta-2017-
> > MT7961_SDK1_2_L_x86_Gen4m-20210706001601
> > [   45.959346] <4>Patch platform ALPS version 0xFFFFFFFF
> > 20210706001824a
> > [   45.959346] <4>
> > [   45.959346] <4>Drv version 0.0[DEC]
> > [   45.964001]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x02] SEQ[17] SET[1] LEN[76]
> > [   45.965339]
> > <4>.(4)[342:init][wlan][342]kalRetrieveNetworkAddress:(INIT INFO)
> > glLoadNvram fail
> > [   45.965742] <7>-(7)[623:Jit thread pool][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=541
> > [   45.966410]
> > <4>.(4)[342:init][wlan][342]wlanUpdateNetworkAddress:(INIT INFO)
> > Using dynamically generated MAC address
> > [   45.966414]
> > <7>.(4)[342:init][wlan][342]kalUpdateMACAddress:(INIT INFO)
> > 00:00:00:00:00:00, 00:08:22:98:1f:fc.
> > [   45.967550] <4>-(7)[623:Jit thread pool][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   45.968774]
> > <7>.(4)[342:init][wlan][342]kalIndicateStatusAndComplete:(INIT
> > INFO) [wifi] wlan%d netif_carrier_off
> > [   45.969982] <4>-(7)[623:Jit thread pool][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   45.970901]
> > <4>.(4)[342:init][wlan][342]kalIndicateStatusAndComplete:(INIT
> > INFO) Skip report DISCONNECTED when using supplicant SME
> > [   45.974695]
> > <4>.(4)[342:init][wlan][342]p2pFuncSwitchSapChannel:(P2P WARN) Not
> > support concurrent STA + SAP
> > [   45.975969] <4>.(4)[342:init][wlan][342]aisFsmInit:(SW1 INFO)
> > ->aisFsmInit(0)
> > [   45.976864] <4>.(4)[342:init][wlan][342]nicFreq2ChannelNum:(BSS
> > INFO) Return Invalid Channelnum = 0.
> > [   45.978002]
> > <4>.(4)[342:init][wlan][342]wlanOnPostFirmwareReady:(INIT WARN)
> > wlanOnPostFirmwareReady: load manufacture data fail
> > [   45.979646] <4>.(4)[342:init]wlan 0000:01:00.0: Direct firmware
> > load for txpowerctrl.cfg failed with error -2
> > [   45.980883] <4>.(4)[342:init]wlan 0000:01:00.0: Falling back to
> > syfs fallback for: txpowerctrl.cfg
> > [   45.982405] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=542
> > [   45.983462] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   45.984296] <7>-(7)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   45.986640] <7>.(7)[342:init][wlan][342]kalRequestFirmware:(INIT
> > INFO) kalRequestFirmware txpowerctrl.cfg Fail, errno[-11]!!
> > [   45.988057] <7>.(7)[342:init][wlan][342]kalReadToFile:(INIT
> > INFO) kalReadToFile() path /data/misc/wifi/txpowerctrl.cfg
> > [   45.989456] <7>.(7)[342:init][wlan][342]kalReadToFile:(INIT
> > INFO) kalReadToFile() path /storage/sdcard0/txpowerctrl.cfg
> > [   45.990811]
> > <7>.(7)[342:init][wlan][342]txPwrCtrlCfgFileToList:(RLM INFO) no
> > txpowerctrl.cfg or file is empty
> > [   45.992059]
> > <7>.(7)[342:init][wlan][342]rlmDomainSendPwrLimitCmd_V2:(RLM INFO)
> > rlmDomainSendPwrLimitCmd()
> > [   45.998885] <7>.(7)[342:init][wlan][342]kalRequestFirmware:(INIT
> > INFO) kalRequestFirmware(): TxPwrLimit_MT79x1.dat OK
> > [   45.999066] <5>-(5)[624:Jit thread pool][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=543
> > [   46.000255]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitGetCountryRange:(RLM
> > INFO) Found TxPwrLimit table for CountryCode "00"
> > [   46.001349] <5>-(5)[624:Jit thread pool][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   46.002698]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section cck in TxPwrLimit_MT79x1.dat
> > [   46.003604] <7>-(5)[624:Jit thread pool][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   46.006119]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ofdm in TxPwrLimit_MT79x1.dat
> > [   46.007564]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ht20 in TxPwrLimit_MT79x1.dat
> > [   46.008998]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ht40 in TxPwrLimit_MT79x1.dat
> > [   46.010427]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section vht20 in TxPwrLimit_MT79x1.dat
> > [   46.011878]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section vht40 in TxPwrLimit_MT79x1.dat
> > [   46.013318]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section vht80 in TxPwrLimit_MT79x1.dat
> > [   46.014762]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section vht160 in TxPwrLimit_MT79x1.dat
> > [   46.015728] <5>-(5)[624:Jit thread pool][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=544
> > [   46.016217]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru26 in TxPwrLimit_MT79x1.dat
> > [   46.017348] <5>-(5)[624:Jit thread pool][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   46.018675]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru52 in TxPwrLimit_MT79x1.dat
> > [   46.019583] <7>-(5)[624:Jit thread pool][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   46.022070]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru106 in TxPwrLimit_MT79x1.dat
> > [   46.023523]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru242 in TxPwrLimit_MT79x1.dat
> > [   46.024972]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru484 in TxPwrLimit_MT79x1.dat
> > [   46.026413]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru996 in TxPwrLimit_MT79x1.dat
> > [   46.027854]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru996x2 in TxPwrLimit_MT79x1.dat
> > [   46.029314]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Load
> > TxPwrLimit_MT79x1.dat finished
> > [   46.030729]
> > <7>.(7)[342:init][wlan][342]rlmDomainInitTxPwrLimitPerRateCmd:(RLM
> > INFO) rlmDomainInitTxPwrLimitPerRateCmd, active n_channels=14,
> > band=1
> > [   46.032397] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=545
> > [   46.032402]
> > <7>.(7)[342:init][wlan][342]rlmDomainInitTxPwrLimitPerRateCmd:(RLM
> > INFO) rlmDomainInitTxPwrLimitPerRateCmd, active n_channels=45,
> > band=2
> > [   46.033695] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   46.035103]
> > <7>.(7)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[18] SET[1] LEN[1404]
> > [   46.035985] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   46.037334] <7>.(7)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[18] to CMD Q
> > [   46.039642]
> > <7>.(7)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[19] SET[1] LEN[1080]
> > [   46.040993] <7>.(7)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[19] to CMD Q
> > [   46.042259]
> > <7>.(7)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[20] SET[1] LEN[1404]
> > [   46.043612] <7>.(7)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[20] to CMD Q
> > [   46.044877]
> > <7>.(7)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[21] SET[1] LEN[1404]
> > [   46.046228] <7>.(7)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[21] to CMD Q
> > [   46.047496]
> > <7>.(7)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[22] SET[1] LEN[1404]
> > [   46.048846] <7>.(7)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[22] to CMD Q
> > [   46.049057] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=546
> > [   46.050113]
> > <7>.(7)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[23] SET[1] LEN[1404]
> > [   46.051409] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   46.052483] <7>.(7)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[23] to CMD Q
> > [   46.052488]
> > <3>.(7)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[24] SET[1] LEN[1404]
> > [   46.053399] <7>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   46.054664] <7>.(7)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[24] to CMD Q
> > [   46.058320]
> > <7>.(7)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[25] SET[1] LEN[918]
> > [   46.059662] <7>.(7)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[25] to CMD Q
> > [   46.060999] <7>.(7)[342:init]wlan 0000:01:00.0: Direct firmware
> > load for TxPwrLimit6G_MT79x1.dat failed with error -2
> > [   46.062323] <7>.(7)[342:init]wlan 0000:01:00.0: Falling back to
> > syfs fallback for: TxPwrLimit6G_MT79x1.dat
> > [   46.065032] <7>.(7)[342:init][wlan][342]kalRequestFirmware:(INIT
> > INFO) kalRequestFirmware TxPwrLimit6G_MT79x1.dat Fail, errno[-11]!!
> > [   46.065718] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=547
> > [   46.066521] <7>.(7)[342:init][wlan][342]kalReadToFile:(INIT
> > INFO) kalReadToFile() path /data/misc/TxPwrLimit6G_MT79x1.dat
> > [   46.067811] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   46.068927] <7>.(7)[342:init][wlan][342]kalReadToFile:(INIT
> > INFO) kalReadToFile() path /data/misc/wifi/TxPwrLimit6G_MT79x1.dat
> > [   46.069822] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   46.071260] <7>.(7)[342:init][wlan][342]kalReadToFile:(INIT
> > INFO) kalReadToFile() path /storage/sdcard0/TxPwrLimit6G_MT79x1.dat
> > [   46.073707]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM ERROR)
> > Can't find specified table in TxPwrLimit6G_MT79x1.dat
> > [   46.075159]
> > <7>.(7)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM ERROR)
> > Can't find default table (WW) in TxPwrLimit6G_MT79x1.dat
> > [   46.076651]
> > <7>.(7)[342:init][wlan][342]rlmDomainSendPwrLimitCmd_V2:(RLM ERROR)
> > Load TxPwrLimitData failed
> > [   46.077868]
> > <7>.(7)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0xED] SEQ[26] SET[1] LEN[68]
> > [   46.079201] <7>.(7)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0xED] SEQ[26] to CMD Q
> > [   46.080467]
> > <7>.(7)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0xED] SEQ[27] SET[1] LEN[68]
> > [   46.081796] <7>.(7)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0xED] SEQ[27] to CMD Q
> > [   46.082380] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=548
> > [   46.083355] <5>.(5)[635:main_thread][wlan][635]main_thread:(INIT
> > INFO) main_thread:635 starts running...
> > [   46.083494] <1>.(2)[636:hif_thread][wlan][636]hif_thread:(INIT
> > INFO) hif_thread:636 starts running...
> > [   46.083640] <5>.(7)[342:init][wlan][342]wlanWfdmaRealloc:(INIT
> > INFO) wfdma realloc begin
> > [   46.083688] <1>.(6)[637:rx_thread][wlan][637]rx_thread:(INIT
> > INFO) rx_thread:637 starts running...
> > [   46.084361] <5>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   46.085266]
> > <5>.(5)[635:main_thread][wlan][635]asicConnac2xFillCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0xED] SEQ[28] SET[1] LEN[68]
> > [   46.086412] <5>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   46.087426]
> > <5>.(5)[635:main_thread][wlan][635]kalEnqueueCommand:(INIT INFO)
> > EN-Q CMD TYPE[1] ID[0xED] SEQ[28] to CMD Q
> > [   46.099045] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=549
> > [   46.100098]
> > <2>.(2)[636:hif_thread][wlan][636]mt7961DumpSerDummyCR:(HAL INFO)
> > mt7961DumpSerDummyCR
> > [   46.100347] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   46.101219]
> > <2>.(2)[636:hif_thread][wlan][636]mt7961DumpSerDummyCR:(HAL INFO)
> > =====Dump Start====
> > [   46.102129] <1>-(1)[622:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   46.103260]
> > <2>.(2)[636:hif_thread][wlan][636]mt7961DumpSerDummyCR:(HAL INFO)
> > SER STATUS[0x00401a00]: 0xdf27505a
> > [   46.105539]
> > <2>.(2)[636:hif_thread][wlan][636]mt7961DumpSerDummyCR:(HAL INFO)
> > PLE STATUS[0x00401a04]: 0x1cc77c87
> > [   46.106810]
> > <2>.(2)[636:hif_thread][wlan][636]mt7961DumpSerDummyCR:(HAL INFO)
> > PLE1 STATUS[0x00401a08]: 0x7d40735e
> > [   46.108113]
> > <2>.(2)[636:hif_thread][wlan][636]mt7961DumpSerDummyCR:(HAL INFO)
> > PLE AMSDU STATUS[0x00401a0c]: 0xbea05f83
> > [   46.109449]
> > <2>.(2)[636:hif_thread][wlan][636]mt7961DumpSerDummyCR:(HAL INFO)
> > PSE STATUS[0x00401a10]: 0x3c463cc1
> > [   46.110719]
> > <2>.(2)[636:hif_thread][wlan][636]mt7961DumpSerDummyCR:(HAL INFO)
> > PSE1 STATUS[0x00401a14]: 0xffa6101c
> > [   46.112008]
> > <2>.(2)[636:hif_thread][wlan][636]mt7961DumpSerDummyCR:(HAL INFO)
> > LMAC WISR6 BN0 STATUS[0x00401a18]: 0x463954f1
> > [   46.113397]
> > <2>.(2)[636:hif_thread][wlan][636]mt7961DumpSerDummyCR:(HAL INFO)
> > LMAC WISR6 BN1 STATUS[0x00401a1c]: 0x85d9782c
> > [   46.114787]
> > <2>.(2)[636:hif_thread][wlan][636]mt7961DumpSerDummyCR:(HAL INFO)
> > LMAC WISR7 BN0 STATUS[0x00401a20]: 0x3c513ba6
> > [   46.115704] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=550
> > [   46.116182]
> > <2>.(2)[636:hif_thread][wlan][636]mt7961DumpSerDummyCR:(HAL INFO)
> > LMAC WISR7 BN1 STATUS[0x00401a24]: 0xffb1177b
> > [   46.117468] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   46.118583]
> > <2>.(2)[636:hif_thread][wlan][636]mt7961DumpSerDummyCR:(HAL INFO)
> > =====Dump End====
> > [   46.119488] <2>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   46.121616]
> > <2>.(2)[636:hif_thread][wlan][636]halStartSerTimer:(HAL INFO) Start
> > SER timer
> > [   46.122636]
> > <2>.(2)[636:hif_thread][wlan][636]halHwRecoveryFromError:(HAL INFO)
> > SER(E) Host stop PDMA tx/rx ring operation
> > [   46.124019]
> > <2>.(2)[636:hif_thread][wlan][636]nicSerStopTxRx:(NIC WARN) [SER]
> > host set STOP_TRX
> > [   46.125103]
> > <2>.(2)[636:hif_thread][wlan][636]halHwRecoveryFromError:(HAL INFO)
> > SER(F) Host ACK PDMA tx/rx ring stop operation
> > [   46.126568]
> > <2>.(2)[636:hif_thread][wlan][636]glBusConfigASPML1SS:(INIT INFO)
> > Config ASPM-L1SS
> > [   46.127657]
> > <2>.(2)[636:hif_thread][wlan][636]glBusConfigASPM:(INIT INFO) ASPM
> > STATUS 2
> > [   46.128798] <2>.(2)[636:hif_thread][wlan][636]halSetFWOwn:(INIT
> > INFO) FW OWN:1
> > [   46.132375] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=551
> > [   46.133681] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   46.134595] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   46.136836]
> > <6>.(6)[636:hif_thread][wlan][636]glBusConfigASPM:(INIT INFO) ASPM
> > STATUS 0
> > [   46.137859]
> > <6>.(6)[636:hif_thread][wlan][636]asicConnac2xWfdmaReInit:(INIT
> > INFO) WFDMA reinit due to deep sleep
> > [   46.139195]
> > <6>.(6)[636:hif_thread][wlan][636]halSetDriverOwn:(INIT INFO)
> > DRIVER OWN Done[4953 us]
> > [   46.140320]
> > <6>.(6)[636:hif_thread][wlan][636]halHwRecoveryFromError:(HAL INFO)
> > SER(L) Host re-initialize PDMA
> > [   46.141691]
> > <6>.(6)[636:hif_thread][wlan][636]halHwRecoveryFromError:(HAL INFO)
> > SER(M) Host enable PDMA
> > [   46.142907]
> > <6>.(6)[636:hif_thread][wlan][636]halHwRecoveryFromError:(HAL INFO)
> > SER(N) Host interrupt MCU PDMA ring init done
> > [   46.147635]
> > <6>.(6)[636:hif_thread][wlan][636]halHwRecoveryFromError:(HAL INFO)
> > SER(Q) Host interrupt MCU SER handle done
> > [   46.149028] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=552
> > [   46.150327] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   46.151241] <3>-(3)[472:surfaceflinger][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   46.152150]
> > <6>.(6)[636:hif_thread][wlan][636]halHwRecoveryFromError:(HAL INFO)
> > SER(T) Host re-initialize BCN
> > [   46.153527]
> > <6>.(6)[636:hif_thread][wlan][636]nicSerStartTxRx:(NIC WARN) [SER]
> > Start HIF T/R!
> > [   46.154658] <7>.(7)[342:init][wlan][342]wlanWfdmaRealloc:(INIT
> > INFO) wfdma realloc done
> > [   46.155670]
> > <7>.(7)[342:init][wlan][342]wlanConnac2XDownloadBufferBin:(INIT
> > INFO) Start Efuse Buffer Mode ..
> > [   46.156892]
> > <7>.(7)[342:init][wlan][342]wlanConnac2XDownloadBufferBin:(INIT
> > INFO) ucEfuseBUfferModeCal is 0
> > [   46.158257]
> > <7>.(7)[342:init][wlan][342]wlanConnac2XDownloadBufferBin:(INIT
> > INFO) [0/0] load buffer size: 0x0
> > [   46.159570]
> > <5>.(5)[635:main_thread][wlan][635]wlanoidConnacSetEfusBufferMode:(
> > OID INFO) u4SetBufferLen = 4
> > [   46.160794]
> > <5>.(5)[635:main_thread][wlan][635]asicConnac2xFillCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0xED] SEQ[29] SET[0] LEN[68]
> > [   46.162199]
> > <5>.(5)[635:main_thread][wlan][635]kalEnqueueCommand:(INIT INFO)
> > EN-Q CMD TYPE[1] ID[0xED] SEQ[29] to CMD Q
> > [   46.165686] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=553
> > [   46.166745] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.167579] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.182348] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=554
> > [   46.183409] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.184243] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.194424] <0>.(0)[450:composer@2.2-se]#@#
> > cm_mgr_fb_notifier_callback(131) SCREEN ON
> > [   46.199010] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=555
> > [   46.200041] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.200844] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.215672] <4>-(4)[167:kworker/4:1H][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=556
> > [   46.216790] <4>-(4)[167:kworker/4:1H][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   46.217678] <4>-(4)[167:kworker/4:1H][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   46.232338] <3>-(3)[614:VSyncThread_0][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=557
> > [   46.233632] <3>-(3)[614:VSyncThread_0][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   46.234534] <3>-(3)[614:VSyncThread_0][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   46.248996] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=558
> > [   46.250025] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.250827] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.265656] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=559
> > [   46.266683] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.267485] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.282324] <2>-(2)[614:VSyncThread_0][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=560
> > [   46.283603] <2>-(2)[614:VSyncThread_0][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   46.284505] <2>-(2)[614:VSyncThread_0][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   46.298989] <2>-(2)[614:VSyncThread_0][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=561
> > [   46.300276] <2>-(2)[614:VSyncThread_0][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   46.301179] <2>-(2)[614:VSyncThread_0][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   46.315675] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=562
> > [   46.316735] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.317570] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.332306] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=563
> > [   46.333331] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.334133] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.348988] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=564
> > [   46.350064] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.350898] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.365630] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=565
> > [   46.366662] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.367464] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.382292] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=566
> > [   46.383318] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.384120] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.398952] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=567
> > [   46.400010] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.400844] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.407064] <6>.(6)[625:HeapTaskDaemon][name:spm&][SPM]
> > MCUSYSOFF Didn't enter low power scenario
> > [   46.415617] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=568
> > [   46.416646] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.417448] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.432277] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=569
> > [   46.433300] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.434102] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.448940] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=570
> > [   46.449969] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.450772] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.465603] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=571
> > [   46.466630] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.467431] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.482263] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=572
> > [   46.483288] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.484089] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.498925] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=573
> > [   46.499953] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.500755] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.515585] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=574
> > [   46.516645] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.517479] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.532246] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=575
> > [   46.533268] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.534071] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.548911] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=576
> > [   46.549940] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.550742] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.565571] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=577
> > [   46.566599] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.567401] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.582233] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=578
> > [   46.583286] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.584120] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.598898] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=579
> > [   46.599932] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.600733] <4>-(4)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.615558] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=580
> > [   46.616613] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.617448] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.632218] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=581
> > [   46.633266] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.634100] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.648949] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=582
> > [   46.650019] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.650853] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.665547] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=583
> > [   46.666612] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.667446] <4>-(4)[0:swapper/4][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.682252] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=584
> > [   46.683472] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.684309] <3>-(3)[0:swapper/3][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.698929] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=585
> > [   46.699985] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.700818] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.715571] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=586
> > [   46.716637] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.717473] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.732191] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=587
> > [   46.733253] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.734088] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.748852] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=588
> > [   46.749910] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.750745] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.765514] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=589
> > [   46.766542] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.767343] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.782177] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=590
> > [   46.783239] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.784074] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.798840] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=591
> > [   46.799901] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.800735] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.815502] <6>-(6)[640:idmap2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=592
> > [   46.816550] <6>-(6)[640:idmap2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   46.817374] <6>-(6)[640:idmap2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.832164] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=593
> > [   46.833192] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.833995] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.848826] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=594
> > [   46.849855] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.850656] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.865489] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=595
> > [   46.866516] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.867318] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.882150] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=596
> > [   46.883174] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.883977] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.898816] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=597
> > [   46.899848] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.900649] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.915474] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=598
> > [   46.916500] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.917302] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.932135] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=599
> > [   46.933168] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.933969] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.938108]
> > <4>.(4)[342:init][wlan][342]cnmUpdateDbdcSetting:(CNM INFO) [DBDC]
> > Disable
> > [   46.939107]
> > <4>.(4)[342:init][wlan][342]cnmUpdateDbdcSetting:(CNM WARN)
> > fgDbdcEn=0, ucDBDCAAMode=0
> > [   46.940223]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x28] SEQ[30] SET[1] LEN[100]
> > [   46.941565] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x28] SEQ[30] to CMD Q
> > [   46.942840]
> > <4>.(4)[342:init][wlan][342]rlmDomainUpdateRegdomainFromaLocalDataB
> > aseByCountryCode:(RLM ERROR) Cannot find the 00 RegDomain. Set to
> > default WW
> > [   46.944577]
> > <4>.(4)[342:init][wlan][342]kalApplyCustomRegulatory:(RLM INFO)
> > kalApplyCustomRegulatory()
> > [   46.945737]
> > <4>.(4)[342:init][wlan][342]rlmDomainCountryCodeUpdate:(RLM INFO)
> > g_mtk_regd_control.alpha2 = 00
> > [   46.946091]
> > <7>.(7)[635:main_thread][wlan][635]cnmDbdcEventHwSwitchDone:(CNM
> > INFO) [DBDC] switch event from cmd happen in state 0
> > [   46.946961]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][0]: ch1 (freq = 2412) flgs=0x180 [NO_80MHZ NO_160MHZ ]
> > [   46.948794] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=600
> > [   46.949999]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][1]: ch2 (freq = 2417) flgs=0x180 [NO_80MHZ NO_160MHZ ]
> > [   46.951011] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.952478]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][2]: ch3 (freq = 2422) flgs=0x180 [NO_80MHZ NO_160MHZ ]
> > [   46.953276] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.954853]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][3]: ch4 (freq = 2427) flgs=0x180 [NO_80MHZ NO_160MHZ ]
> > [   46.957364]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][4]: ch5 (freq = 2432) flgs=0x180 [NO_80MHZ NO_160MHZ ]
> > [   46.958957]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][5]: ch6 (freq = 2437) flgs=0x180 [NO_80MHZ NO_160MHZ ]
> > [   46.960539]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][6]: ch7 (freq = 2442) flgs=0x180 [NO_80MHZ NO_160MHZ ]
> > [   46.962116]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][7]: ch8 (freq = 2447) flgs=0x180 [NO_80MHZ NO_160MHZ ]
> > [   46.963695]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][8]: ch9 (freq = 2452) flgs=0x180 [NO_80MHZ NO_160MHZ ]
> > [   46.965274]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][9]: ch10 (freq = 2457) flgs=0x180 [NO_80MHZ NO_160MHZ ]
> > [   46.965459] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=601
> > [   46.966868]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][10]: ch11 (freq = 2462) flgs=0x180 [NO_80MHZ NO_160MHZ
> > ]
> > [   46.967882] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.969373]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][11]: ch12 (freq = 2467) flgs=0x180 [NO_80MHZ NO_160MHZ
> > ]
> > [   46.970174] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.971776]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][12]: ch13 (freq = 2472) flgs=0x180 [NO_80MHZ NO_160MHZ
> > ]
> > [   46.974298]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[0][13]: ch14 (freq = 2484) flgs=0x1b0 [NO_HT40PLUS
> > NO_HT40MINUS NO_80MHZ NO_160MHZ ]
> > [   46.976168]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][0]: ch36 (freq = 5180) flgs=0x100 [NO_160MHZ ]
> > [   46.977658]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][1]: ch40 (freq = 5200) flgs=0x100 [NO_160MHZ ]
> > [   46.979154]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][2]: ch44 (freq = 5220) flgs=0x100 [NO_160MHZ ]
> > [   46.980644]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][3]: ch48 (freq = 5240) flgs=0x100 [NO_160MHZ ]
> > [   46.982120] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=602
> > [   46.982142]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][4]: ch52 (freq = 5260) flgs=0x100 [NO_160MHZ ]
> > [   46.983157] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   46.984537]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][5]: ch56 (freq = 5280) flgs=0x100 [NO_160MHZ ]
> > [   46.985336] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   46.986827]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][6]: ch60 (freq = 5300) flgs=0x100 [NO_160MHZ ]
> > [   46.989249]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][7]: ch64 (freq = 5320) flgs=0x100 [NO_160MHZ ]
> > [   46.990740]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][8]: ch100 (freq = 5500) flgs=0x100 [NO_160MHZ ]
> > [   46.992248]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][9]: ch104 (freq = 5520) flgs=0x100 [NO_160MHZ ]
> > [   46.993750]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][10]: ch108 (freq = 5540) flgs=0x100 [NO_160MHZ ]
> > [   46.995264]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][11]: ch112 (freq = 5560) flgs=0x100 [NO_160MHZ ]
> > [   46.996776]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][12]: ch116 (freq = 5580) flgs=0x100 [NO_160MHZ ]
> > [   46.998287]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][13]: ch120 (freq = 5600) flgs=0x100 [NO_160MHZ ]
> > [   46.998782] <6>-(6)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=603
> > [   46.999809]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][14]: ch124 (freq = 5620) flgs=0x100 [NO_160MHZ ]
> > [   47.000823] <6>-(6)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   47.002221]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][15]: ch128 (freq = 5640) flgs=0x100 [NO_160MHZ ]
> > [   47.003022] <6>-(6)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.004539]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][16]: ch132 (freq = 5660) flgs=0x100 [NO_160MHZ ]
> > [   47.006976]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][17]: ch136 (freq = 5680) flgs=0x100 [NO_160MHZ ]
> > [   47.008493]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][18]: ch140 (freq = 5700) flgs=0x100 [NO_160MHZ ]
> > [   47.010005]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][19]: ch144 (freq = 5720) flgs=0x100 [NO_160MHZ ]
> > [   47.011520]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][20]: ch149 (freq = 5745) flgs=0x100 [NO_160MHZ ]
> > [   47.013032]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][21]: ch153 (freq = 5765) flgs=0x100 [NO_160MHZ ]
> > [   47.014544]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][22]: ch157 (freq = 5785) flgs=0x100 [NO_160MHZ ]
> > [   47.015444] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=604
> > [   47.016068]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][23]: ch161 (freq = 5805) flgs=0x100 [NO_160MHZ ]
> > [   47.017079] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   47.018479]
> > <4>.(4)[342:init][wlan][342]rlmDomainParsingChannel:(RLM INFO)
> > channels[1][24]: ch165 (freq = 5825) flgs=0x100 [NO_160MHZ ]
> > [   47.018482]
> > <4>.(4)[342:init][wlan][342]rlmDomainSendDomainInfoCmd_V2:(RLM
> > INFO) rlmDomainSendDomainInfoCmd_V2(), buff_valid_size = 0x144
> > [   47.019281] <4>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.023260]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x0F] SEQ[31] SET[1] LEN[388]
> > [   47.024600] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x0F] SEQ[31] to CMD Q
> > [   47.025869]
> > <4>.(4)[342:init][wlan][342]rlmDomainSendPwrLimitCmd_V2:(RLM INFO)
> > rlmDomainSendPwrLimitCmd()
> > [   47.027297] <4>.(4)[342:init][wlan][342]kalRequestFirmware:(INIT
> > INFO) kalRequestFirmware(): TxPwrLimit_MT79x1.dat OK
> > [   47.028639]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitGetCountryRange:(RLM
> > INFO) Found TxPwrLimit table for CountryCode "00"
> > [   47.030104]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section cck in TxPwrLimit_MT79x1.dat
> > [   47.031538]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ofdm in TxPwrLimit_MT79x1.dat
> > [   47.032107] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=605
> > [   47.032983]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ht20 in TxPwrLimit_MT79x1.dat
> > [   47.033988] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   47.035311]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ht40 in TxPwrLimit_MT79x1.dat
> > [   47.036102] <5>-(5)[440:main][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.037530]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section vht20 in TxPwrLimit_MT79x1.dat
> > [   47.039910]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section vht40 in TxPwrLimit_MT79x1.dat
> > [   47.041352]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section vht80 in TxPwrLimit_MT79x1.dat
> > [   47.042790]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section vht160 in TxPwrLimit_MT79x1.dat
> > [   47.044247]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru26 in TxPwrLimit_MT79x1.dat
> > [   47.045684]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru52 in TxPwrLimit_MT79x1.dat
> > [   47.047123]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru106 in TxPwrLimit_MT79x1.dat
> > [   47.048569]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru242 in TxPwrLimit_MT79x1.dat
> > [   47.048769] <6>-(6)[642:system_server][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=606
> > [   47.050019]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru484 in TxPwrLimit_MT79x1.dat
> > [   47.051125] <6>-(6)[642:system_server][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   47.052456]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru996 in TxPwrLimit_MT79x1.dat
> > [   47.053348] <6>-(6)[642:system_server][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   47.054785]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Find
> > specified section ru996x2 in TxPwrLimit_MT79x1.dat
> > [   47.057281]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM INFO) Load
> > TxPwrLimit_MT79x1.dat finished
> > [   47.058631]
> > <4>.(4)[342:init][wlan][342]rlmDomainInitTxPwrLimitPerRateCmd:(RLM
> > INFO) rlmDomainInitTxPwrLimitPerRateCmd, active n_channels=14,
> > band=1
> > [   47.060937]
> > <4>.(4)[342:init][wlan][342]rlmDomainInitTxPwrLimitPerRateCmd:(RLM
> > INFO) rlmDomainInitTxPwrLimitPerRateCmd, active n_channels=45,
> > band=2
> > [   47.062620]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[32] SET[1] LEN[1404]
> > [   47.063988] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[32] to CMD Q
> > [   47.065275]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[33] SET[1] LEN[1080]
> > [   47.065435] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=607
> > [   47.066630] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[33] to CMD Q
> > [   47.067685] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.068844]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[34] SET[1] LEN[1404]
> > [   47.069677] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.071027] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[34] to CMD Q
> > [   47.073275]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[35] SET[1] LEN[1404]
> > [   47.074634] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[35] to CMD Q
> > [   47.075910]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[36] SET[1] LEN[1404]
> > [   47.077261] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[36] to CMD Q
> > [   47.078527]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[37] SET[1] LEN[1404]
> > [   47.079882] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[37] to CMD Q
> > [   47.081171]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[38] SET[1] LEN[1404]
> > [   47.082092] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=608
> > [   47.082530] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[38] to CMD Q
> > [   47.083569] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.084734]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x5D] SEQ[39] SET[1] LEN[918]
> > [   47.085565] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.086905] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x5D] SEQ[39] to CMD Q
> > [   47.089223] <4>.(4)[342:init]wlan 0000:01:00.0: Direct firmware
> > load for TxPwrLimit6G_MT79x1.dat failed with error -2
> > [   47.090542] <4>.(4)[342:init]wlan 0000:01:00.0: Falling back to
> > syfs fallback for: TxPwrLimit6G_MT79x1.dat
> > [   47.093639] <4>.(4)[342:init][wlan][342]kalRequestFirmware:(INIT
> > INFO) kalRequestFirmware TxPwrLimit6G_MT79x1.dat Fail, errno[-11]!!
> > [   47.095140] <4>.(4)[342:init][wlan][342]kalReadToFile:(INIT
> > INFO) kalReadToFile() path /data/misc/TxPwrLimit6G_MT79x1.dat
> > [   47.096522] <4>.(4)[342:init][wlan][342]kalReadToFile:(INIT
> > INFO) kalReadToFile() path /data/misc/wifi/TxPwrLimit6G_MT79x1.dat
> > [   47.097958] <4>.(4)[342:init][wlan][342]kalReadToFile:(INIT
> > INFO) kalReadToFile() path /storage/sdcard0/TxPwrLimit6G_MT79x1.dat
> > [   47.098759] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=609
> > [   47.099406]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM ERROR)
> > Can't find specified table in TxPwrLimit6G_MT79x1.dat
> > [   47.100606] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.101809]
> > <4>.(4)[342:init][wlan][342]rlmDomainTxPwrLimitLoad:(RLM ERROR)
> > Can't find default table (WW) in TxPwrLimit6G_MT79x1.dat
> > [   47.102638] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.104135]
> > <4>.(4)[342:init][wlan][342]rlmDomainSendPwrLimitCmd_V2:(RLM ERROR)
> > Load TxPwrLimitData failed
> > [   47.106359]
> > <3>.(3)[635:main_thread][wlan][342]wlanOnPreNetRegister:(INIT INFO)
> > MAC address: 00:08:22:98:1f:fc
> > [   47.106384]
> > <3>.(3)[635:main_thread][wlan][635]asicConnac2xFillCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x02] SEQ[40] SET[1] LEN[76]
> > [   47.109073]
> > <3>.(3)[635:main_thread][wlan][635]kalEnqueueCommand:(INIT INFO)
> > EN-Q CMD TYPE[1] ID[0x02] SEQ[40] to CMD Q
> > [   47.110505]
> > <6>.(6)[635:main_thread][wlan][635]asicConnac2xFillCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x5A] SEQ[41] SET[1] LEN[108]
> > [   47.111932]
> > <6>.(6)[635:main_thread][wlan][635]kalEnqueueCommand:(INIT INFO)
> > EN-Q CMD TYPE[1] ID[0x5A] SEQ[41] to CMD Q
> > [   47.113523] <4>.(4)[342:init][wlan][342]kalNapiInit:(INIT INFO)
> > GRO interface added successfully:wlan0
> > [   47.114955] <4>.(4)[342:init][wlan][342]mtk_cfg_get_txpower:(REQ
> > WARN) driver is not ready
> > [   47.115416] <6>-(6)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=610
> > [   47.116077] <4>.(4)[342:init][wlan][342]procCreateFsEntry:(INIT
> > INFO) [procCreateFsEntry]
> > [   47.117039] <6>-(6)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.117948] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (AdapScan) WITH (0x0) to firmware
> > [   47.118775] <6>-(6)[344:ueventd][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.120081] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (DisRoaming) WITH (1) to firmware
> > [   47.122330] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (LdpcTx) WITH (0x1) to firmware
> > [   47.123609] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (LdpcRx) WITH (0x1) to firmware
> > [   47.124902]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x70] SEQ[42] SET[1] LEN[348]
> > [   47.126248] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x70] SEQ[42] to CMD Q
> > [   47.127530] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > INFO) kalIoctl wifiSefCFG num:4
> > [   47.128597] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (StaHT) WITH (1) to firmware
> > [   47.129847] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (StaVHT) WITH (0x1) to firmware
> > [   47.131134] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (MacOverride) WITH (0) to firmware
> > [   47.132078] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=611
> > [   47.132453] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (MacAddr) WITH (00:0c:e7:66:32:dd) to firmware
> > [   47.133496] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.134822]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x70] SEQ[43] SET[1] LEN[348]
> > [   47.135655] <4>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.137959] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x70] SEQ[43] to CMD Q
> > [   47.139239] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > INFO) kalIoctl wifiSefCFG num:4
> > [   47.140298] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (Nss) WITH (0x2) to firmware
> > [   47.141555] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (Sta5gBw) WITH (2) to firmware
> > [   47.142819] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (TxMaxAmsduInAmpduLen) WITH (8192) to firmware
> > [   47.144267] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (RxMaxMpduLen) WITH (2) to firmware
> > [   47.145586]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x70] SEQ[44] SET[1] LEN[348]
> > [   47.146938] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x70] SEQ[44] to CMD Q
> > [   47.148207] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > INFO) kalIoctl wifiSefCFG num:4
> > [   47.148742] <6>-(6)[642:system_server][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=612
> > [   47.149272] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (CtiaMode) WITH (0) to firmware
> > [   47.150387] <6>-(6)[642:system_server][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   47.151553] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (TpTestMode) WITH (0) to firmware
> > [   47.152447] <6>-(6)[642:system_server][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   47.153745] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (EfuseBufferModeCal) WITH (0) to firmware
> > [   47.156159] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (RegP2pIfAtProbe) WITH (1) to firmware
> > [   47.157510]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x70] SEQ[45] SET[1] LEN[348]
> > [   47.158849] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x70] SEQ[45] to CMD Q
> > [   47.160118] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > INFO) kalIoctl wifiSefCFG num:4
> > [   47.161178] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (Wow) WITH (1) to firmware
> > [   47.162399] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (WowOnMdtim) WITH (1) to firmware
> > [   47.163701] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (ScreenoffDTIMPeriod) WITH (1) to firmware
> > [   47.165095] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (KeepFullPwr) WITH (0) to firmware
> > [   47.165402] <6>-(6)[642:system_server][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=613
> > [   47.166408]
> > <4>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x70] SEQ[46] SET[1] LEN[348]
> > [   47.167518] <6>-(6)[642:system_server][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   47.168755] <4>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x70] SEQ[46] to CMD Q
> > [   47.169653] <6>-(6)[642:system_server][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   47.170921] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > INFO) kalIoctl wifiSefCFG num:4
> > [   47.173007] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (Probe256QAM) WITH (0) to firmware
> > [   47.174323] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (VhtIeIn2G) WITH (0) to firmware
> > [   47.174507]
> > <1>.(1)[636:hif_thread][wlan][636]glBusConfigASPML1SS:(INIT INFO)
> > Config ASPM-L1SS
> > [   47.175615] <4>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (TdlsBufferSTASleep) WITH (0) to firmware
> > [   47.175616] <1>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (ChipResetRecover) WITH (0) to firmware
> > [   47.175617]
> > <5>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x70] SEQ[47] SET[1] LEN[348]
> > [   47.175618] <5>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x70] SEQ[47] to CMD Q
> > [   47.175620] <1>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > INFO) kalIoctl wifiSefCFG num:4
> > [   47.175621] <5>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (StaHTBfee) WITH (1) to firmware
> > [   47.175621] <1>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (EnableSerL0p5) WITH (0) to firmware
> > [   47.175622] <5>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (EnableSerL1) WITH (0) to firmware
> > [   47.175623] <1>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (ApVHT) WITH (0x1) to firmware
> > [   47.175624]
> > <5>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x70] SEQ[48] SET[1] LEN[348]
> > [   47.175625] <1>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x70] SEQ[48] to CMD Q
> > [   47.175625] <5>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > INFO) kalIoctl wifiSefCFG num:4
> > [   47.175626] <5>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (P2pGoVHT) WITH (0x1) to firmware
> > [   47.175627] <5>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (P2pGcVHT) WITH (0x1) to firmware
> > [   47.175627] <5>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (StbcTx) WITH (0x1) to firmware
> > [   47.175628] <5>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > WARN) Send key word (StbcRx) WITH (0x1) to firmware
> > [   47.175629]
> > <5>.(4)[342:init][wlan][342]asicConnac2xFillCmdTxdInfo:(INIT INFO)
> > TX CMD: ID[0x70] SEQ[49] SET[1] LEN[348]
> > [   47.175630] <5>.(4)[342:init][wlan][342]kalEnqueueCommand:(INIT
> > INFO) EN-Q CMD TYPE[1] ID[0x70] SEQ[49] to CMD Q
> > [   47.175631] <2>.(4)[342:init][wlan][342]wlanFeatureToFw:(INIT
> > INFO) kalIoctl wifiSefCFG num:4
> > [   47.175632]
> > <5>.(4)[342:init][wlan][342]wlanCfgLoadIotApRule:(INIT INFO) IOTAP:
> > Start Parsing Rules
> > [   47.175667] <2>.(4)[342:init][wlan][342]wlanProbe:(INIT INFO)
> > wlanProbe: probe success, feature set: 0x84881418, persistNetdev: 0
> > [   47.176720]
> > <5>.(1)[636:hif_thread][wlan][636]glBusConfigASPM:(INIT INFO) ASPM
> > STATUS 2
> > [   47.176864] <5>.(1)[636:hif_thread][wlan][636]halSetFWOwn:(INIT
> > INFO) FW OWN:1
> > [   47.178170]
> > <5>.(5)[635:main_thread][wlan][635]wlanoidSetP2pMode:(P2P INFO) P2P
> > Compile as (2)p2p-like interface
> > [   47.182065] <5>-(1)[636:hif_thread][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=614
> > [   47.182118]
> > <5>.(5)[635:main_thread][wlan][635]glP2pCreateWirelessDevice:(INIT
> > INFO) glP2pCreateWirelessDevice (00000000b381dc5d)
> > [   47.183436] <5>-(1)[636:hif_thread][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.184463]
> > <5>.(5)[635:main_thread][wlan][635]glRegisterP2P:(INIT INFO)
> > glRegisterP2P(0), fgIsApMode(0)
> > [   47.185793] <5>-(1)[636:hif_thread][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   47.187109]
> > <5>.(5)[635:main_thread][wlan][635]glRegisterP2P:(INIT INFO) Set
> > p2p role[0] mac to 02:08:22:98:1f:fc
> > [   47.188615]
> > <5>.(1)[636:hif_thread][wlan][636]glBusConfigASPM:(INIT INFO) ASPM
> > STATUS 0
> > [   47.189939]
> > <5>.(5)[635:main_thread][wlan][635]p2pDevFsmInit:(INIT INFO) Set
> > p2p dev mac to 02:08:22:98:1f:fc
> > [   47.190974]
> > <5>.(1)[636:hif_thread][wlan][636]halSetDriverOwn:(INIT INFO)
> > DRIVER OWN Done[11485 us]
> > [   47.199125] <5>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=615
> > [   47.199911]
> > <5>.(5)[635:main_thread][wlan][635]secPrivacySeekForBcEntry:(INIT
> > INFO) OpMode:3, NetworkType:1, CheckKeyId:0
> > [   47.201202] <5>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.202080]
> > <5>.(5)[635:main_thread][wlan][635]secPrivacySeekForBcEntry:(RSN
> > INFO) [Wlan index] BSS#4 keyid#255 P=0 use WlanIndex#0 STAIdx=254
> > 02:08:22:98:1f:fc
> > [   47.203527] <5>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.215746] <5>-(5)[635:main_thread][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=616
> > [   47.215854] <5>-(5)[635:main_thread][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.215855] <5>-(5)[635:main_thread][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   47.225807]
> > <5>.(5)[635:main_thread][wlan][635]nicActivateNetwork:(RSN INFO)
> > [wlan index]=4 OwnMac4=02:08:22:98:1f:fc BSSID=00:00:00:00:00:00
> > BMCIndex = 0 NetType=1
> > [   47.227653]
> > <5>.(5)[635:main_thread][wlan][635]asicConnac2xFillCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x11] SEQ[50] SET[1] LEN[76]
> > [   47.229071]
> > <5>.(5)[635:main_thread][wlan][635]kalEnqueueCommand:(INIT INFO)
> > EN-Q CMD TYPE[1] ID[0x11] SEQ[50] to CMD Q
> > [   47.230431]
> > <5>.(5)[635:main_thread][wlan][635]nicDeactivateNetwork:(RSN INFO)
> > [wlan index]=4 OwnMac=02:08:22:98:1f:fc BSSID=00:00:00:00:00:00
> > BMCIndex = 0 NetType=1
> > [   47.232048] <7>-(7)[642:system_server][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=617
> > [   47.232277]
> > <5>.(5)[635:main_thread][wlan][635]asicConnac2xFillCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x11] SEQ[51] SET[1] LEN[76]
> > [   47.233382] <7>-(7)[642:system_server][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   47.234678]
> > <5>.(5)[635:main_thread][wlan][635]kalEnqueueCommand:(INIT INFO)
> > EN-Q CMD TYPE[1] ID[0x11] SEQ[51] to CMD Q
> > [   47.235576] <5>-(7)[642:system_server][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   47.237942]
> > <5>.(5)[635:main_thread][wlan][635]secRemoveBssBcEntry:(RSN INFO)
> > remove all the key related with BSS!
> > [   47.237944]
> > <5>.(5)[635:main_thread][wlan][635]asicConnac2xFillCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x14] SEQ[52] SET[1] LEN[68]
> > [   47.240667]
> > <5>.(5)[635:main_thread][wlan][635]kalEnqueueCommand:(INIT INFO)
> > EN-Q CMD TYPE[1] ID[0x14] SEQ[52] to CMD Q
> > [   47.242009]
> > <5>.(5)[635:main_thread][wlan][635]wlanBindBssIdxToNetInterface:(IN
> > IT ERROR) Array index out of bound, ucBssIndex=4
> > [   47.243452] <5>.(5)[635:main_thread][wlan][635]glSetupP2P:(P2P
> > INFO) check prDevHandler = 00000000e8626f46, aprRoleHandler =
> > 00000000e8626f46
> > [   47.245063]
> > <5>.(5)[635:main_thread][wlan][635]secPrivacySeekForBcEntry:(INIT
> > INFO) OpMode:0, NetworkType:1, CheckKeyId:0
> > [   47.246438]
> > <5>.(5)[635:main_thread][wlan][635]secPrivacySeekForBcEntry:(RSN
> > INFO) [Wlan index] BSS#1 keyid#255 P=0 use WlanIndex#1 STAIdx=254
> > 02:08:22:98:1f:fc
> > [   47.248239]
> > <5>.(5)[635:main_thread][wlan][635]nicActivateNetwork:(RSN INFO)
> > [wlan index]=1 OwnMac2=02:08:22:98:1f:fc BSSID=00:00:00:00:00:00
> > BMCIndex = 1 NetType=1
> > [   47.250070] <5>-(5)[635:main_thread][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=618
> > [   47.250174] <5>-(5)[635:main_thread][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.250175] <5>-(5)[635:main_thread][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   47.253088]
> > <5>.(5)[635:main_thread][wlan][635]asicConnac2xFillCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x11] SEQ[53] SET[1] LEN[76]
> > [   47.254507]
> > <5>.(5)[635:main_thread][wlan][635]kalEnqueueCommand:(INIT INFO)
> > EN-Q CMD TYPE[1] ID[0x11] SEQ[53] to CMD Q
> > [   47.255876]
> > <5>.(5)[635:main_thread][wlan][635]glRegisterP2P:(INIT INFO)
> > glRegisterP2P(1), fgIsApMode(1)
> > [   47.257076]
> > <5>.(5)[635:main_thread][wlan][635]glRegisterP2P:(INIT INFO) Set
> > p2p role[1] mac to 06:08:22:98:1f:fc
> > [   47.258360]
> > <5>.(5)[635:main_thread][wlan][635]p2pDevFsmInit:(INIT INFO) Set
> > p2p dev mac to 02:08:22:98:1f:fc
> > [   47.259600]
> > <5>.(5)[635:main_thread][wlan][635]secPrivacySeekForBcEntry:(INIT
> > INFO) OpMode:3, NetworkType:1, CheckKeyId:0
> > [   47.260965]
> > <5>.(5)[635:main_thread][wlan][635]secPrivacySeekForBcEntry:(RSN
> > INFO) [Wlan index] BSS#4 keyid#255 P=0 use WlanIndex#0 STAIdx=254
> > 02:08:22:98:1f:fc
> > [   47.262750]
> > <5>.(5)[635:main_thread][wlan][635]nicActivateNetwork:(RSN INFO)
> > [wlan index]=4 OwnMac4=02:08:22:98:1f:fc BSSID=00:00:00:00:00:00
> > BMCIndex = 0 NetType=1
> > [   47.264582]
> > <5>.(5)[635:main_thread][wlan][635]asicConnac2xFillCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x11] SEQ[54] SET[1] LEN[76]
> > [   47.265377] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=619
> > [   47.265994]
> > <5>.(5)[635:main_thread][wlan][635]kalEnqueueCommand:(INIT INFO)
> > EN-Q CMD TYPE[1] ID[0x11] SEQ[54] to CMD Q
> > [   47.267200] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.268274]
> > <5>.(5)[635:main_thread][wlan][635]nicDeactivateNetwork:(RSN INFO)
> > [wlan index]=4 OwnMac=02:08:22:98:1f:fc BSSID=00:00:00:00:00:00
> > BMCIndex = 0 NetType=1
> > [   47.269107] <2>-(2)[0:swapper/2][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.270941]
> > <5>.(5)[635:main_thread][wlan][635]asicConnac2xFillCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x11] SEQ[55] SET[1] LEN[76]
> > [   47.273311]
> > <5>.(5)[635:main_thread][wlan][635]kalEnqueueCommand:(INIT INFO)
> > EN-Q CMD TYPE[1] ID[0x11] SEQ[55] to CMD Q
> > [   47.274651]
> > <5>.(5)[635:main_thread][wlan][635]secRemoveBssBcEntry:(RSN INFO)
> > remove all the key related with BSS!
> > [   47.274653]
> > <5>.(5)[635:main_thread][wlan][635]asicConnac2xFillCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x14] SEQ[56] SET[1] LEN[68]
> > [   47.277373]
> > <5>.(5)[635:main_thread][wlan][635]kalEnqueueCommand:(INIT INFO)
> > EN-Q CMD TYPE[1] ID[0x14] SEQ[56] to CMD Q
> > [   47.278728]
> > <5>.(5)[635:main_thread][wlan][635]wlanBindBssIdxToNetInterface:(IN
> > IT ERROR) Array index out of bound, ucBssIndex=4
> > [   47.280159] <5>.(5)[635:main_thread][wlan][635]glSetupP2P:(P2P
> > INFO) check prDevHandler = 0000000016fc2e68, aprRoleHandler =
> > 0000000016fc2e68
> > [   47.281764]
> > <5>.(5)[635:main_thread][wlan][635]secPrivacySeekForBcEntry:(INIT
> > INFO) OpMode:0, NetworkType:1, CheckKeyId:0
> > [   47.282034] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=620
> > [   47.283134]
> > <5>.(5)[635:main_thread][wlan][635]secPrivacySeekForBcEntry:(RSN
> > INFO) [Wlan index] BSS#2 keyid#255 P=0 use WlanIndex#2 STAIdx=254
> > 06:08:22:98:1f:fc
> > [   47.284178] <7>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.285848]
> > <5>.(5)[635:main_thread][wlan][635]nicActivateNetwork:(RSN INFO)
> > [wlan index]=2 OwnMac3=06:08:22:98:1f:fc BSSID=00:00:00:00:00:00
> > BMCIndex = 2 NetType=1
> > [   47.285849]
> > <7>.(5)[635:main_thread][wlan][635]asicConnac2xFillCmdTxdInfo:(INIT
> > INFO) TX CMD: ID[0x11] SEQ[57] SET[1] LEN[76]
> > [   47.286683] <5>-(7)[0:swapper/7][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.288508]
> > <5>.(5)[635:main_thread][wlan][635]kalEnqueueCommand:(INIT INFO)
> > EN-Q CMD TYPE[1] ID[0x11] SEQ[57] to CMD Q
> > [   47.292285]
> > <4>.(4)[342:init][wlan][342]set_p2p_mode_handler:(INIT INFO) ret =
> > 0x00000000, p2p reg = 1, resetting = 0
> > [   47.292375] <6>.(6)[636:hif_thread][wlan][636]halSetFWOwn:(INIT
> > STATE) Skip FW OWN due to pending INT
> > [   47.293623] <4>.(4)[342:init][wlan][342]kalNapiInit:(INIT INFO)
> > GRO interface added successfully:p2p0
> > [   47.294134] <6>.(4)[342:init][wlan][342]kalNapiInit:(INIT INFO)
> > GRO interface added successfully:ap0
> > [   47.294817] <4>.(6)[636:hif_thread][wlan][636]wlanIST:(REQ INFO)
> > Fail: nicProcessIST! status [-1073676269]
> > [   47.296354] <7>.(4)[342:init][wlan][342]p2pNetRegister:(P2P
> > INFO) P2P 2nd interface work 13 14
> > [   47.297564]
> > <4>.(7)[636:hif_thread][wlan][636]glBusConfigASPML1SS:(INIT INFO)
> > Config ASPM-L1SS
> > [   47.298279]
> > <7>.(4)[342:init][wlan][342]wlanOnP2pRegistration:(INIT INFO)
> > wlanOnP2pRegistration: p2p device registered
> > [   47.298698] <4>-(5)[325:kworker/5:1H][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=621
> > [   47.298815] <7>-(5)[325:kworker/5:1H][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   47.298816] <4>-(5)[325:kworker/5:1H][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   47.299385]
> > <4>.(7)[636:hif_thread][wlan][636]glBusConfigASPM:(INIT INFO) ASPM
> > STATUS 2
> > [   47.300437] <4>.(4)[342:init][wlan][342]mtk_pci_probe:(INIT
> > INFO) mtk_pci_probe() done(0)
> > [   47.300477] <4>.(4)[342:init]BOOTPROF:     47300.476804:probe:
> > probe=pci_device_probe drv=wlan(p_mtk_iface_combinations_p2p
> > [wlan_drv_gen4_mt7921])  2040.687159ms
> > [   47.301923] <7>.(7)[636:hif_thread][wlan][636]halSetFWOwn:(INIT
> > INFO) FW OWN:1
> > [   47.303131] <4>.(4)[56:kworker/4:1]mt8195-sound sound: Linked as
> > a consumer to regulator.43
> > [   47.307122] <7>.(7)[342:init]probe of 0000:01:00.0 returned 1
> > after 2053661 usecs
> > [   47.308622] <4>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL2_FE
> > [   47.309481] <7>.(7)[342:init][wlan][342]initWlan:(INIT INFO)
> > initWlan::End
> > [   47.310952] <4>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL3_FE
> > [   47.311452]
> > <7>.(7)[342:init]BOOTPROF:     47311.451265:initcall: init_module
> > [wlan_drv_gen4_mt7921]  2065.771928ms
> > [   47.312286] <4>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL6_FE
> > [   47.312290] <7>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL7_FE
> > [   47.313164] <4>.(7)[342:init]initcall init_module+0x0/0x39c
> > [wlan_drv_gen4_mt7921] returned 0 after 2019038 usecs
> > [   47.314036] <7>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL8_FE
> > [   47.315358] <4>-(7)[342:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=622
> > [   47.316191] <5>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL10_FE
> > [   47.317168] <4>-(7)[342:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   47.318330] <5>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL11_FE
> > [   47.319195] <4>-(7)[342:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.319317] <5>.(5)[1:init]init: Command 'insmod
> > /vendor/lib/modules/wlan_drv_gen4_mt7921.ko' action=boot
> > (/vendor/etc/init/init.wlan_mt7921_drv.rc:2) took 2203ms and
> > succeeded
> > [   47.320114] <4>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL1_FE
> > [   47.321025] <5>.(5)[1:init]init: Service 'bootlogoupdater' (pid
> > 468) exited with status 0 oneshot service took 2.570000 seconds in
> > background
> > [   47.321792] <4>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL2_FE
> > [   47.322674] <5>.(5)[1:init]init: Sending signal 9 to service
> > 'bootlogoupdater' (pid 468) process group...
> > [   47.323603] <4>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL3_FE
> > [   47.323605] <4>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL4_FE
> > [   47.323607] <5>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL5_FE
> > [   47.323610] <4>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL6_FE
> > [   47.325794] <5>.(5)[1:init]libprocessgroup: Successfully killed
> > process cgroup uid 0 pid 468 in 0ms
> > [   47.326428] <4>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL8_FE
> > [   47.328651] <6>.(5)[1:init]init: starting service 'bootanim'...
> > [   47.328887] <4>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL9_FE
> > [   47.328889] <6>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding UL10_FE
> > [   47.331165] <4>.(5)[1:init]init: Control message: Processed
> > ctl.start for 'bootanim' from pid: 472 (/system/bin/surfaceflinger)
> > [   47.331840] <7>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding ADSP_HOSTLESS_VA
> > [   47.332027] <4>-(1)[659:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=623
> > [   47.332305] <4>-(1)[659:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   47.332309] <4>-(1)[659:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.332908] <4>.(5)[1:init]init: processing action (boot) from (
> > /vendor/etc/init/vendor.mediatek.hardware.mtkpower@1.0-init.rc:314)
> > [   47.333581] <4>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding ADSP_VA_FE
> > [   47.334885] <4>.(6)[1:init]init: Command 'chown system system
> > /sys/fs/ext4/${dev.mnt.part.data}/disable_barrier' action=boot (
> > /vendor/etc/init/vendor.mediatek.hardware.mtkpower@1.0-init.rc:316)
> > took 0ms and failed: property 'dev.mnt.part.data' doesn't exist
> > while expanding '/sys/fs/ext4/${dev.mnt.part.data}/disable_barrier'
> > [   47.335566] <5>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding ADSP_MIC_RECORD
> > [   47.335570] <5>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL_SRC_BE
> > [   47.335575] <5>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DL_VIRTUAL_SOURCE BE
> > [   47.336537] <5>.(6)[1:init]init: Command 'chmod 660
> > /sys/fs/f2fs/${dev.mnt.part.data}/current_flush_merge' action=boot
> > (/vendor/etc/init/vendor.mediatek.hardware.mtkpower@1.0-init.rc:317
> > ) took 0ms and failed: property 'dev.mnt.part.data' doesn't exist
> > while expanding
> > '/sys/fs/f2fs/${dev.mnt.part.data}/current_flush_merge'
> > [   47.337176] <5>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DMIC_BE
> > [   47.337179] <5>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding DPTX_BE
> > [   47.337181] <5>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > binding ETDM1_IN_BE
> > [   47.337184] <5>.(4)[56:kworker/4:1]mt8195-sound sound: ASoC:
> > CODEC DAI DBMDX TDM0 not registered
> > [   47.337192] <5>.(4)[56:kworker/4:1]mt8195-sound sound:
> > butterscotch_dev_probe snd_soc_register_card fail -517
> > [   47.337202]
> > <5>.(4)[56:kworker/4:1]BOOTPROF:     47337.201650:probe:
> > probe=platform_drv_probe drv=mt8195-
> > sound(0xffffff800966ce50)    34.170001ms
> > [   47.338209] <5>.(7)[1:init]init: Command 'chown system system
> > /sys/fs/f2fs/${dev.mnt.part.data}/current_flush_merge' action=boot
> > (/vendor/etc/init/vendor.mediatek.hardware.mtkpower@1.0-init.rc:318
> > ) took 0ms and failed: property 'dev.mnt.part.data' doesn't exist
> > while expanding
> > '/sys/fs/f2fs/${dev.mnt.part.data}/current_flush_merge'
> > [   47.339520] <5>.(4)[56:kworker/4:1]mt8195-sound sound: Dropping
> > the link to regulator.43
> > [   47.339543] <5>.(4)[56:kworker/4:1]probe of sound returned 0
> > after 36635 usecs
> > [   47.348685] <5>-(5)[661:init][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=624
> > [   47.368714] <5>-(5)[661:init][IRQ] DDP_COMPONENT_OVL0: hw reset
> > done!
> > [   47.369516] <5>-(5)[661:init][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.370451] <6>-(6)[659:bootanimation][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=625
> > [   47.371570] <6>-(6)[659:bootanimation][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   47.372469] <6>-(6)[659:bootanimation][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   47.382009] <6>-(6)[659:bootanimation][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=626
> > [   47.383140] <6>-(6)[659:bootanimation][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   47.384039] <6>-(6)[659:bootanimation][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   47.392525] <2>.(2)[677:usb ffs open]read descriptors
> > [   47.393180] <2>.(2)[677:usb ffs open]read strings
> > [   47.398680] <2>-(2)[671:idmap2d][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=627
> > [   47.399912] <2>-(2)[671:idmap2d][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.400752] <2>-(2)[671:idmap2d][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.415334] <5>-(5)[681:keystore][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=628
> > [   47.416404] <5>-(5)[681:keystore][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.417250] <5>-(5)[681:keystore][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   47.431994] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=629
> > [   47.433053] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.433887] <5>-(5)[0:swapper/5][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.448657] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: frame
> > underflow! cnt=630
> > [   47.449718] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.450554] <6>-(6)[0:swapper/6][IRQ] DDP_COMPONENT_OVL0: L0 not
> > complete until EOF!
> > [   47.453042] <5>.(5)[690:netdiag]capability: warning: `netdiag'
> > uses 32-bit capabilities (legacy support in use)
> > [   47.465324] <3>-(3)[449:allocator@4.0-s][IRQ]
> > DDP_COMPONENT_OVL0: frame underflow! cnt=631
> > [   47.466651] <3>-(3)[449:allocator@4.0-s][IRQ]
> > DDP_COMPONENT_OVL0: hw reset done!
> > [   47.467195] <4>.(4)[688:BootAnimation][ION]Failed to create
> > client debugfs at /ion/clients/659-0
> > [   47.467575] <4>-(3)[449:allocator@4.0-s][IRQ]
> > DDP_COMPONENT_OVL0: L0 not complete until EOF!
> > [   47.481987] <3>-(3)[672:incidentd][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=632
> > [   47.483237] <3>-(3)[672:incidentd][IRQ] DDP_COMPONENT_OVL0: hw
> > reset done!
> > [   47.484098] <3>-(3)[672:incidentd][IRQ] DDP_COMPONENT_OVL0: L0
> > not complete until EOF!
> > [   47.485910] <1>.(1)[450:composer@2.2-se]mtk_session_set_mode
> > from 0 to 1
> > [   47.487611] <1>.(1)[450:composer@2.2-se][drm:mtk_drm_gem_create]
> > cookie = 00000000842d1fde dma_addr = 0x00000000f9400000 size =
> > 4608000
> > [   47.489247] <1>.(1)[450:composer@2.2-se]CRTC0 hold wakelock
> > mtk_drm_crtc_atomic_resume 3953
> > [   47.498655] <0>-(0)[614:VSyncThread_0][IRQ] DDP_COMPONENT_OVL0:
> > frame underflow! cnt=633
> > [   47.499963] <0>-(0)[614:VSyncThread_0][IRQ] DDP_COMPONENT_OVL0:
> > hw reset done!
> > [   47.500866] <0>-(0)[614:VSyncThread_0][IRQ] DDP_COMPONENT_OVL0:
> > L0 not complete until EOF!
> > [   47.576641] <5>.(5)[342:init]config_usb_cfg_link b.1<-->ffs.adb
> > [   47.577396] <5>.(5)[342:init]usb_get_function usb_function
> > name=Function FS Gadget
> > [   47.578475] <5>.(5)[342:init]gadget_dev_desc_UDC_store write usb
> > [   47.579249] <5>.(5)[342:init]configfs_composite_bind
> > [   47.579870] <5>.(5)[342:init]composite_dev_prepare
> > 0000000038b3b111
> > [   47.580733] <5>.(5)[342:init]composite_os_desc_req_prepare
> > 00000000e19f155b
> > [   47.581603] <5>.(5)[342:init]mtu3 usb: update gadget-ready
> > property
> > [   47.583075] <5>.(5)[342:init]BOOTPROF:     47583.072266:USB
> > ready
> > [   47.584872] <5>.(5)[1:init]gadget_dev_desc_UDC_store write usb
> > [   47.613734] <7>.(7)[443:audio.service.m] SPI_MIC_FE: ASoC: found
> > 1 audio capture paths
> > [   47.614729] <7>.(7)[443:audio.service.m]mt8570-sound
> > odm:mt8570_sound: ASoC: find BE for widget SPI MIC Capture
> > [   47.616153] <7>.(7)[443:audio.service.m]mt8570-sound
> > odm:mt8570_sound: ASoC: try BE SPI MIC Capture
> > [   47.617514] <7>.(7)[443:audio.service.m] SPI_MIC_FE: connected
> > new DPCM capture path SPI_MIC_FE <- SPI MIC BE
> > [   47.618796] <7>.(7)[443:audio.service.m] SPI_MIC_FE: ASoC: found
> > 1 new BE paths
> > [   47.619730] <7>.(7)[443:audio.service.m] SPI MIC BE: ASoC: open
> > capture BE SPI MIC BE
> > [   47.620706] <7>.(7)[443:audio.service.m] SPI MIC BE:
> > mt8570_adsp_pcm_be_startup [be_mic_rec]
> > [   47.622992] <7>.(7)[443:audio.service.m] SPI_MIC_FE: ASoC: open
> > FE SPI_MIC_FE
> > [   47.623901] <7>.(7)[443:audio.service.m] SPI_MIC_FE:
> > mt8570_adsp_pcm_fe_startup [fe_mic_rec] buf_max_align:46080-64
> > period_max_align:23040-0
> > [   47.626753] <7>.(7)[443:audio.service.m] SPI MIC BE: ASoC: close
> > BE SPI MIC BE
> > [   47.627664] <7>.(7)[443:audio.service.m] SPI MIC BE:
> > mt8570_adsp_pcm_be_shutdown [be_mic_rec]
> > [   47.629844] <7>.(7)[443:audio.service.m] SPI_MIC_FE: ASoC: close
> > FE SPI_MIC_FE
> > [   47.630743] <7>.(7)[443:audio.service.m] SPI_MIC_FE:
> > mt8570_adsp_pcm_fe_shutdown [fe_mic_rec]
> > [   47.632926] <7>.(7)[443:audio.service.m] SPI MIC BE: ASoC: BE
> > SPI MIC BE event 2 dir 1
> > [   47.633926] <7>.(7)[443:audio.service.m] SPI_MIC_FE: ASoC: BE
> > capture disconnect check for SPI MIC BE
> > [   47.635079] <7>.(7)[443:audio.service.m] SPI_MIC_FE: freed DSP
> > capture path SPI_MIC_FE <- SPI MIC BE
> > [   47.688792] <7>.(7)[330:kworker/7:1H]mtk-msdc 11230000.mmc:
> > phase: [map:ffffffff] [maxlen:32] [final:10]
> > E/TC:? 0 tee_rpmb_verify_key_sync_counter:1029 Verify key returning
> > 0xffff0008
> > E/TA:  secureStorageRead:71 failed to open
> > file:hdcp_1x_tx_key.data,ret=ffff0007.
> > E/TA:  TA_gen_key:86 Failed to Read Key:-1
> > E/TA:  TA_InvokeCommandEntryPoint:92 HDCP_HDMI:get_hdmi_hdcp_key
> > failed.
> > [   47.737096] <4>.(4)[739:vpud][VCU] mtk_vcu_open name: vpud pid
> > 739 open_cnt 1,shmem size 0x300000
> > [   47.738349] <4>.(4)[739:vpud][VCU] vma->start 0xefa5f000, vma-
> > >end 0xefcc0000, vma->pgoff 0x80000,pa_start 0x80000000
> > [   47.740098] <4>.(4)[739:vpud][VCU] vma->start 0xf081a000, vma-
> > >end 0xf0a7b000, vma->pgoff 0x88000,pa_start 0x88000000
> > [   47.741512] <4>.(4)[739:vpud][VCU] vma->start 0xf0e2f000, vma-
> > >end 0xf0e6f000, vma->pgoff 0x18000,pa_start 0x18000000
> > [   47.898020] <4>.(4)[451:health@2.1-serv]leds_mtk_pwm
> > led_debug_log(135) :[Light] Set lcd-backlight
> > directlyT:47.898,L:103 L:103 map:413
> > [   48.848694] <4>.(4)[451:health@2.1-serv]healthd: battery none
> > chg=
> > [   49.222949] <4>.(4)[888:system-server-i]state_show DISCONNECTED
> > [   49.224123] <4>.(4)[888:system-server-i]acc_open
> > [   49.226037] <4>.(4)[888:system-server-i]acc_release
> > [   49.312750] <3>.(3)[375:logd.auditd]type=1400
> > audit(1627626889.396:51): avc: denied { read } for
> > comm="Binder:400_2" name="wakeup4" dev="sysfs" ino=28797
> > scontext=u:r:system_suspend:s0 tcontext=u:object_r:sysfs:s0
> > tclass=dir permissive=0
> > [   49.315795] <3>.(3)[375:logd.auditd]type=1400
> > audit(1627626889.400:52): avc: denied { read } for
> > comm="Binder:400_2" name="wakeup18" dev="sysfs" ino=34538
> > scontext=u:r:system_suspend:s0 tcontext=u:object_r:sysfs:s0
> > tclass=dir permissive=0
> > [   49.318520] <3>.(3)[375:logd.auditd]type=1400
> > audit(1627626889.400:53): avc: denied { read } for
> > comm="Binder:400_2" name="wakeup16" dev="sysfs" ino=34075
> > scontext=u:r:system_suspend:s0 tcontext=u:object_r:sysfs:s0
> > tclass=dir permissive=0
> > [   49.321268] <3>.(3)[375:logd.auditd]type=1400
> > audit(1627626889.400:54): avc: denied { read } for
> > comm="Binder:400_2" name="wakeup9" dev="sysfs" ino=33836
> > scontext=u:r:system_suspend:s0 tcontext=u:object_r:sysfs:s0
> > tclass=dir permissive=0
> > [   49.323989] <3>.(3)[375:logd.auditd]type=1400
> > audit(1627626889.400:55): avc: denied { read } for
> > comm="Binder:400_2" name="wakeup14" dev="sysfs" ino=33931
> > scontext=u:r:system_suspend:s0 tcontext=u:object_r:sysfs:s0
> > tclass=dir permissive=0
> > [   49.326689] <3>.(3)[375:logd.auditd]type=1400
> > audit(1627626889.400:56): avc: denied { read } for
> > comm="Binder:400_2" name="wakeup12" dev="sysfs" ino=33901
> > scontext=u:r:system_suspend:s0 tcontext=u:object_r:sysfs:s0
> > tclass=dir permissive=0
> > [   49.329430] <3>.(3)[375:logd.auditd]type=1400
> > audit(1627626889.400:57): avc: denied { read } for
> > comm="Binder:400_2" name="wakeup30" dev="sysfs" ino=38859
> > scontext=u:r:system_suspend:s0 tcontext=u:object_r:sysfs:s0
> > tclass=dir permissive=0
> > [   49.332151] <3>.(3)[375:logd.auditd]type=1400
> > audit(1627626889.400:58): avc: denied { read } for
> > comm="Binder:400_2" name="wakeup5" dev="sysfs" ino=29228
> > scontext=u:r:system_suspend:s0 tcontext=u:object_r:sysfs:s0
> > tclass=dir permissive=0
> > [   49.334838] <3>.(3)[375:logd.auditd]type=1400
> > audit(1627626889.400:59): avc: denied { read } for
> > comm="Binder:400_2" name="wakeup10" dev="sysfs" ino=33851
> > scontext=u:r:system_suspend:s0 tcontext=u:object_r:sysfs:s0
> > tclass=dir permissive=0
> > [   49.337567] <3>.(3)[375:logd.auditd]type=1400
> > audit(1627626889.400:60): avc: denied { read } for
> > comm="Binder:400_2" name="wakeup19" dev="sysfs" ino=34813
> > scontext=u:r:system_suspend:s0 tcontext=u:object_r:sysfs:s0
> > tclass=dir permissive=0
> > [   49.376010] <5>.(5)[439:Binder:439_4]RTL8211F Gigabit Ethernet
> > stmmac-0:01: attached PHY driver [RTL8211F Gigabit Ethernet]
> > (mii_bus:phy_addr=stmmac-0:01, irq=POLL)
> > [   49.388406] <5>.(5)[439:Binder:439_4]dwmac4: Master AXI performs
> > any burst length
> > [   49.389355] <5>.(5)[439:Binder:439_4]dwmac-mediatek
> > 11021000.ethernet eth0: Enabling Safety Features
> > [   49.390499] <5>.(5)[439:Binder:439_4]dwmac-mediatek
> > 11021000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
> > [   49.392047] <5>.(5)[439:Binder:439_4]dwmac-mediatek
> > 11021000.ethernet eth0: registered PTP clock
> > [   49.393369] <5>.(5)[439:Binder:439_4]IPv6: ADDRCONF(NETDEV_UP):
> > eth0: link is not ready
> > [   49.394521]
> > <4>.(4)[728:wificond][wlan][728]mtk_cfg_get_txpower:(REQ WARN) STA
> > doesn't support this function
> > [   49.753585] <6>-(6)[1087:Binder:642_8]alarmtimer_enqueue,
> > 109226000000
> > [   49.810905] <2>.(2)[778:HwBinder:732_2][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   49.812375] <5>.(5)[767:vpud]mtk_vcu 18000000.vcu: [VCU]
> > vcu_mapping_dm_addr: 0xf0a4c1b8 -> 0xffffffc1e02321b8
> > [   49.813652] <2>.(2)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   49.814903] <2>.(2)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [0]
> > [   49.817063] <4>.(4)[767:vpud]mtk_vcu 18000000.vcu: [VCU]
> > vcu_mapping_dm_addr: 0xf0a4c7b8 -> 0xffffffc1e02327b8
> > [   49.824157] <7>.(7)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [0] decoder
> > [   49.906184] <3>.(3)[778:HwBinder:732_2][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   49.907430] <3>.(3)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   49.908604] <3>.(3)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [1]
> > [   49.921786] <5>.(5)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [1] decoder
> > [   49.942971] <7>-(7)[658:Binder:642_2]alarmtimer_enqueue,
> > 109226000000
> > [   49.954043] <5>.(5)[732:omx@1.0-service][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   49.955277] <5>.(5)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   49.956493] <5>.(5)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [2]
> > [   49.957772] <5>.(5)[732:omx@1.0-service]mtk-dma-contig: Set
> > secure mode : 5
> > [   49.958639] <5>.(5)[732:omx@1.0-service][MTK_V4L2] level=0
> > mtk_vdec_s_ctrl(),2922: [2] V4L2_CID_MPEG_MTK_SEC_DECODE id
> > 10035211 val 5
> > [   49.960153] <5>.(5)[732:omx@1.0-service]mtk-dma-contig: Set
> > secure mode : 5
> > [   49.963636] <0>-(0)[642:system_server]alarmtimer_enqueue,
> > 109226000000
> > [   49.967770] <3>.(3)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [2] decoder
> > [   49.990893] <0>.(0)[778:HwBinder:732_2][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   49.992147] <0>.(0)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   49.993320] <0>.(0)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [3]
> > [   50.001372] <4>.(4)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [3] decoder
> > [   50.013643] <7>.(7)[732:omx@1.0-service][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.014216] <3>-(3)[876:onProviders.ECP]alarmtimer_enqueue,
> > 109226000000
> > [   50.014881] <7>.(7)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.016904] <7>.(7)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [4]
> > [   50.018174] <7>.(7)[732:omx@1.0-service]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.019043] <7>.(7)[732:omx@1.0-service][MTK_V4L2] level=0
> > mtk_vdec_s_ctrl(),2922: [4] V4L2_CID_MPEG_MTK_SEC_DECODE id
> > 10035211 val 5
> > [   50.020550] <7>.(7)[732:omx@1.0-service]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.026069] <0>-(0)[642:system_server]alarmtimer_enqueue,
> > 109226000000
> > [   50.027188] <5>.(5)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [4] decoder
> > [   50.031073] <7>.(7)[1287:RenderThread][ION]Failed to create
> > client debugfs at /ion/clients/1141-0
> > [   50.055004] <1>.(1)[732:omx@1.0-service][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.056277] <1>.(1)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.057463] <1>.(1)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [5]
> > [   50.064194] <7>.(7)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [5] decoder
> > [   50.090553] <2>.(2)[778:HwBinder:732_2][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.091828] <2>.(2)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.093002] <2>.(2)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [6]
> > [   50.094343] <2>.(2)[778:HwBinder:732_2]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.095224] <2>.(2)[778:HwBinder:732_2][MTK_V4L2] level=0
> > mtk_vdec_s_ctrl(),2922: [6] V4L2_CID_MPEG_MTK_SEC_DECODE id
> > 10035211 val 5
> > [   50.096709] <2>.(2)[778:HwBinder:732_2]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.101543] <6>.(6)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [6] decoder
> > [   50.122877] <2>.(2)[778:HwBinder:732_2][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.124122] <2>.(2)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.125296] <2>.(2)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [7]
> > [   50.131462] <7>.(7)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [7] decoder
> > [   50.156739] <2>.(2)[778:HwBinder:732_2][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.157964] <2>.(2)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.159165] <2>.(2)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [8]
> > [   50.160530] <2>.(2)[778:HwBinder:732_2]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.161394] <2>.(2)[778:HwBinder:732_2][MTK_V4L2] level=0
> > mtk_vdec_s_ctrl(),2922: [8] V4L2_CID_MPEG_MTK_SEC_DECODE id
> > 10035211 val 5
> > [   50.162877] <2>.(2)[778:HwBinder:732_2]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.170327] <7>.(7)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [8] decoder
> > [   50.179857] <6>.(6)[778:HwBinder:732_2][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.181065] <6>.(6)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.182234] <6>.(6)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [9]
> > [   50.187355] <6>.(6)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [9] decoder
> > [   50.196967] <7>.(7)[732:omx@1.0-service][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.198185] <7>.(7)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.199382] <7>.(7)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [10]
> > [   50.200665] <7>.(7)[732:omx@1.0-service]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.201533] <7>.(7)[732:omx@1.0-service][MTK_V4L2] level=0
> > mtk_vdec_s_ctrl(),2922: [10] V4L2_CID_MPEG_MTK_SEC_DECODE id
> > 10035211 val 5
> > [   50.203035] <7>.(7)[732:omx@1.0-service]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.207633] <5>.(5)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [10] decoder
> > [   50.218180] <7>.(7)[778:HwBinder:732_2][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.219402] <7>.(7)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.220571] <7>.(7)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [11]
> > [   50.226615] <7>.(7)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [11] decoder
> > [   50.236436] <7>.(7)[778:HwBinder:732_2][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.237644] <7>.(7)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.238813] <7>.(7)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [12]
> > [   50.240087] <7>.(7)[778:HwBinder:732_2]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.240943] <7>.(7)[778:HwBinder:732_2][MTK_V4L2] level=0
> > mtk_vdec_s_ctrl(),2922: [12] V4L2_CID_MPEG_MTK_SEC_DECODE id
> > 10035211 val 5
> > [   50.242434] <7>.(7)[778:HwBinder:732_2]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.247989] <5>.(5)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [12] decoder
> > [   50.256797] <5>.(5)[732:omx@1.0-service][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.258015] <5>.(5)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.259205] <5>.(5)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [13]
> > [   50.263815] <5>.(5)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [13] decoder
> > [   50.277587] <5>.(5)[732:omx@1.0-service][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.278805] <5>.(5)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.280014] <5>.(5)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [14]
> > [   50.285968] <4>.(4)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [14] decoder
> > [   50.295079] <4>.(4)[732:omx@1.0-service][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.296298] <4>.(4)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.297477] <4>.(4)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [15]
> > [   50.298750] <4>.(4)[732:omx@1.0-service]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.299626] <4>.(4)[732:omx@1.0-service][MTK_V4L2] level=0
> > mtk_vdec_s_ctrl(),2922: [15] V4L2_CID_MPEG_MTK_SEC_DECODE id
> > 10035211 val 5
> > [   50.301127] <4>.(4)[732:omx@1.0-service]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.306564] <4>.(4)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [15] decoder
> > [   50.321039] <4>.(4)[732:omx@1.0-service][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.322258] <4>.(4)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.323453] <4>.(4)[732:omx@1.0-service][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [16]
> > [   50.328079] <6>.(6)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [16] decoder
> > [   50.337701] <6>.(6)[778:HwBinder:732_2][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.338909] <6>.(6)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.340094] <6>.(6)[778:HwBinder:732_2][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [17]
> > [   50.347285] <7>.(7)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [17] decoder
> > [   50.375427] <3>.(3)[777:HwBinder:732_1][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.376647] <3>.(3)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.377819] <3>.(3)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [18]
> > [   50.382750] <6>.(6)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [18] decoder
> > [   50.403642] <5>.(5)[777:HwBinder:732_1][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.404850] <5>.(5)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.406019] <5>.(5)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [19]
> > [   50.412781] <4>.(4)[1475:HwBinder:732_3][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [19] decoder
> > [   50.425246] <5>.(5)[777:HwBinder:732_1][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.426455] <5>.(5)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.427644] <5>.(5)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [20]
> > [   50.428912] <5>.(5)[777:HwBinder:732_1]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.429769] <5>.(5)[777:HwBinder:732_1][MTK_V4L2] level=0
> > mtk_vdec_s_ctrl(),2922: [20] V4L2_CID_MPEG_MTK_SEC_DECODE id
> > 10035211 val 5
> > [   50.431276] <5>.(5)[777:HwBinder:732_1]mtk-dma-contig: Set
> > secure mode : 5
> > [   50.436814] <5>.(5)[1475:HwBinder:732_3][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [20] decoder
> > [   50.452316] <5>.(5)[777:HwBinder:732_1][MTK_V4L2][ERROR]
> > mtk_vdec_s_ctrl:2978: ctrl-id=99200e not support!
> > [   50.453526] <5>.(5)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_open(),110: decoder capability 10
> > [   50.454705] <5>.(5)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_open(),120: 18000000.vdec decoder [21]
> > [   50.456093] <5>.(5)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_release(),150: [21] decoder
> > [   50.457275] <5>.(5)[777:HwBinder:732_1][MTK_V4L2] level=0
> > vidioc_venc_s_ctrl(),279: [0] V4L2_CID_MPEG_MTK_SEC_ENCODE id
> > 10035217 val 0 array[0] 0 array[1] 0
> > [   50.459026] <5>.(5)[777:HwBinder:732_1][MTK_V4L2] level=0
> > venc_if_get_param(),83: venc_if_get_param init drv_handle =
> > 0xffffffc18daa8a00
> > [   50.460625] <5>.(5)[768:vpud]mtk_vcu 18000000.vcu: [VCU]
> > vcu_mapping_dm_addr: 0xf0a4d9d8 -> 0xffffffc1e02339d8
> > [   50.461881] <6>.(6)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_open(),106: encoder capability 0
> > [   50.463048] <6>.(6)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_open(),116: 1a020000.venc encoder [0]
> > [   50.464367] <6>.(6)[777:HwBinder:732_1][MTK_V4L2] level=0
> > venc_if_get_param(),83: venc_if_get_param init drv_handle =
> > 0xffffffc18f2b4e00
> > [   50.466033] <6>.(6)[768:vpud]mtk_vcu 18000000.vcu: [VCU]
> > vcu_mapping_dm_addr: 0xf0a4dcd8 -> 0xffffffc1e0233cd8
> > [   50.468913] <6>.(6)[777:HwBinder:732_1][MTK_V4L2] level=0
> > fops_vcodec_release(),139: [0] encoder
> > [   50.643991] <7>.(7)[342:init]BOOTPROF:     50643.987504: OFF
> > 
> > console:/ $
> > console:/ $
> > console:/ $ su
> > at
> > /sys/kernel/debug/pm_genpd/pm_genpd_summary                        
> >         <
> > domain                          status                pstate  slave
> > s
> >     /device                                                   pstat
> > e  runtime status
> > -----------------------------------------------------------------
> > -----
> > apusys_dla1                     off-0                      0
> > apusys_dla0                     off-0                      0
> > apusys_vpu1                     off-0                      0
> > apusys_vpu0                     off-0                      0
> > apusys_top                      off-
> > 0                      0  apusys_vpu0, apusys_vpu1, apusys_dla0,
> > apusys_dla1
> >     /devices/platform/190f1000.apusys_power                        
> > 0  suspended
> >     /devices/platform/19010000.apu-
> > iommu                           0  suspended
> >     /devices/platform/19015000.apu-
> > iommu                           0  suspended
> > cam_mraw                        off-0                      0
> >     /devices/platform/16141000.larb                                
> > 0  suspended
> >     /devices/platform/16142000.larb                                
> > 0  suspended
> > cam_rawb                        off-0                      0
> >     /devices/platform/16014000.larb                                
> > 0  suspended
> >     /devices/platform/16015000.larb                                
> > 0  suspended
> >     /devices/platform/16070000.cam_raw_b                           
> > 0  suspended
> >     /devices/platform/16090000.cam_yuv_b                           
> > 0  suspended
> > cam_rawa                        off-0                      0
> >     /devices/platform/16012000.larb                                
> > 0  suspended
> >     /devices/platform/16013000.larb                                
> > 0  suspended
> >     /devices/platform/16030000.cam_raw_a                           
> > 0  suspended
> >     /devices/platform/16050000.cam_yuv_a                           
> > 0  suspended
> > cam                             off-
> > 0                      0  cam_rawa, cam_rawb, cam_mraw
> >     /devices/platform/16001000.larb                                
> > 0  suspended
> >     /devices/platform/16002000.larb                                
> > 0  suspended
> >     /devices/platform/17201000.larb                                
> > 0  suspended
> >     /devices/platform/16000000.camisp                              
> > 0  suspended
> >     /devices/genpd:1:16007000.seninf_top                           
> > 0  suspended
> >     /devices/platform/160b0000.camsv1                              
> > 0  suspended
> >     /devices/platform/160b1000.camsv2                              
> > 0  suspended
> >     /devices/platform/160b2000.camsv3                              
> > 0  suspended
> >     /devices/platform/160b3000.camsv4                              
> > 0  suspended
> >     /devices/platform/160b4000.camsv5                              
> > 0  suspended
> >     /devices/platform/160b5000.camsv6                              
> > 0  suspended
> > ipe                             off-0                      0
> >     /devices/platform/15340000.larb                                
> > 0  suspended
> >     /devices/platform/15310000.aie                                 
> > 0  suspended
> > dip                             off-0                      0
> >     /devices/platform/15120000.larb                                
> > 0  suspended
> >     /devices/platform/15230000.larb                                
> > 0  suspended
> > img                             off-0                      0  dip,
> > ipe
> >     /devices/platform/15001000.larb                                
> > 0  suspended
> > hdmi_rx                         on                         0
> >     /devices/platform/1c400000.hdmirx                              
> > 0  active
> > hdmi_tx                         on                         0
> >     /devices/platform/1c300000.hdmi                                
> > 0  active
> > epd_tx                          off-0                      0
> > dp_tx                           off-0                      0
> > vdosys1                         on                         0  dp_tx
> > , epd_tx, hdmi_tx, hdmi_rx
> >     /devices/platform/1c112000.disp_dpi1                           
> > 0  active
> >     /devices/platform/1c110000.disp_vpp_merge5                     
> > 0  active
> >     /devices/platform/vdosys1_client                               
> > 0  active
> >     /devices/platform/1c102000.larb                                
> > 0  active
> >     /devices/platform/1c103000.larb                                
> > 0  active
> >     /devices/platform/1c104000.disp_pseudo_ovl0                    
> > 0  active
> >     /devices/platform/1c114000.disp_ethdr                          
> > 0  active
> >     /devices/platform/disp_pseudo_ovl_l2                           
> > 0  active
> >     /devices/platform/disp_pseudo_ovl_l3                           
> > 0  active
> > venc                            off-0                      0
> >     /devices/platform/1a010000.larb                                
> > 0  suspended
> > vdec2                           off-0                      0
> >     /devices/platform/1803e000.larb                                
> > 0  suspended
> >     /devices/platform/vdec_l22                                     
> > 0  suspended
> > vdec0                           off-0                      0
> >     /devices/platform/1800d000.larb                                
> > 0  suspended
> >     /devices/platform/1800e000.larb                                
> > 0  suspended
> >     /devices/platform/18000000.vdec                                
> > 0  suspended
> >     /devices/platform/vdec_l23                                     
> > 0  suspended
> >     /devices/platform/vdec_l24                                     
> > 0  suspended
> > wepsys                          off-0                      0
> >     /devices/platform/14e04000.larb                                
> > 0  suspended
> >     /devices/platform/14e05000.larb                                
> > 0  suspended
> >     /devices/platform/14e02000.wpe                                 
> > 0  suspended
> >     /devices/platform/14e03000.wpe                                 
> > 0  suspended
> > vppsys1                         off-0                      0
> >     /devices/platform/14f02000.larb                                
> > 0  suspended
> >     /devices/platform/14f03000.larb                                
> > 0  suspended
> >     /devices/platform/vppsys1_client                               
> > 0  suspended
> > vdosys0                         on                         0  vppsy
> > s1, wepsys, vdec0, vdec2, venc, vdosys1, img, cam
> >     /devices/platform/1c016000.disp_mutex0                         
> > 0  suspended
> >     /devices/platform/1c003000.disp_color                          
> > 0  suspended
> >     /devices/platform/1c00d000.disp_color                          
> > 0  suspended
> >     /devices/platform/1c004000.disp_ccorr                          
> > 0  suspended
> >     /devices/platform/1c00e000.disp_ccorr                          
> > 0  suspended
> >     /devices/platform/1c006000.disp_gamma                          
> > 0  suspended
> >     /devices/platform/1c010000.disp_gamma                          
> > 0  suspended
> >     /devices/platform/1c005000.disp_aal                            
> > 0  suspended
> >     /devices/platform/1c00f000.disp_aal                            
> > 0  suspended
> >     /devices/platform/1c007000.disp_dither                         
> > 0  suspended
> >     /devices/platform/1c011000.disp_dither                         
> > 0  suspended
> >     /devices/platform/1c009000.disp_dsc_wrap                       
> > 0  suspended
> >     /devices/platform/1c014000.disp_vpp_merge0                     
> > 0  suspended
> >     /devices/platform/1c01b000.smi                                 
> > 0  active
> >     /devices/platform/1c018000.larb                                
> > 0  suspended
> >     /devices/platform/1c019000.larb                                
> > 0  suspended
> >     /devices/platform/1c01f000.mm-
> > iommu                            0  active
> >     /devices/platform/1c000000.disp_ovl                            
> > 0  suspended
> >     /devices/platform/1c00a000.disp_ovl                            
> > 0  suspended
> >     /devices/platform/1c002000.disp_rdma                           
> > 0  suspended
> >     /devices/platform/1c00c000.disp_rdma                           
> > 0  suspended
> >     /devices/platform/1c001000.disp_wdma                           
> > 0  suspended
> >     /devices/platform/1c00b000.disp_wdma                           
> > 0  suspended
> >     /devices/platform/vdosys0_client                               
> > 0  suspended
> >     /devices/platform/1c01a000.vdosys_config                       
> > 0  suspended
> > venc_core1                      off-0                      0
> >     /devices/platform/1b010000.larb                                
> > 0  suspended
> > vdec1                           off-0                      0
> >     /devices/platform/1802e000.larb                                
> > 0  suspended
> >     /devices/platform/vdec_l21                                     
> > 0  suspended
> > vppsys0                         on                         0  vdec1
> > , venc_core1, vdosys0
> >     /devices/platform/1400e000.smi                                 
> > 0  suspended
> >     /devices/platform/14012000.smi                                 
> > 0  active
> >     /devices/platform/14013000.larb                                
> > 0  suspended
> >     /devices/platform/vppsys0_client                               
> > 0  suspended
> >     /devices/platform/1400d000.mmsram                              
> > 0  suspended
> >     /devices/platform/14018000.mm-
> > iommu                            0  active
> > mfg6                            off-0                      0
> >     /devices/genpd:4:gpufreq                                       
> > 0  suspended
> > mfg5                            off-0                      0
> >     /devices/genpd:3:gpufreq                                       
> > 0  suspended
> > mfg4                            off-0                      0
> >     /devices/genpd:2:gpufreq                                       
> > 0  suspended
> > mfg3                            off-0                      0
> >     /devices/genpd:1:gpufreq                                       
> > 0  suspended
> > mfg2                            off-0                      0
> >     /devices/genpd:0:gpufreq                                       
> > 0  suspended
> > mfg1                            off-0                      0  mfg2, 
> > mfg3, mfg4, mfg5, mfg6
> > mfg0                            off-0                      0  mfg1
> > nna1                            off-0                      0
> > nna0                            off-0                      0
> > nna                             off-0                      0  nna0, 
> > nna1
> > audio                           off-0                      0
> >     /devices/platform/10890000.syscon/10890000.syscon:audio-
> > controller             0  suspended
> >     /devices/platform/11e03000.i2c/i2c-3/3-
> > 002c                    0  suspended
> >     /devices/platform/11e03000.i2c/i2c-3/3-
> > 004d                    0  suspended
> > audio_asrc                      off-0                      0
> > adsp                            off-
> > 0                      0  audio_asrc, audio
> >     /devices/platform/10803000.adsp                                
> > 0  suspended
> > ether                           on                         0
> >     /devices/platform/11021000.ethernet                            
> > 0  active
> > csi_rx_top                      off-0                      0
> >     /devices/genpd:0:16007000.seninf_top                           
> > 0  suspended
> > ssusb_pcie_phy                  on                         0
> >     /devices/platform/usb-
> > phy1                                     0  active
> > pcie_phy                        on                         0
> >     /devices/platform/11e80000.phy0                                
> > 0  active
> > pcie_mac_p1                     off-0                      0
> > pcie_mac_p0                     on                         0
> >     /devices/platform/112f0000.pcie                                
> > 0  active
> > console:/ #
> > rate) to get expected MCLK output, because reparenting MUX
> > automatically is not supported now. (PLL -> MUX -> divider)
> > 
> > We still have to call clk_set_parent() before clk_set_rate(). Which
> > means some information should be got from DTS to check whether the
> > PLL
> > source can be switched or not, so *-mclk-source should be keeped to
> > identify the case.
> 
> So for the clk stuff I already provided a proof of concept [1]
> offline.
> 
> I would like to see a device tree description that follows the design
> of the hardware, such as only listing the clocks that actually do
> feed
> into the audio subsystem, and not including all their parents (and
> grand parents).
> 
> The driver should follow that description.
> 
> 
> ChenYu
> 
> [1] 
> https://urldefense.com/v3/__https://crrev.com/c/3060172__;!!CTRNKA9wMg0ARbw!yXqaj_bh2Q138FLkkRVA9lEMlCY163Ipkv_WxnOTSBSki9xg3xdm3rWRJY72v4jAhw$
>  

Sorry, I had some misunderstanding about the usage of APLL3/APLL4.

Normally, APLL3 and APLL4 are used to track external clock source, so
they are only used when slave input is connected. 

For example,
case 1: (HDMI RX connected)
DL memif (a1sys) -> etdm out2 (clk from apll1/apll2) -> codec
case 2: (HDMI RX disconnected)
HDMI RX -> a3sys -> UL memif (a3sys) -> DL memif (a3sys) -> .... ->
etdm out2 (clk from apll3) -> codec

We keep all modules in the pipeline working on the same clock domain.
When external source disconnects, apll3 is meaningless, so apll1/apll2
are used in the audio pipeline.

MCLK is expected to output the clock generated from the same clock
source as the pipeline, so dynamic reparenting is required in some use
cases like the above example.

In conclusion, it is inevitable that clk_set_parent() and related
clocks in device tree should be kept for dynamic reparenting.

Thanks,
Trevor

> 
> > > > > > > A related question: the chip has five APLLs. How many
> > > > > > > MCLK
> > > > > > > combinations
> > > > > > > does the application need to support? I assume this
> > > > > > > includes
> > > > > > > the
> > > > > > > standard
> > > > > > > 24.576 MHz and 22.5792 MHz clock rates.
> > > > > > > 
> > > > > > 
> > > > > > APLL1 and APLL2 are used in most AFE modules, so their rate
> > > > > > should
> > > > > > be
> > > > > > fixed.
> > > > > > APLL1 is fixed to 196608000Hz.
> > > > > > APLL2 is fixed to 180633600Hz.
> > > > > > APLL is inputed to the divider(8bit), and MCLK is the
> > > > > > output of
> > > > > > divider.
> > > > > > Other APLLs are reserved for some special usage which can't
> > > > > > be
> > > > > > supported by APLL1 & APLL2.
> > > > > > But APLL3~APLL5 aren't used in the series, so I will remove
> > > > > > them in
> > > > > > v3.
> > > > > > 
> > > > > > > > Some of them are not used in this series, because some
> > > > > > > > modules
> > > > > > > > are
> > > > > > > > still developing. Should I only keep the clocks that
> > > > > > > > have
> > > > > > > > been
> > > > > > > > used
> > > > > > > > in
> > > > > > > > the series?
> > > > > > > 
> > > > > > > Yes please. Only add the ones that are used. Things that
> > > > > > > aren't
> > > > > > > used
> > > > > > > don't get tested and verified, and end up as dead code.
> > > > > > > If
> > > > > > > there
> > > > > > > are
> > > > > > > plans to extend them in the future, and you can leave
> > > > > > > comments
> > > > > > > stating
> > > > > > > that intent, and also mention it in the cover letter.
> > > > > > > 
> > > > > > 
> > > > > > OK, I will remove the unused clock in v3.
> > > > > > 
> > > > > > > > > > +       /* xtal */
> > > > > > > > > > +       [MT8195_CLK_XTAL_26M] = "clk26m",
> > > > > > > > > > +       /* pll */
> > > > > > > > > > +       [MT8195_CLK_APMIXED_APLL1] = "apll1",
> > > > > > > > > > +       [MT8195_CLK_APMIXED_APLL2] = "apll2",
> > > > > > > > > > +       [MT8195_CLK_APMIXED_APLL3] = "apll3",
> > > > > > > > > > +       [MT8195_CLK_APMIXED_APLL4] = "apll4",
> > > > > > > > > > +       [MT8195_CLK_APMIXED_APLL5] = "apll5",
> > > > > > > > > > +       [MT8195_CLK_APMIXED_HDMIRX_APLL] =
> > > > > > > > > > "hdmirx_apll",
> > > > > > > > > > +       /* divider */
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL1] = "apll1_ck",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL1_D4] = "apll1_d4",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL2] = "apll2_ck",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL2_D4] = "apll2_d4",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL3] = "apll3_ck",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL3_D4] = "apll3_d4",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL4] = "apll4_ck",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL4_D4] = "apll4_d4",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL5] = "apll5_ck",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL5_D4] = "apll5_d4",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL12_DIV0] =
> > > > > > > > > > "apll12_div0",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL12_DIV1] =
> > > > > > > > > > "apll12_div1",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL12_DIV2] =
> > > > > > > > > > "apll12_div2",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL12_DIV3] =
> > > > > > > > > > "apll12_div3",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL12_DIV4] =
> > > > > > > > > > "apll12_div4",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL12_DIV9] =
> > > > > > > > > > "apll12_div9",
> > > > > > > > > > +       [MT8195_CLK_TOP_HDMIRX_APLL] =
> > > > > > > > > > "hdmirx_apll_ck",
> > > > > > > > > > +       [MT8195_CLK_TOP_MAINPLL_D4_D4] =
> > > > > > > > > > "mainpll_d4_d4",
> > > > > > > > > > +       [MT8195_CLK_TOP_MAINPLL_D5_D2] =
> > > > > > > > > > "mainpll_d5_d2",
> > > > > > > > > > +       [MT8195_CLK_TOP_MAINPLL_D7_D2] =
> > > > > > > > > > "mainpll_d7_d2",
> > > > > > > > > > +       [MT8195_CLK_TOP_UNIVPLL_D4] = "univpll_d4",
> > > > > > > > > > +       /* mux */
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL1_SEL] = "apll1_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL2_SEL] = "apll2_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL3_SEL] = "apll3_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL4_SEL] = "apll4_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_APLL5_SEL] = "apll5_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_A1SYS_HP_SEL] =
> > > > > > > > > > "a1sys_hp_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_A2SYS_SEL] = "a2sys_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_A3SYS_SEL] = "a3sys_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_A4SYS_SEL] = "a4sys_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_ASM_H_SEL] = "asm_h_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_ASM_M_SEL] = "asm_m_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_ASM_L_SEL] = "asm_l_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_AUD_IEC_SEL] =
> > > > > > > > > > "aud_iec_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_AUD_INTBUS_SEL] =
> > > > > > > > > > "aud_intbus_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_AUDIO_H_SEL] =
> > > > > > > > > > "audio_h_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_AUDIO_LOCAL_BUS_SEL] =
> > > > > > > > > > "audio_local_bus_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_DPTX_M_SEL] = "dptx_m_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_INTDIR_SEL] = "intdir_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_I2SO1_M_SEL] =
> > > > > > > > > > "i2so1_m_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_I2SO2_M_SEL] =
> > > > > > > > > > "i2so2_m_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_I2SI1_M_SEL] =
> > > > > > > > > > "i2si1_m_sel",
> > > > > > > > > > +       [MT8195_CLK_TOP_I2SI2_M_SEL] =
> > > > > > > > > > "i2si2_m_sel",
> > > > > > > > > > +       /* clock gate */
> > > > > > > > > > +       [MT8195_CLK_TOP_MPHONE_SLAVE_B] =
> > > > > > > > > > "mphone_slave_b",
> > > > > > > > > > +       [MT8195_CLK_TOP_CFG_26M_AUD] =
> > > > > > > > > > "cfg_26m_aud",
> > > > > > > > > > +       [MT8195_CLK_INFRA_AO_AUDIO] =
> > > > > > > > > > "infra_ao_audio",
> > > > > > > > > > +       [MT8195_CLK_INFRA_AO_AUDIO_26M_B] =
> > > > > > > > > > "infra_ao_audio_26m_b",
> > > > > > > > > > +       [MT8195_CLK_SCP_ADSP_AUDIODSP] =
> > > > > > > > > > "scp_adsp_audiodsp",
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > > +       [MT8195_CLK_AUD_AFE] = "aud_afe",
> > > > > > > > > > +       [MT8195_CLK_AUD_LRCK_CNT] = "aud_lrck_cnt",
> > > > > > > > > > +       [MT8195_CLK_AUD_SPDIFIN_TUNER_APLL] =
> > > > > > > > > > "aud_spdifin_tuner_apll",
> > > > > > > > > > +       [MT8195_CLK_AUD_SPDIFIN_TUNER_DBG] =
> > > > > > > > > > "aud_spdifin_tuner_dbg",
> > > > > > > > > > +       [MT8195_CLK_AUD_UL_TML] = "aud_ul_tml",
> > > > > > > > > > +       [MT8195_CLK_AUD_APLL1_TUNER] =
> > > > > > > > > > "aud_apll1_tuner",
> > > > > > > > > > +       [MT8195_CLK_AUD_APLL2_TUNER] =
> > > > > > > > > > "aud_apll2_tuner",
> > > > > > > > > > +       [MT8195_CLK_AUD_TOP0_SPDF] =
> > > > > > > > > > "aud_top0_spdf",
> > > > > > > > > > +       [MT8195_CLK_AUD_APLL] = "aud_apll",
> > > > > > > > > > +       [MT8195_CLK_AUD_APLL2] = "aud_apll2",
> > > > > > > > > > +       [MT8195_CLK_AUD_DAC] = "aud_dac",
> > > > > > > > > > +       [MT8195_CLK_AUD_DAC_PREDIS] =
> > > > > > > > > > "aud_dac_predis",
> > > > > > > > > > +       [MT8195_CLK_AUD_TML] = "aud_tml",
> > > > > > > > > > +       [MT8195_CLK_AUD_ADC] = "aud_adc",
> > > > > > > > > > +       [MT8195_CLK_AUD_DAC_HIRES] =
> > > > > > > > > > "aud_dac_hires",
> > > > > > > > > > +       [MT8195_CLK_AUD_A1SYS_HP] = "aud_a1sys_hp",
> > > > > > > > > > +       [MT8195_CLK_AUD_AFE_DMIC1] =
> > > > > > > > > > "aud_afe_dmic1",
> > > > > > > > > > +       [MT8195_CLK_AUD_AFE_DMIC2] =
> > > > > > > > > > "aud_afe_dmic2",
> > > > > > > > > > +       [MT8195_CLK_AUD_AFE_DMIC3] =
> > > > > > > > > > "aud_afe_dmic3",
> > > > > > > > > > +       [MT8195_CLK_AUD_AFE_DMIC4] =
> > > > > > > > > > "aud_afe_dmic4",
> > > > > > > > > > +       [MT8195_CLK_AUD_AFE_26M_DMIC_TM] =
> > > > > > > > > > "aud_afe_26m_dmic_tm",
> > > > > > > > > > +       [MT8195_CLK_AUD_UL_TML_HIRES] =
> > > > > > > > > > "aud_ul_tml_hires",
> > > > > > > > > > +       [MT8195_CLK_AUD_ADC_HIRES] =
> > > > > > > > > > "aud_adc_hires",
> > > > > > > > > > +       [MT8195_CLK_AUD_ADDA6_ADC] =
> > > > > > > > > > "aud_adda6_adc",
> > > > > > > > > > +       [MT8195_CLK_AUD_ADDA6_ADC_HIRES] =
> > > > > > > > > > "aud_adda6_adc_hires",
> > > > > > > > > > +       [MT8195_CLK_AUD_LINEIN_TUNER] =
> > > > > > > > > > "aud_linein_tuner",
> > > > > > > > > > +       [MT8195_CLK_AUD_EARC_TUNER] =
> > > > > > > > > > "aud_earc_tuner",
> > > > > > > > > > +       [MT8195_CLK_AUD_I2SIN] = "aud_i2sin",
> > > > > > > > > > +       [MT8195_CLK_AUD_TDM_IN] = "aud_tdm_in",
> > > > > > > > > > +       [MT8195_CLK_AUD_I2S_OUT] = "aud_i2s_out",
> > > > > > > > > > +       [MT8195_CLK_AUD_TDM_OUT] = "aud_tdm_out",
> > > > > > > > > > +       [MT8195_CLK_AUD_HDMI_OUT] = "aud_hdmi_out",
> > > > > > > > > > +       [MT8195_CLK_AUD_ASRC11] = "aud_asrc11",
> > > > > > > > > > +       [MT8195_CLK_AUD_ASRC12] = "aud_asrc12",
> > > > > > > > > > +       [MT8195_CLK_AUD_MULTI_IN] = "aud_multi_in",
> > > > > > > > > > +       [MT8195_CLK_AUD_INTDIR] = "aud_intdir",
> > > > > > > > > > +       [MT8195_CLK_AUD_A1SYS] = "aud_a1sys",
> > > > > > > > > > +       [MT8195_CLK_AUD_A2SYS] = "aud_a2sys",
> > > > > > > > > > +       [MT8195_CLK_AUD_PCMIF] = "aud_pcmif",
> > > > > > > > > > +       [MT8195_CLK_AUD_A3SYS] = "aud_a3sys",
> > > > > > > > > > +       [MT8195_CLK_AUD_A4SYS] = "aud_a4sys",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_UL1] =
> > > > > > > > > > "aud_memif_ul1",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_UL2] =
> > > > > > > > > > "aud_memif_ul2",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_UL3] =
> > > > > > > > > > "aud_memif_ul3",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_UL4] =
> > > > > > > > > > "aud_memif_ul4",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_UL5] =
> > > > > > > > > > "aud_memif_ul5",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_UL6] =
> > > > > > > > > > "aud_memif_ul6",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_UL8] =
> > > > > > > > > > "aud_memif_ul8",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_UL9] =
> > > > > > > > > > "aud_memif_ul9",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_UL10] =
> > > > > > > > > > "aud_memif_ul10",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_DL2] =
> > > > > > > > > > "aud_memif_dl2",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_DL3] =
> > > > > > > > > > "aud_memif_dl3",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_DL6] =
> > > > > > > > > > "aud_memif_dl6",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_DL7] =
> > > > > > > > > > "aud_memif_dl7",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_DL8] =
> > > > > > > > > > "aud_memif_dl8",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_DL10] =
> > > > > > > > > > "aud_memif_dl10",
> > > > > > > > > > +       [MT8195_CLK_AUD_MEMIF_DL11] =
> > > > > > > > > > "aud_memif_dl11",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC0] = "aud_gasrc0",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC1] = "aud_gasrc1",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC2] = "aud_gasrc2",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC3] = "aud_gasrc3",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC4] = "aud_gasrc4",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC5] = "aud_gasrc5",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC6] = "aud_gasrc6",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC7] = "aud_gasrc7",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC8] = "aud_gasrc8",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC9] = "aud_gasrc9",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC10] = "aud_gasrc10",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC11] = "aud_gasrc11",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC12] = "aud_gasrc12",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC13] = "aud_gasrc13",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC14] = "aud_gasrc14",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC15] = "aud_gasrc15",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC16] = "aud_gasrc16",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC17] = "aud_gasrc17",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC18] = "aud_gasrc18",
> > > > > > > > > > +       [MT8195_CLK_AUD_GASRC19] = "aud_gasrc19",
> > > > > > > > > 
> > > > > > > > > The MT8195_CLK_AUD_* clocks are all internal to the
> > > > > > > > > audio
> > > > > > > > > subsystem:
> > > > > > > > > the bits that control these clock gates are in the
> > > > > > > > > same
> > > > > > > > > address
> > > > > > > > > space
> > > > > > > > > as the audio parts. Would it be possible to model
> > > > > > > > > them as
> > > > > > > > > internal
> > > > > > > > > ASoC SUPPLY widgets? The external ones could be
> > > > > > > > > modeled
> > > > > > > > > using
> > > > > > > > > ASoC
> > > > > > > > > CLK_SUPPLY widgets, and the dependencies could be
> > > > > > > > > modeled
> > > > > > > > > with
> > > > > > > > > ASoC
> > > > > > > > > routes. The ASoC core could then handle power
> > > > > > > > > sequencing,
> > > > > > > > > which
> > > > > > > > > the
> > > > > > > > > driver currently does manually.
> > > > > > > > > 
> > > > > > > > > IMO this is better than having two drivers handling
> > > > > > > > > two
> > > > > > > > > aspects
> > > > > > > > > of
> > > > > > > > > the same piece of hardware, while the two aspects are
> > > > > > > > > intertwined.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Yes, it's ok to use the CLK_SUPPLY and SUPPLY to model
> > > > > > > > such
> > > > > > > > clocks.
> > > > > > > > But those clocks are managed by CCF in the preceding
> > > > > > > > SOCs
> > > > > > > > like
> > > > > > > > mt2701,
> > > > > > > > mt6779 and mt8183. Additionally, in some audio modules,
> > > > > > > > clocks
> > > > > > > > should
> > > > > > > 
> > > > > > > This being a new driver, we have some more freedom to
> > > > > > > improve
> > > > > > > the
> > > > > > > design.
> > > > > > > 
> > > > > > > > be enabled before configuring parameters(hw_params). As
> > > > > > > > far
> > > > > > > > as
> > > > > > > > I
> > > > > > > > know,
> > > > > > > > if we use CLK_SUPPLY or SUPPLY to model clocks, the
> > > > > > > > power
> > > > > > > > sequence
> > > > > > > > is
> > > > > > > > controlled by DAPM. It seems to be impossible to
> > > > > > > > fulfill
> > > > > > > > all
> > > > > > > > use
> > > > > > > > cases.
> > > > > > > > That's why we just keep the manual control sequence and
> > > > > > > > CCF
> > > > > > > > seems
> > > > > > > > to be
> > > > > > > > the best choice to model such clock gatess.
> > > > > > > 
> > > > > > > I see. So yes, using CCF does give you reference
> > > > > > > counting,
> > > > > > > dependency
> > > > > > > tracking and other advantages. And using DAPM supplies
> > > > > > > means
> > > > > > > you
> > > > > > > can't
> > > > > > > enable the clock gates outside of DAPM without both
> > > > > > > pieces of
> > > > > > > code
> > > > > > > fighting for control.
> > > > > > > 
> > > > > > > Can we at least move the audio clock gates into the audio
> > > > > > > driver
> > > > > > > though?
> > > > > > > The arbitrary separation into two devices and drivers is
> > > > > > > fishy.
> > > > > > > And
> > > > > > > with
> > > > > > > the move the external references to the audio clock gates
> > > > > > > can
> > > > > > > be
> > > > > > > removed.
> > > > > > > 
> > > > > > 
> > > > > > Because DAPM SUPPLY can't fit our control scenario.
> > > > > > Did you suggest us implement the simple logic
> > > > > > control(including
> > > > > > ref
> > > > > > count, clock dependency) for clock gate(MT8195_CLK_AUD_*)
> > > > > > in
> > > > > > afe
> > > > > > driver
> > > > > > instead of using CCF?
> > > > > 
> > > > > I meant simply moving the CCF-based clk driver code (clk-
> > > > > mt8516-
> > > > > aud.c)
> > > > > from `drivers/clk` and incorporating it into the audio
> > > > > driver,
> > > > > likely
> > > > > in `mt8195-afe-clk.c` or maybe as a separate file. So the
> > > > > audio
> > > > > driver
> > > > > would be a clock provider, and a clock consumer. It will
> > > > > directly
> > > > > use
> > > > > the clocks it provides, internally, and you could remove all
> > > > > those
> > > > > clock references from the device tree.
> > > > > 
> > > > > The goal is to have one hardware representation (device node)
> > > > > only,
> > > > > so
> > > > > that it matches the hardware, which is one single unified
> > > > > block.
> > > > > 
> > > > > After the driver is completed, we can look for opportunities
> > > > > to
> > > > > improve
> > > > > it, if resources are available.
> > > > 
> > > > Thanks for your detailed information.
> > > > I will try to move the CCF-based clk driver code to AFE driver.
> > > > If there are no other internal concerns and blocking problems,
> > > > I
> > > > will
> > > > include the changes in v3.
> > > 
> > > Great.
> > > 
> > > > > > > And regarding the clock requirements for different
> > > > > > > modules,
> > > > > > > could
> > > > > > > we
> > > > > > > have
> > > > > > > that information put in comments somewhere, so if someone
> > > > > > > were to
> > > > > > > revisit
> > > > > > > it later, they would have the information needed to
> > > > > > > understand
> > > > > > > and
> > > > > > > possibly
> > > > > > > improve it? Because right now there's just a bunch of
> > > > > > > clocks
> > > > > > > enabled
> > > > > > > and
> > > > > > > disabled and nothing to explain why that's needed.
> > > > > > > 
> > > > > > 
> > > > > > For example,
> > > > > > MT8195_CLK_AUD_ADC(clock gate) is one of the clock feeding
> > > > > > to
> > > > > > ADDA
> > > > > > module.
> > > > > > Did you want me show the clock gate list feeding to ADDA?
> > > > > > On the other hand, I didn't know how to show the
> > > > > > information
> > > > > > properly
> > > > > > in comments. Could you kindly share me an example for
> > > > > > reference?
> > > > > 
> > > > > 
> > > > > For example, in `mt8195_afe_enable_reg_rw_clk()` in mt8195-
> > > > > afe-
> > > > > clk.c:
> > > > > 
> > > > >         unsigned int clk_array[] = {
> > > > >                 MT8195_CLK_SCP_ADSP_AUDIODSP,
> > > > >                 MT8195_CLK_TOP_AUDIO_LOCAL_BUS_SEL,
> > > > >                 MT8195_CLK_TOP_CFG_26M_AUD,
> > > > >                 MT8195_CLK_INFRA_AO_AUDIO,
> > > > >                 MT8195_CLK_INFRA_AO_AUDIO_26M_B,
> > > > >                 MT8195_CLK_TOP_AUD_INTBUS_SEL,
> > > > >                 MT8195_CLK_TOP_A1SYS_HP_SEL,
> > > > >                 MT8195_CLK_AUD_A1SYS_HP,
> > > > >                 MT8195_CLK_AUD_A1SYS,
> > > > >                 MT8195_CLK_TOP_AUDIO_H_SEL,
> > > > >         };
> > > > > 
> > > > > You could add a comment after each line stating why that
> > > > > clock
> > > > > needs
> > > > > to
> > > > > be enabled. A simple note like "bus access clock" or
> > > > > "internal
> > > > > logic
> > > > > clock"
> > > > > would suffice.
> > > > > 
> > > > 
> > > > OK, I will add short notes to such clock lists.
> > > > 
> > > > > The above list also has some redundancies that could be
> > > > > eliminated.
> > > > > MT8195_CLK_TOP_A1SYS_HP_SEL is parent to both
> > > > > MT8195_CLK_AUD_A1SYS_HP
> > > > > and
> > > > > MT8195_CLK_AUD_A1SYS. When clocks are enabled, their parents
> > > > > are
> > > > > also
> > > > > enabled by CCF, so there's no need to enable them explicitly,
> > > > > unless
> > > > > that clock also directly feeds the clock consumer.
> > > > > 
> > > > 
> > > > OK, I will review all clock usages and remove the unnecessary
> > > > clocks.
> > > > 
> > > > > 
> > > > > Another thing I wanted to bring up: is any of the code after
> > > > > 
> > > > >     struct mt8195_afe_tuner_cfg {
> > > > > 
> > > > > used? It looks like it is used to configure the five extra
> > > > > PLLs
> > > > > in
> > > > > the audio
> > > > > subsystem, but the exposed (non-static) functions don't seem
> > > > > to
> > > > > be
> > > > > called
> > > > > anywhere. Are they for modules not yet supported?
> > > > > 
> > > > 
> > > > Yes, tuners are not supported now.
> > > > I will remove the code and add them back when tuners are
> > > > required
> > > > in
> > > > the future.
> > > 
> > > Thanks.
> > > 
> > > 
> > > ChenYu
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
