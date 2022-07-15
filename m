Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 06:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lMPSiecQ48Rg6s4sQrvj4L6tg3nOXo5j9SvFC61igQ=; b=sKkLloZXcTSOcsbq1zrq5rsDN9
	khFdlO5FaU2QorpeNbbUf6gfCxFkS9XBOKsuOA/7naJTZlMZfwOKwzP3Nr+lY77Xzawpgd0fgKk3f
	8ap4bo82VMIEjJCNoOXA9VoSMaGMVD+MbrJbBbcx53SEP5RmWc4h2FikuVjYMiyPC4zck5BZ3Uw4z
	6GAMjoMXV09V/S1jp/1egtoTLT7ZT8nVmQvYg6FpnBXBWvUAIrbdZXl1o5sQOS/ZplSfZeAtIiasT
	T2d/IqHZreUHuYhP3HlVG9KkX1cWcAabxTALgZ5epYrcHzGWGl9758n+WhOh7imZ5VPA7tgbTC+xm
	SNgwwKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCF6X-004hoe-HA; Fri, 15 Jul 2022 06:47:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCF2J-004g9s-Qd; Fri, 15 Jul 2022 06:42:55 +0000
X-UUID: 9b5b44a3e1fa4deeb56deb96a2e4adb2-20220714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=/lMPSiecQ48Rg6s4sQrvj4L6tg3nOXo5j9SvFC61igQ=;
	b=PfsHB+O2Zjk/2Li7XDXABDMX2ndQBgD5EyDV02CP5lkEpvk8Zbqy4tkSWCQlFyaOe04AZy4MPi9krfzN9+H7RSkyEjdPZgAha8i/ZAJJkH5YgsgnT2F7pbCtaiTx+T0y2xrXPxMVGBYVlfGG5UAxdX2Z4e7OC+6dE7jEsfd2MkU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:7bd89aec-d152-47ec-8918-277d5bcf4152,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:9d730f33-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9b5b44a3e1fa4deeb56deb96a2e4adb2-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 632567408; Thu, 14 Jul 2022 23:42:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 15 Jul 2022 14:32:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 15 Jul 2022 14:32:05 +0800
Message-ID: <1267b234b09280b9b475cfe2bb32580e967e2dac.camel@mediatek.com>
Subject: Re: [for-next][PATCH 13/23] USB: mtu3: tracing: Use the new
 __vstring() helper
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Steven Rostedt <rostedt@goodmis.org>, <linux-kernel@vger.kernel.org>
CC: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
Date: Fri, 15 Jul 2022 14:32:05 +0800
In-Reply-To: <20220714164330.311734558@goodmis.org>
References: <20220714164256.403842845@goodmis.org>
	 <20220714164330.311734558@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_234251_937560_73F4E399 
X-CRM114-Status: GOOD (  18.24  )
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

SGkgU3RldmVuLA0KDQpPbiBUaHUsIDIwMjItMDctMTQgYXQgMTI6NDMgLTA0MDAsIFN0ZXZlbiBS
b3N0ZWR0IHdyb3RlOg0KPiBGcm9tOiAiU3RldmVuIFJvc3RlZHQgKEdvb2dsZSkiIDxyb3N0ZWR0
QGdvb2RtaXMub3JnPg0KPiANCj4gSW5zdGVhZCBvZiBvcGVuIGNvZGluZyBhIF9fZHluYW1pY19h
cnJheSgpIHdpdGggYSBmaXhlZCBsZW5ndGggKHdoaWNoDQo+IGRlZmVhdHMgdGhlIHB1cnBvc2Ug
b2YgdGhlIGR5bmFtaWMgYXJyYXkgaW4gdGhlIGZpcnN0IHBsYWNlKS4gVXNlIHRoZQ0KPiBuZXcN
Cj4gX192c3RyaW5nKCkgaGVscGVyIHRoYXQgd2lsbCB1c2UgYSB2YV9saXN0IGFuZCBvbmx5IHdy
aXRlIGVub3VnaCBvZg0KPiB0aGUNCj4gc3RyaW5nIGludG8gdGhlIHJpbmcgYnVmZmVyIHRoYXQg
aXMgbmVlZGVkLg0KPiANCj4gTGluazogDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19o
dHRwczovL2xrbWwua2VybmVsLm9yZy9yLzIwMjIwNzA1MjI0NzUwLjM1NDkyNjUzNUBnb29kbWlz
Lm9yZ19fOyEhQ1RSTktBOXdNZzBBUmJ3IXc4bng2NkJLRFR0eXVzcDVpMnB5ek9HTmItUXl4SUFX
am9ad21TUVkwenpvcl9ycXZCZ1VtNV9fdktLOThBcEtjRGljJA0KPiAgDQo+IA0KPiBDYzogQ2h1
bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KPiBDYzogSW5nbyBNb2xuYXIg
PG1pbmdvQGtlcm5lbC5vcmc+DQo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5k
YXRpb24ub3JnPg0KPiBDYzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZw0KPiBDYzogbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IENjOiBsaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnDQo+IEFja2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4gUm9zdGVkdCAoR29v
Z2xlKSA8cm9zdGVkdEBnb29kbWlzLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9tdHUzL210
dTNfdHJhY2UuaCB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9tdHUzL210dTNf
dHJhY2UuaA0KPiBiL2RyaXZlcnMvdXNiL210dTMvbXR1M190cmFjZS5oDQo+IGluZGV4IDFiODk3
NjM2ZGFmMi4uZWYzYzE3ZTJmOGE2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9tdHUzL210
dTNfdHJhY2UuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9tdHUzL210dTNfdHJhY2UuaA0KPiBAQCAt
MjUsMTEgKzI1LDExIEBAIFRSQUNFX0VWRU5UKG10dTNfbG9nLA0KPiAgCVRQX0FSR1MoZGV2LCB2
YWYpLA0KPiAgCVRQX1NUUlVDVF9fZW50cnkoDQo+ICAJCV9fc3RyaW5nKG5hbWUsIGRldl9uYW1l
KGRldikpDQo+IC0JCV9fZHluYW1pY19hcnJheShjaGFyLCBtc2csIE1UVTNfTVNHX01BWCkNCj4g
KwkJX192c3RyaW5nKG1zZywgdmFmLT5mbXQsIHZhZi0+dmEpDQo+ICAJKSwNCj4gIAlUUF9mYXN0
X2Fzc2lnbigNCj4gIAkJX19hc3NpZ25fc3RyKG5hbWUsIGRldl9uYW1lKGRldikpOw0KPiAtCQl2
c25wcmludGYoX19nZXRfc3RyKG1zZyksIE1UVTNfTVNHX01BWCwgdmFmLT5mbXQsICp2YWYtDQo+
ID52YSk7DQo+ICsJCV9fYXNzaWduX3ZzdHIobXNnLCB2YWYtPmZtdCwgdmFmLT52YSk7DQo+ICAJ
KSwNCj4gIAlUUF9wcmludGsoIiVzOiAlcyIsIF9fZ2V0X3N0cihuYW1lKSwgX19nZXRfc3RyKG1z
ZykpDQo+ICApOw0KDQpDYW4geW91IGhlbHAgdG8gcmVtb3ZlIG1hY3JvICJNVFUzX01TR19NQVgi
IGFuZCBvbmUgYmxhbmsgbGluZSBhZnRlciBpdA0KaW4gdGhpcyBmaWxlLCB0aGlzIG1hY3JvIGlz
IG5vdCB1c2VkIGFueW1vcmUgYWZ0ZXIgYXBwbHkgdGhpcyBwYXRjaC4NCg0KVGhhbmtzIGEgbG90
DQoNCg0K


