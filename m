Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08269CA0EE6
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Aug 2025 05:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1RoE19cvLBaBi0011V8fYVXjhA8rp/exNRIajTxVcc=; b=q4mX6/AKWLRjndAWAcsjeaEckg
	1E+aHO43gG74EyEoaEyK+LY7HXaEaivp5rGdIdeckrYEhKWRYOuxX6M3EHGehxsRcMrwsiAdXbYHx
	mOANDPxJritCYUq54tGfXTc2dS1WFenqY6rIQJ5sunPM3BPH3wOUrIArKSKByQzEk7OTacByiB1/d
	54ZiwEIEj2/3D7FwgjPFM5qZ0ZRfou6Pk9UjA6kwA6EqT1MIUHaFBcfdzhnciSJ3N7gLH93Kt11zW
	CnGR6knLY6I81cgvd9iFMdbFV7av5elyHcyHf3Q3kb9ISseqx8Fa8WL+iokNFlabNbYw/W+ixK8jn
	8Gzl0KaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEtB-00000009Qm2-1opu;
	Tue, 19 Aug 2025 05:28:05 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEt9-00000009QlD-0vDf
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Aug 2025 05:28:04 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55ce5095c8fso3947286e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Aug 2025 22:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755581281; x=1756186081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1RoE19cvLBaBi0011V8fYVXjhA8rp/exNRIajTxVcc=;
        b=Es/x4xed4X051AlFjA+l7RlMRPrifdpLjZggZsK1f5DbTRH/AO3Tas5nEC1Nw+Li8R
         UOWVHUjKFJodNYu7+0eviwVTHv0nKj8RqzNMOIdcnshAZpLGHNQLxCDIvboio71gM2/Y
         Tn3V42rRibhCDSsWP3au6bT9oHZr1KPWX59Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755581281; x=1756186081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1RoE19cvLBaBi0011V8fYVXjhA8rp/exNRIajTxVcc=;
        b=B4pre8sJ0ry0dXkCj2KBsleB159PSA39KvEVDxX6OwogQv/EZSBI+sSI0MN2tAbw+R
         oNIeOF1ELYlFGRJtQN2qWmIY4H8Usu56Vs+SvSzf8Vc/A/h4mj3sgF9jb9V5VL/qq6e2
         sghKcwU8Cpp8dIAwHMZFtDCl8VRzVA3WEfJSb//98eAULnpgHZCOh7JtHrgLi+XCCp+m
         fk2w+Ie2HsfRjW082cK2lHT3tZ77kenWL5Fp51CVsFSRTmpbcy6KIDGCn3EVTE3NcJad
         hIX0XchSjYnmPM6vdcnsOpdVaSvAWDDy6sRaHDzx0UTOX8fS/JzUphbdl0xfkbYbzm+x
         Br9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXLAmFQfEA/ecjReFUrcCFvWMiEV6wP1iouIqADqdo/eDAf2KblQPGJvAa5//F43Aeo54mGOs1oc4gIDMoCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgwuyw5DLC3yvwfSMKihD4McyBF767o9DCVX3TePvCYh/BrIHt
	vykoHykaG5uwYA9WgYGkwOikocETRwYgztfI/2WgE52JsrsxRdDstdHaPfouXKzr7QQCaaFhOmd
	93595ptL+DYGGLeuRE6ZFCPT8dwC8RjKxm0qYwpmP
X-Gm-Gg: ASbGncvyRQ26boiWd5swfMhA8M2MTlqLZN70KJ8HvP28oEMr86EhWCF2tx7bvTUmzos
	M52bEZnDI6F/EjGiJVlmWmzVrcJ+BEn5n4lMDggMocdUtD3l/66d95oYhFL/SlRO5xSyGzuSkqU
	tXCOQJ1Ikf3SMtwVDhMach5VDYSCHy6Uu/IrsD28+fFz+xzs6Xw4uy1vgn2noiHkhKqiIhesqL8
	7/7Tm3pfWGcJSVrWd/XeVgV534htbgHaZo=
X-Google-Smtp-Source: AGHT+IGQHTGEbyr4SR72kvidWQutZvf7AK9o9RoOcU43ggNdNpSPatYscdMG6FtrXgyqF7WItvuWeeeG17g3X0SMn88=
X-Received: by 2002:a05:6512:1585:b0:553:2f40:3705 with SMTP id
 2adb3069b0e04-55e007aeccamr350494e87.15.1755581280895; Mon, 18 Aug 2025
 22:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
 <CAGXv+5EHk=f62+KiLo-aWMcd0-q+_59kno+uOW5rdYaq5q+5tQ@mail.gmail.com> <CACRpkdbWctNH0XJfcHfVJM9Etp0WCXpdyhhyaQemH-Xc0LDr0A@mail.gmail.com>
In-Reply-To: <CACRpkdbWctNH0XJfcHfVJM9Etp0WCXpdyhhyaQemH-Xc0LDr0A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Aug 2025 13:27:50 +0800
X-Gm-Features: Ac12FXyZj9pu4uTVlJ9GtMYFjXUlZm3D496E2G53MlvCfEEQUDKze_RDvsyqUZk
Message-ID: <CAGXv+5ECsP7_wbdcaAkWuD=RyJiJpPe4r60bhD5U8xUvEBzmXw@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: mediatek: mt8183-kukui: Fix
 pull-down/up-adv values
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Eugen Hristev <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, 
	Sean Wang <sean.wang@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_222803_287449_72AE0A75 
X-CRM114-Status: GOOD (  19.76  )
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

On Mon, Aug 18, 2025 at 11:22=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Wed, Aug 6, 2025 at 8:38=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> > On Fri, Aug 1, 2025 at 7:18=E2=80=AFPM Julien Massot wrote
>
> > >                 pins-clk {
> > >                         pinmux =3D <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
> > >                         drive-strength =3D <MTK_DRIVE_14mA>;
> > > -                       mediatek,pull-down-adv =3D <10>;
> > > +                       mediatek,pull-down-adv =3D <2>;
> >
> >         bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
> >
> > and so on.
> >
> > ChenYu
>
> I agree with ChenYu, the more standardized properties are the better it i=
s.
>
> All the custom properties makes sense for an engineer working with just
> that one SoC (like the SoC vendor...) but for field engineers who have
> to use different SoCs every day this is just a big mess for the mind.
>
> The standard properties are clear, concise and tell you exactly what
> they are about.
>
> The argument should be in Ohms though, according to the standard
> bindings, but maybe the value of MTK_PUPD_SET_R1R0_10 is
> something like that?

For reasons I can't recall clearly these are just placeholder values
that the driver then maps to the R1 and R0 settings. But at least they
use the standard properties.

The reason was either one of the following or both:

  a. not every group of pins had the same resistance values for R1 & R0
  b. there are no known precise values; the values depend on the process
     and batch


ChenYu

