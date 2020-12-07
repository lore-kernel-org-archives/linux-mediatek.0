Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2344C4361B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 13:54:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C2223444
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 13:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C2223444
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BG3ZsxWT7aacO0APrqe7iWuzbCRi2gi/h2csmBmrhJA=; b=WFom6KUF7QdtC5nMLk+iaYkCK
	mp6tVDicE+ul4jVI8WitA7sTxxIWDsC9p08pY6g9Jq4FtfKShaZXTMFX6q1n4mzoi9nnsQnApOQkD
	S1G0Y4aF4Ylai4I5/oVFe+O5nYhpdcbT5b44f/vwCu/hkp1bOxkoHgURRTQlehw+ZWsVQWO29V4y0
	nBADnnwhqRg1akU19OmZRCItpqTETDE6aCUGOJ0SSKIj9s8meFMIFEL6c+lA2281D5qV030KUZsr/
	vGkD90LRtP3cdzpjMU/uGHXaE/cKEc4ctsDfjYGTu5WxNpekSOoDR8kvHTXo0+QiZHNbsp1tM+KCL
	vOzgMGJ8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmGxw-0006Zw-AL; Mon, 07 Dec 2020 13:54:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmGxq-0006VQ-OP; Mon, 07 Dec 2020 13:54:08 +0000
X-UUID: 0bde7f114b15499780dc96767d916092-20201207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4Ii3UID8fse2i4ieiqVMLnoGaYyiqaOaZASNr1fmU3o=; 
 b=CuO11Iff6rYrBhIN5hgz70qM7QtKLODbhYYcSUfzZZ4nk1nachc+L4g8e1riCv2kxxMSt15PFauTT+S2m7Ko0k1E5aiFLlNZSpjWtZjx3ubcvwnMtBxloYVO2flFrxiU8qqZ4KiVcM4yQVKTjxcFIdOLScZyWMz9qrLsq7Tx/DU=;
X-UUID: 0bde7f114b15499780dc96767d916092-20201207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 605849067; Mon, 07 Dec 2020 05:53:57 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Dec 2020 05:43:54 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Dec 2020 21:43:38 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Dec 2020 21:43:38 +0800
Message-ID: <1607348620.3580.18.camel@mtkswgap22>
Subject: Re: [PATCH] scsi: ufs: Enable WB flush during suspend only if WB is
 enabled
From: Stanley Chu <stanley.chu@mediatek.com>
To: Bean Huo <huobean@gmail.com>
Date: Mon, 7 Dec 2020 21:43:40 +0800
In-Reply-To: <062aa9e8f37c2e50032241ff8ddc1dcbc8051ba9.camel@gmail.com>
References: <20201207055006.24471-1-stanley.chu@mediatek.com>
 <062aa9e8f37c2e50032241ff8ddc1dcbc8051ba9.camel@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_085407_009889_B3F90BDD 
X-CRM114-Status: GOOD (  24.83  )
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
Cc: jiajie.hao@mediatek.com, alice.chao@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQmVhbiwNCg0KT24gTW9uLCAyMDIwLTEyLTA3IGF0IDExOjU5ICswMTAwLCBCZWFuIEh1byB3
cm90ZToNCj4gT24gTW9uLCAyMDIwLTEyLTA3IGF0IDEzOjUwICswODAwLCBTdGFubGV5IENodSB3
cm90ZToNCj4gPiBXcml0ZUJvb3RzZXIgZmx1c2ggZHVyaW5nIHN1c3BlbmQgaXMgbm90IG5lY2Vz
c2FyeSB0byBiZSBlbmFibGVkIGlmDQo+ID4gV3JpdGVCb29zdGVyIGZlYXR1cmUgaXMgZGlzYWJs
ZWQuIFNpbXBseSBhZGRpbmcgYSBjaGVjayB0byBwcmV2ZW50DQo+ID4gdW5leHBlY3RlZCBwb3dl
ciBkcmFpbi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGFubGV5IENodSA8c3RhbmxleS5j
aHVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3Njc2kvdWZzL3Vmc2hjZC5j
IHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zY3NpL3Vmcy91ZnNoY2QuYyBiL2Ry
aXZlcnMvc2NzaS91ZnMvdWZzaGNkLmMNCj4gPiBpbmRleCA0ODc5ZTg3NTc3ZTEuLjg5ZmE4Yjlh
YzExZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3Njc2kvdWZzL3Vmc2hjZC5jDQo+ID4gKysr
IGIvZHJpdmVycy9zY3NpL3Vmcy91ZnNoY2QuYw0KPiA+IEBAIC01NDU4LDcgKzU0NTgsNyBAQCBz
dGF0aWMgYm9vbCB1ZnNoY2Rfd2JfbmVlZF9mbHVzaChzdHJ1Y3QgdWZzX2hiYQ0KPiA+ICpoYmEp
DQo+ID4gICAgICAgICB1MzIgYXZhaWxfYnVmOw0KPiA+ICAgICAgICAgdTggaW5kZXg7DQo+ID4g
IA0KPiA+IC0gICAgICAgaWYgKCF1ZnNoY2RfaXNfd2JfYWxsb3dlZChoYmEpKQ0KPiA+ICsgICAg
ICAgaWYgKCF1ZnNoY2RfaXNfd2JfYWxsb3dlZChoYmEpIHx8ICFoYmEtPndiX2VuYWJsZWQpDQo+
ID4gICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gPiAgICAgICAgIC8qDQo+ID4gICAg
ICAgICAgKiBUaGUgdWZzIGRldmljZSBuZWVkcyB0aGUgdmNjIHRvIGJlIE9OIHRvIGZsdXNoLg0K
PiANCj4gDQo+IEhpIFN0YW5sZXkNCj4gDQo+IEluIHRoZSAzLjEgU3BlYzoNCj4gDQo+ICJJZiB0
aGUgZldyaXRlQm9vc3RlckVuIGZsYWcgaXMgc2V0IHRvIHplcm8sIGRhdGEgd3JpdHRlbiB0byBh
bnkNCj4gbG9naWNhbCB1bml0IGlzIHdyaXR0ZW4gaW4gbm9ybWFsIHN0b3JhZ2UuDQo+IElmIHRo
ZSBmV3JpdGVCb29zdGVyRW4gZmxhZyBpcyBzZXQgdG8gb25lIGFuZCB0aGUgZGV2aWNlIGlzIGNv
bmZpZ3VyZWQNCj4gaW4g4oCcc2hhcmVkIGJ1ZmZlcuKAnSBtb2RlLCBkYXRhIHdyaXR0ZW4gdG8g
YW55IGxvZ2ljYWwgdW5pdCBpcyB3cml0dGVuIGluDQo+IHRoZSBzaGFyZWQgV3JpdGVCb29zdGVy
IEJ1ZmZlci4iDQo+IA0KPiBzbywgSU1PLCBmV3JpdGVCb29zdGVyRW4gaXMgaW5kZXBlbmRhbnQg
d2l0aCBXQiBidWZmZXIgZmx1c2guDQo+IA0KPiBhcyBmb3IgdGhlIGZsdXNoOg0KPiANCj4gIlRo
ZXJlIGFyZSB0d28gbWV0aG9kcyBmb3IgZmx1c2hpbmcgZGF0YSBmcm9tIHRoZSBXcml0ZUJvb3N0
ZXIgQnVmZmVyDQo+IHRvIHRoZSBub3JtYWwgc3RvcmFnZTogb25lIGlzIHVzaW5nIGFuIGV4cGxp
Y2l0IGZsdXNoIGNvbW1hbmQsIHRoZQ0KPiBvdGhlciBlbmFibGluZyB0aGUgZmx1c2hpbmcgZHVy
aW5nIGxpbmsgaGliZXJuYXRlIHN0YXRlLiBJZiB0aGUNCj4gZldyaXRlQm9vc3RlckJ1ZmZlckZs
dXNoRW4gZmxhZyBpcyBzZXQgdG8gb25lLCB0aGUgZGV2aWNlIHNoYWxsIGZsdXNoDQo+IHRoZSBk
YXRhIHN0b3JlZCBpbiB0aGUgV3JpdGVCb29zdGVyIEJ1ZmZlciB0byB0aGUgbm9ybWFsIHN0b3Jh
Z2UuIElmDQo+IGZXcml0ZUJvb3N0ZXJCdWZmZXJGbHVzaER1cmluZ0hpYmVybmF0ZSBpcyBzZXQg
dG8gb25lLCB0aGUgZGV2aWNlDQo+IGZsdXNoZXMgdGhlIFdyaXRlQm9vc3RlciBCdWZmZXIgZGF0
YSBhdXRvbWF0aWNhbGx5IHdoZW5ldmVyIHRoZSBsaW5rDQo+IGVudGVycyB0aGUgaGliZXJuYXRl
IChISUJFUk44KSBzdGF0ZS4iDQo+IA0KPiBJTU8sIGZvciB0aGUgZmx1c2gsIGl0IGlzIGNvbnRy
b2xsZWQgYnkgZldyaXRlQm9vc3RlckJ1ZmZlckZsdXNoRW4gYW5kDQo+IGZXcml0ZUJvb3N0ZXJC
dWZmZXJGbHVzaER1cmluZ0hpYmVybmF0ZS4NCj4gDQo+IGhvdyBkbyB5b3UgdW5kZXJzdGFuZCB0
aGUgYWJvdmUgdHdvIHBhcmFncmFwaHMgZnJvbSBTcGVjPw0KDQpUaGFua3MgZm9yIHlvdXIgcmV2
aWV3IGFuZCBmZWVkYmFjayEgOiApDQoNCkFjdHVhbGx5IHRoaXMgcGF0Y2ggaXMgbm90IG1vdGl2
YXRlZCBieSBhbnkgbGltaXRhdGlvbiBpbiBzcGVjLiBJIHdhcw0KdGhpbmtpbmcgdGhhdCBpZiBo
b3N0IGRpc2FibGVzIFdyaXRlQm9vc3Rlciwgd2hpY2ggbWF5IGltcGx5IHRoYXQgaG9zdA0KZG9l
cyBub3Qgd2FudCBhbnkgV0IgcmVsYXRlZCBvcGVyYXRpb25zIGluIGRldmljZSBkdXJpbmcgdGhl
IGRpc2FibGVkDQpwZXJpb2QuDQoNCkhvd2V2ZXIgSSBtYXkgYmUgd3JvbmcgYmVjYXVzZSBob3N0
IG1heSBvbmx5IHdhbnQgbm90IGNvbnN1bWluZyBhbnkgV0INCmJ1ZmZlciBpbiBkZXZpY2UgZHVy
aW5nIHRoZSBkaXNhYmxlZCB0aW1lLCBidXQgc3RpbGwgd2FudCB0aGUgImZsdXNoIg0Kb3BlcmF0
aW9uIGluIGRldmljZSB0byBjbGVhbiBXQiBidWZmZXIgYXMgcXVpY2tseSBhcyBwb3NzaWJsZSB0
byBmdWxmaWxsDQpmdXR1cmUgaGlnaC10aHJvdWdocHV0IHJlcXVpcmVtZW50IGFmdGVyIFdCIGlz
IHJlLWVuYWJsZWQuDQoNClNvLCBJIHdvdWxkIGRyb3AgdGhpcyBwYXRjaC4NCg0KVGhhbmtzLA0K
U3RhbmxleSBDaHUNCj4gDQo+IA0KPiB0aGFua3MsDQo+IEJlYW4NCj4gDQo+IA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
