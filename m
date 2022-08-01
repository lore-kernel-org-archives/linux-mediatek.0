Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2002EC19F2A
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 12:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcoRKUZxcX+fwnP/w+Ek0L1ccliKcMJGGIMkqg+/gBk=; b=mODuwwb8Q/nW4kbmAHSp0nbK8e
	5kZKiHAi6O22+j62ovubPGEhwCO7sQBzHAbmssh2wQWyvAsKkeWyBIH/a7ZgP/67hqhSsfZplHp6R
	WC1ixCWiqgFDy+W9Syv4BupbAPTj1BSxzJH/9H+AHdmTnSSY61M/3Rl9s/0/egdUBu75IkqopTHVZ
	eHfwFRbXmyEnen8QYwGjKjgbBzWlKOrjxvJm3W6+ZLYNL28GL4MAnfei1U10e+Py+7GO6IqZIWd3z
	vIjj0OD9oOmC5waIMgLGLS42VOTFt9CpXTnPx0ZRXC1Z5+3xtqUtpfJGcACpPFiQkvd5+WjLLploQ
	oVUhal3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIUmo-006Jzl-62; Mon, 01 Aug 2022 12:44:42 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIUcj-006Ddi-A7
	for linux-mediatek@lists.infradead.org; Mon, 01 Aug 2022 12:34:24 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id j195so18631113ybj.11
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Aug 2022 05:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LcoRKUZxcX+fwnP/w+Ek0L1ccliKcMJGGIMkqg+/gBk=;
        b=8Qq67pSUym7bRxaJ1wXQxajEMJS6HpKos8PyqVw/AIYaTRUkyuiHDv0eycBw7WteMz
         vA2ffmtRj5NpE9imFKTBnZZHdh7Veak9BjcfMJEO1TvQsTZncZ8wpJSSeWS/Fzl2r4oo
         crxtVikU87MU4cvow8KAMXuSE8Fw4ECrP5KwDbAKdS8agCFU52209EKhx1fzCsQSWcmG
         Bf2T4r9FGmsl0SSufopazQYH6qUx7esh3yBY7jYpKJtzHa+9ugcTbzjnNcl7YUrB99/v
         9oEa7EI5KFpJbbLUS6osrgC2g3+vL4a3PJZdTepn337fCpKGSdA1qUQAomSfAXFQxHJJ
         e1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LcoRKUZxcX+fwnP/w+Ek0L1ccliKcMJGGIMkqg+/gBk=;
        b=xJrU6vMiJgHSiAbnOhHeidLuNoHsB56XHhDcjM2jvHJB2EaQakYFvQRt/s4HvfHv3j
         vbzWANOruNF1MJR16Flq8v/diPZNUZPz9g4VGvoft3ncr/yL8TZCaQzVvulqOnBDdLSU
         mwek0hPsYu6zBgxkEqQKGLcKOmEeOZC79BWNvnPjpxuuT2SoM07y1DJDc5Z/5y0Vb5s0
         zYtx/BjOwnDi99HM4xaZlcagrdPtoP+YvrdBGUmKcIurTmtMMdgFdVWlMhjmgiVJDfOD
         5e0wejvH2zwCWOygvs0vAgOrSUX94tYqv1HIyGs9lfbAdCPKmuH5PRm+8E/1ItgwZUsK
         T9kg==
X-Gm-Message-State: ACgBeo3CzL27LuNfaSJYMO9/4zanaOwQ8KxANMRr7wWrfaP4RjTPrTcD
	6vUnOLqCg2wlu61sL18gg8WQW12LNj0i3gRwOwSczw==
X-Google-Smtp-Source: AA6agR6gUV377VODoTtcZyENpHL6zTEL/yl0+xktWswsikj2XjC6xG8FsEO1Dd8D5SwcKI+6sZgTq8Xo9pCEdETIOIU=
X-Received: by 2002:a25:4941:0:b0:670:24c7:dc96 with SMTP id
 w62-20020a254941000000b0067024c7dc96mr10354775yba.22.1659357247554; Mon, 01
 Aug 2022 05:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220726135506.485108-1-bchihi@baylibre.com> <20220726135506.485108-6-bchihi@baylibre.com>
 <20220729201421.fxybo57g46ftghgd@notapiano>
In-Reply-To: <20220729201421.fxybo57g46ftghgd@notapiano>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Mon, 1 Aug 2022 14:33:31 +0200
Message-ID: <CAGuA+ooqk-tf5FVfEbA0WdjTOo2fPJi-+AaHDC9jXgw=3vKq0g@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] arm64: dts: mt8195: Add efuse node to mt8195
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org, 
	amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com, 
	fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com, 
	abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_053417_641780_8FEFB717 
X-CRM114-Status: GOOD (  17.98  )
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

On Fri, Jul 29, 2022 at 10:14 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Tue, Jul 26, 2022 at 03:55:05PM +0200, Balsam CHIHI wrote:
> > This adds the efuse node. This will be required by the thermal driver
> > to get the calibration data.
> >
> > Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8195.dtsi
> > index 0ff34edcf8c8..4fbf24b5d202 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1236,6 +1236,22 @@ nor_flash: spi@1132c000 {
> >                       status =3D "disabled";
> >               };
> >
> > +             efuse: efuse@11c10000 {
> > +                     compatible =3D "mediatek,efuse";
> > +                     reg =3D <0 0x11c10000 0 0x1000>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     lvts_efuse_data1: lvts1-calib@1bc {
> > +                             reg =3D <0x1bc 0x14>;
> > +                     };
> > +                     lvts_efuse_data2: lvts2-calib@1d0 {
> > +                             reg =3D <0x1d0 0x38>;
> > +                     };
> > +                     svs_calibration: calib@580 {
> > +                             reg =3D <0x580 0x64>;
> > +                     };
> > +             };
> > +
>
> This commit doesn't apply, there's already an efuse node on mt8195.dtsi. =
Please
> rebase.
>
> Thanks,
> N=C3=ADcolas

Hello N=C3=ADcolas,

Thank you so much for the review.
I rebased on top of the latest kernel version "linux-5.19.0" but I
can't find efuse node on mt8195.dtsi.
But, this node is indeed present on mt8192.dtsi.

Best regards,
Balsam

