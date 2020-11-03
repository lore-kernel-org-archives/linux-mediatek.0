Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF04C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 10:17:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4905C206B5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 10:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nII0n7VY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="A8zpMpCf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3xR/dsrI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4905C206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nNhXtVg4aMToYR4w5C1T8j/FkOvoLT6oBwskZnTCXX4=; b=nII0n7VY4GbqoUHbV8h8cGb6s
	AIw+xykXH7SCZYXkTpv2aVFWXmaA5Nzj3EtrK4UjBDgKsbkbSA9pzHVo6oUo3+bw6lUD/HmYToF4T
	NOGx/A1M5q5y7AsTl/cuWzPn/l8oDdK/NxdkbSKdbcs5SlOrl1i+OiLbdlVyTq1D6JJsrbTp4m6MM
	aInGaE3WWkk/uOO3ejAgOB0UJnE80/f2GlRde/F2nn2Ww1QvzEeXudUP6BSsE4d5oXtIucYCy4TNX
	DGs/agFX01jTi068EqXcNptmSHyN1/YCcqLE3At5jPeDkw2d3NVYi31MkuHXpicc40DaqEO4asNkG
	tPjGVpfWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtN6-0006DE-RO; Tue, 03 Nov 2020 10:17:00 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtN4-0006Bu-Dx
 for linux-mediatek@lists.infradead.org; Tue, 03 Nov 2020 10:16:59 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604398616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gpvq/2A1yvnMwjL+wAA74Kn6/JPuAETBiuqTCH14fqo=;
 b=A8zpMpCfPTvAWGaiNtuCYgrtlN4XtGIUidHXWXDyiPmNCzHYxjgvQglp4o4zdPYBXLQD/q
 fDMGjdPh6sDM/Bjgb9UqJCNfBghh5+YCBn2vZd4Bbh80UPc7v6lvhO8dR3zWBMI8hajT7o
 nuZsG3Y1n/EOhFP2NHHdziAFtESpY8h6q7xr/uDi/+8FNujB7BFMj0OGlzSeUdvu5UQQz+
 qEl3FQ5oiMU8rGJA4NN7Ns+CKcE4wM7KlI40VQ7LJ0VBqBK5VzJdCqPvQpRsTKgPR0whVV
 DObuN4wzHHNFH2tCVxfAh+KNZI1Vhd5oWiAJu2R75cUUn+kq0StjH4rSqNXXTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604398616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gpvq/2A1yvnMwjL+wAA74Kn6/JPuAETBiuqTCH14fqo=;
 b=3xR/dsrIRDTurROfujbz4Q4AchrZlTwRSm9Jtw/CEB2g10wK0qvFQby2/nH7G3i8nhxDLS
 1FNL9iat9504AGAQ==
To: Marc Zyngier <maz@kernel.org>
Subject: Re: Aw: Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <901c5eb8bbaa3fe53ddc8f65917e48ef@kernel.org>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
 <df5565a2f1e821041c7c531ad52a3344@kernel.org>
 <87h7q791j8.fsf@nanos.tec.linutronix.de>
 <877dr38kt8.fsf@nanos.tec.linutronix.de>
 <901c5eb8bbaa3fe53ddc8f65917e48ef@kernel.org>
Date: Tue, 03 Nov 2020 11:16:56 +0100
Message-ID: <87o8ke7njb.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_051658_738308_51D2D313 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03 2020 at 09:54, Marc Zyngier wrote:
> On 2020-11-02 22:18, Thomas Gleixner wrote:
>> On Mon, Nov 02 2020 at 17:16, Thomas Gleixner wrote:
>>> On Mon, Nov 02 2020 at 11:30, Marc Zyngier wrote:
>>>> --- a/drivers/pci/probe.c
>>>> +++ b/drivers/pci/probe.c
>>>> @@ -871,6 +871,8 @@ static void pci_set_bus_msi_domain(struct pci_bus
>>>> *bus)
>>>>   		d = pci_host_bridge_msi_domain(b);
>>>> 
>>>>   	dev_set_msi_domain(&bus->dev, d);
>>>> +	if (!d)
>>>> +		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
>>> 
>>> Hrm, that might break legacy setups (no irqdomain support). I'd rather
>>> prefer to explicitly tell the pci core at host registration time.
>> 
>> s/might break/ breaks /     Just validated :)
>
> For my own edification, can you point me to the failing case?

Any architecture which selects PCI_MSI_ARCH_FALLBACKS and does not have
irqdomain support runs into:

	if (!d)
		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;

which in turn makes pci_msi_supported() return 0 and consequently makes
pci_enable_msi[x]() fail.

Thanks,

        tglx

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
