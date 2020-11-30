Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C347C64E7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 17:33:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE36C22245
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 17:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nvC6BSLH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRonN+ux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE36C22245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=fRD0+9zJtn9gtlLaa+piGPqxYXsKHwjhpYPF4b//iFU=; b=nvC6BSLHKgWD5bSFt8yZ6D6Cz
	FOZaZp9hPcz+mGCNIalrB4BD0ulMf/eyF+qsSMpISWTsOvU8ADwxAVaHyLA7NVAPw1HWncd3tXg7o
	PxPGtUzDYATbq7UGoNJQB7L6y7lk0DE/PEGsgwSxFv9W6uhRIB5r7TBRjHgYe/j6xH2LBSIThQ+q0
	tRe6wZz7dJiB27FX6G7N4iTgRvIKdYrEcf2BOh5zjTJaKR7NIO4X/IRUHu3jSatiuZjzagDZwjSPB
	SnZHBfrqrtuBrf9zpf3+paA3WZ5g6R5IBW7cokU0xvqUoyyCVmfkR0qLRvXofJyrFI/QuAYc3N2BI
	pCirIMDxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjn3B-0002W3-S5; Mon, 30 Nov 2020 17:33:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjn36-0002Us-M8; Mon, 30 Nov 2020 17:33:17 +0000
Received: from localhost (129.sub-72-107-112.myvzw.com [72.107.112.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F5B72073C;
 Mon, 30 Nov 2020 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606757595;
 bh=ikmfcl+yhfQteajZFhY92J11QDZZNVTvlzcz3vXjLSQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=IRonN+uxEObiBxewJ3FtCeERf5C5Vssf2HsanHgq5cN7IowTUyfHIjn5T7mK+xoUn
 dKVP6gDQ6WQLOjsPYiIPJixrBUsWHF48Ipky+v77OJJH56Hh6ditWIh14iGC9HqAcP
 cAOiVssfWIISuNor3mDTMltNPmys0uvjIBeLtGFw=
Date: Mon, 30 Nov 2020 11:33:13 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [v4,2/3] PCI: mediatek: Add new generation controller support
Message-ID: <20201130173313.GA1089760@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLdqCE-sVb8T6p2E5Zf1b3pvPBtapZ8dsQGFDW3GsArjQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_123316_849572_B33F8F35 
X-CRM114-Status: GOOD (  30.15  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Youlin Pei <youlin.pei@mediatek.com>, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, qizhong.cheng@mediatek.com,
 Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 PCI <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sj Huang <sj.huang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 sin_jieyang@mediatek.com, David Miller <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 30, 2020 at 09:05:48AM -0700, Rob Herring wrote:
> On Sun, Nov 22, 2020 at 11:45 PM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> > On Thu, 2020-11-19 at 14:28 -0600, Bjorn Helgaas wrote:
> > > "Add new generation" really contains no information.  And "mediatek"
> > > is already used for the pcie-mediatek.c driver, so we should have a
> > > new tag for this new driver.  Include useful information in the
> > > subject, e.g.,
> > >
> > >   PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192

> > > > +   writel(PCIE_CFG_HEADER_FORCE_BE(devfn, bus->number, bytes),
> > > > +          port->base + PCIE_CFGNUM_REG);
> > > > +
> > > > +   *val = readl(port->base + PCIE_CFG_OFFSET_ADDR + (where & ~0x3));
> > >
> > > These look like they need to be atomic, since you need a writel()
> > > followed by a readl().
> > >
> > > pci_lock_config() (used in pci_bus_read_config_*(), etc) uses the
> > > global pci_lock for this unless CONFIG_PCI_LOCKLESS_CONFIG is set.
> > >
> > > But I would like to eventually move away from this implicit dependency
> > > on pci_lock.  If you need to make this atomic, can you add the
> > > explicit locking here, so there's a clear connection between the lock
> > > and the things it protects?
> >
> > Sure, I will split it to a map_bus() function and use the standard
> > pci_generic_config_read32/write32 functions as Rob's suggestion. I think
> > the potential risks of atomic read/write can be avoided.
> 
> The generic functions have no effect on atomicity, but using them does
> make it easier to find the non-atomic cases.
> 
> I'm not sure that having host drivers do their own locking is the best
> approach. That's a recipe for more cleanups. It's a common enough
> issue that I think it's better if we have locking done in 1 place.
> Then host drivers can simply say if they need locking or not via some
> bus flag.

Yeah, you may be right.  I guess we don't have to make it an issue for
this patch; we do have pci_lock that protects this, whether the
write/read occurs in the driver or in
pci_generic_config_read32/write32.

Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
