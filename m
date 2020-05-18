Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23F8C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 11:17:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97285207F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 11:17:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qi7YJgqq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97285207F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sv+wcaC5qe6NoUtrJAyuyVLOVvi88caPOo9Jrz5HowE=; b=qi7YJgqqlzeMOf
	CJJvd5zrKgrLzIdJipmey2L9epKu1m7auXW3nwQZU7xt+0c90LAHCh8dn9wtdutL/RD/vTgDqORZX
	YFxt8z8+zwwGjbEUaXEE/g7TYAJD9/mhO6KxjPA/+GbR50+wDN1MPFL3MoqbDm8YuTlOSBAjbSHkY
	GKHcPlPLeF3ZXFSR5OF3oRarb1rNhqUUyc8fD9w+p0eR6VNExjsBB3gJSI3hm2mLoaerkN4UKCQX3
	voPZYnI3HRuShV+AR6OS/ETB25yc8vxXuuxl+Dtu3iWo/FrIK74ATxt4V1WKJaEXfT5szT9UjGry2
	mkcVanWh0a4eTk0VwnzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jadm6-0006hM-Uk; Mon, 18 May 2020 11:17:38 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jadlw-0006YX-Vy; Mon, 18 May 2020 11:17:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07E9A106F;
 Mon, 18 May 2020 04:17:26 -0700 (PDT)
Received: from [192.168.0.110] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFEA13F52E;
 Mon, 18 May 2020 04:17:23 -0700 (PDT)
Subject: Re: [PATCH 0/3] arm64: perf: Add support for Perf NMI interrupts
To: Mark Rutland <mark.rutland@arm.com>, Lecopzer Chen <lecopzer@gmail.com>
References: <20200516124857.75004-1-lecopzer@gmail.com>
 <CAFA6WYNwp+_ENiS8QDao5+RXyt5ofJZyq6c5CKG_d0CNEmBNYg@mail.gmail.com>
 <CANr2M19unLW8n0P2DiOYEZ=GZcaD-L2ygPht_5HNtNZ6e4h6xQ@mail.gmail.com>
 <20200518104524.GA1224@C02TD0UTHF1T.local>
From: Alexandru Elisei <alexandru.elisei@arm.com>
Message-ID: <a9002b5e-aec5-b6e0-7174-87b93351d60c@arm.com>
Date: Mon, 18 May 2020 12:17:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518104524.GA1224@C02TD0UTHF1T.local>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_041729_115320_41BB670C 
X-CRM114-Status: GOOD (  21.96  )
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
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Jian-Lin Chen <lecopzer.chen@mediatek.com>, Will Deacon <will@kernel.org>,
 alexander.shishkin@linux.intel.com, Catalin Marinas <catalin.marinas@arm.com>,
 yj.chiang@mediatek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, acme@kernel.org,
 Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 matthias.bgg@gmail.com, namhyung@kernel.org, jolsa@redhat.com,
 julien.thierry.kdev@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksCgpPbiA1LzE4LzIwIDExOjQ1IEFNLCBNYXJrIFJ1dGxhbmQgd3JvdGU6Cj4gSGkgYWxsLAo+
Cj4gT24gTW9uLCBNYXkgMTgsIDIwMjAgYXQgMDI6MjY6MDBQTSArMDgwMCwgTGVjb3B6ZXIgQ2hl
biB3cm90ZToKPj4gSEkgU3VtaXQsCj4+Cj4+IFRoYW5rcyBmb3IgeW91ciBpbmZvcm1hdGlvbi4K
Pj4KPj4gSSd2ZSBhbHJlYWR5IGltcGxlbWVudGVkIElQSSAoc2FtZSBhcyB5b3UgZGlkIFsxXSwg
bGl0dGxlIGRpZmZlcmVuY2UKPj4gaW4gZGV0YWlsKSwgaGFyZGxvY2t1cCBkZXRlY3RvciBhbmQg
cGVyZiBpbiBsYXN0IHllYXIoMjAxOSkgZm9yCj4+IGRlYnVnZ2FiaWxpdHkuCj4+IEFuZCBub3cg
d2UgdGVuZCB0byB1cHN0cmVhbSB0byByZWR1Y2Uga2VybmVsIG1haW50YWluaW5nIGVmZm9ydC4K
Pj4gSSdtIGdsYWQgaWYgc29tZW9uZSBpbiBBUk0gY2FuIGRvIHRoaXMgd29yayA6KQo+Pgo+PiBI
aSBKdWxpZW4sCj4+Cj4+IERvZXMgYW55IEFybSBtYWludGFpbmVycyBjYW4gcHJvY2VlZCB0aGlz
IGFjdGlvbj8KPiBBbGV4YW5kcnUgKENjJ2QpIGhhcyBiZWVuIHJlYmFzaW5nIGFuZCByZXdvcmtp
bmcgSnVsaWVuJ3MgcGF0Y2hlcywgd2hpY2gKPiBpcyBteSBwcmVmZXJyZWQgYXBwcm9hY2guCj4K
PiBJIHVuZGVyc3RhbmQgdGhhdCdzIG5vdCBxdWl0ZSByZWFkeSBmb3IgcG9zdGluZyBzaW5jZSBo
ZSdzIGludmVzdGlnYXRpbmcKPiBzb21lIG9mIHRoZSBuYXN0aWVyIHN1YnRsZXRpZXMgKGUuZy4g
bXV0dWFsIGV4Y2x1c2lvbiB3aXRoIHRoZSBOTUkpLCBidXQKPiBtYXliZSB3ZSBjYW4gcHV0IHRo
ZSB3b3JrLWluLXByb2dyZXNzIHBhdGNoZXMgc29tZXdoZXJlIGluIHRoZSBtZWFuCj4gdGltZS4K
Pgo+IEFsZXhhbmRydSwgZG8geW91IGhhdmUgYW4gaWRlYSBvZiB3aGF0IG5lZWRzIHRvIGJlIGRv
bmUsIGFuZC9vciB3aGVuIHlvdQo+IGV4cGVjdCB5b3UgY291bGQgcG9zdCB0aGF0PwoKSSdtIGN1
cnJlbnRseSB3b3JraW5nIG9uIHJlYmFzaW5nIHRoZSBwYXRjaGVzIG9uIHRvcCBvZiA1LjctcmM1
LCB3aGVuIEkgaGF2ZQpzb21ldGhpbmcgdXNhYmxlIEknbGwgcG9zdCBhIGxpbmsgKHNob3VsZCBi
ZSBhIGNvdXBsZSBvZiBkYXlzKS4gQWZ0ZXIgdGhhdCBJIHdpbGwKYWRkcmVzcyB0aGUgcmV2aWV3
IGNvbW1lbnRzLCBhbmQgSSBwbGFuIHRvIGRvIGEgdGhvcm91Z2ggdGVzdGluZyBiZWNhdXNlIEkn
bSBub3QKMTAwJSBjb25maWRlbnQgdGhhdCBzb21lIG9mIHRoZSBhc3N1bXB0aW9ucyBhcm91bmQg
dGhlIGxvY2tzIHRoYXQgd2VyZSByZW1vdmVkIGFyZQpjb3JyZWN0LiBNeSBndWVzcyBpcyB0aGlz
IHdpbGwgdGFrZSBhIGZldyB3ZWVrcy4KClRoYW5rcywKQWxleAo+Cj4gVGhhbmtzLAo+IE1hcmsu
Cj4KPj4gVGhpcyBpcyByZWFsbHkgdXNlZnVsIGluIGRlYnVnZ2luZy4KPj4gVGhhbmsgeW91ISEK
Pj4KPj4KPj4KPj4gWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzQvMjQvMzI4Cj4+Cj4+
Cj4+IExlY29wemVyCj4+Cj4+IFN1bWl0IEdhcmcgPHN1bWl0LmdhcmdAbGluYXJvLm9yZz4g5pa8
IDIwMjDlubQ15pyIMTjml6Ug6YCx5LiAIOS4i+WNiDE6NDblr6vpgZPvvJoKPj4+ICsgSnVsaWVu
Cj4+Pgo+Pj4gSGkgTGVjb3B6ZXIsCj4+Pgo+Pj4gT24gU2F0LCAxNiBNYXkgMjAyMCBhdCAxODoy
MCwgTGVjb3B6ZXIgQ2hlbiA8bGVjb3B6ZXJAZ21haWwuY29tPiB3cm90ZToKPj4+PiBUaGVzZSBz
ZXJpZXMgaW1wbGVtZW50IFBlcmYgTk1JIGZ1bnh0aW9uYWxpdHkgYW5kIGRlcGVuZHMgb24KPj4+
PiBQc2V1ZG8gTk1JIFsxXSB3aGljaCBoYXMgYmVlbiB1cHN0cmVhbWVkLgo+Pj4+Cj4+Pj4gSW4g
YXJtNjQgd2l0aCBHSUN2MywgUHNldWRvIE5NSSB3YXMgaW1wbGVtZW50ZWQgZm9yIE5NSS1saWtl
IGludGVycnV0cy4KPj4+PiBUaGF0IGNhbiBiZSBleHRlbmRlZCB0byBQZXJmIE5NSSB3aGljaCBp
cyB0aGUgcHJlcmVxdWlzaXRlIGZvciBoYXJkLWxvY2t1cAo+Pj4+IGRldGVjdG9yIHdoaWNoIGhh
ZCBhbHJlYWR5IGEgc3RhbmRhcmQgaW50ZXJmYWNlIGluc2lkZSBMaW51eC4KPj4+Pgo+Pj4+IFRo
dXMgdGhlIGZpcnN0IHN0ZXAgd2UgbmVlZCB0byBpbXBsZW1lbnQgcGVyZiBOTUkgaW50ZXJmYWNl
IGFuZCBtYWtlIHN1cmUKPj4+PiBpdCB3b3JrcyBmaW5lLgo+Pj4+Cj4+PiBUaGlzIGlzIHNvbWV0
aGluZyB0aGF0IGlzIGFscmVhZHkgaW1wbGVtZW50ZWQgdmlhIEp1bGllbidzIHBhdGNoLXNldAo+
Pj4gWzFdLiBJdHMgdjQgaGFzIGJlZW4gZmxvYXRpbmcgc2luY2UgSnVseSwgMjAxOSBhbmQgSSBj
b3VsZG4ndCBmaW5kIGFueQo+Pj4gbWFqb3IgYmxvY2tpbmcgY29tbWVudHMgYnV0IG5vdCBzdXJl
IHdoeSB0aGluZ3MgaGF2ZW4ndCBwcm9ncmVzc2VkCj4+PiBmdXJ0aGVyLgo+Pj4KPj4+IE1heWJl
IEp1bGllbiBvciBBcm0gbWFpbnRhaW5lcnMgY2FuIHByb3ZpZGUgdXBkYXRlcyBvbiBleGlzdGlu
Zwo+Pj4gcGF0Y2gtc2V0IFsxXSBhbmQgaG93IHdlIHNob3VsZCBwcm9jZWVkIGZ1cnRoZXIgd2l0
aCB0aGlzIGludGVyZXN0aW5nCj4+PiBmZWF0dXJlLgo+Pj4KPj4+IEFuZCByZWdhcmRpbmcgaGFy
ZC1sb2NrdXAgZGV0ZWN0aW9uLCBJIGhhdmUgYmVlbiBhYmxlIHRvIGVuYWJsZSBpdAo+Pj4gYmFz
ZWQgb24gcGVyZiBOTUkgZXZlbnRzIHVzaW5nIEp1bGllbidzIHBlcmYgcGF0Y2gtc2V0IFsxXS4g
SGF2ZSBhCj4+PiBsb29rIGF0IHRoZSBwYXRjaCBoZXJlIFsyXS4KPj4+Cj4+PiBbMV0gaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTA0NzQwNy8KPj4+IFsyXSBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtYXJtLWtlcm5lbC8yMDIwLU1heS83MzIy
MjcuaHRtbAo+Pj4KPj4+IC1TdW1pdAo+Pj4KPj4+PiBQZXJmIE5NSSBoYXMgYmVlbiB0ZXN0IGJ5
IGRkIGlmPS9kZXYvdXJhbmRvbSBvZj0vZGV2L251bGwgbGlrZSB0aGUgbGluayBbMl0KPj4+PiBk
aWQuCj4+Pj4KPj4+PiBbMV0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMS8zMS81MzUKPj4+
PiBbMl0gaHR0cHM6Ly93d3cubGluYXJvLm9yZy9ibG9nL2RlYnVnZ2luZy1hcm0ta2VybmVscy11
c2luZy1ubWlmaXEKPj4+Pgo+Pj4+Cj4+Pj4gTGVjb3B6ZXIgQ2hlbiAoMyk6Cj4+Pj4gICBhcm1f
cG11OiBBZGQgc3VwcG9ydCBmb3IgcGVyZiBOTUkgaW50ZXJydXB0cyByZWdpc3RyYXRpb24KPj4+
PiAgIGFybTY0OiBwZXJmOiBTdXBwb3J0IE5NSSBjb250ZXh0IGZvciBwZXJmIGV2ZW50IElTUgo+
Pj4+ICAgYXJtNjQ6IEtjb25maWc6IEFkZCBzdXBwb3J0IGZvciB0aGUgUGVyZiBOTUkKPj4+Pgo+
Pj4+ICBhcmNoL2FybTY0L0tjb25maWcgICAgICAgICAgICAgfCAxMCArKysrKysrCj4+Pj4gIGFy
Y2gvYXJtNjQva2VybmVsL3BlcmZfZXZlbnQuYyB8IDM2ICsrKysrKysrKysrKysrKysrKy0tLS0t
LQo+Pj4+ICBkcml2ZXJzL3BlcmYvYXJtX3BtdS5jICAgICAgICAgfCA1MSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tCj4+Pj4gIGluY2x1ZGUvbGludXgvcGVyZi9hcm1fcG11Lmgg
ICB8ICA2ICsrKysKPj4+PiAgNCBmaWxlcyBjaGFuZ2VkLCA4OCBpbnNlcnRpb25zKCspLCAxNSBk
ZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IC0tCj4+Pj4gMi4yNS4xCj4+Pj4KPj4+Pgo+Pj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4gbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKPj4+PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
