Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE83CD1292
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 06:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArMDdUgx3nEyeI5+WTPv4nMAolK1oVSYh2kLBkinyQs=; b=LSChuusKZOUVP3HvcRtpWQk8/2
	fXv3IfuO0bYup74K4vb3B0ZvI+WJxkJiKXYORPifS1vAcs9TNAcU0ORXLLQagOOLGvGozr3TwPewz
	f4IelCI3zzyVD7rh2WjAvdMe4phhM+vRlVLQODytDB9G/DwzkSFqDo46EARccXhrTJW0lT2f0FPEE
	xsY+Eu6PAxA1Ld/J0H56LEck6OaHkIPUTAw1RiyRDqbibREXXcmjJwmkrb/BLGsISz2AwXz5YxW9y
	oSQn419jyj5aaln+c7GbJT3QGES7x1d3UuETaDSO0e8xmGcp1jTgfZ2l4MLhRL5syfNG0D0Ko+IM/
	nWpLrQ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rungo-0000000AYQl-2V8U;
	Thu, 11 Apr 2024 06:13:38 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rungi-0000000AYPs-3D0N;
	Thu, 11 Apr 2024 06:13:34 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5aa17c69cf7so3249648eaf.2;
        Wed, 10 Apr 2024 23:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712816011; x=1713420811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArMDdUgx3nEyeI5+WTPv4nMAolK1oVSYh2kLBkinyQs=;
        b=PV+Uof/HvreaYFvl/yDUbVrpypjqH3up/9JnOjjMRJkBfh1YYwIpu4eYVRP1oliOUg
         k62ILjRuFdIQ5lDzb0W0WAvlzpcA11rdjzceigYY4SyIZnfi5zqzOMNa58q8B5rlRaEg
         4n9pypajuLSdsyTVdiCqDGp1+jasFpAHWJAu/KZs00lUhXqyN5FtEzApGfU9EigA++fd
         MoUwxwdLVKaDvvAJYQd6M1LNWDhAdWs+Icw1xD6zxXJKNrf5j5IOQ/kV13SC48mrdld6
         niRrbzeW+K6Nc7FnFbD/YFeuNgnd9uk20QBeaKQ3YaPBqJmGGLUGEtGGwAkmfP3ojtlC
         zfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712816011; x=1713420811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArMDdUgx3nEyeI5+WTPv4nMAolK1oVSYh2kLBkinyQs=;
        b=oG9hpODYLUcN4eTOF+d0mSzLUbNGku5ZnWPlNL0vobg8R8Wt0hpFdIYmi1hsdhNwnz
         y3IIk9QOSXa4cihKN3bBHqOi7CyzjN9G+vLMNZZ8bsb+Ne7q+vhx8nm8vUQR0+al8EHt
         8h2e7Q6JKbelN+rpAbGN68EGxs2aJbHkMJB+CLNS7t4uJ2Y1CjtEsmsZHzgWguy7Au26
         APEOjdAhGG9mSl5/e2dlmvG+btsO3LK2VHRq0wL8AHrEwcw9jzHV4PUMEyzFfewVUxCw
         SoY5wNWa9hFKLYCmZceRq/njrPC4cHi/zhZngSKzPm8xoRaKoMAA1EIijjA1/voJde4l
         r53A==
X-Forwarded-Encrypted: i=1; AJvYcCWIkTtVAmj3hnHHKIbVzCthtUYXt6uAS9z96JYUPIXC3pqktxsaeO+up+wS6WjD0/CO2HU6o0aaPUYPJA5SRXoJ0fur+yCgwlkweITpL4whesJfec0CJtE7DaYShpjj7DjDVb9+qcYG47chBNTOcCWhrUuARKEtYkfBKM4+NhOA+NsRPCu52oKlmUY85JUuo+HGwdMm+MejMMislBtbGMG5XXeLSVpjWKXxQ6uBtyfRDDmFg8JDn53W02KkiRW9Iw9KDA==
X-Gm-Message-State: AOJu0YydYvKdytO+L4p4z7/6thlTrbOXKluZfbEM1R3W05ceD/kSBvUt
	UENMBx3WzwMgnNBjHB5RS6IdBAs5yFK9PKWtlyEKso7q+PAaHxiLF3E0NiJOCc72WYSCUxIFiTo
	pw6S/r87H/ZjUCBkGk3HqN1CmA88=
X-Google-Smtp-Source: AGHT+IENbGVWKrne/s3sO7TuTFo7yXZDEYLilBHN6js3X459MwmngQkVEUu9NCFL1lRO7Oo4H330RAXocNl2Cq/ycNo=
X-Received: by 2002:a05:6870:204e:b0:22e:ce2e:4506 with SMTP id
 l14-20020a056870204e00b0022ece2e4506mr4862394oad.37.1712816011117; Wed, 10
 Apr 2024 23:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240410212638.GA2159326@bhelgaas> <458ce909-0616-487d-b4bd-42b58d059198@linaro.org>
In-Reply-To: <458ce909-0616-487d-b4bd-42b58d059198@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 11 Apr 2024 08:13:18 +0200
Message-ID: <CAMhs-H82Ymc=isxu6AX4_s1QnNpSSNt74--ED1j7JxpzE=eCRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: PCI: mediatek,mt7621: add missing
 child node reg
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
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
X-CRM114-CacheID: sfid-20240410_231332_836977_E749B428 
X-CRM114-Status: GOOD (  19.70  )
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

Hi,

On Thu, Apr 11, 2024 at 8:01=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/04/2024 23:26, Bjorn Helgaas wrote:
> > On Wed, Apr 10, 2024 at 08:15:19PM +0200, Krzysztof Kozlowski wrote:
> >> MT7621 PCI host bridge has children which apparently are also PCI host
> >> bridges, at least that's what the binding suggest.
> >
> > What does it even mean for a PCI host bridge to have a child that is
> > also a PCI host bridge?
> >
> > Does this mean a driver binds to the "parent" host bridge, enumerates
> > the PCI devices below it, and finds a "child" host bridge?

Yes, that is exactly what you can see on enumeration.

The following is a typical boot trace where all bridges has a device also b=
elow:

[   20.927280] mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
[   20.940675] mt7621-pci 1e140000.pcie:   No bus range found for
/pcie@1e140000, using [bus 00-ff]
[   20.958228] mt7621-pci 1e140000.pcie:      MEM
0x0060000000..0x006fffffff -> 0x0060000000
[   20.974566] mt7621-pci 1e140000.pcie:       IO
0x001e160000..0x001e16ffff -> 0x0000000000
[   21.369711] mt7621-pci 1e140000.pcie: PCIE0 enabled
[   21.379316] mt7621-pci 1e140000.pcie: PCIE1 enabled
[   21.389140] mt7621-pci 1e140000.pcie: PCIE2 enabled
[   21.399014] PCI coherence region base: 0x60000000, mask/settings: 0xf000=
0002
[   21.413343] mt7621-pci 1e140000.pcie: PCI host bridge to bus 0000:00
[   21.425952] pci_bus 0000:00: root bus resource [bus 00-ff]
[   21.437023] pci_bus 0000:00: root bus resource [mem 0x60000000-0x6ffffff=
f]
[   21.450657] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[   21.462960] pci 0000:00:00.0: [0e8d:0801] type 01 class 0x060400
[   21.474832] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x7fffffff]
[   21.487255] pci 0000:00:00.0: reg 0x14: [mem 0x00000000-0x0000ffff]
[   21.499807] pci 0000:00:00.0: supports D1
[   21.507625] pci 0000:00:00.0: PME# supported from D0 D1 D3hot
[   21.519923] pci 0000:00:01.0: [0e8d:0801] type 01 class 0x060400
[   21.531827] pci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x7fffffff]
[   21.544225] pci 0000:00:01.0: reg 0x14: [mem 0x00000000-0x0000ffff]
[   21.556773] pci 0000:00:01.0: supports D1
[   21.564621] pci 0000:00:01.0: PME# supported from D0 D1 D3hot
[   21.576823] pci 0000:00:02.0: [0e8d:0801] type 01 class 0x060400
[   21.588726] pci 0000:00:02.0: reg 0x10: [mem 0x00000000-0x7fffffff]
[   21.601128] pci 0000:00:02.0: reg 0x14: [mem 0x00000000-0x0000ffff]
[   21.613668] pci 0000:00:02.0: supports D1
[   21.621520] pci 0000:00:02.0: PME# supported from D0 D1 D3hot
[   21.634850] pci 0000:00:00.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[   21.650699] pci 0000:00:01.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[   21.666571] pci 0000:00:02.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[   21.682825] pci 0000:01:00.0: [1b21:0611] type 00 class 0x010185
[   21.694707] pci 0000:01:00.0: reg 0x10: [io  0x0000-0x0007]
[   21.705725] pci 0000:01:00.0: reg 0x14: [io  0x0000-0x0003]
[   21.716789] pci 0000:01:00.0: reg 0x18: [io  0x0000-0x0007]
[   21.727843] pci 0000:01:00.0: reg 0x1c: [io  0x0000-0x0003]
[   21.738907] pci 0000:01:00.0: reg 0x20: [io  0x0000-0x000f]
[   21.749979] pci 0000:01:00.0: reg 0x24: [mem 0x00000000-0x000001ff]
[   21.762568] pci 0000:01:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:00.0 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[   21.819657] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[   21.829966] pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
[   21.842054] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff=
]
[   21.855532] pci 0000:00:00.0:   bridge window [mem
0x00000000-0x000fffff pref]
[   21.869874] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[   21.883352] pci 0000:02:00.0: [1b21:0611] type 00 class 0x010185
[   21.895230] pci 0000:02:00.0: reg 0x10: [io  0x0000-0x0007]
[   21.906256] pci 0000:02:00.0: reg 0x14: [io  0x0000-0x0003]
[   21.917309] pci 0000:02:00.0: reg 0x18: [io  0x0000-0x0007]
[   21.928373] pci 0000:02:00.0: reg 0x1c: [io  0x0000-0x0003]
[   21.939428] pci 0000:02:00.0: reg 0x20: [io  0x0000-0x000f]
[   21.950500] pci 0000:02:00.0: reg 0x24: [mem 0x00000000-0x000001ff]
[   21.963094] pci 0000:02:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:01.0 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[   22.029662] pci 0000:00:01.0: PCI bridge to [bus 02-ff]
[   22.039993] pci 0000:00:01.0:   bridge window [io  0x0000-0x0fff]
[   22.052063] pci 0000:00:01.0:   bridge window [mem 0x00000000-0x000fffff=
]
[   22.065538] pci 0000:00:01.0:   bridge window [mem
0x00000000-0x000fffff pref]
[   22.079886] pci_bus 0000:02: busn_res: [bus 02-ff] end is updated to 02
[   22.093352] pci 0000:03:00.0: [1b21:0611] type 00 class 0x010185
[   22.105233] pci 0000:03:00.0: reg 0x10: [io  0x0000-0x0007]
[   22.116249] pci 0000:03:00.0: reg 0x14: [io  0x0000-0x0003]
[   22.127313] pci 0000:03:00.0: reg 0x18: [io  0x0000-0x0007]
[   22.138367] pci 0000:03:00.0: reg 0x1c: [io  0x0000-0x0003]
[   22.149451] pci 0000:03:00.0: reg 0x20: [io  0x0000-0x000f]
[   22.160503] pci 0000:03:00.0: reg 0x24: [mem 0x00000000-0x000001ff]
[   22.173091] pci 0000:03:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:02.0 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[   22.239653] pci 0000:00:02.0: PCI bridge to [bus 03-ff]
[   22.249973] pci 0000:00:02.0:   bridge window [io  0x0000-0x0fff]
[   22.262045] pci 0000:00:02.0:   bridge window [mem 0x00000000-0x000fffff=
]
[   22.275524] pci 0000:00:02.0:   bridge window [mem
0x00000000-0x000fffff pref]
[   22.289870] pci_bus 0000:03: busn_res: [bus 03-ff] end is updated to 03
[   22.303080] pci 0000:00:00.0: BAR 0: no space for [mem size 0x80000000]
[   22.316129] pci 0000:00:00.0: BAR 0: failed to assign [mem size 0x800000=
00]
[   22.329956] pci 0000:00:01.0: BAR 0: no space for [mem size 0x80000000]
[   22.343081] pci 0000:00:01.0: BAR 0: failed to assign [mem size 0x800000=
00]
[   22.356912] pci 0000:00:02.0: BAR 0: no space for [mem size 0x80000000]
[   22.370053] pci 0000:00:02.0: BAR 0: failed to assign [mem size 0x800000=
00]
[   22.383870] pci 0000:00:00.0: BAR 8: assigned [mem 0x60000000-0x600fffff=
]
[   22.397349] pci 0000:00:00.0: BAR 9: assigned [mem
0x60100000-0x601fffff pref]
[   22.411692] pci 0000:00:01.0: BAR 8: assigned [mem 0x60200000-0x602fffff=
]
[   22.425165] pci 0000:00:01.0: BAR 9: assigned [mem
0x60300000-0x603fffff pref]
[   22.439522] pci 0000:00:02.0: BAR 8: assigned [mem 0x60400000-0x604fffff=
]
[   22.452991] pci 0000:00:02.0: BAR 9: assigned [mem
0x60500000-0x605fffff pref]
[   22.467328] pci 0000:00:00.0: BAR 1: assigned [mem 0x60600000-0x6060ffff=
]
[   22.480814] pci 0000:00:01.0: BAR 1: assigned [mem 0x60610000-0x6061ffff=
]
[   22.494303] pci 0000:00:02.0: BAR 1: assigned [mem 0x60620000-0x6062ffff=
]
[   22.507766] pci 0000:00:00.0: BAR 7: assigned [io  0x0000-0x0fff]
[   22.519861] pci 0000:00:01.0: BAR 7: assigned [io  0x1000-0x1fff]
[   22.531960] pci 0000:00:02.0: BAR 7: assigned [io  0x2000-0x2fff]
[   22.544068] pci 0000:01:00.0: BAR 5: assigned [mem 0x60000000-0x600001ff=
]
[   22.557548] pci 0000:01:00.0: BAR 4: assigned [io  0x0000-0x000f]
[   22.569635] pci 0000:01:00.0: BAR 0: assigned [io  0x0010-0x0017]
[   22.581726] pci 0000:01:00.0: BAR 2: assigned [io  0x0018-0x001f]
[   22.593827] pci 0000:01:00.0: BAR 1: assigned [io  0x0020-0x0023]
[   22.605917] pci 0000:01:00.0: BAR 3: assigned [io  0x0024-0x0027]
[   22.618030] pci 0000:00:00.0: PCI bridge to [bus 01]
[   22.627859] pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
[   22.639956] pci 0000:00:00.0:   bridge window [mem 0x60000000-0x600fffff=
]
[   22.653437] pci 0000:00:00.0:   bridge window [mem
0x60100000-0x601fffff pref]
[   22.667785] pci 0000:02:00.0: BAR 5: assigned [mem 0x60200000-0x602001ff=
]
[   22.681268] pci 0000:02:00.0: BAR 4: assigned [io  0x1000-0x100f]
[   22.693359] pci 0000:02:00.0: BAR 0: assigned [io  0x1010-0x1017]
[   22.705450] pci 0000:02:00.0: BAR 2: assigned [io  0x1018-0x101f]
[   22.717552] pci 0000:02:00.0: BAR 1: assigned [io  0x1020-0x1023]
[   22.729654] pci 0000:02:00.0: BAR 3: assigned [io  0x1024-0x1027]
[   22.741746] pci 0000:00:01.0: PCI bridge to [bus 02]
[   22.751587] pci 0000:00:01.0:   bridge window [io  0x1000-0x1fff]
[   22.763678] pci 0000:00:01.0:   bridge window [mem 0x60200000-0x602fffff=
]
[   22.777161] pci 0000:00:01.0:   bridge window [mem
0x60300000-0x603fffff pref]
[   22.791515] pci 0000:03:00.0: BAR 5: assigned [mem 0x60400000-0x604001ff=
]
[   22.804991] pci 0000:03:00.0: BAR 4: assigned [io  0x2000-0x200f]
[   22.817084] pci 0000:03:00.0: BAR 0: assigned [io  0x2010-0x2017]
[   22.829175] pci 0000:03:00.0: BAR 2: assigned [io  0x2018-0x201f]
[   22.841274] pci 0000:03:00.0: BAR 1: assigned [io  0x2020-0x2023]
[   22.853379] pci 0000:03:00.0: BAR 3: assigned [io  0x2024-0x2027]
[   22.865472] pci 0000:00:02.0: PCI bridge to [bus 03]
[   22.875312] pci 0000:00:02.0:   bridge window [io  0x2000-0x2fff]
[   22.887403] pci 0000:00:02.0:   bridge window [mem 0x60400000-0x604fffff=
]

>
> I think the question should be towards Mediatek folks. I don't know what
> this hardware is exactly, just looks like pci-pci-bridge. The driver
> calls the children host bridges as "ports".

You can see the topology here in my first driver submit cover letter
message [0].

Thanks,
    Sergio Paracuellos

 [0]: https://lore.kernel.org/all/CAMhs-H-BA+KzEwuDPzcmrDPdgJBFA2XdYTBvT4R4=
MEOUB=3DWQ1g@mail.gmail.com/t/

>
> Best regards,
> Krzysztof
>

