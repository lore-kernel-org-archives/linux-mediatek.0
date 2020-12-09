Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C775C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 19:53:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B183239D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 19:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B183239D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HIc3UPrueniADBTeODw7iHfQ4A3b5IcpyN18LYpxKEQ=; b=cQgFGZBOvKrr6dI3zgbWHy2ae
	SSHub2W3qpiUDyaEzhYOfsIOJLNkexXAyfCROHBAuYxuoIu/9P/qOh/VqMgp+HcC4t151t+onzsW3
	tse6uhX+YRjzWQksBvs6XrYlcPNDssSsiaHrWcfXfWWWnOIvdKm/ycbmWG0H1Gq4iShhUSy++DMJn
	s9K6BawGUGhfLSA3ygc9lWlD2ZTleV3/7h7CuBxBRo2qclVNDzBXmJzysyJ5vySO8y9ISeZrATkZL
	Uoy+hjaZO/0MnU5wS7UobwIBxbSL6aZ1N8hgK63MCvRehs2HfT6Tzv8bP0VVPpFU/lD9PZ7rAWHnM
	BNM5nwWHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn5Wx-0007hF-IC; Wed, 09 Dec 2020 19:53:43 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn5Wu-0007gO-8M; Wed, 09 Dec 2020 19:53:40 +0000
Received: by mail-oi1-f193.google.com with SMTP id v85so3033129oia.6;
 Wed, 09 Dec 2020 11:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bWf259ujDoB2ZIyMFOsodZPaeqbO0l1sTiL/ZFlI8PI=;
 b=jeWkqOnkLlSZCtqCkR4nK3UN0b4FmB7Tg0UXTAMWsKE6FaEhM4dywp+vrvbQWZpowh
 ACd3QIYpBDoycnstwzNHDsfBbLxFridk/IFig+LSoKYdlvH+SXMmNFqxbdzb+EQEeaWZ
 bMTKz7apmmZBl2rcvBbzJwJcMl3NmUVg0G+rhV1hl61Zl0psImrXFZyvWw8HreJkB9Qt
 RMMYjKZnsPaLsN0rSz9c5PGrFKzVf79k8ZIRwf1mMXVum2MTmCk/9HvH3/RSThIX5Kbq
 QKL7H0FyLKDO3ORI2qlHk5qBrRjguHPOjxKEdqVBiO1wGWjSEBXuZA4u837gxzyOQiQC
 MZZA==
X-Gm-Message-State: AOAM531C/m7rAmON+lXcC2wlVtyfKvOO33mnGDv6svHE8y++rxIUooPQ
 w6xtWgtQA23HoPgeiYAHsg==
X-Google-Smtp-Source: ABdhPJy8vklabGU+56dHaK8G6GlcdfFVaLlc7sCI0zIneIbykIjFdWm2aF1K2lnvNRsZQAKviqY2qQ==
X-Received: by 2002:aca:5cc1:: with SMTP id q184mr3042479oib.46.1607543619166; 
 Wed, 09 Dec 2020 11:53:39 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u15sm493924oiv.28.2020.12.09.11.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 11:53:38 -0800 (PST)
Received: (nullmailer pid 837413 invoked by uid 1000);
 Wed, 09 Dec 2020 19:53:36 -0000
Date: Wed, 9 Dec 2020 13:53:36 -0600
From: Rob Herring <robh@kernel.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v11 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Message-ID: <20201209195336.GB826766@robh.at.kernel.org>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com>
 <20201202122329.GA30929@duo.ucw.cz>
 <CAE+NS34D8a6Udt7ZZ0=U7oqm5POtihKvD3WjD_sAADamqQ=1AQ@mail.gmail.com>
 <20201203114044.GA9061@duo.ucw.cz>
 <87a4f0b9-1450-cd9f-70ea-dd5b408893f3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a4f0b9-1450-cd9f-70ea-dd5b408893f3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_145340_313595_A830EB35 
X-CRM114-Status: GOOD (  21.31  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene.chen.richtek@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 03, 2020 at 09:06:42PM +0100, Jacek Anaszewski wrote:
> Hi Pavel,
> 
> On 12/3/20 12:40 PM, Pavel Machek wrote:
> > Hi!
> > 
> > > > > +++ b/include/dt-bindings/leds/common.h
> > > > > @@ -78,6 +78,7 @@
> > > > >   #define LED_FUNCTION_INDICATOR "indicator"
> > > > >   #define LED_FUNCTION_LAN "lan"
> > > > >   #define LED_FUNCTION_MAIL "mail"
> > > > > +#define LED_FUNCTION_MOONLIGHT "moonlight"
> > > > 
> > > > There's "torch" function that should be used for this. I guess comment
> > > > should be added with explanation what exactly that is and how should
> > > > the LED be named.
> > > > 
> > > 
> > > According to mail, 11/25 "Re: [PATCH v7 2/5] dt-bindings: leds: Add
> > > LED_COLOR_ID_MOONLIGHT definitions",
> > > The Moonlight LED is LED which maximum current more than torch, but
> > > less than flash. Such as front camera fill light.
> > > I think our channel is moonlight, not torch.
> > > I will add this description to comment.
> > > We can't exactly define moonlight current level, because every vendor
> > > has their own specification.
> > 
> > So... what is the timelimit on moonlight?
> > 
> > But if it is used for camera illumination, I believe it should be
> > simply called flash.
> 
> Let's keep FLASH reserved for LED flash class devices.
> This device has already two other flash iouts.
> 
> Also iouts amperage gives clue that they have three different
> functions.

Perhaps there should just be a table of currents and max times rather 
than trying to continually expand this while tied to function.

One could simply want an LED brighter when blinking than steady state 
would allow for.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
