Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F85C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 07:03:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 780AF236F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 07:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 780AF236F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oGARl7I8KGTRAa8S5tXYZp+Ilfhv4tjeOkeNWBDCwmk=; b=SQNMOu95zHONIZsLQ6NWBiWnN
	F3zA3z1LMDerEDh7sI94YO8etpjG+5GX03jUbIp0bUkoZGYHXC8WuDc8ayQ2ovCWC5pM9WWrSNPwA
	VOjbrvB8I6FrhBN1XOEfmRrIUTEqcJpjQ1CoceYzJD7AVlPDVPigH3HiIKBXztbaeRRibfE/pSAWl
	4WjBxjXws2GVuRnH6UBItrNhJLK447sk9LMcgIdlAK7CD8DQDYySJ+vpyXfonIh4WFm13jSJTxfRw
	UtVKOQsHqpGiFpnfHnp0nSlEtCOKKDgh/brDnVgT8YWNzhI6QlqYf5DH//SQE2+A2amt7CSskVauU
	Vjp0saVZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2qTo-0007z1-0P; Fri, 22 Jan 2021 07:03:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2qTk-0007yR-HH; Fri, 22 Jan 2021 07:03:33 +0000
X-UUID: e8179f9ba6054e1d9da7a498ef9fc8fb-20210121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fL/MgIC+7IuxEDr3pIYZFZ1fLaM2nU+O0q+PZiXufQc=; 
 b=pO6xDPyrA7TculZOrJ1gQhGXF2BC3gjgTqyjdusMKYRq5bkLdWDZGZTlN50BsFiXsSPdwpGQIzqN3wtLyBsBmrCuENx4OiooCwRtuqTN2Lsa6L48e2wrdIt3fdBGQE2FfMIN/PWvlIBtrXdl760Uv+rSiPyiyqKMv7lbAb0hEMA=;
X-UUID: e8179f9ba6054e1d9da7a498ef9fc8fb-20210121
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mingchuang.qiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 644758739; Thu, 21 Jan 2021 23:03:24 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 23:03:22 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Jan 2021 15:03:12 +0800
Received: from [10.19.240.15] (10.19.240.15) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Jan 2021 15:03:11 +0800
Message-ID: <1611298991.5980.42.camel@mcddlt001>
Subject: Re: [PATCH v2] PCI: Re-enable downstream port LTR if it was
 previously enabled
From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Date: Fri, 22 Jan 2021 15:03:11 +0800
In-Reply-To: <20210121223139.GA2698934@bjorn-Precision-5520>
References: <20210121223139.GA2698934@bjorn-Precision-5520>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2CD612E64180C9CBC7FBC648089FF19836C607A61BD963F52342411B2B02F6712000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_020332_756054_6E41B672 
X-CRM114-Status: GOOD (  34.60  )
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
Cc: linux-pci@vger.kernel.org, lambert.wang@mediatek.com,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, Alex
 Williamson <alex.williamson@redhat.com>, linux-mediatek@lists.infradead.org,
 Utkarsh H Patel <utkarsh.h.patel@intel.com>, haijun.liu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIxLTAxLTIxIGF0IDE2OjMxIC0wNjAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOg0K
PiBbK2NjIEFsZXggYW5kIE1pbmdjaHVhbmcgZXQgYWwgZnJvbQ0KPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjEwMTEyMDcyNzM5LjMxNjI0LTEtbWluZ2NodWFuZy5xaWFvQG1lZGlhdGVr
LmNvbV0NCj4gDQo+IE9uIFR1ZSwgSmFuIDE5LCAyMDIxIGF0IDA0OjE0OjEwUE0gKzAzMDAsIE1p
a2EgV2VzdGVyYmVyZyB3cm90ZToNCj4gPiBQQ0llIHI1LjAsIHNlYyA3LjUuMy4xNiBzYXlzIHRo
YXQgdGhlIGRvd25zdHJlYW0gcG9ydHMgbXVzdCByZXNldCB0aGUNCj4gPiBMVFIgZW5hYmxlIGJp
dCBpZiB0aGUgbGluayBnb2VzIGRvd24gKHBvcnQgZ29lcyBETF9Eb3duIHN0YXR1cykuIE5vdywg
aWYNCj4gPiB3ZSBoYWQgTFRSIHByZXZpb3VzbHkgZW5hYmxlZCBhbmQgdGhlIFBDSWUgZW5kcG9p
bnQgZ2V0cyBob3QtcmVtb3ZlZCBhbmQNCj4gPiB0aGVuIGhvdC1hZGRlZCBiYWNrIHRoZSAtPmx0
cl9wYXRoIG9mIHRoZSBkb3duc3RyZWFtIHBvcnQgaXMgc3RpbGwgc2V0DQo+ID4gYnV0IHRoZSBw
b3J0IG5vdyBkb2VzIG5vdCBoYXZlIHRoZSBMVFIgZW5hYmxlIGJpdCBzZXQgYW55bW9yZS4NCj4g
PiANCj4gPiBGb3IgdGhpcyByZWFzb24gY2hlY2sgaWYgdGhlIGJyaWRnZSB1cHN0cmVhbSBoYWQg
TFRSIGVuYWJsZWQgcHJldmlvdXNseQ0KPiA+IGFuZCByZS1lbmFibGUgaXQgYmVmb3JlIGVuYWJs
aW5nIExUUiBmb3IgdGhlIGVuZHBvaW50Lg0KPiA+IA0KPiA+IFJlcG9ydGVkLWJ5OiBVdGthcnNo
IEggUGF0ZWwgPHV0a2Fyc2guaC5wYXRlbEBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
TWlrYSBXZXN0ZXJiZXJnIDxtaWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29tPg0KPiANCj4g
SSB0aGluayB0aGlzIGFuZCBNaW5nY2h1YW5nJ3MgcGF0Y2gsIHdoaWNoIGlzIGVzc2VudGlhbGx5
IGlkZW50aWNhbCwNCj4gYXJlIHJpZ2h0IGFuZCBzb2x2ZXMgdGhlIHByb2JsZW0gZm9yIGhvdC1y
ZW1vdmUvaG90LWFkZC4gIEluIHRoYXQNCj4gc2NlbmFyaW8gd2UgY2FsbCBwY2lfY29uZmlndXJl
X2x0cigpIG9uIHRoZSBob3QtYWRkZWQgZGV2aWNlLCBhbmQNCj4gd2l0aCB0aGlzIHBhdGNoLCB3
ZSdsbCByZS1lbmFibGUgTFRSIG9uIHRoZSBicmlkZ2UgbGVhZGluZyB0byB0aGUgbmV3DQo+IGRl
dmljZSBiZWZvcmUgZW5hYmxpbmcgTFRSIG9uIHRoZSBuZXcgZGV2aWNlIGl0c2VsZi4NCj4gDQo+
IEJ1dCBkb24ndCB3ZSBoYXZlIGEgc2ltaWxhciBwcm9ibGVtIGlmIHdlIHNpbXBseSBkbyBhIEZ1
bmRhbWVudGFsDQo+IFJlc2V0IG9uIGEgZGV2aWNlPyAgSSB0aGluayB0aGUgcmVzZXQgcGF0aCB3
aWxsIHJlc3RvcmUgdGhlIGRldmljZSdzDQo+IHN0YXRlLCBpbmNsdWRpbmcgUENJX0VYUF9ERVZD
VEwyLCBidXQgaXQgZG9lc24ndCBkbyBhbnl0aGluZyB3aXRoIHRoZQ0KPiB1cHN0cmVhbSBicmlk
Z2UsIGRvZXMgaXQ/DQo+IA0KDQpZZXMuIEkgdGhpbmsgdGhlIHNhbWUgcHJvYmxlbSBleGlzdHMg
dW5kZXIgc3VjaCBzY2VuYXJpbywgYW5kIHRoYXTigJlzIHRoZQ0KaXNzdWUgbXkgcGF0Y2ggaW50
ZW5kcyB0byByZXNvbHZlLg0KSSBhbHNvIHByZXBhcmVkIGEgdjIgcGF0Y2ggZm9yIHJldmlldyh1
cGRhdGUgdGhlIHBhdGNoIGRlc2NyaXB0aW9uKS4NClNoYWxsIEkgc3VibWl0IHRoZSB2MiBwYXRj
aCBmb3IgcmV2aWV3Pw0KDQo+IFNvIGlmIGEgYnJpZGdlIGFuZCBhIGRldmljZSBiZWxvdyBpdCBi
b3RoIGhhdmUgTFRSIGVuYWJsZWQsIGNhbid0IHdlDQo+IGhhdmUgdGhlIGZvbGxvd2luZzoNCj4g
DQo+ICAgLSBicmlkZ2UgTFRSIGVuYWJsZWQNCj4gICAtIGRldmljZSBMVFIgZW5hYmxlZA0KPiAg
IC0gcmVzZXQgZGV2aWNlLCBlLmcuLCB2aWEgU2Vjb25kYXJ5IEJ1cyBSZXNldA0KPiAgIC0gbGlu
ayBnb2VzIGRvd24sIGJyaWRnZSBkaXNhYmxlcyBMVFINCj4gICAtIGxpbmsgY29tZXMgYmFjayB1
cCwgTFRSIGRpc2FibGVkIGluIGJvdGggYnJpZGdlIGFuZCBkZXZpY2UNCj4gICAtIHJlc3RvcmUg
ZGV2aWNlIHN0YXRlLCBpbmNsdWRpbmcgTFRSIGVuYWJsZQ0KPiAgIC0gZGV2aWNlIHNlbmRzIExU
UiBtZXNzYWdlDQo+ICAgLSBicmlkZ2UgcmVwb3J0cyBVbnN1cHBvcnRlZCBSZXF1ZXN0DQo+IA0K
PiA+IC0tLQ0KPiA+IFByZXZpb3VzIHZlcnNpb24gY2FuIGJlIGZvdW5kIGhlcmU6DQo+ID4gDQo+
ID4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAyMTAxMTQxMzQ3MjQuNzk1
MTEtMS1taWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29tLw0KPiA+IA0KPiA+IENoYW5nZXMg
ZnJvbSB0aGUgcHJldmlvdXMgdmVyc2lvbjoNCj4gPiANCj4gPiAgICogQ29ycmVjdGVkIHR5cG9z
IGluIHRoZSBjb21taXQgbWVzc2FnZQ0KPiA+ICAgKiBObyBuZWVkIHRvIGNhbGwgcGNpZV9kb3du
c3RyZWFtX3BvcnQoKQ0KPiA+IA0KPiA+ICBkcml2ZXJzL3BjaS9wcm9iZS5jIHwgMTcgKysrKysr
KysrKysrKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvcHJvYmUuYyBiL2Ry
aXZlcnMvcGNpL3Byb2JlLmMNCj4gPiBpbmRleCAwZWI2OGI0NzM1NGYuLmE0YThjMDMwNWZiOSAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BjaS9wcm9iZS5jDQo+ID4gKysrIGIvZHJpdmVycy9w
Y2kvcHJvYmUuYw0KPiA+IEBAIC0yMTUzLDcgKzIxNTMsNyBAQCBzdGF0aWMgdm9pZCBwY2lfY29u
ZmlndXJlX2x0cihzdHJ1Y3QgcGNpX2RldiAqZGV2KQ0KPiA+ICB7DQo+ID4gICNpZmRlZiBDT05G
SUdfUENJRUFTUE0NCj4gPiAgCXN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmhvc3QgPSBwY2lfZmlu
ZF9ob3N0X2JyaWRnZShkZXYtPmJ1cyk7DQo+ID4gLQlzdHJ1Y3QgcGNpX2RldiAqYnJpZGdlOw0K
PiA+ICsJc3RydWN0IHBjaV9kZXYgKmJyaWRnZSA9IE5VTEw7DQo+ID4gIAl1MzIgY2FwLCBjdGw7
DQo+ID4gIA0KPiA+ICAJaWYgKCFwY2lfaXNfcGNpZShkZXYpKQ0KPiA+IEBAIC0yMTkxLDYgKzIx
OTEsMjEgQEAgc3RhdGljIHZvaWQgcGNpX2NvbmZpZ3VyZV9sdHIoc3RydWN0IHBjaV9kZXYgKmRl
dikNCj4gPiAgCWlmIChwY2lfcGNpZV90eXBlKGRldikgPT0gUENJX0VYUF9UWVBFX1JPT1RfUE9S
VCB8fA0KPiA+ICAJICAgICgoYnJpZGdlID0gcGNpX3Vwc3RyZWFtX2JyaWRnZShkZXYpKSAmJg0K
PiA+ICAJICAgICAgYnJpZGdlLT5sdHJfcGF0aCkpIHsNCj4gPiArCQkvKg0KPiA+ICsJCSAqIERv
d25zdHJlYW0gcG9ydHMgcmVzZXQgdGhlIExUUiBlbmFibGUgYml0IHdoZW4gdGhlDQo+ID4gKwkJ
ICogbGluayBnb2VzIGRvd24gKGUuZyBvbiBob3QtcmVtb3ZlKSBzbyByZS1lbmFibGUgdGhlDQo+
ID4gKwkJICogYml0IGhlcmUgaWYgbm90IHNldCBhbnltb3JlLg0KPiA+ICsJCSAqIFBDSWUgcjUu
MCwgc2VjIDcuNS4zLjE2Lg0KPiA+ICsJCSAqLw0KPiA+ICsJCWlmIChicmlkZ2UpIHsNCj4gPiAr
CQkJcGNpZV9jYXBhYmlsaXR5X3JlYWRfZHdvcmQoYnJpZGdlLCBQQ0lfRVhQX0RFVkNUTDIsICZj
dGwpOw0KPiA+ICsJCQlpZiAoIShjdGwgJiBQQ0lfRVhQX0RFVkNUTDJfTFRSX0VOKSkgew0KPiA+
ICsJCQkJcGNpX2RiZyhicmlkZ2UsICJyZS1lbmFibGluZyBMVFJcbiIpOw0KPiA+ICsJCQkJcGNp
ZV9jYXBhYmlsaXR5X3NldF93b3JkKGJyaWRnZSwgUENJX0VYUF9ERVZDVEwyLA0KPiA+ICsJCQkJ
CQkJIFBDSV9FWFBfREVWQ1RMMl9MVFJfRU4pOw0KPiA+ICsJCQl9DQo+ID4gKwkJfQ0KPiA+ICsJ
CXBjaV9kYmcoZGV2LCAiZW5hYmxpbmcgTFRSXG4iKTsNCj4gPiAgCQlwY2llX2NhcGFiaWxpdHlf
c2V0X3dvcmQoZGV2LCBQQ0lfRVhQX0RFVkNUTDIsDQo+ID4gIAkJCQkJIFBDSV9FWFBfREVWQ1RM
Ml9MVFJfRU4pOw0KPiA+ICAJCWRldi0+bHRyX3BhdGggPSAxOw0KPiA+IC0tIA0KPiA+IDIuMjku
Mg0KPiA+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
