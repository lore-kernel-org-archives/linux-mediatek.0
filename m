Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED4DC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 08:05:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1035164F4E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 08:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1035164F4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hM6jotqgYvpvYDh/UqwmGYjQ0fOr+mrHHlYwn3yWHaI=; b=Besq2Aes1laX8cDFDnPYxSI3B
	sTQYMMosZ4doXuOkc3NurZQRmq8LZ39p9VGH9Tz7QnPdCTrZBHctyIyei0DJDHO4HRYrmnBE+r1hf
	kLX58qDZrgEHdeYFiLCCrx9aoe0SW53hyuafABqYe1d+fjhUkZthPKyal7SnocatxsJK8xWWR39eX
	LLIvH+0CPE2tSlskp2iAaAYHkxyH4sELwldOjWUXhq8e8tHhCeW07lXy2nf3X80Z/XOvRyDPFKSKj
	j94QQ83arMyW2lb9zq3xWm2o17LDeCW4MUI2jG372l+r+F/Qh4+g1/JnWCCNc/wJBRu3vgbsxgIcY
	UzYTDU2DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7DAJ-0003Jz-UP; Wed, 03 Feb 2021 08:05:31 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7DAF-0003J9-VN; Wed, 03 Feb 2021 08:05:28 +0000
IronPort-SDR: XFhVdBIPvuoTMpOm/dUR3wHb8WFzM1nLFwPpAPkah+k+RwACjm7yI3utyK2DNzFLmsXgqLQ6o5
 kz9vDy7fYj3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="177495939"
X-IronPort-AV: E=Sophos;i="5.79,397,1602572400"; d="scan'208";a="177495939"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 00:05:25 -0800
IronPort-SDR: 9A720OnrUfEV+anxHhtqm10DSp8wmVjx7uYFX9jMxPNWfTI8taECRSPJnuBCUhu2UZ2daKhvUN
 YD8IaYrM64sg==
X-IronPort-AV: E=Sophos;i="5.79,397,1602572400"; d="scan'208";a="356645477"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 00:05:21 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 03 Feb 2021 10:05:18 +0200
Date: Wed, 3 Feb 2021 10:05:18 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
Subject: Re: [v3] PCI: Avoid unsync of LTR mechanism configuration
Message-ID: <20210203080518.GP2542@lahna.fi.intel.com>
References: <20210129071137.8743-1-mingchuang.qiao@mediatek.com>
 <20210201113217.GL2542@lahna.fi.intel.com>
 <1612318441.5980.142.camel@mcddlt001>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612318441.5980.142.camel@mcddlt001>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_030528_172922_4C5BD1F5 
X-CRM114-Status: GOOD (  21.76  )
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
Cc: kerun.zhu@mediatek.com, linux-pci@vger.kernel.org,
 lambert.wang@mediatek.com, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, alex.williamson@redhat.com,
 linux-mediatek@lists.infradead.org, utkarsh.h.patel@intel.com,
 haijun.liu@mediatek.com, bhelgaas@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 03, 2021 at 10:14:01AM +0800, Mingchuang Qiao wrote:
> Hi,
> 
> On Mon, 2021-02-01 at 13:32 +0200, Mika Westerberg wrote:
> > Hi,
> > 
> > On Fri, Jan 29, 2021 at 03:11:37PM +0800, mingchuang.qiao@mediatek.com wrote:
> > > From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> > > 
> > > In bus scan flow, the "LTR Mechanism Enable" bit of DEVCTL2 register is
> > > configured in pci_configure_ltr(). If device and bridge both support LTR
> > > mechanism, the "LTR Mechanism Enable" bit of device and bridge will be
> > > enabled in DEVCTL2 register. And pci_dev->ltr_path will be set as 1.
> > > 
> > > If PCIe link goes down when device resets, the "LTR Mechanism Enable" bit
> > > of bridge will change to 0 according to PCIe r5.0, sec 7.5.3.16. However,
> > > the pci_dev->ltr_path value of bridge is still 1.
> > > 
> > > For following conditions, check and re-configure "LTR Mechanism Enable" bit
> > > of bridge to make "LTR Mechanism Enable" bit mtach ltr_path value.
> > 
> > Typo mtach -> match.
> > 
> > >    -before configuring device's LTR for hot-remove/hot-add
> > >    -before restoring device's DEVCTL2 register when restore device state
> > > 
> > > Signed-off-by: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> > > ---
> > > changes of v2
> > >  -modify patch description
> > >  -reconfigure bridge's LTR before restoring device DEVCTL2 register
> > > changes of v3
> > >  -call pci_reconfigure_bridge_ltr() in probe.c
> > 
> > Hmm, which part of this patch takes care of the reset path? It is not
> > entirely clear to me at least.
> > 
> 
> When device resets and link goes down, there seems to have two methods
> to recover for software. 
>    -One is that trigger device removal and rescan.
>    -The other is that restore device with pci_restore_state() after link
> comes back up.
> For above both scenarios, we need check and reconfigure "LTR Mechanism
> Enable" bit of bridge. It's also this patch intends to do.
>    -For the rescan scenario, it's done in pci_configure_ltr().
>    -For the restore scenario, it's done in pci_restore_pcie_state().

Okay, thanks for the clarification!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
