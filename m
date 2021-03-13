Return-Path: <SRS0=A4vX=IL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF91EC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Mar 2021 07:46:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7595E64F19
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Mar 2021 07:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7595E64F19
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I+HQx8faWDAQjHUbKCB2soi+cwWjHCBFWO2NwvIADN0=; b=Dqfhla8GJdI1LUR2n2r71R3H3
	gZEJu3plGj/ERhnQkLNKPn2BZnpUId4I/ubhbECy0l2BAIvwbb8kOcnNUX/J7TeUYoisOsuH6kHs6
	Fy4cRoR/9BzbD6isSK/BohRWWWpHByW6GTfsopdxXbIbh6Va+UREMdo4+3kF+esAPtKm88Jdg74+o
	nmQsaDRJMDOREFCrZSLMTJUwyY2WGZtViiwJxaRKoul/Be/8W99CSt9682ZcSMBP41kR4hbGG4V32
	x9awhq5GbdzwmpPBDreO68P2t2x6MprZ7/6zT/lqBNJcKxtXhbJM6ApfOKcbIxstKUNTYtoolDfnV
	yGIZisfLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKyxY-00Cy4y-Ov; Sat, 13 Mar 2021 07:45:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKyvy-00Cy20-5Y; Sat, 13 Mar 2021 07:44:13 +0000
X-UUID: c64f449a70bc4f48af268e1c990ff2a9-20210312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6AvDzaCujLywxZv0HuQUXpaC1pt7o8tnO0KvyLt3jRY=; 
 b=qxUPZKD6DAzjKYXlW4YpwA8P0U2sOBc3GbIChyVwIpH/CCB2cNlWtLHq4N10GOwjFwgFfroo7gPi8sKoN8N2zvASHy4UuHoNOYMQ6n/xwcKlaiEcGlzHMCKgthttW7S7r3+i+yk2i6BPC5PsIDoIZ/R+xh12s5fSMlstKpcY3eI=;
X-UUID: c64f449a70bc4f48af268e1c990ff2a9-20210312
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 409549413; Fri, 12 Mar 2021 23:43:29 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 23:43:28 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 13 Mar 2021 15:43:14 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 13 Mar 2021 15:43:14 +0800
Message-ID: <1615621394.25662.70.camel@mhfsdcap03>
Subject: Re: [v8,3/7] PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Sj
 Huang" <sj.huang@mediatek.com>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <sin_jieyang@mediatek.com>, <drinkcat@chromium.org>,
 <Rex-BC.Chen@mediatek.com>, <anson.chuang@mediatek.com>
Date: Sat, 13 Mar 2021 15:43:14 +0800
In-Reply-To: <20210311123844.qzl264ungtk7b6xz@pali>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-4-jianjun.wang@mediatek.com>
 <20210311123844.qzl264ungtk7b6xz@pali>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E944CFC7D89B26022F8489BAA6FB25D117E5943FFE0BC034D1A03F9E25BF25822000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210313_074345_115091_48BE7226 
X-CRM114-Status: GOOD (  23.55  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIxLTAzLTExIGF0IDEzOjM4ICswMTAwLCBQYWxpIFJvaMOhciB3cm90ZToNCj4g
T24gV2VkbmVzZGF5IDI0IEZlYnJ1YXJ5IDIwMjEgMTQ6MTE6MjggSmlhbmp1biBXYW5nIHdyb3Rl
Og0KPiA+ICtzdGF0aWMgaW50IG10a19wY2llX3N0YXJ0dXBfcG9ydChzdHJ1Y3QgbXRrX3BjaWVf
cG9ydCAqcG9ydCkNCj4gPiArew0KPiAuLi4NCj4gPiArDQo+ID4gKwkvKiBEZWxheSAxMDBtcyB0
byB3YWl0IHRoZSByZWZlcmVuY2UgY2xvY2tzIGJlY29tZSBzdGFibGUgKi8NCj4gPiArCW1zbGVl
cCgxMDApOw0KPiA+ICsNCj4gPiArCS8qIERlLWFzc2VydCBQRVJTVCMgc2lnbmFsICovDQo+ID4g
Kwl2YWwgJj0gflBDSUVfUEVfUlNUQjsNCj4gPiArCXdyaXRlbF9yZWxheGVkKHZhbCwgcG9ydC0+
YmFzZSArIFBDSUVfUlNUX0NUUkxfUkVHKTsNCj4gDQo+IEhlbGxvISBUaGlzIGlzIGEgbmV3IGRy
aXZlciB3aGljaCBpbnRyb2R1Y2UgeWV0IGFub3RoZXIgY3VzdG9tIHRpbWVvdXQNCj4gcHJpb3Ig
UEVSU1QjIHNpZ25hbCBmb3IgUENJZSBjYXJkIGlzIGRlLWFzc2VydGVkLiBUaW1lb3V0cyBmb3Ig
b3RoZXINCj4gZHJpdmVycyBJIGNvbGxlY3RlZCBpbiBvbGRlciBlbWFpbCBbMl0uDQo+IA0KPiBQ
bGVhc2UgbG9vayBhdCBteSBlbWFpbCBbMV0gYWJvdXQgUENJZSBXYXJtIFJlc2V0IGlmIHlvdSBo
YXZlIGFueSBjbHVlDQo+IGFib3V0IGl0LiBMb3JlbnpvIGFuZCBSb2IgYWxyZWFkeSBleHByZXNz
ZWQgdGhhdCB0aGlzIHRpbWVvdXQgc2hvdWxkIG5vdA0KPiBiZSBkcml2ZXIgc3BlY2lmaWMuIEJ1
dCBub2JvZHkgd2FzIGFibGUgdG8gImRlY29kZSIgYW5kICJ1bmRlcnN0YW5kIg0KPiBQQ0llIHNw
ZWMgeWV0IGFib3V0IHRoZXNlIHRpbWVvdXRzLg0KDQpIaSBQYWxpLA0KDQpJIHRoaW5rIHRoaXMg
aXMgbW9yZSBsaWtlIGEgcGxhdGZvcm0gc3BlY2lmaWMgdGltZW91dCwgd2hpY2ggaXMgdXNlZCB0
bw0Kd2FpdCBmb3IgdGhlIHJlZmVyZW5jZSBjbG9ja3MgdG8gYmVjb21lIHN0YWJsZSBhbmQgZmlu
aXNoIHRoZSByZXNldCBmbG93DQpvZiBIVyBibG9ja3MuDQoNCkhlcmUgaXMgdGhlIHN0ZXBzIHRv
IHN0YXJ0IGEgbGluayB0cmFpbmluZyBpbiB0aGlzIEhXOg0KDQoxLiBBc3NlcnQgYWxsIHJlc2V0
IHNpZ25hbHMgd2hpY2ggaW5jbHVkaW5nIHRoZSB0cmFuc2FjdGlvbiBsYXllciwgUElQRQ0KaW50
ZXJmYWNlIGFuZCBpbnRlcm5hbCBidXMgaW50ZXJmYWNlOw0KDQoyLiBEZS1hc3NlcnQgcmVzZXQg
c2lnbmFscyBleGNlcHQgdGhlIFBFUlNUIywgdGhpcyB3aWxsIG1ha2UgdGhlDQpwaHlzaWNhbCBs
YXllciBhY3RpdmUgYW5kIHN0YXJ0IHRvIG91dHB1dCB0aGUgcmVmZXJlbmNlIGNsb2NrLCBidXQg
dGhlDQpFUCBkZXZpY2UgcmVtYWlucyBpbiB0aGUgcmVzZXQgc3RhdGUuDQogICBCZWZvcmUgcmVs
ZWFzaW5nIHRoZSBQRVJTVCMgc2lnbmFsLCB0aGUgSFcgYmxvY2tzIG5lZWRzIGF0IGxlYXN0IDEw
bXMNCnRvIGZpbmlzaCB0aGUgcmVzZXQgZmxvdywgYW5kIHJlZi1jbGsgbmVlZHMgYWJvdXQgMzB1
cyB0byBiZWNvbWUgc3RhYmxlLg0KDQozLiBEZS1hc3NlcnQgUEVSU1QjIHNpZ25hbCwgd2FpdCBM
VFNTTSBlbnRlciBMMCBzdGF0ZS4NCg0KVGhpcyAxMDBtcyB0aW1lb3V0IGlzIHJlZmVyZW5jZSB0
byBUUFZQRVJMIGluIHRoZSBQQ0llIENFTSBzcGVjLiBTaW5jZQ0Kd2UgYXJlIGluIHRoZSBrZXJu
ZWwgc3RhZ2UsIHRoZSBwb3dlciBzdXBwbHkgaGFzIGFscmVhZHkgc3RhYmxlZCwgdGhpcw0KdGlt
ZW91dCBtYXkgbm90IHRha2UgdGhhdCBsb25nLg0KDQo+ID4gKw0KPiA+ICsJLyogQ2hlY2sgaWYg
dGhlIGxpbmsgaXMgdXAgb3Igbm90ICovDQo+ID4gKwllcnIgPSByZWFkbF9wb2xsX3RpbWVvdXQo
cG9ydC0+YmFzZSArIFBDSUVfTElOS19TVEFUVVNfUkVHLCB2YWwsDQo+ID4gKwkJCQkgISEodmFs
ICYgUENJRV9QT1JUX0xJTktVUCksIDIwLA0KPiA+ICsJCQkJIDUwICogVVNFQ19QRVJfTVNFQyk7
DQo+IA0KPiBJSVJDLCB5b3UgbmVlZCB0byB3YWl0IGF0IGxlYXN0IDEwMG1zIGFmdGVyIGRlLWFz
c2VydGluZyBQRVJTVCMgc2lnbmFsDQo+IGFzIGl0IGlzIHJlcXVpcmVkIGJ5IFBDSWUgc3BlY3Mg
YW5kIGFsc28gYmVjYXVzZSBleHBlcmltZW50cyBwcm92ZWQgdGhhdA0KPiBzb21lIENvbXBleCB3
aWZpIGNhcmRzIChlLmcuIFdMRTkwMFZYKSBhcmUgbm90IGRldGVjdGVkIGlmIHlvdSBkbyBub3QN
Cj4gd2FpdCB0aGlzIG1pbmltYWwgdGltZS4NCg0KWWVzLCB0aGlzIHNob3VsZCBiZSAxMDBtcywg
SSB3aWxsIGZpeCBpdCBhdCBuZXh0IHZlcnNpb24sIHRoYW5rcyBmb3INCnlvdXIgcmV2aWV3Lg0K
DQpUaGFua3MuDQo+IA0KPiA+ICsJaWYgKGVycikgew0KPiA+ICsJCXZhbCA9IHJlYWRsX3JlbGF4
ZWQocG9ydC0+YmFzZSArIFBDSUVfTFRTU01fU1RBVFVTX1JFRyk7DQo+ID4gKwkJZGV2X2Vycihw
b3J0LT5kZXYsICJQQ0llIGxpbmsgZG93biwgbHRzc20gcmVnIHZhbDogJSN4XG4iLCB2YWwpOw0K
PiA+ICsJCXJldHVybiBlcnI7DQo+ID4gKwl9DQo+IA0KPiBbMV0gLSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1wY2kvMjAyMTAzMTAxMTA1MzUuemg0cG5uNHZwbXZ6d2w1cUBwYWxpLw0K
PiBbMl0gLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAyMDA0MjQwOTI1NDYu
MjVwM2hkdGtlaG9oZTN4d0BwYWxpLw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
