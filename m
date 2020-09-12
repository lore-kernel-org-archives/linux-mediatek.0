Return-Path: <SRS0=bsXk=CV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55C3C10DAA
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2020 10:08:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6722E214D8
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2020 10:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qW6VeN4b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m84ZT5BP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6722E214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qn5+ZTWWo3odeEu+tH0jZtz2Jy0EJWF3247/5g0+Bek=; b=qW6VeN4bqf1Z7oYqcBvGyIYpN
	BD6Aq601KA2OfsiL8urrS2VR6zKZ7YX+hN6ZQ69z8FHrTWMfHOjyhCTBQY8CcQW8zQhGIfuq/iNsv
	iV3EnZL1IHEKqgp7ArgvfhpZzROmbXJ8E4j+SPmELXD2ErDSlPuwVjAzzqHJL8DQr2XVCc5btiRFX
	XuwiPQVTnUjdokgiyYMgiUjjpjZjX0UwhV3AjElgwruDwp3jcTG0m9JdV/EyHjgn5XVxHlevA2axK
	opx61epWQhOQBI7p25fjUV6dPkfP+oCpeP7gL4/jgLaR58ORcXBjykSF8soDuL9skOivvl4kaEdE+
	AZmNVT6/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kH2S7-0001Oh-0I; Sat, 12 Sep 2020 10:08:15 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kH2S4-0001O4-D8
 for linux-mediatek@lists.infradead.org; Sat, 12 Sep 2020 10:08:13 +0000
Received: by mail-lj1-x241.google.com with SMTP id c2so14497862ljj.12
 for <linux-mediatek@lists.infradead.org>; Sat, 12 Sep 2020 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LhS5fiHNS+mf8gdgKUyRgo45ZOROmtSlUAQLqDxlfa4=;
 b=m84ZT5BPICoUprfBrZfjZJo2ToERzKGaIY2M6zIDJinD/VsTcZGwo12Haard8p1vhC
 MjZ8Hx1mOMoZusfjl0oIINyvWLew3L/D9Vjr6BiIPqengZMXdB/f0RVu1NZMRU2Q3z2V
 kDw7HrGgkIRJkY7ZdDYxtEtXHKR5/QKvHKBVMwnPxWhPJDa8IJD1nxJmu+ACxDeUAVRj
 eWLRVBXOA6MNERWuGkqiqoNBVFHwzaDGQ/HFBHpcyhLZgLwuWw0uLKa/KkF+xDYIC+Fm
 y512jagysE3SZE1JiPHWpTndTacUnZvwMYiNVx5FAlo6DD9u1U+4vzX3/glDN2wD5pMh
 pEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LhS5fiHNS+mf8gdgKUyRgo45ZOROmtSlUAQLqDxlfa4=;
 b=fAdZYrOMl385n6n4P8jQ34ku9K73NlZT8mm8df/YhvY0azVsUzqKLF5G0GGWYULE2+
 e6qT/Z3tLS+2brTWusTJq8Fb0Ef/MAp45Iaog2ZJyBaQ6Uwbux+YQVr5UsicE2oZjn+y
 FnAo+KOlqvsTlavCgazqBu8yhuv2bSgsvhkt+SnNaBbMtex2+jGfq3R/tB21lsJanS9y
 2lI1QFBgTML4YYC7DEF4g5d0Cz8i0C8MQDAzjhSyua6bnRZ8C3FSMV7h8Dyd144+9s/m
 WMknS8oQBC1mr1IQBUcrXmUqYeHKy8All5upmBunl2adrcvQPCh1xsFWr0yC6vh1BuTF
 iVJA==
X-Gm-Message-State: AOAM532ZfcCDmPdt8J/Io1sAryjiGWQjzMgzAkp37rovpI/BVfxew55i
 jy4xjUOPNcC5rK6Lr1O/8FuewkfMxs8FrPleHyJaWA==
X-Google-Smtp-Source: ABdhPJztH8Y3Zl30n6XdqCSNpq33ojnWBwr/h05qXrY6CWiTumbfWA4LLSAc0k49IpbpJ+j5i9pFRwI9T1f7AE6sj0s=
X-Received: by 2002:a2e:9988:: with SMTP id w8mr2308597lji.286.1599905290685; 
 Sat, 12 Sep 2020 03:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
 <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
 <c162b6ad-57f1-a75a-11e3-9c80c60bd845@ti.com>
In-Reply-To: <c162b6ad-57f1-a75a-11e3-9c80c60bd845@ti.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Sep 2020 12:07:59 +0200
Message-ID: <CACRpkdbrrzkYVW13V89PJ5_WRGhxSL0rOxAHA_7hYSyw28Shvg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To: Grygorii Strashko <grygorii.strashko@ti.com>,
 Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200912_060812_564015_49263913 
X-CRM114-Status: GOOD (  16.46  )
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 11, 2020 at 11:54 AM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> More over, there is already generic schema for gpio hogs: gpio-hog.yaml

Where is this? I don't have it in my GPIO devel branch for sure, and
it is not in linux-next either so not in Bartosz' tree.

I did suggest that I want a gpio-common.yaml file which includes the
hogs.

> Originally, gpio bindings were defined without restricting gpio hog node names and,
> generic schema follows this.
>
> I think, the generic "gpio-hogs" sub-node may be introduced to place gpio hogs child nodes,
> if gpio hogs node names restriction need to be introduces (*which i'm not sure is reasonable*).
>
> gpio@20 {
>         gpio-hogs {
>                 yyy-hog {
>                          gpio-hog;
>                          gpios
>                 }
>         }
>
> But this require as gpio code as generic gpio schema update (with backward compatibility in mind).

The whole problem I have with the DT bindings is that defining
them is not really a Linux problem and the people maintaining it even want
to move it out of the Linux kernel tree. It is supposedly the responsibility of
all operating systems using device tree including but not limited to BSD
and Zephyr.

But there is noone picking up the responsibility outside of the Linux kernel
tree except for Rob and Rob cannot do everything.

With things like this it breaks apart because noone takes the overall
responsibility. And as subsystem maintainer I am fully overloaded with
the Linux side of things.

This is of course not your or anyone else's fault. But:
GPIO DT binding maintainers/writers wanted!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
