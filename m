Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED5CC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 18:00:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1112E6108F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 18:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1112E6108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5pvotxg4OFKsmsl5L4h0SGv4n+vBxTIyvkDIinEk0o=; b=q2HHxG4bYOLVzR
	MnGIiAp+T1YYPtz/7yD+SkfaITviMn0qzuQPwA0MK074+Xtt+DdY8kNM4gGMUw42Q1xd5I3TamUR7
	j6/NYKxs4uQFPvO33VPf+M+EOf3ZgYCLQNwKlEzjeNTgqp1Xr0MOzuxuEp+w16cherRCnnogu7BeF
	qg4oDt6qEskPcx9+EsSIVRV4+mo7eSCXB/xP+KCenbITvHSIOC0l0h1IRAzLGBT297/4/nWI4RCDk
	BbrX/5zAcWWw2+RDrZiko19fJi+ae79bhCse6ijfbAYoR8w0qvPkkaWcNvk2tu1jpTgjG+n7Lo8bD
	pBcgczjqeYoqapONLczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIaic-004Hqa-Uj; Tue, 24 Aug 2021 18:00:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIahy-004HdL-G2; Tue, 24 Aug 2021 17:59:38 +0000
X-UUID: 30978a0668354341b543fd4b5ed53373-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ECQLI5+vw1UTM2shwxDUmHF5DAhtSRUHapFpM4DAFzg=; 
 b=sgdqL4PmFebk7GnWibxDkCtpMfH/KR+vbr8bDVCIU5vmPmC3rkC+DkFkfiwI6HFgapHD0cL5BotFhlj4qKmhWxeK60HO5WC/vqv4nra9mGOU+gJFT/uWabMcGuCgxL5sbZGrf9j5uyA+11JDyYuvwFXqSO54TdoBg1n78jkcfLo=;
X-UUID: 30978a0668354341b543fd4b5ed53373-20210824
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 955907969; Tue, 24 Aug 2021 10:59:31 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 10:59:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 01:59:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 01:59:28 +0800
Message-ID: <27c7b466b6197c9bdb0ced778b77981881a08162.camel@mediatek.com>
Subject: Re: [PATCH v8 03/13] dt-bindings: mediatek: add mediatek,dsc.yaml
 for mt8195 SoC binding
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <fshao@chromium.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>, "Hsin-Yi
 Wang" <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, DTML <devicetree@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Wed, 25 Aug 2021 01:59:27 +0800
In-Reply-To: <CAAOTY_9BUZ3x01FXY=UKmcrqGxmP7bfpqyz7zCJXK=+2xUhrYA@mail.gmail.com>
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-4-jason-jh.lin@mediatek.com>
 <CAAOTY_9BUZ3x01FXY=UKmcrqGxmP7bfpqyz7zCJXK=+2xUhrYA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_105934_595288_DECBAC9C 
X-CRM114-Status: GOOD (  27.89  )
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

SGkgQ2h1bi1LdWFuZywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiBTdW4sIDIwMjEt
MDgtMjIgYXQgMDc6MTQgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6DQo+IEhpLCBKYXNvbjoN
Cj4gDQo+IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjHl
ubQ45pyIMTnml6Ug6YCx5ZubIOS4iuWNiDEwOjIz5a+r6YGT77yaDQo+ID4gDQo+ID4gMS4gQWRk
IG1lZGlhdGVrLGRzYy55YW1sIHRvIGRlc2NyaWJlIERTQyBtb2R1bGUgaW4gZGV0YWlscy4NCj4g
PiAyLiBBZGQgbXQ4MTk1IFNvQyBiaW5kaW5nIHRvIG1lZGlhdGVrLGRzYy55YW1sLg0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNv
bT4NCj4gPiAtLS0NCj4gPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwg
ICAgICAgIHwgNjkNCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA2OSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzYy55
YW0NCj4gPiBsDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnkNCj4gPiBhbWwN
Cj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLGRzYy55DQo+ID4gYW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBp
bmRleCAwMDAwMDAwMDAwMDAuLmY5NGE5NWM2YTFjNQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiAr
KysNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRzYy55DQo+ID4gYW1sDQo+ID4gQEAgLTAsMCArMSw2OSBAQA0KPiA+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkN
Cj4gPiArJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IA0KPiA+IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRzYy55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchMnF3dkpuRlRnSnpm
azFuME9WWHFHbFBqWWNvMmJCVVp0V0Z6YjRuOGd6SFh5RkZKWjdNVDRRV080UkR6bkhtU1d5aU8k
DQo+ID4gIA0KPiA+ICskc2NoZW1hOiANCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5L
QTl3TWcwQVJidyEycXd2Sm5GVGdKemZrMW4wT1ZYcUdsUGpZY28yYkJVWnRXRnpiNG44Z3pIWHlG
RkpaN01UNFFXTzRSRHpuTkMxdzdGWCQNCj4gPiAgDQo+ID4gKw0KPiA+ICt0aXRsZTogbWVkaWF0
ZWsgZGlzcGxheSBEU0MgY29udHJvbGxlcg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4g
KyAgLSBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KPiANCj4gQWNjb3JkaW5nIHRvIFsxXSwg
dGhlIG1haW50YWluZXIgc2hvdWxkIGJlDQo+IA0KPiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4sIFBoaWxpcHAgWmFiZWwgPA0KPiBwLnphYmVsQHBlbmd1dHJvbml4LmRl
Pg0KPiANCj4gWzFdIA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93d3cu
a2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9tYWludGFpbmVycy5odG1sX187ISFD
VFJOS0E5d01nMEFSYnchMnF3dkpuRlRnSnpmazFuME9WWHFHbFBqWWNvMmJCVVp0V0Z6YjRuOGd6
SFh5RkZKWjdNVDRRV080UkR6bk1keDd0QWUkDQo+ICANCk9LLCBJJ2xsIGZpeCBpdCBhbmQgYWxz
byB0aGUgW1BBVENIIHY4IDAyLzEzXSBpbiB0aGlzIHNlcmllcy4NCg0KUmVnYXJkcywNCkphc29u
LUpILkxpbg0KPiANCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gKyAgVGhlIERTQyBz
dGFuZGFyZCBpcyBhIHNwZWNpZmljYXRpb24gb2YgdGhlIGFsZ29yaXRobXMgdXNlZCBmb3INCj4g
PiArICBjb21wcmVzc2luZyBhbmQgZGVjb21wcmVzc2luZyBpbWFnZSBkaXNwbGF5IHN0cmVhbXMs
IGluY2x1ZGluZw0KPiA+ICsgIHRoZSBzcGVjaWZpY2F0aW9uIG9mIHRoZSBzeW50YXggYW5kIHNl
bWFudGljcyBvZiB0aGUgY29tcHJlc3NlZA0KPiA+ICsgIHZpZGVvIGJpdCBzdHJlYW0uIERTQyBp
cyBkZXNpZ25lZCBmb3IgcmVhbC10aW1lIHN5c3RlbXMgd2l0aA0KPiA+ICsgIHJlYWwtdGltZSBj
b21wcmVzc2lvbiwgdHJhbnNtaXNzaW9uLCBkZWNvbXByZXNzaW9uIGFuZCBEaXNwbGF5Lg0KPiA+
ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgb25lT2Y6
DQo+ID4gKyAgICAgIC0gaXRlbXM6DQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxt
dDgxOTUtZGlzcC1kc2MNCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4SXRlbXM6IDEN
Cj4gPiArDQo+ID4gKyAgaW50ZXJydXB0czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0K
PiA+ICsgIGNsb2NrczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiBEU0MgV3JhcHBlciBDbG9jaw0KPiA+ICsNCj4gPiArICBwb3dlci1kb21haW5zOg0KPiA+ICsg
ICAgZGVzY3JpcHRpb246IEEgcGhhbmRsZSBhbmQgUE0gZG9tYWluIHNwZWNpZmllciBhcyBkZWZp
bmVkIGJ5DQo+ID4gYmluZGluZ3Mgb2YNCj4gPiArICAgICAgdGhlIHBvd2VyIGNvbnRyb2xsZXIg
c3BlY2lmaWVkIGJ5IHBoYW5kbGUuIFNlZQ0KPiA+ICsgICAgICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcG93ZXIvcG93ZXItZG9tYWluLnlhbWwNCj4gPiBmb3IgZGV0YWlscy4N
Cj4gPiArDQo+ID4gKyAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWc6DQo+ID4gKyAgICAgIGRlc2Ny
aXB0aW9uOg0KPiA+ICsgICAgICAgIFRoZSByZWdpc3RlciBvZiBkaXNwbGF5IGZ1bmN0aW9uIGJs
b2NrIHRvIGJlIHNldCBieSBnY2UuDQo+ID4gVGhlcmUgYXJlIDQgYXJndW1lbnRzLA0KPiA+ICsg
ICAgICAgIHN1Y2ggYXMgZ2NlIG5vZGUsIHN1YnN5cyBpZCwgb2Zmc2V0IGFuZCByZWdpc3RlciBz
aXplLiBUaGUNCj4gPiBzdWJzeXMgaWQgdGhhdCBpcw0KPiA+ICsgICAgICAgIG1hcHBpbmcgdG8g
dGhlIHJlZ2lzdGVyIG9mIGRpc3BsYXkgZnVuY3Rpb24gYmxvY2tzIGlzDQo+ID4gZGVmaW5lZCBp
biB0aGUgZ2NlIGhlYWRlcg0KPiA+ICsgICAgICAgIGluY2x1ZGUvaW5jbHVkZS9kdC1iaW5kaW5n
cy9nY2UvPGNoaXA+LWdjZS5oIG9mIGVhY2gNCj4gPiBjaGlwcy4NCj4gPiArICAgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQ0KPiA+ICsgICAg
ICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxl
DQo+ID4gKyAgLSByZWcNCj4gPiArICAtIGludGVycnVwdHMNCj4gPiArICAtIHBvd2VyLWRvbWFp
bnMNCj4gPiArICAtIGNsb2Nrcw0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZh
bHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArDQo+ID4gKyAgICBk
c2MwOiBkaXNwX2RzY193cmFwQDFjMDA5MDAwIHsNCj4gPiArICAgICAgICBjb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE5NS1kaXNwLWRzYyI7DQo+ID4gKyAgICAgICAgcmVnID0gPDAgMHgxYzAw
OTAwMCAwIDB4MTAwMD47DQo+ID4gKyAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDY0NSBJ
UlFfVFlQRV9MRVZFTF9ISUdIIDA+Ow0KPiA+ICsgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNw
bSBNVDgxOTVfUE9XRVJfRE9NQUlOX1ZET1NZUzA+Ow0KPiA+ICsgICAgICAgIGNsb2NrcyA9IDwm
dmRvc3lzMCBDTEtfVkRPMF9EU0NfV1JBUDA+Ow0KPiA+ICsgICAgICAgIG1lZGlhdGVrLGdjZS1j
bGllbnQtcmVnID0gPCZnY2UxIFNVQlNZU18xYzAwWFhYWCAweDkwMDANCj4gPiAweDEwMDA+Ow0K
PiA+ICsgICAgfTsNCj4gPiArDQo+ID4gLS0NCj4gPiAyLjE4LjANCj4gPiANCi0tIA0KSmFzb24t
SkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
