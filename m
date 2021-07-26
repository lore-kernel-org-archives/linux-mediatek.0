Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C98AC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 08:58:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0B1A60F4C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 08:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0B1A60F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2947eRr7D90IeyjmJrD8eMv/l0frZerBr5uVXiVDKGw=; b=Jdd6YAgdF3IJZD
	dfbANDQP35EbpHtu3GnDLPeVc4FJFunzKFr4/lOtp6UgSczUi/MUytYkPInhbDoKVIgMs6MFWGFHq
	UMBd8aNKNO3C78fY0mXqXXbmd6yx8fhDX4mLZPJDHMB1x+LtvKx1APaFujhR+Rv6QwkQR+5kTJgej
	3MvcBX5XcNw6Pb4ALy/MBLZfUdiFxavcFDlcQIYJhRbbh+0bmxcq9ZBj4WoPfPfHWiStx9TBQX5hZ
	SXxtTM8/SxgNWtWi9Dq6KsscP1vZnI3QjZG/02JkdJ3etmwKg0oNbJvyEo/aRH99m3jadSyVry7/S
	47B5mCvE5bcZYI73t3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7wRR-00AJwN-2u; Mon, 26 Jul 2021 08:58:29 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7wRN-00AJv6-To
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 08:58:27 +0000
Received: by mail-lf1-x131.google.com with SMTP id f18so14117351lfu.10
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 01:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tjJug7Q8q6d0CbJrYfSZgFOLb9rWU+eNbzf7D0T8EG8=;
 b=DK6BNTioO9pLA0zgUFyAhLl5WNTJx2sD/tsmB48ktbU0/j1s5OMESOBvX/fOlDH4LU
 B2RxRBYlutT2qBKsIOnfoX5REG1LDTQUAfMEXNd+IMldzlbB3GTZXBJWJDAW8OUxzAe5
 NbbxSLfuOMgt4R2d0pL52nOtrKaX9LL1wngwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tjJug7Q8q6d0CbJrYfSZgFOLb9rWU+eNbzf7D0T8EG8=;
 b=UeBdeIUMYR/3Nv5fU2wkoUA77wZmFmxMicaA4FXOZLXDDIkPLu6zc/XfIqKpSlA3VR
 75n+TPOGiIenYq1H4D0NBxAmA6GswK54qMXZF0LYAZUnW+cKjqCN026ccm6P9mazONTU
 E0EX4/SIBU8KKQDeRKvSWbkwH5Xno4lDouEKuDQ+GPB9YVXaUhgp+mzXipWcsKSSyWiK
 +8R/Va2/NAALpVvbWccTfnfFH0U/o3GQYKReYSnl5b3OCMDM/uqzLQ+PlUtV9Z0WLvtT
 Z7z5WawXHlXMcyrMCfxoi4Xi3OtsSP+n92nJP5FEdG5lDKhv8Fp9Kgs/6HzIBh1jt5JQ
 nqLg==
X-Gm-Message-State: AOAM532ffhr0h/hTkQzRuiY/IzeCfUlgWkL1FeaReNvjQF3DFPIirIlN
 cwuTv2Dvrv+DXEz0yZfd81jmXyEYAqTyE5BVMIug/g==
X-Google-Smtp-Source: ABdhPJwnhtzxRaGOMn4t4PeAcTHpr1ccxQJ2FBsDEcwC7sCwm1x/bCY+vqG8t3AdWboRCIjmWscEg06CfaCxndy6uks=
X-Received: by 2002:ac2:57d2:: with SMTP id k18mr12583576lfo.656.1627289904559; 
 Mon, 26 Jul 2021 01:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5Ev4QU72cMqMW7sA=dijzh7-DCsfHY+Lmqd36uzg_7Nww@mail.gmail.com>
 <CAJMQK-hH5HM5iN4q6UgUf8T5fwj+0oULKPw=XafYOPrki-aDkg@mail.gmail.com>
In-Reply-To: <CAJMQK-hH5HM5iN4q6UgUf8T5fwj+0oULKPw=XafYOPrki-aDkg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Jul 2021 16:58:13 +0800
Message-ID: <CAGXv+5E9MWzHtJLEab_ZKQNgVqhL5H_Teor9c5zCQD8OHOcYYA@mail.gmail.com>
Subject: Re: arm64: dts: mt8183: Incorrect mediatek,pull-*-adv values
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, 
 Devicetree List <devicetree@vger.kernel.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_015826_005218_DEC22833 
X-CRM114-Status: GOOD (  16.55  )
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

On Mon, Jul 26, 2021 at 4:50 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Mon, Jul 26, 2021 at 4:20 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > Hi,
> >
> > I was looking at MTK pinctrl stuff upstream, and it seems there are a few
> > `mediatek,pull-*-adv` entries that have invalid values:
> >
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-up-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-up-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> >  mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> >  mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> >  mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> >  mediatek,pull-up-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> >  mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> >  mediatek,pull-up-adv = <10>;
> >
> > According to the bindings, the values should 0~3. <10> is probably a
> > incorrect attempt at using binary representation, which is wrong. This
> > probably leads to the pull-up/down getting disabled or ignored.
> >
> > Cound people still working on these two devices take a look?
> >
> Thanks for pointing this out. It's an incorrect value but 10=0b1010 so
> the result is same as 2, since the driver test the value by checking
> the last 2 bit. We should still fix this in dts.

That probably explains why no one noticed.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
