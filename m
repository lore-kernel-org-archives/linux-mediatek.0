Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B442FC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 09:54:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3222F21556
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 09:54:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0bPcXMqZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="y5r7zekS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3222F21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EEstc/mbL2dhJ3HntI0X/gWt7CjTflZ3Ac5RVAO2fxA=; b=0bPcXMqZaXHJOTDUe1T0DBGfB
	B4hISMzy3plUZMfJzmvYzuIsJfYrY+Cieo34Ii6p9xAfJsqAPdRwRa4/5Q3oyF2YV7wyqQhJ+YuNN
	6u8gvXB2W0Fj7/lAzQA5mnx/Tp70RbMPX7Px95inYWtuRYOSGjmKccQKE/vISOi0zI0kv/LeNOqWg
	hXwoaY4gO/VghciBvwUPUIr43uqmNxBpvJ/Gxnb835uVfg8Rm+rgEH6JG+T3/hjfIXw2omnJH2XzH
	aNJ03mJQexYL/PQMVCFYUtUXDdaunKEyl/O80Sei/EZjt/DdkUJHw4UiW1+NTprOW/3bCD5+iC/BS
	0dZnyhV8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZt1K-0002Ly-5a; Tue, 03 Nov 2020 09:54:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZt1G-0002Kt-Vq
 for linux-mediatek@lists.infradead.org; Tue, 03 Nov 2020 09:54:28 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1C3F2080C;
 Tue,  3 Nov 2020 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604397266;
 bh=+PMSBSh/qsbOxi/PGx0X2fcaxpuGi6w2e85VksrgH70=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=y5r7zekSZXihQG1+urqGj/cKRCuJEMUjeTlyba1YH27f4KbxZMsInaR1VZArSennh
 s4+p3GyqFuCLDhCcYBUVK2Pn3at2pBqcf0ReYAzF8BMA/iqfIxvh6o4eA7yti2DJMy
 AbyzLu2L9ZI0/yRbD45cLVXezL+6tqzn34eSfSrw=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kZt1D-0075JQ-RE; Tue, 03 Nov 2020 09:54:23 +0000
MIME-Version: 1.0
Date: Tue, 03 Nov 2020 09:54:23 +0000
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Aw: Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <877dr38kt8.fsf@nanos.tec.linutronix.de>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
 <df5565a2f1e821041c7c531ad52a3344@kernel.org>
 <87h7q791j8.fsf@nanos.tec.linutronix.de>
 <877dr38kt8.fsf@nanos.tec.linutronix.de>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <901c5eb8bbaa3fe53ddc8f65917e48ef@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: tglx@linutronix.de, frank-w@public-files.de,
 ryder.lee@mediatek.com, linux-mediatek@lists.infradead.org, linux@fw-web.de,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 linux-pci@vger.kernel.org, bhelgaas@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_045427_307105_6C93D2B6 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-02 22:18, Thomas Gleixner wrote:
> On Mon, Nov 02 2020 at 17:16, Thomas Gleixner wrote:
>> On Mon, Nov 02 2020 at 11:30, Marc Zyngier wrote:
>>> --- a/drivers/pci/probe.c
>>> +++ b/drivers/pci/probe.c
>>> @@ -871,6 +871,8 @@ static void pci_set_bus_msi_domain(struct pci_bus
>>> *bus)
>>>   		d = pci_host_bridge_msi_domain(b);
>>> 
>>>   	dev_set_msi_domain(&bus->dev, d);
>>> +	if (!d)
>>> +		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
>> 
>> Hrm, that might break legacy setups (no irqdomain support). I'd rather
>> prefer to explicitly tell the pci core at host registration time.
> 
> s/might break/ breaks /     Just validated :)

For my own edification, can you point me to the failing case?

> So we really need some other solution and removing the warning is not 
> an
> option. If MSI is enabled then we want to get a warning when a PCI
> device has no MSI domain associated. Explicitly expressing the PCIE
> brigde misfeature of not supporting MSI is way better than silently
> returning an error code which is swallowed anyway.

I don't disagree here, though the PCI_MSI_ARCH_FALLBACKS mechanism
makes it more difficult to establish.

> Whatever the preferred way is via flags at host probe time or flagging
> it post probe I don't care much as long as it is consistent.

Host probe time is going to require some changes in the core PCI api,
as everything that checks for a MSI domain is based on the pci_bus
structure, which is only allocated much later.

I'll have a think.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
