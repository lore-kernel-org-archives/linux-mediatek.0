Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AA8C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 11:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9sp3Lf2nUQvab5QDPaJlIzhs8K++MxH/o8mBco7rPA=; b=Lc6S0orgJXG+yX
	4T6WTtTaQZM0BvpRoUBb+mfCYCi3r/NhhnXl/OGg8BY12K3FI4bwI/i933FOqK5UzNkPIt6hSn0Zy
	l8/eZVwsUTFBHjI+cC43hBxbtzodSoGzRNaUL2Z89Nwgn1WoiDZmys6pPgDzMXu24Pbd2I2xHucoR
	ehST6QgloV05LirOZrXsiISTTCTIdsjTQO4Y7uZx9YoO2ndoGNgsnyOH2ssgJm9KPCX9iusDvs7q9
	SCQCRlJBfgDJvtUvCcLEISVsdchiGnRkRCik56vzcMqY/LdgFr5SO7ujNeEf9dJN3VBTMZI+VCTFj
	NNYJIQJA7HJAt25y9gng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYnx1-008Rj1-Bo; Mon, 28 Mar 2022 11:54:23 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYnwn-008Rfq-Kb; Mon, 28 Mar 2022 11:54:10 +0000
Received: by mail-ej1-x630.google.com with SMTP id dr20so28091470ejc.6;
 Mon, 28 Mar 2022 04:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LKPrfvGWNCgTg4TyAaxCLaMtN2+t2qHlTsa1uVOq8pM=;
 b=kw5U/JCmxslxZizV2jLlmOBcIGssYEKq78XpVjnkGPlQXwgkdWAeFftd0yoAS+p3Es
 6bwRaMEB8Zw0+KWXTqe5xSm+v3FtPxgM1RwYnyrFhzLni/EoCXXr2a4ZaW4d9wU25zbe
 eoniOgU5G4dswNrq9JJELqXGcHi7pVp1q2vyKzlG9qqT6TMzxJDxKEKbi/+Gm1DeYjXV
 3UGggeaDhqV9rH/7fzTDT4rvoqsZCz8BOdcAeH6/X0BclpVxtXas1+/6ml1BvWFhOWRe
 yfEvE0l/ifZkZqpd8ktCUvFEOWyKT3gPWwBAnqgNkhDVlu40OBzAA6dNTFKzBXUmZGp/
 emUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LKPrfvGWNCgTg4TyAaxCLaMtN2+t2qHlTsa1uVOq8pM=;
 b=cwq1AuTMzpiSJATQ+ybogzNgvutzydgmqwTkOZqc5TRq0ARRpfhKJG1gunKE1dhmlF
 MddXnrE4Z74ggDZD11MyXLNxqAwlXpcQaUVbXgUMPiZ5USkYRCL/qEtRHAk7/0RvRP/4
 XF4zRcy031WzYFxPzFnrakq+M6JyHh5jnmYe/BR3590AtWEEI4a/ofb9tNgP7DBmaT1I
 222I7Nv/K5Md7E0Rf/9wZ5bEoG4VIRglRIo11QwxBWhDQmbyzCwBu+jbR5Qv/LYWDWfo
 FAENk9SQeNBK7xSAaxdjPmL05v8VJ4RZFKZiHKvP3sXXKZX9AaFdlWEUZVkGwy7T20d0
 w21g==
X-Gm-Message-State: AOAM532sJKSLazaIpcbQJ0xSPKHWFKdV8dvvxlirnywMdgMas3gxJvzi
 sIEKKaU7qzEorgowizSR0T0=
X-Google-Smtp-Source: ABdhPJxnuIkGxnuYGLZsxAfTPmW5TkGf54BmupZ2me5Tuu+k4VyUkun2Hg1gMwbCB0fty6ZgA/O4mQ==
X-Received: by 2002:a17:907:3f18:b0:6e0:df2d:c76a with SMTP id
 hq24-20020a1709073f1800b006e0df2dc76amr12117312ejc.55.1648468447864; 
 Mon, 28 Mar 2022 04:54:07 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it.
 [93.42.69.170]) by smtp.gmail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfdfdac005sm5850462ejc.174.2022.03.28.04.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 04:54:07 -0700 (PDT)
Date: Mon, 28 Mar 2022 13:54:07 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, linux-oxnas@groups.io,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Subject: Re: [RFC PATCH 1/1] ARM/arm64: categorize dts in arm dir and fix
 dependency in arm64
Message-ID: <YkGh36h03EfUd3/q@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
 <c5eeca79-38b6-eb9f-1d78-1685aa1cca6c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5eeca79-38b6-eb9f-1d78-1685aa1cca6c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_045409_707439_A9A30989 
X-CRM114-Status: GOOD (  13.61  )
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

On Mon, Mar 28, 2022 at 12:47:46PM +0200, Matthias Brugger wrote:
> 
> 
> On 28/03/2022 02:09, Ansuel Smith wrote:
> > - Categorize every dts in arm directory in subdirectory
> > - Fix Makefile to address for the arm subdirectory
> > - Fix any arm64 dependency
> > 
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> [...]
> >   arch/arm/boot/dts/mediatek/Makefile           |   14 +
> >   .../boot/dts/{ => mediatek}/mt2701-evb.dts    |    0
> >   .../boot/dts/{ => mediatek}/mt2701-pinfunc.h  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt2701.dtsi  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6323.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt6580-evbp1.dts  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6580.dtsi  |    0
> >   .../mt6582-prestigio-pmt5008-3g.dts           |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6582.dtsi  |    0
> >   .../dts/{ => mediatek}/mt6589-aquaris5.dts    |    0
> >   .../{ => mediatek}/mt6589-fairphone-fp1.dts   |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6589.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt6592-evb.dts    |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6592.dtsi  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7623.dtsi  |    0
> >   .../dts/{ => mediatek}/mt7623a-rfb-emmc.dts   |    0
> >   .../dts/{ => mediatek}/mt7623a-rfb-nand.dts   |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7623a.dtsi |    0
> >   .../mt7623n-bananapi-bpi-r2.dts               |    0
> >   .../dts/{ => mediatek}/mt7623n-rfb-emmc.dts   |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7623n.dtsi |    0
> >   .../boot/dts/{ => mediatek}/mt7629-rfb.dts    |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7629.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt8127-moose.dts  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt8127.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt8135-evbp1.dts  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt8135.dtsi  |    0
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Would it be possible to also script a fix for the MAINTAINERS file?
> 
> $ git grep "arch\/arm\/boot\/dts" MAINTAINERS |wc -l
> 
> 101
> 
> 
> Regards,
> Matthias

Totally forgot about the MAINTAINERS file! Yes will add to the script a
check to fix also that.

-- 
	Ansuel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
