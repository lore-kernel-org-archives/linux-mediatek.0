Return-Path: <SRS0=DTTl=YY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD86CA9EC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 10:09:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1781F2086D
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 10:09:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L3GPjrfO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1781F2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ct7Nef3i9aJIw3zGLBzdjYdJrIW+q93PUn2U0BM4DRU=; b=L3GPjrfOpkEel6
	eN6r2sk5cgPogEFerAM13Regzje7tr/cKFsLFFKTp3/PpLIwwRD87ES3ZlMcSZtZvgV7fje95fTmd
	atslRFQsDe/X9wXr5VYXphVYXoTtkyhaHEGE9NKjw9dq+4br6PKIvKtq2ecV3FD1xrenyUbKukQVz
	tlUve5qG7l4ZotVzCERWB+lylduojhJDvCmaHSgH1N0zt2jDaYink631FLd7YIVcqi3ihWx7cNJl3
	7I89NbgNfNj2nlOV9YLJpAJoAvGSycWLkr28Q7z/oiDSn4xwjQvLlu9aW7w63Yb1xUhoFeEVJ1fCX
	4uUGl2sZXTLk1ri1Gprw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ7Ov-0003zt-Tu; Thu, 31 Oct 2019 10:09:58 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ7Oh-0003oR-8F; Thu, 31 Oct 2019 10:09:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F2791F1;
 Thu, 31 Oct 2019 03:09:42 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (unknown [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF1E03F719;
 Thu, 31 Oct 2019 03:09:38 -0700 (PDT)
Date: Thu, 31 Oct 2019 10:09:36 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 19/25] PCI: of: Add inbound resource parsing to helpers
Message-ID: <20191031100936.GB22203@e121166-lin.cambridge.arm.com>
References: <20191028163256.8004-1-robh@kernel.org>
 <20191028163256.8004-20-robh@kernel.org>
 <20191029110751.GB27171@e121166-lin.cambridge.arm.com>
 <CABe79T7LPi-XvzARVh-_oVnv1Dr=Uzztps-W2vTr_7gSeiPFQg@mail.gmail.com>
 <20191029173406.GA25104@e121166-lin.cambridge.arm.com>
 <CABe79T5Cd30jFfTr1RRsMZ85sohwk64ZW1qb_LGHvns90WBpGw@mail.gmail.com>
 <20191030114839.GA16067@e121166-lin.cambridge.arm.com>
 <e5d2af18-0263-df56-7586-b0d31143a7e4@arm.com>
 <20191030145621.GA29602@e121166-lin.cambridge.arm.com>
 <CAL_Jsq+9U3E7hQsg0yqJqMJrcZ2n4UfK_es+5-4qg=VCSHiL5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+9U3E7hQsg0yqJqMJrcZ2n4UfK_es+5-4qg=VCSHiL5g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_030943_381863_A6C7A703 
X-CRM114-Status: GOOD (  24.73  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 PCI <linux-pci@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Michal Simek <michal.simek@xilinx.com>,
 Christoph Hellwig <hch@infradead.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Simon Horman <horms@verge.net.au>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 rfi@lists.rocketboards.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, Tom Joseph <tjoseph@cadence.com>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 30, 2019 at 05:18:25PM -0500, Rob Herring wrote:
> On Wed, Oct 30, 2019 at 9:56 AM Lorenzo Pieralisi
> <lorenzo.pieralisi@arm.com> wrote:
> >
> > On Wed, Oct 30, 2019 at 12:49:59PM +0000, Robin Murphy wrote:
> > > On 30/10/2019 11:48, Lorenzo Pieralisi wrote:
> > > > [+Cc Robin]
> > > >
> > > > On Wed, Oct 30, 2019 at 12:14:54PM +0530, Srinath Mannam wrote:
> > > > > Hi Lorenzo,
> > > > >
> > > > > Thanks for the details.
> > > > > Based on Robin's comment in the old patch, I thought dma_ranges list
> > > > > will be in sorted order.
> > > > > https://lore.kernel.org/lkml/741a4210-251c-9c00-d4a7-bc7ebf8cd57b@arm.com/
> > > > >
> > > > > Now, another patch is required to sort the list before reserving in
> > > > > iova_reserve_pci_windows() function.
> > > > >
> > > > > Regards,
> > > > > Srinath.
> > > >
> > > > Don't top-post please.
> > > >
> > > > https://en.wikipedia.org/wiki/Posting_style#Top-posting
> > > >
> > > > Yes, the dma_ranges list must be sorted somehow I reckon
> > > > iova_reserve_pci_windows() is where it should be done (since that's
> > > > where the requirement is) or it can be done in
> > > > devm_of_pci_get_host_bridge_resources().
> > > >
> > > > Thoughts ?
> > >
> > > Right, strictly it's only iova_reserve_pci_windows() that needs the list
> > > sorted, it just worked out that maintaining the list in sorted order by
> > > construction took a fair bit less code than explicitly sorting it. In terms
> > > of preserving that behaviour in a slightly more generalised fashion I
> > > suppose we could add something like:
> > >
> > > void pci_add_resource_offset_sorted(struct list_head *resources,
> > >                               struct resource *res,
> > >                               resource_size_t offset)
> > > {
> > >       struct resource_entry *entry;
> > >
> > >       resource_list_for_each_entry(entry, resources)
> > >               if (entry->res.start > res.start)
> > >                       break;
> > >
> > >       pci_add_resource_offset(&entry->node, res, offset);
> > > }
> > >
> > > but if you'd rather add a specific resource_list_sort() or even just
> > > open-code it in iommu-dma, I don't have any real preference. The "least code
> > > necessary" approach definitely made sense when individual drivers were
> > > expected to build their own lists, but once it gets generalised then having
> > > a sensible and robust API becomes a more important consideration.
> >
> > I think that open coding it in iommu-dma is fine, @RobH would you be
> > able to add this to the series please ? I think it should be added to
> > prevent any regressions, we can't rely on dma-ranges entries order in DT
> > files.
> 
> I don't think it's good to be modifying the list as a side effect of
> calling iova_reserve_pci_windows() and making a copy of it wouldn't be
> great either. So I'm just going to keep it sorted in
> devm_of_pci_get_host_bridge_resources().

Yes I thought about that - that's the most reasonable approach I think.

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
