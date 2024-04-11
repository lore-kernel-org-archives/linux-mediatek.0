Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B44C41513
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 14:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbcCaa8DX09SvsMoBHm+TyAMbhm9qLZzeE5P/R6GO7M=; b=DX3XJuOKIt5DiOZdRUCzM4sCgO
	hkr99WGxsY2OuqwGfkm5HmmRl4VqJNdDIviy/tsGylcDw3JYK5002aed11ndW11w7o5tJgtlmYVxT
	uCLC7sGidNXTIH3fwbLtSGjISTnbgwT2H7oLoJLSGF9QAexfP9sbyBq8UtEE61wdAxXHTy1EgmE3R
	RsgVo8EYy7fUmmbk9e2yEkSopgo3nK6h1S1UpSg/pR/wuDtn1Qr9K399ui3+pfgEgu8TCX+QO+TT2
	KwLsN0bwgMM26EVT8ju6s2Iv/MN19LIyrG2TEKMU6C9ITpA5bduB84GZOK/X+ScIyHZdbuJg/e/z1
	7YkZ6YiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuZ0-0000000CAQJ-11uw;
	Thu, 11 Apr 2024 13:34:02 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuYq-0000000CAL1-1d66;
	Thu, 11 Apr 2024 13:33:54 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5aa1fe2ad39so3327575eaf.2;
        Thu, 11 Apr 2024 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712842429; x=1713447229; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbcCaa8DX09SvsMoBHm+TyAMbhm9qLZzeE5P/R6GO7M=;
        b=V3Th/eL4tuNu3JoYuiYDtfFPmXBR4TCMyGragmw+ZbtePsDWMOYiX17BNw5UTcMZVD
         iCznmGIWbcUuqqSWI+BzLe9E7IeuSAz8AoUBwPlAfhDTdjoIIwlf8IU2ztLsUUPn5f/S
         MrN4Sq8fbnWiBos2D9pjCu5WdtcbMbkrpMCCSI8z4Q5Cky9j/6srRHkbthAnnbSL/bo3
         2vmp3mLpc8nV2BzDci4FPgBvkarO/k7C9Orxt168welTA1gb/Cn1A5x9vp/FKKvGJpmu
         pfkxf0d4/CGO4uNxy4CRN1CR/cYT53uzQceTvYFN16JH/jQQdcRvkeF/t37m0igCu7ya
         yfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712842429; x=1713447229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbcCaa8DX09SvsMoBHm+TyAMbhm9qLZzeE5P/R6GO7M=;
        b=etbO9BCMMSgVBSDnlCXyfRFu5G6jSRhxf+PXvZMWWzjk+MrgxOUtHIOLOuSJ8cSJuP
         I0WPXcKfDsZnc2FhVzgGpG8BSCm6WzlFuzZT6XBHOewajvSufxIsG3gFR3z1tOvMBDXY
         o739MLo8+rrgQymI0FhIEFkHF/LYWsVc6ojbwbOkScEBq7SJwxymzlF7xAG94LsQY2Ie
         dPkn0EkAdhXY2yHlx9E5dwEYYd8cP6HIF2mMI1JN+E1GOgYfkERNZPg6Ovki0cyC9RRl
         hvMplXJbfNJmoiygg8M1wWF3WKjUbXaT5ycrDDGsUkWYhabAiXu1eTLBpJqphCW3QvD4
         8Ewg==
X-Forwarded-Encrypted: i=1; AJvYcCUxCihbKu5A0WDnrPZkVhT1fdzPYNF+M2CCAVc9qxXgecH/e1j1Ke3E1GUGsmb0wn3Lv+93AuDUN3+jI/3CXLxYGmTmUr/qu/wUC0UJhux0H15pZqroyc6mwtgttDqxamYpUdMuqNuT71SDXP5IJURPQP45YAyzzFaJp6QpZwPN8N1QbvqF821k25JUA/FYPCS6hHf/fKpTgLlJKH6r6wyMnBOhBsdCwWmvgfHl8rVP0m7s+PZ2qg9BIM9k4N/XPbkkfw==
X-Gm-Message-State: AOJu0YwhY4C1b3pIi3qAjwoYS9LI5K8GVzyzuyLq3PuIlVNFnoa51/6K
	XgZQXGq58qpn4GYpHRu0t2XezQwL0k/qDcUuEzcFPiH/pa8mf8u+4fTFYCYY4hzvICEln+BEH9s
	WtPgEuTNijIEMLgJ9doKqqwm4D8M=
X-Google-Smtp-Source: AGHT+IG525FFbMbsm9efSCrv2KXUqFOj0YhoVxH+Cl2iHx5VYUfIZRxfPUChUh11UqyLT5/SR86etSAM7EFlCNkHgHs=
X-Received: by 2002:a05:6870:b411:b0:22e:e6:673 with SMTP id
 x17-20020a056870b41100b0022e00e60673mr5611022oap.37.1712842429406; Thu, 11
 Apr 2024 06:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhs-H82Ymc=isxu6AX4_s1QnNpSSNt74--ED1j7JxpzE=eCRg@mail.gmail.com>
 <20240411123917.GA2180141@bhelgaas>
In-Reply-To: <20240411123917.GA2180141@bhelgaas>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 11 Apr 2024 15:33:37 +0200
Message-ID: <CAMhs-H_imwV4__G4_pt7eWHdyLPe9_fttWJ2a3x1ESP=B6bb_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: PCI: mediatek,mt7621: add missing
 child node reg
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Will Deacon <will@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Srikanth Thokala <srikanth.thokala@intel.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Tom Joseph <tjoseph@cadence.com>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_063352_641538_A64FE344 
X-CRM114-Status: GOOD (  27.90  )
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

On Thu, Apr 11, 2024 at 2:39=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Thu, Apr 11, 2024 at 08:13:18AM +0200, Sergio Paracuellos wrote:
> > On Thu, Apr 11, 2024 at 8:01=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > > On 10/04/2024 23:26, Bjorn Helgaas wrote:
> > > > On Wed, Apr 10, 2024 at 08:15:19PM +0200, Krzysztof Kozlowski wrote=
:
> > > >> MT7621 PCI host bridge has children which apparently are also PCI =
host
> > > >> bridges, at least that's what the binding suggest.
> > > >
> > > > What does it even mean for a PCI host bridge to have a child that i=
s
> > > > also a PCI host bridge?
> > > >
> > > > Does this mean a driver binds to the "parent" host bridge, enumerat=
es
> > > > the PCI devices below it, and finds a "child" host bridge?
> >
> > Yes, that is exactly what you can see on enumeration.
> >
> > The following is a typical boot trace where all bridges has a device al=
so below:
> >
> > mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
> > mt7621-pci 1e140000.pcie:   No bus range found for /pcie@1e140000, usin=
g [bus 00-ff]
> > mt7621-pci 1e140000.pcie:      MEM 0x0060000000..0x006fffffff -> 0x0060=
000000
> > mt7621-pci 1e140000.pcie:       IO 0x001e160000..0x001e16ffff -> 0x0000=
000000
> > mt7621-pci 1e140000.pcie: PCIE0 enabled
> > mt7621-pci 1e140000.pcie: PCIE1 enabled
> > mt7621-pci 1e140000.pcie: PCIE2 enabled
> > mt7621-pci 1e140000.pcie: PCI host bridge to bus 0000:00
>
> 1e140000.pcie is a host bridge.  It has some CPU-specific bus on the
> upstream side, standard PCI (domain 0000, buses 00-ff) on the
> downstream side.
>
> > pci 0000:00:00.0: [0e8d:0801] type 01 class 0x060400
> > pci 0000:00:01.0: [0e8d:0801] type 01 class 0x060400
> > pci 0000:00:02.0: [0e8d:0801] type 01 class 0x060400
>
> > pci 0000:01:00.0: [1b21:0611] type 00 class 0x010185
>
> > pci 0000:00:00.0: PCI bridge to [bus 01-ff]
> > pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
> > pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
> > pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff pref]
>
> 00:00.0 looks like a PCIe Root Port to bus 01.  This is not a host
> bridge; it's just a standard PCI-to-PCI bridge with PCI on both the
> upstream and downstream sides.
>
> > pci 0000:02:00.0: [1b21:0611] type 00 class 0x010185
>
> > pci 0000:00:01.0: PCI bridge to [bus 02-ff]
> > pci 0000:00:01.0:   bridge window [io  0x0000-0x0fff]
> > pci 0000:00:01.0:   bridge window [mem 0x00000000-0x000fffff]
> > pci 0000:00:01.0:   bridge window [mem 0x00000000-0x000fffff pref]
>
> 00:01.0 is another Root Port to bus 02.
>
> > pci 0000:03:00.0: [1b21:0611] type 00 class 0x010185
>
> > pci 0000:00:02.0: PCI bridge to [bus 03-ff]
> > pci 0000:00:02.0:   bridge window [io  0x0000-0x0fff]
> > pci 0000:00:02.0:   bridge window [mem 0x00000000-0x000fffff]
> > pci 0000:00:02.0:   bridge window [mem 0x00000000-0x000fffff pref]
> > pci_bus 0000:03: busn_res: [bus 03-ff] end is updated to 03
>
> And 00:02.0 is a third Root Port to bus 03.
>
> > pci 0000:00:00.0: PCI bridge to [bus 01]
> > pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
> > pci 0000:00:00.0:   bridge window [mem 0x60000000-0x600fffff]
> > pci 0000:00:00.0:   bridge window [mem 0x60100000-0x601fffff pref]
> > pci 0000:00:01.0: PCI bridge to [bus 02]
> > pci 0000:00:01.0:   bridge window [io  0x1000-0x1fff]
> > pci 0000:00:01.0:   bridge window [mem 0x60200000-0x602fffff]
> > pci 0000:00:01.0:   bridge window [mem 0x60300000-0x603fffff pref]
> > pci 0000:00:02.0: PCI bridge to [bus 03]
> > pci 0000:00:02.0:   bridge window [io  0x2000-0x2fff]
> > pci 0000:00:02.0:   bridge window [mem 0x60400000-0x604fffff]
> >
> > > I think the question should be towards Mediatek folks. I don't know w=
hat
> > > this hardware is exactly, just looks like pci-pci-bridge. The driver
> > > calls the children host bridges as "ports".
> >
> > You can see the topology here in my first driver submit cover letter
> > message [0].
> >
> >  [0]: https://lore.kernel.org/all/CAMhs-H-BA+KzEwuDPzcmrDPdgJBFA2XdYTBv=
T4R4MEOUB=3DWQ1g@mail.gmail.com/t/
>
> Nothing unusual here, this looks like the standard PCIe topology.
>
> What *might* be unusual is describing the Root Ports in DT.  Since
> they are standard PCI devices, they shouldn't need DT description
> unless there's some unusual power/clock/reset control or something
> that is not discoverable via PCI enumeration.

It looks like it is necessary since every port has its own
configuration registers, phy, clock, reset and interrupt.

Thanks,
    Sergio Paracuellos

> Bjorn

