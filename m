Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFB3C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 08:06:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3F5861107
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 08:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3F5861107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s2ZKclHHdLyAKUYfd7F8f3NzTSz4DUWzmwgiN4SKYsI=; b=iEUd/pFNZBAFwFZ+l2jQhUS5U
	ldZtkNLx5bOUfubuCTFdiBJAq992ycmHzaM3zNWVkjESZv0hR1YLdQnI0BcO+slmEnkbOrswm3N9e
	vxDjHsGbXfh9zXt2uTEHBmS58QT/AKaaF1fAlc2NMo2VsZZ0FSDHf8P3s76zl9GqMq8Hn1DpultVZ
	chyHTBZWgMs451zb2EJZc1GVHKWvas+Z4qmh5NENcfbEFADVlrO6uWJuIGPHaiyeCcM59ThqqhTWn
	4S/Stvr0EQnUoUYmvth/C2fwwLAQJYANPrTqLCvAY+Kjm4RACxbjxnp1zxRU5Gy+0QWIaKSDb3V1Q
	Vqzfn5nIg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYOvQ-009P8X-L4; Mon, 19 Apr 2021 08:06:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOvG-009P7x-QR; Mon, 19 Apr 2021 08:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=OCWt1hkNl/QTqD2tSUx56uautrqcqnCVc8c+EVejDWs=; b=WpqOcqoenAeJcyU6LaXoDb5i28
 LkjY/vD2MXOv3hcO/oZ2jiFQXzAcM9w77YsNL6pXu7qcl/tcmYHmwoWG/TRzOJc4CM/Qf8BuSlkpw
 HG0fK92L69qCjOaD4WOstBtZy58orVtn8tbNy62r35Aea25dBp0xQeVX5M+yPydek9cLyd4kac9Kx
 CGrxbIZ61M5pkTHaABam0J8AcFwKj2ESGjyEGgN/0DyHv5nFouwn0QXLnFovXZ+9g8u1NgIomfda5
 jUk5C986pYnrr9CCGyrmGOe7RoOBV5IUoia/ezfTH/M5zGvDrLrSJJAPyY/OZZZsb/1hlmDsrpgjK
 2QBXvcHw==;
Received: from mail.netfilter.org ([217.70.188.207])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOvB-00BAT9-CK; Mon, 19 Apr 2021 08:06:21 +0000
Received: from us.es (unknown [90.77.255.23])
 by mail.netfilter.org (Postfix) with ESMTPSA id C36A063E49;
 Mon, 19 Apr 2021 10:05:42 +0200 (CEST)
Date: Mon, 19 Apr 2021 10:06:10 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: Felix Fietkau <nbd@nbd.name>, "David S. Miller" <davem@davemloft.net>,
 Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: drivers/net/ethernet/mediatek/mtk_ppe_offload.c - suspicious code?
Message-ID: <20210419080610.GA24040@salvia>
References: <526789.1618794132@turing-police>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <526789.1618794132@turing-police>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_010617_598180_D96E26BD 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBBcHIgMTgsIDIwMjEgYXQgMDk6MDI6MTJQTSAtMDQwMCwgVmFsZGlzIEtsxJN0bmll
a3Mgd3JvdGU6Cj4gV2hpbGUgZG9pbmcgc29tZSBjb2RlIGF1ZGl0aW5nIGZvciAtV292ZXJyaWRl
X2luaXQsIEkgc3BvdHRlZCBzb21lIHF1ZXN0aW9uYWJsZSBjb2RlCj4gCj4gY29tbWl0IDUwMmU4
NGUyMzgyZDkyNjU0YTJlY2JjNTJjZGJkYjVhMTFjZGNlYzcKPiBBdXRob3I6IEZlbGl4IEZpZXRr
YXUgPG5iZEBuYmQubmFtZT4KPiBEYXRlOiAgIFdlZCBNYXIgMjQgMDI6MzA6NTQgMjAyMSArMDEw
MAo+IAo+ICAgICBuZXQ6IGV0aGVybmV0OiBtdGtfZXRoX3NvYzogYWRkIGZsb3cgb2ZmbG9hZGlu
ZyBzdXBwb3J0Cj4gCj4gSW4gZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX3BwZV9v
ZmZsb2FkLmM6Cj4gCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgcmhhc2h0YWJsZV9wYXJhbXMgbXRr
X2Zsb3dfaHRfcGFyYW1zID0gewo+ICsgICAgICAgLmhlYWRfb2Zmc2V0ID0gb2Zmc2V0b2Yoc3Ry
dWN0IG10a19mbG93X2VudHJ5LCBub2RlKSwKPiArICAgICAgIC5oZWFkX29mZnNldCA9IG9mZnNl
dG9mKHN0cnVjdCBtdGtfZmxvd19lbnRyeSwgY29va2llKSwKPiArICAgICAgIC5rZXlfbGVuID0g
c2l6ZW9mKHVuc2lnbmVkIGxvbmcpLAo+ICsgICAgICAgLmF1dG9tYXRpY19zaHJpbmtpbmcgPSB0
cnVlLAo+ICt9Owo+IAo+IFdoYXQncyBpbnRlbmRlZCBmb3IgaGVhZF9vZmZzZXQgaGVyZT8KCkl0
J3MgYSBidWcsIHRoZXJlJ3MgYSBmaXggaGVyZToKCmh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xp
c3RzL25ldGRldi9tc2c3MzYzNjguaHRtbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
