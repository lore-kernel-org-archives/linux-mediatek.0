Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C8DC43458
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 04:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=; b=4Ybb0LJK2wSLY4S4bMva2O5CnU
	3AGNBPDXuosMbXDpGm/0N+XEyBVfFu40OROIn9ZO70Jf7jvaYvUjpqsj9dMPb+TwTYBhgqXuwQ3WG
	ne5rqd2K77aRBSF+lDC07drjHmjDkrQ4n7sBRjNuhsN7pTFzR4hyF6IQ699crXJpws2W7GfizLUc9
	P7jtUYkDglJ/v+eNho/KcfsvIpxWJhANmeuSKmWWU8NP20ufnA/Iwm19342C6awWNLYqNZ4PtBrO6
	cNBd7MQ5726gQj7QTN2AmX8uAIbtXGvYGWTuu9a+OX8MntxpzmhjCAvccOhbfdmhpROz56hQP8Uwq
	6P7kmCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEBo-0000000GRYs-0dKJ;
	Thu, 16 Jul 2026 04:59:16 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEBl-0000000GRXr-0qm4
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 04:59:14 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-6626b5ace23so327959d50.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 21:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784177952; cv=none;
        d=google.com; s=arc-20260327;
        b=LVWPZiReP8IKeWN0E7XCeRypOiYN5aZCUu402aAp4XPsCZwSMSgVAVjteFnPWRSMS+
         1quCCa09TJp/Q3VqrxUy1zzskTHGLhFux3UVWNN/PsPg3JDHUjxRZeU54XaKSqj/kX5s
         v2JzhOA1NiuK3pNEds8dBHH6i/7salHFsLT6YgyzaRLNW7qYkISYPucwd8oIHXqJnCTP
         nJbv1YguUt4xv4B9ynJxyV7nra6xvJP7e8ujY+hWwwKiqwnv+qQALb2/u3pPZAWbjUlN
         Tj+/pJ8nQGQgpWHybgl+EoX1NCwq7Y4xxf1UOEvHb97I8u6pm9awR/EpQ1OSCjKXpLcq
         TpZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=;
        fh=vk8cEgTuN6cfpS56+gO6R5S7rhfgM8czW8kXdTYvobA=;
        b=DMqlwp87ksArjdL7Xhuwt/mvJD8pNiehqIyf5g8ZGH6TQ89z7QRlLcNeg9yjKCXA3v
         hfu3z3qhvwua+oTt5/ucnI4nUOPHiZtnWZkkXVer+lDPI/X4HE+JJOT09oxqeCBfiauH
         6PVtSjZBBUtfre2PGX72a7ahUXH8H6+QS4YL+8lZXUc90e/20Da+MvS1OgNgLJe+vg6+
         e201rXUnYYIWtH/yMjaq6HJJVwT1MwRODvsNBBlCWIe1oLUhWzh7eWOuXZY1XYzIr/R5
         k6c+ThxaZu7TkjEnD4QjZDcxcj5L6zTdkleA1qzndwUgk80QLBu8OQAphPok4HG5XdcU
         gpTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784177952; x=1784782752; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=;
        b=BuL+MWhIxqj2V1fbCmYLtGQhHBgaIVANdkSfqCPFxvk4DaYHBFMHK1Xzg8trCnus1d
         Jk3WrZzklDZjOjqQnwqb4ivowRKE8xBzKmf0nrx2dV16q4XUBp2QSHB99ZVvkEOx+9Ro
         ns/8d+favxQnIhdCBfJoptXRrRcOOWmD76WWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177952; x=1784782752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=;
        b=OFya85OAIQRUCU/n+MUBcBZOTvNM40bm4gQxA4WSGif8kiKIJK7np9aMHJ1c6gvt1B
         +mwYiX4v/rSN6fyaUfA9AMejBwFuPvGXSgPW7wwCXv95ybxH3BucZZY3O4P7CJQg1zWx
         UueoK4vpbN4kIEeP4b2mcFdYzViMnChh1J4Ko69YoIw/Z01eQfMemmKkgLNoMsQvMxz+
         YpJkDwlO9C3asJM1tTSztyvILE13HHKK7uk7bfP8kb5SA/muI6JQ0VX8kzCXQLCa2Kpg
         a1v04NBHShsaHJ4k8cYMBEY/mMp52mpQyHKVPFuyO0BfJCLqX7/RPj477Lh10m0I94cL
         ECBg==
X-Forwarded-Encrypted: i=1; AHgh+RrtUGXLVwKcd5ECuKWy9K0nucHIN9qCovtu+rpoKjm9AqFMOYyXIe7s33ipRrnm+G6ST0KJ8BSYsrm00lOMTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcj37k/ClRqmxPBoMsUiT2DHlg8XNU+JveUDMjQ7xoYStyFDoe
	fCrj1VS5nMXVF2LDoxlfG56VoWceJQJCzcHIfrzV76gF0wL030HRBCZjUV5p/0Iyj10kmc9sCjU
	139I07flrDjtK5cJYPnRFK6dQuNtGnd8x4TzxPUyp
X-Gm-Gg: AfdE7cmAoT7AjF/pGVYFWKxXwgB5VtBDOEc1q0xDXRqtJ4Y4a3PFJiLDDVs2H7mxZIu
	F6lX4olUzDQbZbi/a+lxlIUsF2CT94GDA1ZPIUYhN2iuu+5HOa/+Z+FNsKkfgiW6E78UeOieoXG
	7cS0vAw+ndsbncDoSaBrJT+lw2sHINkS5tEwhCajNYU13XKCShD6faoi92BmCsIBCPoZJfyLDR8
	BPJtuAEirpfB/ghQf5hh18wBTUUoesDDoYjJi1BpXJcFNfU+xX+trAdtf9MQOc4Mb2exnhHHVKx
	bcflbZ1F0wXQEA9b
X-Received: by 2002:a53:b784:0:b0:664:b559:d524 with SMTP id
 956f58d0204a3-66829f39e58mr611543d50.4.1784177951944; Wed, 15 Jul 2026
 21:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-4-wenst@chromium.org>
 <aldS3qTympJuVXYj@ashevche-desk.local> <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
In-Reply-To: <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 12:59:01 +0800
X-Gm-Features: AUfX_myfMUyRbxWwYQRsbuThILT6idiwmNtqsd830qG3sUgPLjemD-RPoobAiuo
Message-ID: <CAGXv+5HGjGTrqqzJrpiQhLrCn3C6H20LXq3niPnoujQLOwgqPw@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_215913_288215_90A5506E 
X-CRM114-Status: GOOD (  26.73  )
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

On Wed, Jul 15, 2026 at 8:10=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, 15 Jul 2026 11:29:02 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Wed, Jul 15, 2026 at 04:53:33PM +0800, Chen-Yu Tsai wrote:
> >> The power sequencing consumer API already does power on state tracking
> >> internally. Expose the state to consumers through pwrseq_power_is_on()
> >> so that they don't have to reimplement it locally.
> >
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > ...
> >
> >> +/**
> >> + * pwrseq_power_is_on() - Queries the last requested state of the pow=
er sequencer.
> >> + * @desc: Descriptor referencing the power sequencer.
> >> + *
> >> + * This returns the last requested state of the power sequencer.
> >> + *
> >> + * Returns:
> >> + * On success, 1 for on or desc is NULL (optional) and 0 for off;
> >> + * negative error number on failure.
> >
> > I would rephrase it a bit.
> >
> >  * On success, 1 for on and 0 for off; negative error number on failure=
.
> >  * If desc is NULL (means optional) return 1.
> >
> > And this rises a question: why 1? Shouldn't it be some "unknown" state?
> > (But since Bart Acked this, this doesn't prevent the patch to go, you
> >  got my tag above.)
> >
>
> No, this is good feedback. Maybe we should prefer an enum like so:
>
> enum pwrseq_state {
>         PWRSEQ_POWER_UNKNOWN,
>         PWRSEQ_POWER_ON,
>         PWRSEQ_POWER_OFF
> };

Well I think the crux of it is whether the API considers the descriptor
optional. The power on/off functions suggest that is the case.

I modeled this on reset_control_status(). I believe the rationale is that
if the reset control or pwrseq is optional, then either there is some
other mechanism to deal with the reset (GPIO) or pwrseq (GPIO + regulator),
or it's always on and operational.

In such cases and the rare case where one has to query the state, the
queries are possibly chained together and I think it makes sense to
assume the "operational" state as the fallback.

If this returns an enum, then I think the previous approach of returning
an error value for an invalid descriptor is better. One doesn't need to
learn a new set of return values.

I'm fine either way. I would just move the checks over to the consumer
side. But I think the principles guiding the overall API design is
something you need to provide:

  - Is the descriptor optional? What should the action functions
    (power on / off , or query status) return when NULL is given?
  - Is the subsystem optional? Should the stub functions besides
    pwrseq_get() return 0 instead of -ENOSYS?

Right now the API feels like the descriptor is optional but the
subsystem is not. One has to add IS_ENABLED(CONFIG_POWER_SEQUENCING)
around the consumer API to make it an optional feature.


Thanks
ChenYu

