Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884A9F532E9
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 07:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tdt0USiBYnG3KyHcZx8kRYdTQ0jrISnlapnNZB8jd5g=; b=Hzu8teAVl4n6i0XPDJ4SuqMwkh
	X4fU4kd7BqTxTdW5UlW0RQGjCnsY+vteemi1rDcOYugYi10R1Zk236cFi3ykRmyVsA0roM8cny7eo
	JJLbLz7mFZN9burXOpZS0upga2E/O9rVWZBjXufyK0JQfFYuiJR+KptTr5Pzc7YkJnDM9FsdEku+I
	piplHm3lMwcAlLcCnLvrnqaCwEPSv7/NKbkopHJ5cmf54V8HbAQJPBhsqKrjd8baxbLN9MjY9Kp6J
	BPEdPnh5W0gJ8RgWPFZTSlHEUH7k+IPop5tZ9d6DkYQjMeY2QnSlrpuXq9l6J/zb2zNMlFVMf4IbM
	oqTs7hnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wZF-00000000vat-0stI;
	Tue, 24 Mar 2026 07:52:49 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wZC-00000000vaV-1aTX
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 07:52:47 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a298acb395so404030e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 00:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774338764; cv=none;
        d=google.com; s=arc-20240605;
        b=kSlbY8QhofYkf+e/nGHd8ExdraBu7EDmBYpRfeplS6RI1ClG8Imy1Sz/7/NMBJwMMO
         /750QCly3yeEy/6jbJGn6vaPJpuCeUts014CT/YmWICVygJNpAzjilcLkF/Mk8LYpCpz
         L/yhxZL8B53XFVr+NW7UCJl54eep9hl7jYf07ma5VUQsHr0ZOZMvBKtgIILaD7GMrpka
         0qxp+fxUfuVotsRq3xxHsacGgQKskInzUtNylTLgqUMcW+dzGdRxyDwKDW81AqvEeops
         owqtUhJYwbR9jM+Ic/1L9SaCtZyaJn4wL07IV04f9y6Dv2kRPlDjligOx4dXN6HDBpNT
         nO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tdt0USiBYnG3KyHcZx8kRYdTQ0jrISnlapnNZB8jd5g=;
        fh=OeRAAJifJUkaNSo40XcECXOUb/zNp1mJ6L8L4848AsI=;
        b=Z8XF5GRQa/KgEt6wNDEvCC4c2eItzUnXD1VQENes0Kl1iy0v9Ox5Xc+FucQ5HchxP5
         cCz0SceoOekojIVUsQo6CF91jzgNtyUZiTY1s50RWUV1kV2PgOL9zTI8Xt4nfn+rQwPE
         oSZk8j0XWTj9/xKumjC5Qs/p58tS53ZFWru4WXh1zMmHdHxhhXXjj+HCUzLsZvfwka6U
         +Bkc7ibmvt5lcATK862ixu5QUrK0ve6pwz7KAcEjPgunJLkMp3HlPO4ipkxOQ3hOKIx4
         FzNXwVAHjopGYa0UqIE0kAxF+7QVxPZD5GqbR3K7nGA5XLExxYp9RFRDFtzpd/aFiEKL
         M6cw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774338764; x=1774943564; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tdt0USiBYnG3KyHcZx8kRYdTQ0jrISnlapnNZB8jd5g=;
        b=D2rc/0qsLx+DPzOPxc2Qc/jEDaQNBcENsx9hExvGAdZZFPz0aS09zdOuBSdO8a/jJB
         uBvZGlujvI2O9Smmy/yhJKHBc5pPGUt/GT54NSwfZEWyXsv90sXaiq+KebP6YZk51Z7J
         sapsadKrbI7+C1q66Hi72/M9Ue2JtncBAHVA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338764; x=1774943564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tdt0USiBYnG3KyHcZx8kRYdTQ0jrISnlapnNZB8jd5g=;
        b=EzpZ1DA/SPl4bI6oss6hVECx9RNVfX9tk14H5HwWMCXkbd0S2YZGQCjFNs2rNBpfGe
         gX1knlXjkH/ERE5+aAqj5bBFMFLu6dG+/VhZd+RjUMRYtZj4P5CssjfDdPgAjoiTBllf
         kI2T+da5DzMXtU3YiQAD9q0UAv9n/dsiboTC6riDNghS4CshJtTLXeSpynkp3w7FxTmq
         ySi+Z3WW6yFZZgDh8QGZQ6uws4THeKmMpQNzostPXGudu0/mcDqiVQxh6wT1CbHfVXok
         caZGRnciMq5De1AcFWShddJMHgiyf5Dc/2olsWKDdJqRUOIduhZGXGB21sBz+K1YVGnp
         5o+g==
X-Forwarded-Encrypted: i=1; AJvYcCW7rEa529HpenTorlbzapG8y9iyMdvPC9n912jaZCfbUc6iKz4jQMWA3/MUjbfsnwTBYvGk8YDJrP2I0ZNJtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBus1uAD7J/bmd5QLSDWYgV6uL7NKKey+CgQGPj2b5NzNtUpIx
	vXTX2eHZKuUYfJHg8Pe9+ibfg6X19OoL4kI94r8cvjNerg19cnDk+opC/beZWHRsNMOfJqq+0n1
	FxdZaGPE1fa/kFJbe6iJx8uq5aPMvH+KxVeUieWpm
X-Gm-Gg: ATEYQzzJxU2YuAhQK+qqzKXX1I4pM9vXiLYimHws81B5bY/WjgdfoB1sBaMeaK1q8B5
	3khjnV0wSr9A+qqBSWPAvF5xy628+v6s6xbCGdC/0NFQow4o4jCDoh1n9h7B1OQvojaFAPOxKaG
	B81kl8BiXctPaFc0IPQ7MS4ye4gTg/bpGfp4bwN5VKZI17hjCMDwY6SjJRj4Ov5AyTZx6Lk8cHG
	0E3yQuipjKwb/JS5uAwKN4v/4+txTSTdrmURkT+FpOxCRupgYCC96P8oG7cInmvwPRnxtGv9CyM
	n9e/TjkUtbKgVU8O7BiGh7VKRci+7EVZYlTswg==
X-Received: by 2002:a05:6512:31c1:b0:5a1:2f0d:f31b with SMTP id
 2adb3069b0e04-5a285b54193mr4742075e87.21.1774338764160; Tue, 24 Mar 2026
 00:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260324052002.4072430-1-wenst@chromium.org> <ojgwqrosft5x75y3yxdawrb72k4z3chc3m6uh4mkdv7dhta3ef@qcvotm36w3ly>
In-Reply-To: <ojgwqrosft5x75y3yxdawrb72k4z3chc3m6uh4mkdv7dhta3ef@qcvotm36w3ly>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Mar 2026 15:52:33 +0800
X-Gm-Features: AQROBzBm128UvbPNSaArneOenUHOuQf6cRKv0b34bJ0-HKCYO262piej0nwDdag
Message-ID: <CAGXv+5E4V-zC8hfzZgXLL+Wbnw4jFfs0pvovU0xKeDmN17mwUw@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] PCI: mediatek-gen3: add power control support
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_005246_520666_D7AC6708 
X-CRM114-Status: GOOD (  31.63  )
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

On Tue, Mar 24, 2026 at 3:44=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Tue, Mar 24, 2026 at 01:19:52PM +0800, Chen-Yu Tsai wrote:
> > Hi folks,
> >
> > This is v6 of my MediaTek PCIe gen3 controller driver power control
> > support series. This series is based on next-20260323, with the
> > commit a2b2ca0c2477 ("Merge branch 'pci/controller/mediatek-gen3'")
> > reverted to drop the older version.
> >
> > This series is ready to be merged. Please drop the older version and us=
e
> > this one instead.
> >
> > Changes since v5:
> > - Link to v5: https://lore.kernel.org/all/20260311075223.3303497-1-wens=
t@chromium.org/
> > - Adapt to PCI_PWRCTRL_SLOT -> PCI_PWRCTRL_GENERIC Kconfig symbol name =
change
> >
> > Changes since v4:
> > - Link to v4: https://lore.kernel.org/all/20260310091947.2742004-1-wens=
t@chromium.org/
> > - Patch 1
> >   - Expanded tabs in commit message
> > - Patch 5
> >   - s/mtk_pcie_device_power_(up|down)/mtk_pcie_devices_power_(up|down)/
> > - Patch 6
> >   - Adapted to mtk_pcie_devices_power_down() name change
> > - Patch 7
> >   - Fixed label typo causing build break
> >   - Replaced "exploded" with "populated" in commit message, and added
> >     more explanation about what "populated onto the mainboard" means.
> >
> > Changes since v3:
> > - Link to v3: https://lore.kernel.org/all/20260302053109.1117091-1-wens=
t@chromium.org/
> > - Added two patches to move kernel setup code before controller setup
> >   code, and controller setup code before device setup code, as requeste=
d
> >   by Bjorn
> > - Dropped dts patches as they are already merged
> >
> > I kept all the existing reviewed-by tags, since the changes to the
> > existing patches aren't that big.
> >
> > Changes since v2:
> > - Link to v2: https://lore.kernel.org/all/20260226092234.3859740-1-wens=
t@chromium.org/
> > - Made PCIE_MEDIATEK_GEN3 select PCI_PWRCTRL_SLOT, following existing
> >   examples
> >
> > I do wonder why the existing ones don't select PCI_PWRCTRL instead.
> > As there are multiple providers, and now even the M.2 power sequencing
> > driver, I think either we enable the common ones by default, or let
> > the user pick and choose.
> >
>
> I agree with you. I've sent a patch [1] to select these drivers in defcon=
fig to
> make the users life easier. But in the meantime, let's have this dependen=
cy
> as-is, otherwise, until my defconfig patch lands, there is no guarantee t=
hat
> these drivers will get selected by default.

I would probably just make PCI_PWRCTRL_GENERIC default m or y.

Or make CONFIG_PCI (and probably CONFIG_USB later on) imply
CONFIG_POWER_SEQUENCING_PCIE_M2.

ChenYu


> I'll change these dependencies after v7.1-rc1.
>
> - Mani
>
> [1] https://lore.kernel.org/linux-arm-msm/20260324073931.23739-1-manivann=
an.sadhasivam@oss.qualcomm.com
>
> > Changes since v1:
> > - Link to v1: https://lore.kernel.org/all/20260224071258.2654521-1-wens=
t@chromium.org/
> > - commit message for patch 3 was rewritten
> > Jianjun Wang was dropped from the recipients as the email was
> > bouncing.
> >
> > This series adds power control support to the MediaTek PCIe gen3
> > controller driver. This allows proper modeling of WiFi and NVMe
> > adapters in the device tree and control over their power supplies.
> >
> > Patch 1 through 6 are cleanups and minor improvements to the driver.
> >
> > Patch 7 adds power control support using the new pwrctrl API to the
> > PCIe controller driver.
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
> >   PCI: mediatek-gen3: Move mtk_pcie_setup_irq() out of mtk_pcie_setup()
> >   PCI: mediatek-gen3: Move controller setup steps before PERST# control
> >   PCI: mediatek-gen3: Add error path for resume driver callbacks
> >   PCI: mediatek-gen3: Split out device power helpers
> >   PCI: mediatek-gen3: Disable device if further setup fails
> >   PCI: mediatek-gen3: Integrate new pwrctrl API
> >
> >  drivers/pci/controller/Kconfig              |   1 +
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 223 +++++++++++---------
> >  2 files changed, 129 insertions(+), 95 deletions(-)
> >
> > --
> > 2.53.0.983.g0bb29b3bc5-goog
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

