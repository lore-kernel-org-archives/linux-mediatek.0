Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647FAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hz+S9gbmjTBRbI9IGEo00yr8q6U8gYAIZkZve+s14sI=; b=McHWBumpRHbi1Bb9LQd8L+JXWm
	Og2EgR+ga2hmFq7oUY8k5EXkF+pga1BeyegNoP1+3sDiT2GzWYkQM+EKLAhSoNOHy2uOMzLvD4diN
	1VvWgHxf9/jiY6G/BTfWdcVqPasSGpGJiaPRiEu3bhR3FQveN3LKavatHrHvF+AUF77GVm9Cs5JYW
	PiyAffUgv83StNrHpwO2zpQmEkyP8280wIg1qys5f44UI5WCjwHCohBwYSHzJvZlzHX2PlnYQRI9p
	gr+xoF6diD9pcWtIlUDpPQAYbUQEmgCsl3hdOL2BhUflLoFgsMqLv8RUxaGmFz3wjfzdsntQEM1OA
	BNYtQZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvRS-00D1xj-Ay; Thu, 14 Jul 2022 09:47:30 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvRD-00D1nJ-Bb
	for linux-mediatek@lists.infradead.org; Thu, 14 Jul 2022 09:47:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id v16so1767010wrd.13
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Jul 2022 02:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hz+S9gbmjTBRbI9IGEo00yr8q6U8gYAIZkZve+s14sI=;
        b=jGRWumBYRWsPFRAHiNOF9bcUJ5TNxCTJ10BCXYBR6dF5XY8QP1BaD0ju5ijzduBadz
         M7fhdhDNh9X474nV6zPJ7e1R/z8AAJRizIr/3CpUbGzGKBc7QY0JT2IoCubdKhUsVB2D
         Fo9X7Qexd9TDha4225wY5GnXsVw+Qq4igsIWi7ZGskKx65onGrtT5A4Eai7F7A/5TU5q
         ehpk/JuiqKYzmvo58fp5IXfwHX6D2oDhRs4pu5dG34iaFTJb/8kDr/vljaafddvSmTQt
         FofPVS5NrtArjBlTl0domfLu4V5bkUAzCbxcFxSi14WPEKaNDZDAnaRvllsVTcVTH+E8
         GmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hz+S9gbmjTBRbI9IGEo00yr8q6U8gYAIZkZve+s14sI=;
        b=Xavxi96hNZE+y+pG3mreL9RnJVLOctamZ1uu5uAbbhCTRoeGuafAFLUjOOLsEl4DTN
         ZjIhgv4hVR5T2P3cVn5cyP7U76rbpwCrUm9bRmmbffafAPog/Ik0FKuLAVldVPfxvD9s
         tQDZlWpxkFZVZepWL6bO2aSVbJPSTmvVRrpdwtHQTGTvvOQDb8hNniPp93HOG/UmnGi7
         Anm45zJGjJCtJTci6geIxZqZ5vM4VSIllhLb2rbDTRG/D/2s96Q8SyB/QqYHBKKMLsOI
         JkQBrQqZr2rzIpN9BRmRdZD2NvxVLtpMBFlAQnr2R7zLE3/LGVZTbUv+CaQK7R7hbHob
         TQ8g==
X-Gm-Message-State: AJIora+qj57sj+mCa1TY3RhW/yRoSamQWhILLsY8NOkJnosumd4fyEPN
	l2TVRLBt2x+va6Z3jxtsZHtSgw==
X-Google-Smtp-Source: AGRyM1vnaGqcjfiDi9IGxZuq03hn9M2jXCQvULWiEOP+eJIxh4bgzvMgPaE9Bz5dtGUwBLz/VP+cVQ==
X-Received: by 2002:a05:6000:12c8:b0:21d:6913:89af with SMTP id l8-20020a05600012c800b0021d691389afmr7419194wrx.546.1657792031934;
        Thu, 14 Jul 2022 02:47:11 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id bg10-20020a05600c3c8a00b003a0323463absm1456168wmb.45.2022.07.14.02.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 02:47:11 -0700 (PDT)
Date: Thu, 14 Jul 2022 10:47:09 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
	Helge Deller <deller@gmx.de>, ChiaEn Wu <chiaen_wu@richtek.com>,
	Alice Chen <alice_chen@richtek.com>,
	cy_huang <cy_huang@richtek.com>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux LED Subsystem <linux-leds@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux PM <linux-pm@vger.kernel.org>,
	USB <linux-usb@vger.kernel.org>,
	linux-iio <linux-iio@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
	szuni chen <szunichen@gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370
 support
Message-ID: <20220714094709.6ekfnfcf5sktiegi@maple.lan>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
 <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
 <CABtFH5LT1Ct_9-B_XRrGwYFmL5kGS6KHR7dNVyUO5z4sTy_6oA@mail.gmail.com>
 <CAHp75VcU_9Ao2CoqiUDZHqhVOjEMZor+hctPp3YYP4HOjYLDUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcU_9Ao2CoqiUDZHqhVOjEMZor+hctPp3YYP4HOjYLDUg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_024715_425433_6FB28C32 
X-CRM114-Status: GOOD (  14.49  )
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

On Thu, Jul 14, 2022 at 11:27:07AM +0200, Andy Shevchenko wrote:
> On Thu, Jul 14, 2022 at 9:13 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > I have tried two methods so far, as follows
> > -------------------------------------------------------------
> > /*
> >  * prop_val =  1      -->  1 steps --> b'00
> >  * prop_val =  2 ~  4 -->  4 steps --> b'01
> >  * prop_val =  5 ~ 16 --> 16 steps --> b'10
> >  * prop_val = 17 ~ 64 --> 64 steps --> b'11
> > */
>
> So, for 1 --> 0, for 2 --> 1, for 5 --> 2, and for 17 --> 3.
> Now, consider x - 1:
> 0  ( 0 ) --> 0
> 1  (2^0) --> 1
> 4  (2^2) --> 2
> 16 (2^4) --> 3
> 64 (2^6) --> ? (but let's consider that the range has been checked already)
>
> Since we take the lower limit, it means ffs():
>
>   y = (ffs(x - 1) + 1) / 2;
>
> Does it work for you?

To be honest, for this tiny table, writing code that *doesn't* require intricate
deciphering together with a huge comment saying what is does would probably be
better:

		prop_val = (prop_val <=  1 ? 0 :
		            prop_val <=  4 ? 1 :
			    prop_val <= 16 ? 2 :
			                     3);

This would be "obviously correct" and require no comment.


Daniel.

