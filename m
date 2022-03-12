Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23AEC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Mar 2022 16:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7KR1ywe4i6M9cn1t38SgIC4qKA5+JMxx17F8JIRRzM=; b=pTYS+QO/Zb4vjj
	MM5d6F7ziWHRNXjAu2ELI6MEbYFWR/NlaC4kvTvPalpcrZrexNZFI8SnYEPgA4gDW+WEzSuVw3yPE
	aTrGc2Y3iC8g2CaIbX/dqGn8zLHe5GUqltkCal4jvZKKAVOQQWNrDhVH5CUtKGRFzyrYWme0vBExU
	QjXW4eV2zYTQtxK4/OrR/fW56t9Daoyrc1wTrPHKMXSXgKe1JipjJVYqLF/8vDhFXPHks/plGcaHP
	APRu176FrIi77Hvh09TuSIed2+PF8Nne2vi4AgrvhT+jbBIrLlL/x2ZOpHsIQyUWylmKKPQ5vbfvE
	xG7cgTHS95vnsrzfqZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nT4SI-001aCn-Mf; Sat, 12 Mar 2022 16:18:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nT4S6-001aAf-N9; Sat, 12 Mar 2022 16:18:48 +0000
X-UUID: b09c15102b224b0e8b0e7340366d3dcf-20220312
X-UUID: b09c15102b224b0e8b0e7340366d3dcf-20220312
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 233030769; Sat, 12 Mar 2022 09:18:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Mar 2022 08:18:35 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Mar 2022 00:18:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 13 Mar 2022 00:18:34 +0800
Message-ID: <5fafa7d8a23fbdce82272529d817816f42c4ac37.camel@mediatek.com>
Subject: Re: [PATCH 4/5] ASoC: mediatek: mt8195: add machine driver with
 mt6359, max98390 and rt5682
From: Trevor Wu <trevor.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <aaronyu@google.com>, <yc.hung@mediatek.com>
Date: Sun, 13 Mar 2022 00:18:34 +0800
In-Reply-To: <e812796f-6b9b-fe9d-50a7-b681d7b174fd@collabora.com>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-5-trevor.wu@mediatek.com>
 <e812796f-6b9b-fe9d-50a7-b681d7b174fd@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220312_081846_802839_D93B9EE9 
X-CRM114-Status: GOOD (  24.56  )
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

On Thu, 2022-03-10 at 16:21 +0100, AngeloGioacchino Del Regno wrote:
> Il 08/03/22 08:24, Trevor Wu ha scritto:
> > This patch adds support for mt8195 board with mt6359, max98390 and
> > rt5682.
> > 
> > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> 
> Hello Trevor,
> thanks for the patch! However, there's something to improve...
> 
> > ---
> >   sound/soc/mediatek/Kconfig                    |   16 +
> >   sound/soc/mediatek/mt8195/Makefile            |    5 +
> >   .../mt8195/mt8195-mt6359-max98390-rt5682.c    | 1058
> > +++++++++++++++++
> >   3 files changed, 1079 insertions(+)
> >   create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-
> > max98390-rt5682.c
> >   
> > 

[...]
> > +
> > +static const struct snd_soc_dapm_widget
> > +	mt8195_mt6359_max98390_rt5682_widgets[] = {
> > +	SND_SOC_DAPM_SPK("Left Speaker", NULL),
> > +	SND_SOC_DAPM_SPK("Right Speaker", NULL),
> > +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> 
> We can at least partially reuse existing UCM2 configuration if you
> slightly change the names for these controls.
> 

I don't know what the UCM2 configuration means.
Could you give me more information?


> Specifically, MAX98090 (yes I know it's a different codec) has names
> "Speaker Left", "Speaker Right" instead, we will be able to at least
> partially reuse these (or get uniform naming, which is still good).
> As for the "Headphone Jack", it's simply "Headphone".
> 
> Please note that the actual control names in userspace will be,
> exactly,
> 
> "Speaker Left Switch", "Speaker Right Switch",
> "Headphone Left Switch", "Headphone Right Switch"...
> 
> ....where "Switch" gets automatically appended because of the control
> type.
> 
> > +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> 
> This "Headset Mic" name is fine.
> 
> > +	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
> > +	SND_SOC_DAPM_MIXER(SOF_DMA_DL3, SND_SOC_NOPM, 0, 0, NULL, 0),
> > +	SND_SOC_DAPM_MIXER(SOF_DMA_UL4, SND_SOC_NOPM, 0, 0, NULL, 0),
> > +	SND_SOC_DAPM_MIXER(SOF_DMA_UL5, SND_SOC_NOPM, 0, 0, NULL, 0),
> > +};
> > +
[...]
> > +
> > +static struct snd_soc_dai_link
> > mt8195_mt6359_max98390_rt5682_dai_links[] = {
> 
> 
> ... again, different name, same contents ...
> 
> 
> And I won't go on repeating the same thing over and over again.
> I think that the best idea here is to either create a mt8195-mt6359-
> rt5682-common.c
> file, or to rename the others to something else and get them all in
> the same file.
> 
> 
> Regards,
> Angelo

Hi Angelo,

Thanks for your review.
Please forgive me for deleting some comments above.
I totally agree that most code can be reused.
I will try revising and merging all mt8195 machine drivers in a file.

Thanks,
Trevor


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
