Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1356AC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYQoOskS+fbvCREhTpPzMDMuJWMQA/zd7RgkP+TyrM0=; b=a6/C4pWWoDGd3z/DNcPmnEVDuh
	axf4sfx7iTzIxvTwvehPSCmEzXbBPdx5e6NRewmLy5HSRRndtpksu7Dnhxh2X3V6yiaYdpTxPY4K6
	y5zsnSE2mXtKFJ4my74FYNh2n92loma36Zxd0yuNJq8PtHpSHURqNooPjErUIhg3eNnHhAMe4wk5i
	6UO2TJ174PpjOFIG8Kwpy0nZWmu6h27AAYDAK/6P3Kt957qhMhDivpsWBsFLQ7F3w22ZyE+TTQn8p
	Ycuogi3WLCI/DTXE6n//SR19vye/KUKIcgATPyxaAY2yoao0bTEFxmgTO0p+1j16yhDxTOphOBufA
	t7J3VUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNYN-00Cx9u-15;
	Wed, 15 Mar 2023 09:36:15 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNYJ-00Cx8g-2z
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 09:36:13 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-536af432ee5so357503907b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Mar 2023 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678872968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYQoOskS+fbvCREhTpPzMDMuJWMQA/zd7RgkP+TyrM0=;
        b=IQN/hY56AbzZ1v2FNrGKUmXjBUm+cmnyDS6LJ1GMiRmH1s6fI7E3mQs9CP1LWCfVP1
         h1Ig6rWIWGZ6Uui0rrAERUJMswRoZTiXS6BjtL4PsrONzJkeYRpdh/Oij44FVXpPdhLa
         U70GNF6Ggj/OYTWlhdHy+ppyU3tEVKA8+CdUQIcoyJmB2cwJ3qIDzvVuh4Dd9Dj8QIK4
         4Iv+eFEL1FUlyfxOWTIOYABtdbDa4dv6+O/fAizrqtML9621qRECcljq7DSUdzYc1yXY
         QejbhKMIgmAqy6hSLZ39y3qyKMig7JYxK54ljrnNUwSNRZG4uTe6g697VkNtlWe5UMdM
         lC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678872968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYQoOskS+fbvCREhTpPzMDMuJWMQA/zd7RgkP+TyrM0=;
        b=WR8Pc3KLDTvEFQ+kCivunfoTjmR/Xd/6IYONpXQRJSq5oQIyWizDtG5sJWWhUr0/04
         wDuwNOWhqgT3Ttf7qV6qY4YN0pmi2qCj0OaNQn3XGc0R7/juGVxS94mIMUM2OsYE1Yx+
         nH8kQxenNGqObv0TV97km7S/RHaIJtAcMGmBczdTNLBY3o1/fMsfd2wXf7zEqqnmctPb
         ppMYAsAjD3qoK4EN4LdmYzoAwOIa0SKvDzHegDqQW2Ff9EWGeXcVjNX6v82qQ+o6wVFb
         c4nr76jpq6CVOAhav1TDBXWXAm/7aiaLrq64VocLndHfpQxFsdrj8bO3bqTmOjojjWNI
         Tv2A==
X-Gm-Message-State: AO0yUKUNhu7+XNfqJbDVcswepYQofqd2rxJikaDziW3for4Z/a7RpM2c
	o7I+ylPHweYQmWS/9Q4651k+VYnaYE3nZ9sH9kwSqA==
X-Google-Smtp-Source: AK7set9G1e6Y6bwnztfxt/btqXMvwl4/wb2VsLK7KvPZgdg17nAVO2TJC+1fSD6PY4UewmkcTq3WBx4R9IGiqLo9n3o=
X-Received: by 2002:a81:ae4a:0:b0:541:8995:5334 with SMTP id
 g10-20020a81ae4a000000b0054189955334mr8175964ywk.3.1678872968658; Wed, 15 Mar
 2023 02:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-19-45cbc68e188b@baylibre.com> <CAAOTY_-wEzu6JavEAyRo8njOLRMq3i3wEcemNsuMaK00W9QqpQ@mail.gmail.com>
In-Reply-To: <CAAOTY_-wEzu6JavEAyRo8njOLRMq3i3wEcemNsuMaK00W9QqpQ@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 15 Mar 2023 10:35:57 +0100
Message-ID: <CAFGrd9pa3c3eZcuGg7AmHL8kOAkyx96hwjwnMuO-G9BR1ORJ_w@mail.gmail.com>
Subject: Re: [PATCH 19/21] drm/mediatek: dpi: add support for dpi clock
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
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
X-CRM114-CacheID: sfid-20230315_023611_967629_9F7E76C8 
X-CRM114-Status: UNSURE (   7.47  )
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

Le lun. 13 mars 2023 =C3=A0 16:21, Chun-Kuang Hu <chunkuang.hu@kernel.org> =
a =C3=A9crit :
>
> >
> > +       dpi->dpi_clk =3D devm_clk_get_optional(dev, "dpi");
>
> For MT8365, DPI clock is not optional, so make sure that MT8365 DPI
> should have this clock.

This should be check and notified at build time thanks to the
device-tree binding. Do you prefer this?:
#IF MT8365_SOC
    dpi->dpi_clk =3D devm_clk_get(dev, "dpi");

Regards,
Alex

