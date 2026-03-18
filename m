Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82010103E176
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 13:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a38AgtgrSL45qQSDWrOkOi7hxNfM+B9cZh1RZkzmCEM=; b=E0Gj2tNAMa++4t9fgrwz2NzPuz
	hYKZIMz1v29N39ZyJztlmc97vfevCBuKYLSLIL1Ms6ILJK+Zy3sRS6rUu9qzSN8TmDgAarWCUzso2
	TuxS8GVXWr5JLmIjcJdEEl2CL7I/0GaZirEdGVkGpprGBFSiUW78vkINnzG9v27mdrNzYpnLgr6Ez
	XuQw9SE+X3sjr/+r7Vd8vp/Y1NKrf8zYihfAOZ3Kpi4NbJrrT8y82zSObUqzgHo3gkjDSg6ct8Ydu
	SPUIICKz5VHyGyxkEF0FVPSnPtI8SHTisLrYtJXNPPSRqpuhQYusVBrawg9tzHOr6vLMHtbOSf5Zb
	pR9zhmww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qhp-00000008SKU-1qL2;
	Wed, 18 Mar 2026 13:13:01 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qhn-00000008SJz-10n3
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 13:13:00 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35b97ed057cso2208290a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773839578; x=1774444378; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a38AgtgrSL45qQSDWrOkOi7hxNfM+B9cZh1RZkzmCEM=;
        b=Bcc/tzRQf20H2JApn3idCESAQINQM0yPUQu0npgG8r4Rx5n/7zcoXwdth69DfZc/Gg
         mXeeLJKdCUesrkohUOTr2lwMaOUa68/h362CuBLJo2fpZpGjBFjONmyV6Ec3erooVqoC
         3vhM28AFPOzu1BKbRvv+sj6zxJi5n3asIFV0laYHI/MLnuClaNtGVCKCXrJC6LAQOCTs
         di8IRi99TD5+Rib/CPPdx1wuQoSk0fkljdFihVe5Yv18sA7FYIXnBJJJx9fcvh0Mxwhs
         HC/5Z6Yr5QMrjfOT2Zogx+NDJJk5u4WN7QOZrPrWrxtZUjDt1PNrb2QwNki7OT8KYXgg
         WMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839578; x=1774444378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a38AgtgrSL45qQSDWrOkOi7hxNfM+B9cZh1RZkzmCEM=;
        b=GxhnLV27z+W6Sx+jOBhHEtnr8YVfcmQoshLtVdVlXBqr9M3uEdiCoKsK2JVo+uqf+u
         qYcRGtxK+EsA+MgsoFrJLYXVtancDcB/lojb3S8HTlggb6kfgG2OC7vfLyIIviAz7fME
         Y/GqIYcou3bN8TlQamDyIC8RPyjM3qlm5gPktugLnRmtnpa9dG4qpOKYC2NAqUVw/r8z
         x71XfbZ7VT/eqfp0V0AUgxMAD58Fk7x0Ij2GcCEK8EoxmLVBgyr7dga+RJuRRtTpi9YL
         BglqnvI3msBXVxqlMXPjVW5yqeNlzKBWdzC9c7UyipyHBXltYx9t036QlIiMUSSK5KAo
         GItQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSkM2ts9aVOHRcPJC/41HBhmanyvoVm5A6H8bbXmFwL24Tdp7aUYjA0mpBhnJ2EGtRtHbcIKtL4tvD/mi8ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4tMcY30EGjVm8rPxurYAMVvVqmy8FksrGqBAEQqoEA79rfzTO
	z2ow/G1IWuZ/T+pnPKwLxWdFt65oEuFCLeIxEb7Wo2m3aRa8RLN/xA4d
X-Gm-Gg: ATEYQzwDT3iryhakEuip5KhVvK68hb/MRUnf9QuJAC/3QzR3Sx8aeQ1URY4+HAuAHfF
	VciZ2U3djPGThKjTEojAgPmVv0Y7NPHclWad0Mwvcz6uZ61fotdp2IiSKIuoYggii1aSxqAE7sY
	CkRbpKfNFMsCffZooMVslAEpILunnLrBSLpTZClxx7H4e1vgsvxggHCRLi7fno0gr47YstxklFE
	qslrVFheeq+OiA88NGh1VIcng+FyLkmM4dQCiJjtILn+TOrUXbnmVmjCMTGuIUbn7zj2CVfs1LM
	m31oyYTIR/aSSLf4Qyrslui1vQ26bOcA8k1xEX8Mo5T9JWvdlHkk5DSkhznIhRACJWGXuhtsdwc
	AuLpQBqAbXsL+2shxJnfxgeoQpASQJRD7OWMO5fPxKL5GDe/nGRnkcUaY9QUdxkl7SPfpecclGj
	+Gpc3TmD+PtmKCSZE6gTaP2WlghGvDZIrYdH5voSo=
X-Received: by 2002:a17:90b:1d52:b0:35b:982a:28c7 with SMTP id 98e67ed59e1d1-35bb9e3cf19mr3027930a91.5.1773839578116;
        Wed, 18 Mar 2026 06:12:58 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada5c760sm6280105a91.5.2026.03.18.06.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:12:57 -0700 (PDT)
Date: Wed, 18 Mar 2026 17:12:49 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Caleb James DeLisle <cjd@cjdns.fr>,
	linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	ryder.lee@mediatek.com, bhelgaas@google.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] PCI: Skip bridge window reads when window is not
 supported
Message-ID: <abqk0VUyLF+iqVXw@DESKTOP-TIT0J8O.localdomain>
References: <20260316155157.679533-4-cjd@cjdns.fr>
 <20260317212908.GA109023@bhelgaas>
 <abpFjQJ5RNcbzbmz@DESKTOP-TIT0J8O.localdomain>
 <fc927b7f-a820-d3c2-581c-ab6db562bcfb@linux.intel.com>
 <2d47f78f-22cf-78c8-8312-3ffb095d2693@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d47f78f-22cf-78c8-8312-3ffb095d2693@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_061259_286823_E81F1FD0 
X-CRM114-Status: GOOD (  37.99  )
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

On Wed, Mar 18, 2026 at 02:18:22PM +0200, Ilpo Järvinen wrote:
> On Wed, 18 Mar 2026, Ilpo Järvinen wrote:
> 
> > On Wed, 18 Mar 2026, Ahmed Naseef wrote:
> > 
> > > On Tue, Mar 17, 2026 at 04:29:08PM -0500, Bjorn Helgaas wrote:
> > > > On Mon, Mar 16, 2026 at 03:51:57PM +0000, Caleb James DeLisle wrote:
> > > > > pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
> > > > > registers unconditionally. If the registers are hardwired to zero
> > > > > (not implemented), both base and limit will be 0. Since (0 <= 0) is
> > > > > true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
> > > > > gets created.
> > > > > 
> > > > > pci_read_bridge_windows() already detects unsupported windows by
> > > > > testing register writability and sets io_window/pref_window flags
> > > > > accordingly. Check these flags at the start of pci_read_bridge_io()
> > > > > and pci_read_bridge_mmio_pref() to skip reading registers when the
> > > > > window is not supported.
> > > > 
> > > > The fundamental problem here is that assigned space to a bridge window
> > > > that isn't implemented.  I wish we understood the connection between
> > > > this "read window" path and the assignment path.
> > > > 
> > > > Maybe this patch fixes it because we enter pci_read_bridge_mmio_pref()
> > > > with res->flags being NULL, and we set IORESOURCE_MEM |
> > > > IORESOURCE_PREFETCH again, which makes it look like we can assign
> > > > space for it?
> > > 
> > > Yes, that's exactly right.
> > > 
> > > > 
> > > > If that's the case, I think it would improve the commit log to mention
> > > > the actual mechanism by which we avoid assigning space.
> > > > 
> > > 
> > > How about this:
> > > 
> > >   pci_read_bridge_io() and pci_read_bridge_mmio_pref() read
> > >   bridge window registers unconditionally. If the registers
> > >   are hardwired to zero (not implemented), both base and limit
> > >   will be 0. Since (0 <= 0) is true, these functions set
> > >   IORESOURCE_IO or IORESOURCE_MEM | IORESOURCE_PREFETCH on
> > >   the bridge resource. This causes the allocator to assign
> > >   space for the window even though the hardware can't
> > >   implement it.
> > > 
> > >   pci_read_bridge_windows() already detects unsupported windows
> > >   by testing register writability and sets io_window/pref_window
> > >   flags accordingly. Check these flags at the start of
> > >   pci_read_bridge_io() and pci_read_bridge_mmio_pref() to skip
> > >   reading registers when the window is not supported, so the
> > >   resource flags remain clear and the allocator does not assign
> > >   space for non-existent windows.
> > 
> > At least to me the proposed text reads much better than the original.
> > The original text required reading between the lines to connect the dots, 
> > whereas this new one clearly explains what causes what.
> 
> Hi again,
> 
> Reading the code I think the entire 0 <= 0 part is a red herring 
> when it comes to the current code, the flags are always set by the 
> functions!
> 
> The code would only add IORESOURCE_UNSET | IORESOURCE_DISABLED if the 
> base <= limit check fails but that's still wrong because it says to the 
> resource allocation code that it can enable that bridge window if it needs 
> to.
> 
> Prior to the commit 8278c6914306 ("PCI: Preserve bridge window resource 
> type flags") the base <= limit check did play some role (maybe the 
> original commit message was based on some older tree than the most current 
> one).

Thank you for catching that. We were testing on LTS kernel
6.12 (downstream OpenWrt) where the commit 8278c6914306
("PCI: Preserve bridge window resource type flags") is not
present . In that tree the flags are still only set inside
the base <= limit check, which is why the commit message
focused on that path.
  
For current mainline, how about this for the commit message:

  pci_read_bridge_io() and pci_read_bridge_mmio_pref()
  unconditionally set resource type flags (IORESOURCE_IO
  or IORESOURCE_MEM | IORESOURCE_PREFETCH) when reading
  bridge window registers. For windows that are not
  implemented in hardware, this causes the allocator to
  assign space for a window that doesn't exist.

  pci_read_bridge_windows() already detects unsupported
  windows by testing register writability and sets
  io_window/pref_window flags accordingly. Check these
  flags at the start of pci_read_bridge_io() and
  pci_read_bridge_mmio_pref() to skip them entirely when
  the window is not supported, so the resource flags
  remain clear and the allocator does not assign space
  for non-existent windows.


Ahmed Naseef

> 
> -- 
>  i.


