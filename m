Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887A3C41604
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 14:47:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C3172065C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 14:47:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p3sMKnAo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C3172065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h4D2Ni1Zhu97w9uxBYyEzHt2EODgDctdDdc7S/L7q8g=; b=p3sMKnAogT1Tod4HupjC+J3Vr
	1EBFJq7Zaq2ZYuzVbh8TWAcct98rnDDc43gkGwQ3qevUxUZSAVv/NuzjY4NSmGXQLglaXvqQn7GFZ
	1WV+odsPmPIn3Iw1vCML5aAfrHCzx8V6MY9Qu6PRgse3OnGw8+ZZmM5lNLhSleINmS1QQ6lTbLSFo
	dbBiIXjoU6x91E7aHYpPQGLoqGXxOSrNHhKcv8qNwcori5j/JIBbAteG3tqCHySky+kp2ho3QS9YY
	MW6f8dQnQTKh+GKb/277ulMzTIgDtgiyh/qs995wKA+/Mp6nJo+3Tce12W8gmRWQLCa0YDymq/TTy
	JN5mLtV+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPoF0-0008CA-9O; Tue, 06 Oct 2020 14:46:58 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPoEu-0008A1-GZ; Tue, 06 Oct 2020 14:46:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 408791476;
 Tue,  6 Oct 2020 07:46:50 -0700 (PDT)
Received: from [10.57.54.147] (unknown [10.57.54.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B2433F71F;
 Tue,  6 Oct 2020 07:46:46 -0700 (PDT)
Subject: Re: [PATCH] thermal: power_allocate: add upper and lower limits
From: Lukasz Luba <lukasz.luba@arm.com>
To: Michael Kao <michael.kao@mediatek.com>
References: <20200424071601.2636-1-michael.kao@mediatek.com>
 <accb83e0-ffbe-b6e3-6bf9-e7cc8b9fe19c@arm.com>
 <1588156776.3573.1.camel@mtksdccf07>
 <03286571-c110-7f5e-a911-24f8c3e4fd42@arm.com>
 <1598347775.16267.0.camel@mtksdccf07>
 <25cb2d5b-0d87-8a22-a881-a5b6e46307ec@arm.com>
Message-ID: <77bd14bb-0318-332a-4ea1-f60a314ce3be@arm.com>
Date: Tue, 6 Oct 2020 15:46:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <25cb2d5b-0d87-8a22-a881-a5b6e46307ec@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_104652_664605_E703D72B 
X-CRM114-Status: GOOD (  32.64  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxMC82LzIwIDM6MzkgUE0sIEx1a2FzeiBMdWJhIHdyb3RlOgo+IEhpIE1pY2hhZWwsCj4g
Cj4gT24gOC8yNS8yMCAxMDoyOSBBTSwgTWljaGFlbCBLYW8gd3JvdGU6Cj4+IE9uIFdlZCwgMjAy
MC0wNC0yOSBhdCAyMToyNCArMDEwMCwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4+Pgo+Pj4gT24gNC8y
OS8yMCAxMTozOSBBTSwgTWljaGFlbCBLYW8gd3JvdGU6Cj4+Pj4gT24gRnJpLCAyMDIwLTA0LTI0
IGF0IDEwOjIyICswMTAwLCBMdWthc3ogTHViYSB3cm90ZToKPj4+Pj4gSGkgTWljaGFlbCwKPj4+
Pj4KPj4+Pj4gT24gNC8yNC8yMCA4OjE2IEFNLCBNaWNoYWVsIEthbyB3cm90ZToKPj4+Pj4+IFRo
ZSB1cHBlciBhbmQgbG93ZXIgbGltaXRzIG9mIHRoZXJtYWwgdGhyb3R0bGUgc3RhdGUgaW4gdGhl
Cj4+Pj4+PiBkZXZpY2UgdHJlZSBkbyBub3QgYXBwbHkgdG8gdGhlIHBvd2VyX2FsbG9jYXRlIGdv
dmVybm9yLgo+Pj4+Pj4gQWRkIHRoZSB1cHBlciBhbmQgbG93ZXIgbGltaXRzIHRvIHRoZSBwb3dl
cl9hbGxvY2F0ZSBnb3Zlcm5vci4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVs
IEthbyA8bWljaGFlbC5rYW9AbWVkaWF0ZWsuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiDCoMKgwqAg
ZHJpdmVycy90aGVybWFsL3RoZXJtYWxfY29yZS5jIHwgMiArLQo+Pj4+Pj4gwqDCoMKgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4KPj4+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvdGhlcm1hbF9jb3JlLmMgCj4+Pj4+PiBiL2RyaXZl
cnMvdGhlcm1hbC90aGVybWFsX2NvcmUuYwo+Pj4+Pj4gaW5kZXggOWEzMjFkYzU0OGM4Li5mNmZl
ZWQyMjY1YmQgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvdGhlcm1hbF9jb3Jl
LmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC90aGVybWFsX2NvcmUuYwo+Pj4+Pj4gQEAg
LTU5OCw3ICs1OTgsNyBAQCBpbnQgcG93ZXJfYWN0b3Jfc2V0X3Bvd2VyKHN0cnVjdCAKPj4+Pj4+
IHRoZXJtYWxfY29vbGluZ19kZXZpY2UgKmNkZXYsCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpZiAo
cmV0KQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4+Pj4gLcKg
wqDCoCBpbnN0YW5jZS0+dGFyZ2V0ID0gc3RhdGU7Cj4+Pj4+PiArwqDCoMKgIGluc3RhbmNlLT50
YXJnZXQgPSBjbGFtcF92YWwoc3RhdGUsIGluc3RhbmNlLT5sb3dlciwgCj4+Pj4+PiBpbnN0YW5j
ZS0+dXBwZXIpOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgbXV0ZXhfbG9jaygmY2Rldi0+bG9jayk7
Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBjZGV2LT51cGRhdGVkID0gZmFsc2U7Cj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoCBtdXRleF91bmxvY2soJmNkZXYtPmxvY2spOwo+Pj4+Pj4KPj4+Pj4KPj4+Pj4g
VGhhbmsgeW91IGZvciB0aGUgcGF0Y2ggYW5kIGhhdmluZyB0byBsb29rIGF0IGl0LiBJIGhhdmUg
c29tZSBjb25jZXJucwo+Pj4+PiB3aXRoIHRoaXMgYXBwcm9hY2guIExldCdzIGFuYWx5emUgaXQg
ZnVydGhlci4KPj4+Pj4KPj4+Pj4gSW4gZGVmYXVsdCB0aGUgY29vbGluZyBkZXZpY2VzIGluIHRo
ZSB0aGVybWFsIHpvbmUgd2hpY2ggaXMgdXNlZCBieSAKPj4+Pj4gSVBBCj4+Pj4+IGRvIG5vdCBo
YXZlIHRoaXMgJ2xvd2VyJyBhbmQgJ3VwcGVyJyBsaW1pdHMuIFRoZXkgYXJlIHNldCB0bwo+Pj4+
PiBUSEVSTUFMX05PX0xJTUlUIGluIERUIHRvIGdpdmUgZnVsbCBjb250cm9sIHRvIElQQSBvdmVy
IHRoZSBzdGF0ZXMuCj4+Pj4+Cj4+Pj4+IFRoaXMgdGhlIGZ1bmN0aW9uICdwb3dlcl9hY3Rvcl9z
ZXRfcG93ZXInIGFjdHVhbGx5IHRyYW5zbGF0ZXMgZ3JhbnRlZAo+Pj4+PiBwb3dlciB0byB0aGUg
c3RhdGUgdGhhdCBkZXZpY2Ugd2lsbCBydW4gZm9yIHRoZSBuZXh0IHBlcmlvZC4KPj4+Pj4gVGhl
IElQQSBhbGdvcml0aG0gaGFzIGFscmVhZHkgc3BsaXQgdGhlIHBvd2VyIGJ1ZGdldC4KPj4+Pj4g
Tm93IHdoYXQgaGFwcGVuIHdoZW4gdGhlICdsb3dlcicgdmFsdWUgd2lsbCBjaGFuZ2UgdGhlIHN0
YXRlIHRvIGEgCj4+Pj4+IHN0YXRlCj4+Pj4+IHdoaWNoIGNvbnN1bWVzIG1vcmUgcG93ZXIgdGhh
biB3YXMgY2FsY3VsYXRlZCBpbiB0aGUgSVBBIGFsZy4uLiBJdCAKPj4+Pj4gd2lsbAo+Pj4+PiBi
ZWNhbWUgdW5zdGFibGUuCj4+Pj4+Cj4+Pj4+IEkgd291bGQgcmF0aGVyIHNlZSBhIGNoYW5nZSB3
aGljaCB1c2VzIHRoZXNlICdsb3dlcicgYW5kICd1cHBlcicgCj4+Pj4+IGxpbWl0cwo+Pj4+PiBi
ZWZvcmUgdGhlIElQQSBkbyB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIHBvd2VyIGJ1ZGdldC4gQnV0
IHRoaXMgd2Fzbid0Cj4+Pj4+IGEgcmVxdWlyZW1lbnQgYW5kIHdlIGFzc3VtZWQgdGhhdCBJUEEg
aGFzIGZ1bGwgY29udHJvbCBvdmVyIHRoZSAKPj4+Pj4gY29vbGluZwo+Pj4+PiBkZXZpY2UgKHdo
aWNoIEkgZGVzY3JpYmVkIGFib3ZlIHdpdGggdGhpcyBEVCBUSEVSTUFMX05PX0xJTUlUKS4KPj4+
Pj4KPj4+Pj4gSXMgdGhlcmUgYSBwcm9ibGVtIHdpdGggeW91ciBwbGF0Zm9ybSB0aGF0IGl0IGhh
cyB0byBwcm92aWRlIHNvbWUKPj4+Pj4gbWluaW1hbCBwZXJmb3JtYW5jZSwgc28geW91IHRyaWVk
IHRvIGludHJvZHVjZSB0aGlzIGNsYW1waW5nPwo+Pj4+Pgo+Pj4+PiBSZWdhcmRzLAo+Pj4+PiBM
dWthc3oKPj4+Pgo+Pj4+Cj4+Pj4gSGkgTHVrYXN6LAo+Pj4+Cj4+Pj4gSSByZWZlciB0byB0aGUg
ZG9jdW1lbnRhdGlvbiBzZXR0aW5ncyBvZiB0aGUgdGhlcm1hbCBkZXZpY2UgdHJlZQo+Pj4+IChE
b2N1bWVudGF0aW9uIC8gZGV2aWNldHJlZSAvIGJpbmRpbmdzIC8gdGhlcm1hbCAvIHRoZXJtYWwu
dHh0KS4KPj4+Pgo+Pj4+IEl0IHNob3dzIHRoYXQgY29vbGluZy1kZXZpY2UgaXMgYSBtYW5kYXRv
cnkgcHJvcGVydHksIHNvIG1heC9taW4gCj4+Pj4gY29vbGluZwo+Pj4+IHN0YXRlIHNob3VsZCBi
ZSBhYmxlIHRvIHN1cHBvcnQgaW4gZnJhbWV3b3JrIHBvaW50IG9mIHZpZXcuCj4+Pj4gT3RoZXJ3
aXNlLCB0aGUgbGltaXRhdGlvbiBzaG91bGQgYmUgYWRkZWQgaW4gYmluZGluZyBkb2N1bWVudC4K
Pj4+Pgo+Pj4+IERpZmZlcmVudCBoYXJkd2FyZSBtZWNoYW5pc21zIGhhdmUgZGlmZmVyZW50IGhl
YXQgZGlzc2lwYXRpb24KPj4+PiBjYXBhYmlsaXRpZXMuCj4+Pj4gTGltaXRpbmcgdGhlIGlucHV0
IGhlYXQgc291cmNlIGNhbiBzbG93IGRvd24gdGhlIGhlYXQgYWNjdW11bGF0aW9uIGFuZAo+Pj4+
IHRlbXBlcmF0dXJlIGJ1cnN0Lgo+Pj4+IFdlIHdhbnQgdG8gcmVkdWNlIHRoZSBhY2N1bXVsYXRp
b24gb2YgaGVhdCBhdCBoaWdoIHRlbXBlcmF0dXJlIGJ5Cj4+Pj4gbGltaXRpbmcgdGhlIG1pbmlt
dW0gZ2VhciBvZiB0aGVybWFsIHRocm90dGxlLgo+Pj4KPj4+IEkgYWdyZWUgdGhhdCB0aGVzZSAn
bG93ZXInIGFuZCAndXBwZXInIGxpbWl0cyBzaG91bGRuJ3QgYmUganVzdAo+Pj4gaWdub3JlZCBh
cyBpcyBjdXJyZW50bHkuIFRoaXMgcGF0Y2ggY2xhbXBzIHRoZSB2YWx1ZSBhdCBsYXRlIHN0YWdl
LAo+Pj4gdGhvdWdoLgo+Pj4KPj4+IExldCBtZSBoYXZlIGEgbG9vayBob3cgaXQgY291bGQgYmUg
dGFrZW4gaW50byBhY2NvdW50IGluIHRoZSBlYXJseQo+Pj4gc3RhZ2UsIGJlZm9yZSB0aGUgcG93
ZXIgY2FsY3VsYXRpb24gYW5kIHNwbGl0IGFyZSBkb25lLiBNYXliZSB0aGVyZQo+Pj4gaXMgYSBj
bGVhbiB3YXkgdG8gaW5qZWN0IHRoaXMuCj4+Pgo+Pj4gUmVnYXJkcywKPj4+IEx1a2Fzego+PiBI
aSBMdWthc3osCj4+Cj4+IEFmdGVyIHRoZSByZXNlYXJjaCwgZG8geW91IGhhdmUgYW55IGlkZWFz
IG9yIHN1Z2dlc3Rpb25zPwo+Pgo+PiBCZXN0IFJlZ2FyZHMsCj4+IE1pY2hhZWwKPj4KPiAKPiBN
eSBhcG9sb2dpZXMgZm9yIHRoZSBkZWxheS4gSSBoYXZlIGRvbmUgc29tZSBleHBlcmltZW50cy4K
PiBDb3VsZCB5b3UgcmVzZW5kIHRoZSBwYXRjaCwgcGxlYXNlIG1ha2Ugc3VyZSBpdCBpcyBub3Qg
ZW5jb2RlZCBpbiBiYXNlNjQKPiBsaWtlIHRoaXMgb25lLgo+IAo+IEkgYW0gZ29pbmcgdG8gdGFr
ZSB5b3VyIHBhdGNoIHRvZ2V0aGVyIHdpdGggc29tZSBvdGhlciBjaGFuZ2VzLgo+IAo+IFJlZ2Fy
ZHMsCj4gTHVrYXN6CgpQbGVhc2UgY2hhbmdlIGFsc28gdGhlIGNvbW1pdCBtZXNzYWdlIHRvIHNv
bWV0aGluZyBsaWtlOgoKdGhlcm1hbDogY29yZTogYWRkIHVwcGVyIGFuZCBsb3dlciBsaW1pdHMg
dG8gcG93ZXJfYWN0b3Jfc2V0X3Bvd2VyCgpUaGUgdXBwZXIgYW5kIGxvd2VyIGxpbWl0cyBvZiB0
aGVybWFsIHRocm90dGxlIHN0YXRlIGluIHRoZQpEVCBkbyBub3QgYXBwbHkgdG8gdGhlIEludGVs
bGlnZW50IFBvd2VyIEFsbG9jYXRpb24gKElQQSkgZ292ZXJub3IuCkFkZCB0aGUgY2xhbXBpbmcg
Zm9yIGNvb2xpbmcgZGV2aWNlIHVwcGVyIGFuZCBsb3dlciBsaW1pdHMgaW4gdGhlCnBvd2VyX2Fj
dG9yX3NldF9wb3dlcigpIHVzZWQgYnkgSVBBLgoKUmVnYXJkcywKTHVrYXN6CgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
