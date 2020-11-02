Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29FCC4742C
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 16:23:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D86F22268
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 16:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TPAIC4GV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rGHbxKUK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HgFPoOIB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rklClo0H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D86F22268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EGyBmDCu6lKBaUwm7enj2q+ivq/ch5754AY4/acx1wE=; b=TPAIC4GV7QhHmpJCjvBrmxA2e
	D9iMwmPXdmZl0NiFJ2gPYnBe4t/bvok0uZBrO2AovuxSXXZUWoVvVbkuEZFQWpblO6XdFS9zaLJUL
	9kIJsf/sNJAwf/MgHO5OssPmu9Zm1EjeGbLSUesWKpwEJz/7AYg8PZvrrXyOQJwbeI6olWAIOjY0P
	mkNAJFZhwb+D8Xh55JggZdqGV2kyqjsftOzo+oXe2udgBP9B4alfht/Ce9ZIjD+jeG+MCg7xR11sV
	qVjJkiJccTAP4HWOjhDnaCQuxRmZhqvV4GqK9EchCVTaozDlfuwkepn6qV3jb5MddHpVFegzZBmdM
	uSnvZD0Qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZcbu-0007Vt-SJ; Mon, 02 Nov 2020 16:23:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZcWF-0004wv-HV
 for linux-mediatek@merlin.infradead.org; Mon, 02 Nov 2020 16:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gXzFcVSwJFFqoLLrujA4jAJHEyHNXRFQIhN+VNXicmY=; b=rGHbxKUKAaGxYYKGp5Ln0ZxUig
 GSHQHrqsYbavin80llEwRDLxH8aMCpjdYukrJM67MA60cPIL4tgIb9Od2cwlpgeUx5BBNrAf9V0Ir
 PqgVEOexpyrr1gkUiojqSnEUzYkRQzT8xS+9/3FqXee2qfZ7cP/DD63dINh4vy2Gn8Rz7ah8pLmAM
 M+fN4O0nYnvdqwQc8wG4uArJIG+qibup3chfH6mc3bdMDoS2HwaHPi7HwzVZyCo7KvuouCsc0gLQw
 cyl99WxseWgS1M6Hb/LTcy27aXO4J4EomfnpwbVuXDRAkTfM0A+67q1JTSJxLp5S3vNpVyM4IgEMn
 sGgyrDoQ==;
Received: from galois.linutronix.de ([193.142.43.55])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZcW9-0004xn-Ut
 for linux-mediatek@lists.infradead.org; Mon, 02 Nov 2020 16:17:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604333820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gXzFcVSwJFFqoLLrujA4jAJHEyHNXRFQIhN+VNXicmY=;
 b=HgFPoOIBRNuVPGoUUvmvGsB8VJpKWZHeOHnLdsqKkgkM9BEq3bNVME4kfP61Je/O0ys40b
 VXtncmqLgwsFFjUKkdPdgyY1pTB31mSudl5mr1cJfKpQauOGCDBHnyiLcEx5qlCRpMSgh3
 WMBnlHm4gSrK4uDK5r2lgncrTO+ilUuaZSc4trHGUot/O4R/S32+2d0E4fP2F25T08EgXf
 3rCDoHC3rsBnEJyWhDNYfMZ++gvV9suuiYCbHHqgQSvweiGwXkeE898UjRMFsAlEYI/U+U
 HxszQRUC1f7/L5IuBgr7Fl+nb9t7+oWDXuV24SgnVL1u+nmhRS6NC8gQU2R2Lg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604333820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gXzFcVSwJFFqoLLrujA4jAJHEyHNXRFQIhN+VNXicmY=;
 b=rklClo0HDFR6EFdKXRKNqGCBmRVN66dhW9Qv73+dH+3iL1s7TLKWhiiS8HQjwiunOfNlnD
 OzxplicRw7W41uDg==
To: Marc Zyngier <maz@kernel.org>
Subject: Re: Aw: Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <df5565a2f1e821041c7c531ad52a3344@kernel.org>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
 <df5565a2f1e821041c7c531ad52a3344@kernel.org>
Date: Mon, 02 Nov 2020 17:16:59 +0100
Message-ID: <87h7q791j8.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_161714_548400_88FA389C 
X-CRM114-Status: GOOD (  13.87  )
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

On Mon, Nov 02 2020 at 11:30, Marc Zyngier wrote:
> On 2020-11-01 22:27, Thomas Gleixner wrote:
> The following patch makes it work for me (GICv3 guest without an ITS)by
> checking for the presence of an MSI domain at the point where we 
> actually
> perform this association, and before starting to scan for endpoints.
>
> I *think* this should work for the MTK thingy, but someone needs to
> go and check.
>
> Thanks,
>
>          M.
>
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 4289030b0fff..bb363eb103a2 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -871,6 +871,8 @@ static void pci_set_bus_msi_domain(struct pci_bus 
> *bus)
>   		d = pci_host_bridge_msi_domain(b);
>
>   	dev_set_msi_domain(&bus->dev, d);
> +	if (!d)
> +		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;

Hrm, that might break legacy setups (no irqdomain support). I'd rather
prefer to explicitly tell the pci core at host registration time.

Bjorn?

Thanks,

        tglx

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
