Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52578C02196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Feb 2025 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzj9WiLIhOB5vMReFD5p6XHQD8Hfc0IzZaAIE1EbWG4=; b=IgvkMKTGjXi5T5C+RKjCn2Lglo
	4sKC3vMq6s5k6KdRGvLxxK5m9XhuwxEo6HxFkw66lVIJy4C0TnTpgk2rThOjIXRmtT9ET8GsoHRJ1
	6zCzEKiuMAtXEA0uLrMQgESipHuSf9nkokutwKWHgtY3CSXROh487jJ7FYrHeqhniqPgEkD4hL/Dp
	aVhBLmJGZFBQg33pFf9sGtbSFiAn/Dua4uAKzL0RoaNC+DpqWiwFuY0QneRbFfLn9w+94Y29FtF3T
	Tj7Rmg5AZszX2tur407g3sOPMdHEa0MX5qMxwB+HgAh1iTp8w68wyddRoBsoJUab+8kPLw5OgUwUA
	jjEQ6K0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0bp-0000000GBEY-1fxO;
	Mon, 03 Feb 2025 17:51:45 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0b3-0000000GB66-3bcd
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Feb 2025 17:50:59 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2161eb95317so81111475ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Feb 2025 09:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738605057; x=1739209857; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mzj9WiLIhOB5vMReFD5p6XHQD8Hfc0IzZaAIE1EbWG4=;
        b=J3+UWB66WDtpbMCxmckl98RJKeA4Gi/FVEuhYzsme+dBXHjFtM40LFA3mh+0frlpg8
         mU5G1tADjmGy+kTjIufPCh82bgw0xLGvYrv909+KRpMrlYvaPBgjfbOoYovJAbVksge4
         zgdeLNwmDNzBg5ltX7i9RV11niDWKzpuwMC//8Qq4kKvBPNvwnF1j6IgGu+i5GAmERGD
         8L0BmvvSIxKDIcMbI9CW5SIJXu9UYT4VMdd5zygCVYTN1sNaDzzFci86djAZvaqIBF28
         JScLY80w62nW3kzMgHSLrluMFyjwVAs6IgBD5ZErU8ZYYGS7UZakfGiShSAx364Rpl0T
         c2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738605057; x=1739209857;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzj9WiLIhOB5vMReFD5p6XHQD8Hfc0IzZaAIE1EbWG4=;
        b=izqjNdcPAfz9l3oZmn7iDetKrYNCPsJHg808xdLCMAvMqPYqlFd2Naj3mjN7k94hhc
         FcD9bI4E7kUA6XDMkPUU2r9zgj7VyhZAf6FSX2PzbcGcrnh+dR0Iyfed9LbQn0XOPKAl
         f3ZGLYbHEEMOlyDnKGNEYVvlUr/KH1duTg09Zxer4jhCpM36THOvCPKY0THIq+5m7fQu
         0LkAx39q53bNIqWoTWvRk5ZzbeW1c9eAmyr9I5n7mBW+FdbbNFwk63SpkVPvaenczLIY
         w3LcKz4PXlme9k/pYqwpTLWnA4u9XXlTBDechaIYqREbZ4aJQOg5Miv5PWeJnTeQhXti
         z1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUThe1Ltm4jrRMbqe2WhmMZeGRVJvOhmWM4Fe5Z6mmdT2ncwTDW8vZxJig2orU2L/gZL3Ss197eIryLLjU3wg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLA5ntRhgqIploFy+6yRsEqZm1M+0Cmre6AoAcO7Z8sEtVWQUB
	Uyl6SKpIBONQmllGf8Cv45i2E6b10+GC6UW2Ty7VvI+adwd9v8B7of1M0y0bAA==
X-Gm-Gg: ASbGncvh0rUFtwY196bNfrpbUTczPLQoauBFzFasc1qJ7qI/HCic7rOGLV7kQ4JzJjn
	O5FqkaNlR0SfIEm9mQ6ghqA95wuJ6LqPl+82wI7iY2m6i80mUhRG8oTBBRyLKtjnwLVVk8vxnw2
	pk8sefgIZYbhDFc9e6/DGsrzqyMOZrZ+Qcw069z5DuXqDA2qquWXA4xDIYhTYLLzfNaN28dE2Zk
	X3i0XWfyLa/hqbFLZotnbkWWTB0CtGcpHmH6kE1ZNVjJXqh6i+yTCAGownSX/C4RNYkYKza7XqE
	Hap8REAUb3c/aOmPM2pchAO2EA==
X-Google-Smtp-Source: AGHT+IELooHF0qMvKyeOA5tLJ+3Ezf8GfLZEZvxarJoUbgD+ShYJqVXPzWfrjpSpkcyIBau0pRT4fw==
X-Received: by 2002:a17:903:2a85:b0:216:7ee9:2235 with SMTP id d9443c01a7336-21dd7dff6aemr371780435ad.43.1738605057004;
        Mon, 03 Feb 2025 09:50:57 -0800 (PST)
Received: from thinkpad ([120.60.129.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f03edsm79348895ad.45.2025.02.03.09.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:50:56 -0800 (PST)
Date: Mon, 3 Feb 2025 23:20:49 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Remove the usage of virt_to_phys
Message-ID: <20250203175049.idxegqqsfwf4dmvq@thinkpad>
References: <20250201162416.azp4slqqeabo2xyl@thinkpad>
 <20250201170740.GA731664@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250201170740.GA731664@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_095057_905731_7DC6A07D 
X-CRM114-Status: GOOD (  31.31  )
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

On Sat, Feb 01, 2025 at 11:07:40AM -0600, Bjorn Helgaas wrote:
> On Sat, Feb 01, 2025 at 09:54:16PM +0530, manivannan.sadhasivam@linaro.org wrote:
> > On Mon, Jan 27, 2025 at 06:41:50PM -0600, Bjorn Helgaas wrote:
> > > On Thu, Jan 23, 2025 at 08:11:19AM +0000, Jianjun Wang (王建军) wrote:
> > > > On Wed, 2025-01-15 at 23:01 +0530, Manivannan Sadhasivam wrote:
> > > > > On Tue, Jan 07, 2025 at 01:20:58PM +0800, Jianjun Wang wrote:
> > > > > > Remove the usage of virt_to_phys, as it will cause sparse warnings
> > > > > > when
> > > > > > building on some platforms.
> 
> > > > > >       snprintf(name, sizeof(name), "port%d", slot);
> > > > > > -     port->base = devm_platform_ioremap_resource_byname(pdev,
> > > > > > name);
> > > > > > +     regs = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > > > > name);
> > > > > > +     if (!regs)
> > > > > > +             return -EINVAL;
> > > > > > +
> > > > > > +     port->base = devm_ioremap_resource(dev, regs);
> > > > > >       if (IS_ERR(port->base)) {
> > > > > >               dev_err(dev, "failed to map port%d base\n", slot);
> > > > > >               return PTR_ERR(port->base);
> > > > > >       }
> > > > > > 
> > > > > > +     port->msg_addr = regs->start + PCIE_MSI_VECTOR;
> > > 
> > > I think this still assumes that a CPU physical address
> > > (regs->start) is the same as the PCI bus address used for MSI, so
> > > this doesn't seem like the right solution to me.
> > > 
> > > Apparently they happen to be the same on this platform because (I
> > > assume) MSIs actually do work, but it's not a good pattern for
> > > drivers to copy.  I think what we really need is a dma_addr_t, and
> > > I think there are one or two PCI controller drivers that do that.
> > 
> > I don't see why we would need 'dma_addr_t' here. The MSI address is
> > a static physical address on this platform and that is not a DMA
> > address. Other drivers can *only* copy this pattern if they also
> > have the physical address allocated for MSI.
> 
> Isn't an MSI on PCI just a DMA write to a certain address?

That's from the endpoint prespective when it triggers MSI.

> My
> assumption is that if you put an analyzer on that link, an MSI from a
> device would be structurally indistinguishable from a DMA write from
> the device.  The MSI uses a different address, but doesn't it use the
> same size and kind of address, at least from the PCIe protocol
> perspective?
> 

Yeah, but in this case the address allocated to MSI belongs to a hardcoded
region in the host memory (not allocated by the DMA APIs which will have the
region attributed as DMA capable). So it doesn't belong to the DMA domain, and
we cannot use 'dma_addr_t'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

