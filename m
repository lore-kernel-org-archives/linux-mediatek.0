Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E833C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Mar 2022 04:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRETAX8zMncqjCgt8f1f7zAEFUyerE6Oe3pIkGSpRRM=; b=D+Sg9B3/eWGmsl
	YL/oUAQlvAqo5/WpTfQyli8/FbBndxzDZQv78ubOqd7t04phfN+5Ql/RGt+0cgetpiGeOl3aQeTwG
	q4DB6MfysRiAKQHath8UOqK8j67TwP4A1Lzghx77vsXpK6ZyqBAV0sv6qXOJqvskQXxU0rb+JkT6B
	LDlKyKoppQyFzNSObtJ0MSAojt+fBzFKjrj/EHLaC1KDeguBEpWCFPfnwuDtL6Qa7uA5sX+q/faU6
	9WCV/FCD/gBdOdPVf0fQ5z1EbxF+3PDkm3p9AzkqsJb+RjQC7SAsWuMWWxvrLSCU4BbYG+FFPJUvi
	tk8wIc52Vl9DPNnWLAVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQLz7-00Ciqv-PE; Sat, 05 Mar 2022 04:25:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQLyu-00CiqC-VV; Sat, 05 Mar 2022 04:25:27 +0000
X-UUID: 8583f9f085db485088290c2563c6628c-20220304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4uH3o7mLmCQeRNiU//+zwKjq/fJbA1kQPGfCCkSbis0=; 
 b=b1kWvrCVxqLQn1B9eDRKA7xTd/odukW4/WJocADxZRN6girImQzyiNwa1wPcJzxR+v/7iyCN2xxsZ4Pw58zqR6tBiPDlbo/+UjgEbFdeFP7YY+s7yExSLfSOq1o8tWCFxYBihhzlWFtiJ7YtPd5IlRN+CNTSRWznLvYbDLNkc9k=;
X-UUID: 8583f9f085db485088290c2563c6628c-20220304
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1884387100; Fri, 04 Mar 2022 21:25:13 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 20:25:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 5 Mar 2022 12:24:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 5 Mar 2022 12:24:57 +0800
Message-ID: <6555d89deb9087825f865b9d4265f07465e7ae09.camel@mediatek.com>
Subject: Re: [v2 01/17] ASoC: mediatek: mt6366: add codec driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <perex@perex.cz>, <p.zabel@pengutronix.de>,
 <geert+renesas@glider.be>, <trevor.wu@mediatek.com>, <tzungbi@google.com>,
 <aaronyu@google.com>, <zhangqilong3@huawei.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Sat, 5 Mar 2022 12:24:57 +0800
In-Reply-To: <b22976ee-6426-cabf-f153-fbe093611e97@collabora.com>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-2-jiaxin.yu@mediatek.com>
 <b22976ee-6426-cabf-f153-fbe093611e97@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_202525_069699_950E22CF 
X-CRM114-Status: GOOD (  22.17  )
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

On Fri, 2022-02-18 at 15:54 +0100, AngeloGioacchino Del Regno wrote:
> Il 17/02/22 14:41, Jiaxin Yu ha scritto:
> > Mt6366 is a new version of mt6358, and they are same about audio
> > part.
> > So we can reuse the driver of mt6358.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> 
> Hello Jiaxin,
> I'm sorry but this commit makes very little sense.
> 
> If you want to advertise MT6366 support, please write a note and/or
> a new compatible string inside of the mt6358 driver (and dt-
> bindings),
> then, please drop this commit.
> 

Hello angelogioacchino,

Thank you for your advice.

If I add a new compatible string inside of the mt6358 driver and dt-
bindings, then the machine driver which want to use mt6366 should
select SND_SOC_MT6358.

like below:

config SND_SOC_MT8186_MT6366_DA7219_MAX98357
	tristate "ASoC Audio driver for MT8186 with DA7219 MAX98357A
codec"
 	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8186 && MTK_PMIC_WRAP
 	select SND_SOC_MT6366   ==> SND_SOC_MT6358
	...

I just doubt it's enough to make sense. I originally wanted to put this
relationship in the sound/soc/codecs layer. So that this relationship
is not perceived by users(machine driver).
However, if the general practice is like this, I will adopt your
suggestion. Thank you again.

> 
> > ---
> >   sound/soc/codecs/Kconfig  | 8 ++++++++
> >   sound/soc/codecs/Makefile | 1 +
> >   2 files changed, 9 insertions(+)
> > 
> > diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> > index 8fa24783ce01..6631094678f5 100644
> > --- a/sound/soc/codecs/Kconfig
> > +++ b/sound/soc/codecs/Kconfig
> > @@ -132,6 +132,7 @@ config SND_SOC_ALL_CODECS
> >   	imply SND_SOC_MT6351
> >   	imply SND_SOC_MT6358
> >   	imply SND_SOC_MT6359
> > +	imply SND_SOC_MT6366
> >   	imply SND_SOC_MT6660
> >   	imply SND_SOC_NAU8315
> >   	imply SND_SOC_NAU8540
> > @@ -1888,6 +1889,13 @@ config SND_SOC_MT6359_ACCDET
> >   	  for ASoC codec soc-jack detection mechanism.
> >   	  Select N if you don't have jack on board.
> >   
> > +config SND_SOC_MT6366
> > +	tristate "MediaTek MT6366 Codec"
> > +	depends on MTK_PMIC_WRAP
> > +	help
> > +	  Enable support for the platform which uses MT6366 as
> > +	  external codec device.
> > +
> >   config SND_SOC_MT6660
> >   	tristate "Mediatek MT6660 Speaker Amplifier"
> >   	depends on I2C
> > diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> > index 42d00aa4ee46..1279684feaf0 100644
> > --- a/sound/soc/codecs/Makefile
> > +++ b/sound/soc/codecs/Makefile
> > @@ -465,6 +465,7 @@ obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-
> > mt6351.o
> >   obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
> >   obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
> >   obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
> > +obj-$(CONFIG_SND_SOC_MT6366)	+= snd-soc-mt6358.o
> >   obj-$(CONFIG_SND_SOC_MT6660)	+= snd-soc-mt6660.o
> >   obj-$(CONFIG_SND_SOC_NAU8315)   += snd-soc-nau8315.o
> >   obj-$(CONFIG_SND_SOC_NAU8540)   += snd-soc-nau8540.o
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
