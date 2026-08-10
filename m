Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F90C5AD7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 10:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDZgGtDZA2SodhjUYL0QDlYRHGpmrmtit/UzUDZv+M8=; b=BfydAs4/gnhrGMzwoBlgHJY8qm
	i3al8TpYIqniH91TQTHXJ8Tu5SBEL+YHysjiEtNnf+xakfOoX7N7EOFXFBcDCYvtD3E6cbmjozLR+
	TfmNLSqF/08L5npm+GNGk/yDEfgFxQ/rxCFR814dVd1egT4iC3HlGBzF8jJaJhhMN5+p2exeOLyXZ
	ITO8gfIUbLRNdg7mfQNyCqMahMICsREzC6qQ2a7mTwUSe7zNxlY96Xr4cn/AFaW7wFnWifyw+uw+m
	UtuR+2tRnCinRUjTXfU0gyHpv0RyDft+2QgeGaVgaPLJi3LtPSxgNnFeb/kmqzT4s1+JXlgwH3SEg
	4R0/vrvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNJw-0000000BWFG-0hhA;
	Mon, 10 Aug 2026 10:33:28 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNJt-0000000BWEC-2V8T
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 10:33:27 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-6682259cb3dso3036224d50.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 03:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786358004; cv=none;
        d=google.com; s=arc-20260327;
        b=rLqk0zurc88t1T8/5xQHnS1z/IzRyHgotnWHBVmFib0PWm503ZYL9H8vJio1HMYw2y
         ZJmCZtE0bU9SQfCuaJJGh9w+cKCqVAZMHjoUjMYmjhHqeuR2O517BLpUABzCZg5M+hso
         mR9i/0xZd+WZs9lNabfg0s7dq4R/8EzchqvmpU7YN90e+e5+n9yg1cEVLss7+c1SgEId
         WssUxAfqejegYLLZefvMyqt0q9tTsQbDFQ3i0E1h9ZaDlXBkMEZbMPE1mCHX1massp6i
         AliO3Dm+hOzuq5u3+rojx3qwzh/tqNi1n53wojFWsCX2+K5Ua5Yjoce9jezTLF3eACG9
         b3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zDZgGtDZA2SodhjUYL0QDlYRHGpmrmtit/UzUDZv+M8=;
        fh=Uu8nFRP0ktqlVrGPiGoZtsG1P5MNwNNj8ZhEzr8i8G4=;
        b=rc80uLanadoNHWND2ysXZDdkWEUbkXyaZ4OJE4WQystYYL8q8/MYSGDSkHeJj+ZIRp
         deGkYIBTs81lGAEOEF3IPPKnM1T/xTjX0e1npajYn+Dr3EHyqeHEaYKPvMETjv80PFFB
         Bgoy/1vTj4I9FDfMlnr9D2TfVW37ONjHrfQDdopmKA5GDpGlcFDGO37R9ImQH0vzs/rn
         9yoNmYZBb3dQILGQROR1k+62uGmvG/nqFzfiYbiqbeBPpTiWDBpJLrWVBgfoZCaXsyLo
         1PsLM/BwQKlSyaPBDEmnL9kJs17eWoCumVT8fW/NKVCu3c3DWHiy8eNy/j5xZnTqGL5l
         JCRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786358004; x=1786962804; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDZgGtDZA2SodhjUYL0QDlYRHGpmrmtit/UzUDZv+M8=;
        b=dmdHdV/iZFRsi/tCulajiCdcdjfBYOeKdlQg1esmuiRv0Y7XgZJhLgwm7TzVSRzsQ5
         FOHenhItgV9j/C9X7LRp8zIRicmYtXegddeema5n3jPVTtxf502qKpDSeiEumvb0TjqW
         Pk3v7XJ+uOKihSNXz68BGpJOxQQTEaytdpcRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786358004; x=1786962804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDZgGtDZA2SodhjUYL0QDlYRHGpmrmtit/UzUDZv+M8=;
        b=J3cFdBCgtlM67njFdGVNOeipdV+6uVlvKzAHYekVXdIvJNBgYcyOoNqJwoQc3B1Zdh
         mRZTbsAz9uza8suNFC4hahdqYWgqBHAL6xVnymPMYjPpkPj7XAecgx+A9f9hh+FacsD4
         0V6uNPbcLm6pPRLev5UZz7MjUIPtyLPVE4tTXSMAUlB5DPbRmvANX4fG5mYiUWFXWbdl
         4yHWYBwVQtOiDt0UURZ1nb8c+AdLgwq7QTtZeV2ls1sFE7zrH064FVecxuWQe6ueIx65
         2yvmqd8JsLiNPYojMCInMqwJ/uDbvHKsc9AyzH9ZhanrEeIFI5bD7w5x3/baaDLpk0Hm
         zqVg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4bAvFh9dwpc/gbF6lDZuXKPZp8K5TwFHAdHnqsHAMjwW684MCyzgwblY4hvb/TJZHrozxI3JQgGZRuufnVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv1a7ll5RPqNqAlgeEHTRk5ppa6Cp2FdpeJbc3rKHdMJ6hO3u0
	0xRcCqmMscb0HgZky64eJc/lxTCR8JgRx6wI4pglvz1ptSh3PmWNXYcakwcmHhXpw8/BuMjeNXp
	A2s4swFw4LAytCB5SmMrKFUAXW8OAPeRcvbyPZ796
X-Gm-Gg: AR+sD13gxkqkac8mL5E4t6FrvBPRPo6G9DPBYjeMP2CVxnN2FsGrJSCXu3Rc4gJemOl
	P4kzqy1qML2vEWQ9+F+euSHTU4W1nqWQT747miPqYaMaSw28ifXM2KEeCJuBzFgj/mG6Nb84T72
	XIiaWLazoDUVbco+E1SHGZ12TtDl84dI1QGgW8SIpp8WyXqyDTckmAFMor8e4OkdtX7zVlkEVuR
	bAvgLXOV2kav91E4ZzbNuAGXyLHTrMvqwSPkdOits8gNO6mShqUyVCqeskEpNtr3ym9Jt/L60l/
	iSLBsHvdE4J2hu0O/ythUrmF2ANZzbfuLM/k4D+JW/ctGzh+ohNR9btYygbtp/SnFkkM7g66qsE
	=
X-Received: by 2002:a05:690e:244b:b0:667:ef7f:c37e with SMTP id
 956f58d0204a3-66ada8434d8mr7210260d50.8.1786358003849; Mon, 10 Aug 2026
 03:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
 <20260807152059.GA39821@bhelgaas>
In-Reply-To: <20260807152059.GA39821@bhelgaas>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 10 Aug 2026 18:33:12 +0800
X-Gm-Features: AUfX_mxe5L1RZVyMRQ0Vt-LD7TRaHThgwqJqmmrQKlLCig1wrp3paWSMXqZXYyM
Message-ID: <CAGXv+5GNvV0yfX2v7E9HxvFpm0xwhGMQLjec=_xV_6YipXFcbw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_033325_682999_34756054 
X-CRM114-Status: GOOD (  28.99  )
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

On Fri, Aug 7, 2026 at 11:21=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, Aug 07, 2026 at 11:24:09AM +0800, Chen-Yu Tsai wrote:
> > On Fri, Aug 7, 2026 at 12:53=E2=80=AFAM Christian Marangi <ansuelsmth@g=
mail.com> wrote:
> > > This small series introduce support for 2-lanes mode for Airoha AN758=
1
> >
> > Just a nitpick, but I would probably name this something else, like
> > "cross-controller lane-bonding mode" or "lane stealing"? PCIe already
> > has 2x lanes as a standard feature, so this naming is a bit confusing.
> > It's not like dual-LVDS display in which LVDS is only a single lane.
>
> I suggested the "2-lane" and "x2" terminology because I assumed the
> result is what the PCIe spec would describe as a "x2 Link" consisting
> of two Lanes.
>
> If that's not the case, maybe "cross-controller lane-bonding mode" or
> "lane stealing" would be more accurate, but I don't know what those
> mean, so if we use them I would also like to know what the result
> looks like in standard PCIe terms.

Benjamin pointed out later in the thread that it is just bifurcation.

I would assume "PCIe bifurcation" is a standard term, so maybe we could
call this "Support un-bifurcated 2-lane operation"?

On the implementation side, having to reach into the second PCIe controller
is a bit messy :(


ChenYu

> > > SoC. This is needed for correctly functionality of Eagle WiFi Card
> > > normally attached to this SoC that require a 2-line PCIe card to
> > > correctly work (and give the proper performance)
> > >
> > > The first 2 patch address a limitation of the PCIe implementation
> > > where the PERSTOUT reset were indirectly asserted and deasserted
> > > all at the same time (for all the 3 PCIe card) with PCIe
> > > enable and disable.
> > > The 2 patch address this and introduce correct reset to control
> > > reset line for the relevant PCIe line.
> > >
> > > The last 2 patch add additional logic and support to assert
> > > and deassert the PERSTOUT and also apply the required configuration
> > > for 2-lanes mode.
> > >
> > > 2-lanes mode is implemented in DT by adding the required property
> > > and by defining the "num-lanes" to 2.

