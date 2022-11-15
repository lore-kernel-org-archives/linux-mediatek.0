Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFF0C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 13:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0sFkX+nbXodQt671NtDLbwnj/LAv7WU9JCGBKOzfpo=; b=f7lSj790EcDTHlrczkYoJL5q9i
	7u7LWM+rpqVP/5CxIadRrDXKnFH4lFtPUe2iOH8trxrnTA0xCaDeOPXOvi6Jx4GUzxhfXEQHCducI
	2aPJ6bJqCe3RI8+TyiDyKfX5jzyH1oBrayauDPuQnrHHzqerDSIIvyVEZJO+zGcyGg/HGw3eKkDcg
	9vvuhwlabNKa8k5b+ZrqHUaUkMny3oOIhKCgSyPCCS00mOIwq8uLONEA7EDuenVS6jzgkij3AughD
	mnK1X8sAzRtAAM3w4Deg8zbNfdfmXys+SgtwBazgPhkDGAR0x7lC/JykvNKoJYQQqHl5+rVQ0ZhV6
	VeGVRljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwOf-00Befe-IB; Tue, 15 Nov 2022 13:54:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwOL-00BePm-GT
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 13:54:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id i10so27519806ejg.6
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 05:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0sFkX+nbXodQt671NtDLbwnj/LAv7WU9JCGBKOzfpo=;
        b=LCXNFQyj9iyDqZ0IoY/l3bCF9KVFvTQK/X31I9OveRprtKEzUCRvM8avrTYoCf6xR0
         sZibGh7vNgog7H0X2Q+Fv0xpGCCnpZfbJTF/Q8J3MXrB6etR+Bv2rs256mCMkEjswuF/
         epkHDYiuiyNEZmIHKIecEgnX8vGdb5rnfrm0irBH9Nl86aof8dyN6s4vYaOi8dGcu8k7
         DNPJLlHBY+WHAqBxboGWbN49MfKxdl9C4hGyDmPP2hVLyhOm2ndxhvRJRb2yv6naEz9x
         15+E27B/yeP0tR3/Jk36kZS2TR20ue0APo+lEHUq0fvCFQr9UKSjEJyvJ1Ob0szqjRpT
         IrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0sFkX+nbXodQt671NtDLbwnj/LAv7WU9JCGBKOzfpo=;
        b=ixJEkGEdiiFmgXwrGwu/DSL09cj6pdVKE0vvboCn9bHV4CBEySfv1KHQZsUVJO2s8w
         JmlLVngqstMWzUT8Ts55ZE72e5pyT6EnTpDmSkKHm02Yo3JSNekln8j2OwcRpqMDREvN
         Brb/De8ygrkQ6QF7JH9SZ9GiA8ahKWv1bvm10OhQwLxyHYCO3dSe0kEiE1KQVnb8oGvc
         RD9zMxnGMF2sxR5OaaZuA7ecf3CnM5r8Y3nVJ5CC6Qn+o0X87N6YLnNvGx8ETQK1f4iD
         ufMGp3N43nxhmrN3VZvGjhtNVCgBSDVwar3ywSMtnCXApAtG4BjXIL3jZo9/S3S9YfXj
         re2w==
X-Gm-Message-State: ANoB5plFQyXmYhbm98paQzGw1OaHHO/W8PnPKhn+BD6lsAmQkP4fSJug
	iHhS+Fzap3VACH9CGv7pUab0SKVlx8K3NkwytjZdTA==
X-Google-Smtp-Source: AA0mqf4WMyt4uB3gxvki+JAXsKJPJAU1cd1VDx3nBWsvAl7puGi2zyYQVi+2VHiXzUHT9ITHHgAIIdG2a5wj+RmSmso=
X-Received: by 2002:a17:906:a1d9:b0:78d:b371:16e5 with SMTP id
 bx25-20020a170906a1d900b0078db37116e5mr13497638ejb.456.1668520454765; Tue, 15
 Nov 2022 05:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-5-5d2bb58e6087@baylibre.com> <fe898d24-54fa-56bb-8067-b422a3a52ff5@collabora.com>
In-Reply-To: <fe898d24-54fa-56bb-8067-b422a3a52ff5@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 15 Nov 2022 14:54:03 +0100
Message-ID: <CAFGrd9r70XRd=4Ogei+U2QXQny7LhWr9bDCRNYco+Bsy+2XqrA@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] dt-bindings: soc: mediatek: convert pwrap documentation
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fabien Parent <fabien.parent@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>, 
	Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, 
	Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
	linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_055421_559982_5F4D573D 
X-CRM114-Status: UNSURE (   9.04  )
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

Hi Angelo,

Le mer. 9 nov. 2022 =C3=A0 10:55, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 08/11/22 19:43, Alexandre Mergnat ha scritto:
> > +maintainers:
> > +  - Alexandre Mergnat <amergnat@baylibre.com>
>
> I say that the maintainer for pwrap is Flora Fu <flora.fu@mediatek.com>..=
..

Flora Fu is the driver maintainer. As described in
Documentation/devicetree/bindings/writing-schema.rst:
maintainers
  A DT specific property. Contains a list of email address(es)
  for maintainers of this binding.

My  understanding is this field is only for binding maintainers, but
not related driver maintainers. Are we aligned ?

Regards,
Alex

