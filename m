Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A92C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 01:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30wLobZRnFv5zggcZVF2u6wy/96nEdpY/Ifl53dhDFM=; b=gKDA1T1MPUp6v3FJKctXmGN5Bb
	1urjEYkgdO8cOM7/Ywa2O1xKChDNwrN2HepX9rb50HSUma+AISxn+qJk651soC5NethWCxem2PaXX
	xgzCOKU/YjNeBrGhPTLxlVSbmTqlr28aZNzEj/8bMUFMg0thAXYtMzj9CKpWeAVeQws9y04WGqd6q
	43meI98Xv1AFcn3dxSMc/5bzajmROsPLOgZlqa0sYfO5IdnM4mYE2T9mu5C2S+Yi5jYqODqXXKXGL
	IcLkxcXtIzCVuaV/QWuBIiyj/crf4xL9f3HhVgJFnktou/WKdheo99CHTk8qWNTlXu4mYK+MJUpdS
	zr+cTO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaora-0084Rm-JZ; Wed, 21 Sep 2022 01:49:22 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaorD-008493-7M; Wed, 21 Sep 2022 01:49:00 +0000
Received: by mail-qt1-x835.google.com with SMTP id w2so3152817qtv.9;
        Tue, 20 Sep 2022 18:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=30wLobZRnFv5zggcZVF2u6wy/96nEdpY/Ifl53dhDFM=;
        b=KPvreMS9cTD4YrMaMm0W35RXTuEm5G6cH9FqS5KKO/LdRVMrIzDCLbnnVsrr0aTF+M
         N637xD82AWRAKw0fe2ZZFejrBD5iZfaLPj7akR8TDl8QqRK0Yc5StwWzkJAPUv82OBe5
         /c2X2yf41KWii3ok0Kn/9kOU36HeBguY2Dz/Nekfnnij3EQIY9nBLl/PaKGQDi4oi4Pv
         sFFueSJMtV98szCHTj+aEUPa7E9SkqEuBaE5mBsjXhajCK1zmtmoHLWetEldHrvED/r1
         niPKxhRbwuOMZGoYphFO68twpl4C32uW7DWmlFLSVhE+W8Kl2AE0vv97jtpm6LZp1X+0
         OkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=30wLobZRnFv5zggcZVF2u6wy/96nEdpY/Ifl53dhDFM=;
        b=8ClBA0+PviYUKC09BgHo4x+pk+9q2TKXAAF7f2TzLH751PxIjBTYzRHsBaefvjtKpq
         TwRtC5+Y3pn8hQ0/Pa4mtSes08EpeKuvkqZ34XFZXmxLFNEgWxRhvqQpBhNinSzrr41O
         1G5a0bhS1HFznsOJf8yO8rpki9u+v9u0H6wq1ZhsPTkMhZ9dH/RA/LioE+5G+w/iu0eB
         ke+0y3GClmgpBbjJvEejsQaV51Ny03HigtiptCdNiJNBTNfkmIkMi/A3GZDT2AV+loJC
         QSKEDRMI0ZZ+76zJ9OQxV2YRVXs06RFKg5iP+VgAL+Mcn9Hj9TNv03+8Os0ewcxdazwc
         0mtA==
X-Gm-Message-State: ACrzQf3b0go5WdB/jIK2iHVfxPUsRCbqByid0O0MjkwiUU5SXT+wid2s
	4hvWRrX9KHJNNLE7sLYAB3ga5mPVByenhL81/BQ=
X-Google-Smtp-Source: AMsMyM7bBhxaQAfT+rCoAiTyYG/eF3l1J9PoSVv3K9nIjI5BkzQczZAqbJin74KiibXz/4K0z0LmAcynXI+rqdfngVA=
X-Received: by 2002:a05:622a:48c:b0:35c:d99a:3002 with SMTP id
 p12-20020a05622a048c00b0035cd99a3002mr17703201qtx.564.1663724937128; Tue, 20
 Sep 2022 18:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220830034042.9354-2-peterwu.pub@gmail.com> <20220830034042.9354-10-peterwu.pub@gmail.com>
 <CAPOBaE7rz2F-sij-LbYau6TRxFoOfmoUc=R__Z7iUrFWmZPgrg@mail.gmail.com>
In-Reply-To: <CAPOBaE7rz2F-sij-LbYau6TRxFoOfmoUc=R__Z7iUrFWmZPgrg@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Wed, 21 Sep 2022 09:48:21 +0800
Message-ID: <CABtFH5+PuK4vptVNmpn4h2FCxNFp3wWvhUrOxgqArx4YxCY99w@mail.gmail.com>
Subject: Re: [PATCH v9 09/10] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: Han Jingoo <jingoohan1@gmail.com>
Cc: lee@kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Pavel Machek <pavel@ucw.cz>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Helge Deller <deller@gmx.de>, 
	Mark Brown <broonie@kernel.org>, mazziesaccount@gmail.com, 
	andriy.shevchenko@linux.intel.com, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Alice Chen <alice_chen@richtek.com>, ChiYuan Huang <cy_huang@richtek.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_184859_318606_019CDA0D 
X-CRM114-Status: GOOD (  11.30  )
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

On Sun, Sep 18, 2022 at 3:22 AM Han Jingoo <jingoohan1@gmail.com> wrote:
>
> On Mon, Aug 29, 2022 ChiaEn Wu <peterwu.pub@gmail.com> wrote:

...

> > +#define MT6370_ITORCH_MIN_uA           25000
> > +#define MT6370_ITORCH_STEP_uA          12500
> > +#define MT6370_ITORCH_MAX_uA           400000
> > +#define MT6370_ITORCH_DOUBLE_MAX_uA    800000
> > +#define MT6370_ISTRB_MIN_uA            50000
> > +#define MT6370_ISTRB_STEP_uA           12500
> > +#define MT6370_ISTRB_MAX_uA            1500000
> > +#define MT6370_ISTRB_DOUBLE_MAX_uA     3000000
>
> Use upper letters as below:
>
> #define MT6370_ITORCH_MIN_UA           25000
> #define MT6370_ITORCH_STEP_UA          12500
> #define MT6370_ITORCH_MAX_UA           400000
> #define MT6370_ITORCH_DOUBLE_MAX_UA    800000
> #define MT6370_ISTRB_MIN_UA            50000
> #define MT6370_ISTRB_STEP_UA           12500
> #define MT6370_ISTRB_MAX_UA            1500000
> #define MT6370_ISTRB_DOUBLE_MAX_UA     3000000
>
>
> > +#define MT6370_STRBTO_MIN_US           64000
> > +#define MT6370_STRBTO_STEP_US          32000
> > +#define MT6370_STRBTO_MAX_US           2432000
> > +

Hi Jingoo,

This coding style is in accordance with Andy's opinion in this mail:
https://lore.kernel.org/linux-arm-kernel/CAHp75Vciq4M4kVrabNV9vTLLcd1vR=bMe8JLEdAF9MkRTpcB5g@mail.gmail.com/

And I will revise other parts in v12.
Thanks for your review!

--
Best Regards,
ChiaEn Wu

