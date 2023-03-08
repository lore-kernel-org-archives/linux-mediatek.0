Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13613C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 16:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUOD/X3MLXbaSFinuRbww5tKoyJ/4JSfYyoEzJIPkIg=; b=XZgBdBwBoE94y/i3V6dIqfUYOy
	/lnvlt1KMOXAj1TODLwgGDiJiceD0edyMB7ra8w3EpGShl/ZFbyal7h4n6U87A5fiTE3kkkaisi6+
	MEcJUBsGaMmF4hH6BxotFU1DZXHXfgkiHfY9x8v90rI5z3wvUovEb7wqsf1MSRHa12oy2WFkCp7oN
	fUM8MevxBjovYGjjCSltQgY6irzCY5G0r038YdkVk1TkhNK6Ey1tctdZTnAEkNd9Uelnhj7S6nKN5
	dcTl5ZiKo1uT2Kx6U4o5VrWmLdE5+63XXrvVFDu2u/hIvDcmPk1KFN1FPVGTBYnbG6SejjsaUTub7
	pdPEPFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZwIx-005qjK-U8; Wed, 08 Mar 2023 16:06:15 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZwIv-005qhy-DE
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 16:06:14 +0000
Received: by mail-ed1-x52c.google.com with SMTP id j11so48235551edq.4
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 08:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678291571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUOD/X3MLXbaSFinuRbww5tKoyJ/4JSfYyoEzJIPkIg=;
        b=Rg3SgBcpYBK+DKWE8tmQoSeFokOAj8h+6SfVAZZrcMVcD1fjv6zoukEd68kmJVfB1U
         rtXl4gzwdGPBeGN7Axms/raMcUjg+U4TcKeexu2o2C6K54xuOZ+iYw5YPoB0ybO69NAs
         1BP0+07mCjH3lHUXfQOu6PGKlpFp5PRHRoWkBIQRuLGd6OGNVB4gHXQU+uK9FXdJyEI0
         rG+nmhLXy2sMKceLAOZBGMYYSiXtfsD+p3vfnP0o4rupbtGQ+cmLlLpn2wYFhHFXCK8S
         NjL/0QKisG47gol+EKvwZeR3en4zINPSMlki3pGW4LjfiddGJAPjK4JdvB0vm5k7Fbmz
         08+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678291571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUOD/X3MLXbaSFinuRbww5tKoyJ/4JSfYyoEzJIPkIg=;
        b=RN8/AHzmmTEV5+oWIsfyVcJft0w2kDAgb8YxrvaY8uihnYyjrMq7/QUDBwGBaomRrU
         I0NSQuJC+VO5Kk18KrlNY2z3kdHAjBrW13IfEcNO7FZAV6HsdjmeI02sld8IsXdYdpgk
         1ygkFrhCoRT7FsXSbbIgLQhjosWnbcgY9V2PlxAfoEZ48EFVYeBhVvLv31l8BDsQmSpz
         t01USCWXZ6JPr0rrEMXqKmLGTsRF5f3QKoVBVcAirhnbCk+AQ6B7lB1pqo87NzWfbm3z
         /QN/O7+F11WySBXuJETd9CdQyh3NUGA4ClZiDkk6exrXAfb24SUQaL27Tvosn2MFfX+T
         80XQ==
X-Gm-Message-State: AO0yUKXJPud/bziVes8+mQx/tT0/pLUSbg+2VhAJndQrhNaJOpIC5AvY
	CG4qnCe8ipN2BLgtazyHefXMEqniSrVJunaMg4EeRg==
X-Google-Smtp-Source: AK7set8DCQYR6EeCLCdicp+N7+vPQpFqmFvqGYAUUsZf3YwgIQkfZ7vvmfspmzmc3Ic0/+IpWN2QQYksgERyDGcPThc=
X-Received: by 2002:a17:906:1850:b0:8b1:780d:e43d with SMTP id
 w16-20020a170906185000b008b1780de43dmr9541197eje.13.1678291571683; Wed, 08
 Mar 2023 08:06:11 -0800 (PST)
MIME-Version: 1.0
References: <20230307154524.118541-1-bchihi@baylibre.com> <20230307154524.118541-3-bchihi@baylibre.com>
 <6b1e9d19-b176-280d-0277-492120e3a1fa@collabora.com>
In-Reply-To: <6b1e9d19-b176-280d-0277-492120e3a1fa@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 8 Mar 2023 17:05:35 +0100
Message-ID: <CAGuA+or+r-RwrD0htS=fMsAi5rGaWRCb8ZFdJRRZ7cayL3w_Wg@mail.gmail.com>
Subject: Re: [PATCH 2/4] thermal/drivers/mediatek/lvts_thermal: Add AP domain
 for mt8195
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_080613_467382_9C35A814 
X-CRM114-Status: UNSURE (   8.14  )
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

On Wed, Mar 8, 2023 at 10:15=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/03/23 16:45, bchihi@baylibre.com ha scritto:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add MT8195 AP Domain support to LVTS Driver.
>
> Please mention the documentation changes in the commit description.
>

Hi Angelo,

A new commit will be created for the documentation in the new upcoming
series for both SoCs,
as you asked.

Best regards,
Balsam

> Regards,
> Angelo
>
>

