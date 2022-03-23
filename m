Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347FBC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 07:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6CwUfR7qzwTI01PkoiLO+yq6W5rX5YUQB8YjggPGCiE=; b=KaC8nHd/mQJkXl
	YItFRQBf6yUxoFebYDliGPHGTC3Jvx6cClsgEdEgAaJ3r+SyyEvYaBXAc8FEaayFc3HdT14q6ef3t
	s7nEgeEF3R+jOW+oFEANX/SyuQCcG7RKhtUWKgx8zzRCLZWkQ9azce2vFwEpGrikMujPJgXt/v5yb
	BzhsO/H+eaRH+2dxaLvAYIB124DTT4qgoWdr3bhhDwhKEeH33I8WY7MpeDtxnvhurgmUYaqWit5RB
	QqqbTrcJh2vyhwxuCvrgO5BbJ+AoPiFuqVeMLzsoOn+GygdBAHJL9O/Y67Dvj+Gc7i8UFzlfXKF+S
	N1IVi5kaMahL3IQe32IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWvR1-00Czpa-SO; Wed, 23 Mar 2022 07:29:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWvQp-00CzmT-V3; Wed, 23 Mar 2022 07:29:25 +0000
X-UUID: b314431b42654859aa78f62631613c89-20220323
X-UUID: b314431b42654859aa78f62631613c89-20220323
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1990387019; Wed, 23 Mar 2022 00:29:20 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 00:29:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 15:29:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 15:29:17 +0800
Message-ID: <08e3059ab5d645de0544e600b1bf85c95478e897.camel@mediatek.com>
Subject: Re: [PATCH v3 5/6] ASoC: mediatek: mt8195: add machine support for
 max98390 and rt5682
From: Trevor Wu <trevor.wu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <aaronyu@google.com>, <angelogioacchino.delregno@collabora.com>,
 <yc.hung@mediatek.com>
Date: Wed, 23 Mar 2022 15:29:17 +0800
In-Reply-To: <YjiV9DfLC7T1uweb@google.com>
References: <20220321072312.14972-1-trevor.wu@mediatek.com>
 <20220321072312.14972-6-trevor.wu@mediatek.com>
 <YjiV9DfLC7T1uweb@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_002924_040394_ADC2F86C 
X-CRM114-Status: GOOD (  13.13  )
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

On Mon, 2022-03-21 at 23:12 +0800, Tzung-Bi Shih wrote:
> On Mon, Mar 21, 2022 at 03:23:11PM +0800, Trevor Wu wrote:
> > diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> > b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> 
> [...]
> >  #define RT1011_SPEAKER_AMP_PRESENT		BIT(0)
> >  #define RT1019_SPEAKER_AMP_PRESENT		BIT(1)
> > +#define MAX98390_SPEAKER_AMP_PRESENT		BIT(2)
> > +
> > +#define MAX98390_CODEC_DAI	"max98390-aif1"
> > +#define MAX98390_DEV0_NAME	"max98390.2-0038" /* right */
> > +#define MAX98390_DEV1_NAME	"max98390.2-0039" /* left */
> >  
> >  #define RT1011_CODEC_DAI	"rt1011-aif"
> >  #define RT1011_DEV0_NAME	"rt1011.2-0038"
> 
> The quirk bit order: RT1011, RT1019, and MAX98390.  To be neat, move
> MAX98390_CODEC_DAI, MAX98390_DEV0_NAME, and MAX98390_DEV1_NAME after
> RT1019_DEV0_NAME to maintain the order.

OK. I will reorder the sequence in v4.

> 
> > +static int mt8195_max98390_init(struct snd_soc_pcm_runtime *rtd)
> 
> [...]
> > +
> > +	ret = snd_soc_dapm_add_routes(&card->dapm,
> > mt8195_max98390_routes,
> > +				      ARRAY_SIZE(mt8195_max98390_routes
> > ));
> > +
> > +	if (ret)
> 
> Remove the extra blank line.

OK. I will remove it in v4.

Thanks,
Trevor


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
