Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6277DCD4851
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 06:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwWW1RLqow3F42bqTyKYH/fkZiKfkBMrFPf70+Vmgkk=; b=M4v0ZA3E3M8hKIqP3rFuA/QR+i
	/ulzaFMuIs2NPzf3Mn73vfNYylpmYg6Gp9eTQCE2v8QeeI5wI574MNvjqGY/euLFTNayW1hza3wZw
	P8PIg+WPM65ttD9Lm1lmVFtgV4AoJ7SVHwoz5PVE0a3tlrBIEWnQ715MuEA0kY9yTFTVY3aXOWeuy
	Wm81LxSPsjgJJUmoQyCcSa2eT7auaXCr3Jx+APxbdVvJ39GK2f6Vm4lalh9V2Gxh2RI3ewWVbAhfw
	4GDcs5kZFSoEUDM0KV9UuInGFvw5JYtTfghNdOEtC1b9u8Ozuasdi85+1Y9z9I4tuwVvptwDTVNNk
	HF0MTEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPpo-00000004kM3-090u;
	Thu, 14 May 2026 06:46:16 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPpk-00000004kKo-1naa
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 06:46:14 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-678a16429c6so11624180a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 23:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778741170; cv=none;
        d=google.com; s=arc-20240605;
        b=ZYua1/Uu0YcJrSlu+Dxy7QKfI2UNrkLOOYgIjfAPM1dMuAg4B0qAyfjqWmQqOsFWQ1
         f4Tsg/h5gppZnYmq9LS0z/LyTa9DS5FgPiOfgSNxgcDnCIuiQJkdBu60D6JEIeQdiZRr
         MbbgO5n6cm5/Blm09zQD71kZ1Y4PmZeWgQdxwKz1IcnTiDFFc9PAhrxbxUK7yTv7pYrg
         koqGwuOKeIOLqQ1iISWswUscOvgaILH9VgXvJcVP8Ge+DaLnMYIto8pOTyKfYvwQP41A
         zxqTLT83WNekHd6iuAFXwXq58U9t5I7DEfBZ87lhHB9tkac/Q7BnhoN9h6f7M+cLhyGD
         K8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JwWW1RLqow3F42bqTyKYH/fkZiKfkBMrFPf70+Vmgkk=;
        fh=VtWMzn5L1tG2ptu1tXpuwsykvfU78Lrb8ht+Svjt9a8=;
        b=E/UgbrInf2iD/XJqVkpQ+71Hs0R3sRr3vbImyS/8sZbvJVixQkQe781ySn92RQTNsQ
         msiz+BQ5qSUfGGwU2dfpCiCr4/eFr+kQnO8t+4Cb2mACGPNs8gVZJcUz6jLVHzcvUqDT
         DK5BfeWA0g6Gzy+weENGydLamtACJbtWqyn6ioVkzBPfyy8Rr50eB797iGNeKw21RLAC
         7qrRU6p3pOCDMq4lNk7ZOiXEWfCx8bX4t/8tHTDJGbYaGPJJH6TW2VQUhQiXyw9zHNyG
         FdPuyKnGu67/eCYoDhcIgwY7hwA7rh1U1QOKipZQwf+9/Fyf+Pce77qPv1Gmh6mGNxae
         nTUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcc-me-uk.20251104.gappssmtp.com; s=20251104; t=1778741170; x=1779345970; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwWW1RLqow3F42bqTyKYH/fkZiKfkBMrFPf70+Vmgkk=;
        b=Qv2vh/uc2/Rp/CYszwM8Y+c2Vt72P03CE6q36ZLzAyOlUny35QkwqwrW8whjopivrv
         P35khQtaAlPp8j443z6XmIZTyeSJiya5QDnfdSH2OrydYaIcN38uGlCrH0DII3dHIO0D
         TTlHrI6jVQP3PCbWxYvKnNOeEOUXcU43q3/X70ub17n+jJOIda+hlC+oDmsSHSYB7jky
         ApLrM44i92KssK/qzVxvGnsi+NxSLDB1taEC8s1zYKdEZBb6UE1ylzkIPWsmh0yNGlVQ
         FBcPhBYeX1mQZuR+QfKML5hcEnZOgAJ48G6oqGCnTcEXjcHHavlARVU3W9xiGxicGAkN
         LjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741170; x=1779345970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JwWW1RLqow3F42bqTyKYH/fkZiKfkBMrFPf70+Vmgkk=;
        b=j/GxSqAOA+hJMIYQA9G0x+dmpUiVfeAqWd8Ayq5ZBdcdDWeHryTnOYfqQXcNkrgm7N
         QGpmYNOqYHGTamDYa0Q5wvCooI/LPeyR6QCb3Z7yzwVy9NfKWFHHEJpiRxmud1MEc68T
         vTYJ9Y7+GippyIXFx+1UEB0B2yCX+fLjyXvl+O1ZIDMDU3a0tp+dIO7lIkZbxpSvIsyc
         DQGpEFDDlwclOVQNUIp61j67JUxKH995kUGgUydNOb9SskSkaff+cjD/ae9RR0Wtjf+7
         ofVhC/poRGHuyFmE9Fpu8C3vKpwBMRXR4PvoF1G7i/P1f/tn9X6c7HUOGGKc4VJXRet0
         Y55A==
X-Forwarded-Encrypted: i=1; AFNElJ9a5QBqHhuC/lUKpWHUX6lK3ycP4D4p5R+nKYSPgCfaV5IRqcb++kKZbJv7aIDcVbhu1uLxW1ztCoOtsFPi9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBeZbp7B9daTPX1T5LDuxXjQxcy4a0tPj8HsuseRH2nMD2ovN1
	sfzk4ldiarYOMg7Y+mnJAtJvSrOvamgJDXaf3Qf0oIs/UTOCu3z6qJl186zP5/HTOUWbVEi4x0+
	c60C1e3E1+hfrnkpgyY5ZX5yiPGdmAEWZKx9AFi1d+w==
X-Gm-Gg: Acq92OEJUWxLH5URLhJbp+AmOwp9ra5+xNOrUjNTapF1apR6RcZln8R4rp3JEPsqNkx
	CXnR0IgazGSS3KWPv84AXuI4ceWNlbyRD4VmXNU7FvA1+mZ7uwL2FqtbOmL16bWG8XUZZUXjhkY
	PfdzPF5a3KRHvFNK/aQ3B/N3xDx3R4cqkRwJYbYGGvvpvaje7FMm2b/9TdyI0ATyaovvOR30Mez
	5oPLoCQ72TPq46dFtojummtfCVImf6S3Yu3nKt7lIDQ93I9NJyX6fEQe8JeGyAyQwB7K75TBlex
	HeRho/BVzGQQ6S/BLb+X8evKO55BzQ==
X-Received: by 2002:a05:6402:5512:b0:67b:6d1b:475b with SMTP id
 4fb4d7f45d1cf-6830b0f742dmr1311888a12.11.1778741170088; Wed, 13 May 2026
 23:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260502074912.12193-1-peter@pcc.me.uk> <6dbefb2c80964c0394771ae11fd0f9e05486db29.camel@collabora.com>
In-Reply-To: <6dbefb2c80964c0394771ae11fd0f9e05486db29.camel@collabora.com>
From: Peter Collingbourne <peter@pcc.me.uk>
Date: Wed, 13 May 2026 23:45:58 -0700
X-Gm-Features: AVHnY4Kp0uXaRPKAoYXDkfobOxz_it19oo__Cj0m2cZABYgqpxJ1WuoISo_LWOo
Message-ID: <CAPQLkRgeb=o2psp_bjLzdZiW_5E+KBSDYdBBtGVTqYyLS+zCGQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7981b: Add PMU
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_234612_479874_25CCF266 
X-CRM114-Status: GOOD (  16.34  )
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

On Mon, May 4, 2026 at 11:49=E2=80=AFPM Sjoerd Simons <sjoerd@collabora.com=
> wrote:
>
> On Sat, 2026-05-02 at 00:49 -0700, Peter Collingbourne wrote:
> > The interrupt number was taken from a downstream DTS of the similar MT7=
987
> > [1] and verified on my OpenWrt One.
> >
> > Signed-off-by: Peter Collingbourne <peter@pcc.me.uk>
> > Link: [1]
> > https://github.com/openwrt/openwrt/blob/e4b3d5c799aef3be20b7f6079e8e5a1=
4b215c116/target/linux/mediatek/dts/mt7987.dtsi#L246
> > ---
> >  arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > index 4084f4dfa3e5..3c6fbb6c5333 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > @@ -38,6 +38,12 @@ oscillator-40m {
> >               #clock-cells =3D <0>;
> >       };
> >
> > +     pmu {
> > +             compatible =3D "arm,cortex-a53-pmu";
> > +             interrupt-parent =3D <&gic>;
>
> The parent node already specifies the interrupt-parent, so this is redund=
ant.
>
> > +             interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> > +     };
> > +
>
> Otherwise looks good

Thanks, sent v2 with removed interrupt-parent.

Peter

