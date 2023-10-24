Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515ACC07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vRcJgtOXzZCq78BJkOWm+e6iKA7h9pUUytY6k6Mj9iQ=; b=RCC3yHQ2H7E3mTt4w1uq7plrUn
	jo0J0QMQv2RwrsxuzW4N5DarcnQcU3LV5M3aQ9D8fj6ncdGpcqyMzgpzfD+8tS3m8ZMIadmmResrB
	uWWAW6LRnYnPe/UsHCsCe1fX7QlyeoH7mxCauAoQyZ3Jd8xG0ou/dLJcaDTUeRgnjQHRzZ5hKLjOd
	8kYSHMzkL9Dk3IAafFlLjuroVS5uB2Lpm9t8RdDszs2ap2RfBzMu0mYUG8JhGYVM9KD/YrftHJCXt
	APT2BNyAn0KVy4IIsuciqm8TGeXChB09j00xMHBcrUvwLpccKs0lZ7KuCU0Dbhmk0lJFiwo2VoeLb
	okLdrE9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvE3f-009MRq-0y;
	Tue, 24 Oct 2023 09:50:43 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvE3c-009MRE-27
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 09:50:42 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c5629fdbf8so54938521fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 02:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698141038; x=1698745838; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vRcJgtOXzZCq78BJkOWm+e6iKA7h9pUUytY6k6Mj9iQ=;
        b=KyT81fNCG6NcI+YdVYUwSRuhqCDgIwKnVVAy0eCtbCC9PL6kKkdubeDgHq0DkWOiuD
         7lymdFBYW3mA2BLdxFqXx0dRCcy8OZPRrLE9r3+RaldaIKjRVqlkSE+zwqveC006MEEx
         Tt4/hhEK6MJ1g8tGwvVKs63xz++T96aGZtuLwDjqLeXbTl9OnxnF5mioP914r6CAhgUf
         kLEiE7YlMDrSgim6h76tTzj3vmkkW6uQp4VgWOBp1ABmL9ddNLERfB1cmPA2dIw7WBzP
         /+d/e0OE+0f9ZJQuoPbaM9sPVEe0wsPuR+GSBcKJTntZrbt2rPM4OWT+tQLAT0EXVhfZ
         VFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698141038; x=1698745838;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRcJgtOXzZCq78BJkOWm+e6iKA7h9pUUytY6k6Mj9iQ=;
        b=Q1fPCZX05zKX2d1o/GJ2o9pFL8Duj5vqLv7r4Bzxg439IZ9rBnZKQvO1ATUgDtcahN
         c193yOzy0Cit8/JZHZSm/8aWFmg30FDy9YWp48iPmib0t+w25czksSM/CVA6PeUVqXZA
         TKXmEWMyGmcbB1nz6Rlcae/gzZ2RQEGQQda40F9V0Ao9bV4ThWkKjh8J9luURKQ89GXC
         CJ66HDpw7xB1sigZsXMh8RWh3S6//sTZbWzClSwJVjHyu/dYUYe2XYyrzaPKtntcTz5V
         r8h8MIXmtzaqzhSmihMM4Lcx60oMzW3i1/iqCI4N+OEia0NmfMFWv7M13pfYqzhejGaI
         1cbw==
X-Gm-Message-State: AOJu0YwKm2WlzCiMo27rjViKK9v4QjgF+MjFOa4YxP/vaIKVjwv5qZk3
	e9ZeabJTdWcHSEV9KFj09Sjn+MJZbu077kaj1XI=
X-Google-Smtp-Source: AGHT+IFiX19lnhtqPimlOxmYAB2b36pROe6pniV6FuuyFcIL6OHyN+w+nvbKah8C8imGEyU7/00BlQ==
X-Received: by 2002:a2e:3c0f:0:b0:2c0:a99:68e7 with SMTP id j15-20020a2e3c0f000000b002c00a9968e7mr7945677lja.19.1698141038514;
        Tue, 24 Oct 2023 02:50:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d60d1000000b0032d8f075810sm9609616wrt.10.2023.10.24.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 02:50:38 -0700 (PDT)
Date: Tue, 24 Oct 2023 12:50:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: xiazhengqiao@huaqin.corp-partner.google.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
Subject: [bug report] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add
 rt5650 support
Message-ID: <de95f385-3eb0-44c0-bb71-c9bc993b55be@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_025040_734165_BC129B89 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Hello xiazhengqiao,

The patch d88c43383101: "ASoC: mediatek:
mt8186_mt6366_rt1019_rt5682s: add rt5650 support" from Oct 19, 2023
(linux-next), leads to the following Smatch static checker warning:

	sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c:198 mt8186_rt5682s_init()
	warn: does endianness matter for 'type'?

sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
    161 static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
    162 {
    163         struct snd_soc_component *cmpnt_afe =
    164                 snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
    165         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
    166         struct mtk_soc_card_data *soc_card_data =
    167                 snd_soc_card_get_drvdata(rtd->card);
    168         struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
    169         struct snd_soc_jack *jack = &priv->headset_jack;
    170         struct snd_soc_component *cmpnt_codec =
    171                 snd_soc_rtd_to_codec(rtd, 0)->component;
    172         int ret;
    173         int type;
    174 
    175         ret = mt8186_dai_i2s_set_share(afe, "I2S1", "I2S0");
    176         if (ret) {
    177                 dev_err(rtd->dev, "Failed to set up shared clocks\n");
    178                 return ret;
    179         }
    180 
    181         ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
    182                                     SND_JACK_HEADSET | SND_JACK_BTN_0 |
    183                                     SND_JACK_BTN_1 | SND_JACK_BTN_2 |
    184                                     SND_JACK_BTN_3,
    185                                     jack, mt8186_jack_pins,
    186                                     ARRAY_SIZE(mt8186_jack_pins));
    187         if (ret) {
    188                 dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
    189                 return ret;
    190         }
    191 
    192         snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
    193         snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
    194         snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
    195         snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
    196 
    197         type = SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3;
--> 198         return snd_soc_component_set_jack(cmpnt_codec, jack, (void *)&type);

This is an unpublished Smatch check where I manually review casts to see
if they are correct.  Quite often they aren't because of an endian bug
or a 64 bit vs 32 bit issue.

Here it's not clear to me what's happening.  Normally with this sort of
pass a void pointer code, you can tie it very easily to the same driver.
But in this case it's much more difficult.

There are two functions which use the void *data pointer,
rt5640_set_jack() and rt5645_component_set_jack().  One takes an int and
the other takes a struct rt5640_set_jack_data pointer.  So presumably
we know that the cmpnt_codec->driver->set_jack points to
rt5645_component_set_jack().  But how do we know that?

Is there a trick for me as a reviewer to use?

    199 }

regards,
dan carpenter

