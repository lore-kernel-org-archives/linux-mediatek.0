Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E942FCD0BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 06:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpBW0wGm/rB3CXB45eRbxyqg2mwTYhAbVyKw2N1pJiY=; b=BFf+JGSSrwSjeuMNJmIhEqpxEj
	PnRFQ43Byd1R4pSB+06ZPKAXXsUyMVJJKJGwxNCiY5d6l5zYNvgBlUcjmxdNb280RksG/CciolYgt
	XhDEqLSmHemWE+4qrLjzmLHePejTQ60b6ptVthBYoEO8qpNGrdf5rpWGxsuZKIly9lU8yV3tSWG5K
	R+niExtkrR1Ekk7g2o7R1nLyYjlNsb5VPOrLf420cqip0pSHlK/j1ZEC2bGS1C2H5/lqh7NBB1qrF
	LHPAVy9e2axxb14FNtnfumurUCLvDiK1m6FhxdoDY3py2mH11TNlejzcYLRzPHubQD5v+qSDE2Q7Q
	LOIh5I1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kMS-00000007r6w-2co9;
	Wed, 18 Mar 2026 06:26:32 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kMQ-00000007r6O-1CnW
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 06:26:31 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-356337f058aso4225070a91.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 23:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773815189; x=1774419989; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HpBW0wGm/rB3CXB45eRbxyqg2mwTYhAbVyKw2N1pJiY=;
        b=c3x/eF9x7yBcafCf/BkQ89JCKL9ZEkIkfJdws2nySn6tLN7i81gQFuZFBoyKGV4bSa
         wA+uNY+Yp5LZxYn575Vbs1gX92HYhAT+1W3zXaYb56KAMYX/ahum1pspNf6v8YlZzJV6
         lf4qDBGMRoZukmu4fz8DQaY/6TOtdgU0tLhhDlwBFZqGwN/hjYZ6Ju/bSWn1roflLxn9
         vjWg+0Xt9mSTRB9sx0Eeohc5Vs7dhN9rv7z+uzo8tvg7a3lTu9561q0Tj//YagMjYlU5
         5IF+UPbArMs7I+gXjl5gR3AXiQcyQq345fGr011zlemVEQ2ADYeZVBx5kgXNzSAmJ7AS
         BeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773815189; x=1774419989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpBW0wGm/rB3CXB45eRbxyqg2mwTYhAbVyKw2N1pJiY=;
        b=PkPmsHn2YAcGKwuo3YvhuUYTj24nXsK6uyiMUBJKNPRckUBjKCr2rbdGFcvOoWOMeo
         3c/a1Smazn6m4FLLP8dx6ZoqGsdX0f7/HZNMgsDUM2yrHI5iA1ORx5M6EmdnjwfkOluR
         FCx9GL0UwOM7HhREbAylSewTP/kypgfuLgOcgizOinZ2UQWTwxcg4Ju75d+Oapb9/XIB
         gVo5cN+Z20VoaubxoOXQWlSHRVYDpCVuUtdbda7q6Usl0jhSMMQvRwJ9aEvfGzoYY/dQ
         3uI8eHlk1o31cuf4H8pHkuWSjb6GJFY/l/cnwih9HIMejTcwneEkV/U7ORClHql/UFWA
         OShQ==
X-Forwarded-Encrypted: i=1; AJvYcCXddC3FFbr9MmE8shUK4bSlIAR8eD0dysB4b+1i26ouASwqVoWS+lUPSq2XrU8VJQGHsZcjPcLEL6NOpTIlMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpxlTjJiBtg3TN2JoWbq+0DNYTR8f2DATJSsFzpKVTwxuX8AVL
	5SImmowLGIa7Ff7JoUf+2TeBgIB16CyKcAAKJ+ysWQcUbmDsPsoqnsUH
X-Gm-Gg: ATEYQzx2CDdj9OTO8D964YFFZRFTwMMVeFHkAm+A+8nkLMeuezYBIVYTxh6hA7iXiKc
	tOO4BBwouLiieKyXNR13JPD4UHz65gD4mphf8Q+ki8uFTjLWBWV3d0Y/BkjBo1Y15i1vv2QcHQk
	KTKWYdR8HS37s9puYCS2mGq7TYDW3CVUn3qTW17xNxCBRcPEfmvwZzi8eJh1ky3VwxTyaR1OC/G
	+Mbk/apZ/T80cef9MublKVyUvNMQNUa7XQtxJruHxcAM25enr6YVhIFSsfFt8LrJas5ug96KMv1
	baa2GPz14MbCc2uWDTsi6zLKeJH55WkrxPeM4YIdD8Lq/ClesueutxkGUBPVf6Czz2tWiL4hnuD
	CGFL43Rvngp/g6pRNVvADBqWBQ385/ss1t/jHLcRdhVFcUGD24/FlMgjHqr4OdEpA7yV/N3jUXc
	bhNzW8gEdNn5uLzcEuwk18LyJMNpL9KyzMoJPNATY=
X-Received: by 2002:a17:90b:2d10:b0:359:ff8a:ee3c with SMTP id 98e67ed59e1d1-35bb9f11dcbmr1891248a91.23.1773815188966;
        Tue, 17 Mar 2026 23:26:28 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada2bc3esm6193566a91.1.2026.03.17.23.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 23:26:28 -0700 (PDT)
Date: Wed, 18 Mar 2026 10:26:21 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Caleb James DeLisle <cjd@cjdns.fr>, linux-pci@vger.kernel.org,
	linux-mips@vger.kernel.org, ryder.lee@mediatek.com,
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] PCI: Skip bridge window reads when window is not
 supported
Message-ID: <abpFjQJ5RNcbzbmz@DESKTOP-TIT0J8O.localdomain>
References: <20260316155157.679533-4-cjd@cjdns.fr>
 <20260317212908.GA109023@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317212908.GA109023@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_232630_331559_1EA6D8BF 
X-CRM114-Status: GOOD (  26.86  )
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

On Tue, Mar 17, 2026 at 04:29:08PM -0500, Bjorn Helgaas wrote:
> On Mon, Mar 16, 2026 at 03:51:57PM +0000, Caleb James DeLisle wrote:
> > pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
> > registers unconditionally. If the registers are hardwired to zero
> > (not implemented), both base and limit will be 0. Since (0 <= 0) is
> > true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
> > gets created.
> > 
> > pci_read_bridge_windows() already detects unsupported windows by
> > testing register writability and sets io_window/pref_window flags
> > accordingly. Check these flags at the start of pci_read_bridge_io()
> > and pci_read_bridge_mmio_pref() to skip reading registers when the
> > window is not supported.
> 
> The fundamental problem here is that assigned space to a bridge window
> that isn't implemented.  I wish we understood the connection between
> this "read window" path and the assignment path.
> 
> Maybe this patch fixes it because we enter pci_read_bridge_mmio_pref()
> with res->flags being NULL, and we set IORESOURCE_MEM |
> IORESOURCE_PREFETCH again, which makes it look like we can assign
> space for it?

Yes, that's exactly right.

> 
> If that's the case, I think it would improve the commit log to mention
> the actual mechanism by which we avoid assigning space.
> 

How about this:

  pci_read_bridge_io() and pci_read_bridge_mmio_pref() read
  bridge window registers unconditionally. If the registers
  are hardwired to zero (not implemented), both base and limit
  will be 0. Since (0 <= 0) is true, these functions set
  IORESOURCE_IO or IORESOURCE_MEM | IORESOURCE_PREFETCH on
  the bridge resource. This causes the allocator to assign
  space for the window even though the hardware can't
  implement it.

  pci_read_bridge_windows() already detects unsupported windows
  by testing register writability and sets io_window/pref_window
  flags accordingly. Check these flags at the start of
  pci_read_bridge_io() and pci_read_bridge_mmio_pref() to skip
  reading registers when the window is not supported, so the
  resource flags remain clear and the allocator does not assign
  space for non-existent windows.


Ahmed Naseef

> > Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> > Link: https://lore.kernel.org/all/20260113210259.GA715789@bhelgaas/
> > Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> > Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> > ---
> >  drivers/pci/probe.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index bccc7a4bdd79..4eacb741b4ec 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -395,6 +395,9 @@ static void pci_read_bridge_io(struct pci_dev *dev, struct resource *res,
> >  	unsigned long io_mask, io_granularity, base, limit;
> >  	struct pci_bus_region region;
> >  
> > +	if (!dev->io_window)
> > +		return;
> > +
> >  	io_mask = PCI_IO_RANGE_MASK;
> >  	io_granularity = 0x1000;
> >  	if (dev->io_window_1k) {
> > @@ -465,6 +468,9 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
> >  	pci_bus_addr_t base, limit;
> >  	struct pci_bus_region region;
> >  
> > +	if (!dev->pref_window)
> > +		return;
> > +
> >  	pci_read_config_word(dev, PCI_PREF_MEMORY_BASE, &mem_base_lo);
> >  	pci_read_config_word(dev, PCI_PREF_MEMORY_LIMIT, &mem_limit_lo);
> >  	base64 = (mem_base_lo & PCI_PREF_RANGE_MASK) << 16;
> > -- 
> > 2.39.5
> > 

