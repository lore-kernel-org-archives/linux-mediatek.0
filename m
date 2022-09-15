Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851C7ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 16:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGGPltysYKSp/7lQwYUdbyRbVIJyU3VFPRDcDMDYhRs=; b=nx7gJI3r73ETQ7/iC3B/Bo+TlZ
	QWJpJWe1yLdpNomavrBBMmxlyKXm5Q01HC8ZthmG+kuTdoLmv1YkYto1JIVvvWcQAaiY/1fwlunTJ
	BJiuis4sZ+qNXBW3aSpV3OPlNgBHRunvZEANcjAtplint03IjTDY9q96w8si0zEr6Uliq0mmOW9zD
	qkNcqsONhgt5vixLPX5xOz4yoVcpv/KCE4IYbyTKoxfEms+Q1GtMo6X/F84fVdq4Q12RuVKPtO7UD
	eUgF9LC0lHI68Au2M6hwU4yAj0emwNhly8P+lZRV2O48jUFnPg5eIYd0yZe6SK0eCJTKD2nqdD3oe
	D4flvfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsCo-00Djv4-Ow; Thu, 15 Sep 2022 16:59:14 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsCS-00DjlO-IH
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 16:58:56 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id f131so28628368ybf.7
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Sep 2022 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=DGGPltysYKSp/7lQwYUdbyRbVIJyU3VFPRDcDMDYhRs=;
        b=GTpQoXRELGKRGGrEnQpUG6fqFn95MU+JX7Awv2d0h+D+NLsQ/r1UDWlPfW+GzOhld8
         bAGtuk2DCu/dhAJ6RnbkX/ET49JQClyB7mybPtc+ltnm1nb1hsch1CDbW6bYdS0x51cb
         CWeDIJm/TL5RPQ3+maQlmciTLLWbP7C5UsLFr7N/8C951nfRSa/6oNnXrjdC8pKXgaYD
         Ubx6YxV13D04BE0gT/4Alk5fBE1OaKJkLAdMY3GdGXv4B0C5jGrlPOY9+X1Qb4j/7Rjq
         YYmW6MriaI0Ik0g8rSswhW7g7gDHZvTJ+kUKai/+YL5bNKnmo183NUkjYIVe7EnfgT67
         PCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=DGGPltysYKSp/7lQwYUdbyRbVIJyU3VFPRDcDMDYhRs=;
        b=zy7xnIIoTPFzzQUFSZpnEW4gH1CTwKPpTSDAmHPyT2uEaRlVJX+CWtMxknNRQz8yFh
         Nlgk7ERkLs8EuQR22QTG/nyefBcPLwkhJ81e6dQ6yeK+o9I1cG5KtKy5SpvDBZvxI+Vj
         K6o8ymQL7xY5xUsPPxaBIMnEPJNqieVmXom28fM42nlUcooefhawsYMSsoj/tuf76wUf
         iseunI3kHtM8YIOqagPks8W7FG1df2MgpKLluEmsYLvNflIqZtv1o3krpTloDqQjgClf
         a72vKoLZPLtHJnLGFIZbulz/8Gk6kUudBKr4oLyY+z04+cdZkRRStZorPZpNgk4Wm6Oz
         RmrQ==
X-Gm-Message-State: ACrzQf2zLSBbdWTRt7uYHuG7K7SUcPf4ID1FJV/CosNYg3DEzJSVcx97
	w4EG6lEP0hvNhDaMGndRPr0I7eM7DbJ9EN3Z9iX/Lg==
X-Google-Smtp-Source: AMsMyM49cq5D3GONdx4uJlA3ekuaqH1iwlSdpHLW6fbdANnjlZkcRMf5cVhFmFbRDuF08i7luVZpESHqd3EkEGxXQH4=
X-Received: by 2002:a25:e74f:0:b0:6ae:eaef:36cb with SMTP id
 e76-20020a25e74f000000b006aeeaef36cbmr649534ybh.199.1663261129842; Thu, 15
 Sep 2022 09:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220817080757.352021-1-bchihi@baylibre.com> <20220817080757.352021-5-bchihi@baylibre.com>
 <8d6383e0-329e-ca91-6e79-85b3806a2af3@collabora.com>
In-Reply-To: <8d6383e0-329e-ca91-6e79-85b3806a2af3@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Thu, 15 Sep 2022 18:58:13 +0200
Message-ID: <CAGuA+ooEHPiHuGYXOh7s68HRTv9HSr-BexFsCLUPWTMQ3szCfg@mail.gmail.com>
Subject: Re: [PATCH v9,4/7] thermal: mediatek: Add LVTS driver for mt8192
 thermal zones
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org, 
	amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com, 
	fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com, 
	abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_095852_847946_40B0622B 
X-CRM114-Status: GOOD (  15.86  )
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

Hi Angelo,

> > +static int soc_temp_lvts_read_temp(void *data, int *temperature)
> > +{
> > +     struct soc_temp_tz *lvts_tz = (struct soc_temp_tz *)data;
> > +     struct lvts_data *lvts_data = lvts_tz->lvts_data;
> > +     struct device *dev = lvts_data->dev;
> > +     unsigned int msr_raw;
> > +
> > +     msr_raw = readl(lvts_data->reg[lvts_tz->id]) & MRS_RAW_MASK;
> > +     if (msr_raw == 0) {
> > +             /* Prevents a false critical temperature trap */
> > +             *temperature = 0;
> > +             dev_dbg(dev, "LVTS not yet ready\n");
>
> ...and you're not returning an error code, despite this function was called
> while LVTS is still not ready? :-)
>

if I add "return -ENAVAIL;" here, I will get the following errors on boot :
[    0.292094] thermal thermal_zone0: failed to read out thermal zone (-119)
[    0.293019] thermal thermal_zone1: failed to read out thermal zone (-119)
[    0.294158] thermal thermal_zone6: failed to read out thermal zone (-119)
[    0.295697] thermal thermal_zone9: failed to read out thermal zone (-119)
[    0.296600] thermal thermal_zone10: failed to read out thermal zone (-119)
[    0.297698] thermal thermal_zone15: failed to read out thermal zone (-119)
[    0.298625] thermal thermal_zone16: failed to read out thermal zone (-119)

I just preferred : *temperature = 0; to avoid a false critical temperature trap,
and "return 0;" to suppress these errors.
After that (first read at boot when LVTS is not fully ready),
"msr_raw" will be always != 0.
And I did not want to add a "delay" or a "sleep".
Please let me know if you have any suggestions that could fix it in a
better way.

> > +
> > +     } else
> > +             *temperature = lvts_raw_to_temp(&lvts_data->coeff, msr_raw);
> > +
> > +     return 0;
> > +}

Best regards,
Balsam

