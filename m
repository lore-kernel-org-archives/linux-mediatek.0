Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B87C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 05:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C687061157
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 05:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C687061157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BBYwAjI1ZEynlYgq5/egFSCS3rGe341MnF+XPgRFug=; b=CZNN9Z1/TuaNlz
	pT4/Nq71cSFElc33lDj3viqZLY3aTgcAjmWfU+EedOpkaujcdbKLCT7oigctzS9QERzCVHOUNt0Az
	rnU6u/xUylf+0/g1RJvehIbJP6b4+nYxJemBLAwMKvdp8fpgkWm8ykLP1YlZg0WR4qYYaCSA/T9c1
	4fJsfR1J6c9temVDZLW29fSVGnQppJ0GjUnM5FBsLBVCk2J/h8IaozrixAAy/d0iftkX6T/Z6UHCM
	sVlg2e4oyzifsXIjWMtuLda5o2VNOIlZMmrEyCEiSGU9ZanyGWj9RVJ/2lqx1X5xF11EP3bwk/PmL
	gahl0Tc9X7KAFfCB6wzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgKS7-009qy0-5k; Fri, 29 Oct 2021 05:29:19 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgKRq-009qx4-Eh; Fri, 29 Oct 2021 05:29:08 +0000
Received: by mail-ua1-x932.google.com with SMTP id q13so16102950uaq.2;
 Thu, 28 Oct 2021 22:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3R02g5agze3gTm5Z45MrmlDDVJJ1SjhpJ9wVYHXfFVc=;
 b=dAPzFHqY6a3yuq3WPaxBDLMqDiOOIvbGTScOjWeJ9qYjDnceFbeYAjHCjmG2cdtSt/
 JF2Sh3MpKz+H0WgA2dhV0urNCpDT9IsQJaEkdOg1h6AfroREvG2h/J9t5qpr3xFV5Y6/
 Luj+VxSUsDZk2KOXn+bmj0KnCRWv8z0BYM+ULkYivoL2izRIUAjmePHDr8IYa5njuX/t
 +hzFigJBtBfggVl8QM4sriD8UiUWzEg8+z2AXzEVPvOUEdyEhbue8rLgopr/FYLUtVav
 n2iBAoefklk9UzAs/gNG3stlyB85kiGCLNqjCfTEQ72igNsfST0LQEwdTDkeGpChJrEc
 1MhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3R02g5agze3gTm5Z45MrmlDDVJJ1SjhpJ9wVYHXfFVc=;
 b=uxBL/EjEryVFj2NZ0+GpJMmBWSlTrryMI3H3jTIiejbzqYIo6gNcdWnqcEc1LK+XNp
 PUE41tNpm6yixOvizSs3Yi6BJqz1MT6t0ZxaS7AEXPKZQyDXpBdJzZtYASsaQPg6yIt7
 SJwPALnBxn2ofuOatb8ms4dbjTPb036S6C5qQCX3XQR3ghuqgEtNBKz7y3PV3mBMA9b/
 Z9vO+ip+9M8vb0hEXwn7CEMDbYchFOi0E8iQTBCUpiX0W5u2YhKSJkWih8SsnVA8KMhm
 hq+u0FhEFJgM+WGj5e73cvxeYS5L52QKMxkEjF5uk30Pi1Qv//vv4IIHZHItDJOp4op6
 Ne/w==
X-Gm-Message-State: AOAM533U4HdGIupW6SF2PO4gHl/W1yQtcpfxVgaXkqjUFCpEBG5mXHGl
 0AH+wXn0WbZPMiqAKWXtrH4L1xE5uTuyCjYALqk=
X-Google-Smtp-Source: ABdhPJxs1fI3cK3JY0LAlIQGqCHUDGWxH+wj3J2xlepe64o7dHGMQFS10+///IP4btkcLM3sItdX9v4WNeESaNXOQSs=
X-Received: by 2002:a05:6102:3ec3:: with SMTP id
 n3mr9762236vsv.48.1635485338588; 
 Thu, 28 Oct 2021 22:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhs-H8HoO7dsfiTFaTRie1-DB-DF5st-gFmS=AF2tfHP_gsVw@mail.gmail.com>
 <20211028204756.GA293663@bhelgaas>
In-Reply-To: <20211028204756.GA293663@bhelgaas>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 29 Oct 2021 07:28:47 +0200
Message-ID: <CAMhs-H_a0PqATB3kFO3dcFiq+reR+5z7FW27M=m2MnnYA48NYw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211028_222902_522751_D2B1F811 
X-CRM114-Status: GOOD (  37.94  )
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

On Thu, Oct 28, 2021 at 10:47 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Thu, Oct 28, 2021 at 11:59:17AM +0200, Sergio Paracuellos wrote:
> > On Thu, Oct 28, 2021 at 11:34 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > > On Thu, Oct 28, 2021 at 11:24 AM Thomas Bogendoerfer
> > > <tsbogend@alpha.franken.de> wrote:
> > > > On Thu, Oct 28, 2021 at 06:11:18AM +0200, Sergio Paracuellos wrote:
> > > > > On Thu, Oct 28, 2021 at 6:05 AM Yanteng Si <siyanteng01@gmail.com> wrote:
> > > > > >
> > > > > > Since commit 2bdd5238e756 ("PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver")
> > > > > > the MT7621 PCIe host controller driver is built as a module but modpost complains once these
> > > > > > drivers become modules.
> > > > > >
> > > > > > ERROR: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > ERROR: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > ERROR: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > ERROR: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > > ERROR: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > > >
> > > > > > Let's just export them.
> > > > > >
> > > > > > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > > > > > ---
> > > > > >  arch/mips/kernel/mips-cm.c  | 5 +++++
> > > > > >  arch/mips/kernel/mips-cpc.c | 1 +
> > > > > >  2 files changed, 6 insertions(+)
> > > > > >
> > > > >
> > > > > Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > >
> > > > could we instead make the pcie-mt761 driver non modular ? Exporting
> > > > all MIPS specific stuff for just making an essential driver modular
> > > > doesn't IMHO make much sense.
> > >
> > > The driver is modular because I have been advised other times that new
> > > drivers should be able to be compiled as modules and we should avoid
> > > using 'bool' in Kconfig for new drivers. That's the only reason. I am
> > > also always including as 'y' the driver since for me not having pci in
> > > my boards has no sense... I am ok in changing Kconfig to be 'bool'
> > > instead of 'tristate', but I don't know what should be the correct
> > > thing to do in this case. Thoughts?
> >
> > I guess we also want the driver to at least be compile tested in
> > 'allmodconfig' and other similars...15692a80d949
>
> Sounds like the systems that actually use this driver require it to be
> built-in, and the only benefit of exporting these symbols is that we
> would get better compile test coverage.
>
> If that's the case, I agree that it's better to just make it
> non-modular.

I agree and that was my reasoning for sending a patch to also convert
to bool the phy driver that this PCIe controller uses. When the pull
request was sent from Vinod to Greg, Greg refused to take it because
of that commit and the commit was reverted and a new pull request was
sent including this revert. This is commit 15692a80d949 ("phy: Revert
"phy: ralink: Kconfig: convert mt7621-pci-phy into 'bool'""). Because
of this I also changed the PCIe controller Kconfig from bool to
tristate when I sent v3 of the series which at the end were the ones
that was finally taken. There are also other ralink related symbols
that have been exported to allow to compile other drivers as a
modules, like the watchdog. See the commit fef532ea0cd8 ("MIPS:
ralink: export rt_sysc_membase for rt2880_wdt.c"). So, as I said, I
agree and I am using the driver as if it were a bool and also ralink
systems normally require all drivers built-in, but I think we have to
take into account also the "historical facts" here. In any case,
Bjorn, let me know if you want me to send whatever patch might be
needed.

Best regards,
    Sergio Paracuellos

>
> Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
