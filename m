Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF587C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 19:31:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1EC020867
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 19:31:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vEjpVSpV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BvIz31fs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="qDSXDHqV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1EC020867
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A1FMbVqAjop3JjNbNpjYgEY0+4XVIdrJiRSp8CeISRs=; b=vEjpVSpVHEg/XvSa6jgTvvXO3
	RDuzB9ELAyWTsrktjrrBj7TY+uUPk7IiWNbpLpwmCcUHbXid22xYaEsXV0Yc9nmrR5jlDSBjrOW0Q
	k006SRWVQqfbPDDV7uIxnaBx6jsqICLWo6QkeCQdHW0clNoM2dLJ+He0NqC/zcHEKCdpsZvP9ARiK
	x51ijTS07rp/hPcHTJyZ3xVcfjuvcsA2RQ35WKQj5gxMBGTnbg3BaxTpEKa8UxeCaMopFaik1fx1e
	7aNy6xiY42M4mDaU4a46s2vzc+AoOtoMITEj+4jKuefKqx7Pg2Ui4UOJpIgnYzhfWwLkYq6TMqTTm
	NXsf72IZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb7SZ-0000kn-Lh; Fri, 06 Nov 2020 19:31:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb7SX-0000iq-Eq
 for linux-mediatek@merlin.infradead.org; Fri, 06 Nov 2020 19:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lDPmrGFyyFCuKqcXej1vTwCKboywcjbteDegF6u/TEM=; b=BvIz31fsjDYphIbb0YZKKR+bZ2
 7uJHEX5fS0d9OxDq+mfq6FOtZ5/eBaHufVtrID8D2K43AYp7+MxldGZoGurXDGLVZUk1x+PQPBFcy
 fk3b3aqF+96S7csG1R34XCSLx3Qa7v35m6U+u6MXNKeRp6+EXAg9R73XLGR3SELXnhMka95LYgK1t
 7l44YDpGe7vuaWGfQHg6PpqYze9fNaba64WENt/zHmiB6RYa3oJwpZZYIY2TZ9xImep87iOlsOczI
 kw9diLPXZ3GY04bykdGaW0iyZbr/7n5yXYhBpFIPEemqQcV08mBeitc5evcGdSwMsLt+OkIgE1XXK
 x5HL86Ug==;
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb7Ao-0002PB-KT
 for linux-mediatek@lists.infradead.org; Fri, 06 Nov 2020 19:13:26 +0000
Received: by mail-yb1-xb43.google.com with SMTP id s8so2040167yba.13
 for <linux-mediatek@lists.infradead.org>; Fri, 06 Nov 2020 11:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lDPmrGFyyFCuKqcXej1vTwCKboywcjbteDegF6u/TEM=;
 b=qDSXDHqVps4VOYMWow1GJ0SanYAuA1SdO6RbRbZ31Wh4pI55eM0GeW/IGBYf9468HB
 DO4nCTQMXR432ljb7SJvfNZF2qWgRKGagrJvUmOT4o82vRxaBJss0WGtrldob4GRA9Zn
 Xxs1Xl2TRU/R3J5RM9Lwu5yHGCOJDimnz2NJz7sZIhLzKW/Je9zerb3v3ratHqEhbMqG
 MQElstyGbHkQwv3qIm73AGIUyxncTZjlrIkanVoFNg5C3jThhLeE8PLaSwuoGhBC43K7
 wcaFDe3YAlBewKAQt0Nacc/VIXSdgPyfaZct8KRI3oeYn/u+CsztnWHuWfahAFWe8HNo
 usYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lDPmrGFyyFCuKqcXej1vTwCKboywcjbteDegF6u/TEM=;
 b=WP35KAZ35tniWWYXhrC7wOUOrHjV4bfceQA2E6+RL3itR9NcLvi79rnC+TZnFOL6h7
 +xzW8m8e0gngeKy5rdhoNdey0YtBQBcgqkDdgkCoQ1ASbtHbOWsZXop/ugsEVc8rBtl3
 CO2T0wNFxh1Au2x0dGcSKG51hWUjgrF4zAnojviYZZgY/VsN/VFOdOPgWwrDYQiYsLmb
 JpAmaItsa1trhbL+x2d9fE0N/BzIh01IvTiDc2cuxFDxyBOKTlU0riecMbM0K8Ugz9AU
 bq8OCxydRhmxW/2Eb2RUSlZFLIpSvrANqCnhx/4XQCBzxYcM41Chcrqu+7Icdu4CoPlI
 QqJw==
X-Gm-Message-State: AOAM530ZPAv6bkRCJDrXdWT2iwKrUwzCM4fKh+d2/++Xd6ix8SK8+UUG
 YdR4oOtixUmjTTWcLrV0NGEIwJmhNI6vGmhS/5I/vg==
X-Google-Smtp-Source: ABdhPJxdpwkjU6nef5hnn+qBzVQD4nTVfGkL+NAu+//5kga1xXgG9HgNv//s3EOvEsHYitfkxS3QOuETzCIFrw7hEjQ=
X-Received: by 2002:a25:c483:: with SMTP id u125mr4486728ybf.310.1604689999367; 
 Fri, 06 Nov 2020 11:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20201104205431.3795207-1-saravanak@google.com>
 <20201104205431.3795207-2-saravanak@google.com>
 <20201105171201.GF4856@sirena.org.uk>
 <CAGETcx9_En10j0DwktXtPDrx=Aqdr2iWEuHmYB-=SnfODTmMfg@mail.gmail.com>
 <20201106151011.GE49612@sirena.org.uk>
In-Reply-To: <20201106151011.GE49612@sirena.org.uk>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 6 Nov 2020 11:12:43 -0800
Message-ID: <CAGETcx-i--K+1go-+126bBB85BG8kksgRr3j3hnCRfkt0vqBMA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] spi: Populate fwnode in of_register_spi_device()
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_191323_142349_EF36445E 
X-CRM114-Status: GOOD (  39.16  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Cheng-Jui.Wang@mediatek.com,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Mentz <danielmentz@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 6, 2020 at 7:10 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Nov 05, 2020 at 11:26:44AM -0800, Saravana Kannan wrote:
> > On Thu, Nov 5, 2020 at 9:12 AM Mark Brown <broonie@kernel.org> wrote:
>
> > > >       of_node_get(nc);
> > > >       spi->dev.of_node = nc;
> > > > +     spi->dev.fwnode = of_fwnode_handle(nc);
>
> > > Why is this a manual step in an individual subsystem rather than
> > > something done in the driver core
>
> > It can't be done in driver core because "fwnode" is the abstraction
> > driver core uses. It shouldn't care or know if the firmware is DT,
> > ACPI or something else -- that's the whole point of fwnode.
>
> Clearly it *can* be done in the driver core, the question is do we want
> to.  The abstraction thing feels weaker at init than use after init,
> "init from X" is a common enough pattern.  If it's done by the driver
> core there would be no possibility of anything that creates devices
> getting things wrong here, and the driver core already has a bunch of
> integration with both DT and ACPI so it seems like a weird boundary to
> have.
>
> > > and wouldn't that just be a case of
> > > checking to see if there is a fwnode already set and only initializing
> > > if not anyway?
>
> > Honestly, we should be deleting device.of_node and always use
> > device.fwnode. But that's a long way away (lots of clean up). The
> > "common" place to do this is where a struct device is created from a
> > firmware (device_node, acpi_device, etc). I don't see a "common place"
> > for when a device is created out of a device_node, so I think this
> > patch is a reasonable middle ground.
>
> That is obviously a much bigger job that's going to require going
> through subsystems (and their drivers) properly to eliminate references
> to of_node, I'm not clear how doing this little bit per subsystem rather
> than in the core helps or hinders going through and doing that.  I don't
> think you'll ever have a single place where a device is constructed, and
> I'm not sure that that is even desirable, since there are per subsystem
> things that need doing.
>
> I'd be totally happy with eliminating all references to of_node from the
> subsystem but for this it seems more sensible to do it in the driver
> core and cover everything rather than running around everything that
> creates a device from DT individually and having stuff fall through the
> cracks - it's been a year since the equivalent change was made in I2C
> for example, we've had new buses merged in that time never mind SPI not
> being covered.

Since you kicked off another thread while we were still discussing it
here, I'll just move to that thread. I don't want to discuss the same
thing in two different places.

> BTW I'm also missing patch 1 and the cover letter for this series, not
> sure what's going on there?

Sorry, scripting error. There is no series.

-Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
