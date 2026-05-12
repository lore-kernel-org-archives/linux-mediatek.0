Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DEFCD4855
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=; b=uez/97tAG0Nq5x6Ib+XMmbJ+Qh
	Ahjl1OdzWWlLi4dA0UyKK3N7YQp3bTvu23ExGjDLx1rZXTi5NlnOYQzhIq8REIilAi2lkYOQq7iFm
	HdXZrjwH31ZnEdidkZIbVSF9IoI9NorBQVSOAUPLI39xeoszgkqpFeUHDcph4nFdShDouCv4yFsFM
	0Klr1xWzkVhSsrGZH4Gx/vb71ma+k+PjUoI+Qui2BM1pn+VG3TpC8L63SF8515mYQoQnZVn4ptbJN
	p1PEntO0rD8R95ZO14kKwJpRjhu10n2U6Zo6yck7BYHN9oY2KEGgyYVkxmm3Yy51BiWBjpJmgox5n
	51rW4gKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj8V-0000000GDcu-1cay;
	Tue, 12 May 2026 09:10:43 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj8T-0000000GDbb-13mA
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 09:10:42 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a8891febd2so6237599e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 02:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778577039; cv=none;
        d=google.com; s=arc-20240605;
        b=IT9lyxT65dslyKbDHiMB2MGLRB4NwcOcOfZJz2JUL3PELNx9E28GiO0ZC6fZhRTNyd
         gA4V33mFFTL7OMEbI9lucBZ5iwdXROSg/9QuBCAZ7TVMxtz6XYcgGgIB8lGr+6g9zmv5
         W99JBfWLrcZp7nWwVKBmNoBQQOPT6dP3BG4TClIyDVWBfQ7wv6mIFvnl0SoKpdK1kbbE
         t3wu59xsJZCMxWqp3OGDNnyFWbrwX05q5gGKA2P787kjRhSRKlCA9dpNOvvf4OhFOb4I
         augz119fbXjDi+cXQXSgJWD/zDez1OW3G72eecK9m57bRxEC21jVBhiEZrjf2VHTOEcW
         PRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=;
        fh=Zkb9pNvMYSeDTbjRJJF4a+vb45Jq3z78FA5icV/Wseo=;
        b=kZ0Hy2oEb9JzoX1BU9QfAFDbIYFbHD4uCL/7X8xNitm9CCfYFy3r3nxzv7A+i/bth8
         iFdyw7DTU0E5lfldL4yqpsYO58Yk0Cc9rRuWml4wKUNCsUw3RVQw91d1TSbUR8S759L1
         hj41aGLU2vJz0vK71G1CmZxtcUwPagNcoZ0ntkeH/8lcGCJGNnCVQd5xfLO49ewjXENI
         ac+tlreB+NdTn9VGJPQCMAkeGAcFOOOPP+AnXwit10HOnMqpyqfv7A6BTyZCFoUTWghP
         GiTs22/rz5rCL5EPTRmdhL/zDfFri9t8jp5asIw8BF5FWmFYyLUPe8AKPzNJexTEJb81
         2jcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778577039; x=1779181839; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=;
        b=aPKDLQgx9wOlRuBxL9vlKUK55eljcqEDbP2mQyJrpR9TmRXls1KQhE9NbFsry8MH3b
         WReSjcwiJbcCm1PJ2CrcnIxBMMpGHUCq2b8ie+1Uuvnp82EGLfUVFYWHZEQz0FmjDJ4K
         xg6YlGSKdqcZ5oHe4SnBswr7qo7uSuQFBtCng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577039; x=1779181839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=;
        b=LIX66JiAQLJwJxn7loERne9MmD2BZulaAzYKNpA5F9ilGFuq/YucqVkCgu0cpLL9zh
         6YC63S0S5pMTyOcnTAna2YMb787Exft4qm0L8Jd+ZiZ62Ml6JviiXZIpC+6kf0Dfrq/6
         nPZi1VWx1BkL0xYfvtlwadBWMj2UZGx4RQZMWRtLiNgF+7DNJsB7vMGohPQUA2n8T/XH
         r4saJfVACEBExJUET8adZ6p/M1mHhXIL7k6dwAIA4++QwfH7E8a5iWDUw4kMXqixLU9s
         rSdyVAEmbNJI7t3TkC1MFnMg1soxRf4uCf2+oiYcNpHmSyZQMwkx5YNu/VsbERbiv6VV
         ecXg==
X-Forwarded-Encrypted: i=1; AFNElJ+wmOGUFYwv1tGGPC3r3KdCvVIfy2Mn0Lc0fUMoCBGSjSVH/LmXYOrZf/XOcstzewANVKaAjlJf8eVZDYnQhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoTAWbkhZPTidoKr9JOrYDIuK7WtrDSYf12ChCflqENEF3A3oX
	GseHgeudjuBF66N0zRTIyUTlOkm47J924y4ljvFRyPGnfLOEsSJrOXVrYyRYvfcih38CaRYt+Z3
	AYy8/xrt7aEX2zMpbJCtK8RIhorgUuXLZozXZrOjU
X-Gm-Gg: Acq92OFNKwfUPs6ASPlLyH6Mt57WHXXKZr1rWcuau/LbjjE5JLqlDaTc4QEi2KDY3Zg
	t+VPl8hNYfoiuaJr9FwcH6714RkrJd77ZyNoJrl85Xh0s3QzktniMwmE5KSIpGQ7l0yR7pg23Qp
	WMDe3zdnqGBnZtRuPf8yIYEsH7EQyz0ntuwZKDZm0FBcZ/W9vyo1GVQaz44xcFW8hleGrq2Bpn8
	JxuV/N9JL+uc1xbybTI6dvEhGF2X8v3uDcSD92wf+/Dypvyso41fSHQQbCL8tnFOh/meecD7CG3
	D/6GWp0a+3V+iGUIrMQlETfKcsEZwZ8NvRDF8g==
X-Received: by 2002:ac2:4f03:0:b0:5a3:cc81:eff3 with SMTP id
 2adb3069b0e04-5a8e31e792cmr741475e87.26.1778577038810; Tue, 12 May 2026
 02:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
 <20260504072748.2580172-2-zhengxingda@iscas.ac.cn> <CAGXv+5F6BSmqq5HEybuCSwt75LVzh5gvs2wQpqy3vgfLi60Dcg@mail.gmail.com>
 <4a43edb8c7ae3f96f77272db89ec6450ffa28876.camel@iscas.ac.cn>
In-Reply-To: <4a43edb8c7ae3f96f77272db89ec6450ffa28876.camel@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 12 May 2026 17:10:25 +0800
X-Gm-Features: AVHnY4JpFJ80xfcJKb4R3fVCclO5uQOrLLkEvtBAuF9RxcpiffXxdfYLmlfODZk
Message-ID: <CAGXv+5HFD_8e7odEwXk3vXZThBAor0PvVCbb+=wjR8gxwqwnqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8188-geralt: enable Wi-Fi card
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Liu <hui.liu@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_021041_354572_DE7E86BD 
X-CRM114-Status: GOOD (  31.60  )
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

On Wed, May 6, 2026 at 10:14=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> =E5=9C=A8 2026-05-04=E4=B8=80=E7=9A=84 15:34 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >
> > On Mon, May 4, 2026 at 3:28=E2=80=AFPM Icenowy Zheng
> > <zhengxingda@iscas.ac.cn> wrote:
> > >
> > > The mainline pcie-mediatek-gen3 driver does not have code managing
> > > downstream device power / reset.
> > >
> > > As the Wi-Fi card on ciri is a fixed device, set the related
> > > regulator
> > > to always-on and use GPIO hog to set the status of its reset pin.
> >
> > The plan now is to model it as an M.2 E-key slot (even though the
> > chip
> > is actually soldered on the main board).
>
> Interestingly I saw a "PCI_PWRCTRL_GENERIC" driver in 7.1, although it
> does not support toggling #PERST now -- maybe this should be done and
> used instead? (Well it looks like the driver had existed for some time,
> but it was for "slots" previously)

#PERST currently is still left to the PCI controller drivers, since some
of them have dedicated functions for it, while others use the GPIO API.

If you check the history of the "PCI pwrctrl framework" [1], you will
see the design choice.

[1] https://lore.kernel.org/all/20260115-pci-pwrctrl-rework-v5-0-9d26da3ce9=
03@oss.qualcomm.com/

> Thanks,
> Icenowy
>
> >
> > I have some of the patches ready, but I'm still working out the USB
> > side of it.
> >
> >
> > ChenYu
> >
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > index 8e423504ec052..c25780098103b 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > @@ -544,6 +544,11 @@ &mt6359codec {
> > >         mediatek,mic-type-2 =3D <2>; /* DMIC */
> > >  };
> > >
> > > +&mt6359_vcn18_ldo_reg {
> > > +       /* Used by WLAN */
> > > +       regulator-always-on;
> > > +};
> > > +
> > >  &mt6359_vcore_buck_reg {
> > >         regulator-always-on;
> > >  };
> > > @@ -1145,6 +1150,12 @@ pins-en-pp3300-wlan {
> > >                         output-low;
> > >                 };
> > >         };
> > > +
> > > +       wlan-reset-hog {
> > > +               gpio-hog;
> > > +               gpios =3D <145 GPIO_ACTIVE_HIGH>;
> > > +               output-high;
> > > +       };
> > >  };
> > >
> > >  &pmic {
> > > --
> > > 2.52.0
> > >
> > >
>

