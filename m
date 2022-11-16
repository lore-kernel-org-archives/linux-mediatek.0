Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3266AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 16:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GcqxyNxQ2i04UVF1iE2MHRUWTa6OtN0e3MQ8qjNro8=; b=dHGYDcNR1W2z1n6o8qpj6WMgQr
	cywvpkOC1Nrj1Ucu27RhKuHlyXPzeHqKvDdlCrdHAYEivAUjdxS5ij6kftx+ur64oF0B9UbMUsSEx
	5csqsN3mZl1FrhKl00uJysPoz449ykLalnVUm3dlEjnZAS/naX0lMSixxq0Y3Yp9/ohooERn9Gz/N
	BXr25b0zM3UrHSTeBQZ6UEY/pNDKObOkSRF2nM4FiC2qAbwtIkgdhfoL8CxujfDUjv9ayhqyM95h2
	cNsomnR4ddAJQYZSGx8xKaL5CQ/BpUINyWScYn/CtGeXulK3xC3GMrMUDDx48sSfJEH23k6VXXvK1
	KjTmQJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLFM-005qaM-PN; Wed, 16 Nov 2022 16:26:44 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLFI-005qXB-NW
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 16:26:42 +0000
Received: by mail-ed1-x534.google.com with SMTP id l11so27381576edb.4
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Nov 2022 08:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GcqxyNxQ2i04UVF1iE2MHRUWTa6OtN0e3MQ8qjNro8=;
        b=gqXs9ZRxNaAaMLsaERJlYwPG7r3b24XDY6OQOS3QsEXqGfhw9X43KJLNreM1IYIqub
         dB9lv/Zk0WN3SHi2xzGk7psL5/Xve6O5ukGpax0UM9QS/C6fKwUSKbS4Y6M67r6NjKBW
         FLC1c65yVmMR/AkRMoxpEZRWWBFKb+6QVYIAwA/kYTcg2gsgamaq7fgMACv/9AF4mkda
         J+6xOJpes4DCcqAheTEJJgJQ8KQJKg1pQ8tE80PNT5gvkJlBbe9ActINJEfnUepyRvHw
         nWZV73NRAvGO7al24DAUSqf6co6okGZYqcgs64bKZfAy7HPZZXYfaA23JVTEJp/vuh9W
         qpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GcqxyNxQ2i04UVF1iE2MHRUWTa6OtN0e3MQ8qjNro8=;
        b=jJzcQWrj2k9d3e+sL6Pk4yxxtKHbALwecM4AyylSK3KbbsKZ7ibfaGCrjtmFkSJws/
         2O+oU6sv6Rm+hkq8/TCb5BZw+OIfthpchsmWqgOSLEbNUGkVY8xL+O6TVjbIRlTJrZ65
         3W3TNZLCyfJfgLsEYrMFCbup5iOlr+mxz/eu+fpXblunIiDu6h1Xve2CdzEL5pr2Uor9
         s6SYf2H0jh2hng2D10v1NyGicFX0WvU6lmHtP1pmssvW8duIC9JN2tG38kxW3rKLNLXD
         r6h1Se02CpT4nq1R2Havf31fnjQy7MEFuCQ9XGszMa82AG321lx+vKpFpzspxV1eQ8/O
         hP+g==
X-Gm-Message-State: ANoB5pngIoZqFjQacJPgsknTQc3GVlQ3pDr+dAcereLMyHNBuPrHpLbA
	/zY1aWYGFI8/x6927mDLDrP9EK6l5N3rC+0rgdzHxg==
X-Google-Smtp-Source: AA0mqf5yB4S9XPGZ42v1UMyUILQ/PUGJvppH/sS1fbiyT79Tdf9o/FqO2PJG27Yz+Fnrnz8ST33S7OTxVys2IUPOPzU=
X-Received: by 2002:a50:fd9a:0:b0:461:b279:1175 with SMTP id
 o26-20020a50fd9a000000b00461b2791175mr19892498edt.124.1668615998007; Wed, 16
 Nov 2022 08:26:38 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
 <20221005-mt6357-support-v5-5-8210d955dd3d@baylibre.com> <166861435469.151514.16192567175686360100.robh@kernel.org>
In-Reply-To: <166861435469.151514.16192567175686360100.robh@kernel.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 16 Nov 2022 17:26:27 +0100
Message-ID: <CAFGrd9qz7w=aqiDjfdi_pM_y_1hiRoLs_AJVbptChs8=U66+aA@mail.gmail.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: mfd: mediatek: Add bindings for
 MT6357 PMIC
To: Rob Herring <robh@kernel.org>
Cc: linux-input@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Fabien Parent <fabien.parent@linaro.org>, linux-leds@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Flora Fu <flora.fu@mediatek.com>, 
	Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Tianping Fang <tianping.fang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen Zhong <chen.zhong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_082641_010752_AB10E5C9 
X-CRM114-Status: UNSURE (   7.28  )
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

Le mer. 16 nov. 2022 =C3=A0 17:03, Rob Herring <robh@kernel.org> a =C3=A9cr=
it :

> doc reference errors (make refcheckdocs):
> Warning: Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml refer=
ences a file that doesn't exist: Documentation/devicetree/bindings/soc/medi=
atek/mediatek,pwrap.yaml
> Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml: Documentation=
/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml

Ok, This should be fixed by swapping the order of the 2 following commits:
[PATCH v5 05/10] dt-bindings: mfd: mediatek: Add bindings for MT6357 PMIC
[PATCH v5 06/10] dt-bindings: soc: mediatek: convert pwrap documentation

Regards,
Alex

