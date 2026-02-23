Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178F1EA4FC2
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWwsfQSmrc7KhlI2G6haDBaCjFdQ6FTDQCYdiKWJd1g=; b=JbZ+9S3KCadrUiXfZFrShdBlvo
	JiBF3W9qgkSuTRuoYMIeMhG9mCs7e2N6F8bw3wofSasqBR/MK+I0MVOPfBsQkSKo6eLGoaXlaqcPF
	CgkBqCcZgBtIpnBI7YVBdDaiPqUTczZmG+s5BMHO9FdIugQCFpQCVobIrOyx5TbAG/1KmMYESTGWg
	9XxQBciua2Qko9ICnN58ccnilm+nvgEF1H0qLzAZFwxQxT3yc2cG95W84wHvzTONamsKL9UTLwbz6
	vFu//7BO9mZMoK7ngxJRbJUGPN11+0RmKNnrebmzCOfw6IKGIR1GJbPdyWiGwTzUY84UjDb9JNiC/
	l7sA48lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWMc-00000000Pmd-08yV;
	Mon, 23 Feb 2026 13:52:42 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWMY-00000000Plk-1jPd
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 13:52:39 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c6e1d3e4dc4so890918a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 05:52:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771854757; cv=none;
        d=google.com; s=arc-20240605;
        b=LCO/M27k2ybTk4jiPCqyUVqT/as5iCF+SYR3tQW5ueX5D1tHQpHSvKGlNPSS6j14ag
         HdXI64qLfm+EA4C7Qtg8q3PGaMfFjfm6iw8COnSJxKdivjbCZulZXUTS1fnCZuPPmcLH
         QtDHn2bLmE3EW01YQ7Dk+YyU5tDGX6UA0hrMUmc9Y5GFb80Yy7yaFHpBmy+Qp3cHZvx5
         omAPuooqT5/gRrEyVlx4HbYjbHoiuU07mNATV5IdfQaWVSKW1FLOF/F6Ger6R6uE6MdP
         E0mgho/J91MLFpBjM7jErOUVrSVoA8cMpOYL24VYVldXk/x3MegEsXgF00HPZ0u/sfqK
         Nk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TWwsfQSmrc7KhlI2G6haDBaCjFdQ6FTDQCYdiKWJd1g=;
        fh=ajpQGjkKpmR6/hV9dQ4dEbEeCw5/7ZFqD+79w0X5Suk=;
        b=ZP3GGsbF7vOmekyCk+G6puWeu1bm6ZMRtg+1eCKucbFSOKIBUQYRtHRw7bXYoW99ym
         BkpX1nIl/za8EmGGW0GKpVDOd8FJ2ZMH/GgOcY51pvzSaplVLCkpZrQKbPBho/MdsI5h
         T9QarTpJNwjesv5mmvAJ/0j4rSJu3vHcx7xk8ogZE3SwGEvhZhkUeqnlEWyTOVD9qYyo
         F1J7aW8hAdEhqVFggcZqvAS/Opku6LF5TWVL8rUbbHVRfj4f1Zfy4GnS+CGDTqdlX7yY
         LPFEDon/WxHu5T3zXlI9m1y+fOga28bDIvEIzoTIeFztfPAjp/mZ5vm/q7yNzmmSPjUD
         cDAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771854757; x=1772459557; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TWwsfQSmrc7KhlI2G6haDBaCjFdQ6FTDQCYdiKWJd1g=;
        b=N9O1qwxrFGfPEyeQBenRjkRIfD2S993QMvTdHr7jWzbNkzceFqZ+shm0ht3T2h/ulI
         5TA4CefctkiM4/tGHjsJJ8jCrBZizeUy+YQy0iFknCwTE6jeQrIP//cMEdzXUFIl+6Jf
         2e4/kFUjluvazcw6LZmY8e+H8WpXbMT3snfrZS9nEhLdR7TE/uy0lkrLnNmcqtAs939Q
         89eGSFHKlqQj5CcG2mvDAMk2LZQF/OMuiL8vMzRGKU9KsLVbDvSG1hBImVdfNh/HAo/O
         5vH1ySoETpgUa9JTFx3+mcx37vXyptxaSJvQh8EUSPDCGn5JWuaOyD1+9TleXYL6Utan
         yW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771854757; x=1772459557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWwsfQSmrc7KhlI2G6haDBaCjFdQ6FTDQCYdiKWJd1g=;
        b=xOV3gbHOc9IQmGBsOdaa66MG7EKeUTaSxaX0sI1iyz7aOi8Rmnd82chgBroFyOcRI4
         Ga9dy2v5nr/YCoAGTjcHmYEtAJa9/TDZ7zvYw9WiJuS3sZbYsu07ta+Fi7t45xbYRJlB
         A8PXDNfjIT4zk22C4ppxUZORhRqKa77vct5Iz+WULJcFV4BpOAYdC7TaQe/itHZXmWHc
         sDRCcfz5OFgi09AAZyrkayTjLdDdNAbp7LDjeyWXsFjnPnSn+uNVfUdZ+Xl0YWLA49MI
         Ym9ooVLPogAT6XRAF/76NeQPc0QbAnYRUsiOGt9mIK/pljSH7N547s7AnRN0PY2AtyJE
         3+rA==
X-Forwarded-Encrypted: i=1; AJvYcCWH14H7wMz/bZmBh60f+50dJeUG+tCvzKZ9k+HSz+N/Q+KQLHjCI9X6CGDDxUiv1CMbWPL8VY5thC5hZ9OCrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTzG5x2sTCDUR8A4+XrB/zrLtpn/yjuWx2+s0u64WKfhodLyXR
	zd1wEoKTRAiu4nqHFcL+sFx4n+VTu1hvDetJruPAQyaSeO5U5EY2Qx48qN2AGiqsIb2E2mZeTe3
	DTKcm6rc6AjBjvGzszYxgBh+Me8q6+1w=
X-Gm-Gg: ATEYQzyGOQ2MbUSH+Jg/igkL+iZjfqGl0gZm0pfQEXzjVh9GLvmG7NKwi6s7jPos1ON
	0ciDEIkAZcJqGHoYSWyOhliB+XSV6jvJ9KMyi7rRyD0NGDcy2mcsiuZfz+ajJbrD/AeHwjrrM5O
	vVgQHe61a83V4GBwiAzJFGg33rv+QYik4Mwz/gwR3ztOFRvgw4I/dP6QWaaQMMfh51nfwZDzyFF
	4U5vrjuCtkf6JRWFO/fV/BSvTwzr2YgWIdaE5Wni5nnbeddqTXm+ahRl3OprblXhnqHPsiQGpVU
	GyErXrkv
X-Received: by 2002:a17:90b:5447:b0:356:4ea0:e9e2 with SMTP id
 98e67ed59e1d1-358ae8d3a09mr6084454a91.34.1771854756912; Mon, 23 Feb 2026
 05:52:36 -0800 (PST)
MIME-Version: 1.0
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
 <20260223-workqueue-devm-v1-1-10b3a6087586@oss.qualcomm.com>
 <aZwWMiYEvr3DXi3E@smile.fi.intel.com> <9dd377f6-3565-4c0c-8c98-1b5ac4982f5b@kernel.org>
 <aZxES35K3hSX4KEx@smile.fi.intel.com>
In-Reply-To: <aZxES35K3hSX4KEx@smile.fi.intel.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Mon, 23 Feb 2026 15:52:25 +0200
X-Gm-Features: AaiRm53PjY3r4YJJgRdEcXeF3wEcS_dn51myeI6Bp2rdVCy5EIQxm03JMpsksBU
Message-ID: <CANhJrGPWxgFddKaqdFM+DGKYTXaPxeBZLMhxBfXT-ZU6SrsbPA@mail.gmail.com>
Subject: Re: [PATCH 1/9] workqueue: devres: Add device-managed allocate workqueue
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Tobias Schrammm <t.schramm@manjaro.org>, Sebastian Reichel <sre@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Lee Jones <lee@kernel.org>, 
	Dzmitry Sankouski <dsankouski@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_055238_455157_54D1E528 
X-CRM114-Status: GOOD (  30.41  )
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

ma 23.2.2026 klo 14.13 Andy Shevchenko
(andriy.shevchenko@linux.intel.com) kirjoitti:
>
> +Cc: devm-helpers maintainers/reviewers
>
> On Mon, Feb 23, 2026 at 12:52:14PM +0100, Krzysztof Kozlowski wrote:
> > On 23/02/2026 09:56, Andy Shevchenko wrote:
> > > On Mon, Feb 23, 2026 at 08:27:29AM +0100, Krzysztof Kozlowski wrote:
> > >> Add a Resource-managed version of alloc_workqueue() to fix common
> > >> problem of drivers mixing devm() calls with destroy_workqueue.  Such
> > >> naive and discouraged driver approach leads to difficult to debug bugs
> > >> when the driver:
> > >>
> > >> 1. Allocates workqueue in standard way and destroys it in driver
> > >>    remove() callback,
> > >> 2. Sets work struct with devm_work_autocancel(),
> > >> 3. Registers interrupt handler with devm_request_threaded_irq().
> > >>
> > >> Which leads to following unbind/removal path:
> > >>
> > >> 1. destroy_workqueue() via driver remove(),
> > >>    Any interrupt coming now would still execute the interrupt handler,
> > >>    which queues work on destroyed workqueue.
> > >> 2. devm_irq_release(),
> > >> 3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.
> > >>
> > >> devm_alloc_workqueue() has two benefits:
> > >> 1. Solves above problem of mix-and-match devres and non-devres code in
> > >>    driver,
> > >> 2. Simplify any sane drivers which were correctly using
> > >>    alloc_workqueue() + devm_add_action_or_reset().
> > >
> > >>  include/linux/workqueue.h                        | 32 ++++++++++++++++++++++++
> > >>  kernel/workqueue.c                               | 32 ++++++++++++++++++++++++
> > >
> > > Hmm... We have devm-helpers.h. Why the new one is in workqueue.h?
> > > Can we have some consistency here?
> >
> > Answering with update:
> > I don't think this should go to devm-helpers.h. The definition is in
> > workqueue.c, thus the declaration should be in corresponding header.
> > It's logical and consistent.
> >
> > Otherwise, I could move it entirely - definition and declaration - to
> > devm-helpers.h, but then the release (devm_destroy_workqueue()) will be
> > essentially exported to everyone through the header.
> >
> > So kind of conflicting choices.
>
> Hmm... An alternative I see is more intrusive but should make it less
> inconsistent: Treat the devm-helpers as devres like header for workqueue
> and collect there all devm_*wq* related stuff with maybe something putting
> back to / holding in the c-file.
>
> OTOH we may leave devm_destroy_workqueue() visible for now with a comment
> saying do not use, it's internal or something like that.
>
> Hans, what would be your opinion as you IIRC is the author of devm-helpers.h?
>
> Matti, I also Cc'ed to you, you have usually non-standard thinkig and
> insightful solutions (besides being reviewer of devm-helpers).

Thanks Andy for Cc'ing (and flattering!) me ;)

My personal opinion is that the devm-helpers.h as a "collect 'em all
here" -place might not have been the best idea. Perhaps the original
author didn't know what he was doing :) Problem lurking there is that
such a file collecting misc devm -interfaces in one place, will end up
slowing down the compilation while some people put effort on splitting
the headers.

Currently the devm-helpers.h contains only workqueue related
devm-helpers. I'd consider renaming it to something like "devm-wq.h" -
and then just stuffing the devm-wq stuff in it. Optionally, I'd
considered adding all the wq-devm stiff from the devm-helpers.h to the
regular workqueue headers - but I think this was not liked by
everyone.

So sorry, I have no helpful or strong opinion on this. Besides, You,
Krzysztof and Hans all probably have better insight on this than I do.

Yours,
    -- Matti
-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

