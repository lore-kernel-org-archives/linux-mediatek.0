Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02621093179
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 06:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pCA0Y9k1ALYtSvBXX1rMagce1N/PUIuFCZYmZlM/qY=; b=0d54ivz+t/6foWLmuYwnLuZ0kx
	gE3I1SaXIUw0mSZWLVwJSfP+D/dJ73IWPR30SiZSn5xiCnYv/9mI1jfOriwNHPZV6P+0OtJ6HuoMW
	WUNnKCmU4EuNbB2YWeej56ZfUtzw33Ac5R8OVdTq8PezK/4WGSf3oO3VPcZBBCORyjVGv1IQTUikY
	NgzZyH0NoUXm6f+HuK0v+KKKx0aTGJhxDUjqHRmLbojx+vRCmpscpRPOOfP1tm82elvlNhT1mvyso
	dW051Je6FOTiefxAGLuD1NY70heGF/tU79j34dO26NM5h6IU+qCkaPa288WZl6MmRY5l0vpqIV57T
	sYOqBQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3T3r-0000000C9Og-2otL;
	Fri, 20 Mar 2026 06:10:19 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3T3p-0000000C9O8-1EPP
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 06:10:18 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5a2853b1f8cso585452e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Mar 2026 23:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773987014; cv=none;
        d=google.com; s=arc-20240605;
        b=g2ZnFTfa8pW7GeRHl3WaIdkV+NfAJqGdEli40ZC7sYQVe7acgwDGbyTZho9WUpuq1d
         61ktIAllDPU2E1+RjTFhVswpXpt8rjmz/TyKe6Pi9jcVFwANGkdaB/9vXGRgDJ+hHcIx
         wjsPnM7Tr90Flc4x1+v3QaF6WhNc/Ao+iWAE1ZaIFn+p6zANd11KXeo7Mza2urqIsJqs
         56ZVoe3cgww4lRG7vdb2ydS8S4vgJU09GZSeUBFSSXfuxDOL+UD6BmEIWpSawdHQIKtP
         2Pt3IaHWumLVjXl0ujor2k+zPieM09ry2rX2xpthVV5alvXsb5cQMW/139fMrKwCgqyM
         6Ryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+pCA0Y9k1ALYtSvBXX1rMagce1N/PUIuFCZYmZlM/qY=;
        fh=PsYfPdVTDPkBRLSUWXS1wxjESs9Bn9k2XFrikzcb0Ps=;
        b=NhJjIOxgIEFgX1HyU/Orp5r3l7lwC6Bo/guPW1SWHyTayK9b33xtNbDxF/NFyqqtpM
         NS6ouojNjkicLXTzK2g+OlTUBFhkGp5P7Eb0toNsoo1xOIlgJItYVGMXvilTNwgu0anE
         lDicDi2pJaVIzmYdh/kfEowZi2PVeFJRHC5RYh5O5Vh8C8Dq4a0ciqWc4yqdydPA3dNr
         YmfFXfr7EFJslU/NCJHxcOfV/eqXhWSJoVwWg2wtBpGW8j/WBz5eb8q+3hLkQE5thKEI
         vRUEydpKqVjoLoJ7odppmv71EnSXWXCnhsxQlLcgate+sYvDQvmiNa42U16qTQG8wCps
         hyEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773987014; x=1774591814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pCA0Y9k1ALYtSvBXX1rMagce1N/PUIuFCZYmZlM/qY=;
        b=X/diI2KpVuInQ5pTf7AtAlB87l0dnTlSNNqILSRe8hM229f1tFomgAokMf75AN0OpV
         Qg/2aMQAJtyf6NMBC1MCZC1eifcYzlG3+CAw3X0N/7iinH12cMxLGDffRT4QHbzBZiC9
         ulzarVckTxl0mayJfF8b35DLUAztKEuW3FEj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773987014; x=1774591814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+pCA0Y9k1ALYtSvBXX1rMagce1N/PUIuFCZYmZlM/qY=;
        b=qx3nvmS/H9EwVOc9elM72c53SqFdHzNZoM0HQxMP6D0dPLFp1gtg7I1g/omvaenveX
         Rac8uj2QuxadEcw+nFGR59zlqmuuWbbSu5V3zb991Knwbb7ZPN2lUOqZGKh1w9hRhsdl
         C7BN7yvKtk/WIo706hiLxbAb8M3pqXX5dDysVgmlIeTL/C2ndnPmgRGu/wINu6fMuFlv
         bkyHIbudNhzWKJh3aOnTUVoqOvkEI/N9Ci5u8J3Mp+W7fDynOYgE8lK419TdUy1d6vC+
         YvtXbd4BjVnScvg+4bydtl1bEj5Al0GjEdt0oV/2213pBNejtrQalh+8Uu1DY38hjVJG
         tSzA==
X-Forwarded-Encrypted: i=1; AJvYcCUjtIoxQTuNvrddhyqpczdYYynVpXTZBZtNMYHmXxidphV2DNop2dp9+wkWAL9bd6/leYiAIFvQ3b8rbEaUiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyjjt3F0/kHEFkRiU7Tlk9NTSP5WGEOto4CqvdwLoxjBH/URjj
	O8BZatV+vZJyP56LDUDXMPCgNlgLBF/49tziyGl+GZLPfiEuHFKvif0pDrmwIh+VacSmGisdb4p
	+Hxkzkpfgd6gNQILcSMOLVABNY/oC/HMH8c8q9JTH
X-Gm-Gg: ATEYQzzwvsKrT8wJHwrAe6r2KSNDXc9rpI95WRjGN1u9EgciTg7X8gXvbzWgi96B0p+
	y16h+5BwXagcfpwHOcUIduRq5yhw+lI37eJu6MbIrcagy3MPdGXtGOvGh+Yib8OO228G18aOn4c
	agH1/4RS6mP5CBc7l01tEBZCojxKTjc/6CQ/S+sz/Mn0KPRtwJyeAq7JuJv74RY5rxOF+/ocIvh
	QyfLpbYzdbzbLkwTWCXr/XP1B0sLWUAZI4MTTQgxgfEeXFKXHM5f2ffCiP7CwIVrQJP0oX5BLJA
	mpWZNjA74LmoDC14pi/YnvNjkDDjT219mwLZmA==
X-Received: by 2002:a05:6512:33ce:b0:5a1:2e14:134b with SMTP id
 2adb3069b0e04-5a285ae3410mr590453e87.4.1773987014439; Thu, 19 Mar 2026
 23:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5FhSO=+AUaeDSXgM9Je9uTVYq-EW43z9PAuvVKumK6oMg@mail.gmail.com>
 <20260309215056.GA603013@bhelgaas> <CAGXv+5HHm6Tdis7s5ZNd9ErNrCHv73U7fFxsN3z+DS+q=pxK0w@mail.gmail.com>
In-Reply-To: <CAGXv+5HHm6Tdis7s5ZNd9ErNrCHv73U7fFxsN3z+DS+q=pxK0w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 20 Mar 2026 14:10:03 +0800
X-Gm-Features: AaiRm52IuEwlj2YQb5Sz6HwgUbNaTD0PesNM08MExt-MYdM6k4KSEpkm7Hbd12Y
Message-ID: <CAGXv+5HQY9nTCacUbNZL1XggiHqomhgiQH_gdFtXLra+_ut4fQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260319_231017_439261_70D2DC4C 
X-CRM114-Status: GOOD (  37.18  )
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

On Tue, Mar 10, 2026 at 12:49=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Tue, Mar 10, 2026 at 5:50=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org=
> wrote:
> >
> > On Mon, Mar 09, 2026 at 01:24:34PM +0800, Chen-Yu Tsai wrote:
> > > On Sat, Mar 7, 2026 at 4:59=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.=
org> wrote:
> > > > On Mon, Mar 02, 2026 at 01:31:05PM +0800, Chen-Yu Tsai wrote:
> > > > > With the new PCI pwrctrl API and PCI slot binding and power drive=
rs, we
> > > > > now have a way to describe and power up WiFi/BT adapters connecte=
d
> > > > > through a PCIe or M.2 slot, or exploded onto the mainboard itself=
.
> > > ...
> >
> > > > So now we have:
> > > >
> > > >   mtk_pcie_probe
> > > >     mtk_pcie_setup
> > > >       mtk_pcie_startup_port
> > > >         mtk_pcie_device_power_up      <-- power up
> > > >         mtk_pcie_device_power_down    # error path
> > > >       mtk_pcie_setup_irq              # set up controller IRQ
> > > >       mtk_pcie_device_power_down      # if mtk_pcie_setup_irq() fai=
led
> > > >     pci_host_probe                    # enumerate downstream device=
s
> > > >     mtk_pcie_device_power_down        # if pci_host_probe() failed
> > > >
> > > > I think this is kind of a mess because mtk_pcie_device_power_down()=
 is
> > > > called from so many places, and some of them aren't connected to th=
e
> > > > mtk_pcie_device_power_up().
> > > >
> > > > In mtk_pcie_setup(), mtk_pcie_setup_irq() only deals with the
> > > > *controller* IRQ and has nothing to do with the downstream devices.=
  I
> > > > think mtk_pcie_setup_irq() should be done before
> > > > mtk_pcie_startup_port() so we can abort before even powering up tho=
se
> > > > devices.
> > >
> > > Makes sense to me. I think it can even be moved outside of mtk_pcie_s=
etup()?
> > > That way we don't have mtk_pcie_irq_teardown() in two error paths?
> > >
> > > I can send a follow up patch for that.
> >
> > What if we do those cleanups first?  That would make this patch quite
> > a bit simpler and we wouldn't have to undo things.  It would be a
> > shame to have a complicated patch to add this stuff, then another
> > complicated patch to clean it up.
>
> Sure.
>
> > > > In mtk_pcie_startup_port(), mtk_pcie_enable_msi() and the PCIe
> > > > translation window setup also don't have anything to do with the
> > > > downstream devices, so I think they should be done before
> > > > calling mtk_pcie_device_power_up().  The only thing there that need=
s
> > > > the downstream devices powered up is waiting for the link to come u=
p.
> > >
> > > My guess is that if the link up fails, then mtk_pcie_startup_port() i=
s
> > > going to error out anyway, so it maybe made sense to make sure a devi=
ce
> > > is actually present before doing any more work.
> >
> > Doesn't sound very convincing to me.  mtk_pcie_set_trans_table() and
> > the window setup are local things with no timeouts or anything.  I
> > think the logical structure is way more important than some kind of
> > hand-crafted work avoidance.
>
> I understand. I merely meant that I have no actual knowledge of why it
> happened, or if there are any concerns from the hardware side.
>
> > Separating the PCIe controller setup from things related to the link
> > and downstream devices is pretty high on my list.
>
> Makes sense to me.
>
> I'll send an updated version.

I'm confused. I see this version in -next with the minor fixups from
Bjorn. Do you want me to do the cleanups on top of them?


ChenYu

