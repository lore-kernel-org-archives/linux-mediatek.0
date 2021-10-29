Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 20:11:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877EC603E5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 20:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 877EC603E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnO188YulC3YcFDyZ8DCtVDIMhoguy7z+hlznmlQlDc=; b=Oe4MAY+9FJYItt
	aur2MHckVoMv54BwZiPnXR2Rs56FrBxBDy7yRbJoNQfUIxaUm+Fi+m/b8rFet6JZsHoJOJTq65zev
	RycCRTYuNJ6TahwOXmXmO64P9A5U2PlDGxvKbjjiuWQgz6wjU4KqgQ3e2yR85oEU4iiv79cu8vlh+
	k64wztK5Wc6ZJD/b+WRa6/U652U4HY2v+NunscKqeXpGrBH+9y7OFwzek2TnRwj7qifXyyAtImwrz
	aBR12kd8IzYp/YuVfyTwzCriJEIc2voJ0J6EhdknLRmnpi5E5ukApjFJiEcIe/rzVZuQ11VNtEAQE
	xF17Oicdx4wW7JshImgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgYD9-00CBYT-TW; Fri, 29 Oct 2021 20:10:48 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgXhW-00C1iY-FY; Fri, 29 Oct 2021 19:38:08 +0000
Received: by mail-ua1-x92d.google.com with SMTP id e5so20016509uam.11;
 Fri, 29 Oct 2021 12:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xZ37x2/Bz71vd8jU0DgTgYueXY7X+DJMBePTc2urAc8=;
 b=FgPvaCRF7HkoH3KCZ/Ng47G6NOFJ8PqrcQpodMbfIIPbrbUqe++Pjl4QloSs2khltp
 3FlqKWFKnGzfsnWnhwow1YgUoU8uDGc30KUdwNCdvtNfpOaOrNz33GZSLuf5N/5CZlUQ
 n9lg15Ij/HqzGbGwoPLwHT/iIplZTT4J0yADcVtIJBmDBThR7dbb5Yg8DRrt7qQLdjDg
 QOyc3TCNdYqLTapke7FfUR+ljx7HfvV03pNPihwoTdKSBBioLhgX/VbpGvW5QRTr5eap
 yHHdMtBl+cP1UDEXijTMQeBy53fbllNTJ7sCHNqxxrHxJ98b55Uxvt+A1nDdvgeiQDRY
 mMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZ37x2/Bz71vd8jU0DgTgYueXY7X+DJMBePTc2urAc8=;
 b=zO3nKiErc9gbrzMrBp0RjDEwDJFmKXJKDpLngDA937KUGrJY/92B+VjSlqon80DBxA
 /zuZWRMvKt1x+3rUTuqgvbdHdJfU/vAPfKMDLBE+5U1Tei3m6FU+djFUruz8F41hPsPR
 Vh2QqDRwXrzEHF4pXNDeWtEgeI8DVHFu3f0mVBvfhcSwtv6BFQxw7HCH4AQ6xOCqNZ3p
 0GuIH1VARIKuz/cJAx4TkIoM5NL71O9bRPsf/iuOKLlHSfzIgpkCHA1aFuA2sNmFApjT
 mbRE/K/z0qzHIPFpIZ9/WzsOB9H+Zj/TFsR01sYo0bMQyFZPfM3p9RxFYGfb/H6VexgI
 IB7Q==
X-Gm-Message-State: AOAM531z4uwnTib5CK1Ba5ZwFz1sXW1wMek3+Cv9+/nNh1XyciFiD+aH
 FTn9iY5E2D2xmAV4QyafMciAlH7ynqPcyIGCU7H1dH2OoJk=
X-Google-Smtp-Source: ABdhPJy/uNrL2rKQOgT3ToIBtyQFQFihHX8vRMJBWEJZfSSIYjWZ332ua/apVGmkiSPw0uaN3jxe5GInN5mEf033b+g=
X-Received: by 2002:a67:ec57:: with SMTP id z23mr14949438vso.55.1635536284792; 
 Fri, 29 Oct 2021 12:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhs-H_a0PqATB3kFO3dcFiq+reR+5z7FW27M=m2MnnYA48NYw@mail.gmail.com>
 <20211029184951.GA329702@bhelgaas>
In-Reply-To: <20211029184951.GA329702@bhelgaas>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 29 Oct 2021 21:37:53 +0200
Message-ID: <CAMhs-H8bjOkwfnYqdhWuwA8vt18naW3DABYN-EyW-gDB2cP7JA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] MIPS: cm/cpc: export some missing symbols to be
 able to use them from driver code
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yanteng Si <siyanteng01@gmail.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Yanteng Si <siyanteng@loongson.cn>, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>,
 kw@linux.com, 
 Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-pci <linux-pci@vger.kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>, chenhuacai@kernel.org,
 sterlingteng@gmail.com, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_123806_580096_45D31DEB 
X-CRM114-Status: GOOD (  57.61  )
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

Hi Bjorn,

On Fri, Oct 29, 2021 at 8:49 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Oct 29, 2021 at 07:28:47AM +0200, Sergio Paracuellos wrote:
> > On Thu, Oct 28, 2021 at 10:47 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Thu, Oct 28, 2021 at 11:59:17AM +0200, Sergio Paracuellos wrote:
> > > > On Thu, Oct 28, 2021 at 11:34 AM Sergio Paracuellos
> > > > <sergio.paracuellos@gmail.com> wrote:
> > > > > On Thu, Oct 28, 2021 at 11:24 AM Thomas Bogendoerfer
> > > > > <tsbogend@alpha.franken.de> wrote:
> > > > > > On Thu, Oct 28, 2021 at 06:11:18AM +0200, Sergio Paracuellos wrote:
> > > > > > > On Thu, Oct 28, 2021 at 6:05 AM Yanteng Si <siyanteng01@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Since commit 2bdd5238e756 ("PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver")
> > > > > > > > the MT7621 PCIe host controller driver is built as a module but modpost complains once these
> > > > > > > > drivers become modules.
> > > > > > > >
> > > > > > > > ERROR: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > > > ERROR: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > > > ERROR: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > > > ERROR: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > > > ERROR: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > > >
> > > > > > > > Let's just export them.
> > > > > > > >
> > > > > > > > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > > > > > > > ---
> > > > > > > >  arch/mips/kernel/mips-cm.c  | 5 +++++
> > > > > > > >  arch/mips/kernel/mips-cpc.c | 1 +
> > > > > > > >  2 files changed, 6 insertions(+)
> > > > > > > >
> > > > > > >
> > > > > > > Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > > >
> > > > > > could we instead make the pcie-mt761 driver non modular ? Exporting
> > > > > > all MIPS specific stuff for just making an essential driver modular
> > > > > > doesn't IMHO make much sense.
> > > > >
> > > > > The driver is modular because I have been advised other times that new
> > > > > drivers should be able to be compiled as modules and we should avoid
> > > > > using 'bool' in Kconfig for new drivers. That's the only reason. I am
> > > > > also always including as 'y' the driver since for me not having pci in
> > > > > my boards has no sense... I am ok in changing Kconfig to be 'bool'
> > > > > instead of 'tristate', but I don't know what should be the correct
> > > > > thing to do in this case. Thoughts?
> > > >
> > > > I guess we also want the driver to at least be compile tested in
> > > > 'allmodconfig' and other similars...15692a80d949
> > >
> > > Sounds like the systems that actually use this driver require it to be
> > > built-in, and the only benefit of exporting these symbols is that we
> > > would get better compile test coverage.
> > >
> > > If that's the case, I agree that it's better to just make it
> > > non-modular.
> >
> > I agree and that was my reasoning for sending a patch to also convert
> > to bool the phy driver that this PCIe controller uses. When the pull
> > request was sent from Vinod to Greg, Greg refused to take it because
> > of that commit and the commit was reverted and a new pull request was
> > sent including this revert. This is commit 15692a80d949 ("phy: Revert
> > "phy: ralink: Kconfig: convert mt7621-pci-phy into 'bool'""). Because
> > of this I also changed the PCIe controller Kconfig from bool to
> > tristate when I sent v3 of the series which at the end were the ones
> > that was finally taken. There are also other ralink related symbols
> > that have been exported to allow to compile other drivers as a
> > modules, like the watchdog. See the commit fef532ea0cd8 ("MIPS:
> > ralink: export rt_sysc_membase for rt2880_wdt.c"). So, as I said, I
> > agree and I am using the driver as if it were a bool and also ralink
> > systems normally require all drivers built-in, but I think we have to
> > take into account also the "historical facts" here. In any case,
> > Bjorn, let me know if you want me to send whatever patch might be
> > needed.
>
> I didn't see the conversation with Greg, so I don't know the whole
> story.

Here it is: https://www.spinics.net/lists/kernel/msg3986821.html

>
> For pcie-mt7621.c, it looks like the only problem is
> setup_cm_memory_region(), which does a little coherency-related stuff.
> If we could move that to arch/mips, we could still make this tristate.

Yes, the only mips specific function used in the driver is
'setup_cm_memory_region()'.

>
> One way might be to implement a pcibios_root_bridge_prepare() for mips
> and put the setup_cm_memory_region() stuff in there.  It's not *ideal*
> because that's a strong/weak function arrangement that doesn't allow
> for multiple host bridges, but that's probably not an issue here.
>
> If we can't do that, I think making it bool is probably the right
> answer, but it would be worth a brief comment in the commit log to
> explain the issue.

Do you mean to implement 'pcibios_root_bridge_prepare()' for MIPS
ralink? I guess this means to parse device tree and so on only to get
memory range addresses to be added to the MIPS I/O coherence regions
to make things work and then re-parse it again in the driver to do the
proper PCI setup... We end up in an arch generic driver but at the end
this controller is only present in ralink MIPS, so I am not sure that
implementing 'pcibios_root_bridge_prepare()' is worthy here... I can
explore and try to implement it if you think that it really makes
sense... but, IMHO if this is the case, just making it bool looks like
the correct thing to do.

Best regards,
     Sergio Paracuellos
>
> Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
