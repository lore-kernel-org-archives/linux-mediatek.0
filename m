Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8E2C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 20:53:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A122D233EB
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 20:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A122D233EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c9T13JCJKZkQXshiMRFJInBDiqlffT3DKToX4931/C0=; b=dtWKA4txVZE7BTvcA0tPD255/
	5GMtVPpXbPQ682M9p9kah4pLJbnJ8gzvWEzREnpFjLQ/sqEASPRetmljVJ3AhCJZ7XG6FBLWRJIDe
	BbVhUH7V3eEERoep/jSE0H4P9Yo+dUw3w0IqgL+8r6ZizJXAf6KD1oXaqZGkoyzddleDEAXE6juYH
	blTIgu02m8yLfaAv/V1iYvhN9O+9nOh1wOrOwYHH9h284SpEXNZeaP4M2m3BlzMJMPJ+20e+4USWt
	LDPcL8AwWaYf9uAfH1yM8v4RvKwTVBakRusam9Uf6VM93m9cR9Jl0+iiFAnVj8yHUSmlUbeypER9j
	Rd3LuiuLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpdn7-0008Pn-7A; Wed, 16 Dec 2020 20:52:57 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpdn5-0008PG-75
 for linux-mediatek@lists.infradead.org; Wed, 16 Dec 2020 20:52:56 +0000
Received: by mail-lf1-x132.google.com with SMTP id h205so8335421lfd.5
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Dec 2020 12:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vkdNbAXJT7PhCwQlg2OILB1sS2zw/a+6Z3NYSr5wu6w=;
 b=yFad8AE/AQK6llfX6tOw1g5IO0dT9I4sS8IBJVb3uQ7r/hEeNTRfkdl+9cQZ+jWPLE
 qqu50D4RVFNN6os+efS0By1w6nQ4ps9AjqGArnaE6ntl16cZYncDvgVlwuiH0dbuKCFw
 BryDmTWBboRR7BllifqkUAszd82CCmbXiFjsHwJB7YAAcrXbKWt0QkwgUKyUUd9YnRtg
 d2DAjXG3Srywp6TfpxUfdxDmJAHQMeNw5c4Y81YBcKLya0gxv3pzS21fpUCUrzLfvKTU
 X7v4ytEoKQytHmrfWe+f+eB+76Ef+FDIHzf2D3oSbEVXTp9fjVYzzei7Bu4ZiNLl0w3H
 LELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vkdNbAXJT7PhCwQlg2OILB1sS2zw/a+6Z3NYSr5wu6w=;
 b=e8bN1ePP2HnCasOgqHtSvqd9eYD68eAndh+HZHUaY/bwH1ZaN02G9nyyuP/lqM76fI
 7XT4RtY6Hh7oeaKiSPRXPaS95qWg2MDm+4BBDZIs5UR0F641guDvhE4v6r3eFFShUUf3
 BX3JhVBtb9/aiy6PcFOgZ1ZAGg8eamJxxtXS6U9kiKoXRFBRTy/rThqN7U2J8CtsQ0u7
 kkjQOq9jAO+Ru7daEmMGE4l75V/O57QyqvPL6aWrO7rV+QdJAnmE1Myfoj2HtLLxdRG4
 3c+srgXFQAFolOSY2cuTO87xJ6QZxEyq6isya9mDSmwKlWMLf0D7qnjh0ZZcDEy03FeR
 EAFg==
X-Gm-Message-State: AOAM531FqIckFmR+NQ+zgHUzN2L8kVmzJZB2ebKWNZDF5nOsHKMwa+Ht
 j9lmTV48IhE+QNDkp72r3Hyc35r2tWcP/KeAav2/sA==
X-Google-Smtp-Source: ABdhPJwNTG6XhtSllHr7QZCJ9dxFjH2Ugc2EnjaDWzXT1+chx7RIEQDXqYx/2BQcvfCH6W+E6YGshpge9V7PWgEKBrU=
X-Received: by 2002:a19:495d:: with SMTP id l29mr9093794lfj.465.1608151972803; 
 Wed, 16 Dec 2020 12:52:52 -0800 (PST)
MIME-Version: 1.0
References: <5fd76cf2.1c69fb81.6f19b.b16a@mx.google.com>
 <483b08f2-09c3-e753-d2ce-4e34fee627f3@collabora.com>
 <CACRpkdbozXM3FHQB9+GcPJZdNT+Vi1223m2uEqqJ21ukY1A4Gw@mail.gmail.com>
 <8e5e0251-9450-5c93-cd2e-c44779a72b0c@collabora.com>
 <CACRpkdb8Bgie3dJME5qQwu_33b6zVYzAayJnHJUCzrkntpNNXw@mail.gmail.com>
 <600ff528-71b0-ac02-0266-ddc5e3b6fcf4@collabora.com>
In-Reply-To: <600ff528-71b0-ac02-0266-ddc5e3b6fcf4@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Dec 2020 21:52:41 +0100
Message-ID: <CACRpkdbb84M4k-te0uwfDxX4PR05Z=SXZC8nM_HH=GbkNoCf7A@mail.gmail.com>
Subject: Re: linusw/devel bisection:
 baseline.bootrr.mediatek-mt8173-pinctrl-probed on mt8173-elm-hana
To: Guillaume Tucker <guillaume.tucker@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_155255_378344_321F98D3 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: "kernelci-results@groups.io" <kernelci-results@groups.io>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Sean Wang <sean.wang@kernel.org>, Johan Hovold <johan@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 16, 2020 at 6:30 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
> On 16/12/2020 12:41, Linus Walleij wrote:
> > On Wed, Dec 16, 2020 at 11:10 AM Guillaume Tucker
> > <guillaume.tucker@collabora.com> wrote:
> >
> >>> It seems we need to teach the core to ignore the name (empty string).
> >>
> >> OK great, I see you've sent a patch for that.  I'll check if we
> >> can confirm it fixes the issue (something I'd like to also
> >> automate...).
> >
> > Yups would love to hear if this solves it, it should be in today's
> > -next.
>
> Yes in fact it appears to be all fixed on your for-next branch:
>
>   https://kernelci.org/test/case/id/5fda32f92738afa48dc94ce1/

We found other problems with my rushed patches so I pulled them
out anyways, I will tighten them up and make a better job for
the next kernel cycle.

Thanks for your help!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
