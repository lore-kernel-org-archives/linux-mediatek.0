Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541CFC43217
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 18:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQhlZRnJ0m4X2vc4+2LyXOMiawQABMxJ/mhVJlXpyFg=; b=wT0wIz8tx2Dx3fsiWGwW2Yb3IH
	qSuL80onh9zpvk5OG+v8B/HHJ4j0T1hjzRO+YcypYNeANzrHCUKvRmtKURNgOl8WwArcYPbii+Yp4
	U80vJG6PmB/0jilxtdnGQRvL5debyLdX+lZgXOpoQ1EHdZyGrU0lQ7YyCd9SKyNOqT16htFY3YemI
	zGepp3qbp5IFDpPtgr2pC3ehyT1Xn9O9SdKMdEXPYWr8H0bnCUHb2UVzMbGhM+DsiXFdEfhMOLcub
	1jjqPHMqhmIHhuz8Mm6VII7SjTx83HD3IuzmZiuGp1ISO75+Tven9VJwnH95tO5oh9DeYXWl8iA2i
	CesRB9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigol-0092Eu-Fe; Wed, 12 Oct 2022 18:50:59 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigoi-0092Da-Cp
	for linux-mediatek@lists.infradead.org; Wed, 12 Oct 2022 18:50:57 +0000
Received: by mail-wr1-x431.google.com with SMTP id w18so27532280wro.7
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Oct 2022 11:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQhlZRnJ0m4X2vc4+2LyXOMiawQABMxJ/mhVJlXpyFg=;
        b=xMNjvf+iP47KsXXvWRx0u3fSGwg+++0J4Fte26zqd3QXweAzJju6VUxhJ1ncoFer3c
         hdU6ZC2WmqVvyYCdZp+mOpqsallTsYpcTVbfTQFQOS/TboZ5uPi2kS6rhiUbtgYx8vB3
         MRJ1SpNH4IewAGwM8G/NifGm+kufLzutUHEFoRggbVmFdJGwROdqLdIV4L+1wbHlqj4R
         3wI/1RjABzR+HSCzU/xl3lwEm8xjPPsw5IPHLR2mZiZp05hLNVOi/tXnMf9guAVQyyIU
         MeIRe9HUG3bMm2JhRMXi2v1NL0mjlX39lbFS1iH469C4CQhF1vVfUe1s6z1qRbuKxn8i
         aRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQhlZRnJ0m4X2vc4+2LyXOMiawQABMxJ/mhVJlXpyFg=;
        b=FWqgVRPHfXeYXu1FRNnQgPjZXeNksbamvCHkhVSh7RKbi6eMtVTwD/A96tXAiZObaY
         xGCglNjuLb9AY57mkmxOug41M7ayIQUGMEcO7Z/G9o59gKMqx49nTpBeIbs1WM/hEG1Z
         KbRf6VvKPiqpPW/t2y+a4+YxHWg61hMn9tr0yHRpcOfsZGdaNJemBnuWQc8hJtRi3vKy
         ourEtkSS180J+QWIoXhNvvwcUMRq7iJhZLbQVrBk/E8KFWqUWMRDBpEOw2OHdudxy/2X
         MvqlM0Kd5pvn68QdalWhPurnoqJpSvjZSYNHZ0kq93Kkd802nD9x/gdHEcE0+eVUHxml
         XFNg==
X-Gm-Message-State: ACrzQf1+Rw8QWoUXdP7Q2jV8HUYCkaPkmH6XGWWwBC9FzhocGaD+f9Ov
	ZOMY32gDR8a9SJuFE4wcnKZkWA==
X-Google-Smtp-Source: AMsMyM7kipgPbjIt6m4K8/GYYZTCjos7DxuGJh1RnAl0Ye38UQ60uXZy6uGh5XzIscj6pI9IK+JR6g==
X-Received: by 2002:a5d:6701:0:b0:22e:6545:995d with SMTP id o1-20020a5d6701000000b0022e6545995dmr18944278wru.301.1665600652184;
        Wed, 12 Oct 2022 11:50:52 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id s14-20020adfecce000000b0022e653f5abbsm332083wro.69.2022.10.12.11.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 11:50:51 -0700 (PDT)
Date: Wed, 12 Oct 2022 19:50:49 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/7] gpiolib: of: add a quirk for reset line for Marvell
 NFC controller
Message-ID: <Y0cMibfIomw3S5dc@maple.lan>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-4-e01d9d3e7b29@gmail.com>
 <Y0aW7vDxfNa/8bAk@maple.lan>
 <Y0cLLraNFVXtD2/k@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0cLLraNFVXtD2/k@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_115056_526164_5BAE3D2F 
X-CRM114-Status: GOOD (  18.11  )
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

On Wed, Oct 12, 2022 at 11:45:02AM -0700, Dmitry Torokhov wrote:
> On Wed, Oct 12, 2022 at 11:29:02AM +0100, Daniel Thompson wrote:
> > On Tue, Oct 11, 2022 at 03:19:32PM -0700, Dmitry Torokhov wrote:
> > > The controller is using non-standard "reset-n-io" name for its reset
> > > gpio property, whereas gpiod API expects "<name>-gpios". Add a quirk
> > > so that gpiod API will still work on unmodified DTSes.
> > >
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >
> > How/when has/will the DT bindings documentation for this hardware be
> > updated to describe the new bindings?
> >
> > Delivering the quirks ahead of driver updates is great for avoiding
> > merge conflicts but it also conceals the rename from reviewers so
> > risks neglecting to update the bindings.
>
> I was planning on sending binding updates once driver patches land.

I'd have a (weak) preference for them being shared in the same patchset.
Maintainers can either ack or the changes can land seperately but
having them in the same patchset helps avoid having to quibble or check!


Daniel.

