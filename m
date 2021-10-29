Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E983DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 19:54:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B996060FED
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 19:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B996060FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hAOTlB0krPNErNs0XJu0ahTAbRW3B05+ZCWZ3Sy7FUo=; b=I1Mz/LLkiSZMpS
	I2Vy7Oyzku5NPMGyhzgEh1nzxvp/fJhpZJYScuBW2tkSkoxt+jtbUXwsJeR4DhILpJvIINGh8oDlv
	i3cQbUNTRY+PeInxX/MTLQ/uwHqeLFD6j+itgfCm5hShRfC7QxojLRP+7mt+h7RgT4g7uDFDwoyxe
	0cSR4+mbhsxhBP1gk9FmKZ8M1oBVxmdlXRiTqTW9QD/dlrvU+m8Mo3xUMW4iJb791snBIotckrqm1
	eYvNsg+yjz5I1G8RCcY4ElcLnA5p5qjcO0g7857Zcfn2U4jlTdEwk1d1eHcLWGqT9Fi8OGai9QpyE
	OFy2ZQphUJb1Z1u+c1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgXwk-00C62D-Ek; Fri, 29 Oct 2021 19:53:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgWws-00BrB2-5J; Fri, 29 Oct 2021 18:49:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D962C61040;
 Fri, 29 Oct 2021 18:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635533393;
 bh=O8j+eIcFHO42eBXB/HW5ZtEu1Eo+aRSqEdx7g78XWBw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=IK+OcgXFKcn2uI7XrdaaVjnnPWturVsiX3l4ZgeB0t50qfwRv8inFWFDjZc9u4Ifm
 lm9D+ZfE9k3nVY4hPuEfmURsLyuAVpVR4AIn9KLG7V1FFZ62I9N6urXKwV1VqsAVL8
 eo3LtZhrN6G1JEiG4URaJzq8O7bDzLp0nT8jZ3DCCyWRiSAtU82/eupwkHRGorSZWv
 hJLpsd4pSvJKUF7IjxSoEJ/ftunYfYmXqkRpd8PCMxzaIiwY/7sdfKpAIRKwrjxM8h
 grLpGCCmIqwOIIviez8rHwX8BeiZJ7JKn0iJ0AVsgCdij3wl8WKPrdhRaVOnOz2rWw
 eUXkvViMQB7hQ==
Date: Fri, 29 Oct 2021 13:49:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yanteng Si <siyanteng01@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Yanteng Si <siyanteng@loongson.cn>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, kw@linux.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci <linux-pci@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 chenhuacai@kernel.org, sterlingteng@gmail.com,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] MIPS: cm/cpc: export some missing symbols to be
 able to use them from driver code
Message-ID: <20211029184951.GA329702@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMhs-H_a0PqATB3kFO3dcFiq+reR+5z7FW27M=m2MnnYA48NYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_114954_317417_534A9A73 
X-CRM114-Status: GOOD (  46.28  )
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

On Fri, Oct 29, 2021 at 07:28:47AM +0200, Sergio Paracuellos wrote:
> On Thu, Oct 28, 2021 at 10:47 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Thu, Oct 28, 2021 at 11:59:17AM +0200, Sergio Paracuellos wrote:
> > > On Thu, Oct 28, 2021 at 11:34 AM Sergio Paracuellos
> > > <sergio.paracuellos@gmail.com> wrote:
> > > > On Thu, Oct 28, 2021 at 11:24 AM Thomas Bogendoerfer
> > > > <tsbogend@alpha.franken.de> wrote:
> > > > > On Thu, Oct 28, 2021 at 06:11:18AM +0200, Sergio Paracuellos wrote:
> > > > > > On Thu, Oct 28, 2021 at 6:05 AM Yanteng Si <siyanteng01@gmail.com> wrote:
> > > > > > >
> > > > > > > Since commit 2bdd5238e756 ("PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver")
> > > > > > > the MT7621 PCIe host controller driver is built as a module but modpost complains once these
> > > > > > > drivers become modules.
> > > > > > >
> > > > > > > ERROR: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > > ERROR: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > > ERROR: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > > ERROR: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > > ERROR: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > >
> > > > > > > Let's just export them.
> > > > > > >
> > > > > > > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > > > > > > ---
> > > > > > >  arch/mips/kernel/mips-cm.c  | 5 +++++
> > > > > > >  arch/mips/kernel/mips-cpc.c | 1 +
> > > > > > >  2 files changed, 6 insertions(+)
> > > > > > >
> > > > > >
> > > > > > Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > >
> > > > > could we instead make the pcie-mt761 driver non modular ? Exporting
> > > > > all MIPS specific stuff for just making an essential driver modular
> > > > > doesn't IMHO make much sense.
> > > >
> > > > The driver is modular because I have been advised other times that new
> > > > drivers should be able to be compiled as modules and we should avoid
> > > > using 'bool' in Kconfig for new drivers. That's the only reason. I am
> > > > also always including as 'y' the driver since for me not having pci in
> > > > my boards has no sense... I am ok in changing Kconfig to be 'bool'
> > > > instead of 'tristate', but I don't know what should be the correct
> > > > thing to do in this case. Thoughts?
> > >
> > > I guess we also want the driver to at least be compile tested in
> > > 'allmodconfig' and other similars...15692a80d949
> >
> > Sounds like the systems that actually use this driver require it to be
> > built-in, and the only benefit of exporting these symbols is that we
> > would get better compile test coverage.
> >
> > If that's the case, I agree that it's better to just make it
> > non-modular.
> 
> I agree and that was my reasoning for sending a patch to also convert
> to bool the phy driver that this PCIe controller uses. When the pull
> request was sent from Vinod to Greg, Greg refused to take it because
> of that commit and the commit was reverted and a new pull request was
> sent including this revert. This is commit 15692a80d949 ("phy: Revert
> "phy: ralink: Kconfig: convert mt7621-pci-phy into 'bool'""). Because
> of this I also changed the PCIe controller Kconfig from bool to
> tristate when I sent v3 of the series which at the end were the ones
> that was finally taken. There are also other ralink related symbols
> that have been exported to allow to compile other drivers as a
> modules, like the watchdog. See the commit fef532ea0cd8 ("MIPS:
> ralink: export rt_sysc_membase for rt2880_wdt.c"). So, as I said, I
> agree and I am using the driver as if it were a bool and also ralink
> systems normally require all drivers built-in, but I think we have to
> take into account also the "historical facts" here. In any case,
> Bjorn, let me know if you want me to send whatever patch might be
> needed.

I didn't see the conversation with Greg, so I don't know the whole
story.

For pcie-mt7621.c, it looks like the only problem is
setup_cm_memory_region(), which does a little coherency-related stuff.
If we could move that to arch/mips, we could still make this tristate.

One way might be to implement a pcibios_root_bridge_prepare() for mips
and put the setup_cm_memory_region() stuff in there.  It's not *ideal*
because that's a strong/weak function arrangement that doesn't allow
for multiple host bridges, but that's probably not an issue here.

If we can't do that, I think making it bool is probably the right
answer, but it would be worth a brief comment in the commit log to
explain the issue.

Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
