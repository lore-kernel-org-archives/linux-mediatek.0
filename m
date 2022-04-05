Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF68C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 03:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=og5tU6UGDcsdkg4AG56noRzze5tCbyYsQ9kooQiGbBY=; b=Q9m7KO/0BIxB+P
	FpknvPWiMc2YtRnSAqNNBeBkrxUiQ6tbovaSPrJqIJE7POJF5rUaYjjmSFyZr+3pFvzds/90R1pCX
	Zacwh6LVYNG/bSAOCT14XvZAdLAkK7GQpF8vn9BxVH5ATQ7UORDCT3f4IGYc31sZ2BpxuFAnwEf18
	4fa0YzTlxs2DWl2QdQ7ex5riC7qAko4pI26xw4K3iFHEt6Mf3NdP/YKbGJLdSbWds3oT7343Chvzf
	OcoEvLVUynd4yNSLHLao/RYuDsUyDJNHc640igg+OkglNW2z5zlTOsm5H5yly7dwgDlcJFyWAKoMM
	4E73w9Aq0CTlhDAxYY3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbZV9-00GyNF-TO; Tue, 05 Apr 2022 03:05:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbZV6-00GyLo-RH; Tue, 05 Apr 2022 03:05:02 +0000
X-UUID: 6dbb21bc0d714c6e95b7b28bb114b336-20220404
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6tAGoS+t9yvOuxeUIa9VpgPyXacp7ciji5OfG8stKHU=; 
 b=eW9w7t28XrZlFa7o71ttJ0eZObaBn4XB/XPfOB4NCqxlXJdbP70lJw+IM3rtQyPaLDu09xvwdiM/v/S1N4Lo4moQGKPMjPJu3Glj2GbqBIFaOoqHqmbE9bIv03HjtaJou0jNgOEs97wmuVVxubJcCh650wip/ZrpQQBl8IdK4R8=;
X-UUID: 6dbb21bc0d714c6e95b7b28bb114b336-20220404
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1135202893; Mon, 04 Apr 2022 20:04:51 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Apr 2022 20:04:49 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 5 Apr 2022 11:04:41 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Apr 2022 11:04:40 +0800
Message-ID: <808d08a6dbbca1c0f1699643deb52b71b8b74669.camel@mediatek.com>
Subject: Re: [v3 19/19] ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>
CC: <aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, 
 <tzungbi@google.com>, <julianbraha@gmail.com>,
 <alsa-devel@alsa-project.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 5 Apr 2022 11:04:33 +0800
In-Reply-To: <a497b403-5b20-9a2f-498e-b43727b26675@collabora.com>
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-20-jiaxin.yu@mediatek.com>
 <a497b403-5b20-9a2f-498e-b43727b26675@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_200501_086515_87F7292D 
X-CRM114-Status: GOOD (  17.08  )
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

On Mon, 2022-03-14 at 11:18 +0100, AngeloGioacchino Del Regno wrote:
> Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> > This fixes the following build errors when mt6358 is configured as
> > module:
> > 
> > > > ERROR: modpost: "mt6358_set_mtkaif_protocol"
> > > > [sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.ko]
> > > > undefined!
> > > > ERROR: modpost: "mt6358_set_mtkaif_protocol"
> > > > [sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.ko]
> > > > undefined!
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> 
> Hello Jiaxin,
> 
> Can you please add a Fixes tag to this patch and send it separately
> from
> the MT8186 series?
> 
> After adding the Fixes tag:
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> Thanks,
> Angelo
> 

Hello, Angelo

Sorry for the late reply. I've sent this out separately.

Link: 
https://lore.kernel.org/lkml/20220319120325.11882-1-jiaxin.yu@mediatek.com/

> > ---
> >   sound/soc/codecs/mt6358.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
> > index 1fdd2f8cf877..61f2a7632fd4 100644
> > --- a/sound/soc/codecs/mt6358.c
> > +++ b/sound/soc/codecs/mt6358.c
> > @@ -107,6 +107,7 @@ int mt6358_set_mtkaif_protocol(struct
> > snd_soc_component *cmpnt,
> >   	priv->mtkaif_protocol = mtkaif_protocol;
> >   	return 0;
> >   }
> > +EXPORT_SYMBOL_GPL(mt6358_set_mtkaif_protocol);
> >   
> >   static void playback_gpio_set(struct mt6358_priv *priv)
> >   {
> > @@ -273,6 +274,7 @@ int mt6358_mtkaif_calibration_enable(struct
> > snd_soc_component *cmpnt)
> >   			   1 << RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_SFT);
> >   	return 0;
> >   }
> > +EXPORT_SYMBOL_GPL(mt6358_mtkaif_calibration_enable);
> >   
> >   int mt6358_mtkaif_calibration_disable(struct snd_soc_component
> > *cmpnt)
> >   {
> > @@ -296,6 +298,7 @@ int mt6358_mtkaif_calibration_disable(struct
> > snd_soc_component *cmpnt)
> >   	capture_gpio_reset(priv);
> >   	return 0;
> >   }
> > +EXPORT_SYMBOL_GPL(mt6358_mtkaif_calibration_disable);
> >   
> >   int mt6358_set_mtkaif_calibration_phase(struct snd_soc_component
> > *cmpnt,
> >   					int phase_1, int phase_2)
> > @@ -310,6 +313,7 @@ int mt6358_set_mtkaif_calibration_phase(struct
> > snd_soc_component *cmpnt,
> >   			   phase_2 << RG_AUD_PAD_TOP_PHASE_MODE2_SFT);
> >   	return 0;
> >   }
> > +EXPORT_SYMBOL_GPL(mt6358_set_mtkaif_calibration_phase);
> >   
> >   /* dl pga gain */
> >   enum {
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
