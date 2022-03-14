Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C48C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GI02Ql5p5tpvst7vroHWhgKJFkF4Ohb4gEC+juFcMnU=; b=nECE8ZXDKv9uy6
	0I2s7w35Qvm5+mzVOCreOQkuIc1dGafodm3VeWSAYsVAluBl7LIfB6gdURUlr+D+PUrcB5cCY3waE
	f3KzeJxKszdhhqnFeQ2xEMOCKnVRAVFysaUUktB+sV/Uc4ym+6TRu6IlslonUlaVOQOncWYkmBg5E
	BEJKDd6ur7v92BSl/aRao72MQ7YGnK3dnx9e+GTAaKxt6UC3M4KAwqTGQPuoX4jV+r+vW3DcoLG+f
	KdbIBZ+B9Tw9JbCQe0nOJCE+IyHs0vysK+zhoNHE7iMOVVwDvBmCFVpP4K+Z2zjQDc8WHSa7frAhJ
	8MNXGfTF1HEt9sLNpnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nThmP-004uGf-LN; Mon, 14 Mar 2022 10:18:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nThmB-004uBJ-Fg; Mon, 14 Mar 2022 10:18:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 503631F43E42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647253086;
 bh=nQGCEaQV4SSt7P7Vs4H6IutV6PQurOMGF3CTakySQ4Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dZPSbnMF4ru8XqiTI61+q3Z0UEJ7yUYvUGIdlnPn8gD/ZAKNSSa9xQKI6cEe39jCT
 yEn5aSAbkzH4PgPoFNVjWXMx09Knhf/u9WT41z1wMPWXxjAl4e34+gi2RL4gFrD4ZF
 sm5PKK1jQRFrwxhYg95pzkz9pL9aQgrB/SAjl1aAfSA7ClNhLIOX0G2TNkoHbmfr5s
 hckhD84BpWv2LmD71gMNYe8wiqVfNke5nffD8VZHRQIGarIxuTViBB3NTIBi+8iTt2
 aFhq4s1Rrx2Iby/cyGUWO9kkNZaaRVmFoMBdHRzILvvqZNzd5njH38XEpiJU3I0H9V
 jiA5EFb9NLzHQ==
Message-ID: <a497b403-5b20-9a2f-498e-b43727b26675@collabora.com>
Date: Mon, 14 Mar 2022 11:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 19/19] ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-20-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-20-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_031807_720975_CF752677 
X-CRM114-Status: GOOD (  14.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> This fixes the following build errors when mt6358 is configured as module:
> 
>>> ERROR: modpost: "mt6358_set_mtkaif_protocol"
>>> [sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.ko] undefined!
>>> ERROR: modpost: "mt6358_set_mtkaif_protocol"
>>> [sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.ko] undefined!
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Hello Jiaxin,

Can you please add a Fixes tag to this patch and send it separately from
the MT8186 series?

After adding the Fixes tag:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks,
Angelo

> ---
>   sound/soc/codecs/mt6358.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
> index 1fdd2f8cf877..61f2a7632fd4 100644
> --- a/sound/soc/codecs/mt6358.c
> +++ b/sound/soc/codecs/mt6358.c
> @@ -107,6 +107,7 @@ int mt6358_set_mtkaif_protocol(struct snd_soc_component *cmpnt,
>   	priv->mtkaif_protocol = mtkaif_protocol;
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(mt6358_set_mtkaif_protocol);
>   
>   static void playback_gpio_set(struct mt6358_priv *priv)
>   {
> @@ -273,6 +274,7 @@ int mt6358_mtkaif_calibration_enable(struct snd_soc_component *cmpnt)
>   			   1 << RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_SFT);
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(mt6358_mtkaif_calibration_enable);
>   
>   int mt6358_mtkaif_calibration_disable(struct snd_soc_component *cmpnt)
>   {
> @@ -296,6 +298,7 @@ int mt6358_mtkaif_calibration_disable(struct snd_soc_component *cmpnt)
>   	capture_gpio_reset(priv);
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(mt6358_mtkaif_calibration_disable);
>   
>   int mt6358_set_mtkaif_calibration_phase(struct snd_soc_component *cmpnt,
>   					int phase_1, int phase_2)
> @@ -310,6 +313,7 @@ int mt6358_set_mtkaif_calibration_phase(struct snd_soc_component *cmpnt,
>   			   phase_2 << RG_AUD_PAD_TOP_PHASE_MODE2_SFT);
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(mt6358_set_mtkaif_calibration_phase);
>   
>   /* dl pga gain */
>   enum {


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
