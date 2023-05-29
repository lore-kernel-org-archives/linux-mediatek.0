Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74295C77B7E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 04:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5EruGneydWrebItl4MLqWHex5pJ5cJmkComuzWUkfk=; b=lSavdB+j5HFpeaiJ8M3f6awRNE
	IaJ/PEn9gkckuIYvyJM+kPpZIlFuXX9qIPa5khHn7QJftirKj7aCt1UzNyIYC9FBw1sg51Oc7QSNz
	rDUfH13Kv6AwDjv4dagb2b5c9qEoZd848besFISmPax4/RGnJ5Kkr57tT8OgqprsBnNHgirUu6yzf
	PCILSLxXW5tyaeC4/MMq3/cWMRZwsyVq05j4d0JEY6P/te3XASWp8IaemcYFcWW547UevlUvasV5U
	Vl77wp/x/OE0KWvekMFfByYLM2C1OTPxJoNBpNcRR1Cv/YbWSQjnCUrYdsNjgRi3K8bqAND2lO+WT
	K53VYl0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3UMX-0094JJ-3A;
	Mon, 29 May 2023 04:20:05 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3UMU-0094HE-1H
	for linux-mediatek@lists.infradead.org;
	Mon, 29 May 2023 04:20:03 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-19a308a045aso1277534fac.0
        for <linux-mediatek@lists.infradead.org>; Sun, 28 May 2023 21:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685333996; x=1687925996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5EruGneydWrebItl4MLqWHex5pJ5cJmkComuzWUkfk=;
        b=mMszb3MlFKUFM3qvQnr0h3j1Lk0OqdLggIRYGJoLXUB2YjcZGuVde7evV6kvVI4KG3
         AGkMx+HJptcKovROxvCC+Rkh6Wl+aLuIliXb3stWWbwR8jJT/PoLLbj6mX7N5ct4gXMV
         iH2MkgvxOlwZnZnqlSxQHK2w8o8ONphywonkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685333996; x=1687925996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5EruGneydWrebItl4MLqWHex5pJ5cJmkComuzWUkfk=;
        b=TTnZbhts9uo4sISVWF21l4dYfo9Y+bTsWjdpAXURjlLj71yPZEB5Yw9kgxDCzpweDW
         nQOo9yk4Fz4a4Sra0pG6/dXHNru9yeWoRNVGDclsdez+MKXE5PDCn+XTHsshEQLeYIX5
         YCvVQcjjf6Hth5060B96eulCzDkN+6xKqWaz0LMmIM4QSVhM/OZlmvYXf6DFQSXqLsnj
         ji20LeAKOdUTYqYgL9LuVVdhnNkXegodOSbWdRxfq/ds/Y2z1RhrwHvm6EecLlFi8nQ/
         jRlRDIrxQS6odf+5M9jjYbLil6i4JTJw+4BGX1FiDWvMwVDDwbcpU2lK5fFlsQUoiKuK
         g7hQ==
X-Gm-Message-State: AC+VfDwjJPW88fx8CcyHZ7y3TkOEUUzGntvXJZ/T0oJ+183IRgTpPv9Z
	K+aWd18MCe7Kvjqc64Fc5tFlE+C/i0aKd0iIrxaHxQ==
X-Google-Smtp-Source: ACHHUZ7ShijQbDXG5LNkOewm1aTPMRKRtRGdrly+ELkwdr+vwO4+T7tCAPpPdOqloRkeGytOrvqv8JCRVQBRNjVnHe4=
X-Received: by 2002:a05:6871:4c5:b0:199:cae3:f9d6 with SMTP id
 n5-20020a05687104c500b00199cae3f9d6mr4345361oai.56.1685333996420; Sun, 28 May
 2023 21:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230526100801.16310-1-uwu@icenowy.me> <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
 <0803e9037a8a2ce96fdad6ec209991dcda2a30ca.camel@icenowy.me>
In-Reply-To: <0803e9037a8a2ce96fdad6ec209991dcda2a30ca.camel@icenowy.me>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 29 May 2023 12:19:30 +0800
Message-ID: <CAJMQK-gOtqE=TzmQB+VM1KjScUQjLaKv6c8msv4-EKekritWYg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm: remove panel model
 number in DT
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Doug Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_212002_432161_3E8AEF5E 
X-CRM114-Status: GOOD (  42.03  )
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

On Mon, May 29, 2023 at 12:14=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wro=
te:
>
> =E5=9C=A8 2023-05-26=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 07:24 -0700=EF=
=BC=8CDoug Anderson=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >
> > On Fri, May 26, 2023 at 3:09=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> =
wrote:
> > >
> > > Currently a specific panel number is used in the Elm DTSI, which is
> > > corresponded to a 12" panel. However, according to the official
> > > Chrome
> > > OS devices document, Elm refers to Acer Chromebook R13, which, as
> > > the
> > > name specifies, uses a 13.3" panel, which comes with EDID
> > > information.
> > >
> > > As the kernel currently prioritizes the hardcoded timing parameters
> > > matched with the panel number compatible, a wrong timing will be
> > > applied
> > > to the 13.3" panel on Acer Chromebook R13, which leads to blank
> > > display.
> > >
> > > Because the Elm DTSI is shared with Hana board, and Hana
> > > corresponds to
> > > multiple devices from 11" to 14", a certain panel model number
> > > shouldn't
> > > be present, and driving the panel according to its EDID information
> > > is
> > > necessary.
> > >
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > We went through a bunch of back-and-forth here but in the end in the
> > ChromeOS tree we have "edp-panel" as the "compatible" here in the
> > ChromeOS 5.15 tree and this makes sense.
>
> I only have Elm, so I am curious that do all Hana's only rely on panel
> EDID to use different displays?
>
> BTW The Chrome OS document say that Elm and Hana are both board based
> on Oak baseboard, should the DTSI be renamed mt8173-oak.dtsi, and still
> let mt8173-elm.dts include it and then set model information?
>
Oak is a reference design board which is not in the public. Since only
elm and hana board are in the public and the difference between elm
and hana are not much, instead of creating oak.dtsi, elm.dtsi (inherit
from oak.dtsi), hana.dtsi (inherit from oak.dtsi), we decided to make
elm.dtsi as the main dtsi and let hana inherit it and make its own
changes.

> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > ...in theory one would wish for a "Fixes" tag, but I think in
> > previous
> > discussions it was decided that it was too complicated. Hardcoding
> > the
> > other compatible string has always been technically wrong, but I
> > guess
> > it worked at some point in time. The more correct way (as you're
> > doing
> > here) needs the DP AUX bus support and the generic eDP panels, both
> > of
> > which are significantly newer than the elm dts. So I guess leaving no
> > "Fixes" tag is OK, or perhaps you could do the somewhat weak:
>
> Well I remembered when I was developing the support for Pine64
> Pinebook, which is also an ARM64 laptop with an eDP panel (via a DPI-
> eDP bridge, ANX6345). At first I didn't use any panel node in the DT,
> and the kernel maintainers argued to the bridge that seems to be
> connected to nothing (because DP is a discoverable port), and
> fortunately 2 Pinebook SKUs (11.6" and 14") is finally reduced to one,
> and it's then possible to hardcode a panel model in the Pinebook DT.
> According to my memory, the need to specify the panel is to properly
> handle eDP panel power up timing, because it's not a very standard
> thing. (Well, in my memory, when I was testing that code, on a
> (engineering sample) 14" Pinebook, the EDID timing overrided the
> hardcoded 11.6" timing and it properly works, the 14" panel is 1366x768
> but the 11.6" panel is 1920x1080.)
>
> (BTW when I checked the DT of Olimex TERES-I, which uses the same DPI-
> eDP bridge, it is still in the status of a dangling bridge, and of
> course it works ;-) )
>
> >
> > Fixes: c2d94f72140a ("arm64: dts: mediatek: mt8173-elm: Move display
> > to ps8640 auxiliary bus")
>
> Well this sound quite reasonable, as the kernel should have proper AUX
> support at this commit.
>
>

