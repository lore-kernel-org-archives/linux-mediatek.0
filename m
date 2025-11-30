Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226CCD116F6
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Nov 2025 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BweNKXTXyBjbxRpgGJRd78cP5vj9K3Mx0pI5VkyxFf8=; b=2mz8l6rQbRzdydKqYu9ybFEwwP
	YgXpsHuM53UO8vbtgH1lFg+sQB8HYJcqxWuXGKkcz9pBKVfthrLGL8f6VpPI1ua1FJN66zYFh/h7i
	IO534e3yQbDjTolOBx3YyhqNzMuuwg4+DD9UlagoEFr34nyQo3doCFmmob12et7Yt5pcI3RVopJIk
	hk7hHuDSUCqCZSU7BbEjZ3BYiN06tdsaGhgh9Ai9D7A9ajsm01qtwAoiTO662W5eHTuYxatwu9Huu
	DbVisvz8HGUA9s+Jpay+NXwtnUAp6mAPpLmgi8BD6/pg/yXczdWWgGyrO5AoTTR7FxgCwywTq43pw
	DIeJYFrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgxs-00000002JBU-2zTX;
	Sun, 30 Nov 2025 12:55:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgxq-00000002J9n-15vp
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Nov 2025 12:55:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1538E44465
	for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 12:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2E0C2BCB6
	for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 12:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764507339;
	bh=+CUU91VE9U+UPRFztWIsw6a0HFlxr+X7N2lteq6FDVE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gww/dvdD+675GJvFeEUzoJ9+9j1fimzRlqZN4XMYb6eQ22Y67C+MtVRScVEvjgMj1
	 ZpYvL+nwB2pztVPvokl4UbEkKUzonZlmU5BFppJ+9Lj4kIxmWwfdBjPYKKj54W7re6
	 pCCNXn8T8DUMXZbwGdNQTa6g0p5S1DYOA0f5Hfr506b7n58qIcvUcbv8I+2GP1lQr/
	 zN1r7Jpu0BI8REbIRc1G32Hi5dMOEcFzmasdNLVlXuv3R46/uzyCsVukiB757JeGhN
	 2uDujYZ14AcjgVrLFPsqEQlrLMsGQFouXavU4LbUHBbzAin4+3g/0GH9NV7GhWXo1f
	 wmvNB24EyWnFw==
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7c701097a75so1568159a34.3
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 04:55:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXAd6u9y6I2bJXpWC0bJtw7/QkQLPyQTF+X2EEoH3rLHuoNxKylAVDZgBN4wUHCXvx/SQrdR0bVYn0YlsAMPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvuN5zDDgM1OpE/pok0pe3mIJUwZ79/Spw3sQNQR2mbrHUZSjX
	gIZEKOeDfCWwCL47sS7VYPSufiEb6XxH1OfXpvcnfWQ8GFVpp4+Ym0LDjZn3VBvAu29xBhCbTO3
	NZ1fampx8i+Rh6AAl2YqHm3T01y8FtZU=
X-Google-Smtp-Source: AGHT+IGgWthYmyiiRHTuIz/8bWmUoFRUwbcURTcZh3qG98AznU0lJvk231Fz5Su9DD5JkuIHGit6aHtLEtrfKZseF8E=
X-Received: by 2002:a05:6830:924:b0:7c7:dff:2ac1 with SMTP id
 46e09a7af769-7c798b8a7dbmr18909653a34.3.1764507338846; Sun, 30 Nov 2025
 04:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
 <CAJZ5v0jOPrBcozzJMsB1eE12MuZRWDAV-+=jfrhJbi=S0p5J9Q@mail.gmail.com>
 <5f3ef610-4024-4ca0-a934-2649f5d25f40@gmx.de> <CAJZ5v0iJVV=kf-aJBx8F8dtGfaZpGVyhfi6DBWEg4j3c_nH8_A@mail.gmail.com>
 <e360b9b3-ada4-4cd1-8971-097484cf3f5f@gmx.de> <CAJZ5v0ij_Frdrya3=FaekbU2DFHUyBJnBq-oe9jRsB9eqXDisA@mail.gmail.com>
 <ed619280-6f25-4df6-98ca-890bdc343435@gmx.de> <CAJZ5v0hMPCRU_p_krX3nKzB=5TX7hGU38iyNmhSJSHO2j7K3eA@mail.gmail.com>
 <de14f2c4-e7b3-43a1-a9ee-9caba196b0f5@gmx.de>
In-Reply-To: <de14f2c4-e7b3-43a1-a9ee-9caba196b0f5@gmx.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sun, 30 Nov 2025 13:55:24 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h3=9V8FFehyaPiG2SreRgeyvKK+oAkR_gzKQQNDBmczQ@mail.gmail.com>
X-Gm-Features: AWmQ_bm74BLkYigBlEZwhgK9orhm-MSGQUfAzuwxqXDI_Qt7_9TxZm-rm-hXNS4
Message-ID: <CAJZ5v0h3=9V8FFehyaPiG2SreRgeyvKK+oAkR_gzKQQNDBmczQ@mail.gmail.com>
Subject: Re: [PATCH RFC RESEND 0/8] thermal: core: Allow setting the parent
 device of thermal zone/cooling devices
To: Armin Wolf <W_Armin@gmx.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Len Brown <lenb@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	ath11k@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_045542_350315_B0C4087B 
X-CRM114-Status: GOOD (  20.75  )
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

On Sat, Nov 29, 2025 at 12:36=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 28.11.25 um 12:40 schrieb Rafael J. Wysocki:
>
> > On Fri, Nov 28, 2025 at 12:50=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wr=
ote:
> >> Am 27.11.25 um 22:46 schrieb Rafael J. Wysocki:

[cut]

> >> What do you think?
> > One advantage of using parents is that it will help user space to
> > figure out connections between the abstract cooling devices and the
> > associated hardware or firmware entities.  I think that this is an
> > important one.
> >
> > It also doesn't prevent fwnode_handle from being used because the
> > fwnode_handle may just be stored in the parent.  I like this more than
> > associating fwnode_handles directly with abstract cooling devices.
> >
> > If the cooling device parent (that is, the provider of the cooling
> > mechanism used by it) does not have an fwnode_handle, then either it
> > needs to be driven directly from user space, or the driver creating a
> > thermal zone device needs to provide a specific .should_bind()
> > callback that will know what to look for.
> >
> OK. When sending the next revision of this patch series, should i also ke=
ep
> the patches for the thermal zone device or should i only keep the patches
> concerning the cooling devices?

The cooling device changes are kind of unrelated to the thermal zone
device changes, so it would be better to send them as separate series,
but you may as well send those series at the same time as far as I'm
concerned.

