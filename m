Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF230FCEEBD
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Feb 2026 06:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZr1Ou6tY3TudV/DCBYFuPdgoLpFgmS9h0sv4mAVKrk=; b=XmEUEasYQjcSzN+AWR8ePd1uUt
	ZcHTzoxxlWDCVKQuk9ONWqvrjeDgSRpOF6zwD3sI5v3ESDyKsri7Q+o1+sf1ryIJleFzIp6yvU2kK
	lJ3rxWsx2UTdHZmUFm19ohMFMuzMFbSj+YnYjyrY6cFojaAiycoKev45zvLiJnFrd77vlPkBpMDYS
	3CgtobaBDmblLCz101K5FYZZfSaKRJpZPFE11AYsDLWkCD9Hn3NHO0fLxPK6K5voKXb9kNyGLuQeY
	GC/pkXDxonJfN1XbW74/nVTaKmiVUYDQohL9r64wafur0celAuQuG+pyRaCQnVGsWkDGIanSjL/K5
	klq/XzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUby-00000005TUx-4BDg;
	Thu, 26 Feb 2026 06:12:34 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUbw-00000005TU7-2p07
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Feb 2026 06:12:34 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-59e4989dacdso582786e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 22:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772086351; cv=none;
        d=google.com; s=arc-20240605;
        b=LX3ZzFlSODtMfvO1bwZTvXH28vWxr4vCk6FbgAoa7vcSxeQylx3iJ8jm1YVyRjivx/
         SbUXywwKN1Pp3GYIXEXw0x471tgKQhY+RPuQ0983JccRlTUWQXtt4hSI/56Oxc6agARE
         RFB0HT62DOYkoISnoQFgvuV0FkiNE26rdCexUUeG1Q5YUjsDq5NJWR2h6LsinDYRZKTh
         uIMOCW8YecEFptJX/Dw7lUFl+jdswN3N1N96XOzx2qFb/4mRxjXqgK5oFfTtzxSV0lK5
         rrCajPJ2QnwRK6AU9Mtu+33chlXkJx7Ir8QUdglZ+kFHqxJwPV29LcsT0OX7GcCepUn0
         5ECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SZr1Ou6tY3TudV/DCBYFuPdgoLpFgmS9h0sv4mAVKrk=;
        fh=OzizUPBmOWWRgo02lwgj9vFgrqxgIuRkvezRXt454r8=;
        b=GYoUX4m3dBOm5x+KU7EaXATGAMpox2sQlB3IlRYxXfsOLBqUOD47w2GcxX/J2kqgdy
         c1UU8KKt3ceXrcFrWtdgKPtDlUHkcaNzrZAqNXlRWuwpH9x9IFE2VWSDtqe2stTbKRQf
         9EYCYf0mg96Cb86lFQslJtbphMVofmFSHMOLYVa3z1lFHwlfmXp1RRGx81IYsvsQRPrG
         cScBoyrLhof/+hr6nCKgj+iHRquJbldWJ/us2jcjh7x56YjsX38l4P/1zl0M1juYCALb
         hVLRWO4w04pDb2fjxsZEUbNawlP7U8e/bW4W0Un1aPsy9P690YZ1XZqRJPATwl1vATQs
         lwTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772086351; x=1772691151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZr1Ou6tY3TudV/DCBYFuPdgoLpFgmS9h0sv4mAVKrk=;
        b=Nyv5LIkvG/63neqAsxNULN80Be262RYNQKad3sJQi3dt+fV4JNUJAe30P9LOUMRZw/
         jpE8g4Sf7Xf3UUwJxuTCMazUAUBCQ2oqeLn3Be/VNbQBZAES2tp7bp4Eic2xAwsewS+v
         M+dmxgQ561TtnXbZeuL3W/IGnd55bQQhBs4KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772086351; x=1772691151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SZr1Ou6tY3TudV/DCBYFuPdgoLpFgmS9h0sv4mAVKrk=;
        b=WpQIsr+I2+Ds5LXFYNBX33Bj9fWKG74mBObZchrgXYS/3e68O16tfIS+ThOGREMBWJ
         A9K667ghWdXC3T6LnUuvf2R4W6F683Vt+NOCBl2zADcURIA06nrgPXywQlaf1EeU2BHe
         yYS10Gok5L5OfLTFDiI3vIZw5kWKJok+QxGJnihrrMFMuZAdzT27/V4Ku7+yTitIGqLw
         9mCarnb6yZAvqHFYOkdf1Y8IjoAD8DghO+bhqwP48NNACEyapdgh/FUnrSW4qO4kNqkO
         JJ3RtzdmzyHRrV3Xuv5Wv41e9xrmh3A3Lpm+BRqAzeyLvhJdjcqkYH3XqlqrWBwhGOVf
         RiPw==
X-Forwarded-Encrypted: i=1; AJvYcCWXFtU6cPPgF8cRIE+SR/njQIYZE+Q8vlLkE1szl7X7ITKC2k8VE8mB40Z2nnh+cCA/QfV00TjecKYVu9+9dg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3tgJY8Z/08eN5Za4sa2dIyQp1VW+3cYfyTdQPl8C1/nkpG8oE
	58o5GF0JKZdZ3fRY9wDi83QBQj6vfj8pGIYpphuw6iOg5kFcIAct4BMzRVtJElRQmAmG1f7A6XQ
	jCf+ai1xNihvrvznXz29a3MKqIKNMTuBQ5NGKxkNg
X-Gm-Gg: ATEYQzxI9wR8H2K9kNsRs+qX8k0sUJDsx3acEs0oyQl6I/yu6cgKTv+PQ5RV/h4QJ7H
	z0TBN5wObFfkQB/Au2z73vGGGS2cDh4B1plTCCNAIUmq9wuN0RzYhuk4ptzML+yPV7MbqHEVG/z
	BrXlKwzVzBHgbVGyvYXBIlKWZhXYFxboeDzz23e8HGEqOVzfxODl4kmK10gniP70slCoJSsbmli
	0RS9LmQ0ZTojtstJgSA2yWAgQ6HkU2x8QhJtTuWrdDdpOgQ8e3apFcbb67F1no9f9GNn/6JvcaR
	J37BshRgstdqNJ1JWxQWSj1/Yr71eSNwGqx5cA==
X-Received: by 2002:a05:6512:3c9f:b0:59e:1a32:376f with SMTP id
 2adb3069b0e04-5a0ed88c5a1mr6027586e87.22.1772086350568; Wed, 25 Feb 2026
 22:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20260225072225.3345307-1-wenst@chromium.org> <knddbvl6qti4pyaphudrmhbx7jm245tsmpa37snk4frtphcuz2@am6aatvc6hbr>
In-Reply-To: <knddbvl6qti4pyaphudrmhbx7jm245tsmpa37snk4frtphcuz2@am6aatvc6hbr>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Feb 2026 14:12:19 +0800
X-Gm-Features: AaiRm51hju21fa_yFDX4K_BlO1UHUo4C27fJmxo88iheU3vUI_evoR4nfNhfQUA
Message-ID: <CAGXv+5FXZPviNSVmrM7-CEkwCQOsYy9PkguBgnzzTrk4wwCqnw@mail.gmail.com>
Subject: Re: [PATCH 0/7] PCI: mediatek-gen3: add power control support
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_221232_903890_735679C7 
X-CRM114-Status: GOOD (  28.73  )
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

On Wed, Feb 25, 2026 at 9:25=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Feb 25, 2026 at 03:22:17PM +0800, Chen-Yu Tsai wrote:
> > Hi folks,
> >
> > This series adds power control support to the MediaTek PCIe gen3
> > controller driver. This allows proper modeling of WiFi and NVMe
> > adapters in the device tree and control over their power supplies.
> >
> > Patch 1 through 4 are cleanups and minor improvements to the driver.
> >
> > Patch 5 adds power control support using the new pwrctrl API to the
> > PCIe controller driver.
> >
> > Patch 6 adds the WiFi and BT power supplies for the MT8195 Cherry desig=
n.
> > This is actually a M.2 E-key slot, but support for that is still WIP [1=
].
> > And even with it merged, support for the USB side still needs to be
> > figured out.
> >
> > We can either merge this as is for now, and do another conversion later=
,
> > or just keep this one out. However this is still an improvement over
> > the current device tree, in which the power for the slot is always on
> > using a pinctrl setting.
> >
> > Patch 7 adds the M.2 M-key NVMe slot found on MT8195 Dojo Chromebooks.
> > This change actually makes use of the M.2 pwrseq driver.
> >
>
> Thanks a lot for doing this! I'll also try to get the Key E support for v=
7.1.

Ack. I'll try to look into how to hook up USB for Key E.

> For the whole series,
>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>
> - Mani
>
> >
> > Please have a look.
> >
> >
> > Thanks
> > ChenYu
> >
> > [1] https://lore.kernel.org/linux-pci/20260224-pci-m2-e-v5-0-dd9b9501d3=
3c@oss.qualcomm.com/
> >
> > Chen-Yu Tsai (7):
> >   PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with
> >     dev_err_probe()
> >   PCI: mediatek-gen3: Add error path for probe and resume driver
> >     callbacks
> >   PCI: mediatek-gen3: Split out device power helpers
> >   PCI: mediatek-gen3: Disable device if further setup fails
> >   PCI: mediatek-gen3: Integrate new pwrctrl API
> >   arm64: dts: mediatek: mt8195-cherry: add WiFi PCIe and BT USB power
> >     supplies
> >   arm64: dts: mediatek: mt8195-cherry-dojo: Describe M.2 M-key NVMe slo=
t
> >
> >  .../dts/mediatek/mt8195-cherry-dojo-r1.dts    |  38 ++++
> >  .../boot/dts/mediatek/mt8195-cherry.dtsi      |  47 +++--
> >  drivers/pci/controller/pcie-mediatek-gen3.c   | 185 +++++++++++-------
> >  3 files changed, 183 insertions(+), 87 deletions(-)
> >
> > --
> > 2.53.0.414.gf7e9f6c205-goog
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

