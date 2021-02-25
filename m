Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C82C433E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 03:08:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90BAA64F0C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 03:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90BAA64F0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RfiQdOFXexYWdg8bS8/0KTpaCkR/dgbNtOi0N6HAibQ=; b=QsnqyanPjKGJuC+UVbeu67moA
	EF/9iNzk9GBx16IP5dEyC3+FBASn9DyMZkFh5hvz7CJCRf7UDd2OcQEipvFgc9ds/YHIvjDKqcjx/
	UifcZqpaTPbBlHOWKZCRnnVSH4qIsa7pd5bwJph9KCIDW5zyjH7lpGBpAL51laQcjYkuHce7bzomU
	1UFJsMLaO9LvwDZV2/S+gy/rVGW5SthMH8r8CM3chu3VLsh+p+br9qEQ5vd44BIW2K+CXffJmsAeu
	wjSvtbuejkkSzhYsXOdcLQtkiXK7JrEGsARllbkTKREue9bq7bsUY+gEOhtBsxn6MoX+q0flgeGDU
	YnnP0vTdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lF70H-0004p1-MD; Thu, 25 Feb 2021 03:07:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF70E-0004o6-W1; Thu, 25 Feb 2021 03:07:48 +0000
X-UUID: ed485fecd2c34153ad95edf1831f115e-20210224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=y3Z6bXHSxYt/XefMUF2Ej5G5MK26sx3R7f8iqkwRjHQ=; 
 b=jC1XbRF1m0o5uKo5iFZVsMOIgh9gvq2o7nw1zhyf32jZxNmJKrY8uMkMk117O57oBFiD5UO3o+nhmXp99xlmYX7Ui/faFixobcblX+SaLEUU2N4sM7hpp/XlxYa8QcEJ9odZaeHOLj0Oz/l6FShIGYepHrNH+O1yAwdeoPhj1N8=;
X-UUID: ed485fecd2c34153ad95edf1831f115e-20210224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 892093074; Wed, 24 Feb 2021 19:07:42 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Feb 2021 19:07:41 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 25 Feb 2021 11:07:28 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Feb 2021 11:07:27 +0800
Message-ID: <1614222447.25750.6.camel@mhfsdcap03>
Subject: Re: [v8,3/7] PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Date: Thu, 25 Feb 2021 11:07:27 +0800
In-Reply-To: <YDZWUGcKet/lNWlF@rocinante>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-4-jianjun.wang@mediatek.com>
 <YDZWUGcKet/lNWlF@rocinante>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2527535507F0EF02A04F06AA3D3F45EB233404E3E614B1CDEF1DCB52D726076A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_220747_229197_00791485 
X-CRM114-Status: GOOD (  21.13  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rex-BC.Chen@mediatek.com,
 qizhong.cheng@mediatek.com, chuanjia.liu@mediatek.com, maz@kernel.org,
 drinkcat@chromium.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, sin_jieyang@mediatek.com, Sj
 Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 anson.chuang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LCBJIHdpbGwgZml4IHRoZXNl
IGF0IG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzLg0KDQpPbiBXZWQsIDIwMjEtMDItMjQgYXQgMTQ6
MzYgKzAxMDAsIEtyenlzenRvZiBXaWxjennFhHNraSB3cm90ZToNCj4gSGkgSmlhbmp1biwNCj4g
DQo+IFRoYW5rIHlvdSBmb3IgYWxsIHRoZSB3b3JrIGhlcmUhDQo+IA0KPiBbLi4uXQ0KPiA+ICsg
KiBzdHJ1Y3QgbXRrX3BjaWVfcG9ydCAtIFBDSWUgcG9ydCBpbmZvcm1hdGlvbg0KPiA+ICsgKiBA
ZGV2OiBwb2ludGVyIHRvIFBDSWUgZGV2aWNlDQo+ID4gKyAqIEBiYXNlOiBJTyBtYXBwZWQgcmVn
aXN0ZXIgYmFzZQ0KPiA+ICsgKiBAcmVnX2Jhc2U6IFBoeXNpY2FsIHJlZ2lzdGVyIGJhc2UNCj4g
PiArICogQG1hY19yZXNldDogbWFjIHJlc2V0IGNvbnRyb2wNCj4gPiArICogQHBoeV9yZXNldDog
cGh5IHJlc2V0IGNvbnRyb2wNCj4gPiArICogQHBoeTogUEhZIGNvbnRyb2xsZXIgYmxvY2sNCj4g
PiArICogQGNsa3M6IFBDSWUgY2xvY2tzDQo+ID4gKyAqIEBudW1fY2xrczogUENJZSBjbG9ja3Mg
Y291bnQgZm9yIHRoaXMgcG9ydA0KPiANCj4gSXQgd291bGQgYmUgIk1BQyIgYW5kICJQSFkiIGlu
IHRoZSBhYm92ZS4NCj4gDQo+IFsuLi5dDQo+ID4gKyAqIG10a19wY2llX2NvbmZpZ190bHBfaGVh
ZGVyDQo+ID4gKyAqIEBidXM6IFBDSSBidXMgdG8gcXVlcnkNCj4gPiArICogQGRldmZuOiBkZXZp
Y2UvZnVuY3Rpb24gbnVtYmVyDQo+ID4gKyAqIEB3aGVyZTogb2Zmc2V0IGluIGNvbmZpZyBzcGFj
ZQ0KPiA+ICsgKiBAc2l6ZTogZGF0YSBzaXplIGluIFRMUCBoZWFkZXINCj4gPiArICoNCj4gPiAr
ICogU2V0IGJ5dGUgZW5hYmxlIGZpZWxkIGFuZCBkZXZpY2UgaW5mb3JtYXRpb24gaW4gY29uZmln
dXJhdGlvbiBUTFAgaGVhZGVyLg0KPiANCj4gVGhlIGtlcm5lbC1kb2MgYWJvdmUgbWlnaHQgYmUg
bWlzc2luZyBicmllZiBmdW5jdGlvbiBkZXNjcmlwdGlvbi4gIFNlZQ0KPiB0aGUgZm9sbG93aW5n
IGZvciBtb3JlIGNvbmNyZXRlIGV4YW1wbGU6DQo+IA0KPiAgIGh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvZG9jL2h0bWwvbGF0ZXN0L2RvYy1ndWlkZS9rZXJuZWwtZG9jLmh0bWwjZnVuY3Rpb24tZG9j
dW1lbnRhdGlvbg0KPiANCj4gWy4uLl0NCj4gPiArc3RhdGljIGludCBtdGtfcGNpZV9zZXRfdHJh
bnNfdGFibGUoc3RydWN0IG10a19wY2llX3BvcnQgKnBvcnQsDQo+ID4gKwkJCQkgICAgcmVzb3Vy
Y2Vfc2l6ZV90IGNwdV9hZGRyLA0KPiA+ICsJCQkJICAgIHJlc291cmNlX3NpemVfdCBwY2lfYWRk
ciwNCj4gPiArCQkJCSAgICByZXNvdXJjZV9zaXplX3Qgc2l6ZSwNCj4gPiArCQkJCSAgICB1bnNp
Z25lZCBsb25nIHR5cGUsIGludCBudW0pDQo+ID4gK3sNCj4gPiArCXZvaWQgX19pb21lbSAqdGFi
bGU7DQo+ID4gKwl1MzIgdmFsOw0KPiA+ICsNCj4gPiArCWlmIChudW0gPj0gUENJRV9NQVhfVFJB
TlNfVEFCTEVTKSB7DQo+ID4gKwkJZGV2X2Vycihwb3J0LT5kZXYsICJub3QgZW5vdWdoIHRyYW5z
bGF0ZSB0YWJsZVslZF0gZm9yIGFkZHI6ICUjbGx4LCBsaW1pdGVkIHRvIFslZF1cbiIsDQo+IA0K
PiBUaGUgd29yZGluZyBvZiB0aGlzIGVycm9yIG1lc3NhZ2UgaXMgYSBsaXR0bGUgY29uZnVzaW5n
Lg0KPiANCj4gPiArCQkJbnVtLCAodW5zaWduZWQgbG9uZyBsb25nKSBjcHVfYWRkciwNCj4gDQo+
IE5vIHNwYWNlIGJldHdlZW4gdGhlIGJyYWNrZXQgYW5kIHRoZSB2YXJpYWJsZSBuYW1lLg0KPiAN
Cj4gWy4uLl0NCj4gPiArCWVyciA9IHBoeV9pbml0KHBvcnQtPnBoeSk7DQo+ID4gKwlpZiAoZXJy
KSB7DQo+ID4gKwkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gaW5pdGlhbGl6ZSBQQ0llIHBoeVxu
Iik7DQo+ID4gKwkJZ290byBlcnJfcGh5X2luaXQ7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJZXJy
ID0gcGh5X3Bvd2VyX29uKHBvcnQtPnBoeSk7DQo+ID4gKwlpZiAoZXJyKSB7DQo+ID4gKwkJZGV2
X2VycihkZXYsICJmYWlsZWQgdG8gcG93ZXIgb24gUENJZSBwaHlcbiIpOw0KPiA+ICsJCWdvdG8g
ZXJyX3BoeV9vbjsNCj4gPiArCX0NCj4gWy4uLl0NCj4gDQo+IEl0IHdvdWxkIGJlICJQSFkiIGlu
IHRoZSBlcnJvciBtZXNzYWdlcyBhYm92ZS4NCj4gDQo+IFsuLi5dDQo+ID4gKwlpZiAoZXJyKSB7
DQo+ID4gKwkJZGV2X2VycihkZXYsICJjbG9jayBpbml0IGZhaWxlZFxuIik7DQo+ID4gKwkJZ290
byBlcnJfY2xrX2luaXQ7DQo+ID4gKwl9DQo+IFsuLi5dDQo+IA0KPiBBIG5pdHBpY2ssIHNvIGZl
ZWwgZnJlZSB0byBpZ25vcmUgaXQsIG9mIGNvdXJzZS4gIFdoYXQgYWJvdXQgImZhaWxlZCB0bw0K
PiBpbml0aWFsaXplIGNsb2NrIiB0byBrZWVwIHRoZSBzdHlsZSBjb25zaXN0ZW50Lg0KPiANCj4g
Wy4uLl0NCj4gPiArCWVyciA9IG10a19wY2llX3N0YXJ0dXBfcG9ydChwb3J0KTsNCj4gPiArCWlm
IChlcnIpIHsNCj4gPiArCQlkZXZfZXJyKGRldiwgIlBDSWUgc3RhcnR1cCBmYWlsZWRcbiIpOw0K
PiBbLi4uXQ0KPiANCj4gQWxzbyBhIG5pdHBpY2suICBXaGF0IGFib3V0ICJmYWlsZWQgdG8gYnJp
bmcgUENJZSBsaW5rIHVwIj8NCj4gDQo+IEtyenlzenRvZg0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
