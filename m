Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28969C25B50
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 10:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VicuVzYu4s6fn4J013oQR8HfGltLPxIwfCDN/KofZV4=; b=VeEbQTir5Gk6PzL6ngCesWNc28
	9bEJoV/pP3L3bNivzP8FbXH9WTKOkbrm7Qq3NgRRPo/M6C4NjEaNJel1wx8dKt8JnoZpeLsS72wFR
	NHwd3cRpRY+RIzWdLKNHz6aVGOsEMXWjf1sCJIuK9fiC6D7cjev5+PGQUMzb/csUl8vxFjftG6U3A
	FkyajejOL84g6vrLHppW16X++t0hYimcaulEF02F6EmZKOF9uVn7Df8VBUdBG8tfyANCTWRVM/kka
	QAUIfL125sncUl4alvDScUo5meUSLQRYE8AaxunSgv9OmAHbbps5Ed4RSZN4tO9cEny9uE3OiPXHW
	OkcqhL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtt9-00GkIS-1z; Mon, 23 Jan 2023 10:17:19 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtir-00Gg9P-CW
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 10:06:44 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-4b718cab0e4so164298687b3.9
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 02:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VicuVzYu4s6fn4J013oQR8HfGltLPxIwfCDN/KofZV4=;
        b=Y6ClXDCRtaM0NFUm2exFLL9k/94ruQcZKAH6AGrXv44azxyMt5YFlavlrXbinR0jop
         DU1fhE18zgcsGj0kmkI7OSQG0EO9+VmIZkKZKxAS8wXy8sjQvRsgvTKwT7m3D2FCvglL
         /ecwm2GbkU4KzTay2o7Wd8BbgsXxXmBnjks0x1u0tI3kWXpz26bluupkbvQJ0jPZjHgW
         mLdP3xYta2Xv/cnV2L7H7nWAJCnqiXx7CxqSgj/LFGP6HO33lWP5jO1eS4ToRmEbZ9Ff
         XNcfYlfwf3Pt2yTdGcISpX9AQTPWMF9p+ZUTYaEdhthXOTtNnHcMJgzXA1vWJ92BdEvg
         qbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VicuVzYu4s6fn4J013oQR8HfGltLPxIwfCDN/KofZV4=;
        b=A7wo1iOeS2FrOzaK3h6wIzRQtwAx1buWh+H3+h3DyrqbG2Fo5XbC4L2aRKtkKazfhK
         9DVHTymHC4dp1RkHfz0QDVqSnmQdu9/rhduqHuX2Pa/M+1Gz5Qr4dA+7vFJ8sRAseSz2
         ouLpZNuMSOgqzGMfUnj3ELIfrzKuW5O382ENNPhSaSzfVNjV4uhADYm6Dx8f5gCvWG0F
         6qDtCjlAN4Ro3ne/DOlyRLh7MU15vmX07R1xpKVX5D7+z6ISbMmdsAJrQAvk+4GDX/Pz
         UUv9vuPQiyT9OC/fS3ZgTVmV1h6P3cocPo8rj0AOxpTqXSUq2GijduZP+jBffeAiJXqE
         zx4w==
X-Gm-Message-State: AFqh2ko7IevMLPVonliL1VbQCK0EtB1mPrNEnnL/aB5Cm+nRE2+MMUfP
	gb6oxKOT44hTLeV2twQpZ9F6j4/+wENl4Vvdusc7sxFIimOm8Q9t
X-Google-Smtp-Source: AMrXdXu00x2BMrHmuqKFdmwf8soxBKobdwtYbxJRewGUxxnrJfPYQTlkT0upDkADd3uCyDg9kDJIpyrZS/Q3hl4Q2C8=
X-Received: by 2002:a81:4006:0:b0:46b:c07c:c1d9 with SMTP id
 l6-20020a814006000000b0046bc07cc1d9mr827028ywn.56.1674468399283; Mon, 23 Jan
 2023 02:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20230118-mt8365-spi-support-v1-0-842a21e50494@baylibre.com>
 <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
 <60766c7b-abb2-3afb-aa16-0e1385b88a73@linaro.org> <CAFGrd9rtO0B2XWEEU6gtv39PndjdjLL6tbRWimWT3RvLu1GFrQ@mail.gmail.com>
 <259d738b-5717-8fda-22f0-c61db4660e95@linaro.org>
In-Reply-To: <259d738b-5717-8fda-22f0-c61db4660e95@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Jan 2023 11:06:27 +0100
Message-ID: <CAFGrd9qENTZV2fs52HPv291=AJdcBHpd2L_uoc9PhbO1vcKw=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_020641_557372_B391F6D3 
X-CRM114-Status: GOOD (  14.73  )
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

 Because there are no logical order:
    { .compatible =3D "rohm,dh2228fv", .data =3D &spidev_of_check },
    { .compatible =3D "lineartechnology,ltc2488", .data =3D &spidev_of_chec=
k },
    { .compatible =3D "semtech,sx1301", .data =3D &spidev_of_check },
    { .compatible =3D "lwn,bk4", .data =3D &spidev_of_check },
    { .compatible =3D "dh,dhcom-board", .data =3D &spidev_of_check },
    { .compatible =3D "menlo,m53cpld", .data =3D &spidev_of_check },
    { .compatible =3D "cisco,spi-petra", .data =3D &spidev_of_check },
    { .compatible =3D "micron,spi-authenta", .data =3D &spidev_of_check },
    { .compatible =3D "mediatek,genio", .data =3D &spidev_of_check },

I can put it first then before "rohm", or before
"micron,spi-authenta" you prefer.

I can also introduce another patch in my serie to re-order everything.

Le ven. 20 janv. 2023 =C3=A0 08:47, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
>
> On 19/01/2023 20:18, Alexandre Mergnat wrote:
> > Le jeu. 19 janv. 2023 =C3=A0 17:49, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> a =C3=A9crit :
> >>
> >> On 19/01/2023 17:28, Alexandre Mergnat wrote:
> >>>       { .compatible =3D "micron,spi-authenta", .data =3D &spidev_of_c=
heck },
> >>> +     { .compatible =3D "mediatek,genio", .data =3D &spidev_of_check =
},
> >>
> >> Please run scripts/checkpatch.pl and fix reported warnings.
> >
> > Actually I did.
> > I saw: "WARNING: DT compatible string "mediatek,genio" appears
> > un-documented -- check ./Documentation/devicetree/bindings/"
> > But there are no bindings for spidev. I've made some grep on already
> > supported compatible devices like "micron,spi-authenta", but I didn't
> > find documentation to add "mediatek,genio".
>
> Another point - why is this after "micron"? Don't add entries to the end
> but in order.
>
> Best regards,
> Krzysztof
>

