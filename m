Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EEBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 16:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NAb1ylx/PgTOHlEPfgAlY/7wWAqyKOx5yHGrqsH8508=; b=JBMhVr74NURTlX
	pkMjiglAhnbEmynWIWPnEzkjU5WN4I8aMoPflmgamREOOQZDmIe/vFX0WtoDdcJP3+/mflooTkfYg
	2sh9MFXYpgm11DjSEIULrfPfME5eDmG0FLQHS8pwI8/iYOU4emUmFB6eSpJIwQ2NCkJ1zBie7c+t1
	jkTGuzxgth8sxKOnwfIFFqy8L65k71AeoDvgB09Ly65mF+7DK/L0meyKPKv0GiKXUe90ceVlUkaPl
	Ib2CZiOV9jus+o0HhVnpIz9X4YuPb5j6/PdLaOwqkMmcDMAjFNPD864OovGhI8IfFXdvwRXjLczm/
	O7mHqgmKoQyR5KIvLCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0R9Q-00D5vs-Mt; Thu, 23 Dec 2021 16:41:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0R9F-00D5uX-KT; Thu, 23 Dec 2021 16:40:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22D6261DEB;
 Thu, 23 Dec 2021 16:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFBCC36AE5;
 Thu, 23 Dec 2021 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640277656;
 bh=wLg/tBD/PjWGqRYN8osxxTH2d+iMjRJQa7SeHtuFGxY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=nI4CvWsrWH2IxtN5jTnse16OV9MonHlCu1WphHc+QYffIfNMzwMY3EDJpCbNiZnM2
 af0Gkg5JwKLlIaE344ypErBsl/y5kUYTnzhvbbGXKtR//isTRD8hvTRPeHAEDAdGJx
 6vui6Zk6aMdDFo5PVDgnUik6UyCLeQ6BNN98cHRg1I1dg2wW3MKhtSZoNzBxhlhjKP
 jRxqMJnvzzIkp1GZYQ9UiYS/32ioWuJhl3d79HwN8sDv5xUUDzUkKzs7ve4DSGoGW6
 qaMuUJaL3EGHajXMRwy4jXYoR9RnqvRMm8jOAEDfx8czN5FmVwrqWTev3PGo0sPtKa
 XG5rFu2RNZlsw==
Date: Thu, 23 Dec 2021 10:40:54 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Fan Fei <ffclaire1224@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 16/23] PCI: mt7621: Make pci_ops static
Message-ID: <20211223164054.GA1269587@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMhs-H-nSTLiqgw4LxEPBiTGLh7L4n1mm4FbgOCdzCGxK5e47w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_084057_735227_B8D6A642 
X-CRM114-Status: GOOD (  20.36  )
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

On Thu, Dec 23, 2021 at 07:04:32AM +0100, Sergio Paracuellos wrote:
> Hi Bjorn,
> 
> On Thu, Dec 23, 2021 at 2:11 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > From: Bjorn Helgaas <bhelgaas@google.com>
> >
> > mt7621_pci_ops is used only in this file.  Make it static.
> >
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-mediatek@lists.infradead.org
> > ---
> >  drivers/pci/controller/pcie-mt7621.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
> > index b60dfb45ef7b..4138c0e83513 100644
> > --- a/drivers/pci/controller/pcie-mt7621.c
> > +++ b/drivers/pci/controller/pcie-mt7621.c
> > @@ -148,7 +148,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
> >         return pcie->base + RALINK_PCI_CONFIG_DATA + (where & 3);
> >  }
> >
> > -struct pci_ops mt7621_pci_ops = {
> > +static struct pci_ops mt7621_pci_ops = {
> >         .map_bus        = mt7621_pcie_map_bus,
> >         .read           = pci_generic_config_read,
> >         .write          = pci_generic_config_write,
> > --
> > 2.25.1
> >
> 
> This one was already sent and added to Lorenzo's tree. See:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git/commit/?h=pci/mt7621&id=8a0c1afb8560c2f64bcbdb559931f5ca8b83de87

Thanks, I dropped this one.

Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
