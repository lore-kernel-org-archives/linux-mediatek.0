Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DC3C44533
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=; b=UccSY3zXbB92dTfpgMKgzD/JUT
	CHGK851E3gLBunG6gvAr2jNCUBp7h8LqbHC0gGsymlr2BqbRi6phcfC68RR7JmuVjWMiWdJpF9gYm
	fkL7GuTM5m6t1Cl0AYe8vUU15wLHvkIoI8uhAi9LPEXzR8voL8aM89CxC0O8zR7znAUFlufhfde5P
	SofAe/VRdPJw8T+gb5mLPtUMVyvFq/oOKJvGpokV79jyZ993nLAEzQBICA/fEv6OwlwTr3leavD+e
	mO8EHjXhMs+E5FwaMhCvmfriE06Ly4zDnXN9CTqURXsWy561fJJy2ayoOdgczmuzhodBaItoshlHc
	xcFIatJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSPO-0000000BGjs-1upP;
	Wed, 22 Jul 2026 08:34:30 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSPM-0000000BGiF-0Oqt
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 08:34:29 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-81f3b227a4aso2354317b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2026 01:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784709267; cv=none;
        d=google.com; s=arc-20260327;
        b=PBNpxvbkAnaR5d0mZQ9TGrJigvmuvLVet0Ltu0DfNX5gt0glyzdyAQb0iyl6Vfnary
         JKdpLz7+s80u8n/SkktSzHq7E0biLztda1VOplaIvNReizbtJMcgrQw/r9WcPL7m4IIk
         eWDubDogT8U08yTBXIQfSdt1slHh9nl3IzT972V6WhFmatVhxfQooZHBIqlDux4+U/W1
         MbxsQZ222lMkSYkioOedBmL4Hl0lUo91rG+7xGXIqsG64+xGwrqo2/lnQ4rjbTAfiysM
         huisotOcXaCw23DSr5HreQKc/uCFijUjzgmiys97MQJhV/C2vQf1QK8McPcMakChPUF6
         BbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=;
        fh=c+7tDcjeYEcJXAIdolkj/9+LIS+3YQWi0Qzu6XfGU60=;
        b=XSlcTnylVRWe/PFFIJSc7WpzvxOKtac8RZ6i8yTo5P9mQR43avMfBgpzoFeVkq4PMR
         CFFSWBhggFwoZUO5svJvgfvsRQrL7w01B7Bxotht13wkkDPzwApujEwgzNJNUWqudIX9
         c/ceHAmZp44LoIeuk6pvlFiBRB2pDKPe4lmYAnDseUQ0pTPc2qWgqJRmUjyWQCTqH12d
         /PnfIalp9MtX6R1BZx57E+zFR0PuD0zht/g57zLrEL978ppUt7T7FmmwotUmDxWkzH5j
         Fl0zUPE+oU3U4KrfvT+A2EWgUr5f4MQzDLM5X8RqYZseRphVdOEiTxo/LrtsjPQ7Pw11
         mq3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784709267; x=1785314067; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=;
        b=Ln4XIcr+YTJjIoG9XQKSJnhhBR0mzrDhDyaCJAJqWubqZHEoN/numh3VjB2dsAtOSe
         CC2ch5F++K1mMrB49qJty5FY7K5xdZdewDNu0/Y74yhf1x4fpMl+Q+iRQx/zujw3nbWX
         2VOHMyegnTgDeTIawnVfXE0MPKEkcTGUiTUOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709267; x=1785314067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=;
        b=UQTe+6rCt7GtV/4+qnU5KY8I1omzeLr55mSwNWF3faCL+KHlAxguVK9sDODnxd9qj3
         DpxYHMHAIS+288HXjb0cb3Xiw4rXsqJlDvDPb8W72/eN2j7Dm/9uJmuywZgbxZ8+zbQO
         IxW7AOZpPXGsrbDquVCeyHobOV7764E8Qd4Em/ejIJdFq4DX+F94YJpjrZSEaBVPK0P/
         s8FXXhx+yUiXI5AbQZrXF0tdNBfRG0bY1E8kinFYm0wKoUVdHKPRLSHuvZl86qVNEeOV
         dM8yxkZ7o+mvR9AV1TSsR3FYPBXRrbV4ZRvQ8utkH+r8GmW2VcEN7sMbSQeR5G++NBIZ
         JGjw==
X-Forwarded-Encrypted: i=1; AHgh+RqiN3HmWxSuGomfvjbMLju5Y4jmpiT+aCc5rR9LOl3QwQ8wxCrbcQ8lyZsotoA3BdT9fT2/eyaCtDyBleEPCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPWNKLZKLE/IVFRka4wHYYvpaGzyGc09qepxI+5nwmtx/FKfpe
	Ro71gG4KDJscF9DNsBvdsmEBCd9WqLwOsdI2zhncroOHTioSZUoCq9opDOlNcKCe6zIpdUxClOg
	DNiin+JoinuSrHFB3EoS4/yoIZjoLLS9XFZqT0cVC
X-Gm-Gg: AR+sD11VkCFQ+IXE+mBZn52ZbrJDppY7nkWQYSER39tazYL8vk6z61h+VzZE+gMZRgK
	zjwuPjORw1U97YpKEl9/WX9XQ0acTUi29kI5QRSjnjEHRwf0cARGtzCOx4WaPT05uSaDABDsj+w
	eRyL0F2WQXaXdhvY43bwP1iwS+QocrqOcLpEk42T2X/cY0ZY7QPxCeYeWmr+oukJqzAhaq1Vv6E
	p81jrMBPvE2mIvwbG9+RjYJ9j8lQkWQbipANJXHx1cSBPDvh0Ga5OKYqpNWpEUAQdQNBBSafo9K
	uWnvx52CcZwIIdah
X-Received: by 2002:a05:690c:c453:b0:81e:bf0e:55da with SMTP id
 00721157ae682-81ef260c885mr66446937b3.48.1784709266701; Wed, 22 Jul 2026
 01:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-7-wenst@chromium.org>
 <al9IwVR7Whw2DiXU@ashevche-desk.local>
In-Reply-To: <al9IwVR7Whw2DiXU@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 16:34:15 +0800
X-Gm-Features: AUfX_myMObbdQM6Uou8RDo9wMrLkt0Z3Ce7LljI10q7k1rjjaXzvygc1Ey8OWtE
Message-ID: <CAGXv+5EkcASZ__Cyp4PnwemPd2xAe+WL-ics9jqHLuxWjWyT7w@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] i2c: of-prober: Defer regulator_disable() on
 successful probe in simple helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_013428_176113_129E6413 
X-CRM114-Status: GOOD (  29.62  )
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

On Tue, Jul 21, 2026 at 6:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 03:52:20PM +0800, Chen-Yu Tsai wrote:
> > When a I2C component is found, it's device node is immediately enabled.
> > This triggers device creation and driver binding. The prober will hold
> > the regulator enable reference across this part. If the driver probes
> > synchronously, then it happens within this window. On the other hand,
> > if the driver probes asynchronously, there is high chance that it
> > happens after the prober's cleanup function was called, in which case
> > the regulator would have been disabled when the driver's probe function
> > is called. This would then require the driver to wait 100 ms for the
> > hardware to reinitialize, even if the probe function was just a split
> > second late and the regulator was disabled a few milliseconds ago.
> >
> > Recently, some of the drivers for the component that are targeted by th=
e
> > I2C OF component prober gained the ability to skip waiting for hardware
> > initialization if the regulator was left enabled. This happens when the
> > PMIC has them on by default, or if the component prober left them on
> > after probing the component.
> >
> > Wait a bit of time before dropping the enable refcount on our end so
> > that the actual driver has the opportunity to catch and increase the
> > refcount on their end. The 100 ms delay was arbitrarily chosen.
>
> ...
>
> > +     /*
> > +      * Wait a bit of time for async drivers to probe and increase the
> > +      * regulator enable count. This allows the drivers to check and
> > +      * skip waiting for re-initialization.
> > +      */
> > +     if (defer_disable) {
> > +             dev_dbg(dev, "Deferring regulator disable\n");
> > +             msleep(100);
>
> How was this value chosen?

I just chose an arbitrary round value.

If both the prober and the driver for the probed device (trackpad in
this example) are builtin, the time between enabling the node and the
driver asynchronously probing is between 5 ms and 30 ms, but could
also see outliers exceeding 100 ms.

If you're worried the value won't suit every user, I could make it a
parameter of the simple helpers? And the user itself could be made to
probe asynchronously to not block the main code path.


ChenYu

