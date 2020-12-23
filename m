Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E20FC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:32:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB7E224D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AB7E224D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IzZj0Iw9s6ilrfNp3Sf0YBQMMYD+dnGzIJNBuhh/hY=; b=Vztsg/qKhDH9u4AEWYC66Q0IBw
	qCGsggbqwOUG3MledlJQ8eAXB7v0ATA7GX37Xc7Bw/eZibmQ3X3EiXjkjM6gRLcJf1UVeZroxr3Wh
	+VGVfV/pIzqOOwIu29SRe/6Job7qMGMtjXiRD6NzqfK7ItnMRVBFJGAa8zFlKyXObTTKCbhrDF/OJ
	79XYMNHXwneF8LwM0K2XgHADYmxzFrp6gBZkmS0tjns2s67wP4sZsA0DjFQzXW55llxrUgjS/UwPT
	ZQ8S/GJ1+B2X00YWv+NcLfQmmUOCtZq+bRg2rcRiUPzEjbcbRx4xXZi5JRMS4BfNc/wqOfwoTUMTv
	tlyGglzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krt0O-0001ql-57; Wed, 23 Dec 2020 01:31:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krt0H-0001oh-I1; Wed, 23 Dec 2020 01:31:51 +0000
X-UUID: efc3694c534a4488ae810f90dfd4841b-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=wA1tMPUl7qbOsFxNAFBWpezyTlJCvJZ/9bkweVhcykY=; 
 b=Aevn41RM6jLteNj2Y4ziawuk1Zxah/n4bHN9WXSqf44qfvcB1DjaFC/+Opu4B0A4pOFbUj1sotqE4UGdBr8JN38RvD7EzjXtijp6mc/CChmkHgUqm9pR4mQzFKNjMmvw4WzA/+WHgqN5clGdy/OSBpn3prbS6mVUu3wcw4AdK9g=;
X-UUID: efc3694c534a4488ae810f90dfd4841b-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1775602754; Tue, 22 Dec 2020 17:31:44 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 17:21:49 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:21:44 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:21:40 +0800
Message-ID: <1608686503.18252.7.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 04/17] drm/mediatek: add component OVL_2L2
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Dec 2020 09:21:43 +0800
In-Reply-To: <CAAOTY_8bsmRtt9Kpd1__iEuPJ3Ox7jbn_yXnUeUoj041AhjSkQ@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-5-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_8bsmRtt9Kpd1__iEuPJ3Ox7jbn_yXnUeUoj041AhjSkQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_203149_837869_2DC3E14B 
X-CRM114-Status: GOOD (  19.50  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyMDIwLTEyLTEzIGF0IDA5OjE1ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMuaXpSDpgLHlha0g5LiL5Y2IMTI6MTLlr6vpgZPv
vJoNCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRkIGNvbXBvbmVudCBPVkxfMkwyDQo+IA0KPiBCcmVh
ayBkcm0gcGFydCBhbmQgc29jIHBhcnQgaW50byBkaWZmZXJlbnQgcGF0Y2hlcy4NCj4gDQo+IFJl
Z2FyZHMsDQo+IENodW4tS3VhbmcuDQoNCndpbGwgYmUgZml4ZWQgaW4gbmV4dCB2ZXJzaW9uDQo+
IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcF9jb21wLmMgfCAxICsNCj4gPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRr
LW1tc3lzLmggICAgICB8IDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5j
DQo+ID4gaW5kZXggOGViYTQ0Yi4uODkzODU1NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYw0KPiA+IEBAIC00MDMsNiArNDAzLDcgQEAg
c3RydWN0IG10a19kZHBfY29tcF9tYXRjaCB7DQo+ID4gICAgICAgICBbRERQX0NPTVBPTkVOVF9P
VkwxXSAgICA9IHsgTVRLX0RJU1BfT1ZMLCAgICAgICAxLCBOVUxMIH0sDQo+ID4gICAgICAgICBb
RERQX0NPTVBPTkVOVF9PVkxfMkwwXSA9IHsgTVRLX0RJU1BfT1ZMXzJMLCAgICAwLCBOVUxMIH0s
DQo+ID4gICAgICAgICBbRERQX0NPTVBPTkVOVF9PVkxfMkwxXSA9IHsgTVRLX0RJU1BfT1ZMXzJM
LCAgICAxLCBOVUxMIH0sDQo+ID4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9PVkxfMkwyXSA9IHsg
TVRLX0RJU1BfT1ZMXzJMLCAgICAyLCBOVUxMIH0sDQo+ID4gICAgICAgICBbRERQX0NPTVBPTkVO
VF9QV00wXSAgICA9IHsgTVRLX0RJU1BfUFdNLCAgICAgICAwLCBOVUxMIH0sDQo+ID4gICAgICAg
ICBbRERQX0NPTVBPTkVOVF9QV00xXSAgICA9IHsgTVRLX0RJU1BfUFdNLCAgICAgICAxLCBOVUxM
IH0sDQo+ID4gICAgICAgICBbRERQX0NPTVBPTkVOVF9QV00yXSAgICA9IHsgTVRLX0RJU1BfUFdN
LCAgICAgICAyLCBOVUxMIH0sDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc29jL21l
ZGlhdGVrL210ay1tbXN5cy5oIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lz
LmgNCj4gPiBpbmRleCA0YjZjNTE0Li40MjQ3NmMyIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUv
bGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oDQo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9z
b2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgNCj4gPiBAQCAtMjksNiArMjksNyBAQCBlbnVtIG10a19k
ZHBfY29tcF9pZCB7DQo+ID4gICAgICAgICBERFBfQ09NUE9ORU5UX09WTDAsDQo+ID4gICAgICAg
ICBERFBfQ09NUE9ORU5UX09WTF8yTDAsDQo+ID4gICAgICAgICBERFBfQ09NUE9ORU5UX09WTF8y
TDEsDQo+ID4gKyAgICAgICBERFBfQ09NUE9ORU5UX09WTF8yTDIsDQo+ID4gICAgICAgICBERFBf
Q09NUE9ORU5UX09WTDEsDQo+ID4gICAgICAgICBERFBfQ09NUE9ORU5UX1BXTTAsDQo+ID4gICAg
ICAgICBERFBfQ09NUE9ORU5UX1BXTTEsDQo+ID4gLS0NCj4gPiAxLjguMS4xLmRpcnR5DQo+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlaw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
