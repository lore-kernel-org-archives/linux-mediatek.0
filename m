Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6128C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 09:59:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60141610D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 09:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60141610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLeAkrFHF1lGttbs2F/ulFyzFna/HjaixsqQeiTaLyI=; b=0m+NlGxNYcCRgu
	Wg1qx+vSgsARqqEoHchufSyNWO31eeea9lIDBkNeUBdcL7lOgUrfe3m5qzuBuO9q8tCeStT3n1g84
	k0eRlKhOcMPZWJMGMP9BtWQrFpErjJgKGNSGU8Z4/NJKdelumqnTRuftjt+VHurrJYRhzJQllsKri
	lYeClHM3CvKDHKzO9z0rPV4ownW21xHYASxf7yn1DwCoErQzJqSKTkDWfJLiQJEQjCXEvDuLnxfm4
	Dnu9+FYG2jBn0x69yqQ8MuYFd7VNOeYGPYntrTOfHo2LEwM/YoXV62FVi0bmuS+BTFDBtAbjsuOkS
	NcPeGdWpXoC0JlqWIDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg2CE-007SNU-Bs; Thu, 28 Oct 2021 09:59:42 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg2C1-007SLR-LJ; Thu, 28 Oct 2021 09:59:31 +0000
Received: by mail-ua1-x934.google.com with SMTP id z22so8053835uaq.12;
 Thu, 28 Oct 2021 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HGGQ7RqFpKeC9CxBW+k8kpLsGeNQocDgaLhurL7DcEI=;
 b=WizV7VgtkLy3fe2e0o1pfzbFecHihzXI0Id4xUaMYbtMTOAMqXIFLdyS9M2duUuMz3
 r4sFwt/CYjnK4bgu+1DyEQBwyR7Q70aPYhsqJjPF996z3shUdkBl967YF0ymWY+a448g
 RTpxrT300XgMMtmHX6u+JD3WXsmClh4yO8nD24YFkfG5hM9kBja7+RxxEAHj7KT+s3in
 OYXDsbbCrU723hxPx87IcrPx+np95xU3p5LQWXav9tDIgrBgEPuXZ2+tr8maaJwA2H51
 q9DJ/uCnkinwqQzQ+hi9u5xE13GOCSClyqmv5hLl+X8gb6qnnZB59b1sNvh6/EGc+1+C
 oNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HGGQ7RqFpKeC9CxBW+k8kpLsGeNQocDgaLhurL7DcEI=;
 b=R5j24FlEN4t79E5hUKH3rf2ek5ePJAZvuk0r22QBArCle0Bof6bscd3NiiUnCzYe41
 DZcLgZ2vGfAUF/1XlAGP0iZsos3IwJzymEaVnTJyMnOh/hRI/KYcMTjZVsugRQ2k/han
 48lqoqsvCfluBM5UIWa6ywVNeQYIAVmQbZjTpDAwBASk37t/uL7w3sSNAzqTJS6eZf1F
 jNIzqonC8SySx24sinHpxVSVT46oy1WT1fP456UauZ7moBgNIqUZv60Bs4xngKDjjOaL
 qxP9NvzkXWelChy0dinZI80Naf/lr3NkaTcTQ/SEED5b1aNjhNRyNRBLv874EmLl8MVC
 wTIw==
X-Gm-Message-State: AOAM531N1iFMhChXxpuuQSmaIm/b1nbvlNmqx7sDkG0Zwi+MPZDA1d3d
 cLV41adp0dgPbQ2IOwqgatO8nq9x8CiYcxb9nVE=
X-Google-Smtp-Source: ABdhPJzrE18emHRymB8uKvYxaQU2LsVWX8ihdn4v4ExoK4X3tzhQ0bdB6x4Z47vqjrm3sGQ67yZI4DOVVN9myD89gWE=
X-Received: by 2002:ab0:3cab:: with SMTP id a43mr3208667uax.98.1635415168662; 
 Thu, 28 Oct 2021 02:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635390750.git.siyanteng@loongson.cn>
 <112fea0c8c1b65a762ac98412216239160721263.1635390750.git.siyanteng@loongson.cn>
 <CAMhs-H9LUQ6Km=sA992LH=+E0MbGuMf9YhM6w2HoyeqE0QbzJQ@mail.gmail.com>
 <20211028092318.GA6574@alpha.franken.de>
 <CAMhs-H_m=pz4jU_cY-A6PRjR3OYy2zKH0=HN=vFDF2XOk60xBg@mail.gmail.com>
In-Reply-To: <CAMhs-H_m=pz4jU_cY-A6PRjR3OYy2zKH0=HN=vFDF2XOk60xBg@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 28 Oct 2021 11:59:17 +0200
Message-ID: <CAMhs-H8HoO7dsfiTFaTRie1-DB-DF5st-gFmS=AF2tfHP_gsVw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211028_025929_745334_C447C231 
X-CRM114-Status: GOOD (  27.12  )
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

On Thu, Oct 28, 2021 at 11:34 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi Thomas,
>
> On Thu, Oct 28, 2021 at 11:24 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Thu, Oct 28, 2021 at 06:11:18AM +0200, Sergio Paracuellos wrote:
> > > On Thu, Oct 28, 2021 at 6:05 AM Yanteng Si <siyanteng01@gmail.com> wrote:
> > > >
> > > > Since commit 2bdd5238e756 ("PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver")
> > > > the MT7621 PCIe host controller driver is built as a module but modpost complains once these
> > > > drivers become modules.
> > > >
> > > > ERROR: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > ERROR: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > ERROR: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > ERROR: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > > ERROR: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
> > > >
> > > > Let's just export them.
> > > >
> > > > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > > > ---
> > > >  arch/mips/kernel/mips-cm.c  | 5 +++++
> > > >  arch/mips/kernel/mips-cpc.c | 1 +
> > > >  2 files changed, 6 insertions(+)
> > > >
> > >
> > > Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >
> > could we instead make the pcie-mt761 driver non modular ? Exporting
> > all MIPS specific stuff for just making an essential driver modular
> > doesn't IMHO make much sense.
>
> The driver is modular because I have been advised other times that new
> drivers should be able to be compiled as modules and we should avoid
> using 'bool' in Kconfig for new drivers. That's the only reason. I am
> also always including as 'y' the driver since for me not having pci in
> my boards has no sense... I am ok in changing Kconfig to be 'bool'
> instead of 'tristate', but I don't know what should be the correct
> thing to do in this case. Thoughts?

I guess we also want the driver to at least be compile tested in
'allmodconfig' and other similars...

>
> Best regards,
>     Sergio Paracuellos
>
> >
> > Thomas.
> >
> > --
> > Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> > good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
