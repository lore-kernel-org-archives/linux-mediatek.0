Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72D5CD98D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 08:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdEKgro4DUDPb8Ko08QQEH38Ak6tb9z6xDfigAPw7do=; b=eFQQqxAO64i2MWp80QlX4SZWcn
	GPZosVocX9HdCKZO8GjzHhnSpX6bIhh+3y7V2ndyCKTX9bjYkyrgRZwWXDvgZ3qov8i9ZdCa0/qGC
	B4z+u8gVfMHCTAMK3Uelju7wCANGaJZ03g7Qm5FhDA80p4b3OqOL4XGvypqtlYaH9CEzTBC3c9W5q
	G54EEVjaW5/iLcSyVGPo5pr9oZ5vqzgovB+N6pOELhdTLQitD2gzjDBfnhCecS1zWDao+GoJ/y6H3
	aMyySP1n21BLq+fWI+bbR+Tcqf1acprsjVakXi6JeUc741+4+XcpgLEu7fqmLW7/ZmCRXwP3X7giE
	KfKiqoBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaes-00000008zhT-2o9H;
	Thu, 11 Jun 2026 08:21:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaer-00000008zgn-33QR
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 08:21:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B990660052
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 08:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8511F00898
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781166060;
	bh=OdEKgro4DUDPb8Ko08QQEH38Ak6tb9z6xDfigAPw7do=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=hV3/Jj2u9lM0OmOzmvK5rItANUjOls0tCbllb5f0jpXETjH2ZOOn5R+/iwupRfQhL
	 BgZZMwqGimk7lHFrM5QQmJi1julXAAOYvfYTW9u5IJD89UePVlqDyjP2kk5+BpC4uX
	 ZXNDV4/4g/VT91PdZ/ue+nI0lZvIPF41icwbOupgCcm2YwVB0TioiIs9riuubScW2P
	 PQ1/sqGRsA6lyeMZI8DUFai/SWw8CK6ySNsilqToQZ9sdqxLqPXpigwQsGxs8eHaKU
	 1mdigJ/n2n/KpISns10S3s0Gll66/SrHiIfDGVo1U4yKfMLQmidj5i1yo8W84+MPHd
	 LEd9EQLmgjRoQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39697a4e16cso73099381fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 01:21:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+uwpZYbqVswdk3Hzg2mWtRzdopMpWFWM9H6e1UMxcWLN678URYJPwNrW3Ph1NaVC9/D1dA9aGVwHt2CihOpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2Ai2GAzump5TVIpAhF8HKvojl5CeGJTF4hccHQgNuK8QRIqv8
	BUAv/lGJcajk9XLH2tThnCMxDVibiQb9oPqG9oCPJUYQEpNwF+Q9MnSy+wNImQtwbKONTo+T+kJ
	fwcnTw80LAzYgCzNy40e2tJe+hbFZy4Nv0Zo4FOu89Q==
X-Received: by 2002:a2e:ad0a:0:b0:396:73ed:695d with SMTP id
 38308e7fff4ca-3991a062724mr4519671fa.11.1781166059198; Thu, 11 Jun 2026
 01:20:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 04:20:58 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 04:20:58 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ailxrP-_9_NL8qnN@ashevche-desk.local>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-6-wenst@chromium.org>
 <ailxrP-_9_NL8qnN@ashevche-desk.local>
Date: Thu, 11 Jun 2026 04:20:58 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdiwQM6yk8FXcc+RisVP2iqWKWzVsn2-Yy6dyJXt-1X=Q@mail.gmail.com>
X-Gm-Features: AVVi8Cdazg-zIlFzKBbJynoz26wIhVLSYD08zrFVf0wIQqHs_X42tMa6pqa8MG0
Message-ID: <CAMRc=MdiwQM6yk8FXcc+RisVP2iqWKWzVsn2-Yy6dyJXt-1X=Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 10 Jun 2026 16:16:12 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Wed, Jun 10, 2026 at 04:40:39PM +0800, Chen-Yu Tsai wrote:
>> When a USB hub port is connected to a connector in a firmware node
>> graph, the port itself has a node in the graph.
>>
>> Associate the port's firmware node with the USB port's device,
>> usb_port::dev. This is used in later changes for the M.2 slot power
>> sequencing provider to match against the requesting port.
>
> Okay, would this affect ACPI-based systems? if so, how?
> Can you elaborate on that, please?
>

Is it possible that there's an ACPI device node associated with the port like
on some DT systems? I don't think so and there should be no impact IMO but I
also don't know enough about ACPI.

Bart

