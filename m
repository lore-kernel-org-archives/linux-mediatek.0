Return-Path: <SRS0=HsXE=H7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF62C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 13:31:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FC7664E42
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 13:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FC7664E42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=chz3UEBonRFklEltA5FP121Whed/QVR0n0Jnz2PyXmA=; b=WRQ8nuqIknhM45L1Dj3PioqFb
	7L1ZF0bejzc3rdnTaQco5UtfJ/idXFg9oecz3suY3mmBCSS92eJzbeCDJwH25LLoG0EIwV0toebqL
	iEV2t8Qkcpkd+igfIw+Ld0v6tE+2dvVhuy0X+w+MgCl5nUupMYA7q9LM8LLEb/DfRM2jqNkcs0hkl
	omW4VebSxU08Ph8RsrHmCKl9yZvPkt6utJzJbGC3NfD8Xgsg3xQrJegUq0fOe8oQd3UnecyLWFsHM
	gq3+7jB0zVLYCkbRolQInzwqfMyPfxwIdR2ylg2rp51qQfW5cEU5alRxgCTUyGl0pvWLManl8ZXbq
	VrUyGB3ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGieC-00010A-Qd; Mon, 01 Mar 2021 13:31:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGie9-0000z3-FW; Mon, 01 Mar 2021 13:31:38 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF77864D9F;
 Mon,  1 Mar 2021 13:31:36 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lGie6-00GPaX-Od; Mon, 01 Mar 2021 13:31:34 +0000
MIME-Version: 1.0
Date: Mon, 01 Mar 2021 13:31:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: Aw: Re:  [PATCH 09/13] PCI: mediatek: Advertise lack of MSI
 handling
In-Reply-To: <trinity-9fa6d24e-f9de-4741-bf44-86f6197b174d-1614600961297@3c-app-gmx-bap67>
References: <20210225151023.3642391-1-maz@kernel.org>
 <20210225151023.3642391-10-maz@kernel.org>
 <trinity-b7e2cf18-f0e6-4d88-8a80-de6758b5a91f-1614595396771@3c-app-gmx-bap67>
 <b7721e2ff751cc9565a662cb713819e3@kernel.org>
 <trinity-9fa6d24e-f9de-4741-bf44-86f6197b174d-1614600961297@3c-app-gmx-bap67>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <5afd1d656299d87c43bdf31b8ced2d5f@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: frank-w@public-files.de, lorenzo.pieralisi@arm.com,
 bhelgaas@google.com, treding@nvidia.com, tglx@linutronix.de, robh@kernel.org,
 will@kernel.org, kys@microsoft.com, haiyangz@microsoft.com,
 sthemmin@microsoft.com, wei.liu@kernel.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, ryder.lee@mediatek.com, marek.vasut+renesas@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, michal.simek@xilinx.com,
 paul.walmsley@sifive.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_083137_681966_76C7202B 
X-CRM114-Status: GOOD (  19.09  )
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
Cc: linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Will Deacon <will@kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <treding@nvidia.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Frank,

>> > i guess it's a bug in ath10k driver or my r64 board (it is a v1.1
>> > which has missing capacitors on tx lines).
>> 
>> No, this definitely looks like a bug in the MTK PCIe driver,
>> where the mutex is either not properly initialised, corrupted,
>> or the wrong pointer is passed.
> 
> but why does it happen only with the ath10k-card and not the mt7612 in
> same slot?

Does mt7612 use MSI? What we have here is a bogus mutex in the
MTK PCIe driver, and the only way not to get there would be
to avoid using MSIs.

> 
>> This r64 machine is supposed to have working MSIs, right?
> 
> imho mt7622 have working MSI
> 
>> Do you get the same issue without this series?
> 
> tested 5.11.0 [1] without this series (but with your/thomas' patch
> from discussion about my old patch) and got same trace. so this series
> does not break anything here.

Can you retest without any additional patch on top of 5.11?
These two patches only affect platforms that do *not* have MSIs at all.

> 
>> > Tried with an mt7612e, this seems to work without any errors.
>> >
>> > so for mt7622/mt7623
>> >
>> > Tested-by: Frank Wunderlich <frank-w@public-files.de>
>> 
>> We definitely need to understand the above.
> 
> there is a hardware-bug which may cause this...afair i saw this with
> the card in r64 with earlier Kernel-versions where other cards work
> (like the mt7612e).

I don't think a HW bug affecting PCI would cause what we are seeing
here, unless it results in memory corruption.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
