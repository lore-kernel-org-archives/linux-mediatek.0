Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD6FC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jun 2022 07:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHPM+Xgpgx3kefDBg2xT163QBJBuJlm18tJR6+yetHc=; b=po1gSJty9iWsCkSEa2rqfWBkfb
	Wa3lv1UW3vn6pFiizBxPMhepCi/y+CSCEJWqmRAU0I9rAFuiIr39CheR/iD3PRiq4F5LC12piloAA
	W94w9islCf4ZzdaeDvpTRgSliIMYKlSeugfBFwIdxRAOq/oVfSRhAkL+ecTVmhFiCoV1chgxkxWHX
	Jrf7YI5jLlvIu0bWP8D9WKkAlh/XpUG+Gjyt72ehWbkx4I9otwrgy0Wi2YZXNgToKtJuE6w05ViOQ
	OeDXM39WJN6Tw+rEHFvcSoSnbR9ouMRawQ4JSLnuuAQdz6Br1EjR+bWVC2+QUE1YN4RmUO1BFgPW8
	BORj6Nvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2pO7-00DSoI-W1; Sun, 19 Jun 2022 07:30:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2pNv-00DSkM-9Q; Sun, 19 Jun 2022 07:30:18 +0000
X-UUID: e184babc49fb47b08b09a766c6c36e6e-20220619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=xHPM+Xgpgx3kefDBg2xT163QBJBuJlm18tJR6+yetHc=;
	b=mW87C9cAol8W3lUgwTzRV4x/U83I4HGeQYOXvZovZK/6LXry0yyorQuRm1fAkaBTBFXWBg2XroRYUkNOFW9W9iw1Ku+qeubRDHL8jUwMO11QItCOQNVwgkDAVTgxjsGZGtSqKazr19Ebq6UPY3Dm6XPLrQBjur1uKGfmAtW1SxE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:c9ddf381-6f96-4f46-aa5c-d885ed098544,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:37080e49-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e184babc49fb47b08b09a766c6c36e6e-20220619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1371468779; Sun, 19 Jun 2022 00:30:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jun 2022 00:30:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sun, 19 Jun 2022 15:30:03 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 19 Jun 2022 15:30:02 +0800
Message-ID: <fbcafb3c519c4d6a914254d8958633a922267cf6.camel@mediatek.com>
Subject: Re: [PATCH v4] soc: mediatek: Add support always on flag
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Min Guo
	<min.guo@mediatek.com>, MandyJH Liu <mandyjh.liu@mediatek.com>, Eddie Hung
	<eddie.hung@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, "Rafael
 J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Date: Sun, 19 Jun 2022 15:30:02 +0800
In-Reply-To: <eb498209-3d5f-b60a-b596-4d3f46b5f9b1@gmail.com>
References: <20220617095841.23031-1-chunfeng.yun@mediatek.com>
	 <eb498209-3d5f-b60a-b596-4d3f46b5f9b1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_003015_381213_90C75392 
X-CRM114-Status: GOOD (  28.64  )
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

T24gRnJpLCAyMDIyLTA2LTE3IGF0IDEzOjUyICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMTcvMDYvMjAyMiAxMTo1OCwgQ2h1bmZlbmcgWXVuIHdyb3RlOg0KPiA+IFRo
ZXJlIGlzIGEgdC1waHkgc2hhcmVkIGJ5IFBDSWUgYW5kIFVTQjMgb24gbXQ4MTk1LCBpZiB0aGUg
dC1waHkgaXMNCj4gPiB1c2VkIGJ5IFBDSWUsIHdoZW4gcG93ZXIgb2ZmIGl0cyBtdGNtb3MsIG5l
ZWQgc29mdHdhcmUgcmVzZXQgaXQNCj4gPiAod29ya2Fyb3VuZCB3YXksIHVzdWFsbHkgaGFyZHdh
cmUgZG8gaXQsIGJ1dCBoYXMgYW4gaXNzdWUgb24NCj4gPiBtdDgxOTUpLA0KPiA+IGJ1dCBpdCBo
YXMgc2lkZSBlZmZlY3QgdG8gVVNCMiBwaHkod29ya3Mgd2l0aCBVU0IzIHBoeSB0byBzdXBwb3J0
DQo+ID4gVVNCMy4yIEdlbjEpLCBzbyBhZGQgc3VwcG9ydCBHRU5QRF9GTEFHX0FMV0FZU19PTiBm
bGFnLCBhbmQgbWFrZQ0KPiA+IGl0cw0KPiA+IHBvd2VyIGFsd2F5cyBvbjsNCj4gPiBBbm90aGVy
IHJlYXNvbiBpcyB0aGF0IFVTQjMuMiBHZW4xLzIgbmVlZCBrZWVwIHBvd2VyIGFsd2F5cyBvbiB3
aGVuDQo+ID4gc3VwcG9ydCBydW50aW1lLXBtIGR1ZSB0byBoYXJkd2FyZSBsaW1pdGF0aW9uIHVu
dGlsIG5vdzsNCj4gPiANCj4gPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVn
bm8gPA0KPiA+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+
IA0KPiBJIGNoYW5nZWQgdGhlIHN1YmplY3QgbGluZSB0byBhZGQgcG0tZG9tYWlucyB0byBpdC4g
QWxzbyBSZXZpZXdlZC1ieQ0KPiB0YWdzIGNvbWUgDQo+IHVuZGVyIHRoZSBwYXRjaCBhdXRob3Ig
U2lnbmVkLW9mZi1ieSB0YWcuDQo+IA0KPiBGb3IgdGhlIG5leHQgdGltZSwgcGxlYXNlIHRyeSB0
byBnZXQgYSBiZXR0ZXIgY29tbWl0IG1lc3NhZ2UuIEl0J3MNCj4gZGlmZmljdWx0IHRvIA0KPiB1
bmRlcnN0YW5kIHdoZW4gcmVhZGluZyB0aGUgZmlyc3QgdGltZS4NCkdvdCBpdCwgdGhhbmtzIGEg
bG90DQoNCj4gDQo+IEFwcGxpZWQsIHRoYW5rcyENCj4gDQo+ID4gLS0tDQo+ID4gdjQ6IGFkZCBy
ZXZpZXdlZC1ieSBBbmdlbG9HaW9hY2NoaW5vDQo+ID4gDQo+ID4gdjM6IG1ha2UgYWx3YXlzLW9u
IGZsYWcgZXhjbHVzaXZlIHdpdGggZGVmdWFsdC1vZmYgZmxhZw0KPiA+IA0KPiA+IHYyOiBrZWVw
IGFjdGl2ZV93YWtldXAgZmxhZyBmb3IgbXQ4MTk1DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL3Nv
Yy9tZWRpYXRlay9tdDgxOTUtcG0tZG9tYWlucy5oIHwgMiArLQ0KPiA+ICAgZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuYyAgICB8IDMgKysrDQo+ID4gICBkcml2ZXJzL3NvYy9t
ZWRpYXRlay9tdGstcG0tZG9tYWlucy5oICAgIHwgMiArKw0KPiA+ICAgMyBmaWxlcyBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXQ4MTk1LXBtLWRvbWFpbnMuaA0KPiA+IGIvZHJpdmVycy9z
b2MvbWVkaWF0ZWsvbXQ4MTk1LXBtLWRvbWFpbnMuaA0KPiA+IGluZGV4IDkzOGY0ZDUxZjVhZS4u
MDUyOWQxMzBiNjc1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ODE5
NS1wbS1kb21haW5zLmgNCj4gPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdDgxOTUtcG0t
ZG9tYWlucy5oDQo+ID4gQEAgLTY3LDcgKzY3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzY3Bz
eXNfZG9tYWluX2RhdGENCj4gPiBzY3BzeXNfZG9tYWluX2RhdGFfbXQ4MTk1W10gPSB7DQo+ID4g
ICAJCS5jdGxfb2ZmcyA9IDB4MzM0LA0KPiA+ICAgCQkucHdyX3N0YV9vZmZzID0gMHgxNzQsDQo+
ID4gICAJCS5wd3Jfc3RhMm5kX29mZnMgPSAweDE3OCwNCj4gPiAtCQkuY2FwcyA9IE1US19TQ1BE
X0FDVElWRV9XQUtFVVAsDQo+ID4gKwkJLmNhcHMgPSBNVEtfU0NQRF9BQ1RJVkVfV0FLRVVQIHwg
TVRLX1NDUERfQUxXQVlTX09OLA0KPiA+ICAgCX0sDQo+ID4gICAJW01UODE5NV9QT1dFUl9ET01B
SU5fQ1NJX1JYX1RPUF0gPSB7DQo+ID4gICAJCS5uYW1lID0gImNzaV9yeF90b3AiLA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG0tZG9tYWlucy5jDQo+ID4gYi9k
cml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG0tZG9tYWlucy5jDQo+ID4gaW5kZXggNWNlZDI1NGIw
ODJiLi5hM2RhZTM5MWEzOGEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXRrLXBtLWRvbWFpbnMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbS1k
b21haW5zLmMNCj4gPiBAQCAtNDI4LDYgKzQyOCw5IEBAIGdlbmVyaWNfcG1fZG9tYWluICpzY3Bz
eXNfYWRkX29uZV9kb21haW4oc3RydWN0DQo+ID4gc2Nwc3lzICpzY3BzeXMsIHN0cnVjdCBkZXZp
Y2Vfbm8NCj4gPiAgIAkJCWRldl9lcnIoc2Nwc3lzLT5kZXYsICIlcE9GOiBmYWlsZWQgdG8gcG93
ZXIgb24NCj4gPiBkb21haW46ICVkXG4iLCBub2RlLCByZXQpOw0KPiA+ICAgCQkJZ290byBlcnJf
cHV0X3N1YnN5c19jbG9ja3M7DQo+ID4gICAJCX0NCj4gPiArDQo+ID4gKwkJaWYgKE1US19TQ1BE
X0NBUFMocGQsIE1US19TQ1BEX0FMV0FZU19PTikpDQo+ID4gKwkJCXBkLT5nZW5wZC5mbGFncyB8
PSBHRU5QRF9GTEFHX0FMV0FZU19PTjsNCj4gPiAgIAl9DQo+ID4gICANCj4gPiAgIAlpZiAoc2Nw
c3lzLT5kb21haW5zW2lkXSkgew0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstcG0tZG9tYWlucy5oDQo+ID4gYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG0tZG9t
YWlucy5oDQo+ID4gaW5kZXggZGFhMjRlODkwZGQ0Li43ZDNjMGMzNjMxNmMgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuaA0KPiA+ICsrKyBiL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1wbS1kb21haW5zLmgNCj4gPiBAQCAtOCw2ICs4LDggQEAN
Cj4gPiAgICNkZWZpbmUgTVRLX1NDUERfU1JBTV9JU08JCUJJVCgyKQ0KPiA+ICAgI2RlZmluZSBN
VEtfU0NQRF9LRUVQX0RFRkFVTFRfT0ZGCUJJVCgzKQ0KPiA+ICAgI2RlZmluZSBNVEtfU0NQRF9E
T01BSU5fU1VQUExZCQlCSVQoNCkNCj4gPiArLyogY2FuJ3Qgc2V0IE1US19TQ1BEX0tFRVBfREVG
QVVMVF9PRkYgYXQgdGhlIHNhbWUgdGltZSAqLw0KPiA+ICsjZGVmaW5lIE1US19TQ1BEX0FMV0FZ
U19PTgkJQklUKDUpDQo+ID4gICAjZGVmaW5lIE1US19TQ1BEX0NBUFMoX3NjcGQsIF94KQkoKF9z
Y3BkKS0+ZGF0YS0+Y2FwcyAmIChfeCkpDQo+ID4gICANCj4gPiAgICNkZWZpbmUgU1BNX1ZERV9Q
V1JfQ09OCQkJMHgwMjEwDQo=


