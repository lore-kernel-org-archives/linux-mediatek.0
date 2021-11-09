Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30033C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 08:47:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E36611C1
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 08:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4E36611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRYOHJXd2rxI/hN5cSWOzlGqb5SlSO1hyXINXeBNP4g=; b=ZktXDwGMqpYjPL63Y/2ULt7A8y
	tO8KqTPsyjamW6vb9YMwrf6XvCPU7ZcLELrL6oMws0kbZ17dOKnA5tPqjxwFS9vamK8e940vaGC2w
	nYUG/937fLkRPIDvB0Bi4xuQVuqrHq8GmuW3rv0l18HyFPFYwEGIuzAnliPT96dMkmKppT/Wv+EAc
	TaxwYEuozuAviqBu0xag0q/GddNUv3vqKcjvAGnUtqvPZh/SDqVIjoe5RURlPnn4qNImHUpEMmYz6
	zlP5s0FFZknOMI+F4yC2uynqHLRbHk6lCPFMZG2OxH/IHw8CpZ/e/9iJKdlRGxY6zeqntgGDe7LpI
	xsVmiczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMnC-0015EU-Ki; Tue, 09 Nov 2021 08:47:46 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMmS-001511-JB
 for linux-mediatek@lists.infradead.org; Tue, 09 Nov 2021 08:47:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 1D8A11F44A93
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636447617; bh=GySPsgHaKHrbESaRknpPqJF3dfnlOanZggmDxueWuAY=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=Bso2Z5D1IbJa9dLWHgk6/zlDzpD6MXQzyRIT2GOEbs9Qi31+WEwrythdC2Ao7Iabh
 Rt8akCUOB+Y9tWDh05UKiLlh6SBVzEW5ofb+twAyF1VVTHn3hbd6DmFY3AzhnTbqCx
 7S9hJ4GfBN7k5gWGJw+7KbM7J/1GdGDkMoDN0O5Qa/E52Ikjzm9qh5cm4dmZRwY/AU
 32BXQ6CzxvgmuAHriZGVppDWpxP7ffl5xIGXsY9c43hC9Jlj3jax2dPKClktF+01iY
 zPlZqLXAhYI5wSW/MAvQ7yPm5slnJ60U4Ki1Ub5CGuqLOdRGlAtErZo5+zsngvgGiy
 +QHrr+RO6+EjQ==
Subject: Re: [PATCH v4] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>, houlong wei
 <houlong.wei@mediatek.com>, Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Dafna Hirschfeld <dafna3@gmail.com>,
 =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>,
 =?UTF-8?B?TWluZ2hzaXUgVHNhaSAo6JSh5piO5L+uKQ==?=
 <Minghsiu.Tsai@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
 <c59b7f40-d99e-370a-b797-5dc72979df46@xs4all.nl>
 <CAPBb6MW_i1_Lh2ZaF8jGjcV-4XBhjswtyKkZCk3HxKO7LX79Og@mail.gmail.com>
 <9475ac5b-79fe-da0e-ed1c-a91275cad46e@collabora.com>
 <c01c2c6e2351c915fb6e55b025bf2ab5c449f045.camel@mediatek.com>
 <8dfc07306b853126e8109fc953fd6388b63c65d2.camel@mediatek.com>
 <4e7ff420-f67d-5d4a-8733-f4b83d80af13@collabora.com>
Message-ID: <428f216d-cdff-e22d-b96e-f9dd9cc158e3@collabora.com>
Date: Tue, 9 Nov 2021 10:46:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4e7ff420-f67d-5d4a-8733-f4b83d80af13@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_004700_918723_C24F25A7 
X-CRM114-Status: GOOD (  25.87  )
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

CgpPbiAwMy4xMS4yMSAxMzowNCwgRGFmbmEgSGlyc2NoZmVsZCB3cm90ZToKPiAKPiAKPiBPbiAw
My4xMS4yMSAxMDoxOSwgSXJ1aSBXYW5nIHdyb3RlOgo+PiBIaSwKPj4KPj4gVGhlICJsZW4iIG9m
IHNoYXJlX2J1ZiBjb3BpZWQgc2hvdWxkIGJlIGFsd2F5cyA4IGFsaWdubWVudDsKPj4gZG8geW91
IGhhdmUgb3RoZXIgbG9ncyB0byBwcm92ZSB0aGUgbGVuIGlzIG5vdCA4IGFsaWdubWVudCB3aGVu
IGVycm9ycwo+PiBhcHBlYXI/Cj4gCj4gSGksIEkgZm91bmQgb3V0IHRoYXQgInNpemVvZihtZHBf
aXBpX2NvbW0pID0gMjAiCj4gdGhpcyBpcyBkdWUgdG8gdGhlIG1hY3JvICNwcmFnbWEgcGFjayhw
dXNoLCA0KSBpbiBtdGtfbWRwX2lwaS5oCj4gCj4gc2VlIFsxXQo+IAo+IFsxXSBodHRwOi8vbGtt
bC5pdS5lZHUvaHlwZXJtYWlsL2xpbnV4L2tlcm5lbC8yMTA5LjIvMDQ5NzguaHRtbAo+IAoKSGkg
SXJ1aSBXYW5nLApBbnkgdXBkYXRlIHJlZ2FyZGluZyB0aGF0IHBhdGNoPwpDYW4geW91IGdpdmUg
bW9yZSBleHBsYW5hdGlvbiBmb3IgdGhhdCBlcnJvcnMgdGhhdCB3ZSBzZWUKd2hlbiB0aGUgYnVm
ZmVyIHNpemUgaXMgbm90IGEgbXVsdGlwbGUgb2YgOD8KClRoYW5rcywKRGFmbmEKCj4gVGhhbmtz
LAo+IERhZm5hCj4gCj4+Pj4gWzU4LjM1MDg0MV0gbXRrLW1kcCAxNDAwMTAwMC5yZG1hOiBwcm9j
ZXNzaW5nIGZhaWxlZDogLTIyCj4+Cj4+IE9uIFdlZCwgMjAyMS0xMS0wMyBhdCAxNjowMyArMDgw
MCwgaG91bG9uZyB3ZWkgd3JvdGU6Cj4+PiBBZGQgbXRrLXZwdSBkcml2ZXIgZXhwZXJ0IGlydWku
d2FuZyBpbiB0aGUgbG9vcC4KPj4+Cj4+PiBPbiBNb24sIDIwMjEtMTAtMTggYXQgMTU6MDcgKzA4
MDAsIERhZm5hIEhpcnNjaGZlbGQgd3JvdGU6Cj4+Pj4KPj4+PiBPbiAxOC4xMC4yMSAwMzoxNiwg
QWxleGFuZHJlIENvdXJib3Qgd3JvdGU6Cj4+Pj4+IEhpIEhhbnMhCj4+Pj4+Cj4+Pj4+IE9uIE1v
biwgT2N0IDQsIDIwMjEgYXQgNjozNyBQTSBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsQHhzNGFsbC5u
bD4KPj4+Pj4gd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gT24gMjAvMDkvMjAyMSAxOTowNCwgRGFmbmEg
SGlyc2NoZmVsZCB3cm90ZToKPj4+Pj4+PiBGcm9tOiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJi
b3RAY2hyb21pdW0ub3JnPgo+Pj4+Pj4+Cj4+Pj4+Pj4gV2hlbiBydW5uaW5nIG1lbWNweV90b2lv
Ogo+Pj4+Pj4+IG1lbWNweV90b2lvKHNlbmRfb2JqLT5zaGFyZV9idWYsIGJ1ZiwgbGVuKTsKPj4+
Pj4+PiBpdCB3YXMgZm91bmQgdGhhdCBlcnJvcnMgYXBwZWFyIGlmIGxlbiBpcyBub3QgYSBtdWx0
aXBsZSBvZgo+Pj4+Pj4+IDg6Cj4+Pj4+Pj4KPj4+Pj4+PiBbNTguMzUwODQxXSBtdGstbWRwIDE0
MDAxMDAwLnJkbWE6IHByb2Nlc3NpbmcgZmFpbGVkOiAtMjIKPj4+Pj4+Cj4+Pj4+PiBXaHkgZG8g
ZXJyb3JzIGFwcGVhcj8gSXMgdGhhdCBkdWUgdG8gYSBIVyBidWc/IFNvbWUgb3RoZXIKPj4+Pj4+
IHJlYXNvbj8KPj4+Pj4KPj4+Pj4gTVRLIGZvbGtzIHdvdWxkIGJlIHRoZSBiZXN0IHBsYWNlZCB0
byBhbnN3ZXIgdGhpcywgYnV0IHNpbmNlIHRoZQo+Pj4+PiBmYWlsdXJlIGlzIHJlcG9ydGVkIGJ5
IHRoZSBmaXJtd2FyZSBJJ2Qgc3VzcGVjdCBlaXRoZXIgYSBmaXJtd2FyZQo+Pj4+PiBvcgo+Pj4+
PiBoYXJkd2FyZSBsaW1pdGF0aW9uLgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoaXMg
cGF0Y2ggZW5zdXJlcyB0aGUgY29weSBvZiBhIG11bHRpcGxlIG9mIDggc2l6ZSBieQo+Pj4+Pj4+
IGNhbGxpbmcKPj4+Pj4+PiByb3VuZF91cChsZW4sIDgpIHdoZW4gY29weWluZwo+Pj4+Pj4+Cj4+
Pj4+Pj4gRml4ZXM6IGU2NTk5YWRmYWQzMCAoIm1lZGlhOiBtdGstdnB1OiBhdm9pZCB1bmFsaWdu
ZWQgYWNjZXNzCj4+Pj4+Pj4gdG8KPj4+Pj4+PiBEVENNIGJ1ZmZlci4iKQo+Pj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJvdEBjaHJvbWl1bS5vcmc+Cj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8Cj4+Pj4+Pj4gZW5yaWMu
YmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEYWZuYSBIaXJz
Y2hmZWxkIDwKPj4+Pj4+PiBkYWZuYS5oaXJzY2hmZWxkQGNvbGxhYm9yYS5jb20KPj4+Pj4+Pj4K
Pj4+Pj4+Pgo+Pj4+Pj4+IFJldmlld2VkLWJ5OiBIb3Vsb25nIFdlaSA8aG91bG9uZy53ZWlAbWVk
aWF0ZWsuY29tPgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+IGNoYW5nZXMgc2luY2UgdjM6Cj4+Pj4+Pj4g
MS4gbXVsdGlsZSAtPiBtdWx0aXBsZQo+Pj4+Pj4+IDIuIGFkZCBpbmxpbmUgZG9jCj4+Pj4+Pj4K
Pj4+Pj4+PiBjaGFuZ2VzIHNpbmNlIHYyOgo+Pj4+Pj4+IDEuIGRvIHRoZSBleHRyYSBjb3B5IG9u
bHkgaWYgbGVuIGlzIG5vdCBtdWx0aXBsZSBvZiA4Cj4+Pj4+Pj4KPj4+Pj4+PiBjaGFuZ2VzIHNp
bmNlIHYxOgo+Pj4+Pj4+IDEuIGNoYW5nZSBzaWduLW9mZi1ieSB0YWdzCj4+Pj4+Pj4gMi4gY2hh
bmdlIHZhbHVlcyB0byBtZW1zZXQKPj4+Pj4+Pgo+Pj4+Pj4+IMKgwqAgZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstdnB1L210a192cHUuYyB8IDE1Cj4+Pj4+Pj4gKysrKysrKysrKysrKystCj4+
Pj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LXZwdS9tdGtfdnB1LmMKPj4+Pj4+PiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZwdS9t
dGtfdnB1LmMKPj4+Pj4+PiBpbmRleCBlYzI5MGRkZTU5Y2YuLjFkZjAzMTcxNmM4ZiAxMDA2NDQK
Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jCj4+
Pj4+Pj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdnB1L210a192cHUuYwo+Pj4+
Pj4+IEBAIC0zNDksNyArMzQ5LDIwIEBAIGludCB2cHVfaXBpX3NlbmQoc3RydWN0IHBsYXRmb3Jt
X2RldmljZQo+Pj4+Pj4+ICpwZGV2LAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgfSB3aGlsZSAodnB1X2NmZ19yZWFkbCh2cHUs
IEhPU1RfVE9fVlBVKSk7Cj4+Pj4+Pj4KPj4+Pj4+PiAtwqDCoMKgwqAgbWVtY3B5X3RvaW8oc2Vu
ZF9vYmotPnNoYXJlX2J1ZiwgYnVmLCBsZW4pOwo+Pj4+Pj4+ICvCoMKgwqDCoCAvKgo+Pj4+Pj4+
ICvCoMKgwqDCoMKgICogd2hlbiBjb3B5aW5nIGRhdGEgdG8gdGhlIHZwdSBoYXJkd2FyZSwgdGhl
Cj4+Pj4+Pj4gbWVtY3B5X3RvaW8KPj4+Pj4+PiBvcGVyYXRpb24gbXVzdCBjb3B5Cj4+Pj4+Pj4g
K8KgwqDCoMKgwqAgKiBhIG11bHRpcGxlIG9mIDguIE90aGVyd2lzZSB0aGUgcHJvY2Vzc2luZyBm
YWlscwo+Pj4+Pj4KPj4+Pj4+IFNhbWUgaGVyZTogaXQgbmVlZHMgdG8gZXhwbGFpbiB3aHkgdGhl
IHByb2Nlc3NpbmcgZmFpbHMuCj4+Pj4KPj4+PiBJcyB3cml0aW5nICdkdWUgdG8gaGFyZHdhcmUg
b3IgZmlybXdhcmUgbGltaXRhdGlvbicgZW5vdWdoPwo+Pj4+IElmIG5vdCwgdGhlbiB3ZSBzaG91
bGQgd2FpdCBmb3IgbWVkaWF0ZWsgcGVvcGxlJ3MgcmVzcG9uc2UgdG8KPj4+PiBleHBsYWluCj4+
Pj4gaWYgdGhleSBrbm93IG1vcmUKPj4+Pgo+Pj4+Pj4KPj4+Pj4+PiArwqDCoMKgwqDCoCAqLwo+
Pj4+Pj4+ICvCoMKgwqDCoCBpZiAobGVuICUgOCAhPSAwKSB7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBjaGFyIGRhdGFbU0hBUkVfQlVGX1NJWkVdOwo+Pj4+Pj4K
Pj4+Pj4+IFdvdWxkbid0IGl0IGJlIG1vcmUgcm9idXN0IGlmIHlvdSBzYXk6Cj4+Pj4+Pgo+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBjaGFyIGRhdGFb
c2l6ZW9mKHNlbmRfb2JqLQo+Pj4+Pj4+IHNoYXJlX2J1ZildOwo+Pj4+Pgo+Pj4+PiBEZWZpbml0
ZWx5IHllcy4KPj4+Pgo+Pj4+IEknbGwgc2VuZCB2NSBmaXhpbmcgdGhpcwo+Pj4+Cj4+Pj4+Cj4+
Pj4+Pgo+Pj4+Pj4gSSBhbHNvIHRoaW5rIHRoYXQgdGhlIFNIQVJFX0JVRl9TSVpFIGRlZmluZSBu
ZWVkcyBhIGNvbW1lbnQKPj4+Pj4+IHN0YXRpbmcgdGhhdCBpdCBtdXN0IGJlIGEKPj4+Pj4+IG11
bHRpcGxlIG9mIDgsIG90aGVyd2lzZSB1bmV4cGVjdGVkIHRoaW5ncyBjYW4gaGFwcGVuLgo+Pj4+
Pj4KPj4+Pj4+IFlvdSBhbHNvIG5vdGljZWQgdGhhdCB0aGUgY3VycmVudCBTSEFSRV9CVUZfU0la
RSBkZWZpbmUgaXMgdG9vCj4+Pj4+PiBsb3csIGJ1dCBJIHNhdwo+Pj4+Pj4gbm8gcGF0Y2ggY29y
cmVjdGluZyB0aGlzLiBTaG91bGRuJ3QgdGhhdCBiZSBmaXhlZCBhcyB3ZWxsPwo+Pj4+Pgo+Pj4+
PiBBRkFJQ1QgdGhlIGZpcm13YXJlIGV4cGVjdHMgdGhpcyBleGFjdCBzaXplIG9uIGl0cyBlbmQs
IHNvIEkKPj4+Pj4gZG9uJ3QKPj4+Pj4gYmVsaWV2ZSBpdCBjYW4gYmUgY2hhbmdlZCB0aGF0IGVh
c2lseS4gQnV0IG1heWJlIHNvbWVvbmUgZnJvbSBNVEsKPj4+Pj4gY2FuCj4+Pj4+IHByb3ZlIG1l
IHdyb25nLgo+Pj4+Pgo+Pj4+Cj4+Pj4gSSBsb29rZWQgZnVydGhlciBhbmQgbm90ZWQgdGhhdCB0
aGUgc3RydWN0cyB0aGF0IGFyZSBsYXJnZXIgdGhhbgo+Pj4+ICdTSEFSRV9CVUZfU0laRScKPj4+
PiAodmVuY19hcF9pcGlfbXNnX2VuY19leHQgdmVuY19hcF9pcGlfbXNnX3NldF9wYXJhbV9leHQp
Cj4+Pj4gYXJlIHVzZWQgYnkgZHJpdmVycyB0aGF0IGRvbid0IHVzZSB0aGlzIHZwdSBhcGksIHNv
IGFjdHVhbGx5Cj4+Pj4gU0hBUkVfQlVGX1NJWkUgaXMKPj4+PiBub3QgdG9vIGxvdyBhbmQgYXMg
Q29ydXJib3Qgd29ydGUgcHJvYmFibHkgbm90IGNoYW5nZWFibGUuCj4+Pj4KPj4+Pgo+Pj4+IFRo
YW5rcywKPj4+PiBEYWZuYQo+Pj4+Cj4+Pj4+IENoZWVycywKPj4+Pj4gQWxleC4KPj4+Pj4KPj4+
Cj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
