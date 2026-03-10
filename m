Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2433FCC9BC
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 04:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEKfTgbEhZq5Nx64xwP1FBHJw6oBbygo97C/fty+4xg=; b=FVDwsWsoETS6xBqYgtnZ17T7lt
	1pSN5dYOfP2EKIevPPxlwRxpZmfFq0ysLVxbGcihG+2h65tCC6yshJKc5q1FqBWMH0lABQtC+dl7W
	ovCPVlPlSgiLKrMXHTBxeGW3ncGoXBDXieYK9l9g5OUHnj1DB3ReL/eBjXJtBOT/7I9vqhlUNl29i
	bgIB9PgKG1x91jD/RwKlodCc4t/ntwICFda67VEz32lknLC9eBi1luDsauWjzDvgkDbm5CKHkL2Sp
	tFkVGhT2/laZSwFXUmckXqEYUlLsljlmvp92IJFPrZ8XHZcHABqt52hl8ZvEjJ+bKbhV7RRKOSAfn
	oYmObmjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzp2h-00000008iJ5-1PV1;
	Tue, 10 Mar 2026 04:50:03 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzp2d-00000008iIM-2LgP
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 04:50:01 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5a140efd2d5so3825941e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 21:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773118197; cv=none;
        d=google.com; s=arc-20240605;
        b=J7fft0gHVXvCCIAxgci+kdpQgb0qB1mRt7VHVAreBbRTTmk0/gby0FzqmmHtwr9jhv
         lw/O45KlGeIkfd7xf2xjtWQp+eSzy0TG66GLOAXOzIxFVADdCa4jx4l7yHT/UWOlCheQ
         6jL48FJ+T5w7OwSqCojpJ3aL2hai476mgbj0NgAekH3UV8la49eBNl50cIYu1OR42IvH
         bk/9rDuW15vy+nRIUU3rkMLQWpn6jdsjXygIKj2jySg1eDyX7jKWY6fLRxwHLeOVT2Wh
         9x92eGhpxlwuKZAoroWEjatcb3uDO5NCrgaRIGhfT/4MxQzpyW4Kawj1hQsF/9uc0XyD
         oiWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TEKfTgbEhZq5Nx64xwP1FBHJw6oBbygo97C/fty+4xg=;
        fh=Gg2muWPVn7BIam4kWE1vbJH1z/LoVO01EE3QfzWWGOk=;
        b=SYBdqDcIRTTnwQKyXxaqOpx1fC1oAoWmYBeA7yix4mfJFqoWNLbKnmrMGHjV8KVkwK
         vGonWPMqDD/7kvz6iD9N84ul4UluBDpioKz84jHEuGD3jeS6uFwp95libtMlw10BOjSS
         iuw2yFYtsJV9JO3Qdcy0xJlBzdx7cKbKQ7za69Y1OBXuacABRHCmqwMxjyK5Xi6D4C/H
         BsjmdAA2OFL9MFnL1FoTOsXtgmy16RrW8M8M/OlkjyA8NPj3yBlWmuTg0iSMUGx1qisf
         CnoXgKCx1+P00iDE9OS18Y7rtK5h88jquZbgzwA94uqeqSwXlPaRRO1QQFAfKbS5/lMb
         bIGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773118197; x=1773722997; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEKfTgbEhZq5Nx64xwP1FBHJw6oBbygo97C/fty+4xg=;
        b=W2G8NeLaBVZbgMuKizS8nFmRDHcJz8nejx0s3lQra7pt5fI2v699wh0HoB3UaaqGvk
         TVg41PSoKt9bjf5kAbOFVzSAnRdSdO7/BjB8ujYw9mdMw7G1gws2CvYPv6SScNhMHWDN
         OEN5QNBCy4lF1IhMvwTJ1qLC/PXf57FzzODm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773118197; x=1773722997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TEKfTgbEhZq5Nx64xwP1FBHJw6oBbygo97C/fty+4xg=;
        b=gDqnJQ4owyFuzOovvxhx80+mxPm7WNw2S+wqLWstbK9xl+BJJB//uon7A3F6oL1EFd
         BfvFMOqvV32c76IkefPdq8WzotLej/5dYvevA4LWMxNhMbY7wp0na+on46tiAX1iT+zJ
         oadtNMbcZBtoXbQPsyEy4lkxdVksuVzSu2w8yekw0Gr9StXsJujX/AhdXRoBBbpAjD//
         EIOEb3ZAYd3BXabLeayy832exKnLb9FewOFbJXRGearphySFZyEsv+EcwfwzI8EyqrwB
         xNuMRwKz5yDe4iL6+ZqGOC2tkBEv7usV41LcnVajFm5Ev3nNrq+vQdQzvzf0O5RWdvJE
         Ki2w==
X-Forwarded-Encrypted: i=1; AJvYcCWdh3XIMsj4nkfKqyxQK+/CUgixX88cLQz3/3/c54YU7+EnCQOCbG5hWQRtvM+8kQiBTjFFf+1ynNAt24/BYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YybpTNgf3W2helurYmVOXB3elgnwL7eXUNYUVFofnsS8XPAZgoo
	rhQzllG2eitYbhxdNzHsztG72dHe011DAvd0s30oJgqEKPvnoXXvojNJUxsR+nhti0eJ4PXa0ZT
	Q64aktWu1hn7UhF5yWGSXSREgT605/5ROkliGKIsY
X-Gm-Gg: ATEYQzweA/3iDIRFRgN3tPf0cTLhJ54KETpB1u4tBs/Zg84F6FiQLBh/uxqCfQYcZHG
	MjYd9vLQZuqbqNU/+2N5P5G9yrSqo/+HH7KRV6P61+llclzAqtf3/0iYgyAW7uD6eJJImDlHlDP
	py3y2CRh8nrOFLt6qHz++31usO/KKssRsHTuwzDkDwKOZIRZzsqKZdnMdPOCC+tKm33ajW8Eyt2
	/rLWQkC12kszaFXXhkw0cpxK123qJd6/eF9RzfyrDzyM5pm2l6eQ9G0BtlukCYJD1dpCx3QKmK6
	O8Txf0lg4hOS5Nww7ncW3aQiX+uhw/Bu2JBqEfvYx7/2n/Dg
X-Received: by 2002:a05:6512:682:b0:5a1:30b2:f2c with SMTP id
 2adb3069b0e04-5a13cd5e33bmr4296147e87.42.1773118197277; Mon, 09 Mar 2026
 21:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5FhSO=+AUaeDSXgM9Je9uTVYq-EW43z9PAuvVKumK6oMg@mail.gmail.com>
 <20260309215056.GA603013@bhelgaas>
In-Reply-To: <20260309215056.GA603013@bhelgaas>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 10 Mar 2026 12:49:45 +0800
X-Gm-Features: AaiRm52BnH_hbfy2T5LoFoBuz9-oVGOul1adbuGmfRTlnBvnGQgJ2RzpGs8zhxc
Message-ID: <CAGXv+5HHm6Tdis7s5ZNd9ErNrCHv73U7fFxsN3z+DS+q=pxK0w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260309_214959_699357_0F4E28B3 
X-CRM114-Status: GOOD (  33.95  )
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

On Tue, Mar 10, 2026 at 5:50=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Mon, Mar 09, 2026 at 01:24:34PM +0800, Chen-Yu Tsai wrote:
> > On Sat, Mar 7, 2026 at 4:59=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.or=
g> wrote:
> > > On Mon, Mar 02, 2026 at 01:31:05PM +0800, Chen-Yu Tsai wrote:
> > > > With the new PCI pwrctrl API and PCI slot binding and power drivers=
, we
> > > > now have a way to describe and power up WiFi/BT adapters connected
> > > > through a PCIe or M.2 slot, or exploded onto the mainboard itself.
> > ...
>
> > > So now we have:
> > >
> > >   mtk_pcie_probe
> > >     mtk_pcie_setup
> > >       mtk_pcie_startup_port
> > >         mtk_pcie_device_power_up      <-- power up
> > >         mtk_pcie_device_power_down    # error path
> > >       mtk_pcie_setup_irq              # set up controller IRQ
> > >       mtk_pcie_device_power_down      # if mtk_pcie_setup_irq() faile=
d
> > >     pci_host_probe                    # enumerate downstream devices
> > >     mtk_pcie_device_power_down        # if pci_host_probe() failed
> > >
> > > I think this is kind of a mess because mtk_pcie_device_power_down() i=
s
> > > called from so many places, and some of them aren't connected to the
> > > mtk_pcie_device_power_up().
> > >
> > > In mtk_pcie_setup(), mtk_pcie_setup_irq() only deals with the
> > > *controller* IRQ and has nothing to do with the downstream devices.  =
I
> > > think mtk_pcie_setup_irq() should be done before
> > > mtk_pcie_startup_port() so we can abort before even powering up those
> > > devices.
> >
> > Makes sense to me. I think it can even be moved outside of mtk_pcie_set=
up()?
> > That way we don't have mtk_pcie_irq_teardown() in two error paths?
> >
> > I can send a follow up patch for that.
>
> What if we do those cleanups first?  That would make this patch quite
> a bit simpler and we wouldn't have to undo things.  It would be a
> shame to have a complicated patch to add this stuff, then another
> complicated patch to clean it up.

Sure.

> > > In mtk_pcie_startup_port(), mtk_pcie_enable_msi() and the PCIe
> > > translation window setup also don't have anything to do with the
> > > downstream devices, so I think they should be done before
> > > calling mtk_pcie_device_power_up().  The only thing there that needs
> > > the downstream devices powered up is waiting for the link to come up.
> >
> > My guess is that if the link up fails, then mtk_pcie_startup_port() is
> > going to error out anyway, so it maybe made sense to make sure a device
> > is actually present before doing any more work.
>
> Doesn't sound very convincing to me.  mtk_pcie_set_trans_table() and
> the window setup are local things with no timeouts or anything.  I
> think the logical structure is way more important than some kind of
> hand-crafted work avoidance.

I understand. I merely meant that I have no actual knowledge of why it
happened, or if there are any concerns from the hardware side.

> Separating the PCIe controller setup from things related to the link
> and downstream devices is pretty high on my list.

Makes sense to me.

I'll send an updated version.


Thanks
ChenYu

