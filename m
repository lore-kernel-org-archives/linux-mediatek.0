Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BB5F532D0
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 05:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDH9hxeAznPRg0ItOMrUgqU6w6T+oHEnIIMvh1Q2C4c=; b=Jarg3hYuXxmz2rXv8+Fje0tRsi
	y8ckm998xDpV8qunNq36FaQ6Vdkrk1YZ8zAXNuON7b0cl+VQMk8VxgxcIFC6CbAPzBNGttz/dgZ3/
	7pu+vDXvTVXnpU/y6b9hCxvqevc0XyY2AqzAQhVjB0MQsyWOnfpqc4lPtUGHikamHZjds376OunO7
	WISMJwGL1LHKzA3NNe5rq/fBWhg+AyTkwYaTkKtkqOZp0ScF622PrFEZNtVsUeMoT2hb+XnFQR0Ph
	WbX8A3hiIRVCbTPds7BhW3qlcFrZu9OGAbtSv5S1HH7f9tjMmZV9hi76gHjeUQVYic5NjWKWU4zns
	Ec4WwN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ttr-00000000Z0z-44H2;
	Tue, 24 Mar 2026 05:01:55 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ttp-00000000Z0d-1HwP
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 05:01:54 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a10d130b37so3918048e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 22:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774328511; cv=none;
        d=google.com; s=arc-20240605;
        b=e16MDHW3I807T3WtH7sdoSEKZNoQO1OcaNwDTNQNO8kOKdlJR1bV/j4Zp89UcyEChZ
         zVT4/01mNlfIMWG7++r9rK+2U2Tv//krRAr2cBjxFhGfNP/fFxKNqKSIyHf3glG316dO
         fcwJ62s84JukB7mtNfB6KIUkRw6IdT/cm9wodqkx27IPND6PJwfnzTySL2nam7SOhOMl
         Z6YMv6NR2onMJsWtnQ9FGz07JvIHul5Jy7kNOeju6D3mZALF8Mw27DAfKkafhW4nZE0Q
         CHtSV6RtVxgo6OtU3A5gFdXmX4M1UMLtWxwiB5I/h7N4OrZoP5vofQ5RpJYUAB63EJWN
         GO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IDH9hxeAznPRg0ItOMrUgqU6w6T+oHEnIIMvh1Q2C4c=;
        fh=TcWYnFvv9I4mQ7MaWhyeaKXdShDo3MJMGZbblNM029o=;
        b=dK3RowuFZpMWTdF8DGGN3bnCLIcW5/pkqRFGqD2ifIA+ytZMbSTCfeK3hc2YnSn5Hs
         XrTP2cvyDQ8vAdIk/IqiN1onZZSU76fnAMWBLzVPfWdgkE5mxpyASHWO3uvB8/s6Hb1q
         tqc+6m7Ecw+V04S9ISmNoXIPAdCmXmu6T+NZvU9yyVVT3JazAGE/C440M9Lk9KZ/knIc
         77e7RIcYVCnWXo/FOh8EoxSDgUC0DQO5mwMnscedKA2LKMmUF46blVubVGmnJmAgSFT9
         QuJWOlhhCqT+qPU2QfFwpiyTKnkHJmhfQHzJhppVahKrZJhCrv8WjY0WwiX9VomDUd92
         EDnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774328511; x=1774933311; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDH9hxeAznPRg0ItOMrUgqU6w6T+oHEnIIMvh1Q2C4c=;
        b=FkbHKSXnpPwyx71YJWqpizWSFlx/l+g1ek9x6+uoxDtsjsn2aNViPNM/lef3YfKfDI
         dadkJHMQU25JA160A11oa1lyVr3v8nQv0rhdUs8gE/R7a2yRRIdKppXyU4C42PVuwj0f
         gbXv7oW1aTxrvTVXt4JCEMzvRtOmbpdydCbjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774328511; x=1774933311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IDH9hxeAznPRg0ItOMrUgqU6w6T+oHEnIIMvh1Q2C4c=;
        b=FsFGs7ZYTru9tCJnNkKu1Hsi7J7vnMtvE0pgcPFHEMEVKRpgc1JBL4Sa1k0zQZRag5
         5jo4g8YC+jEwtGDJ7Pypn1fDB1v1I+AGMmJUVzMj9yJx7UBQ1fsspr2tlAbGfOET5DgY
         lLxdGFWTn+lUZ4BUYli0ezi43cxyEzLokLmSYd/GIYw8GbqbGygPOexv2DlHCxqL+Upo
         HCFsrwuubHhHczMts9I8vKKXPyvhIkFo19IOCuy8TTZFpZcsfm6cvafCX+tOpaBd11mP
         VuxxDxyy/7YfVnDKM5wyobWqACjD3nzv2kSL7u/ywvLlsx5u5TDX7Z7xkLtwkc9jlJlW
         eoSw==
X-Forwarded-Encrypted: i=1; AJvYcCX+KzoUBM6s4xSBUyApAzOYBhRxHPXq6duFUAkGLnTbp6rSn0IiIuQvj8wHljrKDv52BJRH3i/CSYlbKjQ+kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpqsR26DgNHe6NwYSGWgSu8uptJPbv3KjVI9HZv7/aN5agUnk4
	69IBDHcbD6IKPaZRe34J7OE4dtqQMArwiqmQLe0sOLuqzMuzqC1AkbPZwQ+8ciDGVt4VBGmibto
	ZxMIkDsNp84GfTUhg41gAtMgUagPHC/dHW9IPwd3Q
X-Gm-Gg: ATEYQzwkUHjWutqhJKCqyfqz0Ji1T+dkbSthAb2dXWFoTUqZvxkrpWUmXmgkEceE0GH
	JqahBmuxv69owTZH6Fu9RpfK77aP+78XgT6dZJc2d4FdoKVVq6AJ4P4+AI+fGUhjyZMx2c0clQj
	7JfC8Mj1gM0Tj50pAE5OZzrJH4bDXm2m8bW0WAV5GAFxFL3Gw5B4YFyTfd91gMlgFlBHw4G2D3r
	xH2wyz0gI4p9thgB6eUMJxCWW/AF91mOzGrXej7R9lYYNoM+9jvPO7FdHybeIQWXu/NfbZEOqJn
	xOZstZpGNXa/MYulUDCkNEGDzL1hr6Sbush3ww==
X-Received: by 2002:a05:6512:3501:b0:5a0:ecb2:c0c2 with SMTP id
 2adb3069b0e04-5a2961f5c4bmr671100e87.4.1774328510840; Mon, 23 Mar 2026
 22:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5HQY9nTCacUbNZL1XggiHqomhgiQH_gdFtXLra+_ut4fQ@mail.gmail.com>
 <20260323190829.GA887140@bhelgaas>
In-Reply-To: <20260323190829.GA887140@bhelgaas>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Mar 2026 13:01:39 +0800
X-Gm-Features: AQROBzAZ6nu5jMyCQgGtQyyo85d_doglkl0nVE2DGZIM-UwStvtJT2NFKNs1DsE
Message-ID: <CAGXv+5FYC-7BBC0gPJvbtM6hnmYt8ywhLigKLDEu2WYNRS6XeQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] PCI: mediatek-gen3: Integrate new pwrctrl API
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_220153_521942_B9103E85 
X-CRM114-Status: GOOD (  40.46  )
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

On Tue, Mar 24, 2026 at 3:08=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, Mar 20, 2026 at 02:10:03PM +0800, Chen-Yu Tsai wrote:
> > On Tue, Mar 10, 2026 at 12:49=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.o=
rg> wrote:
> > > On Tue, Mar 10, 2026 at 5:50=E2=80=AFAM Bjorn Helgaas <helgaas@kernel=
.org> wrote:
> > > > On Mon, Mar 09, 2026 at 01:24:34PM +0800, Chen-Yu Tsai wrote:
> > > > > On Sat, Mar 7, 2026 at 4:59=E2=80=AFAM Bjorn Helgaas <helgaas@ker=
nel.org> wrote:
> > > > > > On Mon, Mar 02, 2026 at 01:31:05PM +0800, Chen-Yu Tsai wrote:
> > > > > > > With the new PCI pwrctrl API and PCI slot binding and power d=
rivers, we
> > > > > > > now have a way to describe and power up WiFi/BT adapters conn=
ected
> > > > > > > through a PCIe or M.2 slot, or exploded onto the mainboard it=
self.
> > > > > ...
> > > >
> > > > > > So now we have:
> > > > > >
> > > > > >   mtk_pcie_probe
> > > > > >     mtk_pcie_setup
> > > > > >       mtk_pcie_startup_port
> > > > > >         mtk_pcie_device_power_up      <-- power up
> > > > > >         mtk_pcie_device_power_down    # error path
> > > > > >       mtk_pcie_setup_irq              # set up controller IRQ
> > > > > >       mtk_pcie_device_power_down      # if mtk_pcie_setup_irq()=
 failed
> > > > > >     pci_host_probe                    # enumerate downstream de=
vices
> > > > > >     mtk_pcie_device_power_down        # if pci_host_probe() fai=
led
> > > > > >
> > > > > > I think this is kind of a mess because mtk_pcie_device_power_do=
wn() is
> > > > > > called from so many places, and some of them aren't connected t=
o the
> > > > > > mtk_pcie_device_power_up().
> > > > > >
> > > > > > In mtk_pcie_setup(), mtk_pcie_setup_irq() only deals with the
> > > > > > *controller* IRQ and has nothing to do with the downstream devi=
ces.  I
> > > > > > think mtk_pcie_setup_irq() should be done before
> > > > > > mtk_pcie_startup_port() so we can abort before even powering up=
 those
> > > > > > devices.
> > > > >
> > > > > Makes sense to me. I think it can even be moved outside of mtk_pc=
ie_setup()?
> > > > > That way we don't have mtk_pcie_irq_teardown() in two error paths=
?
> > > > >
> > > > > I can send a follow up patch for that.
> > > >
> > > > What if we do those cleanups first?  That would make this patch qui=
te
> > > > a bit simpler and we wouldn't have to undo things.  It would be a
> > > > shame to have a complicated patch to add this stuff, then another
> > > > complicated patch to clean it up.
> > >
> > > Sure.
> > >
> > > > > > In mtk_pcie_startup_port(), mtk_pcie_enable_msi() and the PCIe
> > > > > > translation window setup also don't have anything to do with th=
e
> > > > > > downstream devices, so I think they should be done before
> > > > > > calling mtk_pcie_device_power_up().  The only thing there that =
needs
> > > > > > the downstream devices powered up is waiting for the link to co=
me up.
> > > > >
> > > > > My guess is that if the link up fails, then mtk_pcie_startup_port=
() is
> > > > > going to error out anyway, so it maybe made sense to make sure a =
device
> > > > > is actually present before doing any more work.
> > > >
> > > > Doesn't sound very convincing to me.  mtk_pcie_set_trans_table() an=
d
> > > > the window setup are local things with no timeouts or anything.  I
> > > > think the logical structure is way more important than some kind of
> > > > hand-crafted work avoidance.
> > >
> > > I understand. I merely meant that I have no actual knowledge of why i=
t
> > > happened, or if there are any concerns from the hardware side.
> > >
> > > > Separating the PCIe controller setup from things related to the lin=
k
> > > > and downstream devices is pretty high on my list.
> > >
> > > Makes sense to me.
> > >
> > > I'll send an updated version.
> >
> > I'm confused. I see this version in -next with the minor fixups from
> > Bjorn. Do you want me to do the cleanups on top of them?
>
> I had intended to defer merging pci/controller/mediatek-gen3 to
> pci/next and wait for your updated version.  But I see that I forgot
> about that and included the original version.  I rebuilt pci/next
> without pci/controller/mediatek-gen3.

I'll send v6 with the slot driver symbol name fixed.


ChenYu

