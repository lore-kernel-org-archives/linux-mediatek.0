Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DA9C43217
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvBLWk5C5odh/9kdFJYc5TXBeYmjOJo6M2fyyPPdQz0=; b=sfdKq7QGTSctRmjDYH3D6IGrCA
	BjSiM50hlkriFTIPOtDpxggFYy/VwGtTTVGNFEe8ze5W5yr6rfc7pkodDEBn5tYbX8XUXFGzp148z
	aU75DvrbJt02t4tXFsmpsKCYCw94LzavBbKg93rOeMy1UG8SMVq2VdENmcx8QGpTcxCXNMcxmFhQm
	Q0xbID8SJIa4Ea2eiMgDsaQ1b6WmR+TnihBphHiPJ3qNQMm3J9JoxiLY5BwHYDcpJtsNktYB2lcrb
	beeDiQlfOXjUBQzi33MhPjaqnebMvfV2TE8/WPXjwAGPALhrSMu+TPL11e6c2GkEnGK8un5B0iEPL
	KLaMMzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol6ks-000ePh-Qa; Wed, 19 Oct 2022 10:56:58 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol6kh-000e1l-9X
	for linux-mediatek@lists.infradead.org; Wed, 19 Oct 2022 10:56:48 +0000
Received: by mail-ed1-x535.google.com with SMTP id m16so24684468edc.4
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Oct 2022 03:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OvBLWk5C5odh/9kdFJYc5TXBeYmjOJo6M2fyyPPdQz0=;
        b=akUtTjpyCFF0OTjTKaSIQN2KoiVQHuw3JGDlzrnyu0NzeMhwuzuXmpGGmD+ESE3PBI
         RReEckn5zOjjdqhGk8OVBXTXotszYUd4J8SxnEzWBkC9WzyzjltWt2Od3JVh3Zv0dPaH
         4IC9aqglZd4gzo6fTO6SrYC7SrQNesAB7OIJaz3SWYKvabXBWlYDJc9QaO7d2TZHiRQa
         lC630l6a+fE3eBpcy1VNUtd3jEh6y5O2e2T7u57xfbXCfYGNKueXe2ZYmcccI6Q9VT2M
         r/7fYthOqh44MSR/Ori7NBAh4X/4RqGqmqpf96lc3iyM9hGetlQTxNrsG/fJbfZ6IwDL
         LVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvBLWk5C5odh/9kdFJYc5TXBeYmjOJo6M2fyyPPdQz0=;
        b=b+uoIIMuOY8ACUq5oSSSu66xrMTBZUgOdTmg0Y3OV+GX0YG7NmGmAGbEtMCInIApQS
         2LVETwcyCOT/U+vudw6j9JaYCkDI6QKM5VJRCZbGcgJ+gYxM6VbXSFJNr8qR+aX+oy5W
         ylLX4SYt9YNwxis4XiAcIkCPbo/xb1K0nQtLV3dlytqvGpxgpIR0vCpK3g5o6hK02uGL
         Loihd2hj9y/WPrPlvvOyVxyFoMOr3Bo9Goh1STlYWbi9t7TQu6Hv7cJ2DBprgJo55Fda
         Jn3pWBc8SUDrV77I9cRRUEHYAKJrBkLRK09l850aAaDTN/hXVdEcKG+Pgk5ZZho7XWIt
         qavg==
X-Gm-Message-State: ACrzQf25lZjQK/3zjDOlLYrnaSbba4imnf/4GXtiXAkNrN3chmuMsWhz
	cwFdtDjYYf+fYed9YOKtV3bS8zS/zvrlBihmaxCqHw==
X-Google-Smtp-Source: AMsMyM411CtY5BP9UL9rEn1N96fK8eVNrW/afhn4tK4lAgLSapONCchtqYdva/IWjvHFfuQKS3tURWKmwIugqNo87Bg=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr6924119edb.46.1666177002887; Wed, 19
 Oct 2022 03:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com> <Y06cvrpcHn0jwZxU@smile.fi.intel.com>
In-Reply-To: <Y06cvrpcHn0jwZxU@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Oct 2022 12:56:31 +0200
Message-ID: <CACRpkdZZZp5Li7OSybv8F7a8F5iik_gRumwR__BAwpWddfctxQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpiolib: more quirks to handle legacy names
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_035647_380111_CC35D3C2 
X-CRM114-Status: GOOD (  21.53  )
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

On Tue, Oct 18, 2022 at 2:32 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Oct 17, 2022 at 10:41:01PM -0700, Dmitry Torokhov wrote:
> > In preparation to converting several drivers to gpiod API, and to keep
> > existing DTS working, this series adds additional quirks to locate
> > gpio lines with legacy names.
> >
> > Additionally the quirk handling has been reworked (once again) to pull
> > all simple renames (ones that do not involve change of indices or other
> > complex manipulations) into a single quirk with a table containing
> > transformations. This should make adding new quirks easier.
> > When using legacy names gpiolib will emit a message to nudge users to
> > update DTSes (when possible).
> >
> > Note that the last patch requires the following change from the OF tree:
> >
> >         88269151be67 ("of: base: make of_device_compatible_match() accept const device node")
> >
> > The change is also available in mainline - it has been merged in 6.1
> > merge window.
>
> I was wondering if we can use the approach that ACPI chose for itself,
> i.e.  the separate data that can be filled by the corresponding driver
> and then GPIO OF common code may use it. In that case each driver knows
> the exact list of compatible strings and associated quirks.

I actually deliverately chose the other way around, to centralize all quirks,
so that drivers look nice and simple and the ugly historical errors of the
device tree be hidden away in gpiolib-of.c.

Yours,
Linus Walleij

