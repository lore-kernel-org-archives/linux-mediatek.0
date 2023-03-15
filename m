Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECFFC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYAh/YhIsGaDgzuFWEjV5Tqmw5wuniQWWsQW6wd6NGE=; b=R57ffp7xvzjrXV2KPSqk04tUBO
	ejjp3DA5IzLrEe56awEa/mqcMN0BN4JOobWUnhkCulDkb4WYsDqLTNMI1jrHQ61iK0jTo6c1/0hGI
	zpJ08+iDCIMFZjh3hklXOVWRqtiSrt6wx0cJM3O4GFQb1DcUQafNyhgFRbeTplS+mmAvkeJCzh3t7
	maKX0zfhhfhVngKHJK69ukV5Pd9/qCOri9ar9SqgRcexkzHszsAyzE11h1THTriFGYkBAm4Je/b87
	JYILH/z2zIbhyeoe8XJvvkKHAD1wRKG+EDIVC+xIZVLMfVNe1g7N7vxa5Y+6wsg5eaq5n3xFriPF7
	IqeLVjvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcRwe-00DaZO-30;
	Wed, 15 Mar 2023 14:17:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcRwa-00DaY4-2w;
	Wed, 15 Mar 2023 14:17:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 45450B81E3D;
	Wed, 15 Mar 2023 14:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAF9C433A4;
	Wed, 15 Mar 2023 14:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678889847;
	bh=CQun5NYvCzgck8mLcoHCcDks/YPrwVLykREvoC7nBKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XJWjqUEkahmrvngFt9oyfNfcK+J2smZ7aM21uO/o+ojEQjxERR7bgSDu+m5Op9YpW
	 NN2ALZolAGYGgCSxDzmSIGcMjp2YOMPSAr/LAvddBCtAFBM4utuK9P9Lu1EYR5pNtM
	 4pKKHg43gq+2vs4C/p39gOAsAwzHharXQa76ru1K9aBMMfwrl+I3uQ2nE9oKtUm3QL
	 JHpqRrlE1rjCWcgwgnTrnCI8vZIjTEcdovAAZXp0v/dswlba3bEcxe1d+qjAzz7kXh
	 wJ1SCB6MwupEKZGO9r+yQmqxysPGV6POLcLMF9It+ojiQydZfDwSdhYGT3hM4dMieZ
	 Y4/5Adbg3tk8g==
Received: by mail-lf1-f52.google.com with SMTP id s22so24505493lfi.9;
        Wed, 15 Mar 2023 07:17:27 -0700 (PDT)
X-Gm-Message-State: AO0yUKX2XZqOoObJY0peuzfqrIjf8f4/eOaUKgXtKVpJy6fDp+xMRVAm
	3L9GNbkyIAu9238meAS97B+BTeNODZke08PK+g==
X-Google-Smtp-Source: AK7set8Vnq294J+j4qqKSVvr2jzh7ZWYNwCdOd39eacfnl/Ca01w31d255eKrfrDZr8PTwI+xUi8SrZq75uayJmH64s=
X-Received: by 2002:ac2:484f:0:b0:4dd:af74:fe17 with SMTP id
 15-20020ac2484f000000b004ddaf74fe17mr2074084lfy.7.1678889845688; Wed, 15 Mar
 2023 07:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-19-45cbc68e188b@baylibre.com> <CAAOTY_-wEzu6JavEAyRo8njOLRMq3i3wEcemNsuMaK00W9QqpQ@mail.gmail.com>
 <CAFGrd9pa3c3eZcuGg7AmHL8kOAkyx96hwjwnMuO-G9BR1ORJ_w@mail.gmail.com>
In-Reply-To: <CAFGrd9pa3c3eZcuGg7AmHL8kOAkyx96hwjwnMuO-G9BR1ORJ_w@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 15 Mar 2023 22:17:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-TfXBpVbWw54yORqQ9Ubft-6PKofS2VznMi4-jfbA7Mg@mail.gmail.com>
Message-ID: <CAAOTY_-TfXBpVbWw54yORqQ9Ubft-6PKofS2VznMi4-jfbA7Mg@mail.gmail.com>
Subject: Re: [PATCH 19/21] drm/mediatek: dpi: add support for dpi clock
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>, 
	Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Fabien Parent <fparent@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_071733_117873_E52AE3B8 
X-CRM114-Status: GOOD (  12.94  )
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

Hi, Alexandre:

Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=88=
15=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:36=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Le lun. 13 mars 2023 =C3=A0 16:21, Chun-Kuang Hu <chunkuang.hu@kernel.org=
> a =C3=A9crit :
> >
> > >
> > > +       dpi->dpi_clk =3D devm_clk_get_optional(dev, "dpi");
> >
> > For MT8365, DPI clock is not optional, so make sure that MT8365 DPI
> > should have this clock.
>
> This should be check and notified at build time thanks to the
> device-tree binding. Do you prefer this?:
> #IF MT8365_SOC
>     dpi->dpi_clk =3D devm_clk_get(dev, "dpi");

Add one member in struct mtk_dpi_conf for dpi_clk. In
mtk_dpi_of_ids[], add one item for mt8365

{ .compatible =3D "mediatek,mt8365-dpi",
 .data =3D &mt8365_conf,
},

Regards,
Chun-Kuang.

>
> Regards,
> Alex

