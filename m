Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40F3C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 17:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAXWficdb5Gh5FzYn9UMAwDhZ8CYJoMoqCIJ7//eDF4=; b=BdDKOiVOgpnEqq7tWu7Plla6Xz
	POf3KCvbMBuWPni3m2PqMOsKVW0YXYoh6EhSJViRyyHbaFvxq6tWECQHBUIxz7f0q0D5bmk+d0Uht
	TQrPljzFZOGfFmvhtdfUUkIh6I1WJtqp6fIXMTB4cqKofgYCANt0WsVZSL2qQdJePMC5O0kp5EmdR
	KusHqRZx1q/Xa1zBrD9XD7AypblF9VA/jlTFA73M7V01iie39WjZWC4gXYmjmgNQBQMRMBE6RdUir
	5mh2KR5WKpt25o3qiD9KOXFyy+tlJItMij1MGuO8lNk7ynu1fsAtNBzcQkVRyBuu2Q6Yo3hJ5y9C4
	QoutpClQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p041W-00AMek-EX; Tue, 29 Nov 2022 17:03:58 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p041B-00AMVh-RF
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 17:03:39 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-141ca09c2fbso17778069fac.6
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 09:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bAXWficdb5Gh5FzYn9UMAwDhZ8CYJoMoqCIJ7//eDF4=;
        b=ljTM73sTaDXWg3oaSywePDjqX298nSKxGHlaRqrv/LsDQrh3Mk9juSNxGkuzLumWxy
         /O1+AvGM4FAywdTpyxCQGuYt9iKWmSXYzMbOF8AqODsFHqIaEIKHAcDeYgoOxqm3Fr4o
         TBRSen1aQi9VAoZMPuBILu+kBDk8UQm+R3FRy3pdzsmnDkxBuftdOqpEmxAanK+Th54j
         b8OVtjKBlDakl7FEtLr3q1dHi6yezL2+/uByMQUdbFwTiXZVM3v9O0eFVdNSo9ZoknNt
         vw3QrBqFV9EaNlDr4769W5eAGUfmEToEGJFnua/uUW+Qw2+N1owsFPR77QI/qPD9Wf6L
         rAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAXWficdb5Gh5FzYn9UMAwDhZ8CYJoMoqCIJ7//eDF4=;
        b=Nb25TmmXqy4nw29aRtXSCr1cqw9EdmSIdLoK+Vi1lDhPGqA3lzUfvSQwYWYAw9qfEO
         y0sCNq2tGYYnxPK6T31QetxM7w9IE3Hrt+BwlD7OMUO538+nHYb3l1aPCBCNHt5rxPy1
         QTZL7UauF8flidqnp0T37mSxjbXlvs6ok9qWEnjxQsQ0R6x+8UX7AZZ4cVmAkClJRob3
         D+GL4TXrLMS/Of34bCknlcwxWebWjGg6IYWsSzxbTh+RwvHEPGt2h+wBt6RoqRYxfyva
         3n06vxtUqM2ekX8vqiinE9Ia/1E6XastuMD77Nr23DM5iTFVYb6gBdNt2kEtQ84hG+DD
         eXgw==
X-Gm-Message-State: ANoB5pm1jbwhDSpvUoNWdxmir73g2OzCtQvYTK7stGWFosPgrwkN9Feb
	2tk+QVfnQ7dPW+iXv7yfRT0QjTMza6K4w3MqwyM3vQ==
X-Google-Smtp-Source: AA0mqf6Tdo6X8IWcObQq2o/3ErG6HPcwPrWCjYttmbMFTp3CWvG1wKOXHHCA+4UMzfOIMYG1UrxXlV2FAe3l3HjF3RI=
X-Received: by 2002:a05:6870:7988:b0:13c:84e6:96d2 with SMTP id
 he8-20020a056870798800b0013c84e696d2mr36802093oab.72.1669741416887; Tue, 29
 Nov 2022 09:03:36 -0800 (PST)
MIME-Version: 1.0
References: <20221124085436.24900-1-jiaxin.yu@mediatek.com> <20221124085436.24900-3-jiaxin.yu@mediatek.com>
In-Reply-To: <20221124085436.24900-3-jiaxin.yu@mediatek.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 29 Nov 2022 18:03:26 +0100
Message-ID: <CAG3jFyvLAHfxtKVoFFUOwUacO+t+FC3x5J9Eg-qWOUVBnU8JfQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: hdmi-codec: Add event handler for hdmi TX
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	Laurent.pinchart@ideasonboard.com, kuninori.morimoto.gx@renesas.com, 
	angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, 
	chunxu.li@mediatek.com, ajye_huang@compal.corp-partner.google.com, 
	allen-kh.cheng@mediatek.com, dri-devel@lists.freedesktop.org, 
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_090337_958190_F9794F9D 
X-CRM114-Status: GOOD (  24.17  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 24 Nov 2022 at 09:54, Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> If the speaker and hdmi are connect to the same port of I2S,
> when try to switch to speaker playback, we will find that hdmi
> is always turned on automatically. The way of switching is
> through SOC_DAPM_PIN_SWITCH, however, such events can not be
> handled in hdmi-codec driver.
>
> So add event handler for hdmi TX to solve the above issue.
>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  include/sound/hdmi-codec.h    |  6 ++++++
>  sound/soc/codecs/hdmi-codec.c | 37 +++++++++++++++++++++++++++++++----
>  2 files changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
> index 48ad33aba393..dcbc09254144 100644
> --- a/include/sound/hdmi-codec.h
> +++ b/include/sound/hdmi-codec.h
> @@ -81,6 +81,12 @@ struct hdmi_codec_ops {
>                        struct hdmi_codec_daifmt *fmt,
>                        struct hdmi_codec_params *hparms);
>
> +       /*
> +        * PCM trigger callback.
> +        * Mandatory
> +        */
> +       int (*trigger)(struct device *dev, int cmd);
> +
>         /*
>          * Shuts down the audio stream.
>          * Mandatory
> diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
> index 0b1cdb2d6049..cb4479372e09 100644
> --- a/sound/soc/codecs/hdmi-codec.c
> +++ b/sound/soc/codecs/hdmi-codec.c
> @@ -276,7 +276,31 @@ struct hdmi_codec_priv {
>         u8 iec_status[AES_IEC958_STATUS_SIZE];
>  };
>
> +static int hdmi_tx_event(struct snd_soc_dapm_widget *w,
> +               struct snd_kcontrol *kcontrol, int event)

checkpatch --strict caught this alignment issue.

ASoC: hdmi-codec: Add event handler for hdmi TX
-:44: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#44: FILE: sound/soc/codecs/hdmi-codec.c:280:
+static int hdmi_tx_event(struct snd_soc_dapm_widget *w,
+        struct snd_kcontrol *kcontrol, int event)



> +{
> +       struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +       struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               if (hcp->hcd.ops->trigger)
> +                       hcp->hcd.ops->trigger(component->dev->parent, SNDRV_PCM_TRIGGER_START);
> +               break;
> +       case SND_SOC_DAPM_POST_PMD:
> +               if (hcp->hcd.ops->trigger)
> +                       hcp->hcd.ops->trigger(component->dev->parent, SNDRV_PCM_TRIGGER_STOP);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
>  static const struct snd_soc_dapm_widget hdmi_widgets[] = {
> +       SND_SOC_DAPM_OUT_DRV_E("SDB", SND_SOC_NOPM, 0, 0, NULL, 0, hdmi_tx_event,
> +                              SND_SOC_DAPM_POST_PMD | SND_SOC_DAPM_PRE_PMU),
>         SND_SOC_DAPM_OUTPUT("TX"),
>         SND_SOC_DAPM_OUTPUT("RX"),
>  };
> @@ -808,18 +832,23 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
>         struct hdmi_codec_daifmt *daifmt;
>         struct snd_soc_dapm_route route[] = {
>                 {
> -                       .sink = "TX",
> +                       .sink = dai->driver->capture.stream_name,
> +                       .source = "RX",
> +               },
> +               {
> +                       .sink = "SDB",
>                         .source = dai->driver->playback.stream_name,
>                 },
>                 {
> -                       .sink = dai->driver->capture.stream_name,
> -                       .source = "RX",
> +                       .sink = "TX",
> +                       .source = "SDB",
>                 },
> +
>         };
>         int ret;
>
>         dapm = snd_soc_component_get_dapm(dai->component);
> -       ret = snd_soc_dapm_add_routes(dapm, route, 2);
> +       ret = snd_soc_dapm_add_routes(dapm, route, ARRAY_SIZE(route));
>         if (ret)
>                 return ret;
>
> --
> 2.18.0
>

