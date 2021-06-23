Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFD9C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 15:35:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BA66611C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 15:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BA66611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:CC:To:Date:From:Subject:
	MIME-Version:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyDH61nwjs/32snGBi/8Moj7ZY6o7uuuHp9dCsVyQak=; b=APKRIRNDcpBJQj
	x+P4AWLvYwzeCDyG6nihiFMqpTasqfifXZngJTslCJoD63/lXG3Sz3INm2jQq8Q4uEaZ2UNKRNb3k
	AEqeqj8yYx8AVFH8yF49c68wqP3T6/0Zlg4sF3BcSUc9zFiwCCCYmiBqXVO7BHCXis1/7i8LMHwOe
	F3GSF0vQXTtA0xZP7D4BDWMg3Ypqr3vc/Rflz/jL1cdM/PkixPjfOkdpAuMx0Y7+tvIMFulVvT3sv
	qTpA05v0nt2XPzsTQwvcu5OefFGB9oMWLz5kH8h+EvrWZwA0tX40Hzp+8wxZmKWTYhNEDlSuZz6Jz
	h/VBXEphjeJDUPyxpukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw4un-00B811-7L; Wed, 23 Jun 2021 15:35:45 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw4ua-00B7zw-Eq; Wed, 23 Jun 2021 15:35:34 +0000
Received: by mail-ej1-x62e.google.com with SMTP id gt18so4639800ejc.11;
 Wed, 23 Jun 2021 08:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=in-reply-to:references:thread-topic:user-agent:mime-version
 :content-transfer-encoding:subject:from:date:to:cc:message-id;
 bh=0lBN5wng9HjRZe2/VE+AfmR/BJx2jekBW1owJUvPIs4=;
 b=h+Z/Q3I8U2g4dr0t/lT+8F+hVSpsLMIycNMr9vhko3jbLFZf6hap9ZtyFVnTsjN99k
 L7cDeN+imOdYOrDR6h+H1shCdYD0Upuewpi9LEYFOJyeDB+JA/zumdFHc3S7ax/u2uKY
 +yl3M+Vp6uVxVLZe5zN7mgIiNnKe9xRi/7le9+jlMQoAZqxKEOdfqm5pD4OJjgv5yXtJ
 cdGahnhHKDVphy7zDXQ0lUS0rw/AHcvBp5dkyTGt9gh1ofHwF/6Izl7iwnOpOWalJzQH
 zzVcE/h0PNoheyjVpheOy4yzb0PVhVtgF2c8uSBEns86+UWz2ZdjpQMiqwLyjKg/OFhs
 C0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:in-reply-to:references:thread-topic:user-agent
 :mime-version:content-transfer-encoding:subject:from:date:to:cc
 :message-id;
 bh=0lBN5wng9HjRZe2/VE+AfmR/BJx2jekBW1owJUvPIs4=;
 b=GtQynyMyjRaxIoSGRRBiTWtpPAblQbHHRjfD5T3bstdJI2cZR0Zxk0QTxhXsecT/tM
 USqEwlqNX3w7lFabbM9TjjnZsJR6S78M5UQUVRaBu9KL2Pcm4QyzDQctjf5iQlVowbuj
 yEUkOm5WnDWQiw/pMKiq4f6yoMzhTOJMd77hZgcwujy+hGYeBj8dSYd0fwslvN34Asmk
 DbIqK+VoxY/q3Vrv7EsLD2HepWxjh6CcAq9opoWq9xtW4BZaVYq9SisN6Str2pzAj9wr
 cUkt0BuPREF1jdPsLKHhrxGYt07Ybmj2WhYTtZ1VsAqka08vRecy+2YKxpg/HC7Y4Ub4
 GeSQ==
X-Gm-Message-State: AOAM532CJlmcJ99S8ysL6UDmz2vECiECx5NZkmZM2XWbLArPrpqzA0vb
 +ruOvET7RW8/L6dc7BOYJfw=
X-Google-Smtp-Source: ABdhPJz1gI6TE3EPMu7ywc8G3XlQhPA8Fh69loCONFm7DukNz4LavOCitwHQTB6/97WIDf1Qxt1jYQ==
X-Received: by 2002:a17:906:1704:: with SMTP id
 c4mr670525eje.182.1624462530204; 
 Wed, 23 Jun 2021 08:35:30 -0700 (PDT)
Received: from [10.69.29.103] ([89.205.226.226])
 by smtp.gmail.com with ESMTPSA id aq12sm56854ejc.77.2021.06.23.08.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 08:35:29 -0700 (PDT)
In-Reply-To: <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
References: <20210619121927.32699-1-ericwouds@gmail.com>
 <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
X-Referenced-Uid: 5577
Thread-Topic: Re: [PATCH] Fix mt7622.dtsi thermal cpu
X-Blue-Identity: !l=368&o=43&fo=3760&pl=202&po=0&qs=PREFIX&f=HTML&m=!%3ANzRiZDk5M2QtNTJhNy00MTE4LThlNmYtYTk2ZDg2NDQzNGU0%3ASU5CT1g%3D%3ANTU3Nw%3D%3D%3AANSWERED&p=171&q=SHOW
X-Is-Generated-Message-Id: true
User-Agent: Android
MIME-Version: 1.0
X-Local-Message-Id: <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
Subject: Re: [PATCH] Fix mt7622.dtsi thermal cpu
From: Eric Woudstra <ericwouds@gmail.com>
Date: Wed, 23 Jun 2021 17:35:27 +0200
To: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org,linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,linux-kernel@vger.kernel.org
Message-ID: <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_083532_565118_141EF4E4 
X-CRM114-Status: GOOD (  20.57  )
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

SXQgaXMgb25seSB1c2VmdWwgdG8gc2V0IDEgbWFwIHdpdGggdGhlIHJlZ3VsYXRlZCB0ZW1wZXJh
dHVyZSBmb3IgY3B1IGZyZXF1ZW5jeSB0aHJvdHRsaW5nLiBTYW1lIGFzIGluIHRoZSBrZXJuZWwg
ZG9jdW1lbnQgZXhhbXBsZS4KCgpJdCBoYXMgbm8gdXNlIHRvIHNldCBmcmVxdWVuY3kgc2NhbGlu
ZyBvbiAyIGRpZmZlcmVudCB0ZW1wZXJhdHVyZSB0cmlwIHBvaW50cywgYXMgdGhlIGxvd2VzdCBv
bmUgbWFrZXMgc3VyZSB0aGUgaGlnaGVyIG9uZShzKSBhcmUgbmV2ZXIgcmVhY2hlZC4gSXQgY2Fu
IGJlIGFwcGxpZWQgb25seSBhdCAxIHRyaXAgcG9pbnQuIE11bHRpcGxlIHRyaXAgcG9pbnRzIGlz
IG9ubHkgdXNlZnVsbHkgZm9yIGZhbiBjb250cm9sIHRvIG1ha2Ugc3VyZSB0aGUgZmFuIGlzIG5v
dCB0b28gbm9pc3kgd2hlbiBpdCBpcyBub3QgbmVjZXNzYXJ5IHRvIGJlIG5vaXN5LgoKClRoZSBD
UFUgd2lsbCBhbG1vc3QgY29tZSB0byBhIGRlYWQgc3RvcCB3aGVuIGl0IHN0YXJ0cyB0byBwYXNz
IHRoZSBsb3dlc3QgdGhlcm1hbCBtYXAgd2l0aCBmcmVxdWVuY3kgdGhyb3R0bGluZy4gCgpUaGlz
IGlzIHdoeSBpdCBpcyBhIGJ1ZyBhbmQgbmVlZHMgYSBmaXgsIG5vdCBvbmx5IGFkanVzdG1lbnQu
CgoKCgpUaGVyZSBpcyBubyBmYW4uLi4gT24gdGhlIGJwaSByNjQuCgoKQW55d2F5IHdpdGhvdXQg
dGhyb3R0bGluZyBhdCBhbGwgYSBrZXJuZWwgYnVpbGQgZm9yIG1vcmUgdGhlbiBhbiBob3VyIHRl
bXBlcmF0dXJlIGNyZWVwcyB1cCB0byA4NSBkZWdyZWVzLgoK4oGjR2V0IEJsdWVNYWlsIGZvciBB
bmRyb2lkIOKAiwoKT24gSnVuIDIxLCAyMDIxLCA4OjI5IFBNLCBhdCA4OjI5IFBNLCBEYW5pZWwg
TGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4gd3JvdGU6Cj5PbiAxOS8wNi8yMDIx
IDE0OjE5LCBlcmljd291ZHNAZ21haWwuY29tIHdyb3RlOgo+PiBGcm9tOiBFcmljIFdvdWRzdHJh
IDxlcmljd291ZHNAZ21haWwuY29tPgo+PiAKPj4gQ3B1LXRoZXJtYWwgaXMgc2V0IHRvIHVzZSBh
bGwgZnJlcXVlbmNpZXMgYWxyZWFkeSBhdCA0NyBkZWdyZWVzLiAKPj4gVXNpbmcgdGhlIENQVSBh
dCA1MCBmb3IgYSBtaW51dGUsIHRoZSBDUFUgaGFzIHJlYWNoZWQgNDggZGVncmVlcywgaXMgCj4+
IHRocm90dGxlZCBiYWNrIHRvIGxvd2VzdCBzZXR0aW5nLCBtYWtpbmcgdGhlIG10NzYyMiB0ZXJy
cmlibHkgc2xvdy4gCj4+IEV2ZW4gYXQgdGhpcyBsb3cgc3BlZWQsIHRoZSBDUFUgZG9lcyBub3Qg
Y29vbCBkb3duIGxvd2VyIHRoZW4gNDcgc28KPj4gdGhlIENQVSBpcyBzdHVjayBhdCBsb3dlc3Qg
cG9zc2libGUgZnJlcXVlbmN5IHVudGlsIGl0IHNodXQgZG93biBhbmQKPj4gc3RheXMgb2ZmIGZv
ciAxNSBtaW51dGVzLgo+PiAKPj4gY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9OT19M
SU1JVCBUSEVSTUFMX05PX0xJTUlUPiwKPj4gICAgICAgICAgICAgICAgICA8JmNwdTEgVEhFUk1B
TF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPjsKPj4gCj4+IFRoaXMgc2hvdWxkIG5vdCBiZSBz
ZXQgYWwgZXZlcnkgY29vbGluZyBtYXAuIEl0IHNob3VsZCBvbmx5IGJlIHNldCBhdAo+PiB0aGUg
aGlnaGVzdCBjb29saW5nIG1hcC4gU2FtZSBhcyBpbiB0aGUgZXhhbXBsZToKPj4gCj4+IGh0dHBz
Oi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy8K
Pj4gdGhlcm1hbC90aGVybWFsLnR4dCAgbGluZSAyNzIKPj4gCj4+IEJ1dCB0aGVuIHdpdGhvdXQg
dGhlIGZhbiBhbmQgYWRkZWQgYSB0aGlyZCBtYXAuCj4+IAo+PiBOb3cgdGVtcGVyYXR1cmUgd2ls
bCBiZSByZWd1bGF0ZWQgYXQgODcgZGVncmVlcyBjZWxjaXVzLiBBdAo+dGVtcGVyYXR1cmVzCj4+
IGxvd2VyIHRoZW4gODcsIGFsbCBmcmVxdWVuY2llcyBjYW4gYmUgdXNlZC4KPgo+NDfCsEMgaXMg
cmVhbGx5IGEgdG9vIGxvdyB0ZW1wZXJhdHVyZSBhbmQgdGhpcyBwZXJmb3JtYW5jZSBkcm9wIGlz
Cj5ub3JtYWwuCj4KPkkgd291bGQgbm90IHJlbW92ZSB0aGUgcGFzc2l2ZSBtaXRpZ2F0aW9uIGJ1
dCB0cnkgYnkgaW5jcmVhc2luZyB0aGUgQ1BVCj50ZW1wIHRvIDcwwrBDIGFuZCBieSBjaGFuZ2lu
ZyB0aGUgYWN0aXZlIHRyaXAgcG9pbnQgdG8gODDCsEMuIElmIGl0IHdvcmtzCj5maW5lLCB0cnkg
NzXCsEMgYW5kIDg1wrBDLgo+Cj5UbyB0ZXN0LCB0aGUgdGhlcm1hbCBraWxsZXIgaXMgZGhyeXN0
b25lIChvbmUgdGhyZWFkIHBlciBjcHUpLgo+Cj5XaXRoIGEgNzXCsEMgcGFzc2l2ZSB0cmlwIHBv
aW50LCB0aGUgc3RlcCB3aXNlIHRoZXJtYWwgZ292ZXJub3IsIEkgdGhpbmsKPnRoZSBtaXRpZ2F0
aW9uIHdpbGwgaGFwcGVuIHNtb290aGx5IHByb3ZpZGluZyBiZXR0ZXIgcGVyZm9ybWFuY2VzLCBh
bmQKPnByb2JhYmx5IHRoZSBmYW4gd29uJ3QgZmlyZS4KPgo+PiBBbHNvIHNlZSB0aGUgcG9zdDoK
Pj4gCj4+IGh0dHA6Ly9mb3J1bS5iYW5hbmEtcGkub3JnL3QvYnBpLXI2NC1vbmx5LTEwLWNwdS1z
cGVlZC1hdC1hbHJlYWR5LTQ4LQo+PiBkZWdyZWVzLWNlbGNpdXMtc3BlZWQtbm90LWluY3JlYXNp
bmctYW55bW9yZS8xMjI2Mgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogRXJpYyBXb3Vkc3RyYSA8ZXJp
Y3dvdWRzQGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210NzYyMi5kdHNpIHwgOCArKysrLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210NzYyMi5kdHNpCj5iL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsv
bXQ3NjIyLmR0c2kKPj4gaW5kZXggODkwYTk0MmVjLi5iNzc5YzdhYTYgMTAwNjQ0Cj4+IC0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3NjIyLmR0c2kKPj4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaQo+PiBAQCAtMTcwLDE0ICsxNzAsMTQg
QEAgY3B1LWNyaXQgewo+PiAgCQkJY29vbGluZy1tYXBzIHsKPj4gIAkJCQltYXAwIHsKPj4gIAkJ
CQkJdHJpcCA9IDwmY3B1X3Bhc3NpdmU+Owo+PiAtCQkJCQljb29saW5nLWRldmljZSA9IDwmY3B1
MCBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+LAo+PiAtCQkJCQkJCSA8JmNwdTEg
VEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPjsKPj4gKwkJCQkJY29vbGluZy1kZXZp
Y2UgPSA8JmNwdTAgMCAwPiwKPj4gKwkJCQkJCQkgPCZjcHUxIDAgMD47Cj4+ICAJCQkJfTsKPj4g
IAo+PiAgCQkJCW1hcDEgewo+PiAgCQkJCQl0cmlwID0gPCZjcHVfYWN0aXZlPjsKPj4gLQkJCQkJ
Y29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlU
PiwKPj4gLQkJCQkJCQkgPCZjcHUxIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47
Cj4+ICsJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZjcHUwIDAgMD4sCj4+ICsJCQkJCQkJIDwmY3B1
MSAwIDA+Owo+PiAgCQkJCX07Cj4+ICAKPj4gIAkJCQltYXAyIHsKPj4gCj4KPgo+LS0gCj48aHR0
cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUg
Zm9yIEFSTSBTb0NzCj4KPkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20v
cGFnZXMvTGluYXJvPiBGYWNlYm9vayB8Cj48aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29y
Zz4gVHdpdHRlciB8Cj48aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
