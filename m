Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2174AC43219
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXw2DcIrd4sYwZp2Qf6GO0lRe5Jh56EBfVUnFYKu6RE=; b=Z5CMT+Pilkq1JzdiuxW7n2HixD
	p9YepV2yQyoRWEIApxDR0MdPm79TS5HzS9kwa1KURTFF39/cXYQMw8r0uj+GrB3H0s9bR90Q33M6b
	pcpLCrkROQqcilqqJYBNRjuWlN3ZxMCZJdkFa/xIDGc2TPH1mBk5mya6ykmcLBdy1nwk5MhxDaVzq
	AH8pJ25yqfMxV40xBIK6mmU3ljH4ycBjFZKmC2CPtZvJDZPSYEG/Dyf4buG9wL/JzYVUdtMInEiE5
	xrnFLuroBBRxARSretOMMR3T98UVpEvCgPpSKPzTjp5BBzEwuC7r/DtKZEUTNIdz7CdZkoI+dbTR+
	Dze0Jydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouyGq-00CVJK-Ma; Tue, 15 Nov 2022 15:54:44 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouyGe-00CVD9-UQ
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 15:54:35 +0000
Received: by mail-ed1-x52c.google.com with SMTP id v17so22473057edc.8
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 07:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXw2DcIrd4sYwZp2Qf6GO0lRe5Jh56EBfVUnFYKu6RE=;
        b=VdrMWd2C0zRlIU+FT+lgMorBgLSdXIaGdRiqQEjfe8ICZQFWZbSQJdhtD35B6a6TBT
         esMxNNkTUrQltwheZBCw0jpTcMirEaF3UBLCAQJNGSC5SvqsykCjHUMWADXOU4zkzN3N
         zRcvodFQ2fJTRSA/8SKxycjIaZ3P/YHyvJCNDYCbN9ow9C19ZSnTmkk8bvOL0M3lRLf8
         gtDCM0hKPwxajoUeptIpXUgt8dlhddD74sFXXX+qYapzoehSlThwIpxBYUp3g2URDHqf
         VdCp91/IM06Ap6P8h7XkNAyZa/Qo7AIm/hG/vv/5oRLcpePO4Rzhv5JYp3oS756qwqg/
         M58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXw2DcIrd4sYwZp2Qf6GO0lRe5Jh56EBfVUnFYKu6RE=;
        b=LGAes33iFXKtG4lbcFiCBXZykMwWBKIu3dPWCxU9vC6uEfXsREF3lQQac5tgYqstZS
         8QOaq4WLPjE3zIXFsyhsxjNpWSdKo9V/CHgW0u3whN2QXhz6ft5HVAKGXSP/Q/TyY0Vx
         iWpAqfF4Op8fcQSebqGHJVerNEaoGDJnX3CiYihG4Tvrm2ZRc8tKkqB5vkrzJVkhvGim
         wm0NgSYeaSOj652uJTKOLQKW2vn2b5m/kQDXS4fzlwGR+qYE7OWM9afUPwOeKqdDKrRE
         8sy8pyiMm3XPL/+5MN8pkDAZjBdiJjWQN+B/Ea+X3rgYqITV2CSVtcW5XhYxUu5SkVr8
         m71w==
X-Gm-Message-State: ANoB5pkndphwNMjNBccUz3rYlc/hv1/qlRFYWfYxk+mNtTHNB5iFa9RN
	5iup/U/vKQsds5gP8nTKTGCHhxA1mERJ0Mu1RW7Wjw==
X-Google-Smtp-Source: AA0mqf5TE5bV3zOgHOtylol+IUxKYYKrgvfQtjxF4BS+55SiwwnZkcIcQo0LiUhdzLshA1UMU7fopza3TqY0XOlXoGY=
X-Received: by 2002:a50:fd9a:0:b0:461:b279:1175 with SMTP id
 o26-20020a50fd9a000000b00461b2791175mr15686083edt.124.1668527668323; Tue, 15
 Nov 2022 07:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-5-5d2bb58e6087@baylibre.com> <fe898d24-54fa-56bb-8067-b422a3a52ff5@collabora.com>
 <CAFGrd9r70XRd=4Ogei+U2QXQny7LhWr9bDCRNYco+Bsy+2XqrA@mail.gmail.com> <c426918a-8d63-5c40-4340-6c918296814f@linaro.org>
In-Reply-To: <c426918a-8d63-5c40-4340-6c918296814f@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 15 Nov 2022 16:54:17 +0100
Message-ID: <CAFGrd9o5GmqMS=MRq+EM+_T5kcHS2qftP0g0smu2W4QXBLozLA@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] dt-bindings: soc: mediatek: convert pwrap documentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Fabien Parent <fabien.parent@linaro.org>, 
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
X-CRM114-CacheID: sfid-20221115_075433_277334_1C5E3D00 
X-CRM114-Status: GOOD (  14.31  )
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

Le mar. 15 nov. 2022 =C3=A0 15:18, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
> >>> +maintainers:
> >>> +  - Alexandre Mergnat <amergnat@baylibre.com>
> >>
> >> I say that the maintainer for pwrap is Flora Fu <flora.fu@mediatek.com=
>....
> >
> > Flora Fu is the driver maintainer. As described in
> > Documentation/devicetree/bindings/writing-schema.rst:
> > maintainers
> >   A DT specific property. Contains a list of email address(es)
> >   for maintainers of this binding.
> >
> > My  understanding is this field is only for binding maintainers, but
> > not related driver maintainers. Are we aligned ?
>
> Usually driver maintainer should be also binding maintainer. You can
> have more binding maintainers than drivers (and vice versa), but it's
> less usual to maintain driver and do not care about its Devicetree
> binding (unless driver is also for ACPI etc. but that's not the case here=
?).

Ok, thanks for the explanations

Regards,
Alex

