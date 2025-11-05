Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF49CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 09:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9Cz7QFeZXHx7n2GD0Sctn9Btu8KGfjVz7K3mbh7364=; b=v+yjxLIkSVBE27KWYLokARRr/X
	eNx0pmpC+2wfSFuIWbuqu9tbl95+0xMpXd/jsSTOijfq5JuoWm3b43nNKV+PTvA1ZwCcKJIcH8IRr
	LCIqOY5g418hxmRXIQaxw28c3Q8yKKhzqHeJnYwqmPRoxyyv7A87kVq7DNApFTpybJjOMsNAJhCbv
	NXClyzqf61vmIGaxuzkzKouz3Jh0vZ4EDT4exKgGMpMBqlz0b+VYFZfXLmVCabN6dy4utq8A71WNJ
	+8H8eis85oVtOWeAxjR0LN1FBba1TreK6FmJHSnqKmwBGli96D80hYQlslTYOf6OI7ColrB5QZR09
	TkXJqd3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZhq-0000000DN6r-1mmN;
	Wed, 05 Nov 2025 09:21:30 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZhn-0000000DN6N-35AY
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 09:21:29 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3737d0920e6so54373971fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Nov 2025 01:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762334485; x=1762939285; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9Cz7QFeZXHx7n2GD0Sctn9Btu8KGfjVz7K3mbh7364=;
        b=T3N6sNz7UiZ0w6kLC4/IvaoQ027UaOc2jqqKr5vh9/Sm6gq/V3cAcspxN7bzQ9PheT
         DtxKcbI9RnuEen59w15PEBCwPS881lPMTFoBA1n0uelDDo2yGvsQHzk5tgOiON584tfn
         nRLiVNr02VbYMF1x9zK36iQbSn37V9FSB3r8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334485; x=1762939285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9Cz7QFeZXHx7n2GD0Sctn9Btu8KGfjVz7K3mbh7364=;
        b=FLDj1chWjj5fHd27al433fG8ge8R1/Tvu40yD8k09QasN+0l3sZdml/Mq2eymaIU8G
         uHn5YB5iw8W/x4IOQkiU9HEtAxFnwyQpfF3fZx8e6ZLM6YNfrxEfebE7vTE5ltB3U8zC
         6Jgfe4tnX6T0J2J6OnvoCNHpbkMobdv3iJjhLHBxUTUv3NwzlSb5WZLhpyQLPcDfmRCs
         /rM5nm0P3vThvFxEy4a1sLfErvsGGESIr9Q/t5ydUpeDW5TV2Q5lQz2zo4ueDKvFmVJ+
         dpakQCY1Fyc4NnKVsa9Sv4iJkhzH8E64DClhkJxfP6OJx8ZjDATU9vFfK8ij+QwHLd4U
         0Wng==
X-Forwarded-Encrypted: i=1; AJvYcCXHU2NN4jtB10TQx3/fCHfLpFqxnaUfWY3ORaLf+QTGY+YOJOJA/s8IAWzWsz6aMi5iR5jWorIikt2jzy0HFw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz56PrQDw8sAObC5ppuLlNsqjs8mXolIZRj5DsVLB3GeukESi/
	2nqT/awxuu7i6bIqr5/Rpg/0cIH+M8f2nsbf8fGkWf7QU5si4uFwLUVPj+ZbE/4Y7OJldH/tWPO
	ahO/pMfMJbelqVBjryxp9uS+NqkjFYN8FzMzKLCA5
X-Gm-Gg: ASbGncuDHnbfUGTb5lWtGjYaXE4SfbOu3CrcZ70ZmuY6IV64qTDt/gn59c0Tj/E0x40
	xoSMKPaS14iGeD0Y3UD9T5IRzDQxrWovT/drjkb8hdf90maNvYYU6N47pRoZeRnMCfR4Faf1NCN
	eNFx95z+EDucIQCZwMVU6YTNCogICT6tLsNuf0jp+7tVJ+ZktL4NwAl9s/u5m3/DXEIaqtanQUq
	EUWGeXIsv3yjs7m9i5vDncRWH3w0hp+0E7usVDF5yShjyhZDZ+6/VMquk4ThCxozf6C/3NxXWp5
	Sk6pGc4jLx+YovU=
X-Google-Smtp-Source: AGHT+IGQP2VVUJ5rUmY6C9xv2Mgt2qZpBhs2wiUlca0i0M5p6PJNG/u4WXKd81FDNk50RCsLvXv5mIlfnoCqea13DHc=
X-Received: by 2002:a05:6512:104b:b0:594:34c4:a352 with SMTP id
 2adb3069b0e04-5943d75dd17mr829339e87.23.1762334485335; Wed, 05 Nov 2025
 01:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20251105062815.966716-1-wenst@chromium.org> <7250ae04-866f-489c-b1b6-b8a3d8200529@collabora.com>
In-Reply-To: <7250ae04-866f-489c-b1b6-b8a3d8200529@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 5 Nov 2025 17:21:13 +0800
X-Gm-Features: AWmQ_bndGi-pOLYUZIEExvSxZWBBRpwVWURG5nTKgeks0Y9s12nRjMsAjohzleQ
Message-ID: <CAGXv+5EwiL_-ozRARH2UBm5znHi1egBoCjmELN=17hvFF_oeoQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Ignore link up timeout
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_012127_839489_DDA079F1 
X-CRM114-Status: GOOD (  37.13  )
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

On Wed, Nov 5, 2025 at 4:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 05/11/25 07:28, Chen-Yu Tsai ha scritto:
> > As mentioned in commit 886a9c134755 ("PCI: dwc: Move link handling into
> > common code") come up later" in the code, it is possible for link up to
> > occur later:
> >
> >    Let's standardize this to succeed as there are usecases where device=
s
> >    (and the link) appear later even without hotplug. For example, a
> >    reconfigured FPGA device.
> >
> > Another case for this is the new PCIe power control stuff. The power
> > control mechanism only gets triggered in the PCI core after the driver
> > calls into pci_host_probe(). The power control framework then triggers
> > a bus rescan. In most driver implementations, this sequence happens
> > after link training. If the driver errors out when link training times
> > out, it will never get to the point where the device gets turned on.
> >
> > Ignore the link up timeout, and lower the error message down to a
> > warning.
> >
> > This makes PCIe devices that have not-always-on power rails work.
> > However there may be some reversal of PCIe power sequencing, since now
> > the PERST# and clocks are enabled in the driver, while the power is
> > applied afterwards.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Ok, that's sensible.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
> > ---
> > The change works to get my PCIe WiFi device working, but I wonder if
> > the driver should expose more fine grained controls for the link clock
> > and PERST# (when it is owned by the controller and not just a GPIO) to
> > the power control framework. This applies not just to this driver.
> >
> > The PCI standard says that PERST# should hold the device in reset until
> > the power rails are valid or stable, i.e. at their designated voltages.
>
> I completely agree with all of the above - and I can imagine multiple PCI=
-Express
> controller drivers doing the same as what's being done in MTK Gen3.
>
> This means that the boot process may get slowed down by the port startup =
sequence
> on multiple PCI-Express controllers (again not just MediaTek) and it's so=
mething
> that must be resolved in some way... with the fastest course of action im=
o being
> giving controller drivers knowledge of whether there's any device that is=
 expected
> to be powered off at that time (in order to at least avoid all those wait=
s that
> are expected to fail).

That also requires some refactoring, since all the drivers _wait_ for link
up before going into the PCI core, which does the actual child node parsing=
.

I would like some input from Bartosz, who introduced the PCI power control
framework, and Manivannan, who added slot power control.

> P.S.: Chen-Yu, did you check if the same applies to the MTK previous gen =
driver?
>        Could you please check and eventually send a commit to do the same=
 there?

My quick survey last week indicated that all the drivers except for the
dwc family error out if link up timed out.

I don't have any hardware for the older generation though. And it looks
like for the previous gen, the driver performs even worse, since it can
support multiple slots, and each slot is brought up sequentially. A slot
is discarded if link up times out. And the whole driver errors out if no
slots are working.


ChenYu

> Cheers,
> Angelo
>
> > ---
> >   drivers/pci/controller/pcie-mediatek-gen3.c | 13 +++++++++----
> >   1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index 75ddb8bee168..5bdb312c9f9b 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -504,10 +504,15 @@ static int mtk_pcie_startup_port(struct mtk_gen3_=
pcie *pcie)
> >               ltssm_index =3D PCIE_LTSSM_STATE(val);
> >               ltssm_state =3D ltssm_index >=3D ARRAY_SIZE(ltssm_str) ?
> >                             "Unknown state" : ltssm_str[ltssm_index];
> > -             dev_err(pcie->dev,
> > -                     "PCIe link down, current LTSSM state: %s (%#x)\n"=
,
> > -                     ltssm_state, val);
> > -             return err;
> > +             dev_warn(pcie->dev,
> > +                      "PCIe link down, current LTSSM state: %s (%#x)\n=
",
> > +                      ltssm_state, val);
> > +
> > +             /*
> > +              * Ignore the timeout, as the link may come up later,
> > +              * such as when the PCI power control enables power to th=
e
> > +              * device, at which point it triggers a rescan.
> > +              */
> >       }
> >
> >       mtk_pcie_enable_msi(pcie);
>
>

