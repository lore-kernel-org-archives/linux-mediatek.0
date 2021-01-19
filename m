Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E042C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 02:58:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C16DB206C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 02:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C16DB206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mZqQucgFQEFy6mx+3bw4sm+XksNUKcRDWkaOJIbTsMI=; b=TunEHWXDwLR0EqqP19dgZK986
	WpzEoTOfhcZFPqy9+z0Ch5U4FRm6TcKKVKH0gUeB5aN07zii8O38mp0uVOAQm5u4lSFsuVJdyEg+r
	EqaQOmD0iDiFJpIzOqKraKyTO7IDef+G2lQHjrlvQcw69cboC/FDlv3y+RyXtrqekhaTWx2eA+CT6
	Np4i8xVEnCW4UPb+oqPXmfQzUMXDM7Au0yuWwot8Y+QAgtAE7Nm1zEwYzjMW6JvskZ4UD1cgdGsdW
	lFG5vQ0AZm0Lzi6T6FVftE3zpeoBXyO1McisK251iy+v+4pTjcIE0RmvKi5J/W5FbsPZ+SDZ86RA3
	fRGKCdE1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1hDS-00066k-JT; Tue, 19 Jan 2021 02:57:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1hDQ-00065w-JB; Tue, 19 Jan 2021 02:57:57 +0000
X-UUID: f16c43166bd24c75b26f6e91d6b29d76-20210118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=y0UZs5dA/PPpNGMkAHG+Gh9GacqKAGQOXUeOBfQ5b04=; 
 b=loSxy2IcmD66TQ9ppfty/Nerq5zYx78/xOPX6hsCcpVYoXOzx4EGEGufiV7FW04P/Fy+7ndNwEe9B4yygUG0eBV6cFRWVzC0ZYYNv0rGfjnLQQSwBwaQ/Tk3lo6k3S3MMULhmTmw4IisitOfbqytCYZSgynbzsVkoWinlCe09J0=;
X-UUID: f16c43166bd24c75b26f6e91d6b29d76-20210118
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1867101234; Mon, 18 Jan 2021 18:57:54 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Jan 2021 18:57:48 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 Jan 2021 10:57:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Jan 2021 10:57:23 +0800
Message-ID: <1611025043.11995.20.camel@mhfsdcap03>
Subject: Re: [PATCH next 04/15] dt-bindings: phy: mediatek: hdmi-phy: modify
 compatible items
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 19 Jan 2021 10:57:23 +0800
In-Reply-To: <CAAOTY__DtGc85JNyxWcebof5h3_Os2ugyy1P0jZsOs0Yzj2miw@mail.gmail.com>
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
 <20210116090656.11752-4-chunfeng.yun@mediatek.com>
 <CAAOTY__DtGc85JNyxWcebof5h3_Os2ugyy1P0jZsOs0Yzj2miw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 37AC6E5033AF9021B31736C14DAFE0ED9E6A0ACFA4071DDEED4904F8820B42AC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_215756_773389_44FD3655 
X-CRM114-Status: GOOD (  17.02  )
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
Cc: DTML <devicetree@vger.kernel.org>, Min Guo <min.guo@mediatek.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIxLTAxLTE4IGF0IDIzOjA1ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgQ2h1bmZlbmc6DQo+IA0KPiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRl
ay5jb20+IOaWvCAyMDIx5bm0MeaciDE25pelIOmAseWFrSDkuIvljYg1OjA35a+r6YGT77yaDQo+
ID4NCj4gPiBUaGUgY29tcGF0aWxiZSAibWVkaWF0ZWssbXQ3NjIzLWhkbWktdHgiIGlzIG5vdCBz
dXBwb3J0ZWQgaW4gZHJpdmVyLA0KPiA+IGFuZCBpbiBmYWN0IHVzZXMgIm1lZGlhdGVrLG10Mjcw
MS1oZG1pLXR4IiBpbnN0ZWFkIG9uIE1UNzYyMywgc28gY2hhbmdlcw0KPiA+IHRoZSBjb21wYXRp
YmxlIGl0ZW1zIHRvIG1ha2UgZGVwZW5kZW5jZSBjbGVhci4NCj4gPg0KPiA+IENjOiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4NCj4gPiBDYzogUGhpbGlwcCBaYWJlbCA8
cC56YWJlbEBwZW5ndXRyb25peC5kZT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4g
PGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BoeS9tZWRpYXRlayxoZG1pLXBoeS55YW1sICAgIHwgMTEgKysrKysrKy0tLS0N
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5
L21lZGlhdGVrLGhkbWktcGh5LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGh5L21lZGlhdGVrLGhkbWktcGh5LnlhbWwNCj4gPiBpbmRleCA0NzUyNTE3YTE0NDYuLjBk
OTQ5NTBiODRjYSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L21lZGlhdGVrLGhkbWktcGh5LnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGhkbWktcGh5LnlhbWwNCj4gPiBAQCAt
MjEsMTAgKzIxLDEzIEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICBwYXR0ZXJuOiAiXmhkbWktcGh5
QFswLTlhLWZdKyQiDQo+ID4NCj4gPiAgICBjb21wYXRpYmxlOg0KPiA+IC0gICAgZW51bToNCj4g
PiAtICAgICAgLSBtZWRpYXRlayxtdDI3MDEtaGRtaS1waHkNCj4gPiAtICAgICAgLSBtZWRpYXRl
ayxtdDc2MjMtaGRtaS1waHkNCj4gPiAtICAgICAgLSBtZWRpYXRlayxtdDgxNzMtaGRtaS1waHkN
Cj4gPiArICAgIG9uZU9mOg0KPiA+ICsgICAgICAtIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgLSBl
bnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ3NjIzLWhkbWktcGh5DQo+ID4g
KyAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDI3MDEtaGRtaS1waHkNCj4gPiArICAgICAg
LSBjb25zdDogbWVkaWF0ZWssbXQyNzAxLWhkbWktcGh5DQo+ID4gKyAgICAgIC0gY29uc3Q6IG1l
ZGlhdGVrLG10ODE3My1oZG1pLXBoeQ0KPiA+DQo+IA0KPiBJIGxpa2UgbW92ZSAnaXRlbXMnIHRv
IHRoZSBib3R0b20uDQpJIGZvbGxvdyB0aGUgc2FtZSBzdHlsZSBhcyBvdGhlciBiaW5kaW5ncw0K
DQo+IA0KPiAtIGNvbnN0OiBtZWRpYXRlayxtdDI3MDEtaGRtaS1waHkNCj4gLSBjb25zdDogbWVk
aWF0ZWssbXQ4MTczLWhkbWktcGh5DQo+IA0KPiAtIGl0ZW1zOg0KPiAgIC0gZW51bToNCj4gICAg
ICAgLSBtZWRpYXRlayxtdDc2MjMtaGRtaS1waHkNCj4gICAtIGNvbnN0OiBtZWRpYXRlayxtdDI3
MDEtaGRtaS1waHkNCj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQo+IA0KPiA+ICAgIHJl
ZzoNCj4gPiAgICAgIG1heEl0ZW1zOiAxDQo+ID4gLS0NCj4gPiAyLjE4LjANCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
