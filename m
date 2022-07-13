Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087E9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 09:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3V8KK2PbwgntY2VoDFC4vUOWxeh8u6+BW+c63XjJICA=; b=Qy43KCJjh+K1RVKbMYzebyxEct
	ymJJjiC2P/EWjYq8Idq4fFjL4FvKd01MsI2eYcQHlsi3cX8dBnHERohHJnLbSXVs/BOmOIj3pN8/M
	RHy9+LmX6WaRm7j5e77y1HMPajhmqiVU3QxEDYwH/tVvF26o0/6iqzddhtSn+zIdX4IOycm3IpxF4
	hiZDgwefl9d0zTR46Czi/JJFznLlWNn1d10fQEJd5q4O6kZw68LkXG/7iMKso8il6mzVuNLBtW+a+
	ZCBRJ/lk1F109nkakICJuBnXml2gUyGCoXmJ//+w+zvRS4umlpXKwQqp7T1G9pSzqR7gQ5P4aQJZw
	MmZ9emYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBYtE-002LKH-TM; Wed, 13 Jul 2022 09:42:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBYtB-002LID-VB; Wed, 13 Jul 2022 09:42:39 +0000
X-UUID: 52a7fd8d2c0b4b0f84406d3682305475-20220713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3V8KK2PbwgntY2VoDFC4vUOWxeh8u6+BW+c63XjJICA=;
	b=Ql4bWUumIE/wHLdQqdC8aUkQZ0tAzsOWH0DQvog1O2sEDNS4F8S8d8BlfTbGA40/18N2e3W2UK6Xy8puGH5UcNGkoZVkDsTUCNKr++vkso+MCFWOqoqU47zko0CQZfjvHeKqJBMPj9hYXkyhx6zKFHuyGFpLvJnhgK7LeqbK7wk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ea125323-80a3-4526-a8fa-5a9277290da5,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:4850dd32-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 52a7fd8d2c0b4b0f84406d3682305475-20220713
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 157702956; Wed, 13 Jul 2022 02:42:31 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 13 Jul 2022 17:42:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Jul 2022 17:42:22 +0800
Message-ID: <28177f7f7c1d48b30338071f57f9801d45617f8b.camel@mediatek.com>
Subject: Re: [PATCH 1/5] usb: mtu3: fix coverity of string buffer
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>
Date: Wed, 13 Jul 2022 17:42:22 +0800
In-Reply-To: <YsvHD6dpU3O7gQD4@kroah.com>
References: <20220708071903.25752-1-chunfeng.yun@mediatek.com>
	 <YsfcFXtkDxe6ndFT@kroah.com>
	 <9bbc0472bafa6116618e9861c3566d470c30c619.camel@mediatek.com>
	 <YsvHD6dpU3O7gQD4@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_024238_034039_60A44301 
X-CRM114-Status: GOOD (  13.85  )
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

T24gTW9uLCAyMDIyLTA3LTExIGF0IDA4OjQ1ICswMjAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6DQo+IE9uIE1vbiwgSnVsIDExLCAyMDIyIGF0IDAyOjM5OjEwUE0gKzA4MDAsIENodW5mZW5n
IFl1biB3cm90ZToNCj4gPiBPbiBGcmksIDIwMjItMDctMDggYXQgMDk6MjYgKzAyMDAsIEdyZWcg
S3JvYWgtSGFydG1hbiB3cm90ZToNCj4gPiA+IE9uIEZyaSwgSnVsIDA4LCAyMDIyIGF0IDAzOjE4
OjU5UE0gKzA4MDAsIENodW5mZW5nIFl1biB3cm90ZToNCj4gPiA+ID4gVXNlIHNucHJpbnRmIGlu
c3RlYWQgb2Ygc3ByaW50ZiB3aGljaCBjb3VsZCBjYXVzZSBidWZmZXINCj4gPiA+ID4gb3ZlcmZs
b3cuDQo+ID4gPiANCj4gPiA+IEhvdyBjYW4gaXQgY2F1c2UgYW4gb3ZlcmZsb3c/DQo+ID4gDQo+
ID4gTWF5YmUgSSBkaWRuJ3QgZGVzY3JpYmUgaXQgY2xlYXJseSwgdGhpcyBwYXRjaCBpcyB1c2Vk
IHRvIGZpeA0KPiA+IGNvdmVyaXR5DQo+ID4gY2hlY2sgd2FybmluZyBvZiBzdHJpbmcgYnVmZmVy
LCBpbiBmYWN0IG5vIG92ZXJmbG93IGhhcHBlbnMuDQo+IA0KPiBUaGVuIHBlcmhhcHMgdGhlIGNv
dmVyaXR5IHdhcm5pbmcgaXMgdXNlbGVzcyBhbmQNCj4geWV0LWFub3RoZXItZmFsc2UtcG9zaXRp
dmUgdGhhdCB0aGF0IHRvb2wgaXMga25vd24gdG8gc3BpdCBvdXQ/DQo+IA0KPiBEb24ndCBtYWtl
IGNvZGUgY2hhbmdlcyBqdXN0IGJlY2F1c2UgYnJva2VuIHRvb2xzIHNheSB0byBkbyBzby4NCkdv
dCBpdCwgdGhhbmtzIGEgbG90DQoNCj4gDQo+IHRoYW5rcywNCj4gDQo+IGdyZWcgay1oDQo=


