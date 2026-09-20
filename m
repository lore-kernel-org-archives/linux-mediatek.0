Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CF5C982D8
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 14:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tmbrVeXaVfBtF5hD/z5Qd645SjBzZ23MF0sBpcF788=; b=xUYRuufJRmHTaJUILUQcBEKmTc
	66U6fGAz4DwTgkj/bO4DaO2+KrIgupIL4qYyTvVJsYJ3b1buDJh3nnrjpbpK837yw6D33dIpz+NvK
	hPAhkUJJP0b4sio2SpbuQhKyrFxVQmGGVU6QJC5Fr1D9ojDwjGVj9AemTaOQEe04mNg2qCLx0oUf4
	l+Za3NH0Y8uxZET5jmRk+IoAKA9eK4sz1/NeV2RoACF3W2hb2Dhjgmkng+945m434AyJDXKAvt+UP
	7sEWVLlIcbA+oiwx8j2pRcTEoFY4nWVGQ+Gx2Wjgk7OVPJ7w9ARVA4c9Lah3tSkscQBui5yiCpviB
	NcniNIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8IrT-000000000Ng-1T3a;
	Sun, 20 Sep 2026 14:49:47 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8IrP-000000000NF-489n
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 14:49:45 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 517B980007E;
	Sun, 20 Sep 2026 14:49:40 +0000 (UTC)
Received: from [192.168.1.23] (unknown [98.97.32.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 47C8F13C2B0;
	Sun, 20 Sep 2026 07:49:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 47C8F13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1789915779;
	bh=HOypawCg01zp6a+LrYrKj3sXWu5oOMxRj3XL5TVBPdA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kcVBhjje2TL4/pY9DtYSXFiqDRytLAq6MfoZMY46tJjO6HviWlecDrEMNAy3PiP6b
	 tx6gAg71Mlp60Luu6V2nN3210juROFd01VQ8bmT5Q8iQaLlj5TxLRfQpFbKeh8YWSH
	 PAlrp3anUik9IkHcAFZNC6q+vtmGhaFl0LNPwp7k=
Message-ID: <599b4d0d-31fa-4466-bfdc-8185d6c0ee5d@candelatech.com>
Date: Sun, 20 Sep 2026 07:49:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] wifi: mt76: disable NAPI before deleting in dma_cleanup
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 nbd@nbd.name, lorenzo@kernel.org, Shiji Yang <yangshiji66@outlook.com>
References: <20260916204750.1439984-1-greearb@candelatech.com>
 <20260920034907.199687-1-lucid_duck@justthetip.ca>
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <20260920034907.199687-1-lucid_duck@justthetip.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1789915781-QqhLh0O8VnRk
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;at1;1789915781;QqhLh0O8VnRk;<greearb@candelatech.com>;5a03f558aff5a5117b3feee4b78a8f35
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_074944_085149_7B96210A 
X-CRM114-Status: GOOD (  18.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9/19/26 20:49, Devin Wittmayer wrote:
> On 9/16/26 13:47, Ben Greear wrote:
>> +		napi_disable(&dev->napi[i]);
>>   		netif_napi_del(&dev->napi[i]);
> 
> Ben,
> 
> The warning and the softirqd spin are both real, and your 2/2 looks like
> the right place for them.
> 
> On 1/2 there is a snag. mt7921e and mt7925e already stop RX themselves,
> and they do it early:
> 
> 	mt76_unregister_device()
> 	napi_disable() on each rx queue
> 	tx_token_put()
> 	mt792x_dma_cleanup()
> 
> It has to be early. A poll still in flight can come back with a transmit
> status and take an entry out of the table tx_token_put() is tearing
> down. By the time the shared cleanup runs RX is already stopped, so a
> second disable there just sits:
> 
> 	task in D state, refcount -1
> 	napi_disable_locked <- mt76_dma_cleanup <- mt7925_pci_remove
> 
> That was on MT7927. The USB parts tear down a different way and never
> arrive, which is probably why this is easy to miss.
> 
> Would putting the disable next to the IRQ and tasklet work in your 2/2
> cover mt7996? That keeps it where the driver already knows whether it
> has stopped RX.

I have a hard time figuring out exactly how to safely tear down
the mt7996 driver, especially without breaking other mt76 drivers.

But instead of just playing whack-a-mole with this,
we should figure out if sub-driver or mt76 core should be handling this,
and add some comments of expected behaviour so we don't keep fixing one chipset
and breaking another.

Maybe Felix has an opinion on correct path forward?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


