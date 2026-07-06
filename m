Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2FBC43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=; b=4TwUV5xZIxIKL9VEoNa3NKM/Y2
	rFbjNOZUpslrJ2LrLhI33TW4nzcegc4EQA5eQjApwuRz32VbrpBwiipId1P75uUR1/qr1rByhGNS8
	Lli6qbscNy29pwvuKDFx0NT+Q6FqYxKK6c3cKbGCNA6KOAkkXbtL6D/qpgJWqWJPm7T7gSJY5dYrf
	foCTOxvxNVzn0pVRawLLdsQP+kSSeToAlPkjrwlc11AmXi9TcsvjTqce2OrU/Ulg/q245Ba8XRyke
	+RYnqQkQDaeXp9vX5n5Wjicnd3QPSjTHTAa5i3FzrUB3UG9X8UvIZgCUVKO3zRMs/WtJR9eFQPOyh
	C+fb7UiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggGD-0000000C9T6-3x8C;
	Mon, 06 Jul 2026 10:09:12 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggGB-0000000C9R4-0U54
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 10:09:09 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-664d530fcfdso3762369d50.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 03:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783332545; cv=none;
        d=google.com; s=arc-20260327;
        b=FrruARMsCkoxFEqLi/jkEtdfzVz9EYYuDKLobZVYq9VQUfylQIoFlXVfFAY0cVHf3L
         0a6yQ4BshdnOpTz+iI1PTZYWXj2hGNUxK4kDMEHDdmerXQ9mAbyjDU1a3IJAC9HKsESY
         DBNR4ZRVjgTcX7Wk1Eh9EkXaBrLxTuqErxkT5heMqVSZ9DOphLQas1Me5eMB1J1e79vV
         mI8rQDF7MevzSXDd3rjqpOMXwby7NQv5TVIUk/Chqj0qkr3M/uuVQgJzitd/KC/YfjNG
         C8Q3vlYEi6pM6flb/r/tpR6Q7eKqFlczibFpAkbBstsUGvDwh6fsS6ZSDsyyPVW+e3j+
         Q+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=;
        fh=WduZY6S+enERL/B4QcWGsWJjkRfldGBG45r+n8VhaJ0=;
        b=maO2jciadOXhgIz+XVbLAOSgSunPbL9Ceyo+WlshnUrGVl3AFldhZEvzqBo32z6O07
         sZ7pOXQ463CTUBjJB3Anht9YvhQqVScJ+Qr940+ZinElkCIE3cuPLjztJ+6WVPGaEA0y
         YRTIeKhqDuYNLzhD7bRSoMthrLjMLzECa2+E56QNqL5X2Rofl9zb7ob9HU6KJUQrj4D+
         4q0vnp8+pgND8F1XMjWB8FRkGZHntU7SaLhQJUGgRqC0/rgyvgbS4XzLhmDF5SsjN1hL
         6OlscSjUgRWe5sV/EDdXNFrkJfeEjPKIPAwrZYiplWSEIOBdb2hCnXSryrxPI6ApHyI6
         OnIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783332545; x=1783937345; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=;
        b=Vfny7kM+Fqchh66rVwt42UQMcSbjFZppUIW/R/NdAkfGhe9IJbQDIUv5KHtFUnpg3U
         YjUBbZzmFrKUk5+20CgeiNyH1e/UQULOwt026VuFuh3ExdZCJZmQefM3z6BLnksgVB3a
         e1Stf+6Xtz1XZlTM4l3pp9at4z+9hBSqjH4cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332545; x=1783937345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=;
        b=c0hb0WQSHDib4BfWHax6mF/UdJ8qvpdPONL5t1iwwVDYlAsmOwQyEeeSYsLi0oGV0Q
         6Ucm9wMpFf9ej06LCAiIqkRsVNSjnf/O5jQKTHBLiNvhdwyQnjskhh8RhSSFc6PpS9CH
         kBmSwoacH9QpoZ5jkyAeayUdyYJ5I2XE0jBBh99VxssoZzVWPjSTmZTXZA0toY5iRA3d
         KgNVAKzSHogpCEOjQE4ZjbG4brzn7KtYkSz6LrB63hVHMxNfTTF+peXkTwLMC/kfC9HV
         u14bM6AFXLc1DmF75AJq3aH4u2Krh6mvB2hOz9GZ6Yub0NEQPfaePUK+99enWhZTixYw
         +C3w==
X-Forwarded-Encrypted: i=1; AHgh+Rom6ZnezhkcqvpLNZkJ70Oxo0yooZ6CAIFfINEyh0vAQW3a1lWKIAO0kUBih7olRhiORPmvVdUSX4ra5NOTJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAWBA9syS71gr8wrKp8RrpWJ3os7Z2YegU+CfAXQj/6jJoBTkF
	v1JL1f+RiQkG+qsl41FMprn4IcfXUNHRLpzj7emc80Wnnhdc8fXpFa0WKH2XGhrdIEQfXYfa4Oh
	5n5WaLFDtFfk4xYGQxnmEznmlzmkZ+iJ4tiPrrNPn
X-Gm-Gg: AfdE7ckum76jiHXZZS6NXiLYaj9fbRGmcwyaABizes8pPw3+PLsnlM3QJAeXvenj0IL
	k4migb9gBPM66fW+h5X9vU+Mi4oy/wHLrLYkrcDpW4s0fuLTBbRHgZzu2lBwWWLJUM5Km5GWArW
	eiBoHMqRXbUM2i7M6YPTT2fSDP5iEPd7/obqpcxAQlTtvObmzeU2YGuRJ1FmEh4AohQpP1s3zZb
	AF2BNRq4Qfu2o3jrQxgRSnzkKLaqgOaOSN2EoHZRf+bz4rvybtTpECFP535WQd6gikixwDORgde
	56DJbX9wmY9aCqHHTTTH14N+Hlw=
X-Received: by 2002:a05:690e:120c:b0:652:5567:b3ec with SMTP id
 956f58d0204a3-66652e2416cmr8660052d50.37.1783332545405; Mon, 06 Jul 2026
 03:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260703115601.1323491-1-wenst@chromium.org> <20260703115601.1323491-2-wenst@chromium.org>
 <akmZOC_J2ZTl4zLX@google.com>
In-Reply-To: <akmZOC_J2ZTl4zLX@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Jul 2026 18:08:54 +0800
X-Gm-Features: AVVi8CdednA09-ELXrMS4uc6xSUtulA0xKkThvjfCvkhmpOamhA7IkBdQY8wb_E
Message-ID: <CAGXv+5H_SXO0DtN9wjrXyAvuzG+CkYh2-4eMg=biOSsFV=E1=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] Input: elan_i2c - Wait for initialization after
 enabling regulator supply
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_030907_161825_6DBC63ED 
X-CRM114-Status: GOOD (  21.96  )
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

On Sun, Jul 5, 2026 at 7:44=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Chen-Yu,
>
> On Fri, Jul 03, 2026 at 07:55:54PM +0800, Chen-Yu Tsai wrote:
> > Elan trackpad controllers require some delay after enabling power to
> > the controller for the hardware and firmware to initialize:
> >
> >   - 2ms for hardware initialization
> >   - 100ms for firmware initialization
> >
> > Until then, the hardware will not respond to I2C transfers. This was
> > observed on the MT8173 Chromebooks after the regulator supply for the
> > trackpad was changed to "not always on".
> >
> > Add proper delays after regulator_enable() calls. To avoid impacting
> > the boot time of existing devices that have the power rails always on,
> > skip the delay if the regulator supply was already enabled. In this
> > case the regulator is either always on, was on by default at power up,
> > or was left on by some other driver, such as the I2C OF component
> > prober. Either way the controller has had ample time to initialize.
>
> Unfortunately we do not know that [it had ample time]. For this code be
> reliable we need to record the time at which given regulator was turned
> on and then execute/adjust the delay as needed. Until we have it we need
> to assume the regulator was enabled at the time of regulator_enable()
> call.
>
> I am not concerned with increased boot time too much given the driver is
> set up for asynchronous probing.

I'm a bit confused since you raised the issue for ACPI platforms that don't
go through the regulator API. Now you're saying it's not a big issue?

Either way I will add some new regulator consumer APIs to handle this.
This needs to be in the regulator core to prevent race conditions, such
as when one thread deems the delay is enough just when another disables
the regulator.


ChenYu

