Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083FCEA8559
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 05:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6MX+Bp2JNCTwROUTw8A695ABKKQRVttaWhnTocY/i0=; b=VVExqMet1CuRLyNmeycyLYm2rg
	FJ0g7dFGN+kN+EBgGpDp1c0yThYo+JtchXBknBljCFhsVStKEl/F+sCmOpdqTWwWN/QHRJgnQjfEN
	M26wM1tMxmG/9DH2rgvPAyX2yd6/iu5gx8gZpQtp3BE/FXD2MM5KbuqUGCimrWT5BzGF18OjaFGcb
	/S/2JQSjCOgWbrLuCxPppetXLQzfi+CMVeWM2h+zffGU0gcXREnFWZ9UjZlxG1WqGfWVBJpwWbiK4
	ZDeS7Gfcwvmk3E87XJc1PA1PgnUNuBaANtrP0U5Qnd6m9M7kM8/lBIgWs1Yz9zTvTEZOdInxQ+gUH
	3G77k3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzT6q-00000006gQJ-0Hvz;
	Mon, 09 Mar 2026 05:24:52 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzT6m-00000006gPs-2s55
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 05:24:50 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-59dea72099eso5846086e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Mar 2026 22:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773033886; cv=none;
        d=google.com; s=arc-20240605;
        b=FszlNbmwgvWUVAjgMVS5BxGH/uJQiKd4en1MhcGngaRaxP27rOJ77neaZAIzGaNseL
         lY/QJhdO3l/nBtwRnED4bnzLIY/lXabpnZmCQ+GCPvedGM6tUF34EXr759NT2MxkMkUG
         fdEbYPGq41OqHb4F4a9I1aFRIlP9Jtk/HwTJYSiUnFyjO89HpHiN5ZzU3o6MqyX32gdL
         zIe/Nw+MCqsz6584xcNYgyY/6lswVscuVKDnRpVUVsPP5V0X4UPUVZHjWm5fc83/gxkP
         OwLPxY/eD8alnJ8Vvz8FFnGIiIrUtyFHrW1IxNHUfWUy/wosmWHfZpue8ohtv5cxO3kB
         b14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t6MX+Bp2JNCTwROUTw8A695ABKKQRVttaWhnTocY/i0=;
        fh=CSASnKJ68LDWUgcVWwcvty4ZHyhxyzue6rtxdJTsF6o=;
        b=hXaTcJ9AtqCjHkXZWhnx6doCOKltqUzzmx9KGLvE+56WlVPPa9BdN8OtdgNRCX/LeD
         HA8pVwKZmekVT+KORzPP6uvpDxGnD4kMfYb7RUL6Zwc9FjaJF0A+xdwBIP8Iry0ecDGt
         A4n6meA24Jpu4o4vdZS78xfxOArSwHvf9L0y9zXMawNkZr/9UoZAZNyfZJsh4uhGvrYY
         XmdfdL3WfgWbJG7ijeFfc4fGfbHptfJ/iHtgkdnwkjjJ/0FMCwfik9xwTRrO+BQCtoyP
         z6W0I3tbDd1TaH/GcERUB/wbh+94AOjd8rVSb6YgP42GAaOnHU7Fsc0FS45RYlH5tqJd
         mvrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773033886; x=1773638686; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6MX+Bp2JNCTwROUTw8A695ABKKQRVttaWhnTocY/i0=;
        b=Hy8mlRdUindWdH/WdRDI1TB6SH8igG2S6jjz3IFFCQ3Pp0lI/98sc8P5htrO/lA+IL
         2Ide8DhM55jTk7IND3pMvdJIxsktfVs45tCBHfwEB27hlwFBiO/eAEFxmEubQtM98T07
         lYxRwdRJa0e3jGnIi80Y8hYsf/VTW5AD3SqEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773033886; x=1773638686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t6MX+Bp2JNCTwROUTw8A695ABKKQRVttaWhnTocY/i0=;
        b=KEpCcrJXA+3ffZuDOuHVhIHcM5pmui9uiTBOhT9kJuQ956I608vj78nsnLaVspKqL0
         0cnI3rzaFFcfuH3JUVtzrFh+GxamNEzJx/4gOiEA4rSnKcvPNtPXfeq1rBcziyBTpJYt
         upR+hkfdIc1P63xqgDkbVCipEOPyXnO9ZP9Xt43jK3ASG8WaXuzjEd6x6AavIjUPyN1p
         vksMK4Lqowj0b3yItxTpj9GMnVWoaoSN1FWbDml7vxbSmyaush3jR2aa5HMtwbSEiAoU
         GLQB4pfWpNLEN+Bd4alIQZTDcK9AsQYZ44bJw2HUCUjk0kFM/lUfiPQLokuqynxSfL2f
         o4bg==
X-Forwarded-Encrypted: i=1; AJvYcCXPzkwZN5BRSPQijlWjaCI90q7NGAa1UJPSAVoQ2C8krqNkWVzQUuQKkWyM4tTm9Gj7ABihDsTM2zJ4usCgvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJLzOkSwk36bn8+Zip6/rmkxtWGOqn9AvmRyHurj/+Yk39d8Nl
	OGP7/izXHcdhLgujxwCdVmplcyGWanicqjt2RedhN1gq4WgbH2I8+0T2a0COcyhm+sxcSqe9pT+
	4D2vA3nPaS0wvuJ9uEe7FI8X5D2OJiZuGfDarMyeQ
X-Gm-Gg: ATEYQzwkgY7WSZOhD5TaZ61b6+5ciFkLf83NpO61VfcHBM+j60s9MKWnATZjRiOOpgh
	+huHUTSknstzsZCwjj2tBi8BD4p124me0YCTs7cxzhoPpfsSyz6dHuZY6M6a+4SkkIwpzez/V3C
	Kp4OBY/JUPCN0S5sgOscukhzWfPdVwcifTRZnS3r0yI0LHfXuBeFfJo7IoDN+5HxbQhBqt0GZQX
	jRbH84RM1OHrzMHhsGPPXbRpJ4dx/1PNaBwOC2OroizyaF8S9vy+eAaaAhWK/l4NE8bhVLJ555I
	nA11KlbvUDzM5h72CEaVwUZ6TBj2EOHsTGAo+w==
X-Received: by 2002:a05:6512:63c8:20b0:5a1:3fe7:44c9 with SMTP id
 2adb3069b0e04-5a13fe74657mr1589460e87.22.1773033885695; Sun, 08 Mar 2026
 22:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260302053109.1117091-6-wenst@chromium.org> <20260306205952.GA180227@bhelgaas>
In-Reply-To: <20260306205952.GA180227@bhelgaas>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Mar 2026 13:24:34 +0800
X-Gm-Features: AaiRm506wH4t2_mNHmYnu-zj8l0448KLlmjh55sM8J6Y-WYHRCds6FWuvIkp5BI
Message-ID: <CAGXv+5FhSO=+AUaeDSXgM9Je9uTVYq-EW43z9PAuvVKumK6oMg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260308_222449_083821_283A4CFD 
X-CRM114-Status: GOOD (  39.10  )
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

On Sat, Mar 7, 2026 at 4:59=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Mon, Mar 02, 2026 at 01:31:05PM +0800, Chen-Yu Tsai wrote:
> > With the new PCI pwrctrl API and PCI slot binding and power drivers, we
> > now have a way to describe and power up WiFi/BT adapters connected
> > through a PCIe or M.2 slot, or exploded onto the mainboard itself.
> >
> > Integrate the PCI pwrctrl API into the PCIe driver, so that power is
> > properly enabled before PCIe link training is done, allowing the
> > card to successfully be detected.
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2
> > - Added "select PCI_PWRCTRL_SLOT" to Kconfig to fix kernel test robot
> >   compilation error
> >
> > I'm wondering why the two existing uses select PCI_PWRCTRL_SLOT and not
> > PCI_PWRCTRL though.
> > ---
> >  drivers/pci/controller/Kconfig              |  1 +
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 38 ++++++++++++++++-----
> >  2 files changed, 31 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kc=
onfig
> > index 5aaed8ac6e44..e72ac6934379 100644
> > --- a/drivers/pci/controller/Kconfig
> > +++ b/drivers/pci/controller/Kconfig
> > @@ -222,6 +222,7 @@ config PCIE_MEDIATEK_GEN3
> >       depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
> >       depends on PCI_MSI
> >       select IRQ_MSI_LIB
> > +     select PCI_PWRCTRL_SLOT
> >       help
> >         Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
> >         This PCIe controller is compatible with Gen3, Gen2 and Gen1 spe=
ed,
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 7459e1c1899d..93e591f788f7 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/of_device.h>
> >  #include <linux/of_pci.h>
> >  #include <linux/pci.h>
> > +#include <linux/pci-pwrctrl.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_domain.h>
> > @@ -421,15 +422,23 @@ static int mtk_pcie_device_power_up(struct mtk_ge=
n3_pcie *pcie)
> >               val |=3D PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
> >                      PCIE_PE_RSTB;
> >               writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> > +     }
> > +
> > +     err =3D pci_pwrctrl_power_on_devices(pcie->dev);
> > +     if (err) {
> > +             dev_err(pcie->dev, "Failed to power on devices: %pe\n", E=
RR_PTR(err));
> > +             return err;
> > +     }
> >
> > -             /*
> > -              * Described in PCIe CEM specification revision 6.0.
> > -              *
> > -              * The deassertion of PERST# should be delayed 100ms (TPV=
PERL)
> > -              * for the power and clock to become stable.
> > -              */
> > -             msleep(PCIE_T_PVPERL_MS);
> > +     /*
> > +      * Described in PCIe CEM specification revision 6.0.
> > +      *
> > +      * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> > +      * for the power and clock to become stable.
> > +      */
> > +     msleep(PCIE_T_PVPERL_MS);
> >
> > +     if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
> >               /* De-assert reset signals */
> >               val &=3D ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB =
|
> >                        PCIE_PE_RSTB);
> > @@ -449,6 +458,8 @@ static void mtk_pcie_device_power_down(struct mtk_g=
en3_pcie *pcie)
> >               val |=3D PCIE_PE_RSTB;
> >               writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> >       }
> > +
> > +     pci_pwrctrl_power_off_devices(pcie->dev);
> >  }
> >
> >  static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
> > @@ -1211,9 +1222,13 @@ static int mtk_pcie_probe(struct platform_device=
 *pdev)
> >       pcie->soc =3D device_get_match_data(dev);
> >       platform_set_drvdata(pdev, pcie);
> >
> > +     err =3D pci_pwrctrl_create_devices(pcie->dev);
> > +     if (err)
> > +             return dev_err_probe(dev, err, "failed to create pwrctrl =
devices\n");
> > +
> >       err =3D mtk_pcie_setup(pcie);
> >       if (err)
> > -             return err;
> > +             goto err_destroy_pwrctrl;
> >
> >       host->ops =3D &mtk_pcie_ops;
> >       host->sysdata =3D pcie;
> > @@ -1226,7 +1241,12 @@ static int mtk_pcie_probe(struct platform_device=
 *pdev)
> >
> >  err_teardown_irq_and_power_down:
> >       mtk_pcie_irq_teardown(pcie);
> > +     mtk_pcie_device_power_down(pcie);
>
> So now we have:
>
>   mtk_pcie_probe
>     mtk_pcie_setup
>       mtk_pcie_startup_port
>         mtk_pcie_device_power_up      <-- power up
>         mtk_pcie_device_power_down    # error path
>       mtk_pcie_setup_irq              # set up controller IRQ
>       mtk_pcie_device_power_down      # if mtk_pcie_setup_irq() failed
>     pci_host_probe                    # enumerate downstream devices
>     mtk_pcie_device_power_down        # if pci_host_probe() failed
>
> I think this is kind of a mess because mtk_pcie_device_power_down() is
> called from so many places, and some of them aren't connected to the
> mtk_pcie_device_power_up().
>
> In mtk_pcie_setup(), mtk_pcie_setup_irq() only deals with the
> *controller* IRQ and has nothing to do with the downstream devices.  I
> think mtk_pcie_setup_irq() should be done before
> mtk_pcie_startup_port() so we can abort before even powering up those
> devices.

Makes sense to me. I think it can even be moved outside of mtk_pcie_setup()=
?
That way we don't have mtk_pcie_irq_teardown() in two error paths?

I can send a follow up patch for that.

> In mtk_pcie_startup_port(), mtk_pcie_enable_msi() and the PCIe
> translation window setup also don't have anything to do with the
> downstream devices, so I think they should be done before
> calling mtk_pcie_device_power_up().  The only thing there that needs
> the downstream devices powered up is waiting for the link to come up.

My guess is that if the link up fails, then mtk_pcie_startup_port() is
going to error out anyway, so it maybe made sense to make sure a device
is actually present before doing any more work.

We will probably have to ask MediaTek what the original intent was.


ChenYu

> >       mtk_pcie_power_down(pcie);
> > +err_destroy_pwrctrl:
> > +     if (err !=3D -EPROBE_DEFER)
> > +             pci_pwrctrl_destroy_devices(pcie->dev);
> > +
> >       return err;
> >  }
> >
> > @@ -1241,7 +1261,9 @@ static void mtk_pcie_remove(struct platform_devic=
e *pdev)
> >       pci_unlock_rescan_remove();
> >
> >       mtk_pcie_irq_teardown(pcie);
> > +     pci_pwrctrl_power_off_devices(pcie->dev);
> >       mtk_pcie_power_down(pcie);
> > +     pci_pwrctrl_destroy_devices(pcie->dev);
> >  }
> >
> >  static void mtk_pcie_irq_save(struct mtk_gen3_pcie *pcie)
> > --
> > 2.53.0.473.g4a7958ca14-goog
> >

