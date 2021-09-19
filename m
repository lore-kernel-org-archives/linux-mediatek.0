Return-Path: <SRS0=4N1K=OJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3300EC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Sep 2021 19:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E545760F6B
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Sep 2021 19:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E545760F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p68LdQljCiHEDZHwJY8QQ8+jLrwC2UnN4SxVd4DYnmY=; b=g3apwfwQwHn41T
	75WD0UATYIkK4dKKJ5Sc3sunAqOJp4Ghukfw55hi3Z/3Cqmz/WPLeW3BxgTz8b3v3bD53Y0fcEM8x
	n2g39kBjw3E5fMiLvw2WVQQRmkRGeaoSFFER8Y2jXoB17TzUml1mFQVjBe+PV70GnPLnn58oKNrXP
	zM1T5JdlByUvaxn6JQBG9k6WKukFCNj1BNx1+nGsKs4yg/dYUQfo3aqn2YHDvU/zUGRBTmxUtSDtE
	vixnmaI5iwTbsIskH8b9Vwnmr7CnMQ+KCV/V03fnAAcwGdLsfXWNT1QEmq3SPa54gq8uJUHUGhCYw
	rQ9/Otpf1e4pGIX2ozEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mS2Zc-0006YU-DP; Sun, 19 Sep 2021 19:34:00 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mS2ZQ-0006Ww-CG
 for linux-mediatek@lists.infradead.org; Sun, 19 Sep 2021 19:33:49 +0000
Received: by mail-lf1-x134.google.com with SMTP id x27so57900312lfu.5
 for <linux-mediatek@lists.infradead.org>; Sun, 19 Sep 2021 12:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rwG0cyjmLoqo6KWJPkoebUUL/eGcFniLZjCwbXyHXbY=;
 b=QttFeThvsBKoZD/JJSZUGcnMxxYovmSAcPaoFut8GAFLHLvS3IsTDF2HdKr15LPN9G
 dQm8BvfUECw8XeDSv0m1SrsY5DNjsXO5PhGldlbFPGCmZzLQf5f4vh/pFDbjSFvStSof
 bsHKoK1XDB+jm11SUX3KQZcdBcwrIoJ9zJT7u7lZPKBBvscShFCJI06s8Nc+Cbx5aPk8
 FLEsvge3r+dLL5c8eRyGYCib3lpmVuGEyJOQApoo1BXqM0ORTQDvz1f9o1dc6g3fwHqJ
 sn8PMwx45/tPsdybUcEWbNcsQsIJx3OV8yTmV/E9eKunE7RJcgj2CWzrCIKxFp+jpbCh
 0Qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rwG0cyjmLoqo6KWJPkoebUUL/eGcFniLZjCwbXyHXbY=;
 b=Z5f2yJVGyUpahbXanN1DemaAamGzuA3EZsHDGZdHlQlfwA2BBDvfS07lu1DSMtdTov
 ZjCl3qyqXOzYYqokODpPeeK9B87HWyWUaeaPhUCntcH9opjCVXa6gj4uKk9/efTsmyaa
 s0te0LhwY3NbJJ4inYp+Q8RJzUs9WsmmstOqBJtD7Xhf0XCb/mqI6IAmVYt9gIgHzNtA
 cbENFa3GxoHF90hWD4A6xbHDr+JEjV/fKLwnNBk13mHnCaVX3o+EG33Lo+P9+1tXUqEC
 dTYadSrtWeKTjpJx3zqJfsAgYM2MlsaP/xuaalBdUSTupkzNMuEtsV3e7NNaAu9mDflw
 XW3Q==
X-Gm-Message-State: AOAM530nCDVpJgAfgIafU5xx0ce6OhGXOvRDZYodwbI58FT2tPHSgyx8
 9+xc6yY4lrIMCODsPnnPTVhUVtQUCrBZKl/yuEkKwg==
X-Google-Smtp-Source: ABdhPJzzLzWh+7RmTbVSRRZX4HMrJdrIe97VWJWO+B8mpVmZZvCUE6yjBm+7MlNH7sV61wIx/Rt//VfW14RHiA0ZsuQ=
X-Received: by 2002:a05:6512:10cb:: with SMTP id
 k11mr6357275lfg.72.1632080020480; 
 Sun, 19 Sep 2021 12:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-5-zhiyong.tao@mediatek.com>
 <CAGXv+5H5KnskzBYuqniBGQWBLriyFkBvVXEk1Cyg6XSmKMWP8w@mail.gmail.com>
 <b82ae857d8a3acf117721bb83d4dbbc44f612565.camel@mediatek.com>
 <CAGXv+5F=H3C9mB+uYJDmk8vPiKjWixFs8DF3Pk_Xh3x6Jpq6iA@mail.gmail.com>
 <74a3a96745e93c5a2392b8a39822c872fd468466.camel@mediatek.com>
In-Reply-To: <74a3a96745e93c5a2392b8a39822c872fd468466.camel@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Sep 2021 21:33:29 +0200
Message-ID: <CACRpkdZjqMk_gVpeZ2SqCijuOiiGfPOXHhBOdyL9Y+j750cGsQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/4] pinctrl: mediatek: add rsel setting on MT8195
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
 Devicetree List <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_123348_488732_B4A3F310 
X-CRM114-Status: GOOD (  22.90  )
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

On Thu, Sep 16, 2021 at 11:31 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
> On Mon, 2021-09-06 at 18:09 +0800, Chen-Yu Tsai wrote:

> > > > > +       if (!found) {
> > > > > +               dev_err(hw->dev, "Not support rsel value %d Ohm
> > > > > for
> > > > > pin = %d (%s)\n",
> > > > > +                       arg, desc->number, desc->name);
> > > > > +               return -EOPNOTSUPP;
> > > >
> > > > I believe ENOTSUPP is the correct one. EOPNOTSUPP seems to be
> > > > network
> > > > related.
> > > >
> > >
> > > if we change it as "ENOTSUPP", it will report warning"ENOTSUPP is
> > > not
> > > SUSV4 error code, prefer EOPNOTSUP" when checking patch.
> >
> > The context surrounding this warning seems to be that ENOTSUPP is
> > hard
> > for userspace to understand. AFAIK the return code here does not get
> > passed to userspace? And the pinctrl core does check for EINVAL or
> > ENOTSUPP, so I think this is a valid use case.
> >
> > Linus?
> >
>
> Hi Linus,
>
> Do you have some suggestion for the warning issue?

Ignore the warning. We use this code in the pinctrl subsystem.

The pinctrl subsystem has no userspace API so that is certainly
not a problem.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
