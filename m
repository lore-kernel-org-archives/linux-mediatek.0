Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0512ECCA481
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 10:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aumqgaFWmzSmnTOjWSZZPUCCR5WLD62MZdp/i+2+Nvg=; b=QiIVvo3KNVRlS5spEK2ExDfHKW
	YKctx/JFlfGAtNARqBWAYPsKVJs9ZqFZCi1NX3yPy62dVRi2RRHwy+RnRveY6z+jrQriTBS7VE0wu
	DSfTqnFvPBbQhWJMdaDAwhqycHxy6mi9xHxM5LbPLSKtrhFU+RaLt9bwNIJVVw1RBE6FLrRAF+fpX
	9uO3aF7fMrswD1lELAADjH8ncy/uFvbPrc301GVTl0Mc8XauFxAnNmHFzZ191WY9G4vyAComokjXC
	DLPauY1jOdQ0tArbJK8fTXyY+66kUZ3+HO/GNDKXmG+2uH0I+qcDjuMsrB7Xucwbq2/VADLE9amC6
	i89IxkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6r1r-00GR7y-Qq; Thu, 30 Jun 2022 10:04:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6r1o-00GR2g-Fn; Thu, 30 Jun 2022 10:04:05 +0000
X-UUID: 4212045d467040a3a6298ce3f34dac98-20220630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=aumqgaFWmzSmnTOjWSZZPUCCR5WLD62MZdp/i+2+Nvg=;
	b=kbMXo9WsIEDQNGJG458kLjiMlyPqNzAR5/yTHebzQbahW9gfw1ohNRMxxMxH/p59jao5rsPTDRGXeZQeGZHQBMDk8J13mDRxWI4XEzsYRJdifjyMDp7c0Z38dXND8PLb0qsSuchn3I3p+stzHw1Fsc4tSD/8jsDQdxEy7pBNods=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:f6406df5-bf1c-4196-bbf4-469c93ad16c6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:c6233186-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 4212045d467040a3a6298ce3f34dac98-20220630
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 351428045; Thu, 30 Jun 2022 03:03:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 30 Jun 2022 17:33:18 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jun 2022 17:33:16 +0800
Message-ID: <63969062a55b1c520f276b9a4b5f79faa12da20b.camel@mediatek.com>
Subject: Re: [PATCH v3 1/5] iommu: Return -EMEDIUMTYPE for incompatible
 domain and device/group
From: Yong Wu <yong.wu@mediatek.com>
To: Nicolin Chen <nicolinc@nvidia.com>
CC: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Baolu Lu <baolu.lu@linux.intel.com>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"jordan@cosmicpenguin.net" <jordan@cosmicpenguin.net>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "will@kernel.org"
	<will@kernel.org>, "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "yangyingliang@huawei.com"
	<yangyingliang@huawei.com>, "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
	"gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>, "marcan@marcan.st" <marcan@marcan.st>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>
Date: Thu, 30 Jun 2022 17:33:16 +0800
In-Reply-To: <YrysUpY4mdzA0h76@Asurada-Nvidia>
References: <20220623200029.26007-1-nicolinc@nvidia.com>
	 <20220623200029.26007-2-nicolinc@nvidia.com>
	 <270eec00-8aee-2288-4069-d604e6da2925@linux.intel.com>
	 <YrUk8IINqDEZLfIa@Asurada-Nvidia>
	 <8a5e9c81ab1487154828af3ca21e62e39bcce18c.camel@mediatek.com>
	 <BN9PR11MB527629DEF740C909A7B7BEB38CB49@BN9PR11MB5276.namprd11.prod.outlook.com>
	 <19cfb1b85a347c70c6b0937bbbca4a176a724454.camel@mediatek.com>
	 <20220624181943.GV4147@nvidia.com> <YrysUpY4mdzA0h76@Asurada-Nvidia>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_030404_588129_97D5241D 
X-CRM114-Status: GOOD (  21.55  )
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

T24gV2VkLCAyMDIyLTA2LTI5IGF0IDEyOjQ3IC0wNzAwLCBOaWNvbGluIENoZW4gd3JvdGU6DQo+
IE9uIEZyaSwgSnVuIDI0LCAyMDIyIGF0IDAzOjE5OjQzUE0gLTAzMDAsIEphc29uIEd1bnRob3Jw
ZSB3cm90ZToNCj4gPiBPbiBGcmksIEp1biAyNCwgMjAyMiBhdCAwNjozNTo0OVBNICswODAwLCBZ
b25nIFd1IHdyb3RlOg0KPiA+IA0KPiA+ID4gPiA+IEl0J3Mgbm90IHVzZWQgaW4gVkZJTyBjb250
ZXh0LiAicmV0dXJuIDAiIGp1c3Qgc2F0aXNmeSB0aGUNCj4gPiA+ID4gPiBpb21tdQ0KPiA+ID4g
PiA+IGZyYW1ld29yayB0byBnbyBhaGVhZC4gYW5kIHllcywgaGVyZSB3ZSBvbmx5IGFsbG93IHRo
ZSBzaGFyZWQNCj4gPiA+ID4gPiAibWFwcGluZy1kb21haW4iIChBbGwgdGhlIGRldmljZXMgc2hh
cmUgYSBkb21haW4gY3JlYXRlZA0KPiA+ID4gPiA+IGludGVybmFsbHkpLg0KPiA+IA0KPiA+IFdo
YXQgcGFydCBvZiB0aGUgaW9tbXUgZnJhbWV3b3JrIGlzIHRyeWluZyB0byBhdHRhY2ggYSBkb21h
aW4gYW5kDQo+ID4gd2FudHMgdG8gc2VlIHN1Y2Nlc3Mgd2hlbiB0aGUgZG9tYWluIHdhcyBub3Qg
YWN0dWFsbHkgYXR0YWNoZWQgPw0KPiA+IA0KPiA+ID4gPiBXaGF0IHByZXZlbnQgdGhpcyBkcml2
ZXIgZnJvbSBiZWluZyB1c2VkIGluIFZGSU8gY29udGV4dD8NCj4gPiA+IA0KPiA+ID4gTm90aGlu
ZyBwcmV2ZW50IHRoaXMuIEp1c3QgSSBkaWRuJ3QgdGVzdC4NCj4gPiANCj4gPiBUaGlzIGlzIHdo
eSBpdCBpcyB3cm9uZyB0byByZXR1cm4gc3VjY2VzcyBoZXJlLg0KPiANCj4gSGkgWW9uZywgd291
bGQgeW91IG9yIHNvbWVvbmUgeW91IGtub3cgYmUgYWJsZSB0byBjb25maXJtIHdoZXRoZXINCj4g
dGhpcyAicmV0dXJuIDAiIGlzIHN0aWxsIGEgbXVzdCBvciBub3Q/DQo+IA0KPiBDb25zaWRlcmlu
ZyB0aGF0IGl0J3MgYW4gb2xkIDMyLWJpdCBwbGF0Zm9ybSBmb3IgTVRLLCBpZiBpdCB3b3VsZA0K
PiB0YWtlIHRpbWUgdG8gZG8gc28sIEknZCBsaWtlIHRvIGRyb3AgdGhlIGNoYW5nZSBpbiBNVEsg
ZHJpdmVyIGFuZA0KPiBub3RlIGluIGNvbW1pdCBsb2cgZm9yIHlvdSBvciBvdGhlciBNVEsgZm9s
a3MgdG8gY2hhbmdlIGluIGZ1dHVyZS4NCg0KWWVzLiBQbGVhc2UgaGVscCBkcm9wIHRoZSBjaGFu
Z2UgaW4gdGhpcyBmaWxlLg0KDQpTb3JyeSBJIGRvbid0IGhhdmUgdGhlIGJvYXJkIGF0IGhhbmQg
cmlnaHQgbm93IGFuZCBJIGNvdWxkIG5vdCBsaXN0IHRoZQ0KYmFja3RyYWNlIHdoZXJlIHRoaXMg
aXMgbmVlZGVkKHNob3VsZCBiZSBidXNfaW9tbXVfcHJvYmUgZnJvbSB0aGUNCnByZXZpb3VzIGRl
YnVnLi4uKQ0KDQo+IA0KPiBUaGFua3MNCj4gTmljDQo=


