Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F61C433E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 03:18:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7685D64FA8
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 03:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7685D64FA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PbHuXLqxmbt4XAJnZK/hFebBLv9vX66qNTSU8pGzpQ8=; b=A0VNTSGhjNwu3cPh/zEOVn4Du
	WDEwCvCV+akwa7ST5B+ukUK7+GFgZ8DKwatI1BhqM+iPoVbBN4T/e2+DU6kICgRJ/dwX0IakuDMfU
	72j7baT5twyK0LGCepDtYZtz6ipyXOEBnVPUc3w0VJkXFy+/q4POcVp0v3xtcVyypWcyppawRuY74
	6EkaUGViSyoCPEhlOOpoSHRujS+ynSSe7R2rcK2XXWOXIdTdoSKmTufVwnLoC0pYwtUv4tRFDIRnz
	DeeNa+LFBLkMvysguTo0uhO9DjT8N826jKGmuMsmaKDUPtmipHsL4/blKP4w7Ue4BSsL/7ZWva+nh
	DoxW58lAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKBq2-008HuM-Qa; Thu, 11 Mar 2021 03:18:14 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKBps-008HtT-Jo; Thu, 11 Mar 2021 03:18:06 +0000
Received: by mail-il1-x130.google.com with SMTP id i18so17623120ilq.13;
 Wed, 10 Mar 2021 19:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gDVCmWBMN4wY4blBCdk5NbxQ4zATbHUHg6v9hjuwVWI=;
 b=lRq96C4BWNBxmE9Wkmv695xAY5/ghHOfDUq3ch5uIRfQn0e1KfAkVtU/mT7Dtdi/5V
 pNX5+vC/lSuHO33M/yNWgVrLUk4Qu7oyIukjcFYJQf3Ytbt4I6xHZ8ABUk5j8yxYDusI
 2f8iAsGLUGP7jMVNTQ4kutwrezoOhjPhNDZTitOLQVgb2F9ZbUf2ylMZZrCtMOv7Z7A2
 QF2gyeu0uhQxGxl3DGySDhLxoBYOCXSieMhrz4gHtdWrzwS7ma5ForjOTHfdLwF6mIpW
 MjXilZQrELyFczNZJVNu6dKA8Z5VqDHetBMP+dAwi1Jh8qWkHm1eeVcET/AVIiWlj0+4
 6Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gDVCmWBMN4wY4blBCdk5NbxQ4zATbHUHg6v9hjuwVWI=;
 b=l9H87rO6KiG8a2XNLZVmzDqW1iOAMH9BN5QmxR791fQUNLaQwCBxLe+oNoBI3yZSzS
 zjtB/cOXYD0gS0mqjk97adIBGCirXZ9pipbAHMJ6523l+1RPih+HtzLgfITtx3ry8bbO
 /twGLIK8kfOQriPgiU98vNOcPRQ3zdmdC+zebQoar4ftXRZDIW1jrSyU2oVX23SccdPP
 e7Z6LrPxXP8MpPZCV7SiUWB8e7UokwMvtmD3MpbRJrMYcvRLf1pgz1adMM+cOjz1jj0+
 m0bLfoJ3rSeHxUkkhwWRyAB/kLvEO3wpeGOdSKLXOj+EIgGPB+nYUmCu035wNXOpZz2N
 FU9w==
X-Gm-Message-State: AOAM532t3cwgaIeoVwNJ4NWy63URZjqh01xCOMIF8oFWqlrhRic46GgO
 NXPB+lownlsFNoylVW6/s1BdpEMIYLWwMZi+pYs=
X-Google-Smtp-Source: ABdhPJwO613Bp41zr2CTUp0cH4WSHwqSazEWIyoQLC+TpS/jWusNSS40OlnL9oW2D2BOPwrYb2nn4Vd6sm1TkTrrIV0=
X-Received: by 2002:a92:cb49:: with SMTP id f9mr4997838ilq.0.1615432683376;
 Wed, 10 Mar 2021 19:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20210310211420.649985-1-ilya.lipnitskiy@gmail.com>
 <20210310211420.649985-3-ilya.lipnitskiy@gmail.com>
 <20210310231026.lhxakeldngkr7prm@skbuf>
In-Reply-To: <20210310231026.lhxakeldngkr7prm@skbuf>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Wed, 10 Mar 2021 19:17:52 -0800
Message-ID: <CALCv0x0FKVKpVtKsxkq5BwzrSP2SnuYUaK38RHjd_zgoBCpdeA@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: dsa: mt7530: setup core clock even in TRGMII mode
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, 
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_031804_794948_A0756A2E 
X-CRM114-Status: GOOD (  22.35  )
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

Hi Vladimir,

On Wed, Mar 10, 2021 at 3:10 PM Vladimir Oltean <olteanv@gmail.com> wrote:
>
> Hello Ilya,
>
> On Wed, Mar 10, 2021 at 01:14:20PM -0800, Ilya Lipnitskiy wrote:
> > 3f9ef7785a9c ("MIPS: ralink: manage low reset lines") made it so mt7530
> > actually resets the switch on platforms such as mt7621 (where bit 2 is
> > the reset line for the switch). That exposed an issue where the switch
> > would not function properly in TRGMII mode after a reset.
> >
> > Reconfigure core clock in TRGMII mode to fix the issue.
> >
> > Also, disable both core and TRGMII Tx clocks prior to reconfiguring.
> > Previously, only the core clock was disabled, but not TRGMII Tx clock.
> >
> > Tested on Ubiquity ER-X (MT7621) with TRGMII mode enabled.
> >
> > Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> > ---
>
> For the networking subsystem there are two git trees, "net" for bugfixes
> and "net-next" for new features, and we specify the target tree using
> git send-email --subject-prefix="PATCH net-next".
>
> I assume you would like the v5.12 kernel to actually be functional on
> the Ubiquiti ER-X switch, so I would recommend keeping this patch
> minimal and splitting it out from the current series, and targeting it
> towards the "net" tree, which will eventually get merged into one of the
> v5.12 rc's and then into the final version. The other patches won't go
> into v5.12 but into v5.13, hence the "next" name.
I thought I figured it out - now I'm confused. Can you explain why
https://patchwork.kernel.org/project/netdevbpf/patch/20210311012108.7190-1-ilya.lipnitskiy@gmail.com/
is marked as supeseded?
>
> Also add these lines in your .gitconfig:
>
> [core]
>         abbrev = 12
> [pretty]
>         fixes = Fixes: %h (\"%s\")
>
> and run:
>
> git show 3f9ef7785a9c --pretty=fixes
> Fixes: 3f9ef7785a9c ("MIPS: ralink: manage low reset lines")
>
> and paste that "Fixes:" line in the commit message, right above your
> Signed-off-by: tag.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
