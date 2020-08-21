Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31585C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 00:12:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEE7020702
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 00:12:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h2ns1tfE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEE7020702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bZdSWE9wL4fZmHh2J4It5VTkwC1Z19qrWF3xtv6Ya3U=; b=h2ns1tfEmjbh/2PvL3Oh9yeNl
	RZ+HGoCjfQ23K/bjBxziO5MoMJqV3xncW5jALC4GH3zDo1ADId3WkLcAdalr36tjOVbcl0iJBapaJ
	Pfv2ZgIuMmSYeF51P5WrGFUaxbnhZ0DpC7/D9uq2JFWG9ai6mXFJan1V2Gb591T1n5J9ihtPmgnVO
	fkqeYOwBXkYdLqeDk67s9qmwYTveelQTNseiVh3YHIlWipvf1kgNgT1m81BcWdB0XcFnOYguigfrC
	uoU+u3q7lmZVAdcpZpp5nWPeUD43b6OgB6Kc0T2x8VQg9La4bkXraR1v+Vgtn3991C9IpSGkvW048
	9shHs7tmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8ufH-0000aQ-GF; Fri, 21 Aug 2020 00:12:15 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8ufD-0000Xm-OW; Fri, 21 Aug 2020 00:12:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF7E230E;
 Thu, 20 Aug 2020 17:12:04 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 346943F71F;
 Thu, 20 Aug 2020 17:11:59 -0700 (PDT)
Subject: Re: [PATCH 16/18] staging/media/tegra-vde: Clean up IOMMU workaround
To: Dmitry Osipenko <digetx@gmail.com>, hch@lst.de, joro@8bytes.org,
 linux@armlinux.org.uk
References: <cover.1597931875.git.robin.murphy@arm.com>
 <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
 <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com>
Date: Fri, 21 Aug 2020 01:11:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_201211_932015_FDA6BAB3 
X-CRM114-Status: GOOD (  31.05  )
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, s-anna@ti.com, will@kernel.org,
 m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, kyungmin.park@samsung.com, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, inki.dae@samsung.com, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0wOC0yMCAyMDo1MSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDIwLjA4LjIwMjAg
MTg6MDgsIFJvYmluIE11cnBoeSDQv9C40YjQtdGCOgo+PiBOb3cgdGhhdCBhcmNoL2FybSBpcyB3
aXJlZCB1cCBmb3IgZGVmYXVsdCBkb21haW5zIGFuZCBpb21tdS1kbWEsIHdlIG5vCj4+IGxvbmdl
ciBuZWVkIHRvIHdvcmsgYXJvdW5kIHRoZSBhcmNoLXByaXZhdGUgbWFwcGluZy4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPj4gLS0tCj4+
ICAgZHJpdmVycy9zdGFnaW5nL21lZGlhL3RlZ3JhLXZkZS9pb21tdS5jIHwgMTIgLS0tLS0tLS0t
LS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL3RlZ3JhLXZkZS9pb21tdS5jIGIvZHJpdmVycy9zdGFn
aW5nL21lZGlhL3RlZ3JhLXZkZS9pb21tdS5jCj4+IGluZGV4IDZhZjg2M2Q5MjEyMy4uNGY3NzAx
ODllZDM0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvdGVncmEtdmRlL2lv
bW11LmMKPj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL3RlZ3JhLXZkZS9pb21tdS5jCj4+
IEBAIC0xMCwxMCArMTAsNiBAQAo+PiAgICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPj4gICAj
aW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4+ICAgCj4+IC0jaWYgSVNfRU5BQkxF
RChDT05GSUdfQVJNX0RNQV9VU0VfSU9NTVUpCj4+IC0jaW5jbHVkZSA8YXNtL2RtYS1pb21tdS5o
Pgo+PiAtI2VuZGlmCj4+IC0KPj4gICAjaW5jbHVkZSAidmRlLmgiCj4+ICAgCj4+ICAgaW50IHRl
Z3JhX3ZkZV9pb21tdV9tYXAoc3RydWN0IHRlZ3JhX3ZkZSAqdmRlLAo+PiBAQCAtNzAsMTQgKzY2
LDYgQEAgaW50IHRlZ3JhX3ZkZV9pb21tdV9pbml0KHN0cnVjdCB0ZWdyYV92ZGUgKnZkZSkKPj4g
ICAJaWYgKCF2ZGUtPmdyb3VwKQo+PiAgIAkJcmV0dXJuIDA7Cj4+ICAgCj4+IC0jaWYgSVNfRU5B
QkxFRChDT05GSUdfQVJNX0RNQV9VU0VfSU9NTVUpCj4+IC0JaWYgKGRldi0+YXJjaGRhdGEubWFw
cGluZykgewo+PiAtCQlzdHJ1Y3QgZG1hX2lvbW11X21hcHBpbmcgKm1hcHBpbmcgPSB0b19kbWFf
aW9tbXVfbWFwcGluZyhkZXYpOwo+PiAtCj4+IC0JCWFybV9pb21tdV9kZXRhY2hfZGV2aWNlKGRl
dik7Cj4+IC0JCWFybV9pb21tdV9yZWxlYXNlX21hcHBpbmcobWFwcGluZyk7Cj4+IC0JfQo+PiAt
I2VuZGlmCj4+ICAgCXZkZS0+ZG9tYWluID0gaW9tbXVfZG9tYWluX2FsbG9jKCZwbGF0Zm9ybV9i
dXNfdHlwZSk7Cj4+ICAgCWlmICghdmRlLT5kb21haW4pIHsKPj4gICAJCWVyciA9IC1FTk9NRU07
Cj4+Cj4gCj4gSGVsbG8sIFJvYmluISBUaGFuayB5b3UgZm9yIHlvdXJzIHdvcmshCj4gCj4gU29t
ZSBkcml2ZXJzLCBsaWtlIHRoaXMgVGVncmEgVkRFIChWaWRlbyBEZWNvZGVyIEVuZ2luZSkgZHJp
dmVyIGZvcgo+IGV4YW1wbGUsIGRvIG5vdCB3YW50IHRvIHVzZSBpbXBsaWNpdCBJT01NVSBkb21h
aW4uCgpUaGF0IGlzbid0IChpbnRlbnRpb25hbGx5KSBjaGFuZ2luZyBoZXJlIC0gdGhlIG9ubHkg
ZGlmZmVyZW5jZSBzaG91bGQgYmUgCnRoYXQgaW5zdGVhZCBvZiBoYXZpbmcgdGhlIEFSTS1zcGVj
aWFsIGltcGxpY2l0IGRvbWFpbiwgd2hpY2ggeW91IGhhdmUgCnRvIGtpY2sgb3V0IG9mIHRoZSB3
YXkgd2l0aCB0aGUgQVJNLXNwZWNpZmljIEFQSSBiZWZvcmUgeW91J3JlIGFibGUgdG8gCmF0dGFj
aCB5b3VyIG93biBkb21haW4sIHRoZSBpbXBsaWNpdCBkb21haW4gaXMgbm93IGEgcHJvcGVyIElP
TU1VIEFQSSAKZGVmYXVsdCBkb21haW4sIHdoaWNoIGF1dG9tYXRpY2FsbHkgZ2V0cyBidW1wZWQg
YnkgeW91ciBhdHRhY2guIFRoZSAKZGVmYXVsdCBkb21haW5zIHNob3VsZCBzdGlsbCBvbmx5IGJl
IGNyZWF0ZWQgaW4gdGhlIHNhbWUgY2FzZXMgdGhhdCB0aGUgCkFSTSBkbWFfaW9tbXVfbWFwcGlu
Z3Mgd2VyZS4KCj4gVGVncmEgVkRFIGRyaXZlcgo+IHJlbGllcyBvbiBleHBsaWNpdCBJT01NVSBk
b21haW4gaW4gYSBjYXNlIG9mIFRlZ3JhIFNNTVUgYmVjYXVzZSBWREUKPiBoYXJkd2FyZSBjYW4n
dCBhY2Nlc3MgbGFzdCBwYWdlIG9mIHRoZSBBUyBhbmQgYmVjYXVzZSBkcml2ZXIgd2FudHMgdG8K
PiByZXNlcnZlIHNvbWUgZml4ZWQgYWRkcmVzc2VzIFsxXS4KPiAKPiBbMV0KPiBodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92NS45LXJjMS9zb3VyY2UvZHJpdmVycy9zdGFnaW5nL21l
ZGlhL3RlZ3JhLXZkZS9pb21tdS5jI0wxMDAKPiAKPiBUZWdyYTMwIFNvQyBzdXBwb3J0cyB1cCB0
byA0IGRvbWFpbnMsIGhlbmNlIGl0J3Mgbm90IHBvc3NpYmxlIHRvIGFmZm9yZAo+IHdhc3Rpbmcg
dW51c2VkIGltcGxpY2l0IGRvbWFpbnMuIEkgdGhpbmsgdGhpcyBuZWVkcyB0byBiZSBhZGRyZXNz
ZWQKPiBiZWZvcmUgdGhpcyBwYXRjaCBjb3VsZCBiZSBhcHBsaWVkLgoKWWVhaCwgdGhlcmUgaXMg
b25lIHN1YnRsZSBjaGFuZ2UgaW4gYmVoYXZpb3VyIGZyb20gcmVtb3ZpbmcgdGhlIEFSTSAKbGF5
ZXIgb24gdG9wIG9mIHRoZSBjb3JlIEFQSSwgaW4gdGhhdCB0aGUgSU9NTVUgZHJpdmVyIHdpbGwg
bm8gbG9uZ2VyIApzZWUgYW4gZXhwbGljaXQgZGV0YWNoIGNhbGwuIFRodXMgaXQgZG9lcyBzdGFu
ZCB0byBiZW5lZml0IGZyb20gYmVpbmcgYSAKYml0IGNsZXZlcmVyIGFib3V0IG5vdGljaW5nIGRl
dmljZXMgYmVpbmcgbW92ZWQgZnJvbSBvbmUgZG9tYWluIHRvIAphbm90aGVyIGJ5IGFuIGF0dGFj
aCBjYWxsLCBlaXRoZXIgYnkgcmVsZWFzaW5nIHRoZSBoYXJkd2FyZSBjb250ZXh0IGZvciAKdGhl
IGluYWN0aXZlIGRvbWFpbiBvbmNlIHRoZSBkZXZpY2UocykgYXJlIG1vdmVkIGFjcm9zcyB0byB0
aGUgbmV3IG9uZSwgCm9yIGJ5IHNpbXBseSByZXByb2dyYW1taW5nIHRoZSBoYXJkd2FyZSBjb250
ZXh0IGluLXBsYWNlIGZvciB0aGUgbmV3IApkb21haW4ncyBhZGRyZXNzIHNwYWNlIHdpdGhvdXQg
YWxsb2NhdGluZyBhIG5ldyBvbmUgYXQgYWxsIChtb3N0IG9mIHRoZSAKZHJpdmVycyB0aGF0IGRv
bid0IGhhdmUgbXVsdGlwbGUgY29udGV4dHMgYWxyZWFkeSBoYW5kbGUgdGhlIGxhdHRlciAKYXBw
cm9hY2ggcXVpdGUgd2VsbCkuCgo+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIGZvciBJT01NVSBkcml2
ZXJzIHRvIGdhaW4gc3VwcG9ydCBmb3IgZmlsdGVyaW5nIG91dAo+IGRldmljZXMgaW4gaW9tbXVf
ZG9tYWluX2FsbG9jKGRldiwgdHlwZSk/IFRoZW4gcGVyaGFwcyBUZWdyYSBTTU1VIGRyaXZlcgo+
IGNvdWxkIHNpbXBseSByZXR1cm4gTlVMTCBpbiBhIGNhc2Ugb2YgdHlwZT1JT01NVV9ET01BSU5f
RE1BIGFuZAo+IGRldj10ZWdyYS12ZGUuCgpJZiB5b3UgY2FuIGltcGxlbWVudCBJT01NVV9ET01B
SU5fSURFTlRJVFkgYnkgYWxsb3dpbmcgdGhlIHJlbGV2YW50IApkZXZpY2VzIHRvIGJ5cGFzcyB0
cmFuc2xhdGlvbiBlbnRpcmVseSB3aXRob3V0IG5lZWRpbmcgYSBoYXJkd2FyZSAKY29udGV4dCAo
b3IgYXQgd29yc3QsIGNhbiBzcGFyZSBvbmUgY29udGV4dCB3aGljaCBhbGwgaWRlbnRpdHktbWFw
cGVkIApsb2dpY2FsIGRvbWFpbnMgY2FuIHNoYXJlKSwgdGhlbiB5b3UgY291bGQgY2VydGFpbmx5
IGRvIHRoYXQga2luZCBvZiAKZmlsdGVyaW5nIHdpdGggdGhlIC5kZWZfZG9tYWluX3R5cGUgY2Fs
bGJhY2sgaWYgeW91IHJlYWxseSB3YW50ZWQgdG8uIEFzIAphYm92ZSwgdGhlIGludGVudCBpcyB0
aGF0IHRoYXQgc2hvdWxkbid0IGJlIG5lY2Vzc2FyeSBmb3IgdGhpcyAKcGFydGljdWxhciBjYXNl
LCBzaW5jZSBvbmx5IG9uZSBvZiBhIGdyb3VwJ3MgZGVmYXVsdCBkb21haW4gYW5kIApleHBsaWNp
dGx5IGF0dGFjaGVkIGRvbWFpbiBjYW4gYmUgbGl2ZSBhdCBhbnkgZ2l2ZW4gdGltZSwgc28gdGhl
IGRyaXZlciAKc2hvdWxkIGJlIGFibGUgdG8gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhhdC4KCklmIHlv
dSBzaW1wbHkgaGF2ZSBtb3JlIGFjdGl2ZSBkZXZpY2VzIChncm91cHMpIHRoYW4gYXZhaWxhYmxl
IGNvbnRleHRzIAp0aGVuIHllcywgeW91IHByb2JhYmx5IHdvdWxkIHdhbnQgdG8gZG8gc29tZSBm
aWx0ZXJpbmcgdG8gZGVjaWRlIHdobyAKZGVzZXJ2ZXMgYSB0cmFuc2xhdGlvbiBkb21haW4gYW5k
IHdobyBkb2Vzbid0LCBidXQgaW4gdGhhdCBjYXNlIHlvdSAKc2hvdWxkIGFscmVhZHkgaGF2ZSBo
YWQgYSBsb25nLXN0YW5kaW5nIHByb2JsZW0gd2l0aCB0aGUgQVJNIGltcGxpY2l0IApkb21haW5z
LgoKPiBBbHRlcm5hdGl2ZWx5LCB0aGUgVGVncmEgU01NVSBjb3VsZCBiZSBjaGFuZ2VkIHN1Y2gg
dGhhdCB0aGUgZGV2aWNlcwo+IHdpbGwgYmUgYXR0YWNoZWQgdG8gYSBkb21haW4gYXQgdGhlIHRp
bWUgb2YgYSBmaXJzdCBJT01NVSBtYXBwaW5nCj4gaW52b2NhdGlvbiBpbnN0ZWFkIG9mIGF0dGFj
aGluZyBhdCB0aGUgdGltZSBvZiBhdHRhY2hfZGV2KCkgY2FsbGJhY2sKPiBpbnZvY2F0aW9uLgo+
IAo+IE9yIG1heWJlIGV2ZW4gSU9NTVUgY29yZSBjb3VsZCBiZSBjaGFuZ2VkIHRvIGF0dGFjaCBk
ZXZpY2VzIGF0IHRoZSB0aW1lCj4gb2YgdGhlIGZpcnN0IElPTU1VIG1hcHBpbmcgaW52b2NhdGlv
bj8gVGhpcyBjb3VsZCBiZSBhIHVuaXZlcnNhbAo+IHNvbHV0aW9uIGZvciBhbGwgZHJpdmVycy4K
Ckkgc3VwcG9zZSB0ZWNobmljYWxseSB5b3UgY291bGQgZG8gdGhhdCB3aXRoaW4gYW4gSU9NTVUg
ZHJpdmVyIGFscmVhZHkgCihzaW1pbGFyIHRvIGhvdyBzb21lIGRlZmVyIG1vc3Qgb2Ygc2V0dXAg
dGhhdCBsb2dpY2FsbHkgYmVsb25ncyB0byAKLT5kb21haW5fYWxsb2MgdW50aWwgdGhlIGZpcnN0
IC0+YXR0YWNoX2RldikuIEl0J3MgYSBiaXQgZ3JpbSBmcm9tIHRoZSAKY2FsbGVyJ3MgUG9WIHRo
b3VnaCwgaW4gdGVybXMgb2YgdGhlIGZhaWx1cmUgbW9kZSBiZWluZyBub24tb2J2aW91cyBhbmQg
CmhhdmluZyBubyByZWFsIHdheSB0byByZWNvdmVyLiBBZ2FpbiwgeW91J2QgYmUgYmV0dGVyIG9m
ZiBzaW1wbHkgbWFraW5nIApkZWNpc2lvbnMgdXAtZnJvbnQgYXQgZG9tYWluX2FsbG9jIG9yIGF0
dGFjaCB0aW1lIGJhc2VkIG9uIHRoZSBkb21haW4gdHlwZS4KClJvYmluLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
