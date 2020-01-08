Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BA2C282DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 14:01:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DB3020705
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 14:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TuA6gRcd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DB3020705
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mclink.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=c/O5AbA59S6CMQcPb6wAUMYAsmeo7G7Clp6BrEbXbvc=; b=TuA6gRcdUIsN6q0KQsT6yCFmTT
	oNT7CAz2GHUiSic8no9E8Gbryh/22QkFA0Tak/CkaL73Lu9hsjtoMpZpFCbtI7e8vT/sOAg7reY7n
	048mLPbkbTsSSqHL+psU2YxkLGVWp4z+obXl5LCjcHvCpLWrSwKg/rZNKnpK5vQOWJ7MkYzl9Op3c
	UYe4eht7JM0NaYtYhm9rNuSXr/rF10Ok8vDqJg1ybvuxVqLAf5eW9b5KFzRFm33wq79IaUALDsn7L
	SbCHZXpzKDUTeL3mwn3SKfJZrjYlYXxJna7TKtL4NkJVdSdxTePYGVcyf5S/iJaMYQxQIMdXvXzGh
	c/0IYdSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipBtW-0006UT-Fu; Wed, 08 Jan 2020 14:01:10 +0000
Received: from relaygw1-4.mclink.it ([213.21.178.135])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipBtR-0006Rp-Gt
 for linux-mediatek@lists.infradead.org; Wed, 08 Jan 2020 14:01:08 +0000
Received: from [172.24.30.41] (HELO smtpoutgw1.mclink.it)
 by relaygw1-4.mclink.it (CommuniGate Pro SMTP 6.0.2)
 with ESMTP id 169307107 for linux-mediatek@lists.infradead.org;
 Wed, 08 Jan 2020 15:00:58 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BdAAB/3xVe//jaMU8NWRoBAQEBAQEBA?=
 =?us-ascii?q?QEDAQEBAREBAQECAgEBAQGBfAKITZEtg26GAI9OgXoJAQEBAQEBAQEBNwEBhEA?=
 =?us-ascii?q?Cgg46BA0CEAEBBQEBAQEBBQSMDwEBAQMjDwFWCxgCAiYCAlcGAQwIAQGDHoJTq?=
 =?us-ascii?q?yd1gTKFT4MzgT2BDigBjHGBQYE4gmw+gQSGVYJeBIE/AQEBi32hZwEGAoFfWZY?=
 =?us-ascii?q?bBhuaYYRDihCcfAyBa4JegU9PJY0eDAuOJJELXwEB?=
Received: from host248-218-dynamic.49-79-r.retail.telecomitalia.it (HELO
 [192.168.7.118]) ([79.49.218.248])
 by smtpoutgw1.mclink.it with ESMTP; 08 Jan 2020 15:00:51 +0100
Subject: Re: MT7628AN Device Tree settings
To: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
References: <f4c98274-4213-342d-df7f-4e066090d8af@mclink.it>
 <f883bb84-2e4c-ae10-fddf-e276d853a004@gmail.com>
From: Mauro Condarelli <mc5686@mclink.it>
Message-ID: <d1b93f7f-997b-e1a9-9cfb-f2fd02552b70@mclink.it>
Date: Wed, 8 Jan 2020 15:00:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <f883bb84-2e4c-ae10-fddf-e276d853a004@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_060105_750055_D1D02D65 
X-CRM114-Status: UNSURE (   8.45  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxLzgvMjAgMTI6MDggUE0sIE1hdHRoaWFzIEJydWdnZXIgd3JvdGU6Cj4KPiBPbiAwNy8w
MS8yMDIwIDExOjM4LCBNYXVybyBDb25kYXJlbGxpIHdyb3RlOgo+PiBJIGFtIHRyeWluZyB0byBm
dWxseSBjb25maWd1cmUgYSBjdXN0b20gYm9hcmQgYmFzZWQgb24gVm9Db3JlMiBTb00KPj4gc3Bv
cnRpbmcgYSBNVDc2MjhBTiBTb0MuCj4+Cj4+IEJhc2ljIGZ1bmN0aW9uYWxpdHkgd29ya3MsIGJ1
dCBzZXZlcmFsIHN1YnN5c3RlbXMgYXJlIHN0aWxsIG5vdAo+PiBjb25maWd1cmVkIHByb3Blcmx5
Lgo+Pgo+PiBJbiBwYXJ0aWN1bGFyIEknbSBzdHJ1Z2dsaW5nIHdpdGg6Cj4+Cj4+IC0gV2F0Y2hk
b2c6IGl0J3Mgd29ya2luZyBpbiBVLUJvb3QsIGJ1dCBhcHBhcmVudGx5IG5vdCBpbiBMaW51eCBr
ZXJuZWwKPj4gwqAgKEkgc2VlIG5vIC9kZXYvd2F0Y2hkb2cpCj4+Cj4gRGlkIHlvdSBjaGVjayB0
aGF0IGRyaXZlcnMvd2F0Y2hkb2cvbXQ3NjIxX3dkdC5jIGlzIGNvbXBpbGVkIGluIHRoZSBrZXJu
ZWwvYXMgYQo+IG1vZHVsZT8KPgo+IENvbXBhdGlibGUgbWF0Y2hpbmcgaXMgcHJlc2VudCBzbyBh
dCBsZWFzdCB0aGUgZHJpdmVyIHNob3VsZCBwcm9iZS4KPgo+IFJlZ2FyZHMsCj4gTWF0dGhpYXMK
WW91IGFyZSByaWdodC4KV0RUIGlzIHdvcmtpbmcgbm93LgpUaGFua3MuCgoKPj4gLSBSTkc6IElG
RiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5IE1UNzYyOCBoYXMgYSBtdDc2MjMtY29tcGF0aWJsZQo+
PiBoYXJkd2FyZSBSTkcuCj4+IMKgIFVuZm9ydHVuYXRlbHkgSSB3YXMgdW5hYmxlIHRvIGZpbmQg
c3BlY2lmaWMgZG9jdW1lbnRhdGlvbiBhbmQgdGh1cyBJCj4+IGNhbid0IHdyaXRlCj4+IMKgIHRo
ZSBuZWVkZWQgLmR0cyBzdGFuY2UuCkFueSBoaW50IGhlcmU/Cgo+Pgo+PiBDYW4gc29tZW9uZSBw
b2ludCBtZSBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uPwo+PiBUaGlzIGlzLCBvZiBjb3Vyc2UsIGEg
cHJlbGltaW5hcnkgaW5xdWlyeSwgSSdtIGZ1bGx5IHByZXBhcmVkIHRvIGdpdmUKPj4gYWxsIGRl
dGFpbHMgYW5kCj4+IHRvIGZvbGxvdyBhbnkgbmVlZGVkIHByb2NlZHVyZSB0byBpbmNvcnBvcmF0
ZSByZXN1bHRzIHVwc3RyZWFtLgo+Pgo+PiBIYXBweSBOZXcgWWVhciEKPj4gTWF1cm8gQ29uZGFy
ZWxsaQpSZWdhcmRzCk1hdXJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
