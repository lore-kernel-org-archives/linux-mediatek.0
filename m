Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58031C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 11:17:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60A96206C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 11:17:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m4Um4oqz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60A96206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dh++Xb6pu42f4IcFcgBuWJBaDdNe7FjN2XwhKI0wPcU=; b=m4Um4oqzUS/YPt+VFxrJNOHeH
	4yi9SMMOrAo3YEbJbZNonTYUKCDd9668d3cNC0wzO6GgvkLPUOZdBNuXHKQZBvGNG1dKOZkdJUj5V
	AO29J0ev7J5xnvKmDjqSuivYFCtt8+kLNHIVfgo3UGh+d1MAbTD+9lBL0DOO9v7gA1AeAUEGqPTWx
	jYN+qy4yVH4CRl5SVR3yM4T/VfO9Th/d/PG7Cj9h9uUmsI2IzDdHHj8bE0JzjfcFe60ujzMQa+FPy
	XfUoArgl4kZUyRsOl3uOCW4X//5aX0j+P7ci/I0f5Q7hj0+/YG3XyI8XVJ+O2MoAm0guyuU8rrQBj
	dSlg5gCEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYSPi-0006YI-Hv; Fri, 30 Oct 2020 11:17:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYSPV-0006VF-QV; Fri, 30 Oct 2020 11:17:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 473B91F45EAF
Subject: Re: [PATCH v3 15/16] soc: mediatek: pm-domains: Add default power off
 flag
To: Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-16-enric.balletbo@collabora.com>
 <05be2a94-d6e6-36e5-2c14-6d971e4a7677@gmail.com>
 <1603797517.25228.3.camel@mtksdaap41>
 <83197162-6bfc-b861-653e-4fd21035b5ae@gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <51cfbada-0ced-56d1-2836-8446fa8957b9@collabora.com>
Date: Fri, 30 Oct 2020 12:17:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <83197162-6bfc-b861-653e-4fd21035b5ae@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_071734_146810_A9C11433 
X-CRM114-Status: GOOD (  21.87  )
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
Cc: drinkcat@chromium.org, linux-kernel@vger.kernel.org, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgV2VpbHlpIGFuZCBNYXR0aGlhcywKCk9uIDI5LzEwLzIwIDE1OjUxLCBNYXR0aGlhcyBCcnVn
Z2VyIHdyb3RlOgo+IAo+IAo+IE9uIDI3LzEwLzIwMjAgMTI6MTgsIFdlaXlpIEx1IHdyb3RlOgo+
PiBPbiBUdWUsIDIwMjAtMTAtMjcgYXQgMTE6NTMgKzAxMDAsIE1hdHRoaWFzIEJydWdnZXIgd3Jv
dGU6Cj4+Pgo+Pj4gT24gMjYvMTAvMjAyMCAxODo1NSwgRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSB3
cm90ZToKPj4+PiBGcm9tOiBXZWl5aSBMdSA8d2VpeWkubHVAbWVkaWF0ZWsuY29tPgo+Pj4+Cj4+
Pj4gRm9yIHNvbWUgcG93ZXIgZG9tYWluLCBsaWtlIGNvbm4gb24gTVQ4MTkyLCBpdCBzaG91bGQg
YmUgZGVmYXVsdCBPRkYuCj4+Pj4gQmVjYXVzZSB0aGUgcG93ZXIgb24vb2ZmIGNvbnRyb2wgcmVs
aWVzIHRoZSBmdW5jdGlvbiBvZiBjb25uZWN0aXZpdHkgY2hpcAo+Pj4+IGFuZCBpdHMgZmlybXdh
cmUuIEFuZCBpZiBwcm9qZWN0IGNob29zZSBvdGhlciBjaGlwIHZlbmRvciBzb2x1dGlvbiwKPj4+
PiB0aG9zZSBuZWNlc3NhcnkgY29ubmVjdGl2aXR5IGZ1bmN0aW9ucyB3aWxsIG5vdCBwcm92aWRl
ZC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFdlaXlpIEx1IDx3ZWl5aS5sdUBtZWRpYXRlay5j
b20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFs
bGV0Ym9AY29sbGFib3JhLmNvbT4KPj4+PiAtLS0KPj4+Pgo+Pj4+IENoYW5nZXMgaW4gdjM6IE5v
bmUKPj4+PiBDaGFuZ2VzIGluIHYyOiBOb25lCj4+Pj4KPj4+PiDCoMKgIGRyaXZlcnMvc29jL21l
ZGlhdGVrL210ay1wbS1kb21haW5zLmMgfCAyMyArKysrKysrKysrKysrKysrKy0tLS0tLQo+Pj4+
IMKgwqAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuaCB8wqAgMSArCj4+Pj4g
wqDCoCAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+
Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMu
Ywo+Pj4+IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuYwo+Pj4+IGluZGV4
IDYzOTkzMDc2YTU0NC4uZmUwZTk1NTA3NmEwIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvc29j
L21lZGlhdGVrL210ay1wbS1kb21haW5zLmMKPj4+PiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstcG0tZG9tYWlucy5jCj4+Pj4gQEAgLTM3OCwxMCArMzc4LDE2IEBAIGdlbmVyaWNfcG1f
ZG9tYWluICpzY3BzeXNfYWRkX29uZV9kb21haW4oc3RydWN0IHNjcHN5cwo+Pj4+ICpzY3BzeXMs
IHN0cnVjdCBkZXZpY2Vfbm8KPj4+PiDCoMKgwqDCoMKgwqDCoCAqIHNvZnR3YXJlLsKgIFRoZSB1
bnVzZWQgZG9tYWlucyB3aWxsIGJlIHN3aXRjaGVkIG9mZiBkdXJpbmcKPj4+PiDCoMKgwqDCoMKg
wqDCoCAqIGxhdGVfaW5pdCB0aW1lLgo+Pj4+IMKgwqDCoMKgwqDCoMKgICovCj4+Pj4gLcKgwqDC
oCByZXQgPSBzY3BzeXNfcG93ZXJfb24oJnBkLT5nZW5wZCk7Cj4+Pj4gLcKgwqDCoCBpZiAocmV0
IDwgMCkgewo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBkZXZfZXJyKHNjcHN5cy0+ZGV2LCAiJXBPRjog
ZmFpbGVkIHRvIHBvd2VyIG9uIGRvbWFpbjogJWRcbiIsIG5vZGUsCj4+Pj4gcmV0KTsKPj4+PiAt
wqDCoMKgwqDCoMKgwqAgZ290byBlcnJfdW5wcmVwYXJlX2Nsb2NrczsKPj4+PiArwqDCoMKgIGlm
IChNVEtfU0NQRF9DQVBTKHBkLCBNVEtfU0NQRF9LRUVQX0RFRkFVTFRfT0ZGKSkgewo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBpZiAoc2Nwc3lzX2RvbWFpbl9pc19vbihwZCkpCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZGV2X3dhcm4oc2Nwc3lzLT5kZXYsCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICIlcE9GOiBBIGRlZmF1bHQgb2ZmIHBvd2VyIGRvbWFpbiBoYXMg
YmVlbiBPTlxuIiwgbm9kZSk7Cj4+Pj4gK8KgwqDCoCB9IGVsc2Ugewo+Pj4+ICvCoMKgwqDCoMKg
wqDCoCByZXQgPSBzY3BzeXNfcG93ZXJfb24oJnBkLT5nZW5wZCk7Cj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIGlmIChyZXQgPCAwKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihz
Y3BzeXMtPmRldiwgIiVwT0Y6IGZhaWxlZCB0byBwb3dlciBvbiBkb21haW46ICVkXG4iLAo+Pj4+
IG5vZGUsIHJldCk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfdW5wcmVw
YXJlX2Nsb2NrczsKPj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4+IMKgwqDCoMKgwqDCoCB9Cj4+
Pj4gwqDCoCDCoMKgwqDCoMKgwqAgaWYgKHNjcHN5cy0+ZG9tYWluc1tpZF0pIHsKPj4+PiBAQCAt
Mzk1LDcgKzQwMSwxMSBAQCBnZW5lcmljX3BtX2RvbWFpbiAqc2Nwc3lzX2FkZF9vbmVfZG9tYWlu
KHN0cnVjdCBzY3BzeXMKPj4+PiAqc2Nwc3lzLCBzdHJ1Y3QgZGV2aWNlX25vCj4+Pj4gwqDCoMKg
wqDCoMKgIHBkLT5nZW5wZC5wb3dlcl9vZmYgPSBzY3BzeXNfcG93ZXJfb2ZmOwo+Pj4+IMKgwqDC
oMKgwqDCoCBwZC0+Z2VucGQucG93ZXJfb24gPSBzY3BzeXNfcG93ZXJfb247Cj4+Pj4gwqDCoCAt
wqDCoMKgIHBtX2dlbnBkX2luaXQoJnBkLT5nZW5wZCwgTlVMTCwgZmFsc2UpOwo+Pj4+ICvCoMKg
wqAgaWYgKE1US19TQ1BEX0NBUFMocGQsIE1US19TQ1BEX0tFRVBfREVGQVVMVF9PRkYpKQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBwbV9nZW5wZF9pbml0KCZwZC0+Z2VucGQsIE5VTEwsIHRydWUpOwo+
Pj4+ICvCoMKgwqAgZWxzZQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwbV9nZW5wZF9pbml0KCZwZC0+
Z2VucGQsIE5VTEwsIGZhbHNlKTsKPj4+PiArCj4+Pj4gwqDCoMKgwqDCoMKgIHNjcHN5cy0+ZG9t
YWluc1tpZF0gPSAmcGQtPmdlbnBkOwo+Pj4+IMKgwqAgwqDCoMKgwqDCoMKgIHJldHVybiBzY3Bz
eXMtPnBkX2RhdGEuZG9tYWluc1tpZF07Cj4+Pj4gQEAgLTQ3OCw3ICs0ODgsOCBAQCBzdGF0aWMg
dm9pZCBzY3BzeXNfcmVtb3ZlX29uZV9kb21haW4oc3RydWN0Cj4+Pj4gc2Nwc3lzX2RvbWFpbiAq
cGQpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiZmFpbGVkIHRvIHJlbW92ZSBk
b21haW4gJyVzJyA6ICVkIC0gc3RhdGUgbWF5IGJlCj4+Pj4gaW5jb25zaXN0ZW50XG4iLAo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGQtPmdlbnBkLm5hbWUsIHJldCk7Cj4+Pj4g
wqDCoCAtwqDCoMKgIHNjcHN5c19wb3dlcl9vZmYoJnBkLT5nZW5wZCk7Cj4+Pj4gK8KgwqDCoCBp
ZiAoIU1US19TQ1BEX0NBUFMocGQsIE1US19TQ1BEX0tFRVBfREVGQVVMVF9PRkYpKQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBzY3BzeXNfcG93ZXJfb2ZmKCZwZC0+Z2VucGQpOwo+Pj4KPj4+IE9LLCBz
byB5b3UgbWVyZ2VkIFdlaXlpJ3MgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyA6KQo+Pj4KPj4+IFNv
IHNhbWUgY29tbWVudCBoZXJlOiBEb2VzIGl0IHJlYWxseSBodXJ0IGlmIHdlIHR1cm4tb2ZmIGEg
YWxyZWFkeSB0dXJuZWQtb2ZmCj4+PiBwb3dlciBkb21haW4/IE9yIGNhbiB3ZSBnZXQgcmlkIG9m
IHRoaXMgY2hlY2s/Cj4+Pgo+Pgo+PiBXZSBkbyBuZWVkIHRoaXMgY2hlY2sgaGVyZS4gSWYgeW91
IHRyeSB0byB0dXJuLW9mZiB0aGlzIHBvd2VyIGRvbWFpbiwKPj4geW91IG1pZ2h0IG1ha2UgdGhl
IGNsb2NrIG9yIHJlZ3VsYXRvciByZWZlcmVuY2UgY291bnQgdW5iYWxhbmNlZC4KPj4KPiAKPiBD
b3JyZWN0LiBDb3VsZCB3ZSBjaGVjayB2aWEgc2Nwc3lzX2RvbWFpbl9pc19vbigpIGluc3RlYWQ/
IEknZCBsaWtlIHRvIGF2b2lkCj4gTVRLX1NDUERfS0VFUF9ERUZBVUxUX09GRiB1c2UgaGVyZS4K
PiAKClNvLCBJJ20gdXNpbmcgc2Nwc3lzX2RvbWFpbl9pc19vbigpIG5vdyBmb3IgdGhpcyBjaGVj
ayBhbmQgbW92ZWQgYmVmb3JlCnBtX2dlbnBkX3JlbW92ZSBjYWxsLiBJJ2xsIGxldCB5b3UgYm90
aCB0byBkZWNpZGUgaWYgaXMgZmluZSBvciBub3QuCgo+IFJlZ2FyZHMsCj4gTWF0dGhpYXMKPiAK
Pj4+IFJlZ2FyZHMsCj4+PiBNYXR0aGlhcwo+Pj4KPj4+PiDCoMKgIMKgwqDCoMKgwqDCoCBjbGtf
YnVsa191bnByZXBhcmUocGQtPm51bV9jbGtzLCBwZC0+Y2xrcyk7Cj4+Pj4gwqDCoMKgwqDCoMKg
IGNsa19idWxrX3B1dChwZC0+bnVtX2Nsa3MsIHBkLT5jbGtzKTsKPj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuaAo+Pj4+IGIvZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuaAo+Pj4+IGluZGV4IDJhZDIxM2JlODRhNS4uMGZhNmE5
MzhiNDBjIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbS1kb21h
aW5zLmgKPj4+PiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG0tZG9tYWlucy5oCj4+
Pj4gQEAgLTYsNiArNiw3IEBACj4+Pj4gwqDCoCAjZGVmaW5lIE1US19TQ1BEX0FDVElWRV9XQUtF
VVDCoMKgwqDCoMKgwqDCoCBCSVQoMCkKPj4+PiDCoMKgICNkZWZpbmUgTVRLX1NDUERfRldBSVRf
U1JBTcKgwqDCoMKgwqDCoMKgIEJJVCgxKQo+Pj4+IMKgwqAgI2RlZmluZSBNVEtfU0NQRF9TUkFN
X0lTT8KgwqDCoMKgwqDCoMKgIEJJVCgyKQo+Pj4+ICsjZGVmaW5lIE1US19TQ1BEX0tFRVBfREVG
QVVMVF9PRkbCoMKgwqAgQklUKDMpCj4+Pj4gwqDCoCAjZGVmaW5lIE1US19TQ1BEX0NBUFMoX3Nj
cGQsIF94KcKgwqDCoCAoKF9zY3BkKS0+ZGF0YS0+Y2FwcyAmIChfeCkpCj4+Pj4gwqDCoCDCoMKg
ICNkZWZpbmUgU1BNX1ZERV9QV1JfQ09OwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAyMTAKPj4+
Pgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
