Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E05C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 01:00:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B0DF2228A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 01:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B0DF2228A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gS/I500jrSbEsirCdnFz5RNLZtQgnqwGpc6Ubefvvts=; b=nlUTPiZyf2Mt2ewNLjn8NIRUU
	FrOQpE7Y/dkWUsdBqGoi/BVYdMjXx34dJG95Jk9O/LQRYt9NippZtDtcd0CkeEKraLEQ5DZd9oppn
	mETR22agjEU0ZGueU6q2qPWY7SpOgCNPfdbr3cRfofe3Jy08xKR+u4bl50Si7h96iuWd+oovnS4Hx
	XniPkLn8341GrcxIpbjG1nQPFxPofahILZCPDcEjcCCbj+emtcqTzlncaVgamah8aXXfQD1jUdnHi
	CZFF43U6vmsJN4arqm0mL3pfnj1lQ3Mg0sqdbTQGtFPO5KIckIlgtfltqJMu78OXJyrzKxIL25FY6
	/UybLL5sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kr9YA-0001tJ-S4; Mon, 21 Dec 2020 00:59:46 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kr9Y8-0001sE-2Q
 for linux-mediatek@lists.infradead.org; Mon, 21 Dec 2020 00:59:45 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id b23so4493720vsp.9
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Dec 2020 16:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aD8F3zpX0cSK92jlYFm0rPZ8cbFr64Bk+pWnjCzU/v4=;
 b=VFBOP49Tf/oZgAntdNhW5/0rbkNZyek5OtZgtlCtgrFklLUdLxiiSxWiqp6YFwULR/
 Lh8v1fWx8j7cTko5rRy7P1bKsLyVCSmbbqfalpCUvGLhkLAVL9eu7glGvXEJj6N/NFce
 iYj5D/l7NIjLbunQgdF+139RCpCyYWV7jpktQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aD8F3zpX0cSK92jlYFm0rPZ8cbFr64Bk+pWnjCzU/v4=;
 b=pHFUWvpxsId5oYUdvDAnBfoVSLits+Gpq7wvB3Xi8+uH2nsUigDgTdLN+SfVGu2Mwy
 LPVa4Xgl5LqHjIKARpzz+g7vehlLbD6kedSX01tSmELQVXeymCs3FnEfihcXUKqUAszZ
 VrxasIv6xDREHXzT6ZrLNNtauZ60KgZu0Q67ICyEe+ZYSQ4JmoZ24WAWvkYoLUZTYAXo
 50GNfeXCzbNp37sztBlOswaRufA6skeJosWb1WOWKij3V+JDcfcu7ftC9NOFMe0LUa9r
 2s/QTXV0tXL+54CGVlDiuirw/s7LKdMEdlK3/2UwfJ5aCPFGJJIXeHsRFHpKu6k5vQfV
 DQAA==
X-Gm-Message-State: AOAM532iTKy8kcyjnc8M4ccp+R3EVQa6TZU24NrHCmpl8IP4VLAc9c4Y
 ePT2HpzfzBnnD7RXs3tZbHQQXJyCCrvEhXchINM1sw==
X-Google-Smtp-Source: ABdhPJw8d7KjqC65970hMryKNpzWdCeSPfe/lxCWvLhC2qMbCfOgQK8Qiu6yJLpZ5qihETaT+x5hLUOxaozHWXP1e5w=
X-Received: by 2002:a67:5c03:: with SMTP id q3mr10529936vsb.47.1608512380324; 
 Sun, 20 Dec 2020 16:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20201014131936.20584-1-crystal.guo@mediatek.com>
 <20201014131936.20584-3-crystal.guo@mediatek.com>
 <1605529631.14806.57.camel@mhfsdcap03>
In-Reply-To: <1605529631.14806.57.camel@mhfsdcap03>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 21 Dec 2020 08:59:29 +0800
Message-ID: <CANMq1KDB5W9ON0+ormDjFy=9oJUnAq4A41zNTUMHcWsAJ449Zg@mail.gmail.com>
Subject: Re: [v6,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
To: Crystal Guo <crystal.guo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_195944_203520_3C0965F6 
X-CRM114-Status: GOOD (  18.79  )
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
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?U2VpeWEgV2FuZyAo546L6L+65ZCbKQ==?= <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 8:27 PM Crystal Guo <crystal.guo@mediatek.com> wrote:
>
> Hi Maintainers,
>
> Gentle pin for this patch.
>
> Thanks
>
> On Wed, 2020-10-14 at 21:19 +0800, Crystal Guo wrote:
> > update mtk-wdt document for MT8192 platform

Rob: I assume your input is required here? Any chance we could have
your ack/review on this trivial patch? It seems like the series is
blocked pending on a review of this patch -- and I don't think it has
been reviewed before.

Thanks,


> >
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > index 45eedc2c3141..e36ba60de829 100644
> > --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > @@ -12,6 +12,7 @@ Required properties:
> >       "mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> >       "mediatek,mt8183-wdt": for MT8183
> >       "mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> > +     "mediatek,mt8192-wdt": for MT8192
> >
> >  - reg : Specifies base physical address and size of the registers.
> >
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
