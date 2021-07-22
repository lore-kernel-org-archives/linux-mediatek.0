Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C52C6377A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 01:15:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE23561263
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 01:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE23561263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZN4M8xwVJuEf8o1RD520vTnyw6Jmj42tC0uC7Gojuw=; b=ZQl3soa2AxXZt1
	XcGNweLs71T9BcwzFrq9sQpLl7XqEcuiOk3xmkOAH489UAtSkTsh1cmr451wceLBSBJe0h3JptHms
	S2DCVzEr8GFNwI982OE6cBx4NpyoF/YUSL04vIglNSkhG2HM4C1mzLx56H5fB9wqW6cBFYiwFHILH
	Y4RZ+4Sw2+/luj1FqZRhTK353mk6ljw4ZPWcpgtzVfC87EyiRIlCAREd1niaFYstlzdzp3iiaNWU7
	6ASda/H0xraMca6F4Y78HVQiCFdSZ1tnr4DPPHFFsK3cD5dvlh+rMwo6n3/nfuPM1E9AmpOUcTwfK
	kKpEZxppi5IdPXEH43sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6NIe-00HVzF-0Y; Thu, 22 Jul 2021 01:14:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6NIZ-00HVyZ-4f; Thu, 22 Jul 2021 01:14:54 +0000
X-UUID: a0e669bc26e54c9cb8f93bbc3a41cf27-20210721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VrQri8WDK/48NMtogyItmm1VhOlw9XydHnEGh0wF9Js=; 
 b=eaS6uouNpnlkkALkATgDsqHy2T/zgr1Fs5v2Gb1MvXePViqJdTrBAUNsI7wq/nnPP3pOHW82uS2yIV4Kq0k8IyaNKTnhVh13yPxlt8be2EWUY2A9X8Em/Op5S6ESC+9h+mHYWrbxBRTbAth9QduYzUReU73OgkViVyTukhiXoEA=;
X-UUID: a0e669bc26e54c9cb8f93bbc3a41cf27-20210721
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1493713054; Wed, 21 Jul 2021 18:14:41 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Jul 2021 18:14:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 08:59:35 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Jul 2021 08:59:35 +0800
Message-ID: <033556bb26bc9d27061854e343994d690e8134d5.camel@mediatek.com>
Subject: Re: [PATCH v1 01/10] dt-bindings: mediatek: add pseudo-ovl
 definition for mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Thu, 22 Jul 2021 08:59:35 +0800
In-Reply-To: <CAAOTY_9h9wHNKfd0X3pbdEs6nfHm2cwQJrh3isAi0_etf9JD5w@mail.gmail.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
 <20210717090408.28283-2-nancy.lin@mediatek.com>
 <CAAOTY_9h9wHNKfd0X3pbdEs6nfHm2cwQJrh3isAi0_etf9JD5w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_181452_659585_379513CD 
X-CRM114-Status: GOOD (  27.73  )
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

SGkgQ2h1bi1LdWFuZywNCg0KT24gTW9uLCAyMDIxLTA3LTE5IGF0IDA3OjIyICswODAwLCBDaHVu
LUt1YW5nIEh1IHdyb3RlOg0KPiBIaSwgTmFuY3k6DQo+IA0KPiBOYW5jeS5MaW4gPG5hbmN5Lmxp
bkBtZWRpYXRlay5jb20+IOaWvCAyMDIx5bm0N+aciDE35pelIOmAseWFrSDkuIvljYg1OjA05a+r
6YGT77yaDQo+ID4gDQo+ID4gMS4gQWRkIHBzZXVkby1vdmwgZGVmaW5pdGlvbiBmaWxlIGZvciBt
dDgxOTUgZGlzcGxheS4NCj4gPiAyLiBBZGQgbWVkaWF0ZWsscHNldWRvLW92bC55YW1sIHRvIGRl
Y3JpYmUgcHNldWRvLW92bCBtb2R1bGUgaW4NCj4gPiBkZXRhaWxzLg0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IE5hbmN5LkxpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4g
PiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC55YW1sICAgICAgIHwgICA1ICsN
Cj4gPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscHNldWRvLW92bC55YW1sIHwgMTA1
DQo+ID4gKysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTEwIGluc2Vy
dGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscHNldWRvLQ0KPiA+IG92
bC55YW1sDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC4NCj4gPiB5YW1sDQo+
ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkaXNwLg0KPiA+IHlhbWwNCj4gPiBpbmRleCBhYWMxNzk2ZTNmNmIuLmJiNmQyODU3
MmI0OCAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AuDQo+ID4geWFtbA0KPiA+ICsrKw0K
PiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZGlzcC4NCj4gPiB5YW1sDQo+ID4gQEAgLTIzMCw2ICsyMzAsMTEgQEAgcHJvcGVy
dGllczoNCj4gPiAgICAgICAgLSBpdGVtczoNCj4gPiAgICAgICAgICAgIC0gY29uc3Q6IG1lZGlh
dGVrLG10ODE3My1kaXNwLW9kDQo+ID4gDQo+ID4gKyAgICAgICMgUFNFVURPLU9WTDogc2VlDQo+
ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWsscHNldWRvLQ0KPiA+IG92bC55YW1sDQo+ID4gKyAgICAgICMgZm9yIGRldGFpbHMuDQo+
ID4gKyAgICAgIC0gaXRlbXM6DQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgx
OTUtZGlzcC1wc2V1ZG8tb3ZsDQo+ID4gKw0KPiA+ICAgIHJlZzoNCj4gPiAgICAgIGRlc2NyaXB0
aW9uOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgZnVuY3Rpb24NCj4g
PiBibG9jayByZWdpc3RlciBzcGFjZS4NCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxw
c2V1ZA0KPiA+IG8tb3ZsLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHBzZXVkDQo+ID4gby1vdmwueWFtbA0KPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi45MDU5ZDk2Y2U3
MGUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxwc2V1ZA0KPiA+IG8tb3Zs
LnlhbWwNCj4gPiBAQCAtMCwwICsxLDEwNSBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArJVlBTUwgMS4yDQo+ID4g
Ky0tLQ0KPiA+ICskaWQ6IA0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHBzZXVkby1v
dmwueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3ITFfMWs1amRaMFZLNDZJY3RTanQ2M2lxMVVN
V1NyQXc4Y1Y5N1cxQm1vbmZ1cVBuWVdCZzhSXy1CWnVQRlNLQmskDQo+ID4gIA0KPiA+ICskc2No
ZW1hOiANCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyExXzFrNWpk
WjBWSzQ2SWN0U2p0NjNpcTFVTVdTckF3OGNWOTdXMUJtb25mdXFQbllXQmc4Ul8tQlpnTWFWTl9L
JA0KPiA+ICANCj4gPiArDQo+ID4gK3RpdGxlOiBtZWRpYXRlayBwc2V1ZG8gb3ZsIERldmljZSBU
cmVlIEJpbmRpbmdzDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIENLIEh1IDxj
ay5odUBtZWRpYXRlay5jb20+DQo+ID4gKyAgLSBOYW5jeS5MaW4gPG5hbmN5LmxpbkBtZWRpYXRl
ay5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIFRoZSBNZWRpYXRlayBw
c2V1ZG8gb3ZsIGZ1bmN0aW9uIGJsb2NrIGlzIGNvbXBvc2VkIG9mIGVpZ2h0IFJETUENCj4gPiBh
bmQNCj4gPiArICBmb3VyIE1FUkdFIGRldmljZXMuIEl0J3MgZW5jYXBzdWxhdGVkIGFzIGFuIG92
ZXJsYXkgZGV2aWNlLA0KPiA+IHdoaWNoIHN1cHBvcnRzDQo+ID4gKyAgNCBsYXllcnMuDQo+ID4g
Kw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBvbmVPZjoN
Cj4gPiArICAgICAgIyBwc2V1ZG8gb3ZsIGNvbnRyb2xsZXINCj4gPiArICAgICAgLSBpdGVtczoN
Cj4gPiArICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5NS1kaXNwLXBzZXVkby1vdmwN
Cj4gPiArICAgICAgIyBSRE1BOiByZWFkIERNQQ0KPiA+ICsgICAgICAtIGl0ZW1zOg0KPiA+ICsg
ICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTk1LXZkbzEtcmRtYQ0KPiA+ICsgICAgICAj
IE1FUkdFOiBtZXJnZSBzdHJlYW1zIGZyb20gdHdvIFJETUEgc291cmNlcw0KPiA+ICsgICAgICAt
IGl0ZW1zOg0KPiA+ICsgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTk1LXZkbzEtbWVy
Z2UNCj4gPiArICByZWc6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsgIGludGVycnVwdHM6
DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsgIGlvbW11czoNCj4gPiArICAgIGRlc2NyaXB0
aW9uOiBUaGUgY29tcGF0aWJsZSBwcm9wZXJ0eSBpcyBETUEgZnVuY3Rpb24gYmxvY2tzLg0KPiA+
ICsgICAgICBTaG91bGQgcG9pbnQgdG8gdGhlIHJlc3BlY3RpdmUgSU9NTVUgYmxvY2sgd2l0aCBt
YXN0ZXIgcG9ydA0KPiA+IGFzIGFyZ3VtZW50LA0KPiA+ICsgICAgICBzZWUNCj4gPiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvbWVkaWF0ZWssaW9tbXUueWFtbCBmb3IN
Cj4gPiArICAgICAgZGV0YWlscy4NCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKyAgY2xvY2tz
Og0KPiA+ICsgICAgbWF4SXRlbXM6IDINCj4gPiArICBjbG9jay1uYW1lczoNCj4gPiArICAgIG1h
eEl0ZW1zOiAyDQo+ID4gKyAgcG93ZXItZG9tYWluczoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+
ID4gKyAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWc6DQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5DQo+ID4gKyAgICBkZXNjcmlwdGlv
bjogVGhlIHJlZ2lzdGVyIG9mIGRpc3BsYXkgZnVuY3Rpb24gYmxvY2sgdG8gYmUgc2V0DQo+ID4g
YnkgZ2NlLg0KPiA+ICsgICAgICBUaGVyZSBhcmUgNCBhcmd1bWVudHMgaW4gdGhpcyBwcm9wZXJ0
eSwgZ2NlIG5vZGUsIHN1YnN5cyBpZCwNCj4gPiBvZmZzZXQgYW5kDQo+ID4gKyAgICAgIHJlZ2lz
dGVyIHNpemUuIFRoZSBzdWJzeXMgaWQgaXMgZGVmaW5lZCBpbiB0aGUgZ2NlIGhlYWRlciBvZg0K
PiA+IGVhY2ggY2hpcHMNCj4gPiArICAgICAgaW5jbHVkZS9pbmNsdWRlL2R0LWJpbmRpbmdzL2dj
ZS88Y2hpcD4tZ2NlLmgsIG1hcHBpbmcgdG8gdGhlDQo+ID4gcmVnaXN0ZXIgb2YNCj4gPiArICAg
ICAgZGlzcGxheSBmdW5jdGlvbiBibG9jay4NCj4gPiArDQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0g
aWY6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4g
PiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAgICBjb25zdDoNCj4gPiArICAg
ICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5NS12ZG8xLW1lcmdlDQo+ID4gKw0KPiA+ICsgICAg
dGhlbjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjbG9ja3M6DQo+ID4g
KyAgICAgICAgICBpdGVtczoNCj4gPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogbWVyZ2Ug
Y2xvY2sNCj4gPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogbWVyZ2UgYXN5bmMgY2xvY2sN
Cj4gPiArICAgICAgICBjbG9jay1uYW1lczoNCj4gPiArICAgICAgICAgIGl0ZW1zOg0KPiA+ICsg
ICAgICAgICAgICAtIGNvbnN0OiBtZXJnZQ0KPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBtZXJn
ZV9hc3luYw0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4g
KyAgLSByZWcNCj4gPiArICAtIGNsb2Nrcw0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArDQo+ID4g
KyAgICB2ZG8xX3JkbWFAMWMxMDQwMDAgew0KPiA+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE5NS12ZG8xLXJkbWEiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgIm1lZGlhdGVrLG10ODE5NS1kaXNwLXBzZXVkby1vdmwiOw0KPiANCj4gRG8gbm90IGNyZWF0
ZSBwc2V1ZG8gb3IgdmlydHVhbCBkZXZpY2UsIHNvIGp1c3QgbGVhdmUgdGhlDQo+ICJtZWRpYXRl
ayxtdDgxOTUtdmRvMS1yZG1hIi4NCj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQo+IA0K
T0ssIEkgd2lsbCByZW1vdmUgaXQuDQoNCj4gPiArICAgICAgICAgICAgcmVnID0gPDAgMHgxYzEw
NDAwMCAwIDB4MTAwMD47DQo+ID4gKyAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA0
OTUgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsNCj4gPiArICAgICAgICAgICAgY2xvY2tzID0gPCZ2
ZG9zeXMxIENMS19WRE8xX01EUF9SRE1BMD47DQo+ID4gKyAgICAgICAgICAgIHBvd2VyLWRvbWFp
bnMgPSA8JnNwbSBNVDgxOTVfUE9XRVJfRE9NQUlOX1ZET1NZUzE+Ow0KPiA+ICsgICAgICAgICAg
ICBpb21tdXMgPSA8JmlvbW11X3ZkbyBNNFVfUE9SVF9MMl9NRFBfUkRNQTA+Ow0KPiA+ICsgICAg
ICAgICAgICBtZWRpYXRlayxnY2UtY2xpZW50LXJlZyA9IDwmZ2NlMSBTVUJTWVNfMWMxMFhYWFgN
Cj4gPiAweDQwMDAgMHgxMDAwPjsNCj4gPiArICAgIH07DQo+ID4gKw0KPiA+ICsgICAgZGlzcF92
cHBfbWVyZ2VAMWMxMGMwMDAgew0KPiA+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE5NS12ZG8xLW1lcmdlIjsNCj4gPiArICAgICAgICAgICAgcmVnID0gPDAgMHgxYzEw
YzAwMCAwIDB4MTAwMD47DQo+ID4gKyAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA1
MDMgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsNCj4gPiArICAgICAgICAgICAgY2xvY2tzID0gPCZ2
ZG9zeXMxIENMS19WRE8xX1ZQUF9NRVJHRTA+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICA8
JnZkb3N5czEgQ0xLX1ZETzFfTUVSR0UwX0RMX0FTWU5DPjsNCj4gPiArICAgICAgICAgICAgY2xv
Y2stbmFtZXMgPSAibWVyZ2UiLCJtZXJnZV9hc3luYyI7DQo+ID4gKyAgICAgICAgICAgIHBvd2Vy
LWRvbWFpbnMgPSA8JnNwbSBNVDgxOTVfUE9XRVJfRE9NQUlOX1ZET1NZUzE+Ow0KPiA+ICsgICAg
ICAgICAgICBtZWRpYXRlayxnY2UtY2xpZW50LXJlZyA9IDwmZ2NlMSBTVUJTWVNfMWMxMFhYWFgN
Cj4gPiAweGMwMDAgMHgxMDAwPjsNCj4gPiArICAgIH07DQo+ID4gKw0KPiA+ICsuLi4NCj4gPiAt
LQ0KPiA+IDIuMTguMA0KPiA+IA0KDQpSZWdhcmRzLA0KTmFuY3kgTGluDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
