Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFBDC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 08:03:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C318460F6D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 08:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C318460F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrOSjGlCWbdj7OhoezYhzAo3ad4piJeUXyq37rp8cos=; b=Nf8g4qVXrivXzK
	33x8ll7BbURl410b9ta92FZV9CZJ+5yYYomqueQw5Z0LVpK037+z3qdwM6rDKVC2Cz32zE6QWxZE6
	UKUbTxJD1J9odHXfc9pvS8jvfNt2rfNm4VUuJ3Mcn8NqOdiSslleYEkIpFHNhL6iYy8Z0OtsybpvC
	fEdZxtVf2cX0DfrMFnIqX6GSjsi/dUZSp71z3i+iSfHYvrZAN/wvWknmYL6jNrDFDwJ+wxI8MTtC/
	ha/8Hr/PEvtRhe/lm1i7Y+TgdDul+Ab8eF/WUultK83MXNd9dQwl24w4Gel9CBK3rgLFWSnMoXAas
	QfYt4kp4lm2vsxmyF8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vZV-00A4MI-My; Mon, 26 Jul 2021 08:02:45 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vZA-00A4Fi-Fm
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 08:02:26 +0000
Received: by mail-lj1-x231.google.com with SMTP id l4so10283746ljq.4
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 01:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nBC+AAdhNSp6Y9PCeNESZDrAjbJvLVNma/9NfsdXY8Q=;
 b=AXP8voMcitYr0FtY19uK6rPp9WgozJUcA/Z+cX/hXU4xDU77JzIPu0wMKOeI15djiG
 HisdjAnSIvZLpxqpCQaCCCkN6xPnuESllQ4+5pvuNQqMPqi2xMzBefZqP5qYLW143+bl
 J4xthycSsZ19yOHBcO/Gq9BD/nTkSzXWhnXMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nBC+AAdhNSp6Y9PCeNESZDrAjbJvLVNma/9NfsdXY8Q=;
 b=oDsJQSBpY29GSdTHNp/LLwVcXYp3EW3qvJpyrvzUg7J3SjmTxTMjAhmuDmgwIWzTmg
 sDyt7dfVbplfj0/kwVCkAF5j4vmL3/DbV6FdnB0VSD+AxXCJUg0V31ColVu3BxwfaM6x
 tpGUuOkSTA7Ed1PpVdpUXuPEp9uJMJHbGIFnrWxXkw6v5UWJ4y0TRJ4hE8xYLLOUcmoz
 cG/3T5s00jSNs4CmGteA2M09aGD/PllNqkt+cTJZBngVfpZ4PmJwO2zXu7UIMlXtRfDw
 6MNRuGtl5s3ZszLKfWuuXGwlal5M8h9YLyNxqrU4EWOvQfqaO2RaPqnOmJDxoc5q2fH/
 vq5w==
X-Gm-Message-State: AOAM532WwSLw8QrOeAn50t+kGM/MRchXUgRhoykTxasH2/f/XyLMHake
 Ocdzv5ke/JqM4sFaZ1I2sYPwNpS0qF8eJfvGMAk/oQ==
X-Google-Smtp-Source: ABdhPJwYvdNT594j5uoh7LhyYxtS6ye0Z/3uprl22Skc07KrFd35T1KpwcWE3PdCoIKu/2m3rCsleSWx5M/7mH2uzx8=
X-Received: by 2002:a2e:760d:: with SMTP id r13mr11728695ljc.437.1627286540610; 
 Mon, 26 Jul 2021 01:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com>
 <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03>
In-Reply-To: <1626940470.29611.9.camel@mhfsdcap03>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Jul 2021 16:02:09 +0800
Message-ID: <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To: zhiyong tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 mark.rutland@arm.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, light.hsieh@mediatek.com, 
 biao.huang@mediatek.com, hongzhou.yang@mediatek.com, sean.wang@mediatek.com, 
 seiya.wang@mediatek.com, devicetree@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_010224_559183_036F5DF7 
X-CRM114-Status: GOOD (  38.43  )
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

On Thu, Jul 22, 2021 at 3:54 PM zhiyong tao <zhiyong.tao@mediatek.com> wrote:
>
> On Tue, 2021-07-13 at 15:17 +0800, Chen-Yu Tsai wrote:
> > Hi,
> >
> > On Sat, Jul 10, 2021 at 4:17 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> > >
> > > This patch adds rsel define for mt8195.
> > >
> > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > ---
> > >  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-bindings/pinctrl/mt65xx.h
> > > index 7e16e58fe1f7..f5934abcd1bd 100644
> > > --- a/include/dt-bindings/pinctrl/mt65xx.h
> > > +++ b/include/dt-bindings/pinctrl/mt65xx.h
> > > @@ -16,6 +16,15 @@
> > >  #define MTK_PUPD_SET_R1R0_10 102
> > >  #define MTK_PUPD_SET_R1R0_11 103
> > >
> > > +#define MTK_PULL_SET_RSEL_000  200
> > > +#define MTK_PULL_SET_RSEL_001  201
> > > +#define MTK_PULL_SET_RSEL_010  202
> > > +#define MTK_PULL_SET_RSEL_011  203
> > > +#define MTK_PULL_SET_RSEL_100  204
> > > +#define MTK_PULL_SET_RSEL_101  205
> > > +#define MTK_PULL_SET_RSEL_110  206
> > > +#define MTK_PULL_SET_RSEL_111  207
> > > +
> >
> > Instead of all the obscure macros and the new custom "rsel" property,
> > which BTW is not in the bindings, can't we just list the actual bias
> > resistance of each setting? We could also migrate away from R1R0.
> >
> ==>Hi Chenyu,
> The rsel actual bias resistance of each setting:
>
> MTK_PULL_SET_RSEL_000:75K in PU, 75k in PD;
> MTK_PULL_SET_RSEL_001:10k in PU, 5k in PD;
> MTK_PULL_SET_RSEL_010:5k in PU, 75k in PD;
> MTK_PULL_SET_RSEL_011:4k in PU, 5K in PD;
> MTK_PULL_SET_RSEL_100:3k in PU, 75k in PD;
> MTK_PULL_SET_RSEL_101:2k in PU, 5K in PD;
> MTK_PULL_SET_RSEL_110:1.5k in PU, 75k in PD;
> MTK_PULL_SET_RSEL_111:1k in PU, 5k in PD.
>
> The rsel actual bias resistance is different between PU and PD.

Thanks. Somehow I missed this when looking through the datasheet. This
encoding is interesting. Since it doesn't make sense to have both
pull-up and pull-down, even though the hardware seems capable of doing
so, I suppose the intent is to support 75k or 5k for pull-down, and
(75k, 10k, 5k, 4k, 3k, 2k, 1.5k, 1k) for pull-up?

We could add these values to the binding so we could check for misuse.

The range of values seems to also cover those supported by the
alternative R0/R1 settings. The values for kprow[01] and kpcol[01]
seem to be different though.

We should get rid of the MTK_PUPD_SET_R1R0_* macros at the same time.
They seem to be some magic values used with bias-pull-*, which is not
how the properties should be used. At the same time, they overlap with
mediatek,pull-* properties.

It would be great if we could standardize on the generic pinconf
properties, and also use real values that fit the requirements of the
properties, i.e. using real resistance values. I'm not sure if it
would make sense to enumerate which pins support which configurations
though.


Thanks
ChenYu


> > Then we can specify the setting with the standard bias-pull-up/down
> > properties [1].
> >
> > Also, please ask internally if Mediatek could relicense all the header
> > files that Mediatek has contributed under include/dt-bindings/pinctrl/ [2]
> > to GPL-2.0 and BSD dual license. These files are part of the DT bindings
> > and we really want them to be dual licensed as well, and not just the
> > YAML files.
> >
>
> ==> We will confirm it internally and reply it later.
>
> Thanks.
> >
> > Regards
> > ChenYu
> >
> >
> > [1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml#L37
> > [2] Note that a few files were contributed by other people
> >
> > >  #define MTK_DRIVE_2mA  2
> > >  #define MTK_DRIVE_4mA  4
> > >  #define MTK_DRIVE_6mA  6
> > > --
> > > 2.18.0
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
