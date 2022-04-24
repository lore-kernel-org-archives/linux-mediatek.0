Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466F7C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Apr 2022 22:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+tpDRU4QrXvZ3TBbsIfuyIVmvNtoOGt+J8UjPwXRk8=; b=ogMFTTSdg4TFEf
	Kh2aJ2XVIGkLj60koXr0IzE93luioTe/fsmt4arHYlQ7iuFLHUg9G4ee92r6IXSNyB4X4N6XZGxF6
	AVLT3TJw28iOEByVuOVcnFPQHk0Z/kRPm0TzYSEsG1xldu0wtsx1q7ewFCtMTKC+b7Lbu9ageMq3K
	Y6zRQZQwyKkJnWuaiZjihRPdV2iB+QIHx1Bb8ggmbX/7sPqjiGOVQyBRjfGwGl3N8ulTJdMtOQI8n
	3zAW5lWOAV0a+MBfWLQjLozSDcnH3J2SL8bEgJr/tkObU6kqUdFVwA3TBsE015BEVEsLlFq/BBMtg
	9ROuU+lQYF0tXyq5eFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nikLN-007S90-8d; Sun, 24 Apr 2022 22:04:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nikL9-007S3r-QN; Sun, 24 Apr 2022 22:04:25 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92131822;
 Mon, 25 Apr 2022 00:04:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650837857;
 bh=r46ShRAcDqpoKdBbLpASO9i+HH59TI1+EaMgiwY8r8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aotRcrCKGhT/CB0CNuD2sRNaiGkTn1q1gCoBfQiJYTEkMxJy/suxTeBrMifBhzKxP
 HW8o7kt74XYaIYdwqJTT1GgxgIGJc9xpEhn8L/fkl7/4iO8fc8MVYX/mJxxL7tbiQU
 Y9dXF/RrzFrcGMq9mZeN9LKXiOY/pFSfwIsh2VxA=
Date: Mon, 25 Apr 2022 01:04:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: James_Lin <Ping-lei.Lin@mediatek.com>
Cc: nicolas@ndufresne.ca, acourbot@chromium.org, arnd@arndb.de,
 ezequiel@vanguardiasur.com.ar, hverkuil-cisco@xs4all.nl,
 lecopzer.chen@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 max.yan@mediatek.com, mchehab@kernel.org, ribalda@chromium.org,
 sakari.ailus@linux.intel.com, senozhatsky@chromium.org,
 sherlock.chang@mediatek.com, tm.wu@mediatek.com
Subject: Re: [PATCH v3] media: usb: uvc: Add UVC_GUID_FORMAT_H265
Message-ID: <YmXJYUvJMGCXb9kt@pendragon.ideasonboard.com>
References: <4b6b65e72b3f3cd74af5a3f0069838c86a6725e9.camel@ndufresne.ca>
 <20220421092354.16774-1-Ping-lei.Lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220421092354.16774-1-Ping-lei.Lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_150424_032237_5B0E8BD0 
X-CRM114-Status: GOOD (  35.12  )
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

SGkgSmFtZXMsCgpPbiBUaHUsIEFwciAyMSwgMjAyMiBhdCAwNToyMzo1NFBNICswODAwLCBKYW1l
c19MaW4gd3JvdGU6Cj4gSGkgQWxsLAo+IAo+IERvIEkgbmVlZCB0byBhZGQgdGhlIGNvbW1lbnQg
Cj4gInNvbWUgY2FtZXJhcyByZXByZXNlbnQgaGV2YyBhcyBoMjY1Igo+IGF0IC9kcml2ZXJzL21l
ZGlhL3VzYi91dmMvdXZjX2RyaXZlci5jID8KPiBBbHNvLCBpcyB0aGVyZSBhbnl0aGluZyBlbHNl
IHRoYXQgbmVlZHMgdG8gYmUgbW9kaWZpZWQ/Cj4gCj4gT3IgY2FuIGl0IG1vdmUgdG8gcXVldWUg
b24gbmV4dCBtZXJnZWQgd2luZG93Pwo+IHRoYW5rcyBmb3IgeW91ciByZXBseQoKSSd2ZSBxdWV1
ZWQgdGhlIHBhdGNoIGluIG15IHRyZWUgYW5kIHdpbGwgc2VuZCBhIHB1bGwgcmVxdWVzdC4gSSBk
b24ndAp0aGluayB3ZSBuZWVkIGFuIGFkZGl0aW9uYWwgY29tbWVudCwgSC4yNjUgYW5kIEhFVkMg
YmVpbmcgdXNlZAppbnRlcmNoYW5nZWFibHkgaXNuJ3Qgc3BlY2lmaWMgdG8gVVZDLCBhbmQgaWYg
c29tZW9uZSBnZXRzIHB1enpsZWQgYnkKdGhpcyBpbiB0aGUgdXZjdmlkZW8gZHJpdmVyLCB0aGVy
ZSdzIGFsd2F5cyB0aGUgZ2l0IGhpc3RvcnkuCgo+IE9uIFdFRCwgMjAgQXByIDIwMjIgYXQgMDE6
MzcsIE5pY29sYXMgRHVmcmVzbmUgd3JvdGU6Cj4gPiBMZSBtYXJkaSAxOSBhdnJpbCAyMDIyIMOg
IDE0OjE4ICswMjAwLCBSaWNhcmRvIFJpYmFsZGEgYSDDqWNyaXQgOgo+ID4gPiBPbiBUdWUsIDE5
IEFwciAyMDIyIGF0IDE0OjE3LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gPiA+IE9uIFR1
ZSwgQXByIDE5LCAyMDIyIGF0IDAxOjQ2OjE1UE0gKzAyMDAsIFJpY2FyZG8gUmliYWxkYSB3cm90
ZToKPiA+ID4gPiA+IE9uIE1vbiwgMTggQXByIDIwMjIgYXQgMTE6MDcsIEphbWVzX0xpbiA8UGlu
Zy1sZWkuTGluQG1lZGlhdGVrLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBU
aGlzIHBhdGNoIGFpbXMgdG8gYWRkIFVWQ19HVUlEX0ZPUk1BVF9IMjY1IEhpZ2ggRWZmaWNpZW5j
eSAKPiA+ID4gPiA+ID4gVmlkZW8gQ29kaW5nIChIRVZDKSwgYWxzbyBrbm93biBhcyBILjI2NSBh
bmQgTVBFRy1IIFBhcnQgMi4KPiA+ID4gPiA+ID4gVGhleSBkZXNjcmliZSB0aGUgc2FtZSB2aWRl
byBlbmNvZGluZyBtZXRob2QuCj4gPiA+ID4gPiA+IFNvIGZvciBoYW5kbGluZyB0aGVpciBiZWhh
dmlvciBpcyB0aGUgc2FtZS4KPiA+ID4gPiA+ID4gSG93ZXZlciwgd2hlbiBleHRlcm5hbCBjYW1l
cmEgZGV2aWNlIGRlc2NyaWJlcyB0aGlzIGVuY29kaW5nIAo+ID4gPiA+ID4gPiBtZXRob2QsIHNv
bWUgdXNlIGhldmMsIHNvbWUgdXNlIGgyNjUuCj4gPiA+ID4gPiA+IFRoZXJlIGlzIG5vIHVuaWZv
cm0gc3BlY2lmaWNhdGlvbiB0byBkZXNjcmliZSB0aGlzIGVuY29kaW5nIG1ldGhvZC4KPiA+ID4g
PiA+ID4gU28gaWYgYW4gZXh0ZXJuYWwgY2FtZXJhIGRldmljZSB1c2UgaDI2NSB0byBkZXNjcmli
ZSB0aGlzIAo+ID4gPiA+ID4gPiBlbmNvZGluZyBtZXRob2QsIGRyaXZlciB3aWxsIG5vdCByZWNv
Z25pemUgaXQuCj4gPiA+ID4gPiA+IFRoZXJlZm9yZSwgdGhpcyBwYXRjaCBpcyB0byBlbmFibGUg
ZHJpdmVyIHRvIHJlYWQgSEVWQy9IMjY1IGFuZCAKPiA+ID4gPiA+ID4gY29udmVydCBpdCB0byBW
NEwyX1BJWF9GTVRfSEVWQy4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IEphbWVzX0xpbiA8UGluZy1sZWkuTGluQG1lZGlhdGVrLmNvbT4KPiA+ID4gPiA+IAo+ID4gPiA+
ID4gUmV2aWV3ZWQtYnk6IFJpY2FyZG8gUmliYWxkYSA8cmliYWxkYUBjaHJvbWl1bS5vcmc+Cj4g
PiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiAgZHJpdmVycy9tZWRpYS91c2IvdXZjL3V2Y19kcml2
ZXIuYyB8IDUgKysrKysKPiA+ID4gPiA+ID4gIGRyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmN2aWRl
by5oICAgfCAzICsrKwo+ID4gPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KykKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Vz
Yi91dmMvdXZjX2RyaXZlci5jIAo+ID4gPiA+ID4gPiBiL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91
dmNfZHJpdmVyLmMKPiA+ID4gPiA+ID4gaW5kZXggZGRhMGYwYWE3OGI4Li5lNDM3ZTlmOTU4OTAg
MTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZHJpdmVy
LmMKPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9tZWRpYS91c2IvdXZjL3V2Y19kcml2ZXIuYwo+
ID4gPiA+ID4gPiBAQCAtMTU0LDYgKzE1NCwxMSBAQCBzdGF0aWMgc3RydWN0IHV2Y19mb3JtYXRf
ZGVzYyB1dmNfZm10c1tdID0gewo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgLmd1aWQgICAg
ICAgICAgID0gVVZDX0dVSURfRk9STUFUX0gyNjQsCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAg
ICAuZmNjICAgICAgICAgICAgPSBWNEwyX1BJWF9GTVRfSDI2NCwKPiA+ID4gPiA+ID4gICAgICAg
ICB9LAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBNYXliZSBJIHdvdWxkIGFkZCBhIGNvbW1lbnQgaGVy
ZSBzYXlpbmcgdGhhdCBzb21lIGNhbWVyYXMgCj4gPiA+ID4gPiByZXByZXNlbnQgaGV2YyBhcyBo
MjY1Lgo+ID4gPiA+IAo+ID4gPiA+IEkgd2lzaCB0aGVyZSB3b3VsZCBiZSBhIDRDQyBhbmQgR1VJ
RCBzdGFuZGFyZCB3aXRoIGEgY2VudHJhbGl6ZWQgCj4gPiA+ID4gcmVnaXN0cnkuLi4KPiA+ID4g
Cj4gPiA+IFRob3VnaHQgdGhhdCB3YXMgdGhlIGtlcm5lbCBjb2RlYmFzZSA6KQo+ID4gCj4gPiBZ
b3UnbGwgZmluZCBtdWx0aXBsZSBmb3VyY2MgZm9yIHRoZSBzYW1lIHRoaW5nIGluIHRoZSBsaW51
eCBrZXJuZWwgOy1QCj4gPiAKPiA+ID4gPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gPiA+IAo+ID4gPiA+ID4gPiAr
ICAgICAgIHsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIC5uYW1lICAgICAgICAgICA9ICJI
LjI2NSIsCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAuZ3VpZCAgICAgICAgICAgPSBVVkNf
R1VJRF9GT1JNQVRfSDI2NSwKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIC5mY2MgICAgICAg
ICAgICA9IFY0TDJfUElYX0ZNVF9IRVZDLAo+ID4gPiA+ID4gPiArICAgICAgIH0sCj4gPiA+ID4g
PiA+ICAgICAgICAgewo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgLm5hbWUgICAgICAgICAg
ID0gIkdyZXlzY2FsZSA4IEwvUiAoWThJKSIsCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAu
Z3VpZCAgICAgICAgICAgPSBVVkNfR1VJRF9GT1JNQVRfWThJLAo+ID4gPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS91c2IvdXZjL3V2Y3ZpZGVvLmggCj4gPiA+ID4gPiA+IGIvZHJp
dmVycy9tZWRpYS91c2IvdXZjL3V2Y3ZpZGVvLmgKPiA+ID4gPiA+ID4gaW5kZXggMTQzMjMwYjMy
NzViLi40MWY0ZDhjMzNmMmEgMTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEv
dXNiL3V2Yy91dmN2aWRlby5oCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvdXNiL3V2
Yy91dmN2aWRlby5oCj4gPiA+ID4gPiA+IEBAIC0xMzksNiArMTM5LDkgQEAKPiA+ID4gPiA+ID4g
ICNkZWZpbmUgVVZDX0dVSURfRk9STUFUX0gyNjQgXAo+ID4gPiA+ID4gPiAgICAgICAgIHsgJ0gn
LCAgJzInLCAgJzYnLCAgJzQnLCAweDAwLCAweDAwLCAweDEwLCAweDAwLCBcCj4gPiA+ID4gPiA+
ICAgICAgICAgIDB4ODAsIDB4MDAsIDB4MDAsIDB4YWEsIDB4MDAsIDB4MzgsIDB4OWIsIDB4NzF9
Cj4gPiA+ID4gPiA+ICsjZGVmaW5lIFVWQ19HVUlEX0ZPUk1BVF9IMjY1IFwKPiA+ID4gPiA+ID4g
KyAgICAgICB7ICdIJywgICcyJywgICc2JywgICc1JywgMHgwMCwgMHgwMCwgMHgxMCwgMHgwMCwg
XAo+ID4gPiA+ID4gPiArICAgICAgICAweDgwLCAweDAwLCAweDAwLCAweGFhLCAweDAwLCAweDM4
LCAweDliLCAweDcxfQo+ID4gPiA+ID4gPiAgI2RlZmluZSBVVkNfR1VJRF9GT1JNQVRfWThJIFwK
PiA+ID4gPiA+ID4gICAgICAgICB7ICdZJywgICc4JywgICdJJywgICcgJywgMHgwMCwgMHgwMCwg
MHgxMCwgMHgwMCwgXAo+ID4gPiA+ID4gPiAgICAgICAgICAweDgwLCAweDAwLCAweDAwLCAweGFh
LCAweDAwLCAweDM4LCAweDliLCAweDcxfQoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
