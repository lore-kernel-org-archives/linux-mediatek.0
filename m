Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82D0C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 09:37:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6CF22CE3
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 09:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D6CF22CE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t2p/s/7JhCI/wmxBnTb28i5k/gG7dPXzVd4zBoczl3A=; b=0FmkBTZo0nOA/mqT7tKXAF3yD
	ZfIp/M/olK4Y3TS4192HzbfKnqOJCtddkN5tjDP06wLlCnPLydsIrSgtshF8AMiuInvEMPsMWcSZW
	JPil0qBZwZlRcy23rwmFKOrfgLRy7LgWxzeHwg+YFVQLVkP4zeenLF+qP8exZ0XSZb0PeaEWBJJQX
	mxcI0/kyCrg5iKk5AazSeJjw+52oDmGC1ZMueXcdJxscHWZlbfy1583vllwpSP3oiau14DN72jhFK
	rXZAjsxa2obiOghKys22Kcyddknz9gAkHYuyRCmw60G6JheCtf5HXGus875AOcwyVVTFHE/3As5gH
	fRgFXQQAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzz3h-000079-RO; Thu, 14 Jan 2021 09:36:50 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzz3W-0008RJ-Ik
 for linux-mediatek@lists.infradead.org; Thu, 14 Jan 2021 09:36:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id f4so7191649ejx.7
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Jan 2021 01:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4WPhESZ2Ino1UQ+7G+F0v8AM8oEjEHY5bkl74A+HS9U=;
 b=SHJ9j/iZ90wmHmG96hK7ogsn+S7r1luxoBa6keVoDk4NWbSCNnoALijDtih8olEzBp
 eDDDm4LvTYIbIOa9nrF326FdHiHrMyGHEI0TXd3HrkbhFqbAVtF/7e5WQUgCknaSHz2x
 oaFoSLatWj55lgEdC8DqqwywnwvJxqk6B9c+akWMvuSp2zsd7hpbZ5o5I5aijPmm7V6s
 zwK4nJ3wNqC2p35i6MuadpL+gY2FguImFJ1W8Ikba4vihJrR/AQPmBP33UibkinQaJwF
 Qv9v/EYxpCWlszMU3oHqnTK2fSoOvRL037tvswAb4X2vqXIa3f/aG5y1lQsta3pccOjm
 akZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4WPhESZ2Ino1UQ+7G+F0v8AM8oEjEHY5bkl74A+HS9U=;
 b=HoygRF5ttRt0Um9tCX8r2mIMqO/Rd3MlEguGtZqHwxqcoCpgYmIjkAAVFtkwhxjluj
 4BBMCnCh+97LyJarGS6dV1bNIiPRC/ggV6OYW8idysx4URa9AiI6HB87PWN+hNrBu7Gs
 esqTy3IcC8fKdG4+wC1cGqJRqjB0TrYpie0lS6X4qrmsMLbbxWF0Oq8opVexF6KSEkII
 z5yAsMYAm6WKP8oyLKJ/8L7YvrfZ3dHQNUzg6u+e+qJkGg5vs2ppDLDX6mwTNmOiT72r
 i1/PiuBxAC8LQMnR3bLSgP1OrR6R3nc8ajwTzeaXY47Dimh3yS1ZwXfL8yURrzRd9Jbv
 KXEw==
X-Gm-Message-State: AOAM533tOYjRsGrimjhL874GZuU5NZ9KNoQwCXRVLUW9VpNxdObYcTy1
 n3OcIvn/GxRAXaXZNfeLH18oD0DP2Q9o9+xViHO4MA==
X-Google-Smtp-Source: ABdhPJyrveNlmYlJtZwqPTnLW1uRvgk2qAwIeuLIPI8/FEwrO+3RCMe8L28l1DrM60nxOvEbNEfYmHp69hbWY7kCXSc=
X-Received: by 2002:a17:906:19c3:: with SMTP id
 h3mr4605167ejd.429.1610616993048; 
 Thu, 14 Jan 2021 01:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20210111054428.3273-1-dqfext@gmail.com>
 <20210111134349.vdhyebdllbaakukk@skbuf>
In-Reply-To: <20210111134349.vdhyebdllbaakukk@skbuf>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 14 Jan 2021 10:36:22 +0100
Message-ID: <CAMpxmJWi=BPvXyE_m0dyfmhuK76wYjVTtmvVEk7xSfPcaTYbkA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] dsa: add MT7530 GPIO support
To: Vladimir Oltean <olteanv@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_043638_743509_5D0890BD 
X-CRM114-Status: GOOD (  13.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Pavel Machek <pavel@ucw.cz>, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 linux-gpio <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 DENG Qingfang <dqfext@gmail.com>, netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 2:43 PM Vladimir Oltean <olteanv@gmail.com> wrote:
>
> On Mon, Jan 11, 2021 at 01:44:26PM +0800, DENG Qingfang wrote:
> > MT7530's LED controller can be used as GPIO controller. Add support for
> > it.
> >
> > DENG Qingfang (2):
> >   dt-bindings: net: dsa: add MT7530 GPIO controller binding
> >   drivers: net: dsa: mt7530: MT7530 optional GPIO support
> >
> >  .../devicetree/bindings/net/dsa/mt7530.txt    |  6 ++
> >  drivers/net/dsa/mt7530.c                      | 96 +++++++++++++++++++
> >  drivers/net/dsa/mt7530.h                      | 20 ++++
> >  3 files changed, 122 insertions(+)
> >
> > --
> > 2.25.1
>
> Adding GPIO and LED maintainers to also have a look.
> https://patchwork.kernel.org/project/netdevbpf/cover/20210111054428.3273-1-dqfext@gmail.com/

Can you resend the series with GPIO maintainers in CC?

Bart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
