Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6FAC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 22:18:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B4A92076E
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 22:18:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kOZU5N/K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="upMMtjCR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ffZZj7RA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B4A92076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qs3rzKr86y5dF7IJuuEY6JyWl2D89cz4Oahx/WU6ap8=; b=kOZU5N/KaSaTm3Fm7cwT8zjQF
	jnytaVKHOQugknfvE79AC6dp85fjIrhEfyNaXvBwcUtDwPi84D+zTm8y+UPvX/Ja0t4sHM7Cp06nN
	/xQ+b0vnU2GNQAjfM+4dDxpSx3YHWvahWmPgkOL/ayqG3Gbud4Bzt542TT3E0Ib4BQ6ykvNkBJtMo
	Mb3eNO+Rnm2kARFYSbtoIMTkN4gCsSgWm2lX+JNSDfQ9wn1b/6cPeVUGYymeUFld3j9Dz8dRiEZPx
	QebD7OWrVu+TqkAQXcyjN0xd7mQhpGk0jEKqDdCy2utgb+9duh3h2VGQlPcdkk26Z0mgBA4YZJKV7
	jiFCdHJGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZi9Z-0008UO-ML; Mon, 02 Nov 2020 22:18:17 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZi9W-0008Tp-LK
 for linux-mediatek@lists.infradead.org; Mon, 02 Nov 2020 22:18:15 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604355492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xly7vSYeoMILwUk4ixZP3866bXaRUpNDJSG+wlkAlI4=;
 b=upMMtjCRIY89jZxoAMxdlNQ8hF396TY4CzHCkaAW2YJLGseQcXaMCYgQnlf9Y9dabEEvTa
 HaaXeP/uIGaehfLlzQQXUepZBi7g0G59/azJClsTIVrPN0re6XxPtgT1D88Eor2aQUHTcu
 xGFlYCA25mmOMLdCnNkYODrWF5MeyGP8VVrhzb61CeiC8R4GhaUjqxKyOf2ihTaWVBQXXh
 47gZiQJJjg6mt7lMRdpy/CdzNgyPDchdmx1IGh83e71eOSHF7d0eoimsUrUINCuxFeCWIr
 1mTb1rI5ynIUcUb0q9fcYaZ2dTk6V563FC1Bm/kaYWfKMUNFWYnePdEgv0liCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604355492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xly7vSYeoMILwUk4ixZP3866bXaRUpNDJSG+wlkAlI4=;
 b=ffZZj7RAS4e4aSGVv1b2vhc8FpsNZ5T2k3MsoDK0BW4lJjfebln1MNZswIQeqtQjQnEmfg
 KIV78M90DBA+msBw==
To: Marc Zyngier <maz@kernel.org>
Subject: Re: Aw: Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <87h7q791j8.fsf@nanos.tec.linutronix.de>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
 <df5565a2f1e821041c7c531ad52a3344@kernel.org>
 <87h7q791j8.fsf@nanos.tec.linutronix.de>
Date: Mon, 02 Nov 2020 23:18:11 +0100
Message-ID: <877dr38kt8.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_171814_851619_33CBC00E 
X-CRM114-Status: UNSURE (   8.83  )
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

On Mon, Nov 02 2020 at 17:16, Thomas Gleixner wrote:
> On Mon, Nov 02 2020 at 11:30, Marc Zyngier wrote:
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
>> @@ -871,6 +871,8 @@ static void pci_set_bus_msi_domain(struct pci_bus 
>> *bus)
>>   		d = pci_host_bridge_msi_domain(b);
>>
>>   	dev_set_msi_domain(&bus->dev, d);
>> +	if (!d)
>> +		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
>
> Hrm, that might break legacy setups (no irqdomain support). I'd rather
> prefer to explicitly tell the pci core at host registration time.

s/might break/ breaks /     Just validated :)

So we really need some other solution and removing the warning is not an
option. If MSI is enabled then we want to get a warning when a PCI
device has no MSI domain associated. Explicitly expressing the PCIE
brigde misfeature of not supporting MSI is way better than silently
returning an error code which is swallowed anyway.

Whatever the preferred way is via flags at host probe time or flagging
it post probe I don't care much as long as it is consistent.

Thanks,

        tglx



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
