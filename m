Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B219C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 18:14:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3FEC2080C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 18:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GUV4MZyh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3FEC2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XhvXyQlOrBMU6pIkpPP0dOSRlTftSyT3QjND7bJTmsk=; b=GUV4MZyhOahwXbfoYQudd8SUZ
	fO/q/MYLgapHUDs4H/vqFYt6RFi/zMqhifo1XmZBL5z/VApJ8QO6JkfSAcaHHKbfX2ZDgZnsx+jTA
	nZ57bs4Ut8o8M1ZHJRoptaTDjB8pE8DYJ6JvkYLMvvVel9PPW39ehG6Rg9yhN6pEW0QA85qoe2pnm
	gCv2J9bJIbzGlUpgMsuZ6/LcrgiPWAZeOPIb6j+q2tzvL0WE6atw+tEHhVJJ2q4cVSqNCgGRivGt7
	5cQ5T5jhIMhhC65Bo8ohqCqdemhtVSUGo+jCUpD/1fw/QUTPiiGMCqfExENjKgK/0GMIvnV0tTtxY
	SBeMtP5Ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAzwa-000165-DY; Wed, 26 Aug 2020 18:14:44 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAzwU-00013k-Q2; Wed, 26 Aug 2020 18:14:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF4DA101E;
 Wed, 26 Aug 2020 11:14:36 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6133E3F71F;
 Wed, 26 Aug 2020 11:14:31 -0700 (PDT)
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
To: Tom Murphy <murphyt7@tcd.ie>, iommu@lists.linux-foundation.org
References: <20191221150402.13868-1-murphyt7@tcd.ie>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <03caf286-09e8-a072-8d3a-b6bcca991516@arm.com>
Date: Wed, 26 Aug 2020 19:14:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20191221150402.13868-1-murphyt7@tcd.ie>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_141438_960143_8A4E6F5B 
X-CRM114-Status: GOOD (  38.04  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgVG9tLAoKT24gMjAxOS0xMi0yMSAxNTowMywgVG9tIE11cnBoeSB3cm90ZToKPiBUaGlzIHBh
dGNoc2V0IGNvbnZlcnRzIHRoZSBpbnRlbCBpb21tdSBkcml2ZXIgdG8gdGhlIGRtYS1pb21tdSBh
cGkuCj4gCj4gV2hpbGUgY29udmVydGluZyB0aGUgZHJpdmVyIEkgZXhwb3NlZCBhIGJ1ZyBpbiB0
aGUgaW50ZWwgaTkxNSBkcml2ZXIgd2hpY2ggY2F1c2VzIGEgaHVnZSBhbW91bnQgb2YgYXJ0aWZh
Y3RzIG9uIHRoZSBzY3JlZW4gb2YgbXkgbGFwdG9wLiBZb3UgY2FuIHNlZSBhIHBpY3R1cmUgb2Yg
aXQgaGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20vcGlwcHkzNjAva2VybmVsUGF0Y2hlcy9ibG9i
L21hc3Rlci9JTUdfMjAxOTEyMTlfMjI1OTIyLmpwZwo+IAo+IFRoaXMgaXNzdWUgaXMgbW9zdCBs
aWtlbHkgaW4gdGhlIGk5MTUgZHJpdmVyIGFuZCBpcyBtb3N0IGxpa2VseSBjYXVzZWQgYnkgdGhl
IGRyaXZlciBub3QgcmVzcGVjdGluZyB0aGUgcmV0dXJuIHZhbHVlIG9mIHRoZSBkbWFfbWFwX29w
czo6bWFwX3NnIGZ1bmN0aW9uLiBZb3UgY2FuIHNlZSB0aGUgZHJpdmVyIGlnbm9yaW5nIHRoZSBy
ZXR1cm4gdmFsdWUgaGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxv
Yi83ZTAxNjViMmYxYTkxMmEwNmUzODFlOTFmMGY0ZTQ5NWY0YWMzNzM2L2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYuYyNMNTEKPiAKPiBQcmV2aW91c2x5IHRoaXMgZGlk
buKAmXQgY2F1c2UgaXNzdWVzIGJlY2F1c2UgdGhlIGludGVsIG1hcF9zZyBhbHdheXMgcmV0dXJu
ZWQgdGhlIHNhbWUgbnVtYmVyIG9mIGVsZW1lbnRzIGFzIHRoZSBpbnB1dCBzY2F0dGVyIGdhdGhl
ciBsaXN0IGJ1dCB3aXRoIHRoZSBjaGFuZ2UgdG8gdGhpcyBkbWEtaW9tbXUgYXBpIHRoaXMgaXMg
bm8gbG9uZ2VyIHRoZSBjYXNlLiBJIHdhc27igJl0IGFibGUgdG8gdHJhY2sgdGhlIGJ1ZyBkb3du
IHRvIGEgc3BlY2lmaWMgbGluZSBvZiBjb2RlIHVuZm9ydHVuYXRlbHkuCj4gCj4gQ291bGQgc29t
ZW9uZSBmcm9tIHRoZSBpbnRlbCB0ZWFtIGxvb2sgYXQgdGhpcz8KPiAKPiAKPiBJIGhhdmUgYmVl
biB0ZXN0aW5nIG9uIGEgbGVub3ZvIHgxIGNhcmJvbiA1dGggZ2VuZXJhdGlvbi4gTGV0IG1lIGtu
b3cgaWYgdGhlcmXigJlzIGFueSBtb3JlIGluZm9ybWF0aW9uIHlvdSBuZWVkLgo+IAo+IFRvIGFs
bG93IG15IHBhdGNoIHNldCB0byBiZSB0ZXN0ZWQgSSBoYXZlIGFkZGVkIGEgcGF0Y2ggKHBhdGNo
IDgvOCkgaW4gdGhpcyBzZXJpZXMgdG8gZGlzYWJsZSBjb21iaW5pbmcgc2cgc2VnbWVudHMgaW4g
dGhlIGRtYS1pb21tdSBhcGkgd2hpY2ggZml4ZXMgdGhlIGJ1ZyBidXQgaXQgZG9lc24ndCBmaXgg
dGhlIGFjdHVhbCBwcm9ibGVtLgo+IAo+IEFzIHBhcnQgb2YgdGhpcyBwYXRjaCBzZXJpZXMgSSBj
b3BpZWQgdGhlIGludGVsIGJvdW5jZSBidWZmZXIgY29kZSB0byB0aGUgZG1hLWlvbW11IHBhdGgu
IFRoZSBhZGRpdGlvbiBvZiB0aGUgYm91bmNlIGJ1ZmZlciBjb2RlIHRvb2sgbWUgYnkgc3VycHJp
c2UuIEkgZGlkIG1vc3Qgb2YgbXkgZGV2ZWxvcG1lbnQgb24gdGhpcyBwYXRjaCBzZXJpZXMgYmVm
b3JlIHRoZSBib3VuY2UgYnVmZmVyIGNvZGUgd2FzIGFkZGVkIGFuZCBteSByZWltcGxlbWVudGF0
aW9uIGluIHRoZSBkbWEtaW9tbXUgcGF0aCBpcyB2ZXJ5IHJ1c2hlZCBhbmQgbm90IHByb3Blcmx5
IHRlc3RlZCBidXQgSeKAmW0gcnVubmluZyBvdXQgb2YgdGltZSB0byB3b3JrIG9uIHRoaXMgcGF0
Y2ggc2V0Lgo+IAo+IE9uIHRvcCBvZiB0aGF0IEkgYWxzbyBkaWRu4oCZdCBwb3J0IG92ZXIgdGhl
IGludGVsIHRyYWNpbmcgY29kZSBmcm9tIHRoaXMgY29tbWl0Ogo+IGh0dHBzOi8vZ2l0aHViLmNv
bS90b3J2YWxkcy9saW51eC9jb21taXQvM2I1MzAzNGMyNjhkNTUwZDllODUyMmU2MTNhMTRhYjUz
Yjg4NDBkOCNkaWZmLTZiM2U3YzQ5OTNmMDVlNzYzMzFlNDYzYWIxZmM4N2UxCj4gU28gYWxsIHRo
ZSB3b3JrIGluIHRoYXQgY29tbWl0IGlzIG5vdyB3YXN0ZWQuIFRoZSBjb2RlIHdpbGwgbmVlZCB0
byBiZSByZW1vdmVkIGFuZCByZWltcGxlbWVudGVkIGluIHRoZSBkbWEtaW9tbXUgcGF0aC4gSSB3
b3VsZCBsaWtlIHRvIHRha2UgdGhlIHRpbWUgdG8gZG8gdGhpcyBidXQgSSByZWFsbHkgZG9u4oCZ
dCBoYXZlIHRoZSB0aW1lIGF0IHRoZSBtb21lbnQgYW5kIEkgd2FudCB0byBnZXQgdGhlc2UgY2hh
bmdlcyBvdXQgYmVmb3JlIHRoZSBpb21tdSBjb2RlIGNoYW5nZXMgYW55IG1vcmUuCgpGdXJ0aGVy
IHRvIHdoYXQgd2UganVzdCBkaXNjdXNzZWQgYXQgTFBDLCBJJ3ZlIHJlYWxpc2VkIHRoYXQgdHJh
Y2Vwb2ludHMgCmFyZSBhY3R1YWxseSBzb21ldGhpbmcgSSBjb3VsZCBkbyB3aXRoICpyaWdodCBu
b3cqIGZvciBkZWJ1Z2dpbmcgbXkgQXJtIApETUEgb3BzIHNlcmllcywgc28gaWYgSSdtIGdvaW5n
IHRvIGhhY2sgc29tZXRoaW5nIHVwIGFueXdheSBJIG1heSBhcyAKd2VsbCB0YWtlIHJlc3BvbnNp
YmlsaXR5IGZvciBwb2xpc2hpbmcgaXQgaW50byBhIHByb3BlciBwYXRjaCBhcyB3ZWxsIDopCgpS
b2Jpbi4KCj4gCj4gVG9tIE11cnBoeSAoOCk6Cj4gICAgaW9tbXUvdnQtZDogY2xlYW4gdXAgMzJi
aXQgc2lfZG9tYWluIGFzc2lnbm1lbnQKPiAgICBpb21tdS92dC1kOiBVc2UgZGVmYXVsdCBkbWFf
ZGlyZWN0XyogbWFwcGluZyBmdW5jdGlvbnMgZm9yIGRpcmVjdAo+ICAgICAgbWFwcGVkIGRldmlj
ZXMKPiAgICBpb21tdS92dC1kOiBSZW1vdmUgSU9WQSBoYW5kbGluZyBjb2RlIGZyb20gbm9uLWRt
YV9vcHMgcGF0aAo+ICAgIGlvbW11OiBIYW5kbGUgZnJlZWxpc3RzIHdoZW4gdXNpbmcgZGVmZXJy
ZWQgZmx1c2hpbmcgaW4gaW9tbXUgZHJpdmVycwo+ICAgIGlvbW11OiBBZGQgaW9tbXVfZG1hX2Zy
ZWVfY3B1X2NhY2hlZF9pb3ZhcyBmdW5jdGlvbgo+ICAgIGlvbW11OiBhbGxvdyB0aGUgZG1hLWlv
bW11IGFwaSB0byB1c2UgYm91bmNlIGJ1ZmZlcnMKPiAgICBpb21tdS92dC1kOiBDb252ZXJ0IGlu
dGVsIGlvbW11IGRyaXZlciB0byB0aGUgaW9tbXUgb3BzCj4gICAgRE8gTk9UIE1FUkdFOiBpb21t
dTogZGlzYWJsZSBsaXN0IGFwcGVuZGluZyBpbiBkbWEtaW9tbXUKPiAKPiAgIGRyaXZlcnMvaW9t
bXUvS2NvbmZpZyAgICAgICAgICAgfCAgIDEgKwo+ICAgZHJpdmVycy9pb21tdS9hbWRfaW9tbXUu
YyAgICAgICB8ICAxNCArLQo+ICAgZHJpdmVycy9pb21tdS9hcm0tc21tdS12My5jICAgICB8ICAg
MyArLQo+ICAgZHJpdmVycy9pb21tdS9hcm0tc21tdS5jICAgICAgICB8ICAgMyArLQo+ICAgZHJp
dmVycy9pb21tdS9kbWEtaW9tbXUuYyAgICAgICB8IDE4MyArKysrKy0tCj4gICBkcml2ZXJzL2lv
bW11L2V4eW5vcy1pb21tdS5jICAgIHwgICAzICstCj4gICBkcml2ZXJzL2lvbW11L2ludGVsLWlv
bW11LmMgICAgIHwgOTM2ICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBkcml2
ZXJzL2lvbW11L2lvbW11LmMgICAgICAgICAgIHwgIDM5ICstCj4gICBkcml2ZXJzL2lvbW11L2lw
bW11LXZtc2EuYyAgICAgIHwgICAzICstCj4gICBkcml2ZXJzL2lvbW11L21zbV9pb21tdS5jICAg
ICAgIHwgICAzICstCj4gICBkcml2ZXJzL2lvbW11L210a19pb21tdS5jICAgICAgIHwgICAzICst
Cj4gICBkcml2ZXJzL2lvbW11L210a19pb21tdV92MS5jICAgIHwgICAzICstCj4gICBkcml2ZXJz
L2lvbW11L29tYXAtaW9tbXUuYyAgICAgIHwgICAzICstCj4gICBkcml2ZXJzL2lvbW11L3Fjb21f
aW9tbXUuYyAgICAgIHwgICAzICstCj4gICBkcml2ZXJzL2lvbW11L3JvY2tjaGlwLWlvbW11LmMg
IHwgICAzICstCj4gICBkcml2ZXJzL2lvbW11L3MzOTAtaW9tbXUuYyAgICAgIHwgICAzICstCj4g
ICBkcml2ZXJzL2lvbW11L3RlZ3JhLWdhcnQuYyAgICAgIHwgICAzICstCj4gICBkcml2ZXJzL2lv
bW11L3RlZ3JhLXNtbXUuYyAgICAgIHwgICAzICstCj4gICBkcml2ZXJzL2lvbW11L3ZpcnRpby1p
b21tdS5jICAgIHwgICAzICstCj4gICBkcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIHwg
ICAyICstCj4gICBpbmNsdWRlL2xpbnV4L2RtYS1pb21tdS5oICAgICAgIHwgICAzICsKPiAgIGlu
Y2x1ZGUvbGludXgvaW50ZWwtaW9tbXUuaCAgICAgfCAgIDEgLQo+ICAgaW5jbHVkZS9saW51eC9p
b21tdS5oICAgICAgICAgICB8ICAzMiArLQo+ICAgMjMgZmlsZXMgY2hhbmdlZCwgMzQ1IGluc2Vy
dGlvbnMoKyksIDkwOCBkZWxldGlvbnMoLSkKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
