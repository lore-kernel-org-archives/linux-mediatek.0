Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67E5C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e090UptYvOlwk2o/spWxT+a1kzobKHCjkmTW/8q9c3w=; b=3E9z7GY7YTfQL8QDsgKINT7ic8
	YvYXfzngivDGztuRlO+PjyJFCR7a7dvobD8WHxFZFQPGNwlVUSoyxw94SP7P1COEFaKUl29UURdZx
	kSh4uA11FFoDGrSqkXvUCMOUMFaJ4YgbNaMq3OArJ0h8VGbKL8KZjpSxOjUhf/KSW9MDT164uN057
	PmzmOQMRcEFVpSy0zk9XFXNuL0OBndId8k+VKSbS0Gv4ad+AeTQBV39vXDUJVEcKAI/k9kw1jy2M/
	14kkVGR2oB/GYC1XrIUyDVStTPZQ+uDC4+xxhFHxmP2OHOAypNR848CmXH15JUjTs6wBKX1NQCscl
	4Xymi5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oixpY-00Bl8h-Vu; Thu, 13 Oct 2022 13:00:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oixpW-00Bl6s-AM
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 13:00:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so1395575wmb.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Oct 2022 06:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e090UptYvOlwk2o/spWxT+a1kzobKHCjkmTW/8q9c3w=;
        b=F93eWzPL++XtQDy3a+zXwCE1abMBEHhZZC5fk/G5lRAZN1p3fw0BJzCSRf1JxVOu7E
         elk+ogcpjyjt0BJaW1qA7Bf1QwT5SOdBIxRdpsMN19BHaa1o+q35gUZk9ao/5jly7Us9
         bVJFBbIlaj9Pbwrogy+r+lvxcswsp7V/YFm7Y/YRtQHDM7NYVkQLQRl1Wgj09iJ82lJS
         tNxno/D2gJt/GRKM6SJoloEDoFDKI6sIIh9hlZfqvKTIFvS/1Agac/4U7sENZ9zSO5bm
         FJoRM6/sVmjvHYzN9GK/zIModIXYZIW2y/aMWHCVMYiN2oEYl7B2MA8JSShQ9OADH32q
         Yl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e090UptYvOlwk2o/spWxT+a1kzobKHCjkmTW/8q9c3w=;
        b=1PeYf375+prqRKO54N2eETVYoECAWcu5GdN/B11HpMHz1pNZnRgZWsCHkXDr7elgab
         R8HZ2jbRgmYvpEUz+kRDsNeQIUcT4LVstzb8dcBxVievSVUD/KjYZ64+Rn84hnhxh7ql
         z8aZmR0heaAZZT1nJMfDmPre/zelIT+mCS7Um7geEq3xUbktfpnp9Pqs3rvkMMfs9U29
         sw7/9MT5Ewn+rxePMWiGZcbXigSVy3JphN1Hs9wOXjAgiMIMdVRqjrgwxWV1/nqLFyH0
         2dFY92mFIG73BlnasoGn90A234sxJskrQ6S5N91YXVidIigR5Zx168gCq5bqeKsE4689
         14rQ==
X-Gm-Message-State: ACrzQf0CQdJKp0TPc0e9jsr8ohc/+Vzpii2HubMNEAR02bN0nuh2kW4d
	x0Hi8Yn+yaWbICvW0ip51cwVSw==
X-Google-Smtp-Source: AMsMyM5/qlMI5/7Jp1jEd/FpZ/9JWGz4x3dWQG9gJzlvxn/ShMXACpcKdGSWC8DNtFHlxSjfNttBLQ==
X-Received: by 2002:a1c:2543:0:b0:3c6:b7bd:a474 with SMTP id l64-20020a1c2543000000b003c6b7bda474mr6110469wml.95.1665666049068;
        Thu, 13 Oct 2022 06:00:49 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id c3-20020a1c3503000000b003a6125562e1sm4333524wma.46.2022.10.13.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 06:00:48 -0700 (PDT)
Date: Thu, 13 Oct 2022 14:00:46 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/7] gpiolib: of: add a quirk for reset line for Marvell
 NFC controller
Message-ID: <Y0gL/tdaCFOq98uo@maple.lan>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-4-e01d9d3e7b29@gmail.com>
 <Y0aW7vDxfNa/8bAk@maple.lan>
 <Y0cLLraNFVXtD2/k@google.com>
 <Y0cMibfIomw3S5dc@maple.lan>
 <Y0cNqBKm7LhZd28t@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0cNqBKm7LhZd28t@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_060054_376827_CFB08E4A 
X-CRM114-Status: GOOD (  22.07  )
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

On Wed, Oct 12, 2022 at 11:55:36AM -0700, Dmitry Torokhov wrote:
> On Wed, Oct 12, 2022 at 07:50:49PM +0100, Daniel Thompson wrote:
> > On Wed, Oct 12, 2022 at 11:45:02AM -0700, Dmitry Torokhov wrote:
> > > On Wed, Oct 12, 2022 at 11:29:02AM +0100, Daniel Thompson wrote:
> > > > On Tue, Oct 11, 2022 at 03:19:32PM -0700, Dmitry Torokhov wrote:
> > > > > The controller is using non-standard "reset-n-io" name for its reset
> > > > > gpio property, whereas gpiod API expects "<name>-gpios". Add a quirk
> > > > > so that gpiod API will still work on unmodified DTSes.
> > > > >
> > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > >
> > > > How/when has/will the DT bindings documentation for this hardware be
> > > > updated to describe the new bindings?
> > > >
> > > > Delivering the quirks ahead of driver updates is great for avoiding
> > > > merge conflicts but it also conceals the rename from reviewers so
> > > > risks neglecting to update the bindings.
> > >
> > > I was planning on sending binding updates once driver patches land.
> >
> > I'd have a (weak) preference for them being shared in the same patchset.
> > Maintainers can either ack or the changes can land seperately but
> > having them in the same patchset helps avoid having to quibble or check!
>
> OK, so how about once we agree and land this patchset to gpiolib I can
> blast driver patches + binding patches together?

That's good for me!


Daniel.

