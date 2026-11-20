Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F3B60A2602
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 08:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b3caRDib;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKo+RNWT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aV8jtS66Tt+1KtEPhn6QzwtWLg4RKOLbiueDjLgm9B8=; b=b3caRDibllCrcfkmGR1HCFIj6E
	+xwb93W6wC+fC7tEbjx1VSHvM/1gVmuVTTpnVv6ya7szeg6lJdt+hqNjrPlH1ojB3XzMOgFqSwIjO
	2V5qlt20nMEKUET0990j/2nanRFy7Wlwe6WObF7zLf55z7LExoMHZNzsh+zi+taam99Cm8m7d3Fi4
	WAnbxhu/L1Hlcqz2jJyhUag+PjqwmH86cDOLT5+T0+L8uFKVUOB0scDc3eQ6Owaw41e6bXgueL1zl
	wX2brtxCg0YgIC+O1l+MgVECtSPX28w/NsTBr+IeFx0KDHy1jkag/tJA5cRhppgLY6FVh+suwLMiA
	Y7YJgX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJxN-0000000EKlm-1dHB;
	Fri, 20 Nov 2026 08:26:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJxI-0000000EKlI-1cpX;
	Fri, 20 Nov 2026 08:26:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70484613F6;
	Fri, 20 Nov 2026 08:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091C61F000C6;
	Fri, 20 Nov 2026 08:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795163207;
	bh=aV8jtS66Tt+1KtEPhn6QzwtWLg4RKOLbiueDjLgm9B8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GKo+RNWTBbECnl7ztHjJyXNwuCG7vyB8iV2U3YYG7U+do5cDoPmPsdnGuttViBrDE
	 8vvLJNEObbOgOFUoLma2I/pHKteMokeQRLjYMjIKoBl/cMq7wS2xzv9hc1BKEp65Pi
	 UePeSHjxMFqGcBjrq7TFkwPhjjalKwChgjJ1euFTM4nDv31QHdcYa9l0Z5BeL/uyFw
	 0v531AMxmI3PmIJjalsKkNJYninErCi3AbFEVAYDaW5wgZ64sW1jCMv4x2Y7ZNK2qM
	 We+efUDFUQPi5D/Hx2uAAIO1OVqe9Sa9ZrcBOUAoP9wR/FC4qUdUvr+kB+S1Ur0Mm0
	 1cZlQJ89zFA5g==
Date: Fri, 20 Nov 2026 10:26:41 +0200
From: "westeri@kernel.org" <westeri@kernel.org>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 4/7] thunderbolt: add platform NHI driver
Message-ID: <20261120082641.GB833643@thinkpad>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-5-chunfeng.yun@mediatek.com>
 <20261110143758.GC259790@black.igk.intel.com>
 <2807832e631dca98846d201b571f623210820268.camel@mediatek.com>
 <20261117125241.GA259790@black.igk.intel.com>
 <39fed6e12d60f439e0f07f3012d675f1c85d2b84.camel@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39fed6e12d60f439e0f07f3012d675f1c85d2b84.camel@mediatek.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Fri, Nov 20, 2026 at 08:16:27AM +0000, Chunfeng Yun (云春峰) wrote:
> > > +	device_set_wakeup_capable(nhi->dev, true);
> > > +	device_enable_async_suspend(nhi->dev);
> > > 
> > > these two line can be put at the end of probe.
> > 
> > I meant device_enable_async_suspend() it's not stricly required and
> > we
> > don't do it elsewhere so I would leave it out now and then add it
> > everywhere later.
> 
> I look at the PCI core code, seems it already enables async suspend for
> every PCI device during device enumeration by default.
> 
>  see: pci_pm_init() (drivers/pci/pci.c)
> 
> Unlike the PCI bus, the platform bus does not automatically enable it
> for platform devices, but for usb devices, usually enable it because
> the standardized tree topology with well-defined dependencies.
> 
> Due to we explicitly create dev-link with xHCI/PCIe controller devices,
> it is safe to enable it, then keep the same way as thunderbolt/pci.c
> does.

Okay works for me then.

