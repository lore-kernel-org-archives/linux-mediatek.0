Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C7CC43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 06:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=; b=rG08Tzo5rXvZ5iMVIk1abdNqhj
	fRSuyF44GBdeR07+oLUlMmoZ9RlYlMyckuy0CWy/e6WYYYAcTLODIJhIhZs6V5u8zJcxBOzlFApSO
	WXfGMchaoj+1RlUhgaiY6hZsBvxteuGjiJLJmhtqw1AoCOFDUerUMTLmHMVv3qwailcM/Jsd+W859
	AsCJs1098JVYBzCYqBOcgQKw8infrdOyCRHrqi8BGumJFFYlPT7nbzC/C+4AcSsRuSLiaf1cG4oxT
	/wVwfjiRpMCIETZLXXLezgQ9Pe/nwUO0G2QQEiHkka+Ob4tmq0usLH1x95sQsFn3yctJz0q+sZoou
	ZOzA51/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5lh-0000000DnOV-3Vhi;
	Mon, 29 Jun 2026 06:46:57 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5lf-0000000DnNq-2M4Y
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 06:46:56 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-6611669cd16so2950385d50.0
        for <linux-mediatek@lists.infradead.org>; Sun, 28 Jun 2026 23:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782715614; cv=none;
        d=google.com; s=arc-20260327;
        b=pzR8V5qPrxgw2bp8vTVH5YRjDz1eVwar6aoeQjtbTN+JHz9OQTLknm1C21UdaMlzoz
         0McHyTdh5elR+klBMCeEk1lDOCdxacIg7oKUafY7222BH7NDEfr3FJ6J78kru0fWKRs9
         VNfJxAlgz7y1ANpr6CsSAJcjMhDj7BLZXNEYOXXG20niH5RqK37C7RFbyK8JkbkMWUr3
         9rj+I2STdXiIlNlYqIVVulN7iMe25X2HZD1vQRRaRxQmtab1jLs+tvkOEh55LSRqo7G4
         td82wSaigjNjwYLKMSprpYWyQPlMxsHsk+ZTFgzUYliJVxTkgsz/bg8cFMzX03tCxglD
         Gg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=;
        fh=UXkwTikLrT14IuQFJ88V1i0hjZR6Zo5XTqwOeYD/6QQ=;
        b=e8/JMdInVBX+9+pBlVSN+f1bPtSo6vKz8v3OhQZpauZ+37WlwJJ1QlYSr4FKe6pi6D
         zM/zZirNMPkcIdsyszf0mrstqWWkR4H6BSDwdEDTg/qVUA9kIbN2zLY0o638iJOpZcTu
         s+I6spNoQdCC7V958GyqDe31RLyLfCPt7o1tbJqtx9Jq8YFrB4Hzbc2Smf7m5gA7+KQh
         i9DZGAebzhHvxynShS2xCUY32fHaHWcCJMz7iRKwNGktvIVt3df++LnkNfddjcn3DmlK
         jkC4I5MB+Vqx6SNRj4c7OFmw3VTKJrXhj/Bkp5u4F6aFSSHshyZD0y8uagZx6Gn0Mx3v
         SfyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782715614; x=1783320414; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=;
        b=NCCINsrev5W0J+6R3Bn3ngLA3TEO779M4h3M5+I9XaQM+7WJI3aCKWeTeQKPvCNpMw
         oslOfjizmowAiLzgj8jyVklrv9YC3EdaWrVtL1C5zQWQAU9E/yUWfHSzMIjGWiACAr+s
         A7MGzlXhcRDdv2f0P3pUUu7uGaODj/xxtwWH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715614; x=1783320414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=;
        b=g6sl7Fxw9+BeEGs6yDak7qHz5ZaKarwnOMm8lPSFPonP+IRSSl3t3KA19KpwtsxtYN
         SuSy5+0R8Ual+OId9iXV9jxHH2s8iaZ3Ep+C7BHnwevoxYGbuAaPdMW3eda7ftMm9kBZ
         loFPmXlVMMFf/iLa+HdelxWJq+TScbs00UeQKTr0Zf9G/pEIJkJMUN0D2TCENmTbzwWf
         v4Byq9LvagcjfSKWVcNdo8w4Z5SAEXtMueAmxpEiuSve3D4yPN5MFNb37QBVdkWmHAl9
         McD5BA2R+lLauBPtJCcPRJkBIOu6fyXuft5/UF87c7CsbsG503E3hFsG3ptDbHXFrSRL
         GdUg==
X-Forwarded-Encrypted: i=1; AHgh+RoBhxE4F0F0tIWDMJ5eMXft6B1NyeUKhJ55jMrSDh8xifQkxyDAlFxq5iiEWM1mgaGEhbihEA3+d3cZniP8dA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9PgMrFC8RRuxKAGNYToSe0hbb8E8fMo/Qy7eIgKQ/BTLe2nAN
	CYfA1HoBYPkG2GnG//yeQpliwIK9qr1ulq6bdS8Q4azJ5oaPVrdVhnhhN0LhemTwKKmYkNXR604
	ieGZYsMT6aI3uphCjCIsuOIwjJcBVlFprzcn/bsMs
X-Gm-Gg: AfdE7ckIPAEmix1Vnkr72bQqvO2CRZP/MAbKi3hkOHaim+gLxYwzIUnRUlVMcTSN5Bc
	Ff+cfyfSKhI1w6EvMJ7pQlNptbW115WPb0Hh0iq2Xav8BvZFUO4BE85ji6eMD2Pel/6plKkfVYz
	qPAjFxXDPZqlGfj4kTDYM8JRSOlXQItqg51hYVzHcRwr+hgsqSM13N4QD2QIwniZfqyYDLXftr9
	4tHlILHac/zzacTJt5mV9TnZoqQk4Ci5g57b9WIzG6BlsKT8oy+pFWZEZymBkKC+C671HcBgOVF
	prxe+U487VFC52HZ14UcI1ziYVw=
X-Received: by 2002:a53:d24b:0:b0:664:ae6a:f07 with SMTP id
 956f58d0204a3-664ae6a108dmr6236222d50.81.1782715613698; Sun, 28 Jun 2026
 23:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-8-wenst@chromium.org>
 <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com> <CAGXv+5HQa9BH5wyVwKNxjXLEZDnE0sbeQjgNxwmAG+OF8bbz=w@mail.gmail.com>
In-Reply-To: <CAGXv+5HQa9BH5wyVwKNxjXLEZDnE0sbeQjgNxwmAG+OF8bbz=w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 29 Jun 2026 14:46:42 +0800
X-Gm-Features: AVVi8Cf2Jr6SG6fphp7pdwOmuJjdBOlHCbVmzmc43-YAOHTJXjsvshlXzGC6cxU
Message-ID: <CAGXv+5Gbf8+=hMZcK0pYraC1t4qmDx_WVPkr2RhWdm3bq_LZEQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] usb: hub: Power on connected M.2 E-key connectors
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_234655_651809_1616B415 
X-CRM114-Status: GOOD (  36.62  )
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

On Fri, Jun 12, 2026 at 4:55=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Thu, Jun 11, 2026 at 6:11=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
> >
> > On Wed, 10 Jun 2026 10:40:41 +0200, Chen-Yu Tsai <wenst@chromium.org> s=
aid:
> > > The new M.2 E-key connector can have a USB connection. For the USB de=
vice
> > > on this connector to work, its power must be enabled and the W_DISABL=
E2#
> > > signal deasserted. The connector driver handles this and provides a
> > > toggle over the power sequencing API.
> > >
> > > This feature currently only supports a directly connected (no mux in
> > > between) M.2 E-key connector. Existing USB connector types are not
> > > covered. The USB A connector was recently added to the onboard device=
s
> > > driver. USB B connectors have historically been managed by the USB
> > > gadget or dual-role device controller drivers. USB C connectors are
> > > handled by TCPM drivers.
> > >
> > > The power sequencing API does not know whether a power sequence provi=
der
> > > is not needed or not available yet, so we only request it for connect=
ors
> > > that we know need it, which at this time is just the E-key connector.
> > >
> > > On the USB side, the port firmware node (if present) is tied to the
> > > usb_port device. This device is used to acquire the power sequencing
> > > descriptor. This allows the provider to tell the different ports on o=
ne
> > > hub apart.
> > >
> > > This feature is not implemented in the onboard USB devices driver. Th=
e
> > > power sequencing API expects the consumer device to make the request,
> > > but there is no device node to instantiate a platform device to tie
> > > the driver to. The connector is not a child node of the USB host or
> > > hub, and the graph connection is from a USB port to the connector.
> > > And the connector itself already has a driver.
> > >
> > > Power sequencing is not directly enabled in the connector driver as
> > > that would completely decouple the timing of it from the USB subsyste=
m.
> > > It would not be possible for the USB subsystem to toggle the power
> > > for a power cycle or to disable the port.
> > >
> > > This change depends on another change to make the power sequencing
> > > framework bool instead of tristate. The USB core and hub driver are
> > > bool, so if the power sequencing framework is built as a module, the
> > > kernel will fail to link.
> > >
> >
> > That bit needs to go away I suppose?
>
> Yeah, instead we need
>
>     config USB
>         depends on POWER_SEQUENCING && !POWER_SEQUENCING

FTR:

Somehow I remembered this incorrectly. It should be the following instead:

    depends on POWER_SEQUENCING || !POWER_SEQUENCING

and the dependency issue mentioned below then goes away.

ChenYu

> But I ran into a dozen or so drivers that have "select USB", mostly
> input devices:
>
>     config TOUCHSCREEN_USB_COMPOSITE
>         tristate "USB Touchscreen Driver"
>         depends on USB_ARCH_HAS_HCD
>         select USB
>
> Kconfig complains about unmet dependencies.
>
> > I see Andy has some suggestions but in general I like this approach muc=
h better
> > than adding the pwrseq_get_index() function. Thanks!
>
> Thanks!
>
> ChenYu

