Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F5B103E16B
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 12:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCkisNku7jacA3sMKNA8TP6UM6cI9dgUNCy1+eoMhe4=; b=ac+7YdJ5THVhMEDmlGUeL6KI5o
	zxBQrm5i2399yce0gTSxmcX5yiQYMvXoGDyKI2P+FzC4JhFs51HoGBL0RN//pjSIjgGwEXKgLbDJj
	2PYBtOx/wrbrQlCyhaR2BP/kU9342HYP+Zlr2Du2DpeNyaxvvmhkrcRr/OC9NsgFy8/HBCcyn+WPZ
	XQ6BEoTt8fUma/KbWsRARcGsChtBmn/CNBo+TEglfP0qKqJEQLio7juZlafeAKGtHU/AnzFXnplfP
	Y9xkw78b821DE5de6aU2wYJbMCiKS4d9YpS6BOhDqsY0DLKfRn9vC7EtWjHfVtDYqsiRmYumgUTOz
	VkGuzNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pr9-00000008NaI-29JK;
	Wed, 18 Mar 2026 12:18:35 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pr7-00000008NXr-0Xnw
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 12:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773836313; x=1805372313;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fKlAMln5+eXtPqBPuI/T7U2v223nK0zolTnYCh7Gbgk=;
  b=PwaOyCdlVCyUPTHjltH4PwPDoq6p+6MI/mLlaeZ5RO8k85pKwqlh8YUI
   YghQA66AxUKsXuMYSOYcPWWKBmyyX0Dek2HzZa0R4+kKHd1tRan6ZBdck
   JUULvHOhFkrdjs2PqVv/IzrUp3xExdRXTLVoJ2a+ZizMgDi2c2hlHFqS1
   BOa7I1TCHul3dPzLhjrWchB5/wu7oyy8s6zXkgGkrDu7UGtVCe+q86KRz
   aUjrlPVbydAMlUuSnwiSI2T2c9hpqU5N0y3TTqZKWr/vkVhp7p2tYm2FS
   lGDM8eIo50O5gYnmDdcgv+lP76gEVseR5vhVl5eJYNxnhM9wkNDMeqFUG
   w==;
X-CSE-ConnectionGUID: iRKYVMFVTICRMmnv3iONJg==
X-CSE-MsgGUID: 4oWZhOdoQtu0sLXWl6XfsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85965483"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="85965483"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 05:18:31 -0700
X-CSE-ConnectionGUID: P+Z6F1F5RT+Evho1irfuLQ==
X-CSE-MsgGUID: Ista6+2aT3yV+XUX6UohtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222822818"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.55])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 05:18:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 18 Mar 2026 14:18:22 +0200 (EET)
To: Ahmed Naseef <naseefkm@gmail.com>
cc: Bjorn Helgaas <helgaas@kernel.org>, Caleb James DeLisle <cjd@cjdns.fr>, 
    linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
    ryder.lee@mediatek.com, bhelgaas@google.com, lpieralisi@kernel.org, 
    kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
    krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
    angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
    linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] PCI: Skip bridge window reads when window is not
 supported
In-Reply-To: <fc927b7f-a820-d3c2-581c-ab6db562bcfb@linux.intel.com>
Message-ID: <2d47f78f-22cf-78c8-8312-3ffb095d2693@linux.intel.com>
References: <20260316155157.679533-4-cjd@cjdns.fr> <20260317212908.GA109023@bhelgaas> <abpFjQJ5RNcbzbmz@DESKTOP-TIT0J8O.localdomain> <fc927b7f-a820-d3c2-581c-ab6db562bcfb@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1311157423-1773836302=:971"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_051833_244540_02C40FB1 
X-CRM114-Status: GOOD (  30.01  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1311157423-1773836302=:971
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 18 Mar 2026, Ilpo J=E4rvinen wrote:

> On Wed, 18 Mar 2026, Ahmed Naseef wrote:
>=20
> > On Tue, Mar 17, 2026 at 04:29:08PM -0500, Bjorn Helgaas wrote:
> > > On Mon, Mar 16, 2026 at 03:51:57PM +0000, Caleb James DeLisle wrote:
> > > > pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge wi=
ndow
> > > > registers unconditionally. If the registers are hardwired to zero
> > > > (not implemented), both base and limit will be 0. Since (0 <=3D 0) =
is
> > > > true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0f=
ff]
> > > > gets created.
> > > >=20
> > > > pci_read_bridge_windows() already detects unsupported windows by
> > > > testing register writability and sets io_window/pref_window flags
> > > > accordingly. Check these flags at the start of pci_read_bridge_io()
> > > > and pci_read_bridge_mmio_pref() to skip reading registers when the
> > > > window is not supported.
> > >=20
> > > The fundamental problem here is that assigned space to a bridge windo=
w
> > > that isn't implemented.  I wish we understood the connection between
> > > this "read window" path and the assignment path.
> > >=20
> > > Maybe this patch fixes it because we enter pci_read_bridge_mmio_pref(=
)
> > > with res->flags being NULL, and we set IORESOURCE_MEM |
> > > IORESOURCE_PREFETCH again, which makes it look like we can assign
> > > space for it?
> >=20
> > Yes, that's exactly right.
> >=20
> > >=20
> > > If that's the case, I think it would improve the commit log to mentio=
n
> > > the actual mechanism by which we avoid assigning space.
> > >=20
> >=20
> > How about this:
> >=20
> >   pci_read_bridge_io() and pci_read_bridge_mmio_pref() read
> >   bridge window registers unconditionally. If the registers
> >   are hardwired to zero (not implemented), both base and limit
> >   will be 0. Since (0 <=3D 0) is true, these functions set
> >   IORESOURCE_IO or IORESOURCE_MEM | IORESOURCE_PREFETCH on
> >   the bridge resource. This causes the allocator to assign
> >   space for the window even though the hardware can't
> >   implement it.
> >=20
> >   pci_read_bridge_windows() already detects unsupported windows
> >   by testing register writability and sets io_window/pref_window
> >   flags accordingly. Check these flags at the start of
> >   pci_read_bridge_io() and pci_read_bridge_mmio_pref() to skip
> >   reading registers when the window is not supported, so the
> >   resource flags remain clear and the allocator does not assign
> >   space for non-existent windows.
>=20
> At least to me the proposed text reads much better than the original.
> The original text required reading between the lines to connect the dots,=
=20
> whereas this new one clearly explains what causes what.

Hi again,

Reading the code I think the entire 0 <=3D 0 part is a red herring=20
when it comes to the current code, the flags are always set by the=20
functions!

The code would only add IORESOURCE_UNSET | IORESOURCE_DISABLED if the=20
base <=3D limit check fails but that's still wrong because it says to the=
=20
resource allocation code that it can enable that bridge window if it needs=
=20
to.

Prior to the commit 8278c6914306 ("PCI: Preserve bridge window resource=20
type flags") the base <=3D limit check did play some role (maybe the=20
original commit message was based on some older tree than the most current=
=20
one).

--=20
 i.

--8323328-1311157423-1773836302=:971--

