Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6424FC47088
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:51:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B16CE613E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B16CE613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:CC:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sMAZ5wtMMM/C+FFYpR49o2PVaMqXmdS42XcqQu3nZY=; b=1U1cR/U0YHlgu2
	Bp/Wus2PWvfiKIwO3skqfdFAQ0StOJlo7VbcPJzdB1R4z2RlCRHxpXKGu63ksYids8mtB/fy6IHGB
	nateNzsYkITpM/DAcwt++uZtpb3OuGQYNrVCFWf6cNn6oKtosSScWDG/s0zfliB6nRBWahP/VT4Jj
	mtH4Vrk7ERU0pLyf23raJrUm2Qs2wBAizpWM4gb94LTnQ37uG12fX2fHp9njUYrN0dzzVt9JJgNpZ
	ym2jpjeQnUG9US9wJxqCHEn7i/q6qRJefZFc2Io8ud06vg6YmBnBI6T7QGwmzjF5Tqlozt5teKM9u
	EbMcLSjmmXRnJUbBkLcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llnOI-00BlWG-2c; Wed, 26 May 2021 06:51:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llnOF-00BlUA-ME; Wed, 26 May 2021 06:51:41 +0000
X-UUID: 352cf593f3f044f896513d54840958bf-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=VSijLJMJY/rgjRyjiGZ+4Lhjs7svu6Wpeo2O29kjuu0=; 
 b=MlGwiC7E9Y1cAGW7yhiL+nYINdgJ6V+vZYjru601Wmv9aQ17kKJNPpGE8/L3FSvwtvpRTzL5SAcurOSH0qfTHXiASNLttcBT37C35DvZKfH9joEZF8joqc1gILz2eZJaN7PiI4EBJuZ98Tr9Ej0BAHip9cTSvLtUwvEArdMtUcA=;
X-UUID: 352cf593f3f044f896513d54840958bf-20210525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 247446361; Tue, 25 May 2021 23:51:32 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 23:51:30 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 May 2021 14:51:28 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 May 2021 14:51:27 +0800
Message-ID: <1622011887.21671.2.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] mailbox: mtk-cmdq: Remove cmdq_cb_status
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, "Bibby
 Hsieh" <bibby.hsieh@mediatek.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Date: Wed, 26 May 2021 14:51:27 +0800
In-Reply-To: <CAAOTY_-SdjB5yTxwABLdrYgr+PpbbCnKhTPskBYwcQDeCCxvhQ@mail.gmail.com>
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
 <20210314233323.23377-2-chunkuang.hu@kernel.org>
 <CAAOTY_-SdjB5yTxwABLdrYgr+PpbbCnKhTPskBYwcQDeCCxvhQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B54DB735DC0DF86290610CC6963C5B4F764EED6796D1CA1EDAD6909AD56B60B82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_235139_763786_A0148B3F 
X-CRM114-Status: GOOD (  19.80  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

DQpSZXZpZXdlZC1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+
DQoNCk9uIFdlZCwgMjAyMS0wNS0yNiBhdCAxNDoxNSArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90
ZToNCj4gKyBZb25ncWlhbmcNCj4gDQo+IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJu
ZWwub3JnPiDmlrwgMjAyMeW5tDPmnIgxNeaXpSDpgLHkuIAg5LiK5Y2INzozM+Wvq+mBk++8mg0K
PiA+DQo+ID4gY21kcV9jYl9zdGF0dXMgaXMgYW4gZXJyb3Igc3RhdHVzLiBVc2UgdGhlIHN0YW5k
YXJkIGVycm9yIG51bWJlcg0KPiA+IGluc3RlYWQgb2YgY21kcV9jYl9zdGF0dXMgdG8gcHJldmVu
dCBzdGF0dXMgZHVwbGljYXRpb24uDQo+ID4NCj4gPiBDYzogSmFzc2kgQnJhciA8amFzc2lzaW5n
aGJyYXJAZ21haWwuY29tPg0KPiA+IENjOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dA
Z21haWwuY29tPg0KPiA+IENjOiBIb3Vsb25nIFdlaSA8aG91bG9uZy53ZWlAbWVkaWF0ZWsuY29t
Pg0KPiA+IENjOiBCaWJieSBIc2llaCA8YmliYnkuaHNpZWhAbWVkaWF0ZWsuY29tPg0KPiA+IENj
OiBEZW5uaXMgWUMgSHNpZWggPGRlbm5pcy15Yy5oc2llaEBtZWRpYXRlay5jb20+DQo+ID4gQ2M6
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gPiBDYzogbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcNCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2Vy
bmVsLm9yZz4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3gu
YyAgICAgICB8IDEwICsrKysrLS0tLS0NCj4gPiAgaW5jbHVkZS9saW51eC9tYWlsYm94L210ay1j
bWRxLW1haWxib3guaCB8ICA3ICstLS0tLS0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgYi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFp
bGJveC5jDQo+ID4gaW5kZXggNTY2NWI2ZWE4MTE5Li4zZDM3YzFjZDQwZjEgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiA+ICsrKyBiL2RyaXZl
cnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gPiBAQCAtMTgwLDcgKzE4MCw3IEBAIHN0
YXRpYyBib29sIGNtZHFfdGhyZWFkX2lzX2luX3dmZShzdHJ1Y3QgY21kcV90aHJlYWQgKnRocmVh
ZCkNCj4gPiAgICAgICAgIHJldHVybiByZWFkbCh0aHJlYWQtPmJhc2UgKyBDTURRX1RIUl9XQUlU
X1RPS0VOKSAmIENNRFFfVEhSX0lTX1dBSVRJTkc7DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0aWMg
dm9pZCBjbWRxX3Rhc2tfZXhlY19kb25lKHN0cnVjdCBjbWRxX3Rhc2sgKnRhc2ssIGVudW0gY21k
cV9jYl9zdGF0dXMgc3RhKQ0KPiA+ICtzdGF0aWMgdm9pZCBjbWRxX3Rhc2tfZXhlY19kb25lKHN0
cnVjdCBjbWRxX3Rhc2sgKnRhc2ssIGludCBzdGEpDQo+ID4gIHsNCj4gPiAgICAgICAgIHN0cnVj
dCBjbWRxX3Rhc2tfY2IgKmNiID0gJnRhc2stPnBrdC0+YXN5bmNfY2I7DQo+ID4gICAgICAgICBz
dHJ1Y3QgY21kcV9jYl9kYXRhIGRhdGE7DQo+ID4gQEAgLTI0NCwxMCArMjQ0LDEwIEBAIHN0YXRp
YyB2b2lkIGNtZHFfdGhyZWFkX2lycV9oYW5kbGVyKHN0cnVjdCBjbWRxICpjbWRxLA0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGN1cnJfdGFzayA9IHRhc2s7DQo+ID4NCj4gPiAgICAgICAg
ICAgICAgICAgaWYgKCFjdXJyX3Rhc2sgfHwgY3Vycl9wYSA9PSB0YXNrX2VuZF9wYSAtIENNRFFf
SU5TVF9TSVpFKSB7DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgY21kcV90YXNrX2V4ZWNf
ZG9uZSh0YXNrLCBDTURRX0NCX05PUk1BTCk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y21kcV90YXNrX2V4ZWNfZG9uZSh0YXNrLCAwKTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBrZnJlZSh0YXNrKTsNCj4gPiAgICAgICAgICAgICAgICAgfSBlbHNlIGlmIChlcnIpIHsNCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICBjbWRxX3Rhc2tfZXhlY19kb25lKHRhc2ssIENNRFFf
Q0JfRVJST1IpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNtZHFfdGFza19leGVjX2Rv
bmUodGFzaywgLUVOT0VYRUMpOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNtZHFfdGFz
a19oYW5kbGVfZXJyb3IoY3Vycl90YXNrKTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBr
ZnJlZSh0YXNrKTsNCj4gPiAgICAgICAgICAgICAgICAgfQ0KPiA+IEBAIC00MTUsNyArNDE1LDcg
QEAgc3RhdGljIHZvaWQgY21kcV9tYm94X3NodXRkb3duKHN0cnVjdCBtYm94X2NoYW4gKmNoYW4p
DQo+ID4NCj4gPiAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSh0YXNrLCB0bXAsICZ0
aHJlYWQtPnRhc2tfYnVzeV9saXN0LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxpc3RfZW50cnkpIHsNCj4gPiAtICAgICAgICAgICAgICAgY21kcV90YXNrX2V4ZWNfZG9u
ZSh0YXNrLCBDTURRX0NCX0VSUk9SKTsNCj4gPiArICAgICAgICAgICAgICAgY21kcV90YXNrX2V4
ZWNfZG9uZSh0YXNrLCAtRUNPTk5BQk9SVEVEKTsNCj4gPiAgICAgICAgICAgICAgICAga2ZyZWUo
dGFzayk7DQo+ID4gICAgICAgICB9DQo+ID4NCj4gPiBAQCAtNDUzLDcgKzQ1Myw3IEBAIHN0YXRp
YyBpbnQgY21kcV9tYm94X2ZsdXNoKHN0cnVjdCBtYm94X2NoYW4gKmNoYW4sIHVuc2lnbmVkIGxv
bmcgdGltZW91dCkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaXN0X2Vu
dHJ5KSB7DQo+ID4gICAgICAgICAgICAgICAgIGNiID0gJnRhc2stPnBrdC0+YXN5bmNfY2I7DQo+
ID4gICAgICAgICAgICAgICAgIGlmIChjYi0+Y2IpIHsNCj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICBkYXRhLnN0YSA9IENNRFFfQ0JfRVJST1I7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgZGF0YS5zdGEgPSAtRUNPTk5BQk9SVEVEOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IGRhdGEuZGF0YSA9IGNiLT5kYXRhOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNiLT5j
YihkYXRhKTsNCj4gPiAgICAgICAgICAgICAgICAgfQ0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oIGIvaW5jbHVkZS9saW51eC9tYWlsYm94
L210ay1jbWRxLW1haWxib3guaA0KPiA+IGluZGV4IGQ1YTk4M2Q2NWYwNS4uMmY3ZDlhMzdkNjEx
IDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94
LmgNCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oDQo+
ID4gQEAgLTY1LDEzICs2NSw4IEBAIGVudW0gY21kcV9jb2RlIHsNCj4gPiAgICAgICAgIENNRFFf
Q09ERV9MT0dJQyA9IDB4YTAsDQo+ID4gIH07DQo+ID4NCj4gPiAtZW51bSBjbWRxX2NiX3N0YXR1
cyB7DQo+ID4gLSAgICAgICBDTURRX0NCX05PUk1BTCA9IDAsDQo+ID4gLSAgICAgICBDTURRX0NC
X0VSUk9SDQo+ID4gLX07DQo+ID4gLQ0KPiA+ICBzdHJ1Y3QgY21kcV9jYl9kYXRhIHsNCj4gPiAt
ICAgICAgIGVudW0gY21kcV9jYl9zdGF0dXMgICAgIHN0YTsNCj4gPiArICAgICAgIGludCAgICAg
ICAgICAgICAgICAgICAgIHN0YTsNCj4gPiAgICAgICAgIHZvaWQgICAgICAgICAgICAgICAgICAg
ICpkYXRhOw0KPiA+ICB9Ow0KPiA+DQo+ID4gLS0NCj4gPiAyLjE3LjENCj4gPg0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
