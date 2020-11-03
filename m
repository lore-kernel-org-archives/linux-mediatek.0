Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8105DC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 10:29:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08EE3206C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 10:29:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M637QTde";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="w/G6r0Uk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08EE3206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mmv7gSRDlqJRSHToHLZtZNs7luYw9dKdFqeTESafzYE=; b=M637QTdepUgaRQXqrAoGL0peV
	DrrhU0s+gF6Jogxcrz40aaLP9RLGzKTG/Wx1d14SC/bwbqbOB9Z2J3m+OC7ftSjJl13W2zQYkz/eM
	0HzdCTjL03PCC32S6Hj9rOYwt7EuHBjk/lLpwbdueQ5QsCFLFTNiTM5T66+e7z9fcdrpx8EOlVFId
	/XQlj95ATsxZXU9AtbUttVtQJRUXBTKjPWj7memMa+TzuvzRMHYVc2ivPyJmp8GAiJfBvMpYDLCre
	36GMbiRZJlQ/4p4jfUOblFk/eG1P85gZp9jhmIn9cQNfbD2/hSPNylb14jQaLNWfk0FRPS8EEamzx
	3ZR52/f9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtZQ-0001JG-9h; Tue, 03 Nov 2020 10:29:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtZ4-00018w-1M
 for linux-mediatek@lists.infradead.org; Tue, 03 Nov 2020 10:29:24 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 691D3206C0;
 Tue,  3 Nov 2020 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604399359;
 bh=rzmUb4sjt+QRA0E2POcf2NroOr71zccUxg8Mx635fNc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=w/G6r0Uk6mgYqPET7MBBYYzjknHKzmzytBIILxZ8qHVO8wx/BA6NMqQIFQga+tg8l
 sFev2am4zJyRrrguYfmOkEAKqyIwkywnIPBZ12uFXG4fu/uZHj8FBUXrCOMSgF+h2t
 Ax2/Fe4SRUJnZxebeEhZe+EifH518tuIqCX8scjM=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kZtYz-00766J-8n; Tue, 03 Nov 2020 10:29:17 +0000
MIME-Version: 1.0
Date: Tue, 03 Nov 2020 10:29:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Aw: Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <87o8ke7njb.fsf@nanos.tec.linutronix.de>
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
 <87o8ke7njb.fsf@nanos.tec.linutronix.de>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <016e887822baeae42599b910aaa33218@kernel.org>
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
X-CRM114-CacheID: sfid-20201103_052923_297415_27C3AD9C 
X-CRM114-Status: GOOD (  13.67  )
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

On 2020-11-03 10:16, Thomas Gleixner wrote:
> On Tue, Nov 03 2020 at 09:54, Marc Zyngier wrote:
>> On 2020-11-02 22:18, Thomas Gleixner wrote:
>>> On Mon, Nov 02 2020 at 17:16, Thomas Gleixner wrote:
>>>> On Mon, Nov 02 2020 at 11:30, Marc Zyngier wrote:
>>>>> --- a/drivers/pci/probe.c
>>>>> +++ b/drivers/pci/probe.c
>>>>> @@ -871,6 +871,8 @@ static void pci_set_bus_msi_domain(struct 
>>>>> pci_bus
>>>>> *bus)
>>>>>   		d = pci_host_bridge_msi_domain(b);
>>>>> 
>>>>>   	dev_set_msi_domain(&bus->dev, d);
>>>>> +	if (!d)
>>>>> +		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
>>>> 
>>>> Hrm, that might break legacy setups (no irqdomain support). I'd 
>>>> rather
>>>> prefer to explicitly tell the pci core at host registration time.
>>> 
>>> s/might break/ breaks /     Just validated :)
>> 
>> For my own edification, can you point me to the failing case?
> 
> Any architecture which selects PCI_MSI_ARCH_FALLBACKS and does not have
> irqdomain support runs into:
> 
> 	if (!d)
> 		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
> 
> which in turn makes pci_msi_supported() return 0 and consequently makes
> pci_enable_msi[x]() fail.

I pointer that out in [1], together with a potential fix. Not sure if
anything else breaks though.

Thanks,

         M.

[1] 
https://lore.kernel.org/r/336d6588567949029c52ecfbb87660c1@kernel.org/
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
