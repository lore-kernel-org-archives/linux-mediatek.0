Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085B8F532EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 08:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGgmaJxj2IZXFux6HiJZXoAsX/3q5eAbJg/qUyr5Vmg=; b=GXx06RtJ9N9Jc528I8mJ4DiSd3
	ZawU154u81C/ZV/xIk5m2o3u8CVOaY4jHdj60HjCbCgB8K818drtUn3adagy7tB+inXRM+Jo7wc52
	/j3HP549vglzpljFFrm8Oq6r0DeWbyva4hXfWZkE5Sux5RHziqhfOEjw3u6bOS6pToBPtEgVn/0vr
	XtICbC9Vx39MH+RWmajeJZQKotByd5yzD1onsTXy11MDhskYwddJbOcLuhEDZhhSX6WeYBH4E5IZI
	1Pn6NW1gZv5RfiXOUpgox+0nPsYqo5eLaMXPJi04KZrU5UzHJpmnJq2+MjwMjlzLX90+6xOR4+xKs
	nbtDuIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4x6d-00000000zvF-3oAt;
	Tue, 24 Mar 2026 08:27:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4x6b-00000000zv3-45OJ
	for linux-mediatek@bombadil.infradead.org;
	Tue, 24 Mar 2026 08:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iGgmaJxj2IZXFux6HiJZXoAsX/3q5eAbJg/qUyr5Vmg=; b=VZKkxYX7knH+k2tlabPY92g8F8
	mYqFViXppFJtKq0/UW4JQUxngOmuuD+WEApUO+O4PWhXyXkYqEriKi/GqduQxqi2qS9sp4Fp8Lbd/
	iY93wtobbsDPWJIYyLu+Ke0m9GSBHi89BaNa19iYgMFizEbmcLmlin874DlDK1SwqT5FLnqbdDEdx
	ivJGnpY5t/jJROXbI2pbEvf3/0YFvbydkOd9dSH55WrQfnVOiK9JVcCugk45tiabN1c+5p2txi6oX
	BqTK9C5ecVYdCiSZvm7sd9VkVOyn7DGKEVYu+2Yh00ZrtV8317B+PeseVPbn+AbO/G3g5zjLZ6A6+
	zpiDK00g==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4x6U-00000003VNA-3f56
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 08:27:13 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b0abdde280so1196295ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 01:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774340795; cv=none;
        d=google.com; s=arc-20240605;
        b=bhEiiHAKnt/X2SR92Tcw9O+an+eE/LkHwWMjo9ZxPfzhNDLpLavDQjwJt2PZBdtsk3
         EoYkSXZVPT9mH62bpQji/lhwWLKynYc3EyQEks4lIbaN9aimcNtGKUfW/fiZ0b3TMomk
         njS1T5jvbUswWzPLpfswOj4TlEd8OOVjUR03qc8jJH9qGH++8OAcNNIyKa2NImAJ2ash
         +oE2VlJv28zgpyQ+xyv28U6X2RQrzKQe4H6TeL6jeD0H6acDkVomy3uRi+/FM32C/w8U
         lw/FSaSwgzs38CoASTClE8Pg3L7rXJJcBoNVkXFpU5n/TYFBYftshz/4GIv+VZvHPrgx
         a6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iGgmaJxj2IZXFux6HiJZXoAsX/3q5eAbJg/qUyr5Vmg=;
        fh=WifnR0K0XHZgCKsOULY5QpzyCQWeNFMuf6FPwxMFkb0=;
        b=CE5APepfi+ElBfH9v+1HpxZSNpXrm4Dj32DRLW4qoAFGdEIPL3pUqoWwwwzzQZhjYF
         /R8IgY7QVdPhtrq8s/Rt6lRDkSQ8U72PItO4tUCYgkDZOXY357tTNUrihBuUEs4EO0sz
         /2GTZ/gblUIdlzM67YDjdIgRWwvx/Z4NzCBk1FbjfHDW8Q8jcj4gHgDBd34DTazClhAq
         1aZEH/vwEVYgvNpA4AU32C+Mac4pKlfRKD/77KRpGv6RRKizWIROIOqP2rPx5Owaf0Eq
         6btpd1Bn5nNvJPDvVGvqrh9PHtJq9OvQfeW9kltJ/zy1uR/zFVVLCKxiSJZwsGvdsvdy
         eWFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774340795; x=1774945595; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGgmaJxj2IZXFux6HiJZXoAsX/3q5eAbJg/qUyr5Vmg=;
        b=UUCmDt4e1D99nAQIzDmItRVR3/BzAHgyJRjJIQdoAEEZYejX5ymQTmQudgSCVrrqBS
         AUjkScPQs2WrFC33ITFqcZn+uXbRKTAB/tYuMyUH0ObT0Al3YEDYiymo39M3o7CStoIf
         ZfFBHQYVkZ+t72Voxra1/0jXY9+CokLMbU9SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774340795; x=1774945595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iGgmaJxj2IZXFux6HiJZXoAsX/3q5eAbJg/qUyr5Vmg=;
        b=SQZoBH1KMZpPe2peKvNGSGq2gzL0ftUACNuhGrZ1zi894yGIMsGnkxjIOnk43QfAnc
         C5xtr4u+Pm9nGwtKRJaLMoaajr9BUw0UhLS4bIxByKBJe696ytK75zGggt6IigtuK3zl
         tqDa05258OdMGmX3/tkr4IDseqQQLMvc1PfhanJJsQgOw5HOh6Aq0NVX+H1Z2HZvY6d5
         R4CGRf1E9/o64NjrxGl4a9K7XupoFNPIv+D8BnKSBbfCwbCkWur5w9wPRQRouzygRM3E
         G/pJfCNWGpPPQTSL21t0IbhR7v7ttQjjhlMdgGrLV/MrT5HLumRh1BoECT8Oyi+IO40H
         4GiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2MEcOjN5TbssXMpT4p/qAJ5XgIEloycmIuVblCB5jk/ezfpjvNoyzIQGjfJ3Ppv5Uqrp/HH5nefRu/F+QJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAZFSxms+aOwp4eonQYITHJIobuFRBpe1Leod+NhmUUUwHg/Bn
	FObrcIkuU0U6D//yqql2Ol9aS4QxTp+ck9/IIHSh2vuxKRaBje7uYYvria1Nhieq7dv5twX2ib9
	gY7xQQEtQOhYZIAJfJ+FaqXpZkzr/H3LUbJ+kpOKN
X-Gm-Gg: ATEYQzyBU+NzX1wHvkuDOTUAXTc1LaS0DASefIXMBclERLn24VpE3SZY6ZiW1VykZG5
	VH2ANEE+PhZsP7EC1hyoxMVaagSW2jcY9T72PhY606VLxAHim0C5LWyiaLXbuOvGhCzK5JkgqOz
	oT5+CZ0FWQ7QzyMSVatOtYzmcS5xKi1bPq2UJm7ZqvuJ7N85CGUoJJT1fl8TUVixtNh4i0SQXO8
	hD/sbZf9v5FOuCkee++3ht7zIYrSYL+FOLAfP6Xvc8mCF8U5zvcI1jbYTouH+J2tS/CYEyL19KR
	zHLOt9LPS3zyzU5nSgc8GYD/LZV4KmtOZZpb5w==
X-Received: by 2002:a17:902:f64f:b0:2b0:ac1e:9720 with SMTP id
 d9443c01a7336-2b0ac1e9aabmr3301315ad.23.1774340795512; Tue, 24 Mar 2026
 01:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260324052002.4072430-1-wenst@chromium.org> <ojgwqrosft5x75y3yxdawrb72k4z3chc3m6uh4mkdv7dhta3ef@qcvotm36w3ly>
 <CAGXv+5E4V-zC8hfzZgXLL+Wbnw4jFfs0pvovU0xKeDmN17mwUw@mail.gmail.com> <jduc7ozg27bvrfxwpmswhxg4savnrkjcj5tqlluvmq5s6qiqnd@nrq6b36g25wq>
In-Reply-To: <jduc7ozg27bvrfxwpmswhxg4savnrkjcj5tqlluvmq5s6qiqnd@nrq6b36g25wq>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Mar 2026 16:26:22 +0800
X-Gm-Features: AaiRm53L7-tohEy9tkTEmWIGpQ_r6cXSvnDVT5CV84nam-7MkSk5kPI4V-F5z1Y
Message-ID: <CAGXv+5ExO7h9VpXC=oV=bnb6k+vRA_OJH3tmPWVpxqs_hy=QJg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260324_082712_096799_3FBC0EB4 
X-CRM114-Status: GOOD (  27.68  )
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

On Tue, Mar 24, 2026 at 4:01=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Tue, Mar 24, 2026 at 03:52:33PM +0800, Chen-Yu Tsai wrote:
> > On Tue, Mar 24, 2026 at 3:44=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > On Tue, Mar 24, 2026 at 01:19:52PM +0800, Chen-Yu Tsai wrote:
> > > > Hi folks,
> > > >
> > > > This is v6 of my MediaTek PCIe gen3 controller driver power control
> > > > support series. This series is based on next-20260323, with the
> > > > commit a2b2ca0c2477 ("Merge branch 'pci/controller/mediatek-gen3'")
> > > > reverted to drop the older version.
> > > >
> > > > This series is ready to be merged. Please drop the older version an=
d use
> > > > this one instead.
> > > >
> > > > Changes since v5:
> > > > - Link to v5: https://lore.kernel.org/all/20260311075223.3303497-1-=
wenst@chromium.org/
> > > > - Adapt to PCI_PWRCTRL_SLOT -> PCI_PWRCTRL_GENERIC Kconfig symbol n=
ame change
> > > >
> > > > Changes since v4:
> > > > - Link to v4: https://lore.kernel.org/all/20260310091947.2742004-1-=
wenst@chromium.org/
> > > > - Patch 1
> > > >   - Expanded tabs in commit message
> > > > - Patch 5
> > > >   - s/mtk_pcie_device_power_(up|down)/mtk_pcie_devices_power_(up|do=
wn)/
> > > > - Patch 6
> > > >   - Adapted to mtk_pcie_devices_power_down() name change
> > > > - Patch 7
> > > >   - Fixed label typo causing build break
> > > >   - Replaced "exploded" with "populated" in commit message, and add=
ed
> > > >     more explanation about what "populated onto the mainboard" mean=
s.
> > > >
> > > > Changes since v3:
> > > > - Link to v3: https://lore.kernel.org/all/20260302053109.1117091-1-=
wenst@chromium.org/
> > > > - Added two patches to move kernel setup code before controller set=
up
> > > >   code, and controller setup code before device setup code, as requ=
ested
> > > >   by Bjorn
> > > > - Dropped dts patches as they are already merged
> > > >
> > > > I kept all the existing reviewed-by tags, since the changes to the
> > > > existing patches aren't that big.
> > > >
> > > > Changes since v2:
> > > > - Link to v2: https://lore.kernel.org/all/20260226092234.3859740-1-=
wenst@chromium.org/
> > > > - Made PCIE_MEDIATEK_GEN3 select PCI_PWRCTRL_SLOT, following existi=
ng
> > > >   examples
> > > >
> > > > I do wonder why the existing ones don't select PCI_PWRCTRL instead.
> > > > As there are multiple providers, and now even the M.2 power sequenc=
ing
> > > > driver, I think either we enable the common ones by default, or let
> > > > the user pick and choose.
> > > >
> > >
> > > I agree with you. I've sent a patch [1] to select these drivers in de=
fconfig to
> > > make the users life easier. But in the meantime, let's have this depe=
ndency
> > > as-is, otherwise, until my defconfig patch lands, there is no guarant=
ee that
> > > these drivers will get selected by default.
> >
> > I would probably just make PCI_PWRCTRL_GENERIC default m or y.
> >
> > Or make CONFIG_PCI (and probably CONFIG_USB later on) imply
> > CONFIG_POWER_SEQUENCING_PCIE_M2.
> >
>
> The problem is, these drivers are mostly targeted for DT systems as of no=
w. If
> we select it by default for all archs, it will bloat the image size for o=
ther
> archs that don't need these drivers. That's why I wanted to enable these =
in arch
> defconfig.

How about

    imply CONFIG_POWER_SEQUENCING_PCIE_M2 if OF

