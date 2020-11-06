Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CEFC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 09:44:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCB81208FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 09:44:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UhQm9QHs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWmwLNgx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCB81208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HoPWwqLKhrpVUiieqXJ1Je6gnyrz3j5IritMY8TtyUw=; b=UhQm9QHsQdP5FTlgqMHr8E8ym
	EsqnboCdSptl/+ghVXV8F7NgGtzEdhCcBwAtG1PoOjvQMAwZorJ4dphz9Wc1O0j2Z6kg4U4Cn1bzr
	HHTMTCj6yFdwHJhAIBEdZu70uA6pOBLiO4WR32DhSoYKdGqlkBOwSGffie7whEytCs0ZKLQk2MqX6
	USlo202LZuoV7IuYz9J1tfNakc949/IRgPwy3uQNz4RCN/GM5mz9MHohZSdguNt6fWneGk/GWVa7o
	O13yF+AzjVZzrahrAwfjW7JMkc5mTSy2Lntlzx+Nh1IsC1GzYBN8814daS16EavJbG72I/jlBIBnK
	16Hckubgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kayHt-0005P2-Va; Fri, 06 Nov 2020 09:44:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kayHr-0005Ob-5G
 for linux-mediatek@lists.infradead.org; Fri, 06 Nov 2020 09:44:03 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37082208FE;
 Fri,  6 Nov 2020 09:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604655841;
 bh=Fq5vr3me39TgPqEdPyi7J1Ht4zHrZr1k7irqRaq3p58=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JWmwLNgx7xdjdSAA7Zt5fqF+ovmzxs/0PPUI0spUYDgAL+k9Xum41VvWegs8iucsj
 SVPRgrKI+O+pbnCRnpWDGb4386+yawxrTdtdOQwLN3YfjC5dydIbh7WVK2neuchzrS
 OHL8bJVRg2hvo00wckvyy8dTwS95VLRRdShu7h5s=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kayHm-0088fx-75; Fri, 06 Nov 2020 09:43:58 +0000
MIME-Version: 1.0
Date: Fri, 06 Nov 2020 09:43:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Aw: Re:  Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <87blgbl887.fsf@nanos.tec.linutronix.de>
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
 <trinity-1d7f8900-10db-40c0-a0aa-47bb99ed84cd-1604508571909@3c-app-gmx-bs02>
 <87h7q4lnoz.fsf@nanos.tec.linutronix.de>
 <074d057910c3e834f4bd58821e8583b1@kernel.org>
 <87blgbl887.fsf@nanos.tec.linutronix.de>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <c63d8d7d966c1dda82884f361d4691c3@kernel.org>
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
X-CRM114-CacheID: sfid-20201106_044403_377214_19D66C43 
X-CRM114-Status: GOOD (  20.38  )
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

On 2020-11-05 23:00, Thomas Gleixner wrote:
> On Thu, Nov 05 2020 at 09:20, Marc Zyngier wrote:
>> On 2020-11-04 23:14, Thomas Gleixner wrote:
>>>  	/* Resource alignment requirements */
>>>  	resource_size_t (*align_resource)(struct pci_dev *dev,
>> 
>> If that's the direction of travel, we also need something like this
>> for configuration where the host bridge relies on an external MSI 
>> block
>> that uses MSI domains (boot-tested in a GICv3 guest).
> 
> Some more context would be helpful. Brain fails to decode the logic
> here.

OK, let me try again.

The MSI controller, which is the thing that deals with MSIs in the 
system
(GICv2m, GICv3-ITS, and a number of others), is optional, is not part of 
the
host bridge (it has nothing to do with PCI at all), and the bridge 
driver has
absolutely no idea  whether:

- there is something that provides MSI or not
- that something has successfully been initialised or not (which 
translates
   into an MSI domain being present or not)

This is the case for most ARM systems, and all KVM/arm guests. Booting a 
VM
without MSIs is absolutely trivial, and actually makes sense for some of 
the
smaller guests.

In these conditions, your no_msi attribute doesn't work as is: we can't 
decide
on its value at probe time without extracting all of the OF/ACPI logic 
that
deals with MSI domains from the core code, and making it available to 
the host
bridge drivers for systems that follow that model.

Using the flow you insist on requires parsing the topology twice:

- once to find out whether there is actually a MSI provider registered
   for the host bridge in order to set the no_msi flag

- once to actually be able to store the domain into the pci_bus 
structure,
   as it isn't available at probe time.

My last suggestion is to indicate to the core code that there is a 
*possible*
MSI controller available in the form of a MSI domain. This is still 
suboptimal
compared to checking the presence an MSI domain in core code (my initial
suggestion), but the fallback stuff gets in the way (though I still 
think it
can be made to work).

Anyway, this was my last attempt at addressing the problem. Most people
won't see it. The couple of drivers that require the fallback hack are
usually selected in distro kernels, and do a good job hiding the error.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
