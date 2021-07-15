Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881BEC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 07:24:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F16A601FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 07:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F16A601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hO4vuHQH6/J4WlSbk9zjeLQzNFTd3srgxMv6q/GGT+8=; b=Q3nU/VVzewJuu6Za6/Uk6RlLwh
	7WD/dEzY1tIYKFGVgiFEXVDRC491BqC/e8Ztjycgv/gwHMkiZh/UI5Kng1bHluBZcb7VwzI0k5vC5
	Pb3NKImfVBkudnQr9nHc24uXN9dsj+1pVYP7Y2pcpvCC8RrS/Qh5oZl4neQPSeVoovz6BqdstyAyw
	IsnsM7RdsC1yrir0n7d7qZaFQogJb5kXhy8vIH0KOsDVsPOfekRWzPRT/QxC6jpX644RToKvfH64A
	fuJkMZGB0pHyrPTGujxgJ7SYnPC4jkuObbzZUPe9Eeh7H2eCL3FH7T69s/fVH9yve7rCtN6yfmPKY
	8afFEPBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3vjG-00HNo6-1x; Thu, 15 Jul 2021 07:24:18 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3vjB-00HNnQ-PX
 for linux-mediatek@lists.infradead.org; Thu, 15 Jul 2021 07:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626333843;
 bh=msxtzCvlewYhrhVU0LSy4lMuT9m7cylRVVX5BkTA59s=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=OId46IPzfu7tRfDOdC988U6EX6tCReKzXdufG5hViy1jbDR3bgPXSN5vyctUFqZrn
 BoYc5KitAqzZcvdi8pjBB8LezL7NOXGeGPP21nY+HWFwwDD75M7QvaFqw0tQqBOz6R
 MpWI6EWWK8R3RAIptaw8Q/ajngLzqnoZck5sTzfM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.21] ([80.245.79.66]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAOJP-1ls4y13tYh-00BsX6; Thu, 15
 Jul 2021 09:24:02 +0200
Subject: Re: mt7530 cannot delete fdb self entries with vlan other then vlan
 number 1
To: Eric Woudstra <ericwouds@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen.Chao@mediatek.com, dqfext@gmail.com
Cc: linux-mediatek@lists.infradead.org
References: <CABROOSduRQrD8g7DSYoVfjSRA_qWHPHdWrmFnKKq7SMUGPvWgw@mail.gmail.com>
From: Frank Wunderlich <frankwu@gmx.de>
Message-ID: <71b20889-5baf-f112-92bb-bc888c3a6f9e@gmx.de>
Date: Thu, 15 Jul 2021 09:24:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CABROOSduRQrD8g7DSYoVfjSRA_qWHPHdWrmFnKKq7SMUGPvWgw@mail.gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:asvydMy8rFTfhNZm+JHcI6j84zAZr04BaYyIEGtqf2Qr4e04q2A
 7kebUuYP4onMlSrv7qUj/DxoRnTtV+zj4uqH+yfk1j57mzrNuAfFtUsUzUO7TY1TGOYNxSZ
 xU/D8L40qRAjnsty59eYmTydXH0WnJLbL1XlMk04FFH9FKiDfw+XlcXk4XCBq48GChagF5O
 u4kWGthurEwsaqlHaRtEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OGgokzE4r7E=:GBHiovuf8+zvTHBIC1Eg5p
 uU9v1yh0a0QdQ97bNegujl3sBjBltvjg23x5Ke/x2UBKlfG+NTRRr9ssd0IM+8mKJttow73MJ
 hHuqmkaqbvwEtmUDGScKWce/9BjIJCx79Chu4RFLDxa/wtXNI+S46+o3BC7emM7ReiESPbRus
 GFQeuq18oBSKVSoU9newT8gMgDzC7M3UwAEC/Uy92aADu2/xiWbEe3tHbMXYJWPD9SWL1yDyB
 8qvYSNNxWcEOv3rtHSBDFgDOKXT+HJgQdmoILYviNRLWF5/h0++oeK9IBuVxZHPkYUkgJ/I9O
 nWvA1s+t2KGnYDPndG5ABGmPUiEMfq5OZI0BnHcawyqEV0+qjZehaD6oK0tykywKyFthvCakr
 Kng4LtYfqrnmPhMufSx6SYK8KcJObw6a29vrWPF6pNBYxbwdKJnKxATPrAbumjLwTnNn0F3o0
 lGuJt4Ez8D5tTcVad0DQX4J/+wQ0EVt9kKt54TwHWjA2l62g2C7Ov2yDBkDOr8G8KPreFspsM
 RuE+h3oFg+cDZmIg2UGiGSXdpVG1Zm+V0/S0c1a7eNKkKqemy5PcIlm2Fz+JSHoeeVMrr7ATg
 xXZ+HzQhHsXrJQe24ad07pm8QNi7TrxGS4K0uWdrcZ6MGNnUayZ+xgBY4WX/ueCSQygnTzCOr
 eK6xsjW81sgx/GxgmO+qcguuNIs6tLYhflPvgLTS48w5GpWk3vFnmpr8qbBVJbIVtmdgb/7wA
 iNSzQ/2hfO/QSznoANETQy9zLK5B9sxwmw1tVjUCGE3FMKWYQ7P85uTfbpLuZN6RVUIS37NYk
 N4F3cAkOW7pkpJ64zuKJj5q/NLbhvUgNZYDJby0IpZMv2LPUnDEn6l9g6xrg8QxBLJoauRQVq
 ZMWQlj4bJXJdjdIExL4///rw3SpH0grkSgkh5NPysf8YKnir5LTtMA2s8cNMW39NiFK0AzwF9
 iVRJAWMZt8jJPZIueMVO9GVhh8RydF8vR5ma4v4EDSrWNoYs/jHHRpAS193lW7+Irl8+FMp6h
 QPbo4MJVqyf2GJ1gxMrLR9hxGs2ZHfPSxsrZ7ccU6+wB6Iadt/GNDXUje1opce8y0pt7dtlmL
 6ra1esj9lIlzF/Tz1rUHAP9mV/cZsBlhSOR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_002414_163587_765DC504 
X-CRM114-Status: GOOD (  22.72  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksCgpqdXN0IGEgZ2VudGxlIHBpbmcsIGFueSBpZGVhIG9uIHRoaXMgYmVoYXZpb3VyPwoKcmVn
YXJkcyBGcmFuawoKRXJpYyBXb3Vkc3RyYSBzY2hyaWViIGFtIDE5LjA2LjIxIHVtIDE0OjM1Ogo+
IEFib3V0OiBkcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMKPgo+IFdoZXJlIGRvIEkgZ28gd2l0aCB0
aGlzIGJ1ZyByZXBvcnQ/Cj4KPiBJdCB3YXMgZGlzY3Vzc2VkIGhlcmU6IGh0dHA6Ly9mb3J1bS5i
YW5hbmEtcGkub3JnL3Qvdmxhbi1lbmFibGVkCj4gLWJyaWRnZS1idWcvMTIyNTQKPgo+IFRoZSBt
dDc1MzAgZHJpdmVyIGRvZXMgbm90IHNlZW0gdGUgYmUgYWJsZSB0byBkZWxldGUgZmRiICdzZWxm
JyBlbnRyaWVzLAo+IGZvciB2bGFuIG51bWJlcnMgb3RoZXIgdGhlbiAxLiBUaGlzIGFmZmVjdHMg
d2xhbiByb2FtaW5nIHdoZW4gdmxhbgo+IGlzIGVuYWJsZWQuCj4KPiBUZXN0ZWQgb24ga2VybmVs
IDUuMTIuIEluIGFsbCBjYXNlcyB0aGUga2VybmVsIGlzIGNvbXBpbGVkIHdpdGgKPiBDT05GSUdf
QlJJREdFX1ZMQU5fRklMVEVSSU5HPXkuCj4KPgo+IEhlcmUgaXMgYSBtb3JlIGNvbXBsZXRlIGRl
c2NyaXB0aW9uOgo+Cj4gTmV0d29yayBzZXR1cCB3aXRoIHZsYW46Cj4KPiBpcCBsaW5rIHNldCBl
dGgwIHVwCj4gaXAgbGluayBhZGQgbmFtZSBicjAgdHlwZSBicmlkZ2Ugdmxhbl9maWx0ZXJpbmcg
MSB2bGFuX2RlZmF1bHRfcHZpZCAzCj4gaXAgbGluayBzZXQgYnIwIHVwCj4gaXAgbGluayBzZXQg
bGFuMCBtYXN0ZXIgYnIwCj4gaXAgbGluayBzZXQgbGFuMCB1cAo+Cj4gTmV0d29yayBzZXR1cCB3
aXRob3V0IHZsYW46Cj4KPiBpcCBsaW5rIHNldCBldGgwIHVwCj4gaXAgbGluayBhZGQgbmFtZSBi
cjAgdHlwZSBicmlkZ2UKPiBpcCBsaW5rIHNldCBicjAgdXAKPiBpcCBsaW5rIHNldCBsYW4wIG1h
c3RlciBicjAKPiBpcCBsaW5rIHNldCBsYW4wIHVwCj4KPiBCb3RoOgo+Cj4gaXAgYWRkciBhZGQg
MTkyLjE2OC4xLjMzLzI0IGJyb2FkY2FzdCAxOTIuMTY4LjEuMjU1IGRldiBicjAKPiBpcCByb3V0
ZSBhZGQgMTkyLjE2OC4xLjAvMjQgZGV2IGJyMAo+IGlwIHJvdXRlIGFkZCBkZWZhdWx0IHZpYSAx
OTIuMTY4LjEuMQo+Cj4KPiBUaGUgQlBJLVI2NCBpcyBjb25uZWN0ZWQgd2l0aCBsYW4wIHRvIGEg
bGFuIHBvcnQgb2YgbXkgcm91dGVyLiBUaGVuIEkKPiBjb25uZWN0IG15IHBob25lIHdpdGggbWFj
IGFhOmJiOmNjOmRkOmVlOmZmIHRvIG15IHJvdXRlci4gVGhlbiBJCj4gZGlzYWJsZSB0aGUgd2lm
aSBvZiBteSBwaG9uZSBzbyBubyBtb3JlIHBhY2tldHMgd2l0aCB0aGlzIG1hYyBhcmUgc2VudAo+
IG9uIHRoZSBuZXR3b3JrLgo+Cj4gQnJpZGdlIGNyZWF0ZWQgd2l0aCB2bGFuX2ZpbHRlcmluZyAx
IHZsYW5fZGVmYXVsdF9wdmlkIDMKPgo+IHJvb3RAYnBpLXI2NDp+IyBicmlkZ2UgZmRiIHwgZ3Jl
cCBhYTpiYjpjYzpkZDplZTpmZgo+IGFhOmJiOmNjOmRkOmVlOmZmIGRldiBsYW4wIHZsYW4gMyBt
YXN0ZXIgYnIwCj4gYWE6YmI6Y2M6ZGQ6ZWU6ZmYgZGV2IGxhbjAgdmxhbiAzIHNlbGYKPiByb290
QGJwaS1yNjQ6fiMgYnJpZGdlIGZkYiBkZWwgYWE6YmI6Y2M6ZGQ6ZWU6ZmYgZGV2IGxhbjAgdmxh
biAzIHNlbGYKPiByb290QGJwaS1yNjQ6fiMgYnJpZGdlIGZkYiB8IGdyZXAgYWE6YmI6Y2M6ZGQ6
ZWU6ZmYKPiBhYTpiYjpjYzpkZDplZTpmZiBkZXYgbGFuMCB2bGFuIDMgc2VsZgo+IHJvb3RAYnBp
LXI2NDp+Iwo+Cj4gQnJpZGdlIGNyZWF0ZWQgd2l0aG91dCB2bGFuX2ZpbHRlcmluZyAxIHZsYW5f
ZGVmYXVsdF9wdmlkIDMKPgo+IHJvb3RAYnBpLXI2NDp+IyBicmlkZ2UgZmRiIHwgZ3JlcCBhYTpi
YjpjYzpkZDplZTpmZgo+IGFhOmJiOmNjOmRkOmVlOmZmIGRldiBsYW4wIG1hc3RlciBicjAKPiBh
YTpiYjpjYzpkZDplZTpmZiBkZXYgbGFuMCB2bGFuIDEgc2VsZgo+IHJvb3RAYnBpLXI2NDp+IyBi
cmlkZ2UgZmRiIGRlbCBhYTpiYjpjYzpkZDplZTpmZiBkZXYgbGFuMCB2bGFuIDEgc2VsZgo+IHJv
b3RAYnBpLXI2NDp+IyBicmlkZ2UgZmRiIHwgZ3JlcCBhYTpiYjpjYzpkZDplZTpmZgo+IHJvb3RA
YnBpLXI2NDp+Iwo+Cj4gTGF0ZXIgSSBmb3VuZCBvdXQgdGhhdCB0aGUgZmRiIHNlbGYgZW50cnkg
Y2FuIGJlIGRlbGV0ZWQgd2l0aAo+IHZsYW5fZmlsdGVyaW5nIGVuYWJsZWQsIGJ1dCB3aXRoIHZs
YW4gbnVtYmVyIDEgb25seS4KPgo+IE5vdyBJIGhhdmUgdGVzdGVkIHdpZmkgcm9hbWluZyBvbiBh
IGhvbWUgbmV0d29yayBjb25uZWN0ZWQKPiByb3V0ZXItbGFuIHRvIGJwaXI2NC1sYW4uCj4KPiBU
aGlzIGlzIHdpdGggZW5hYmxlZCB2bGFuLCB2bGFuIDEuIEZpcnN0IGNvbW1hbmQsIHBob25lIGNv
bm5lY3RlZCB0bwo+IHJlbW90ZSByb3V0ZXIsIHNlY29uZCBjb21tYW5kLCBwaG9uZSByb2FtZWQg
dG8gQlBJLVI2NC4KPgo+IHJvb3RAYnBpLXI2NDp+IyBicmlkZ2UgZmRiIHwgZ3JlcCBhYTpiYjpj
YzpkZDplZTpmZgo+IGFhOmJiOmNjOmRkOmVlOmZmIGRldiBsYW4wIHZsYW4gMSBtYXN0ZXIgYnJs
YW4KPiBhYTpiYjpjYzpkZDplZTpmZiBkZXYgbGFuMCB2bGFuIDEgc2VsZgo+IHJvb3RAYnBpLXI2
NDp+IyBicmlkZ2UgZmRiIHwgZ3JlcCBhYTpiYjpjYzpkZDplZTpmZgo+IGFhOmJiOmNjOmRkOmVl
OmZmIGRldiB3bGFuMCB2bGFuIDEgbWFzdGVyIGJybGFuCj4KPiBQaG9uZSBoYXMgZ29vZCBpbnRl
cm5ldCBjb25uZWN0aXZpdHkgOnNsaWdodF9zbWlsZToKPgo+IE5vdyB0aGUgc2FtZSBzZXR1cCBi
dXQgd2l0aCB2bGFuIDIKPgo+IHJvb3RAYnBpLXI2NDp+IyBicmlkZ2UgZmRiIHwgZ3JlcCBhYTpi
YjpjYzpkZDplZTpmZgo+IGFhOmJiOmNjOmRkOmVlOmZmIGRldiBsYW4wIHZsYW4gMiBtYXN0ZXIg
YnJsYW4KPiBhYTpiYjpjYzpkZDplZTpmZiBkZXYgbGFuMCB2bGFuIDIgc2VsZgo+IHJvb3RAYnBp
LXI2NDp+IyBicmlkZ2UgZmRiIHwgZ3JlcCBhYTpiYjpjYzpkZDplZTpmZgo+IGFhOmJiOmNjOmRk
OmVlOmZmIGRldiBsYW4wIHZsYW4gMiBzZWxmCj4gYWE6YmI6Y2M6ZGQ6ZWU6ZmYgZGV2IHdsYW4w
IHZsYW4gMiBtYXN0ZXIgYnJsYW4KPgo+IFRoaXMgbGFzdCByZXN1bHQgbWFrZXMgdGhlIHBob25l
IG5vdCBhYmxlIHRvIHJlYWNoIHRoZSBkaGNwCj4gc2VydmVyIChvbiB0aGUgcmVtb3RlIHJvdXRl
cikuIE5vIGNvbm5lY3Rpdml0eS4KPgo+IFRoZSBmaXgg4oCYbmV0OiBkc2E6IG10NzUzMDogZml4
IHJvYW1pbmcgZnJvbSBEU0EgdXNlciBwb3J0c+KAmSBkb2VzIG5vdCB3b3JrCj4gYW55bW9yZSB3
aGVuIHZsYW4gaWQgZG9lcyBub3QgZXF1YWwgMS4KPgo+IEkgZ3Vlc3MgaXQgc3VmZmVycyBmcm9t
IHRoZSBzYW1lIGJ1ZyB0aGF0IGZkYiDigJhzZWZm4oCZIGVudHJpZXMgd2l0aCB2bGFu4oCZcwo+
IG90aGVyIHRoYW4gMSBjYW5ub3QgYmUgZGVsZXRlZC4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKPgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
