Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36682C04A95
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 06:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Am7HvXIEbsXbvCkz0km530yuMig12Qdz6tk1BNc3Ag=; b=oaFaelCes9WTiv/JhN8mYB3Njv
	4c227BDvJKtMW+2xsXAG6m9AdgSrf3kx0Pu8peTlG8qc5oYnY0Qsv/AXg1L65oix6nP91XpdbNW9T
	YjeqSL77YCBVZALq813S0+a5XvGrSxXfu4V0pJsnC1R9F7hsSlRgp2AxW/uAq5hxRT6au9PAvTAE+
	ZPwIZz8tD4oU3AEOfgt91ldqzdSPe81Wb+8+qQpybPzTmo50xawrJ8ebVJgPX7MLbTO5ixxcxxk0A
	JpRCSZnZznX70AQ2dsF4sODCnBuyXDQgUml6KyXw7+zyYHmzIVO9ellxE2bfSUIM0csIPuxG4JQi2
	4zKo51kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odmv8-001Nmq-WD; Thu, 29 Sep 2022 06:21:19 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odmv5-001NkM-NX
	for linux-mediatek@lists.infradead.org; Thu, 29 Sep 2022 06:21:17 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MdNRp3W4NzlXSP;
	Thu, 29 Sep 2022 14:16:54 +0800 (CST)
Received: from kwepemm000014.china.huawei.com (7.193.23.6) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 14:21:11 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm000014.china.huawei.com (7.193.23.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 14:21:11 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Thu, 29 Sep 2022 14:21:11 +0800
From: zhangqilong <zhangqilong3@huawei.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIC1uZXh0IDIvNF0gQVNvQzogd201MTEwOiBGaXggUE0g?=
 =?gb2312?Q?disable_depth_imbalance_in_wm5110=5Fprobe?=
Thread-Topic: [PATCH -next 2/4] ASoC: wm5110: Fix PM disable depth imbalance
 in wm5110_probe
Thread-Index: AQHY01Rgfxw6qa+Xf0GLkXgZfKuFlK317ppw
Date: Thu, 29 Sep 2022 06:21:11 +0000
Message-ID: <2292588245f94d7095029ff448b95988@huawei.com>
References: <20220928160116.125020-1-zhangqilong3@huawei.com>
 <20220928160116.125020-3-zhangqilong3@huawei.com>
 <YzRxHjYeWvZF6eLW@sirena.org.uk>
In-Reply-To: <YzRxHjYeWvZF6eLW@sirena.org.uk>
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
X-CRM114-CacheID: sfid-20220928_232115_969928_CA4388D9 
X-CRM114-Status: GOOD (  12.26  )
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

PiBPbiBUaHUsIFNlcCAyOSwgMjAyMiBhdCAxMjowMToxNEFNICswODAwLCBaaGFuZyBRaWxvbmcg
d3JvdGU6DQo+ID4gVGhlIHBtX3J1bnRpbWVfZW5hYmxlIHdpbGwgaW5jcmVhc2UgcG93ZXIgZGlz
YWJsZSBkZXB0aC4gVGh1cyBhDQo+ID4gcGFpcmluZyBkZWNyZW1lbnQgaXMgbmVlZGVkIG9uIHRo
ZSBlcnJvciBoYW5kbGluZyBwYXRoIHRvIGtlZXAgaXQNCj4gPiBiYWxhbmNlZCBhY2NvcmRpbmcg
dG8gY29udGV4dC4gV2UgZml4IGl0IGJ5IG1vdmluZyBwbV9ydW50aW1lX2VuYWJsZQ0KPiA+IHRv
IHRoZSBlbmRkaW5nIG9mIHdtNTExMF9wcm9iZS4NCj4gDQo+IEFzIGRvY3VtZW50ZWQgaW4gc3Vi
bWl0dGluZy1wYXRjaGVzLnJzdCBwbGVhc2Ugc2VuZCBwYXRjaGVzIHRvIHRoZQ0KPiBtYWludGFp
bmVycyBmb3IgdGhlIGNvZGUgeW91IHdvdWxkIGxpa2UgdG8gY2hhbmdlLiAgVGhlIG5vcm1hbCBr
ZXJuZWwNCj4gd29ya2Zsb3cgaXMgdGhhdCBwZW9wbGUgYXBwbHkgcGF0Y2hlcyBmcm9tIHRoZWly
IGluYm94ZXMsIGlmIHRoZXkgYXJlbid0DQo+IGNvcGllZCB0aGV5IGFyZSBsaWtlbHkgdG8gbm90
IHNlZSB0aGUgcGF0Y2ggYXQgYWxsIGFuZCBpdCBpcyBtdWNoIG1vcmUNCj4gZGlmZmljdWx0IHRv
IGFwcGx5IHBhdGNoZXMuDQoNCk9LLCBpdCBzZWVtcyB0d28gbWFpbnRhaW5lcnMgb2YgdGhlIGNv
ZGUgaW4gdGhlIDFzdCBhbmQgNHRoIHBhdGNoZXMsIEkgd2lsbCByZXNlbmQgYQ0KYSBuZXcgcGF0
Y2ggc2V0IGluIHYyLiBUaGFua3MgZm9yIHlvdXIgbWluZCB0aXAhDQoNClRoYW5rcywNClpIQU5H
DQo=

