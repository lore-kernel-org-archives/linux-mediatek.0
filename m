Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A839C48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 02:29:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B5316139A
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 02:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B5316139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIbztdnPytNjbBIopgVk9rip/n0WUEhafNecD3/gpNQ=; b=fKt9ABqKUaC9qh
	DL/G+2i+XqJIhQdvAFCsjBFdddFoRxVAkKqB71fp7J9QW3+sKZfudUYidednqpIaObvZyVcgIDKyb
	EaNvDqVzXrs1/vw1iJGNnr0VtcfFA5tWDhWhXRlKlt664Z6DsTgHlRroP+Mzl2O1w0Ud67K5S3G/a
	VmQWajTuLjfFK+vI/XffOEV2twecQ9GkDDFoQCX17ao/SF1Jz1EMTYWIqwFXH6HeNYTnN3sfEvJCk
	0LLDRPJ6miAfSB8trqWtuyPf+VQd72E65BJiT+7avKY0YPUAnEW/bF3v5sCheaiQtZ1jKe6Z4EJl3
	r4Y9kYsAmWvOLXahxQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrWvK-003FDV-Dj; Fri, 11 Jun 2021 02:29:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrWvI-003FCw-2S; Fri, 11 Jun 2021 02:29:29 +0000
X-UUID: a1a0b8d3c6264021bbd50cb53f7f696f-20210610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dv+Qz7VgPb4x8JJap2AVvlVH5e24mB3GpvI0kMdk/as=; 
 b=ImfLLzSfXqSsI/W+nq19GD0P+/DtoHMryCGaZU/5JXwuGBUmLLDTpimb8Z0u5sQ4FZRNwa+VleCpiacAu1AOeSc2oMnNaJGlPYoPcCioAoBTvOxTztZFfW64MkMbn2oRtWPEI3MLx+LqkBAmsCvssDNMoqw9jrYUa2U/lh4dQzo=;
X-UUID: a1a0b8d3c6264021bbd50cb53f7f696f-20210610
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 874965157; Thu, 10 Jun 2021 19:29:26 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Jun 2021 19:29:25 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Jun 2021 10:29:21 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Jun 2021 10:29:20 +0800
Message-ID: <1623378559.24490.12.camel@mszsdaap41>
Subject: Re: [PATCH v4 2/3] pwm: mtk-disp: move the commit to clock enabled
From: Jitao Shi <jitao.shi@mediatek.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-pwm@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <eddie.huang@mediatek.com>,
 <cawa.cheng@mediatek.com>, <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>
Date: Fri, 11 Jun 2021 10:29:19 +0800
In-Reply-To: <20210606211457.ya5nbp6fqevuhzwa@pengutronix.de>
References: <20210603100531.161901-1-jitao.shi@mediatek.com>
 <20210603100531.161901-3-jitao.shi@mediatek.com>
 <20210606211457.ya5nbp6fqevuhzwa@pengutronix.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2B4009F64EB28FF746E2C443C376190B28D238414B49AA5C781DE84D5A2B3E672000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_192928_144163_5390E645 
X-CRM114-Status: GOOD (  25.95  )
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

T24gU3VuLCAyMDIxLTA2LTA2IGF0IDIzOjE0ICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToNCj4gT24gVGh1LCBKdW4gMDMsIDIwMjEgYXQgMDY6MDU6MzBQTSArMDgwMCwgSml0YW8gU2hp
IHdyb3RlOg0KPiA+IER1ZSB0byB0aGUgY2xvY2sgc2VxdWVuY2UgY2hhbmdpbmcsIHNvIG1vdmUg
dGhlIHJlZyBjb21taXQgdG8NCj4gDQo+IFdoaWNoIGNoYW5nZSBkbyB5b3UgcmVmZXIgdG8sIGhl
cmU/IFRoZSBwcmV2aW91cyBwYXRjaD8gSWYgc28sIEkgYXNzdW1lDQo+IHRoaXMgbWVhbnMgdGhl
IHNlcmllcyBpcyBub3QgYmlzZWN0YWJsZSBiZWNhdXNlIHRoZSBkcml2ZXIgaXMgYnJva2VuDQo+
IHdoZW4gb25seSB0aGUgZmlyc3QgcGF0Y2ggaXMgYXBwbGllZD8NCj4gDQpZZXMsIHRoaXMgcGF0
Y2ggaXMgZGVwZW5kIHRoZSBwcmV2aW91cyBwYXRjaC4NCkknbGwgc3F1YXNoIGl0IHRvIHRoZSBw
cmV2aW91cyBwYXRjaCBpbiBuZXh0IHZlcnNpb24uDQoNCg0KPiA+IGNvbmZpZygpLg0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4NCj4g
PiAtLS0NCj4gPiAgZHJpdmVycy9wd20vcHdtLW10ay1kaXNwLmMgfCAyMCArKysrKysrLS0tLS0t
LS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlv
bnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLW10ay1kaXNwLmMg
Yi9kcml2ZXJzL3B3bS9wd20tbXRrLWRpc3AuYw0KPiA+IGluZGV4IGI1NzcxZTJjNTRiOC4uYjg3
YjNjMDBhNjg1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tdGstZGlzcC5jDQo+
ID4gKysrIGIvZHJpdmVycy9wd20vcHdtLW10ay1kaXNwLmMNCj4gPiBAQCAtMTM1LDYgKzEzNSwx
MyBAQCBzdGF0aWMgaW50IG10a19kaXNwX3B3bV9jb25maWcoc3RydWN0IHB3bV9jaGlwICpjaGlw
LCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLA0KPiA+ICAJCW10a19kaXNwX3B3bV91cGRhdGVfYml0
cyhtZHAsIG1kcC0+ZGF0YS0+Y29tbWl0LA0KPiA+ICAJCQkJCSBtZHAtPmRhdGEtPmNvbW1pdF9t
YXNrLA0KPiA+ICAJCQkJCSAweDApOw0KPiA+ICsJfSBlbHNlIHsNCj4gDQo+IFlvdSBkcm9wcGVk
IHRoZSBjb2RlIGNvbW1lbnQ/IElzIGl0IHdyb25nPyBPciBpcyBpdCB0b28gb2J2aW91cyB0byBi
ZQ0KPiBtZW50aW9uZWQ/DQo+IA0KDQpJJ2xsIGZpeCB0aGVtIG5leHQgdmVyaXNvbi4NCg0KPiA+
ICsJCW10a19kaXNwX3B3bV91cGRhdGVfYml0cyhtZHAsIG1kcC0+ZGF0YS0+YmxzX2RlYnVnLA0K
PiA+ICsJCQkJCSBtZHAtPmRhdGEtPmJsc19kZWJ1Z19tYXNrLA0KPiA+ICsJCQkJCSBtZHAtPmRh
dGEtPmJsc19kZWJ1Z19tYXNrKTsNCj4gPiArCQltdGtfZGlzcF9wd21fdXBkYXRlX2JpdHMobWRw
LCBtZHAtPmRhdGEtPmNvbjAsDQo+ID4gKwkJCQkJIG1kcC0+ZGF0YS0+Y29uMF9zZWwsDQo+ID4g
KwkJCQkJIG1kcC0+ZGF0YS0+Y29uMF9zZWwpOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiAgCXJldHVy
biAwOw0KPiA+IEBAIC0yMDgsMTkgKzIxNSw2IEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3BfcHdtX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIA0KPiA+ICAJcGxhdGZvcm1f
c2V0X2RydmRhdGEocGRldiwgbWRwKTsNCj4gPiAgDQo+ID4gLQkvKg0KPiA+IC0JICogRm9yIE1U
MjcwMSwgZGlzYWJsZSBkb3VibGUgYnVmZmVyIGJlZm9yZSB3cml0aW5nIHJlZ2lzdGVyDQo+ID4g
LQkgKiBhbmQgc2VsZWN0IG1hbnVhbCBtb2RlIGFuZCB1c2UgUFdNX1BFUklPRC9QV01fSElHSF9X
SURUSC4NCj4gPiAtCSAqLw0KPiA+IC0JaWYgKCFtZHAtPmRhdGEtPmhhc19jb21taXQpIHsNCj4g
PiAtCQltdGtfZGlzcF9wd21fdXBkYXRlX2JpdHMobWRwLCBtZHAtPmRhdGEtPmJsc19kZWJ1ZywN
Cj4gPiAtCQkJCQkgbWRwLT5kYXRhLT5ibHNfZGVidWdfbWFzaywNCj4gPiAtCQkJCQkgbWRwLT5k
YXRhLT5ibHNfZGVidWdfbWFzayk7DQo+ID4gLQkJbXRrX2Rpc3BfcHdtX3VwZGF0ZV9iaXRzKG1k
cCwgbWRwLT5kYXRhLT5jb24wLA0KPiA+IC0JCQkJCSBtZHAtPmRhdGEtPmNvbjBfc2VsLA0KPiA+
IC0JCQkJCSBtZHAtPmRhdGEtPmNvbjBfc2VsKTsNCj4gPiAtCX0NCj4gPiAtDQo+ID4gIAlyZXR1
cm4gMDsNCj4gPiAgfQ0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFV3ZQ0KPiANCg0KQmVzdCBSZWdh
cmRzDQpKaXRhbw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
