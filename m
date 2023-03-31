Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08ECC77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xo2e908Td2gve6mc5SW+VA1nrFzqtdIPvQwGYibnpiE=; b=fUjCXrQH3E5weYQcboB9TRDvrl
	5Epp4Y4J3WibcpJz6SkZC5KHMWTTqVtGoICaZ9y8Pn+7QKf1a8Gxb/xEldJTUd2sFgKKUooDh+xsm
	eIaP4t4gR6qfOPppOUdSuo8NNBXt5RStJQ0bDnIqgQAhRb5SCKQbL8WnnXC1L31LcAONvCv0zbZVb
	fnJRganhk7OSEOAzGu3LSPxnHuLTHFY/xTByIxCCPfZpcRjH9vUsUtA/BUBhMkMTG9EtPel0fOoLp
	Q3w/35wwIjKgupL5cxZnw/wF9MNuPLksQIAUPVeTBLrLDEBKLuTHfEIKg5WZKhg/R3ukfvqK0RonY
	wovF3Hdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBGe-006jHs-28;
	Fri, 31 Mar 2023 09:41:56 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBGa-006jEL-0y
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 09:41:53 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-54184571389so404783757b3.4
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 02:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680255709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo2e908Td2gve6mc5SW+VA1nrFzqtdIPvQwGYibnpiE=;
        b=uBMQIM9oghtu65OYry7lh4Mg9Ey6cTyShHDuQhNvkKE7cvwdYHy8HnejROCk4ISgBp
         n4e9O+dpRLoxInIr0AZo6wccf2QiNwAmGY6ht9Plojz33GD3k3FLmtt9lRBB2OoL5AhL
         q2tQFIWfJ/sC6d85vYFLRhLcrxJBPlr1eaExYaWQbIa5/50Jh2eHlnucVQQ3EXIqsMhF
         Xn7baerAqsPtuvTx5Dhgm9XDMjpTYzSMOsnAxiuciECoi/2dtVis3DjNLK35S0dVG0KG
         wAvNRlq2DbLnfG9+b2gm/R5ppzBZy9uGHsRoJDKHucpOb8KGlIogRpALWSfLixgMC6r8
         opMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680255709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xo2e908Td2gve6mc5SW+VA1nrFzqtdIPvQwGYibnpiE=;
        b=fT3wrMgECbYQGD4E28pR5TOzs/xPhSiaAUev6zyF9FmfaWeLnA360p6krZULtSIHK9
         7wHaDa2yedEI3Ekofjn5jtjVZxD76zLcbcLqkrXp/rYNbbfWjtENTAFi9doC5R8xJZpo
         YZJmM7eAjtoZpWKCo1L7It55YlaKXoqhWeEAX52OCOSOeHgBiwdqFy3xICZuhqOx8GwR
         DP3s51xjs4JZu9TRCfuc/bVNziNCXOf9wEmvlTcpsd4xrA74Juzn+rc8zgUUoMuBJcZ4
         9JwRTWYv3qlh5vPCLOQGwHaOzz2VKE4Ah49mwelq2IIcQrogCs0LrPP3kmuI4V1XGvqP
         eEnA==
X-Gm-Message-State: AAQBX9f9T3jmuy7TUZYrBnsw/5rcDUYqNaUeQyHXx6lkZn4y4UseQypZ
	+tc4WGLsxVknpZPtId1BNHv6ycYfgThPccvoJMsptw==
X-Google-Smtp-Source: AKy350Zp7b7rjPNqqt62mXM2VNu7M6RMNX9eWwNzvLF+Jhy96wQfhw+jaU3Fvyd5viiVC5EgACPo2KWYnzUvEMriI7w=
X-Received: by 2002:a81:b620:0:b0:541:8995:5334 with SMTP id
 u32-20020a81b620000000b0054189955334mr13089289ywh.3.1680255709091; Fri, 31
 Mar 2023 02:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-5-0003e80e0095@baylibre.com> <889be563-78d6-7148-f7d2-09ae21383ee4@collabora.com>
In-Reply-To: <889be563-78d6-7148-f7d2-09ae21383ee4@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 11:41:38 +0200
Message-ID: <CAFGrd9rGoAN=B6O=X7peOtyYuWpWkMBFakrkLp2fcD-D2uajqw@mail.gmail.com>
Subject: Re: [PATCH v3 05/17] arm64: dts: mediatek: add mt6357 device-tree
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_024152_344073_F8173591 
X-CRM114-Status: GOOD (  16.28  )
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

Le mer. 29 mars 2023 =C3=A0 15:17, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 29/03/23 10:54, amergnat@baylibre.com ha scritto:
> > From: Fabien Parent <fparent@baylibre.com>
> >
> > This new device-tree add the regulators, rtc and keys support
> > for the MT6357 PMIC.
> >
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt6357.dtsi | 282 ++++++++++++++++++++++=
+++++++++
> >   1 file changed, 282 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot=
/dts/mediatek/mt6357.dtsi
> > new file mode 100644
> > index 000000000000..3330a03c2f74
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
> > @@ -0,0 +1,282 @@
>
> ..snip..
>
> > +
> > +             keys {
> > +                     compatible =3D "mediatek,mt6357-keys";
> > +
> > +                     key-power {
> > +                             linux,keycodes =3D <KEY_POWER>;
> > +                             wakeup-source;
> > +                     };
> > +
> > +                     key-home {
> > +                             linux,keycodes =3D <KEY_HOME>;
> > +                             wakeup-source;
>
> KEY_HOME is a wakeup-source?! are you sure?!
>
> (P.S.: I'm just checking if that was intended)

Yes it's the setup used in the official Mediatek Rity project.

Regards,
Alex

