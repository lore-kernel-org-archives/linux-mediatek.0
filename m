Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D69C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 13:20:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F29223428
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 13:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F29223428
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=L4d39F8vvRijQK4zUdK/jsm6LMymZHjXgcp4Var9c84=; b=mqbqf7HfQEeHtsFRLuWCtoKes
	VoChYYZhInZEBqsIHxcjNon70Ee+1AqXPvbhy7Z6VbbU3PUeo6299LS87+YQ8IXPiB/BEK7fe6FUn
	g+WmfK1Gcp5fLvUEZXQCOCzh/8WNmV8yXrcfL8QCeigD2gEBRZZW44Pp7VZ01oPmWe9s4XbNgdA51
	hPEV+yzwTt1+/t9l8Vj4JaC+vemPuJu1db/2mC/hfillUbIe4A7BhPUBHE0TnFkKJ6CR90h0nz9EN
	1ZtZO/89tBYeaCSaI+v4NnVLpu4FTPUrkyIhZcM7a2vDr2TINaDf6QzVhMxHVIjOiRyvClMZ2ahsD
	g15lB2Yig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2wMK-0003Pq-NQ; Fri, 22 Jan 2021 13:20:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2wMD-0003Nw-Gg; Fri, 22 Jan 2021 13:20:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6858B23433;
 Fri, 22 Jan 2021 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611321608;
 bh=O9MqbwWkZQVEKSZV70MYpGzV+y0qpRzN3NtjYGn6pw8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=oPd+slE0x2yNRgReSDZHNkcwAg71ssAwdsjzilyPYXS0sFRTHxM4VwYhet5Nuev8P
 k8XdkM//tJ8iF4NfdJqbuFJv7aNTZHMb05ERqojUrODUiTLVEzoz8K7ewaVQYVTB+r
 ONkhgh848WVWMm9OHiXJW0fijh33BEfZNBOPnA+QsJg3WsU3SBuL5KzHTELiWp9ZTX
 Ts1QXKsua0ZLoaawuwtgHmZt6oQYKiEiwMYmCWZQosMeCIUTnR1dzRB91xuIKX4agl
 bSRLv4Uz+J7YsgqyM3OFtYhdtpZmyVtMxBCXoPfhX9eYFBRDc38/5e+WvJG6oU2N39
 dpMPef5mfv9ww==
Date: Fri, 22 Jan 2021 07:20:06 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
Subject: Re: [PATCH v2] PCI: Re-enable downstream port LTR if it was
 previously enabled
Message-ID: <20210122132006.GA2749050@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611298991.5980.42.camel@mcddlt001>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_082009_724305_66737B98 
X-CRM114-Status: GOOD (  36.49  )
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
Cc: linux-pci@vger.kernel.org, lambert.wang@mediatek.com,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org,
 Utkarsh H Patel <utkarsh.h.patel@intel.com>, haijun.liu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKYW4gMjIsIDIwMjEgYXQgMDM6MDM6MTFQTSArMDgwMCwgTWluZ2NodWFuZyBRaWFv
IHdyb3RlOgo+IE9uIFRodSwgMjAyMS0wMS0yMSBhdCAxNjozMSAtMDYwMCwgQmpvcm4gSGVsZ2Fh
cyB3cm90ZToKPiA+IFsrY2MgQWxleCBhbmQgTWluZ2NodWFuZyBldCBhbCBmcm9tCj4gPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjEwMTEyMDcyNzM5LjMxNjI0LTEtbWluZ2NodWFuZy5x
aWFvQG1lZGlhdGVrLmNvbV0KPiA+IAo+ID4gT24gVHVlLCBKYW4gMTksIDIwMjEgYXQgMDQ6MTQ6
MTBQTSArMDMwMCwgTWlrYSBXZXN0ZXJiZXJnIHdyb3RlOgo+ID4gPiBQQ0llIHI1LjAsIHNlYyA3
LjUuMy4xNiBzYXlzIHRoYXQgdGhlIGRvd25zdHJlYW0gcG9ydHMgbXVzdCByZXNldCB0aGUKPiA+
ID4gTFRSIGVuYWJsZSBiaXQgaWYgdGhlIGxpbmsgZ29lcyBkb3duIChwb3J0IGdvZXMgRExfRG93
biBzdGF0dXMpLiBOb3csIGlmCj4gPiA+IHdlIGhhZCBMVFIgcHJldmlvdXNseSBlbmFibGVkIGFu
ZCB0aGUgUENJZSBlbmRwb2ludCBnZXRzIGhvdC1yZW1vdmVkIGFuZAo+ID4gPiB0aGVuIGhvdC1h
ZGRlZCBiYWNrIHRoZSAtPmx0cl9wYXRoIG9mIHRoZSBkb3duc3RyZWFtIHBvcnQgaXMgc3RpbGwg
c2V0Cj4gPiA+IGJ1dCB0aGUgcG9ydCBub3cgZG9lcyBub3QgaGF2ZSB0aGUgTFRSIGVuYWJsZSBi
aXQgc2V0IGFueW1vcmUuCj4gPiA+IAo+ID4gPiBGb3IgdGhpcyByZWFzb24gY2hlY2sgaWYgdGhl
IGJyaWRnZSB1cHN0cmVhbSBoYWQgTFRSIGVuYWJsZWQgcHJldmlvdXNseQo+ID4gPiBhbmQgcmUt
ZW5hYmxlIGl0IGJlZm9yZSBlbmFibGluZyBMVFIgZm9yIHRoZSBlbmRwb2ludC4KPiA+ID4gCj4g
PiA+IFJlcG9ydGVkLWJ5OiBVdGthcnNoIEggUGF0ZWwgPHV0a2Fyc2guaC5wYXRlbEBpbnRlbC5j
b20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJn
QGxpbnV4LmludGVsLmNvbT4KPiA+IAo+ID4gSSB0aGluayB0aGlzIGFuZCBNaW5nY2h1YW5nJ3Mg
cGF0Y2gsIHdoaWNoIGlzIGVzc2VudGlhbGx5IGlkZW50aWNhbCwKPiA+IGFyZSByaWdodCBhbmQg
c29sdmVzIHRoZSBwcm9ibGVtIGZvciBob3QtcmVtb3ZlL2hvdC1hZGQuICBJbiB0aGF0Cj4gPiBz
Y2VuYXJpbyB3ZSBjYWxsIHBjaV9jb25maWd1cmVfbHRyKCkgb24gdGhlIGhvdC1hZGRlZCBkZXZp
Y2UsIGFuZAo+ID4gd2l0aCB0aGlzIHBhdGNoLCB3ZSdsbCByZS1lbmFibGUgTFRSIG9uIHRoZSBi
cmlkZ2UgbGVhZGluZyB0byB0aGUgbmV3Cj4gPiBkZXZpY2UgYmVmb3JlIGVuYWJsaW5nIExUUiBv
biB0aGUgbmV3IGRldmljZSBpdHNlbGYuCj4gPiAKPiA+IEJ1dCBkb24ndCB3ZSBoYXZlIGEgc2lt
aWxhciBwcm9ibGVtIGlmIHdlIHNpbXBseSBkbyBhIEZ1bmRhbWVudGFsCj4gPiBSZXNldCBvbiBh
IGRldmljZT8gIEkgdGhpbmsgdGhlIHJlc2V0IHBhdGggd2lsbCByZXN0b3JlIHRoZSBkZXZpY2Un
cwo+ID4gc3RhdGUsIGluY2x1ZGluZyBQQ0lfRVhQX0RFVkNUTDIsIGJ1dCBpdCBkb2Vzbid0IGRv
IGFueXRoaW5nIHdpdGggdGhlCj4gPiB1cHN0cmVhbSBicmlkZ2UsIGRvZXMgaXQ/Cj4gCj4gWWVz
LiBJIHRoaW5rIHRoZSBzYW1lIHByb2JsZW0gZXhpc3RzIHVuZGVyIHN1Y2ggc2NlbmFyaW8sIGFu
ZCB0aGF04oCZcyB0aGUKPiBpc3N1ZSBteSBwYXRjaCBpbnRlbmRzIHRvIHJlc29sdmUuCj4gSSBh
bHNvIHByZXBhcmVkIGEgdjIgcGF0Y2ggZm9yIHJldmlldyh1cGRhdGUgdGhlIHBhdGNoIGRlc2Ny
aXB0aW9uKS4KPiBTaGFsbCBJIHN1Ym1pdCB0aGUgdjIgcGF0Y2ggZm9yIHJldmlldz8KCkhvdyBk
b2VzIHlvdXIgcGF0Y2ggc29sdmUgdGhpcyBmb3IgdGhlIHJlc2V0IHBhdGg/ICBJIGRvbid0IHRo
aW5rIHdlCmNhbGwgcGNpX2NvbmZpZ3VyZV9sdHIoKSB3aGVuIHdlIHJlc2V0IGEgZGV2aWNlLgoK
PiA+IFNvIGlmIGEgYnJpZGdlIGFuZCBhIGRldmljZSBiZWxvdyBpdCBib3RoIGhhdmUgTFRSIGVu
YWJsZWQsIGNhbid0IHdlCj4gPiBoYXZlIHRoZSBmb2xsb3dpbmc6Cj4gPiAKPiA+ICAgLSBicmlk
Z2UgTFRSIGVuYWJsZWQKPiA+ICAgLSBkZXZpY2UgTFRSIGVuYWJsZWQKPiA+ICAgLSByZXNldCBk
ZXZpY2UsIGUuZy4sIHZpYSBTZWNvbmRhcnkgQnVzIFJlc2V0Cj4gPiAgIC0gbGluayBnb2VzIGRv
d24sIGJyaWRnZSBkaXNhYmxlcyBMVFIKPiA+ICAgLSBsaW5rIGNvbWVzIGJhY2sgdXAsIExUUiBk
aXNhYmxlZCBpbiBib3RoIGJyaWRnZSBhbmQgZGV2aWNlCj4gPiAgIC0gcmVzdG9yZSBkZXZpY2Ug
c3RhdGUsIGluY2x1ZGluZyBMVFIgZW5hYmxlCj4gPiAgIC0gZGV2aWNlIHNlbmRzIExUUiBtZXNz
YWdlCj4gPiAgIC0gYnJpZGdlIHJlcG9ydHMgVW5zdXBwb3J0ZWQgUmVxdWVzdAo+ID4gCj4gPiA+
IC0tLQo+ID4gPiBQcmV2aW91cyB2ZXJzaW9uIGNhbiBiZSBmb3VuZCBoZXJlOgo+ID4gPiAKPiA+
ID4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAyMTAxMTQxMzQ3MjQuNzk1
MTEtMS1taWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29tLwo+ID4gPiAKPiA+ID4gQ2hhbmdl
cyBmcm9tIHRoZSBwcmV2aW91cyB2ZXJzaW9uOgo+ID4gPiAKPiA+ID4gICAqIENvcnJlY3RlZCB0
eXBvcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UKPiA+ID4gICAqIE5vIG5lZWQgdG8gY2FsbCBwY2ll
X2Rvd25zdHJlYW1fcG9ydCgpCj4gPiA+IAo+ID4gPiAgZHJpdmVycy9wY2kvcHJvYmUuYyB8IDE3
ICsrKysrKysrKysrKysrKystCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3By
b2JlLmMgYi9kcml2ZXJzL3BjaS9wcm9iZS5jCj4gPiA+IGluZGV4IDBlYjY4YjQ3MzU0Zi4uYTRh
OGMwMzA1ZmI5IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3BjaS9wcm9iZS5jCj4gPiA+ICsr
KyBiL2RyaXZlcnMvcGNpL3Byb2JlLmMKPiA+ID4gQEAgLTIxNTMsNyArMjE1Myw3IEBAIHN0YXRp
YyB2b2lkIHBjaV9jb25maWd1cmVfbHRyKHN0cnVjdCBwY2lfZGV2ICpkZXYpCj4gPiA+ICB7Cj4g
PiA+ICAjaWZkZWYgQ09ORklHX1BDSUVBU1BNCj4gPiA+ICAJc3RydWN0IHBjaV9ob3N0X2JyaWRn
ZSAqaG9zdCA9IHBjaV9maW5kX2hvc3RfYnJpZGdlKGRldi0+YnVzKTsKPiA+ID4gLQlzdHJ1Y3Qg
cGNpX2RldiAqYnJpZGdlOwo+ID4gPiArCXN0cnVjdCBwY2lfZGV2ICpicmlkZ2UgPSBOVUxMOwo+
ID4gPiAgCXUzMiBjYXAsIGN0bDsKPiA+ID4gIAo+ID4gPiAgCWlmICghcGNpX2lzX3BjaWUoZGV2
KSkKPiA+ID4gQEAgLTIxOTEsNiArMjE5MSwyMSBAQCBzdGF0aWMgdm9pZCBwY2lfY29uZmlndXJl
X2x0cihzdHJ1Y3QgcGNpX2RldiAqZGV2KQo+ID4gPiAgCWlmIChwY2lfcGNpZV90eXBlKGRldikg
PT0gUENJX0VYUF9UWVBFX1JPT1RfUE9SVCB8fAo+ID4gPiAgCSAgICAoKGJyaWRnZSA9IHBjaV91
cHN0cmVhbV9icmlkZ2UoZGV2KSkgJiYKPiA+ID4gIAkgICAgICBicmlkZ2UtPmx0cl9wYXRoKSkg
ewo+ID4gPiArCQkvKgo+ID4gPiArCQkgKiBEb3duc3RyZWFtIHBvcnRzIHJlc2V0IHRoZSBMVFIg
ZW5hYmxlIGJpdCB3aGVuIHRoZQo+ID4gPiArCQkgKiBsaW5rIGdvZXMgZG93biAoZS5nIG9uIGhv
dC1yZW1vdmUpIHNvIHJlLWVuYWJsZSB0aGUKPiA+ID4gKwkJICogYml0IGhlcmUgaWYgbm90IHNl
dCBhbnltb3JlLgo+ID4gPiArCQkgKiBQQ0llIHI1LjAsIHNlYyA3LjUuMy4xNi4KPiA+ID4gKwkJ
ICovCj4gPiA+ICsJCWlmIChicmlkZ2UpIHsKPiA+ID4gKwkJCXBjaWVfY2FwYWJpbGl0eV9yZWFk
X2R3b3JkKGJyaWRnZSwgUENJX0VYUF9ERVZDVEwyLCAmY3RsKTsKPiA+ID4gKwkJCWlmICghKGN0
bCAmIFBDSV9FWFBfREVWQ1RMMl9MVFJfRU4pKSB7Cj4gPiA+ICsJCQkJcGNpX2RiZyhicmlkZ2Us
ICJyZS1lbmFibGluZyBMVFJcbiIpOwo+ID4gPiArCQkJCXBjaWVfY2FwYWJpbGl0eV9zZXRfd29y
ZChicmlkZ2UsIFBDSV9FWFBfREVWQ1RMMiwKPiA+ID4gKwkJCQkJCQkgUENJX0VYUF9ERVZDVEwy
X0xUUl9FTik7Cj4gPiA+ICsJCQl9Cj4gPiA+ICsJCX0KPiA+ID4gKwkJcGNpX2RiZyhkZXYsICJl
bmFibGluZyBMVFJcbiIpOwo+ID4gPiAgCQlwY2llX2NhcGFiaWxpdHlfc2V0X3dvcmQoZGV2LCBQ
Q0lfRVhQX0RFVkNUTDIsCj4gPiA+ICAJCQkJCSBQQ0lfRVhQX0RFVkNUTDJfTFRSX0VOKTsKPiA+
ID4gIAkJZGV2LT5sdHJfcGF0aCA9IDE7Cj4gPiA+IC0tIAo+ID4gPiAyLjI5LjIKPiA+ID4gCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
