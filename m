Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2183DC04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 07:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdFUoi+9dwTdAoNr05T4wwGRWRlE4oQE/6guLP8xzsQ=; b=i7sREfV5euC0OjGAKHs47F94iT
	oodD956KFUdk2z4RN5OobgZiPJHtZV0fhmtXbmWM+cMZbya0HUi7vb9t/CPnkRWQlHlbOL+u9pZ/Z
	NY9HlJk4gy/1v71/TKt+qtpxGZPAAouwv1t9dZLHVy0iIPH/dxB2XuJgrTWPFxOo8kHqwi6Rk/Flm
	gkNRRnSys2cyly5tfYfaN3uvyDmLlekWmk7kTXGSN95qPSZFpL/dLIaEaonSYZvW/KosNDhBy6afL
	xOoG77wdlOFu2RGVmhfjhX1u7SEF2GfLBG+XwoH8O5n5XIpLuiniwKjRR3lDiCPr0v3/cJtZEB6xb
	WFTCGEnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxj5-005LcE-C8; Thu, 28 Jul 2022 07:14:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxj2-005LaF-MH
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 07:14:30 +0000
X-UUID: 96a4e85b01594985a209841b122eb260-20220728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject; bh=AdFUoi+9dwTdAoNr05T4wwGRWRlE4oQE/6guLP8xzsQ=;
	b=puApVpuwx8WlkGpqS1O1NjLsUxMq+qwFsNCIdxJnfH32uESgXHQhmLwFDnGznq4oUVa8w1iQrs37oG0UaFuBeqDobCauYcSVA1ELUVnrCHPUG/j3+GUGrWB7kspZoQVE/2t73ypj+iLBRhEEcDn4+v9ob6b04nwJMgPEXeNFBHg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:f8250ef9-0094-4ab2-bde2-ad8fabebef2d,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:bfc58ed0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 96a4e85b01594985a209841b122eb260-20220728
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1468435725; Thu, 28 Jul 2022 00:14:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 28 Jul 2022 15:13:43 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Jul 2022 15:13:42 +0800
Subject: Re: [PATCH v4] ufs: core: fix lockdep warning of clk_scaling_lock
To: Bart Van Assche <bvanassche@acm.org>, <stanley.chu@mediatek.com>,
	<linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
	<jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <stable@vger.kernel.org>
References: <20220727032110.31168-1-peter.wang@mediatek.com>
 <5fab3d4f-914e-63f8-a3e8-7dd92ecdb04a@acm.org>
From: Peter Wang <peter.wang@mediatek.com>
Message-ID: <47d1efed-69a7-cabf-e586-48b09a9afd78@mediatek.com>
Date: Thu, 28 Jul 2022 15:13:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5fab3d4f-914e-63f8-a3e8-7dd92ecdb04a@acm.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_001428_751488_802375DC 
X-CRM114-Status: GOOD (  16.00  )
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

DQpPbiA3LzI4LzIyIDI6MTIgQU0sIEJhcnQgVmFuIEFzc2NoZSB3cm90ZToNCj4gT24gNy8yNi8y
MiAyMDoyMSwgcGV0ZXIud2FuZ0BtZWRpYXRlay5jb20gd3JvdGU6DQo+PiAtwqDCoMKgIC8qIEVu
YWJsZSBXcml0ZSBCb29zdGVyIGlmIHdlIGhhdmUgc2NhbGVkIHVwIGVsc2UgZGlzYWJsZSBpdCAq
Lw0KPj4gLcKgwqDCoCBkb3duZ3JhZGVfd3JpdGUoJmhiYS0+Y2xrX3NjYWxpbmdfbG9jayk7DQo+
PiAtwqDCoMKgIGlzX3dyaXRlbG9jayA9IGZhbHNlOw0KPj4gLcKgwqDCoCB1ZnNoY2Rfd2JfdG9n
Z2xlKGhiYSwgc2NhbGVfdXApOw0KPj4gK8KgwqDCoCAvKiBEaXNhYmxlIGNsa19zY2FsaW5nIHVu
dGlsIHVmc2hjZF93Yl90b2dnbGUgZmluaXNoICovDQo+PiArwqDCoMKgIGhiYS0+Y2xrX3NjYWxp
bmcuaXNfYWxsb3dlZCA9IGZhbHNlOw0KPj4gK8KgwqDCoCB3Yl90b2dnbGUgPSB0cnVlOw0KPj4g
wqAgwqAgb3V0X3VucHJlcGFyZToNCj4+IC3CoMKgwqAgdWZzaGNkX2Nsb2NrX3NjYWxpbmdfdW5w
cmVwYXJlKGhiYSwgaXNfd3JpdGVsb2NrKTsNCj4+ICvCoMKgwqAgdWZzaGNkX2Nsb2NrX3NjYWxp
bmdfdW5wcmVwYXJlKGhiYSk7DQo+PiArDQo+PiArwqDCoMKgIC8qIEVuYWJsZSBXcml0ZSBCb29z
dGVyIGlmIHdlIGhhdmUgc2NhbGVkIHVwIGVsc2UgZGlzYWJsZSBpdCAqLw0KPj4gK8KgwqDCoCBp
ZiAod2JfdG9nZ2xlKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgdWZzaGNkX3diX3RvZ2dsZShoYmEs
IHNjYWxlX3VwKTsNCj4+ICvCoMKgwqDCoMKgwqDCoCB1ZnNoY2RfY2xrX3NjYWxpbmdfYWxsb3co
aGJhLCB0cnVlKTsNCj4+ICvCoMKgwqAgfQ0KPg0KPiBJJ20gY29uY2VybmVkIHRoYXQgYnJpZWZs
eSBkaXNhYmxpbmcgY2xvY2sgc2NhbGluZyBtYXkgY2F1c2UgdGhlIGNsb2NrIA0KPiB0byByZW1h
aW4gYXQgYSBoaWdoIGZyZXF1ZW5jeSBldmVuIGlmIGl0IHNob3VsZG4ndC4gSGFzIHRoZSBmb2xs
b3dpbmcgDQo+IGFwcHJvYWNoIGJlZW4gY29uc2lkZXJlZD8gSW5zdGVhZCBvZiBtb3ZpbmcgdGhl
IA0KPiB1ZnNoY2RfY2xrX3NjYWxpbmdfYWxsb3coKSBjYWxsLCBjb252ZXJ0IGRldl9jbWQubG9j
ayBpbnRvIGEgDQo+IHNlbWFwaG9yZSwgbG9jayBpdCBuZWFyIHRoZSBzdGFydCBvZiB1ZnNoY2Rf
ZGV2ZnJlcV9zY2FsZSgpIGFuZCB1bmxvY2sgDQo+IGl0IG5lYXIgdGhlIGVuZCBvZiB0aGUgc2Ft
ZSBmdW5jdGlvbi4NCj4NCj4gVGhhbmtzLA0KPg0KPiBCYXJ0Lg0KDQoNCkhpIEJhcnQsDQoNCkNs
b2NrIHNjYWxpbmcgdXAvZG93biBoYXZlIGEgcG9sbGluZ19tcywgc28gaXQgc2hvdWxkbid0IGhh
dmUgdGhpcyANCmNvbmRpdGlvbiB0aGF0IHNjYWxlIHVwIGJsb2NrIHNjYWxlIGRvd24uDQpDb252
ZXJ0IGRldl9jbWQubG9jayBpbnRvIGEgc2VtYXBob3JlIGlzIG1vcmUgcmlza3ksIGFuZCBkZXZf
Y21kLmxvY2sgDQpzaG91bGQgaG9sZCB3aGVuIHNlbmQgZGV2IGNvbW1hbmQgb25seS4NCkkgdGhp
bmsgaXQgaXMgbm90IHN1aXRhYmxlIHRvIGhvbGQgdGhpcyBkZXZfY21kLmxvY2sgaW4gDQp1ZnNo
Y2RfZGV2ZnJlcV9zY2FsZS4NCg0KTWF5YmUgd2UgY2FuIGhhdmUgYW5vdGhlciBjaG9pY2UsIGxl
dCB2ZW5kb3IgZGVjaWRlIHVmc2hjZF93Yl90b2dnbGUgDQp3aXRoIGNsb2NrIHNjYWxpbmcgb3Ig
bm90Pw0KDQpUaGFua3MuDQpQZXRlcg0KDQoNCg==


