Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6FFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 15:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEJutGurVYq9V1AyldYdRkA26U9OmW3/MFJMC9WuzKI=; b=t36lobh9LTpZJI
	pR1wFPF+YcOX+BJXtgXLIpMeJvAVYL+Hp/JvOkotUVq8fW77VEpDI5YwXFFWdJKsCHTe2nrsTaRBl
	fP37JBlBlUjCRc3mMv2kyvoHtAu+yJawHFZUbj/lW1yXjipj+tz2mh25EADorrCFY+EyZooqe/wdy
	U8sOWkbtn/4/1mJHHA6qVsBwfkwIyF2nvdwtlcp/e0M2cJF0+rLCwgMhw8Pb27yWbbKyS4mTwwavA
	cKHF7hs+VbR7vO6l+EkmvwepHfGyb87/95hgGRJwnAgRMInSkyayF1Qg2dGyN5kAOJPY2FXmHWZ0G
	Gmem3al6wDVxIu03ixcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWJib-0087jB-Q5; Mon, 21 Mar 2022 15:13:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWJiN-0087cb-N3; Mon, 21 Mar 2022 15:13:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 543AFB8170A;
 Mon, 21 Mar 2022 15:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8905C340E8;
 Mon, 21 Mar 2022 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647875577;
 bh=ipkgJQjf5K2R+S1QsRulpTCFGjeQCivNGHqHR4lHm5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NlAnS+O1h0ZwjtCK+NlIhwFXGU5XDIfc6JGdZ3urIL2RJgtikmxARsu5T/xn2sG44
 +sMa8uQKAJl5lDfb0Gtk130vRqiUiPP4k7Ew+S0s4pW6avdeWP4xku+nyMuhTN2Rmp
 iPSaHZ/oH4lRowbTla4PbRXLvuADQ/+xfZAP3HMpj7TQNLOIM2sr1tYVt+2Vt7cOKO
 fY2tr+LI2U4d3OjryhCDpf+ExYtyfDMrOm2C/W/LtZRXW0qUNsEhHhU0rpggDyVl5b
 yPNWxbwu/5SL1vBKAPkQ5TKZrNkyEeob1ohw/VLGf7GFhUoKlpm7JKIIKcT3ys79Cl
 yMdFEDZAz58Qw==
Date: Mon, 21 Mar 2022 23:12:52 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com,
 angelogioacchino.delregno@collabora.com, yc.hung@mediatek.com
Subject: Re: [PATCH v3 5/6] ASoC: mediatek: mt8195: add machine support for
 max98390 and rt5682
Message-ID: <YjiV9DfLC7T1uweb@google.com>
References: <20220321072312.14972-1-trevor.wu@mediatek.com>
 <20220321072312.14972-6-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321072312.14972-6-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_081259_927353_D813E4ED 
X-CRM114-Status: GOOD (  10.98  )
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

On Mon, Mar 21, 2022 at 03:23:11PM +0800, Trevor Wu wrote:
> diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
[...]
>  #define RT1011_SPEAKER_AMP_PRESENT		BIT(0)
>  #define RT1019_SPEAKER_AMP_PRESENT		BIT(1)
> +#define MAX98390_SPEAKER_AMP_PRESENT		BIT(2)
> +
> +#define MAX98390_CODEC_DAI	"max98390-aif1"
> +#define MAX98390_DEV0_NAME	"max98390.2-0038" /* right */
> +#define MAX98390_DEV1_NAME	"max98390.2-0039" /* left */
>  
>  #define RT1011_CODEC_DAI	"rt1011-aif"
>  #define RT1011_DEV0_NAME	"rt1011.2-0038"

The quirk bit order: RT1011, RT1019, and MAX98390.  To be neat, move
MAX98390_CODEC_DAI, MAX98390_DEV0_NAME, and MAX98390_DEV1_NAME after
RT1019_DEV0_NAME to maintain the order.

> +static int mt8195_max98390_init(struct snd_soc_pcm_runtime *rtd)
[...]
> +
> +	ret = snd_soc_dapm_add_routes(&card->dapm, mt8195_max98390_routes,
> +				      ARRAY_SIZE(mt8195_max98390_routes));
> +
> +	if (ret)

Remove the extra blank line.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
