Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FEAC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 09:49:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7583460F49
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 09:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7583460F49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTr713pFybZt3ZvwZ7U5PrLyzJiQNvzEaUh+td4TUl0=; b=KohPrP4V2nEGiw
	FG9PRSjwj00YGDkCTcPW4xlA6Sw9qCjuvB4YXgeX+iGFOlDR1FS1NNZSY12qyx4e43US8o169zzlg
	XSS3T4utJnLUvJU0E+hjVAGI5aOGvj4veO8obZNbZADTvmCI7fGihc9+1S5aJmoIpXZWxXHlY4cqY
	TW4nIvevFNZ/n3ioCfVDY/uPZ6R1Puk7X1agUIG6V7wD6EK45wnbT170eFvZDcQFYrdtZF2cDitPZ
	guephHo6rvsspjpWpmfl5S8gNXCTRvPIlQxVAmuPrD+hDt/+Ox9GHzhHC5jWtLoZBR4KTwi7b9gPP
	4ZIkhE/PIAaDOj8WoQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7xEG-00AYtM-9K; Mon, 26 Jul 2021 09:48:56 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7xED-00AYsH-Ub; Mon, 26 Jul 2021 09:48:55 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 19-20020a9d08930000b02904b98d90c82cso9455069otf.5; 
 Mon, 26 Jul 2021 02:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pl+v3DiaeJpUrELYg7AfdBLvrcikVCH+JCi57zYA5L8=;
 b=tIuPKH6cDjAbmsEOgBBM5J1qa1ubNYlki7Sxx3yS/okutf/coP9GMnuO1sCiLwZh1O
 QQ6hZ4bUx4w3QdP08k6+oLwlR9GHH3hwRg5a5RrM7JsHOmmtie1H4FWR0L4ETu4foQQ9
 VYlV4rqikPgp1ZCwMBAwgSqY+8BC+bItpVUDD1gr0ubGsc/dW+oYhzgcBtacCIC+o27/
 we5nXqkTqzfYS3NdY4+xzPJtCltqjwIEka0ZuwvU2TtI+9brtk4tJmTPzzRz2O/Jpg2M
 KVuiCgUE7Vu+0j7tek5Ay1YLWxlE0/kP5nPZFJeB2uipxi75nXAChj2Ti1Br2EYDKzh0
 pTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pl+v3DiaeJpUrELYg7AfdBLvrcikVCH+JCi57zYA5L8=;
 b=P1H0z4KkC8phUy3GeaNBPLok5RT/G6hw8qqCRCKuguy63v+wH2sRRZYT1EbtRG8Ax3
 vhA/QCHOySzo/DDbbwXpV4eYgowY65jD0hLMWC4dCdD7lX1QQTZeJlA9uydsK/cDDKKv
 AZ6pyNguWL9EaLl7I1MyfOuE9o738CW0FjBtRu65/HdUvos/lnSL9FRqm1FuHEbK8NG/
 2JRWQP+MO6j2PJDUq4ljzu7V9rmA3NjnocCI4FSYxxJ0DmvHxipt/yAaOAMxpBvpKCdM
 x4wtaVDuSghYD7GnvzMtoUCXjiBLlCSBp5gxnXeF13R1LmQ8kNN7JTKwbffAKk1eLhI3
 SGgw==
X-Gm-Message-State: AOAM5335AP/vq6FGxJ7bT7tlBAhtNaz+855IP0IPwR645juwRG2crL9Y
 bRPZBgXwBdMHm/fPGC3ioCaE0yj9QNZMAJOAmIg=
X-Google-Smtp-Source: ABdhPJwIjI3BLNNv2h2ltqxDCxpofhxdenLAJEBrCmVZcH0wgLU4BC6+IZJezfASEvU7wasViER7NsvA8lTj47uS5w0=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr11353766otb.281.1627292932673; 
 Mon, 26 Jul 2021 02:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5Ev4QU72cMqMW7sA=dijzh7-DCsfHY+Lmqd36uzg_7Nww@mail.gmail.com>
 <CAJMQK-hH5HM5iN4q6UgUf8T5fwj+0oULKPw=XafYOPrki-aDkg@mail.gmail.com>
 <CAGXv+5E9MWzHtJLEab_ZKQNgVqhL5H_Teor9c5zCQD8OHOcYYA@mail.gmail.com>
In-Reply-To: <CAGXv+5E9MWzHtJLEab_ZKQNgVqhL5H_Teor9c5zCQD8OHOcYYA@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 26 Jul 2021 11:48:41 +0200
Message-ID: <CAFqH_51Sg0h+CC9whUAgpp80OxDsB461NYSdKQvGxho_VF8oJg@mail.gmail.com>
Subject: Re: arm64: dts: mt8183: Incorrect mediatek,pull-*-adv values
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, 
 Devicetree List <devicetree@vger.kernel.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_024854_032162_37B734B5 
X-CRM114-Status: GOOD (  18.97  )
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

Hi Chen-Yu and Hsin-Yi,


Missatge de Chen-Yu Tsai <wenst@chromium.org> del dia dl., 26 de jul.
2021 a les 10:58:
>
> On Mon, Jul 26, 2021 at 4:50 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > On Mon, Jul 26, 2021 at 4:20 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > I was looking at MTK pinctrl stuff upstream, and it seems there are a few
> > > `mediatek,pull-*-adv` entries that have invalid values:
> > >
> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-down-adv = <10>;

The confusion comes probably because the binding says that this value
is valid, see

   Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt

it'd be nice to convert that binding and the others to yaml format and
remove the possibility to specify it in binary format.

  Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
  Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
  Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt

Should be pretty easy as there is already an example:
Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml

Thanks,
  Enric

> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-up-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-up-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > >  mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > >  mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > >  mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > >  mediatek,pull-up-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > >  mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > >  mediatek,pull-up-adv = <10>;
> > >
> > > According to the bindings, the values should 0~3. <10> is probably a
> > > incorrect attempt at using binary representation, which is wrong. This
> > > probably leads to the pull-up/down getting disabled or ignored.
> > >
> > > Cound people still working on these two devices take a look?
> > >
> > Thanks for pointing this out. It's an incorrect value but 10=0b1010 so
> > the result is same as 2, since the driver test the value by checking
> > the last 2 bit. We should still fix this in dts.
>

I see that the are



> That probably explains why no one noticed.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
