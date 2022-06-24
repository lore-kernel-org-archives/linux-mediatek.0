Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0273FC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 05:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdVipdiWBd+Z9DOtHVXmI/fn4Mj+LbqmJlWncRaZEH4=; b=4d5p9/vQaqkzNmU8AOUYng7gNC
	9pxNVJFR6OudqCLzuekOPdc1CBmIT0YOHnJURo6YRTjp2iGXDsVA5O94UJwjEq1LLmKW5Co8Vubm2
	4rcm/j9iRvK7R4GbbMfB+wLXze52b37BAiTrIpQh86eX+tlfuBFMZtTNzc8fSaqqIeVaPKO/T4Z0g
	CtH5VALFcBmXPYTUoYn9I37cULNlDpyPMuFg2ryrjAh9T6hYirNYEM/S/6tFT+PyQ9tzAzf7EZsmh
	nZ8yyWXPEYislbbdBppjillD/kt/OM4BWidiDSl5ZG+zyaCUO3akSGyfC8q1YJbF9n3/knqvU8ahb
	pbMeR2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4c2v-000fxF-4k; Fri, 24 Jun 2022 05:39:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4c2C-000ffd-6y; Fri, 24 Jun 2022 05:39:13 +0000
X-UUID: 75765a9b001b46889ba13663dd846426-20220623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=kdVipdiWBd+Z9DOtHVXmI/fn4Mj+LbqmJlWncRaZEH4=;
	b=gUOvIPz5lZh5OAxV813gOt2tJnafJladAwbD6kc7U6tLAc1Hl2OI292MRaAdLHBwysBL7s16SqbTwYksl7cYbpqA9wFoL+zV7azFq3ZI0NZKBZAO3+hGzZBQrkK6qnyAoAbp4l6SYMkt188YufkNaDFtJUyCQ5zznCu139nGbq0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:ed8d98ba-f4ff-42c4-8288-c6848d53f692,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:5a8365ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 75765a9b001b46889ba13663dd846426-20220623
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1209477585; Thu, 23 Jun 2022 22:39:03 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jun 2022 22:39:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 13:39:00 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Jun 2022 13:38:58 +0800
Message-ID: <8a5e9c81ab1487154828af3ca21e62e39bcce18c.camel@mediatek.com>
Subject: Re: [PATCH v3 1/5] iommu: Return -EMEDIUMTYPE for incompatible
 domain and device/group
From: Yong Wu <yong.wu@mediatek.com>
To: Nicolin Chen <nicolinc@nvidia.com>, Baolu Lu <baolu.lu@linux.intel.com>
CC: <joro@8bytes.org>, <will@kernel.org>, <marcan@marcan.st>,
	<sven@svenpeter.dev>, <robin.murphy@arm.com>, <robdclark@gmail.com>,
	<matthias.bgg@gmail.com>, <orsonzhai@gmail.com>, <baolin.wang7@gmail.com>,
	<zhang.lyra@gmail.com>, <jean-philippe@linaro.org>,
	<alex.williamson@redhat.com>, <jgg@nvidia.com>, <kevin.tian@intel.com>,
	<suravee.suthikulpanit@amd.com>, <alyssa@rosenzweig.io>,
	<dwmw2@infradead.org>, <mjrosato@linux.ibm.com>,
	<gerald.schaefer@linux.ibm.com>, <thierry.reding@gmail.com>,
	<vdumpa@nvidia.com>, <jonathanh@nvidia.com>, <cohuck@redhat.com>,
	<thunder.leizhen@huawei.com>, <tglx@linutronix.de>,
	<chenxiang66@hisilicon.com>, <christophe.jaillet@wanadoo.fr>,
	<john.garry@huawei.com>, <yangyingliang@huawei.com>,
	<jordan@cosmicpenguin.net>, <iommu@lists.linux-foundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<virtualization@lists.linux-foundation.org>, <kvm@vger.kernel.org>
Date: Fri, 24 Jun 2022 13:38:58 +0800
In-Reply-To: <YrUk8IINqDEZLfIa@Asurada-Nvidia>
References: <20220623200029.26007-1-nicolinc@nvidia.com>
	 <20220623200029.26007-2-nicolinc@nvidia.com>
	 <270eec00-8aee-2288-4069-d604e6da2925@linux.intel.com>
	 <YrUk8IINqDEZLfIa@Asurada-Nvidia>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_223912_348166_9CE68A39 
X-CRM114-Status: GOOD (  28.06  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIyLTA2LTIzIGF0IDE5OjQ0IC0wNzAwLCBOaWNvbGluIENoZW4gd3JvdGU6DQo+
IE9uIEZyaSwgSnVuIDI0LCAyMDIyIGF0IDA5OjM1OjQ5QU0gKzA4MDAsIEJhb2x1IEx1IHdyb3Rl
Og0KPiA+IEV4dGVybmFsIGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFj
aG1lbnRzDQo+ID4gDQo+ID4gDQo+ID4gT24gMjAyMi82LzI0IDA0OjAwLCBOaWNvbGluIENoZW4g
d3JvdGU6DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9tdGtfaW9tbXVfdjEuYw0K
PiA+ID4gYi9kcml2ZXJzL2lvbW11L210a19pb21tdV92MS5jDQo+ID4gPiBpbmRleCBlMWNiNTFi
OTg2NmMuLjUzODZkODg5NDI5ZCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvaW9tbXUvbXRr
X2lvbW11X3YxLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvbXRrX2lvbW11X3YxLmMNCj4g
PiA+IEBAIC0zMDQsNyArMzA0LDcgQEAgc3RhdGljIGludCBtdGtfaW9tbXVfdjFfYXR0YWNoX2Rl
dmljZShzdHJ1Y3QNCj4gPiA+IGlvbW11X2RvbWFpbiAqZG9tYWluLCBzdHJ1Y3QgZGV2aWNlDQo+
ID4gPiAgICAgICAvKiBPbmx5IGFsbG93IHRoZSBkb21haW4gY3JlYXRlZCBpbnRlcm5hbGx5LiAq
Lw0KPiA+ID4gICAgICAgbXRrX21hcHBpbmcgPSBkYXRhLT5tYXBwaW5nOw0KPiA+ID4gICAgICAg
aWYgKG10a19tYXBwaW5nLT5kb21haW4gIT0gZG9tYWluKQ0KPiA+ID4gLSAgICAgICAgICAgICBy
ZXR1cm4gMDsNCj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTUVESVVNVFlQRTsNCj4gPiA+
IA0KPiA+ID4gICAgICAgaWYgKCFkYXRhLT5tNHVfZG9tKSB7DQo+ID4gPiAgICAgICAgICAgICAg
IGRhdGEtPm00dV9kb20gPSBkb207DQo+ID4gDQo+ID4gVGhpcyBjaGFuZ2UgbG9va3Mgb2RkLiBJ
dCB0dXJucyB0aGUgcmV0dXJuIHZhbHVlIGZyb20gc3VjY2VzcyB0bw0KPiA+IGZhaWx1cmUuIElz
IGl0IGEgYnVnPyBJZiBzbywgaXQgc2hvdWxkIGdvIHRocm91Z2ggYSBzZXBhcmF0ZWQgZml4DQo+
ID4gcGF0Y2guDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldzopDQoNCj4gDQo+IE1ha2VzIHNlbnNl
Lg0KPiANCj4gSSByZWFkIHRoZSBjb21taXQgbG9nIG9mIHRoZSBvcmlnaW5hbCBjaGFuZ2U6DQo+
IA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xNTg5NTMwMTIzLTMwMjQwLTEtZ2l0LXNlbmQt
ZW1haWwteW9uZy53dUBtZWRpYXRlay5jb20NCj4gDQo+IEl0IGRvZXNuJ3Qgc2VlbSB0byBhbGxv
dyBkZXZpY2VzIHRvIGdldCBhdHRhY2hlZCB0byBkaWZmZXJlbnQNCj4gZG9tYWlucyBvdGhlciB0
aGFuIHRoZSBzaGFyZWQgbWFwcGluZy0+ZG9tYWluLCBjcmVhdGVkIGluIHRoZQ0KPiBpbiB0aGUg
bXRrX2lvbW11X3Byb2JlX2RldmljZSgpLiBTbyBpdCBsb29rcyBsaWtlIHJldHVybmluZyAwDQo+
IGlzIGludGVudGlvbmFsLiBUaG91Z2ggSSBhbSBzdGlsbCB2ZXJ5IGNvbmZ1c2VkIGJ5IHRoaXMg
cmV0dXJuDQo+IHZhbHVlIGhlcmUsIEkgZG91YnQgaXQgaGFzIGV2ZXIgYmVlbiB1c2VkIGluIGEg
VkZJTyBjb250ZXh0Lg0KDQpJdCdzIG5vdCB1c2VkIGluIFZGSU8gY29udGV4dC4gInJldHVybiAw
IiBqdXN0IHNhdGlzZnkgdGhlIGlvbW11DQpmcmFtZXdvcmsgdG8gZ28gYWhlYWQuIGFuZCB5ZXMs
IGhlcmUgd2Ugb25seSBhbGxvdyB0aGUgc2hhcmVkICJtYXBwaW5nLQ0KPmRvbWFpbiIgKEFsbCB0
aGUgZGV2aWNlcyBzaGFyZSBhIGRvbWFpbiBjcmVhdGVkIGludGVybmFsbHkpLg0KDQp0aHVzIEkg
dGhpbmsgd2Ugc2hvdWxkIHN0aWxsIGtlZXAgInJldHVybiAwIiBoZXJlLg0KDQpUaGFua3M6KQ0K
DQo+IA0KPiBZb3VuZywgd291bGQgeW91IHBsZWFzZSBnaXZlIHVzIHNvbWUgaW5wdXQ/DQo+IA0K
PiBPdmVyYWxsLCBJIGZlZWwgaXQncyBiZXR0ZXIgdG8gcGxheSBpdCBzYWZlIGhlcmUgYnkgZHJv
cHBpbmcNCj4gdGhpcyBwYXJ0LiBJZiB3ZSBsYXRlciBjb25maXJtIHRoZXJlIGlzIGEgbmVlZCB0
byBmaXggaXQsIHdlDQo+IHdpbGwgZG8gdGhhdCBpbiBhIHNlcGFyYXRlIHBhdGNoIGFueXdheS4N
Cj4gDQo+IFRoYW5rcw0KPiBOaWMNCg==


