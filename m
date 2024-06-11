Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257EAC27C65
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 17:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=jbzjBK29yPB8+QZYxG/DFsd36FLABiYwNRiHkKZQgK4=; b=KQm44PV49uBwLO
	EXe1jY6wlhhZsXhZjp8GwwJZX2LEtUfREaUM6QHabRZBmR2OqCebYBzWwe1MqZUZNOVE082GcN936
	aC7jkt1Goy9nkZ1IkZUbcjiY/2mB2m5BnMYx5moUNsCo3ZbRY9JSrEKdg+ebBSnrI8ynV03LvQhAZ
	zI7ovxlk1MwjDab4c1aUJRWD7LpzrDYkQMO6LzfGsly1jPCJB7KbuVIeHgSQqx6eZNsErdHaK7LxM
	nI72XkSaCtN4ei80EsSyzrxyQiqp0lo7WjC2DncoSfMFSMH5P/hu007+m87WUTncUuBtgN0uci3G/
	n+b3SClPaMv45MwURu9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5C2-00000009ePG-3hlx;
	Tue, 11 Jun 2024 17:21:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5Bz-00000009eNV-1ete;
	Tue, 11 Jun 2024 17:21:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34B3761090;
	Tue, 11 Jun 2024 17:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAB1C2BD10;
	Tue, 11 Jun 2024 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718126514;
	bh=Al6HONR3WVVBrk0Upd3B3HzomVEKxemyrAHy7G9ejOA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ca3NFRtd1Be+TG67Ym1YkrdBC58hIXQz0u6Ek04a2f3Qc9+Ft0yYHuDCFeHEZHjXN
	 XTg4mtOTNpxNg6DO2x3oSwsBmoDl+Yq9n87/BL25urTqIGI68duEeKAOPDuul0b7cu
	 M76+vU/rN6bWPVNvaAqZAsnbhnPS2DaeFyY+fZLjirdJUAdAv+D7bK2Mg2hBT0JSN6
	 h5RUfeClfDIAi7MOJMY/AIqiv0zt3h7rNbxTOQe+XtTa6LksGo28+vHHsLTbYchuT0
	 SCnrASccS4AzCUTIGPhwWfwaiK1JxfrFXgSYfmAYWiHJjs+WEbthHcqsD20gZw8g2j
	 yt0dI+Oq1l8qg==
Date: Tue, 11 Jun 2024 12:21:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jieyy.yang@mediatek.com,
	chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
	jian.yang@mediatek.com, jianguo.zhang@mediatek.com
Subject: Re: [PATCH v2 1/3] PCI: mediatek: Allocate MSI address with
 dmam_alloc_coherent()
Message-ID: <20240611172147.GA990220@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864ja2l2jd.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_102155_499436_02F29152 
X-CRM114-Status: GOOD (  17.52  )
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

On Sun, Jun 09, 2024 at 01:32:38PM +0100, Marc Zyngier wrote:
> On Sat, 08 Jun 2024 10:01:52 +0100,
> Manivannan Sadhasivam <mani@kernel.org> wrote:
> > 
> > On Mon, Dec 11, 2023 at 04:52:54PM +0800, Jianjun Wang wrote:
> > > Use dmam_alloc_coherent() to allocate the MSI address, instead of using
> > > virt_to_phys().
> > 
> > What is the reason for this change? So now PCIE_MSI_VECTOR becomes unused?
> 
> More importantly, this is yet another example of the DW reference
> driver nonsense, where memory is allocated for *MSI*, while the whole
> point of MSIs is that it is a write that doesn't target memory, making
> any form of RAM allocation absolutely pointless.
> 
> This silly approach has been cargo-culted for years, and while I
> caught a few in my time, you can't beat copy-paste.
> 
> IMO, this patch is only making things worse instead of fixing things.

Probably partly my fault.  I think there are two pieces here:

  1) allocating the MSI address
  2) computing the PCI bus address

I don't know how to do 1), but I do encourage people not to use
virt_to_phys() for 2), since (in general) CPU physical addresses are
not the same as PCI bus addresses.

