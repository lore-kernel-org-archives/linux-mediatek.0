Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834B7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 09:35:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47AEA610D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 09:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47AEA610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvf482kmMp6deaK/glclEuNkffwNNZ+QmD+/y5pN808=; b=0qaujReMKv6zGy
	UCn09yMaEVEW/nrZOsLR8bee/DNgaeL9jhkMFj4PeLQMZJiSRWYuEeGolq9YTCowcWSGSaABONf8Z
	r1I1rdQHciWiUXD23qCp3iNpZsaVARXu9AfFykEp/CzjspXul5+KFdTQvA5qAz1R2XkNHJqC3BNyE
	hxNYuIo8umZgQ8kn0idbDMml8J9e0Wh2IqsOY7kbNKdDRWlxVIVG5yxHMSTLqyFnqLxbD2/TqwWnM
	8caNPba6d8GGAkS+OnIjjET67gWILmgbfyjtWbWplxZnRXMZZ/Idnp/F9iFt8FxlX9AQigg9ZyFPJ
	fBxqHWBmVntqEYUE1wZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg1oY-007PnC-S1; Thu, 28 Oct 2021 09:35:14 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg1oJ-007Pj7-KM; Thu, 28 Oct 2021 09:35:00 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id n201so2662606vkn.12;
 Thu, 28 Oct 2021 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N+X3RRqVMAFWzFiG8bOlA6agMfMr/xts6DAFOgovCf4=;
 b=JTrFeJUi1nHcWED+XsqnURqNpZwQ7ZvwmqNNFoThgBT97Dpjuas3HaRqH4GJ9PoSBd
 6evPn7983wvEENN4ryzgQA5SK4msKBe8cGtEUeGYfSVGeuedfEtXUgDr37WDP4rOUN1t
 4ZI+zJOXxivIeXJvcbl25az99WE6Yjb9ZyBH8f6aA2ZFJjKdQ2u2xNPQihZeBPWocYwX
 vOF9HT/f0pVlv62uZoqYK581JU8xPshIDixzCbyWUW1tftSeEImbEKy1XQdfwySt8GIQ
 rc1aXRlpoKD0hUS+IqXLvFgdNHt/wEZKM3/y32oYBtMS8b0lbpUZW5yxZ4y9ZxwNQkfr
 GLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N+X3RRqVMAFWzFiG8bOlA6agMfMr/xts6DAFOgovCf4=;
 b=kmIpMljVhof2xPMJPRvchy0QVu+gHig853uoFzUwO0kdJgpNmvvK8OiqJwnpCyblYD
 Jm+ldu4D9ev8BBHOTj9HBw+EVIprT+oCJd5DEp72M9neRGf+0862uJbUcHFuzzl1ckfD
 Y5Mc8wz+l8vnGcEF6NP2FHG783CArB4MT01UDD57TePFPnpyhYEoEGy6hU0rHxJqGatQ
 saIa5Q3p9XEb6m9FSutj01rWUkObMhCxkEhk5pPhYdDr71dIWhjqbCIoCSGIEeVLZyUx
 3P8+sZ4uwNygZFzbpk4gP0DX8viMOAtUl+wrtfM87pY+i/NgkiRZOrmehp5+G8dvqlaa
 3DBg==
X-Gm-Message-State: AOAM5320SKuDD7v6wO3L/43n2WxB9xLD5Hnh3OJZcP9e7U336R4LCGCM
 b2ryoJs6iyZ7pbevF/ei13t7aZboRYv6G75+1TA=
X-Google-Smtp-Source: ABdhPJy42PPbm+KO5MLNI28m5oZ+izDUecmCX+TSlGTpkOI3PIrrDzuMz7h98PQza+7LTvOwvEoMWYTXPrpMsLlcJck=
X-Received: by 2002:a05:6122:da7:: with SMTP id
 bc39mr2462108vkb.22.1635413698180; 
 Thu, 28 Oct 2021 02:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635390750.git.siyanteng@loongson.cn>
 <112fea0c8c1b65a762ac98412216239160721263.1635390750.git.siyanteng@loongson.cn>
 <CAMhs-H9LUQ6Km=sA992LH=+E0MbGuMf9YhM6w2HoyeqE0QbzJQ@mail.gmail.com>
 <20211028092318.GA6574@alpha.franken.de>
In-Reply-To: <20211028092318.GA6574@alpha.franken.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 28 Oct 2021 11:34:47 +0200
Message-ID: <CAMhs-H_m=pz4jU_cY-A6PRjR3OYy2zKH0=HN=vFDF2XOk60xBg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] MIPS: cm/cpc: export some missing symbols to be
 able to use them from driver code
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Yanteng Si <siyanteng01@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Yanteng Si <siyanteng@loongson.cn>, 
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Rob Herring <robh@kernel.org>, kw@linux.com,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-pci <linux-pci@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>, chenhuacai@kernel.org,
 sterlingteng@gmail.com, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_023459_693206_BF4FC419 
X-CRM114-Status: GOOD (  21.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Thomas,

On Thu, Oct 28, 2021 at 11:24 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Oct 28, 2021 at 06:11:18AM +0200, Sergio Paracuellos wrote:
> > On Thu, Oct 28, 2021 at 6:05 AM Yanteng Si <siyanteng01@gmail.com> wrote:
> > >
> > > Since commit 2bdd5238e756 ("PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver")
> > > the MT7621 PCIe host controller driver is built as a module but modpost complains once these
> > > drivers become modules.
> > >
> > > ERROR: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > ERROR: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > ERROR: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > ERROR: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > ERROR: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > >
> > > Let's just export them.
> > >
> > > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > > ---
> > >  arch/mips/kernel/mips-cm.c  | 5 +++++
> > >  arch/mips/kernel/mips-cpc.c | 1 +
> > >  2 files changed, 6 insertions(+)
> > >
> >
> > Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> could we instead make the pcie-mt761 driver non modular ? Exporting
> all MIPS specific stuff for just making an essential driver modular
> doesn't IMHO make much sense.

The driver is modular because I have been advised other times that new
drivers should be able to be compiled as modules and we should avoid
using 'bool' in Kconfig for new drivers. That's the only reason. I am
also always including as 'y' the driver since for me not having pci in
my boards has no sense... I am ok in changing Kconfig to be 'bool'
instead of 'tristate', but I don't know what should be the correct
thing to do in this case. Thoughts?

Best regards,
    Sergio Paracuellos

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
