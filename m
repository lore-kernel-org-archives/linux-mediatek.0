Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A640C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 11:30:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72AB522275
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 11:30:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BQUjLao6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3eYWJ4N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72AB522275
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eUkh4XGtSibl1EiLFTPQhdxuaZ2RjjlxYx3EISob+9o=; b=BQUjLao6FA3USUHfszwPhQ4w3
	GlYlGnGouTlEYYo7bGrplcfqUmoMBPwL6bL6fIiR5eXufgI+VzHoaGI5V0opTz+Ra8KUyqUq9lEAJ
	XW0xr1nOrta6c+rshUS6JTMi8OWwNDwEhhum0WeU+8pkpCixnELYAEGIn1tjBdnzLYXl2Jkwq7zuJ
	GoJYulz1VfN884rK54EwpV3DCq2UVbNijpWMVOMWeCzMxM4eLy/mqfM5JWCTbrRCcXGe96oF6L3b0
	3PP3nNgmRzDOhwD3RnjqoGtx7n3TFjJNegdsan1cCOOHUDa7Klp0pAzrVLWOX2/CKwONrhHDUJ8C7
	FN5mSl/sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZY2u-0003wL-Il; Mon, 02 Nov 2020 11:30:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZY2o-0003v3-B0
 for linux-mediatek@lists.infradead.org; Mon, 02 Nov 2020 11:30:39 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BBD722275;
 Mon,  2 Nov 2020 11:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604316637;
 bh=X8JnEcClp9UY0EBJJar83EIQZ/sedukphcjMgxzniwA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s3eYWJ4N05JGw5+J/sKBXzA4jKOxGBTv3QKtEmtbFH+eQG0ZYZbnrRoFbkrLQEo8k
 J3xp60f0jrLcPmTns9Q7lBXGpZyNGjzoDZ2w5KPGfjBDrJfgR1mS0IsennEMBptZEA
 uf6FJ8R0fyKiLzl+69lS77KXzFVvcPJpF4lw5sQc=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kZY2k-006drC-O9; Mon, 02 Nov 2020 11:30:35 +0000
MIME-Version: 1.0
Date: Mon, 02 Nov 2020 11:30:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Aw: Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <87pn4w90hm.fsf@nanos.tec.linutronix.de>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <df5565a2f1e821041c7c531ad52a3344@kernel.org>
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
X-CRM114-CacheID: sfid-20201102_063038_665049_8012DB43 
X-CRM114-Status: GOOD (  21.43  )
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

On 2020-11-01 22:27, Thomas Gleixner wrote:
> On Sun, Nov 01 2020 at 21:47, Marc Zyngier wrote:
>> On Sun, 01 Nov 2020 18:27:13 +0000,
>> Frank Wunderlich <frank-w@public-files.de> wrote:
>> Thinking of it a bit more, I think this is the wrong solution.
>> 
>> PCI MSIs are optional, and not a requirement. I can trivially spin a
>> VM with PCI devices and yet no MSI capability (yes, it is more
>> difficult with real HW), and this results in a bunch of warning, none
>> of which are actually indicative of anything being wrong.
> 
> Well. No.
> 
> The problem is that the device enumerates MSI capability, but the host
> bridge is not proving support for MSI.
> 
> The host bridge fails to mark the bus with PCI_BUS_FLAGS_NO_MSI. That's
> the reason why this runs into this issue.

Right, that's the piece I was missing, thanks for that.

However, that doesn't really address the issue when the host bridge and
the MSI widget are two separate entities, oblivious of each other (which
is a pretty common thing on the ARM side).

In this configuration, you can't really decide whether you have a MSI
domain in the host bridge driver (the association is done in the code
PCI code, after you have registered it with the core code), and by the
time you get a pointer to the bus, the endpoints have already been 
probed.

The following patch makes it work for me (GICv3 guest without an ITS)by
checking for the presence of an MSI domain at the point where we 
actually
perform this association, and before starting to scan for endpoints.

I *think* this should work for the MTK thingy, but someone needs to
go and check.

Thanks,

         M.

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 4289030b0fff..bb363eb103a2 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -871,6 +871,8 @@ static void pci_set_bus_msi_domain(struct pci_bus 
*bus)
  		d = pci_host_bridge_msi_domain(b);

  	dev_set_msi_domain(&bus->dev, d);
+	if (!d)
+		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
  }

  static int pci_register_host_bridge(struct pci_host_bridge *bridge)

-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
