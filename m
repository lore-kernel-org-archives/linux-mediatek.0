Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2E8C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 03:00:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BAB320656
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 03:00:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lYDu+LR0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kia3kxh/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BAB320656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jLKxLWMerJ7n55C+CeWXhMI5h2M7mxczCr60Dei3fgI=; b=lYDu+LR0FSYRHDOLR7QW3flCz
	Cj7KoevD8GFQ5N5CuHC5I2wNLV2tkyr1RgBJYpiHgUScfC+ekGsWibR4sORlcJEtTegOWnlsl4a2s
	4k+E5AH/FxprT5JR5Di/QaB/xYzVSxZ+rZ3onL4epddZdQVPWTNgYgFGOBJd8ggXFlZakqCw86By0
	iDZ0x0u4AZnxizGwHtJhIvK0tNc1GVSVOBdmvbjjQ3QTL3Z68sTtHEsAhJ38ywuDi0A4tK5SrJi0i
	H5GhwuhZBNz/rW6e4FDhww91KKQxAZTn5RbHJN1mHt05/zcrQv0OGPSw8JzNJIp90L74nMZFQYiYi
	4VxcpHjNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1LHY-0003h2-Vu; Fri, 31 Jul 2020 03:00:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1LHT-0003gC-RF; Fri, 31 Jul 2020 03:00:25 +0000
X-UUID: 55b23ad257cf431696be9eca216e91ce-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cFIZ7AH8wP53gxkMXNCyFCEQBG9OwGZTiAZ/fcp/WMM=; 
 b=kia3kxh/xLsY5o/LAnggUes2TxPWk6hh7M5Ketp2D/F3ooE+WYlo03VvAChdW63y/QhV5/pLE5BtARSuKGAh6FiVorWlJ0JRCn24JZfctEQIRhqeO3Rg3pgPi/RO1oHDKnMV66Uykf1mfV6VAsWtaJCZE3mGnZYGL9gepb3MdOY=;
X-UUID: 55b23ad257cf431696be9eca216e91ce-20200730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1792038685; Thu, 30 Jul 2020 19:00:26 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 19:52:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 10:52:48 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 31 Jul 2020 10:52:50 +0800
Message-ID: <1596163970.3932.24.camel@mtkswgap22>
Subject: Re: [PATCH v4 2/2] soc: mediatek: add mtk-devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 31 Jul 2020 10:52:50 +0800
In-Reply-To: <CAAOTY_9HXv+OsSRF7P9=cRy9AYZ0vwffgo3Kc8V=qQ6ce90uJw@mail.gmail.com>
References: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
 <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_9HXv+OsSRF7P9=cRy9AYZ0vwffgo3Kc8V=qQ6ce90uJw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DEF49C35DD5F7474C2C42C04E1153A4CCCB758172807FE52D0D1CF94F024EAA82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_230024_240086_C90E5210 
X-CRM114-Status: GOOD (  23.46  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neal Liu <neal.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywNCg0KT24gRnJpLCAyMDIwLTA3LTMxIGF0IDAwOjE0ICswODAwLCBDaHVu
LUt1YW5nIEh1IHdyb3RlOg0KPiBIaSwgTmVhbDoNCj4gDQo+IE5lYWwgTGl1IDxuZWFsLmxpdUBt
ZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0N+aciDI55pelIOmAseS4iSDkuIvljYg0OjI55a+r6YGT
77yaDQo+ID4NCj4gPiBNZWRpYVRlayBidXMgZmFicmljIHByb3ZpZGVzIFRydXN0Wm9uZSBzZWN1
cml0eSBzdXBwb3J0IGFuZCBkYXRhDQo+ID4gcHJvdGVjdGlvbiB0byBwcmV2ZW50IHNsYXZlcyBm
cm9tIGJlaW5nIGFjY2Vzc2VkIGJ5IHVuZXhwZWN0ZWQNCj4gPiBtYXN0ZXJzLg0KPiA+IFRoZSBz
ZWN1cml0eSB2aW9sYXRpb24gaXMgbG9nZ2VkIGFuZCBzZW50IHRvIHRoZSBwcm9jZXNzb3IgZm9y
DQo+ID4gZnVydGhlciBhbmFseXNpcyBvciBjb3VudGVybWVhc3VyZXMuDQo+ID4NCj4gPiBBbnkg
b2NjdXJyZW5jZSBvZiBzZWN1cml0eSB2aW9sYXRpb24gd291bGQgcmFpc2UgYW4gaW50ZXJydXB0
LCBhbmQNCj4gPiBpdCB3aWxsIGJlIGhhbmRsZWQgYnkgbXRrLWRldmFwYyBkcml2ZXIuIFRoZSB2
aW9sYXRpb24NCj4gPiBpbmZvcm1hdGlvbiBpcyBwcmludGVkIGluIG9yZGVyIHRvIGZpbmQgdGhl
IG11cmRlcmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTmVhbCBMaXUgPG5lYWwubGl1QG1l
ZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFtzbmlwXQ0KPiANCj4gPiArDQo+ID4gKy8qDQo+
ID4gKyAqIGRldmFwY19leHRyYWN0X3Zpb19kYmcgLSBleHRyYWN0IGZ1bGwgdmlvbGF0aW9uIGlu
Zm9ybWF0aW9uIGFmdGVyIGRvaW5nDQo+ID4gKyAqICAgICAgICAgICAgICAgICAgICAgICAgICBz
aGlmdCBtZWNoYW5pc20uDQo+ID4gKyAqLw0KPiA+ICtzdGF0aWMgdm9pZCBkZXZhcGNfZXh0cmFj
dF92aW9fZGJnKHN0cnVjdCBtdGtfZGV2YXBjX2NvbnRleHQgKmN0eCkNCj4gPiArew0KPiA+ICsg
ICAgICAgY29uc3Qgc3RydWN0IG10a19kZXZhcGNfdmlvX2RiZ3MgKnZpb19kYmdzOw0KPiA+ICsg
ICAgICAgc3RydWN0IG10a19kZXZhcGNfdmlvX2luZm8gKnZpb19pbmZvOw0KPiA+ICsgICAgICAg
dm9pZCBfX2lvbWVtICp2aW9fZGJnMF9yZWc7DQo+ID4gKyAgICAgICB2b2lkIF9faW9tZW0gKnZp
b19kYmcxX3JlZzsNCj4gPiArICAgICAgIHUzMiBkYmcwOw0KPiA+ICsNCj4gPiArICAgICAgIHZp
b19kYmcwX3JlZyA9IGN0eC0+ZGV2YXBjX3BkX2Jhc2UgKyBjdHgtPm9mZnNldC0+dmlvX2RiZzA7
DQo+ID4gKyAgICAgICB2aW9fZGJnMV9yZWcgPSBjdHgtPmRldmFwY19wZF9iYXNlICsgY3R4LT5v
ZmZzZXQtPnZpb19kYmcxOw0KPiA+ICsNCj4gPiArICAgICAgIHZpb19kYmdzID0gY3R4LT52aW9f
ZGJnczsNCj4gPiArICAgICAgIHZpb19pbmZvID0gY3R4LT52aW9faW5mbzsNCj4gPiArDQo+ID4g
KyAgICAgICAvKiBTdGFydHMgdG8gZXh0cmFjdCB2aW9sYXRpb24gaW5mb3JtYXRpb24gKi8NCj4g
PiArICAgICAgIGRiZzAgPSByZWFkbCh2aW9fZGJnMF9yZWcpOw0KPiA+ICsgICAgICAgdmlvX2lu
Zm8tPnZpb19hZGRyID0gcmVhZGwodmlvX2RiZzFfcmVnKTsNCj4gPiArDQo+ID4gKyAgICAgICB2
aW9faW5mby0+bWFzdGVyX2lkID0gKGRiZzAgJiB2aW9fZGJncy0+bXN0aWQubWFzaykgPj4NCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2aW9fZGJncy0+bXN0aWQuc3RhcnQ7DQo+
ID4gKyAgICAgICB2aW9faW5mby0+ZG9tYWluX2lkID0gKGRiZzAgJiB2aW9fZGJncy0+ZG1uaWQu
bWFzaykgPj4NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2aW9fZGJncy0+ZG1u
aWQuc3RhcnQ7DQo+ID4gKyAgICAgICB2aW9faW5mby0+d3JpdGUgPSAoKGRiZzAgJiB2aW9fZGJn
cy0+dmlvX3cubWFzaykgPj4NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgdmlvX2Ri
Z3MtPnZpb193LnN0YXJ0KSA9PSAxOw0KPiA+ICsgICAgICAgdmlvX2luZm8tPnJlYWQgPSAoKGRi
ZzAgJiB2aW9fZGJncy0+dmlvX3IubWFzaykgPj4NCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgIHZpb19kYmdzLT52aW9fci5zdGFydCkgPT0gMTsNCj4gPiArICAgICAgIHZpb19pbmZvLT52
aW9fYWRkcl9oaWdoID0gKGRiZzAgJiB2aW9fZGJncy0+YWRkcl9oLm1hc2spID4+DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZpb19kYmdzLT5hZGRyX2guc3RhcnQ7DQo+
IA0KPiANCj4gSSB3b3VsZCBsaWtlIHRvIGRlZmluZSB0aGUgdHlwZSBvZiBjdHgtPnZpb19pbmZv
IHRvIGJlDQo+IA0KPiBzdHJ1Y3QgbXRrX2RldmFwY192aW9fZGJncyB7DQo+ICAgICB1MzIgbXN0
aWQ6MTY7DQo+ICAgICB1MzIgZG1uaWQ6NjsNCj4gICAgIHUzMiB2aW9fdzoxOw0KPiAgICAgdTMy
IHZpb19yOjE7DQo+ICAgICB1MzIgYWRkcl9oOjQ7DQo+ICAgICB1MzIgcmVzdjo0Ow0KPiB9Ow0K
PiANCj4gc28gdGhlIGNvZGUgd291bGQgbGlrZSB0aGUgc2ltcGxlIHdheQ0KPiANCj4gY3R4LT52
aW9faW5mbyA9IChzdHJ1Y3QgbXRrX2RldmFwY192aW9fZGJncylyZWFkbCh2aW9fZGJnMV9yZWcp
Ow0KPiANCg0KVGhpcyBpZGVhIGxvb2tzIGdyZWF0ISBJcyB0aGVyZSBhbnkgcG9zc2libGUgdG8g
cGFzcyB0aGUgYml0IGxheW91dCBieQ0KRFQgZGF0YSwgYW5kIHN0aWxsIG1ha2UgdGhpcyBvcGVy
YXRpb24gc2ltcGxlPw0KV2h5IGFtIEkgYXNraW5nIHRoaXMgcXVlc3Rpb24gaXMgYmVjYXVzZSB0
aGlzIGJpdCBsYXlvdXQgaXMgcGxhdGZvcm0NCmRlcGVuZGVudC4NCg0KPiBSZWdhcmRzLA0KPiBD
aHVuLUt1YW5nLg0KPiANCj4gPiArDQo+ID4gKyAgICAgICBkZXZhcGNfdmlvX2luZm9fcHJpbnQo
Y3R4KTsNCj4gPiArfQ0KPiA+ICsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
