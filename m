Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98669C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Oct 2022 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ny2skjrEjHUzqka3ZRsWulhEWR3lqNfb0iHtWlxMlog=; b=YYnCVin/NGfWGL6vMY8L2ItSM4
	cQg74wSy4dhW+esVHe8H23C50c+MrvVCFJ7iMB+yXHKvH5CxEijCv3fBTpZPkEqqgoahp74cSdFDW
	IT2u83MZwdxtrqDZ+uPuBWI/WKP7Aeh0RsmVYq78zqUk0qfMMA4XYc3rh/ZHWdhUio+3A39M6lqLH
	6eRfRn3yUDp5DPwsl3rY6CffpAwd5VEZuggkLJOI+9GRnonbyei3jq74qDmXwSlfFdNOa18lNQeKD
	VA5J3BEXhqL0nDhzaTeFC3CYW9iBAlKdRYitx4ja9HGC8KD6GYld4dXT4v7WuG8waWZm2iFOeb90e
	l6CMALow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh9RP-00DCZg-BZ; Sat, 08 Oct 2022 13:00:31 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh9RL-00DCK8-Ci
	for linux-mediatek@lists.infradead.org; Sat, 08 Oct 2022 13:00:29 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ml4vH5XyWzpVlX;
	Sat,  8 Oct 2022 20:56:59 +0800 (CST)
Received: from kwepemm000015.china.huawei.com (7.193.23.180) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 8 Oct 2022 21:00:06 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm000015.china.huawei.com (7.193.23.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 8 Oct 2022 21:00:06 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Sat, 8 Oct 2022 21:00:06 +0800
From: zhangqilong <zhangqilong3@huawei.com>
To: Mark Brown <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>,
	"ckeepax@opensource.wolfsonmicro.com" <ckeepax@opensource.wolfsonmicro.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tiwai@suse.com"
	<tiwai@suse.com>, "jeff_chang@richtek.com" <jeff_chang@richtek.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIC1uZXh0IDAvNF0gRml4IFBNIGRpc2FibGUgZGVwdGgg?=
 =?gb2312?Q?imbalance_in_probe?=
Thread-Topic: [PATCH -next 0/4] Fix PM disable depth imbalance in probe
Thread-Index: AQHY1KaP1PK+aZ4bmkeahdDgBC2Kt64EeAcA
Date: Sat, 8 Oct 2022 13:00:06 +0000
Message-ID: <38a06fe99ff34e1c92184057579ac480@huawei.com>
References: <20220928160116.125020-1-zhangqilong3@huawei.com>
 <166452645819.46391.11087036933729907918.b4-ty@kernel.org>
In-Reply-To: <166452645819.46391.11087036933729907918.b4-ty@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.177.246]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_060027_832940_100333E7 
X-CRM114-Status: GOOD (  18.68  )
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

PiBPbiBUaHUsIDI5IFNlcCAyMDIyIDAwOjAxOjEyICswODAwLCBaaGFuZyBRaWxvbmcgd3JvdGU6
DQo+ID4gVGhlIHBtX3J1bnRpbWVfZW5hYmxlIHdpbGwgaW5jcmVhc2UgcG93ZXIgZGlzYWJsZSBk
ZXB0aC4gVGh1cyBhDQo+ID4gcGFpcmluZyBkZWNyZW1lbnQgaXMgbmVlZGVkIG9uIHRoZSBlcnJv
ciBoYW5kbGluZyBwYXRoIHRvIGtlZXAgaXQNCj4gPiBiYWxhbmNlZCBhY2NvcmRpbmcgdG8gY29u
dGV4dC4gV2UgZml4IGl0IGJ5IG1vdmluZyBwbV9ydW50aW1lX2VuYWJsZQ0KPiA+IHRvIHRoZSBl
bmRkaW5nIG9mIHByb2JlLg0KPiA+DQo+ID4gWmhhbmcgUWlsb25nICg0KToNCj4gPiAgIEFTb0M6
IHdtODk5NzogRml4IFBNIGRpc2FibGUgZGVwdGggaW1iYWxhbmNlIGluIHdtODk5N19wcm9iZQ0K
PiA+ICAgQVNvQzogd201MTEwOiBGaXggUE0gZGlzYWJsZSBkZXB0aCBpbWJhbGFuY2UgaW4gd201
MTEwX3Byb2JlDQo+ID4gICBBU29DOiB3bTUxMDI6IEZpeCBQTSBkaXNhYmxlIGRlcHRoIGltYmFs
YW5jZSBpbiB3bTUxMDJfcHJvYmUNCj4gPiAgIEFTb0M6IG10NjY2MDogRml4IFBNIGRpc2FibGUg
ZGVwdGggaW1iYWxhbmNlIGluIG10NjY2MF9pMmNfcHJvYmUNCj4gPg0KPiA+IFsuLi5dDQo+IA0K
PiBBcHBsaWVkIHRvDQo+IA0KPiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9icm9vbmllL3NvdW5kLmdpdA0KPiBmb3ItbmV4dA0KDQpIaSwgTWFyaw0K
DQpJIGhhdmUganVzdCBmb3VuZCB0aGF0LCB5b3UgaGF2ZSBhcHBsaWVkIHRoZSBvbGQgcGF0Y2gg
c2V0LCB0aGUgbmV3ZXIgcGF0Y2gNCnNldCAodmVyc2lvbiBWMikgdGhhdCByZXZpZXdlZCBieSBD
aGFybGVzIGlzIGFsc28gYmVlbiBhcHBsaWVkLiBJdCB3b3VsZCBiZQ0KYmV0dGVyIHRvIGtlZXAg
dGhlIHBtX3J1bnRpbWUgZW5hYmxlcyBiZWZvcmUgdGhlIElSUSBhbmQgY29tcG9uZW50IHN0dWZm
Lg0KQm90aCBvZiB0aG9zZSBjb3VsZCBzdGFydCB0cmlnZ2VyaW5nIFBNIHJ1bnRpbWUgZXZlbnRz
Lg0KDQpOb3cgaXQgaGF2ZSBlcnJvciBwbV9ydW50aW1lX2Rpc2FibGUgd2hlbiBlcnJvciByZXR1
cm5zIGluIHdtODk5N19wcm9iZSwNCndtNTExMF9wcm9iZSwgYW5kIHdtNTEwMl9wcm9iZS4NCg0K
SSB3aWxsIHJldmVydCB0aGUgb2xkIHRocmVlIHBhdGNoZXMgdG8gZml4IHRoZSBwcm9ibGVtIGFu
ZCByZWJhc2UgdGhlIDR0aCBwYXRjaC4NCg0KVGhhbmtzLA0KWmhhbmcNCg0KPiANCj4gVGhhbmtz
IQ0KPiANCj4gWzEvNF0gQVNvQzogd204OTk3OiBGaXggUE0gZGlzYWJsZSBkZXB0aCBpbWJhbGFu
Y2UgaW4gd204OTk3X3Byb2JlDQo+ICAgICAgIGNvbW1pdDogNDFhNzM2YWMyMDYwMmY2NDc3M2U4
MGYwZjViMzJjZGUxODMwYTQ0YQ0KPiBbMi80XSBBU29DOiB3bTUxMTA6IEZpeCBQTSBkaXNhYmxl
IGRlcHRoIGltYmFsYW5jZSBpbiB3bTUxMTBfcHJvYmUNCj4gICAgICAgY29tbWl0OiA4NmI0NmJm
MWZlYjgzODk4ZDg5YTJiNGE4ZDA4ZDIxZTllYTI3N2E3DQo+IFszLzRdIEFTb0M6IHdtNTEwMjog
Rml4IFBNIGRpc2FibGUgZGVwdGggaW1iYWxhbmNlIGluIHdtNTEwMl9wcm9iZQ0KPiAgICAgICBj
b21taXQ6IGZjYmI2MDgyMGNkMzAwOGJiNDQzMzRhMDM5NWU1ZTU3Y2NiNzczMjkNCj4gWzQvNF0g
QVNvQzogbXQ2NjYwOiBGaXggUE0gZGlzYWJsZSBkZXB0aCBpbWJhbGFuY2UgaW4NCj4gbXQ2NjYw
X2kyY19wcm9iZQ0KPiAgICAgICBjb21taXQ6IGI3M2YxMWU4OTVlMTQwNTM3ZTdmOGM3MjUxMjEx
Y2NkM2NlMDc4MmINCj4gDQo+IEFsbCBiZWluZyB3ZWxsIHRoaXMgbWVhbnMgdGhhdCBpdCB3aWxs
IGJlIGludGVncmF0ZWQgaW50byB0aGUgbGludXgtbmV4dCB0cmVlDQo+ICh1c3VhbGx5IHNvbWV0
aW1lIGluIHRoZSBuZXh0IDI0IGhvdXJzKSBhbmQgc2VudCB0byBMaW51cyBkdXJpbmcgdGhlIG5l
eHQNCj4gbWVyZ2Ugd2luZG93IChvciBzb29uZXIgaWYgaXQgaXMgYSBidWcgZml4KSwgaG93ZXZl
ciBpZiBwcm9ibGVtcyBhcmUNCj4gZGlzY292ZXJlZCB0aGVuIHRoZSBwYXRjaCBtYXkgYmUgZHJv
cHBlZCBvciByZXZlcnRlZC4NCj4gDQo+IFlvdSBtYXkgZ2V0IGZ1cnRoZXIgZS1tYWlscyByZXN1
bHRpbmcgZnJvbSBhdXRvbWF0ZWQgb3IgbWFudWFsIHRlc3RpbmcNCj4gYW5kIHJldmlldyBvZiB0
aGUgdHJlZSwgcGxlYXNlIGVuZ2FnZSB3aXRoIHBlb3BsZSByZXBvcnRpbmcgcHJvYmxlbXMgYW5k
DQo+IHNlbmQgZm9sbG93dXAgcGF0Y2hlcyBhZGRyZXNzaW5nIGFueSBpc3N1ZXMgdGhhdCBhcmUg
cmVwb3J0ZWQgaWYgbmVlZGVkLg0KPiANCj4gSWYgYW55IHVwZGF0ZXMgYXJlIHJlcXVpcmVkIG9y
IHlvdSBhcmUgc3VibWl0dGluZyBmdXJ0aGVyIGNoYW5nZXMgdGhleQ0KPiBzaG91bGQgYmUgc2Vu
dCBhcyBpbmNyZW1lbnRhbCB1cGRhdGVzIGFnYWluc3QgY3VycmVudCBnaXQsIGV4aXN0aW5nIHBh
dGNoZXMNCj4gd2lsbCBub3QgYmUgcmVwbGFjZWQuDQo+IA0KPiBQbGVhc2UgYWRkIGFueSByZWxl
dmFudCBsaXN0cyBhbmQgbWFpbnRhaW5lcnMgdG8gdGhlIENDcyB3aGVuIHJlcGx5aW5nIHRvDQo+
IHRoaXMgbWFpbC4NCj4gDQo+IFRoYW5rcywNCj4gTWFyaw0K

