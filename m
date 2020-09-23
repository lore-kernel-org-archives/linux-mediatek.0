Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E51C4363D
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 06:35:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 473EC21D43
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 06:35:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hse5qKw0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qt4u0jAO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 473EC21D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r1a34EiANu1y0/BSBCRjS3+ZkOdq5s+Z7XA+psZOzxA=; b=Hse5qKw0GZeCiuzoE7CLuP6uL
	pLHKGh/qsER5lXzastsvd723EN9jLDxkJvBxU93gWiC+dIhpbWlBdzCxUFJ+zgBTICJ1b/9Q/P+vh
	igiU8SqqoXNXTMx2AvdZMiJgfXHZY4u4MA52awGKhKKN2kKEnnGVeuIlLOEUK5UivRbxE/3LwjV/E
	xblfiYUcU5f+jy1VYuhvWZ/Ji/8TYRVQPgk94sUsZLo1nXe4TN3pwdVI9RYCwJ+StxfsNRO72ZUEK
	1CFakm+iZTnIehn9iVrrtBsquh/BAFcIa8jy9QcrgQS5l7WGxHXvWSXAR7bsJwCWCwu3pOCi/Q42o
	INwHcEfdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKyMg-0007PU-H6; Wed, 23 Sep 2020 06:34:54 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKyMM-0007Ec-4i
 for linux-mediatek@lists.infradead.org; Wed, 23 Sep 2020 06:34:35 +0000
Received: by mail-ej1-x641.google.com with SMTP id o8so26143473ejb.10
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2020 23:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MJXfV81t/sXYl4JgftuDRtEbB8599Smh1I+VQSzWSeE=;
 b=Qt4u0jAOa3Xtg8NwEC6733GHoTotQMbK+cv3/dl/9k9bmkFORy7UNm2RRRuEt3fUDp
 mpEQo7f9MlB3ipYPGQCtiEFuRB5Z100GHmmKLQxZH5b78903jGBatxea2H81tGXJ/2JQ
 lsag7Ig3ErS1ZZMLOiM0dVIERN6W+X3mn3tvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJXfV81t/sXYl4JgftuDRtEbB8599Smh1I+VQSzWSeE=;
 b=iRq/kOuNTRPRKX0XGlqK1bzp9XBVP92PIfpP6/OM5KrOyOz/w36UQ8kv3EIWREbomx
 fCTkl8kOpafrAWUYfAIKdZdn20KMO+j7BprrINI/N3YfinQw3hb90XTGqlxAghid+L3P
 jlJdAg7H+jvBBDPkmL8ovxqmn4KZV1oGrIpfuPLZyVvFfaP0xs4se2ncWiuIvCOxhrih
 oXZRUjCFCFXBnDpUOdiMfkuglvBcIrBy4xANVIYBnnyyFccYpLMUge1FIrzr+V4Sh/jG
 1Fr+mZXgIIglcjTo0lS2rydKklQqwkMdiUBQ5jg2R59zoCpaAT8NtKU2mhOQb+NQdnuM
 pK4g==
X-Gm-Message-State: AOAM530aTAakbFs2+w7C6MVGtiM0rs0rgLivXTNTOfDlxFvQPCxWhAlE
 sWVzT3BvJvaHBiDBqW7zawwOT6M53eNaRIhExz8B8g==
X-Google-Smtp-Source: ABdhPJxVp0i9LV/h1/bBJ7dAOqBc+Foo/bYGPSvrZYzkvDkdDb8Y/5tW5bGvpIFjzyKvdVgsVvpISbgglQCSu2pQ6Yg=
X-Received: by 2002:a17:906:4c81:: with SMTP id
 q1mr8550168eju.72.1600842871347; 
 Tue, 22 Sep 2020 23:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200904021029.365700-1-allen.chen@ite.com.tw>
In-Reply-To: <20200904021029.365700-1-allen.chen@ite.com.tw>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Wed, 23 Sep 2020 14:33:55 +0800
Message-ID: <CANdKZ0erkp_S-K_QpH-9dvEDR9THypLxTT3s+0aZQUaNDoZM-w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: add it6505 driver
To: allen <allen.chen@ite.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_023434_364084_1DEFF2B3 
X-CRM114-Status: GOOD (  21.79  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>, Jitao Shi <jitao.shi@mediatek.com>,
 kernel test robot <lkp@intel.com>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Yilun Lin <yllin@google.com>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 4, 2020 at 10:17 AM allen <allen.chen@ite.com.tw> wrote:
>
> This adds support for the iTE IT6505.
> This device can convert DPI signal to DP output.
>
> From: Allen Chen <allen.chen@ite.com.tw>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Signed-off-by: Yilun Lin <yllin@google.com>
> Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig      |    7 +
>  drivers/gpu/drm/bridge/Makefile     |    1 +
>  drivers/gpu/drm/bridge/ite-it6505.c | 3338 +++++++++++++++++++++++++++
>  3 files changed, 3346 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 3e11af4e9f63e..f21dce3fabeb9 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -61,6 +61,13 @@ config DRM_LONTIUM_LT9611
>           HDMI signals
>           Please say Y if you have such hardware.
>
> +config DRM_ITE_IT6505
> +       tristate "ITE IT6505 DisplayPort bridge"
> +       depends on OF
> +       select DRM_KMS_HELPER
> +       help
> +         ITE IT6505 DisplayPort bridge chip driver.
> +
>  config DRM_LVDS_CODEC
>         tristate "Transparent LVDS encoders and decoders support"
>         depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index c589a6a7cbe1d..8a118fd901ad7 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
>  obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
> +obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
>  obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
>  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
>  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> new file mode 100644
> index 0000000000000..0ed19673431ee
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> ...
> +
> +static void __maybe_unused it6505_delayed_audio(struct work_struct *work)
> +{
> +       struct it6505 *it6505 = container_of(work, struct it6505,
> +                                            delayed_audio.work);
> +
> +       DRM_DEV_DEBUG_DRIVER(&it6505->client->dev, "start");
> +
> +       if (!it6505->powered)
> +               return;
> +
> +       if (!it6505->enable_drv_hold)
> +               it6505_enable_audio(it6505);
> +}
> +
> +static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
> +                                       struct hdmi_codec_params *params)
> +{
> +       struct device *dev = &it6505->client->dev;
> +       int i = 0;
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "%s %d Hz, %d bit, %d channels\n", __func__,
> +                            params->sample_rate, params->sample_width,
> +                            params->cea.channels);
> +
> +       if (!it6505->bridge.encoder)
> +               return -ENODEV;
> +
> +       if (params->cea.channels <= 1 || params->cea.channels > 8) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
> +                                    it6505->audio.channel_count);
> +               return -EINVAL;
> +       }
> +
> +       it6505->audio.channel_count = params->cea.channels;
> +
> +       while (i < ARRAY_SIZE(audio_sample_rate_map) &&
> +              params->sample_rate !=
> +                      audio_sample_rate_map[i].sample_rate_value) {
> +               i++;
> +       }
> +       if (i == ARRAY_SIZE(audio_sample_rate_map)) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "sample rate: %d Hz not support",
> +                                    params->sample_rate);
> +               return -EINVAL;
> +       }
> +       it6505->audio.sample_rate = audio_sample_rate_map[i].rate;
> +
> +       switch (params->sample_width) {
> +       case 16:
> +               it6505->audio.word_length = WORD_LENGTH_16BIT;
> +               break;
> +       case 18:
> +               it6505->audio.word_length = WORD_LENGTH_18BIT;
> +               break;
> +       case 20:
> +               it6505->audio.word_length = WORD_LENGTH_20BIT;
> +               break;
> +       case 24:
> +       case 32:
> +               it6505->audio.word_length = WORD_LENGTH_24BIT;
> +               break;
> +       default:
> +               DRM_DEV_DEBUG_DRIVER(dev, "wordlength: %d bit not support",
> +                                    params->sample_width);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static void __maybe_unused it6505_audio_shutdown(struct device *dev, void *data)
> +{
> +       struct it6505 *it6505 = dev_get_drvdata(dev);
> +
> +       if (it6505->powered)
> +               it6505_disable_audio(it6505);
> +}
> +
> +static int __maybe_unused it6505_audio_hook_plugged_cb(struct device *dev,
> +                                                      void *data,
> +                                                      hdmi_codec_plugged_cb fn,
> +                                                      struct device *codec_dev)
> +{
> +       struct it6505 *it6505 = data;
> +
> +       it6505->plugged_cb = fn;
> +       it6505->codec_dev = codec_dev;
> +       it6505_plugged_status_to_codec(it6505);
> +
> +       return 0;
> +}

These four functions about audio seem to be unused. Move them (and
other audio related changes) into another patch.

> +
> ...
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
