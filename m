Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F47C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E8206187C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E8206187C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntUICWZE9a4LhZLPwYSychbQkv176zBiljRHb2XpdsA=; b=mzs3xJ+cvke2Dy
	7H+U68uZuRjlnOup1Owz4wmvJMyOIdTI709zPpRcmRG4b9Y3foUcn5ZKVPNV6LoObsB9sHZ2x5gD4
	mlzz2vu5tR1b8YtJ01hcT1iXa8FyAf5A3HynCO9mBUf8ZtRWZPzgr8HIiekGWeFtBL7360vVWM415
	tmQG9WQnx39gyFOzASFOlpHkUw3SAllued8SimMdQdOlsYWKSAWNmMHM0us3Zp5EcqtFGevf13FiI
	Aqw6guFBAPD7S9ySDHyGp0ialykWS5XCMOZX7KM1ptK/1oSqVOIA5bi5/Pr8RZ8yPO1ZamVZ59I47
	PW0qy1OBWYQBEVT6PYIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Kv5-00EYt8-NH; Tue, 27 Jul 2021 11:06:43 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Kuq-00EYok-Sc
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 11:06:31 +0000
Received: by mail-il1-x12b.google.com with SMTP id l11so11705278iln.4
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 04:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KaH6OTwrWG90914prFT1/hBGveSe1LpJn6vY9Adila8=;
 b=SDh/ZiBj+wM/6RLopNPtxhhmjY4AOhwtUlsj7CBXB5kWyYXr4/eEwwMraRCCYOGBu8
 4+gwT7UhgkK6MDRdhMlBprwwCgOKmjdnT+99U8rD/ZksvEtppzkTxzsX/KkM4vygStQR
 5W8tG5BXychsijrX3WI5DDmbAZsvu6Xwzxre0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KaH6OTwrWG90914prFT1/hBGveSe1LpJn6vY9Adila8=;
 b=G91qw5RORpJd4M18yxA+aTCQG3GHmjS2j7PlCNubQbsFDisYLVhbZUdxTk+KB+fJrK
 6Fpy/oqDovu+CYMFHd/2gC9FR074zopadnjUhN3RxsyPLFtiPQFG9w6gv4gApPdVJpTx
 A8z+520XFrIcTYz0TF15rXxi1+UI/DCMBseisyGGsHz6EsbzqYnAH9/d7TMIU4z/02Y4
 dvt/I6g1H/Po2s1Smy+Q4WwslnoUgWd2qfYNW+bXkoGlsJnLTALKTLvrRlkur9yZi8Ln
 cdYUGARsEc1b8GnHNMecg5X934pn3P7wPCsbnu24gKmz3FUFGsoZ+Z7cwxu8fn4pjCs3
 0L3g==
X-Gm-Message-State: AOAM531uYdNIpUe4ZBkDudk1j5zHMYmAKU0yIfX0sf1/Au4D6eeshWyh
 UUMHwp2J1SN+5/29+GHdyuABZvimaw7xXSK61P9YJg==
X-Google-Smtp-Source: ABdhPJzN3bMcohyLx+BmCBR3X6vZL0tTvooFjXp3y2FFWtT9H5YBTmKIeAGF+vyrAAa7JitBin1NHaVrXGI4vBGiKTs=
X-Received: by 2002:a05:6e02:13e2:: with SMTP id
 w2mr16501620ilj.308.1627383986040; 
 Tue, 27 Jul 2021 04:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5Ev4QU72cMqMW7sA=dijzh7-DCsfHY+Lmqd36uzg_7Nww@mail.gmail.com>
 <CAJMQK-hH5HM5iN4q6UgUf8T5fwj+0oULKPw=XafYOPrki-aDkg@mail.gmail.com>
 <CAGXv+5E9MWzHtJLEab_ZKQNgVqhL5H_Teor9c5zCQD8OHOcYYA@mail.gmail.com>
 <CAFqH_51Sg0h+CC9whUAgpp80OxDsB461NYSdKQvGxho_VF8oJg@mail.gmail.com>
In-Reply-To: <CAFqH_51Sg0h+CC9whUAgpp80OxDsB461NYSdKQvGxho_VF8oJg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 27 Jul 2021 19:06:00 +0800
Message-ID: <CAJMQK-j_SFVOA7KcZpGaE+mS3WZf3fe9CaXw4pHPND_UWUU6Kg@mail.gmail.com>
Subject: Re: arm64: dts: mt8183: Incorrect mediatek,pull-*-adv values
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, 
 Devicetree List <devicetree@vger.kernel.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_040628_956798_204C353D 
X-CRM114-Status: GOOD (  23.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 26, 2021 at 5:48 PM Enric Balletbo Serra
<eballetbo@gmail.com> wrote:
>
> Hi Chen-Yu and Hsin-Yi,
>
>
> Missatge de Chen-Yu Tsai <wenst@chromium.org> del dia dl., 26 de jul.
> 2021 a les 10:58:
> >
> > On Mon, Jul 26, 2021 at 4:50 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > On Mon, Jul 26, 2021 at 4:20 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > I was looking at MTK pinctrl stuff upstream, and it seems there are a few
> > > > `mediatek,pull-*-adv` entries that have invalid values:
> > > >
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-down-adv = <10>;
>
> The confusion comes probably because the binding says that this value
> is valid, see
>
>    Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt
>
> it'd be nice to convert that binding and the others to yaml format and
> remove the possibility to specify it in binary format.
>
>   Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
>   Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
>   Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
>
> Should be pretty easy as there is already an example:
> Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>

Hi Enric,

I've sent a patch for converting these into yaml here:
https://lore.kernel.org/patchwork/patch/1468449/

Thanks

> Thanks,
>   Enric
>
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-up-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-up-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > > >  mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > > >  mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > > >  mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > > >  mediatek,pull-up-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > > >  mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > > >  mediatek,pull-up-adv = <10>;
> > > >
> > > > According to the bindings, the values should 0~3. <10> is probably a
> > > > incorrect attempt at using binary representation, which is wrong. This
> > > > probably leads to the pull-up/down getting disabled or ignored.
> > > >
> > > > Cound people still working on these two devices take a look?
> > > >
> > > Thanks for pointing this out. It's an incorrect value but 10=0b1010 so
> > > the result is same as 2, since the driver test the value by checking
> > > the last 2 bit. We should still fix this in dts.
> >
>
> I see that the are
>
>
>
> > That probably explains why no one noticed.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
