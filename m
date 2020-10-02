Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFCEC4363C
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 16:18:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7EA206FA
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 16:18:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZoUXNEjp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTqcRmGI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A7EA206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gX8QUzCg5uciG28ShPtkkDLHEb86pWCn/rVXH9Ik+QQ=; b=ZoUXNEjpqJNQXgnd1a7IvcfOV
	mNV58NLOiSrNDOiuNfzBMlxLciAsP79+Qr4styGkx90EvOslwaCh8838f7Wn0Vw6LmNWrarBvw0Ks
	EfW38s2vKbYCbAVfDq+2Kil2aGWquuNhro9PiTdrhnMCKlv3jQ4pnnpHah2qF2RcvkHfm9GFiZys1
	Y+BdyAO5rokBXMkWb4f4W62aQW51Zzd0kirTMr9CUqfTFwpbAo/MaJ7orI9miV3wuCJ1VcADg2qhl
	A4gM6nHcc1G1olgtkV8ccayfuN1YcFEGExZ+3ywayIRv8cQ5GZtuqWUD/6JcAjgMwMI/HBIx8vcdx
	1sOOL/H0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kONl8-0001wr-13; Fri, 02 Oct 2020 16:18:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kONl3-0001vk-Eb; Fri, 02 Oct 2020 16:18:10 +0000
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 234A9208B6;
 Fri,  2 Oct 2020 16:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601655487;
 bh=qKotbjg9kcKQ9kFUjGcF4Wc0HsTaB353+5mrYaSDDCQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KTqcRmGIxuBsugsYc3QNXyB43KgLKQ9zy7a0ZL2VLKTac+57x7+Da+cQjG5EWi9W5
 5RjT/V3wWUwLHhRblDOh0yp1QEVbVh2jNWWOyaFL3bJ+FgSncjBolK/2wF6P9ZP8Al
 Ga22xMjFzSc5fNnLr2MM9JAT+b9yEgFgZf1nBvwM=
Received: by mail-ed1-f47.google.com with SMTP id l24so2229566edj.8;
 Fri, 02 Oct 2020 09:18:07 -0700 (PDT)
X-Gm-Message-State: AOAM530U0pgHNu2H2mdV1qMejwQBMOUcqr2OOtuWvinkke/z4MBmnU9u
 ygjhLBhSkpD1AqPv5uMQZZSGdO9ZlCPcpQNOhw==
X-Google-Smtp-Source: ABdhPJyafmj/u0SG8QNpaP1VvSH+STsRaizRRbacdoCZ2+w+W/LvGvkYpsx/bWsJ+8QEICEnsr4GD7tdYTR68Pb/FQk=
X-Received: by 2002:a05:6402:d09:: with SMTP id
 eb9mr3131896edb.219.1601655485577; 
 Fri, 02 Oct 2020 09:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
 <1599028813.32069.1.camel@mtkswgap22> <1599640627.6370.3.camel@mtkswgap22>
 <1600246737.14155.3.camel@mtkswgap22> <1600758789.19001.4.camel@mtkswgap22>
 <1601449808.7564.2.camel@mtkswgap22>
In-Reply-To: <1601449808.7564.2.camel@mtkswgap22>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 3 Oct 2020 00:17:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY__HA9W9jXSFTmZPxPeO_f1580ARDLcZO1hpX1p0a3+oUA@mail.gmail.com>
Message-ID: <CAAOTY__HA9W9jXSFTmZPxPeO_f1580ARDLcZO1hpX1p0a3+oUA@mail.gmail.com>
Subject: Re: [PATCH v7] Add MediaTek MT6779 devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_121809_644506_B194B9E4 
X-CRM114-Status: GOOD (  29.96  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpZb3UgbWF5IGZpbmQgTWF0dGhpYXMgaW4gSVJDIFsxXSwgdGhlIGNoYW5uZWwg
bmFtZSBpcyAjbGludXgtbWVkaWF0ZWsKClsxXSBodHRwczovL3dlYmNoYXQuZnJlZW5vZGUubmV0
LwoKTmVhbCBMaXUgPG5lYWwubGl1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQ55pyIMzDml6Ug
6YCx5LiJIOS4i+WNiDM6MTDlr6vpgZPvvJoKPgo+IEhpIE1hdHQsCj4KPiBIb3BlIHRoaXMgbWFp
bCBjb3VsZCBmaW5kIHlvdSB3ZWxsLgo+IElzIGV2ZXJ5dGhpbmcgb2theT8KPiBJdCB3b3VsZCBi
ZSBnbGFkIGlmIHlvdSBjb3VsZCByZXBseSBtZSBubyBtYXR0ZXIgdGhlIHJldmlldyBzdGF0dXMu
Cj4KPiBUaGFua3MKPgo+IC1OZWFsCj4KPiBPbiBUdWUsIDIwMjAtMDktMjIgYXQgMTU6MTMgKzA4
MDAsIE5lYWwgTGl1IHdyb3RlOgo+ID4gSGkgTWF0dGhpYXMsCj4gPgo+ID4gV2UgbmVlZCB0aGlz
IGRyaXZlciBzdXBwb3J0ZWQgb24gbWFpbi1saW5lLgo+ID4gQ291bGQgeW91IHNhdmUgeW91ciB0
aW1lIGZvciB1cyB0byByZXZpZXcgaXQ/Cj4gPiBUaGFua3MKPiA+Cj4gPiAtTmVhbAo+ID4KPiA+
IE9uIFdlZCwgMjAyMC0wOS0xNiBhdCAxNjo1OCArMDgwMCwgTmVhbCBMaXUgd3JvdGU6Cj4gPiA+
IEhpIFJvYiwgTWF0dGhpYXMsIENodW4tS3VhbmcsCj4gPiA+Cj4gPiA+IFNvcnJ5IGZvciBwdXNo
aW5nIHlvdSBzbyBoYXJkLgo+ID4gPiBNYXkgSSBrbm93IGlzIHRoaXMgcGF0Y2ggc2V0IGlzIGNv
bWZvcnRhYmxlIHRvIGFwcGx5IG9uIGxhdGVzdCBrZXJuZWw/Cj4gPiA+IFRoYW5rcwo+ID4gPgo+
ID4gPiAtTmVhbAo+ID4gPgo+ID4gPiBPbiBXZWQsIDIwMjAtMDktMDkgYXQgMTY6MzcgKzA4MDAs
IE5lYWwgTGl1IHdyb3RlOgo+ID4gPiA+IEhpIFJvYiwgTWF0dGhpYXMsIENodW4tS3VhbmcsCj4g
PiA+ID4KPiA+ID4gPiBQbGVhc2Uga2luZGx5IGxldCBtZSBrbm93IHlvdXIgY29tbWVudHMgYWJv
dXQgdGhpcyBwYXRjaCBzZXQuCj4gPiA+ID4gVGhhbmtzCj4gPiA+ID4KPiA+ID4gPiAtTmVhbAo+
ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCAyMDIwLTA5LTAyIGF0IDE0OjQwICswODAwLCBOZWFsIExp
dSB3cm90ZToKPiA+ID4gPiA+IEhpIFJvYiwgTWF0dGhpYXMsIENodW4tS3VhbmcsCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gR2VudGxlIHBpbmcgZm9yIHRoaXMgcGF0Y2ggc2V0Lgo+ID4gPiA+ID4gVGhh
bmtzCj4gPiA+ID4gPgo+ID4gPiA+ID4gLU5lYWwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBUaHUs
IDIwMjAtMDgtMjcgYXQgMTE6MDYgKzA4MDAsIE5lYWwgTGl1IHdyb3RlOgo+ID4gPiA+ID4gPiBU
aGVzZSBwYXRjaCBzZXJpZXMgaW50cm9kdWNlIGEgTWVkaWFUZWsgTVQ2Nzc5IGRldmFwYyBkcml2
ZXIuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE1lZGlhVGVrIGJ1cyBmYWJyaWMgcHJvdmlkZXMg
VHJ1c3Rab25lIHNlY3VyaXR5IHN1cHBvcnQgYW5kIGRhdGEgcHJvdGVjdGlvbiB0byBwcmV2ZW50
IHNsYXZlcyBmcm9tIGJlaW5nIGFjY2Vzc2VkIGJ5IHVuZXhwZWN0ZWQgbWFzdGVycy4KPiA+ID4g
PiA+ID4gVGhlIHNlY3VyaXR5IHZpb2xhdGlvbiBpcyBsb2dnZWQgYW5kIHNlbnQgdG8gdGhlIHBy
b2Nlc3NvciBmb3IgZnVydGhlciBhbmFseXNpcyBvciBjb3VudGVybWVhc3VyZXMuCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IEFueSBvY2N1cnJlbmNlIG9mIHNlY3VyaXR5IHZpb2xhdGlvbiB3b3Vs
ZCByYWlzZSBhbiBpbnRlcnJ1cHQsIGFuZCBpdCB3aWxsIGJlIGhhbmRsZWQgYnkgbXRrLWRldmFw
YyBkcml2ZXIuCj4gPiA+ID4gPiA+IFRoZSB2aW9sYXRpb24gaW5mb3JtYXRpb24gaXMgcHJpbnRl
ZCBpbiBvcmRlciB0byBmaW5kIHRoZSBtdXJkZXJlci4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
Y2hhbmdlcyBzaW5jZSB2NjoKPiA+ID4gPiA+ID4gLSByZW1vdmUgdW5uZWNlc3NhcnkgbWFzay91
bm1hc2sgbW9kdWxlIGlycSBkdXJpbmcgSVNSLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBjaGFu
Z2VzIHNpbmNlIHY1Ogo+ID4gPiA+ID4gPiAtIHJlbW92ZSByZWR1bmRhbnQgd3JpdGUgcmVnIG9w
ZXJhdGlvbi4KPiA+ID4gPiA+ID4gLSB1c2Ugc3RhdGljIHZhcmlhYmxlIG9mIHZpb19kYmdzIGlu
c3RlYWQuCj4gPiA+ID4gPiA+IC0gYWRkIHN0b3BfZGV2YXBjKCkgaWYgZHJpdmVyIGlzIHJlbW92
ZWQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGNoYW5nZXMgc2luY2UgdjQ6Cj4gPiA+ID4gPiA+
IC0gcmVmYWN0b3IgZGF0YSBzdHJ1Y3R1cmUuCj4gPiA+ID4gPiA+IC0gbWVyZ2UgdHdvIHNpbXBs
ZSBmdW5jdGlvbnMgaW50byBvbmUuCj4gPiA+ID4gPiA+IC0gcmVmYWN0b3IgcmVnaXN0ZXIgc2V0
dGluZyB0byBwcmV2ZW50IHRvbyBtYW55IGZ1bmN0aW9uIGNhbGwgb3ZlcmhlYWQuCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IGNoYW5nZXMgc2luY2UgdjM6Cj4gPiA+ID4gPiA+IC0gcmV2aXNlIHZp
b2xhdGlvbiBoYW5kbGluZyBmbG93IHRvIG1ha2UgaXQgbW9yZSBlYXNpbHkgdG8gdW5kZXJzdGFu
ZAo+ID4gPiA+ID4gPiAgIGhhcmR3YXJlIGJlaGF2aW9yLgo+ID4gPiA+ID4gPiAtIGFkZCBtb3Jl
IGNvbW1lbnRzIHRvIHVuZGVyc3RhbmQgaG93IGhhcmR3YXJlIHdvcmtzLgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBjaGFuZ2VzIHNpbmNlIHYyOgo+ID4gPiA+ID4gPiAtIHBhc3MgcGxhdGZvcm0g
aW5mbyB0aHJvdWdoIERUIGRhdGEuCj4gPiA+ID4gPiA+IC0gcmVtb3ZlIHVubmVjZXNzYXJ5IGZ1
bmN0aW9uLgo+ID4gPiA+ID4gPiAtIHJlbW92ZSBzbGF2ZV90eXBlIGJlY2F1c2UgaXQgYWx3YXlz
IGVxdWFscyB0byAxIGluIGN1cnJlbnQgc3VwcG9ydCBTb0MuCj4gPiA+ID4gPiA+IC0gdXNlIHZp
b19pZHhfbnVtIGluc3RyZWFkIG9mIGxpc3QgYWxsIGRldmljZXMnIGluZGV4Lgo+ID4gPiA+ID4g
PiAtIGFkZCBtb3JlIGNvbW1lbnRzIHRvIGRlc2NyaWJlIGhhcmR3YXJlIGJlaGF2aW9yLgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBjaGFuZ2VzIHNpbmNlIHYxOgo+ID4gPiA+ID4gPiAtIG1vdmUg
U29DIHNwZWNpZmljIHBhcnQgdG8gRFQgZGF0YS4KPiA+ID4gPiA+ID4gLSByZW1vdmUgdW5uZWNl
c3NhcnkgYm91bmRhcnkgY2hlY2suCj4gPiA+ID4gPiA+IC0gcmVtb3ZlIHVubmVjZXNzYXJ5IGRh
dGEgdHlwZSBkZWNsYXJhdGlvbi4KPiA+ID4gPiA+ID4gLSB1c2UgcmVhZF9wb2xsX3RpbWVvdXQo
KSBpbnN0cmVhZCBvZiBmb3IgbG9vcCBwb2xsaW5nLgo+ID4gPiA+ID4gPiAtIHJldmlzZSBjb2Rp
bmcgc3R5bGUgZWxlZ2FudGx5Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAq
KiogQkxVUkIgSEVSRSAqKioKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gTmVhbCBMaXUgKDIpOgo+
ID4gPiA+ID4gPiAgIGR0LWJpbmRpbmdzOiBkZXZhcGM6IGFkZCBiaW5kaW5ncyBmb3IgbXRrLWRl
dmFwYwo+ID4gPiA+ID4gPiAgIHNvYzogbWVkaWF0ZWs6IGFkZCBtdDY3NzkgZGV2YXBjIGRyaXZl
cgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgLi4uL2JpbmRpbmdzL3NvYy9tZWRpYXRlay9kZXZh
cGMueWFtbCAgICAgICAgIHwgIDU4ICsrKysKPiA+ID4gPiA+ID4gIGRyaXZlcnMvc29jL21lZGlh
dGVrL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAgOSArCj4gPiA+ID4gPiA+ICBkcml2ZXJz
L3NvYy9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gPiA+ID4g
PiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWRldmFwYy5jICAgICAgICAgICAgIHwgMzA1ICsr
KysrKysrKysrKysrKysrKwo+ID4gPiA+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAzNzMgaW5zZXJ0
aW9ucygrKQo+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zb2MvbWVkaWF0ZWsvZGV2YXBjLnlhbWwKPiA+ID4gPiA+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstZGV2YXBjLmMKPiA+ID4g
PiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4KPiA+ID4KPiA+
Cj4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
