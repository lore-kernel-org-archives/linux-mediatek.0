Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC56C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMdkOrhw8EqIhCQzp7wRpTcMW4T8/BZSl3ZiQBAKNto=; b=G8/vbxFPktJLVHCiq+H8NBX4Oc
	Jvst/awSjQ2ZePusvfKyzGQfqN4C0AoW4MNanPk3hiot+paoPIrMtpjpxrrKbASgSvZHR/gzZ3x71
	7LhR37lAc06edH7GN+Lxr4mHn6HoI58AiGnWNyYXp4w+XQ1B7GxL98WjImbBeoWwml8u+1iruwyyR
	fze1XGX5jgg86G3l8ZM8GewlBFrnXhZ9ImD67sHM6+Ts0GzMi1XrcGnLBjR00Uz9TxsMoKxw+wMCe
	dQ5CIsftlQyFMMvsM9nxpQ7MoT5tWGcmVAcd65YAHVcmWCuW0Btw6ax9gAV/ZTjVHXsyGuC9/dPeF
	CsgPpn2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mutaj-00ByIl-Hk; Wed, 08 Dec 2021 09:50:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mutaV-00ByEs-P7; Wed, 08 Dec 2021 09:50:13 +0000
Received: from [IPv6:2a00:c281:1230:3700:51d0:7039:5913:64d3] (unknown
 [IPv6:2a00:c281:1230:3700:51d0:7039:5913:64d3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 82E431F45AE2;
 Wed,  8 Dec 2021 09:50:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638957008; bh=zVGIFxck9x5IerNsAjYPgRm4rJR70g1v7ksESCraX18=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=V5hPMueCR58aL9EvrTkfycXGs2uCkQW0aCd1isf4imL37WS5U6egHSqJA/YN+UmA8
 0Fnrrw0TV/G6La/R95ym9R8T3DXYfRVd810lEnfl3D4xAS4fCc8kuG63dAuYQqog6s
 PCqlnD3dOJ9LTOp00QsxPPgmRwxPPV2mdH+gLzVoQ+MYMvsg4T2kRcrxJUjF2B9bEQ
 GkAHy8CT1Mga5F1Yd+Fm0PnB88P6QbQ1diA9Vqh7RCOhwZgv/FRoyxGBCeOwg3ueaz
 hkLYhmZkmclvIxJZy9xNycIr2gVinoFmR4dVN2+/6nyYo5kG21wVLSo5iQ56aJVCbM
 ilmnunYbGysGg==
Subject: Re: [PATCH 1/2] iommu/mediatek: Always tlb_flush_all when each PM
 resume
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: Yong Wu <yong.wu@mediatek.com>
Cc: kernel@collabora.com, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
 sebastian.reichel@collabora.com, iommu@lists.linux-foundation.org
References: <20211122104400.4160-1-dafna.hirschfeld@collabora.com>
 <20211122104400.4160-2-dafna.hirschfeld@collabora.com>
 <6abef78f6447c626b737fd35688f421c29871f43.camel@mediatek.com>
 <d30438bf-9add-7904-bad0-0764e3602263@collabora.com>
Message-ID: <35d53ea0-68db-a516-9e9c-272e8f0ed082@collabora.com>
Date: Wed, 8 Dec 2021 11:50:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d30438bf-9add-7904-bad0-0764e3602263@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_015012_129300_54B54202 
X-CRM114-Status: GOOD (  33.00  )
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

CgpPbiAwNy4xMi4yMSAxMDozMSwgRGFmbmEgSGlyc2NoZmVsZCB3cm90ZToKPiAKPiAKPiBPbiAy
Ny4xMS4yMSAwNDo0NiwgWW9uZyBXdSB3cm90ZToKPj4gSGkgRGFmbmEsCj4+Cj4+IFNvcnJ5IGZv
ciByZXBseSBsYXRlLgo+Pgo+PiBPbiBNb24sIDIwMjEtMTEtMjIgYXQgMTI6NDMgKzAyMDAsIERh
Zm5hIEhpcnNjaGZlbGQgd3JvdGU6Cj4+PiBGcm9tOiBZb25nIFd1IDx5b25nLnd1QG1lZGlhdGVr
LmNvbT4KPj4+Cj4+PiBQcmVwYXJlIGZvciAyIEhXcyB0aGF0IHNoYXJpbmcgcGd0YWJsZSBpbiBk
aWZmZXJlbnQgcG93ZXItZG9tYWlucy4KPj4+Cj4+PiBXaGVuIHRoZXJlIGFyZSAyIE00VSBIV3Ms
IGl0IG1heSBoYXMgcHJvYmxlbSBpbiB0aGUgZmx1c2hfcmFuZ2UgaW4KPj4+IHdoaWNoCj4+PiB3
ZSBnZXQgdGhlIHBtX3N0YXR1cyB2aWEgdGhlIG00dSBkZXYsIEJVVCB0aGF0IGZ1bmN0aW9uIGRv
bid0IHJlZmxlY3QKPj4+IHRoZQo+Pj4gcmVhbCBwb3dlci1kb21haW4gc3RhdHVzIG9mIHRoZSBI
VyBzaW5jZSB0aGVyZSBtYXkgYmUgb3RoZXIgSFcgYWxzbwo+Pj4gdXNlCj4+PiB0aGF0IHBvd2Vy
LWRvbWFpbi4KPj4+Cj4+PiBUaGUgZnVuY3Rpb24gZG1hX2FsbG9jX2F0dHJzIGhlbHAgYWxsb2Nh
dGUgdGhlIGlvbW11IGJ1ZmZlciB3aGljaAo+Pj4gbmVlZCB0aGUgY29ycmVzcG9uZGluZyBwb3dl
ciBkb21haW4gc2luY2UgdGxiIGZsdXNoIGlzIG5lZWRlZCB3aGVuCj4+PiBwcmVwYXJpbmcgaW92
YS4gQlVUIHRoaXMgZnVuY3Rpb24gb25seSBpcyBmb3IgYWxsb2NhdGluZyBidWZmZXIsCj4+PiB3
ZSBoYXZlIG5vIGdvb2QgcmVhc29uIHRvIHJlcXVlc3QgdGhlIHVzZXIgYWx3YXlzIGNhbGwgcG1f
cnVudGltZV9nZXQKPj4+IGJlZm9yZSBjYWxsaW5nIGRtYV9hbGxvY194eHguIFRoZXJlZm9yZSwg
d2UgYWRkIGEgdGxiX2ZsdXNoX2FsbAo+Pj4gaW4gdGhlIHBtX3J1bnRpbWVfcmVzdW1lIHRvIG1h
a2Ugc3VyZSB0aGUgdGxiIGFsd2F5cyBpcyBjbGVhbi4KPj4+Cj4+PiBBbm90aGVyIHNvbHV0aW9u
IGlzIGFsd2F5cyBjYWxsIHBtX3J1bnRpbWVfZ2V0IGluIHRoZQo+Pj4gdGxiX2ZsdXNoX3Jhbmdl
Lgo+Pj4gVGhpcyB3aWxsIHRyaWdnZXIgcG0gcnVudGltZSByZXN1bWUvYmFja3VwIHNvIG9mdGVu
IHdoZW4gdGhlIGlvbW11Cj4+PiBwb3dlciBpcyBub3QgYWN0aXZlIGF0IHNvbWUgdGltZShtZWFu
cyB1c2VyIGRvbid0IGNhbGwgcG1fcnVudGltZV9nZXQKPj4+IGJlZm9yZSBjYWxsaW5nIGRtYV9h
bGxvY194eHgpLCBUaGlzIG1heSBjYXVzZSB0aGUgcGVyZm9ybWFuY2UgZHJvcC4KPj4+IHRodXMg
d2UgZG9uJ3QgdXNlIHRoaXMuCj4+Pgo+Pj4gSW4gb3RoZXIgY2FzZSwgdGhlIGlvbW11J3MgcG93
ZXIgc2hvdWxkIGFsd2F5cyBiZSBhY3RpdmUgdmlhIGRldmljZQo+Pj4gbGluayB3aXRoIHNtaS4K
Pj4+Cj4+PiBUaGUgcHJldmlvdXMgU29DIGRvbid0IGhhdmUgUE0gZXhjZXB0IG10ODE5Mi4gdGhl
IG10ODE5MiBJT01NVSBpcwo+Pj4gZGlzcGxheSdzCj4+PiBwb3dlci1kb21haW4gd2hpY2ggbmVh
cmx5IGFsd2F5cyBpcyBlbmFibGVkLiB0aHVzIG5vIG5lZWQgZml4IHRhZ3MKPj4+IGhlcmUuCj4+
PiBQcmVwYXJlIGZvciBtdDgxOTUuCj4+Cj4+IEluIHRoaXMgcGF0Y2hzZXQsIHRoaXMgbWVzc2Fn
ZSBzaG91bGQgYmUgbm90IHByb3Blci4gSSB0aGluayB5b3UgY291bGQKPj4gYWRkIHRoZSBjb21t
ZW50IHdoeSB0aGlzIHBhdGNoIGlzIG5lZWRlZCBpbiBtdDgxNzMuCj4+Cj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogWW9uZyBXdSA8eW9uZy53dUBtZWRpYXRlay5jb20+Cj4+PiBbaW1wb3J2aWUgaW5s
aW5lIGRvY10KPj4+IFNpZ25lZC1vZmYtYnk6IERhZm5hIEhpcnNjaGZlbGQgPGRhZm5hLmhpcnNj
aGZlbGRAY29sbGFib3JhLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVycy9pb21tdS9tdGtfaW9t
bXUuYyB8IDcgKysrKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L210a19pb21tdS5jIGIvZHJpdmVycy9p
b21tdS9tdGtfaW9tbXUuYwo+Pj4gaW5kZXggMjViODM0MTA0NzkwLi4yOGRjNGI5NWI2ZDkgMTAw
NjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2lvbW11L210a19pb21tdS5jCj4+PiArKysgYi9kcml2ZXJz
L2lvbW11L210a19pb21tdS5jCj4+PiBAQCAtOTY0LDYgKzk2NCwxMyBAQCBzdGF0aWMgaW50IF9f
bWF5YmVfdW51c2VkCj4+PiBtdGtfaW9tbXVfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAq
ZGV2KQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+PiDCoMKgwqDCoMKgIH0K
Pj4+ICvCoMKgwqAgLyoKPj4+ICvCoMKgwqDCoCAqIFVzZXJzIG1heSBhbGxvY2F0ZSBkbWEgYnVm
ZmVyIGJlZm9yZSB0aGV5IGNhbGwKPj4+IHBtX3J1bnRpbWVfZ2V0LAo+Pj4gK8KgwqDCoMKgICog
aW4gd2hpY2ggY2FzZSBpdCB3aWxsIGxhY2sgdGhlIG5lY2Vzc2FyeSB0bGIgZmx1c2guCj4+PiAr
wqDCoMKgwqAgKiBUaHVzLCBtYWtlIHN1cmUgdG8gdXBkYXRlIHRoZSB0bGIgYWZ0ZXIgZWFjaCBQ
TSByZXN1bWUuCj4+PiArwqDCoMKgwqAgKi8KPj4+ICvCoMKgwqAgbXRrX2lvbW11X3RsYl9mbHVz
aF9hbGwoZGF0YSk7Cj4+Cj4+IFRoaXMgc2hvdWxkIG5vdCB3b3JrLiBzaW5jZSBjdXJyZW50IHRo
ZSAqX3RsYl9mbHVzaF9hbGwgY2FsbAo+PiBwbV9ydW50aW1lX2dldF9pZl9pbl91c2Ugd2hpY2gg
d2lsbCBhbHdheXMgcmV0dXJuIDAgd2hlbiBpdCBjYWxsZWQgZnJvbQo+PiB0aGlzIHJ1bnRpbWVf
Y2IgaW4gbXkgdGVzdC4gdGh1cywgSXQgd29uJ3QgZG8gdGhlIHRsYl9mbHVzaF9hbGwKPj4gYWN0
dWFsbHkuCgpIZSwgaW5kZWVkLCBteSBtaXN0YWtlLCBhbHRob3VnaCB0aGUgZW5jb2RlciB3b3Jr
cyBtb3JlIG9yIGxlc3MgZmluZSBldmVuCndpdGhvdXQgdGhlIGZ1bGwgZmx1c2ggc28gSSBkaWRu
J3QgY2F0Y2ggdGhhdC4KCj4+Cj4+IEkgZ3Vlc3MgdGhpcyBhbHNvIGRlcGVuZCBvbiB0aGVzZSB0
d28gcGF0Y2hlcyBvZiBtdDgxOTUgdjMuCj4+IFtQQVRDSCB2MyAwOS8zM10gaW9tbXUvbWVkaWF0
ZWs6IFJlbW92ZSBmb3JfZWFjaF9tNHUgaW4gdGxiX3N5bmNfYWxsCj4+IFtQQVRDSCB2MyAxMC8z
M10gaW9tbXUvbWVkaWF0ZWs6IEFkZCB0bGJfbG9jayBpbiB0bGJfZmx1c2hfYWxsCgpJJ2xsIGFk
ZCB0aG9zZSB0d28KCj4+Cj4+IGxpa2UgaW4gWzEwLzMzXSwgSSBhZGRlZCBhIG10a19pb21tdV90
bGJfZG9fZmx1c2hfYWxsIHdoaWNoIGRvbid0IGhhdmUKPj4gdGhlIHBtIG9wZXJhdGlvbi4KCnll
cywgSSBuZWVkIHRvIHJlbW92ZSB0aGUgcG1fcnVudGltZV9nZXRfaWZfaW5fdXNlIGNhbGwgaW4g
dGhlICdmbHVzaF9hbGwnIGZ1bmMKSSBzZWUgdGhlcmUgaXMgYWxzbyBhIHBhdGNoIGZvciB0aGF0
IGluIHRoZSBtdDgxOTUgdjMgc2VyaWVzICJbUEFUQ0ggdjMgMTMvMzNdIGlvbW11L21lZGlhdGVr
OiBSZW1vdmUgdGhlIHBvd2VyIHN0YXR1cyBjaGVja2luZyBpbiB0bGIgZmx1c2ggYWxsIgoKU28g
SSdsbCBzZW5kIHYyLCBhZGRpbmcgYWxsIHRob3NlIDMgcGF0Y2hlcywgYnV0IEkgdGhpbmsgYWRk
aW5nIG10a19pb21tdV90bGJfZG9fZmx1c2hfYWxsCm9uIHBhdGNoIDkgYW5kIHJlbW92aW5nIGl0
IGFnYWluIG9uIHBhdGNoIDEzIGlzIGNvbmZ1c2luZyBzbyBJJ2xsIGF2b2lkIHRoYXQuCgpUaGFu
a3MsCkRhZm5hCgoKCj4+Cj4+IFRoaXMgbG9va3MgaGFzIGEgZGVwZW5kZW5jZS4gTGV0IG1lIGtu
b3cgaWYgSSBjYW4gaGVscCB0aGlzLgo+IAo+IEl0IGRpZCB3b3JrIGZvciBtZSwgdGVzdGluZyBv
biBlbG0gZGV2aWNlLiBJJ2xsIGNoZWNrIHRoYXQgYWdhaW4uCj4gCj4gCj4+Cj4+PiArCj4+PiDC
oMKgwqDCoMKgIC8qCj4+PiDCoMKgwqDCoMKgwqAgKiBVcHBvbiBmaXJzdCByZXN1bWUsIG9ubHkg
ZW5hYmxlIHRoZSBjbGsgYW5kIHJldHVybiwgc2luY2UKPj4+IHRoZSB2YWx1ZXMgb2YgdGhlCj4+
PiDCoMKgwqDCoMKgwqAgKiByZWdpc3RlcnMgYXJlIG5vdCB5ZXQgc2V0Lgo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
