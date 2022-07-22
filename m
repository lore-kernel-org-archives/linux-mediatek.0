Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92321C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 02:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=534XN90yMTCUdzwHttvMZhXeNLNMAvse9qhBQqIt6QU=; b=YWr5ct3xw6Pgq36od7lrUVxepX
	5VKHXOI8b1OyVzXiYAOeqfTk6565MYF5W43eSP5PRNnxB0UQA7A0DnVgw5uA0uVKuzzCi5n1XpTpn
	pNPPSO9OVwO9MbxGPCNTl+7CzXdOV/8f0kc1hao/0WGZqiI+ZaxI9iOP4kFqAmrU4YD6FwyhvyuZW
	ulZQyzp+GvFjdcVoltvQHmfrhvl4HbQqFCHy4gMcFwS/77CAgKoO1iJfUl3Zj2uKeC5BZ0M6rtMMU
	AGvYcs7mrGajrrMSmsHlke1yaG+rVrmj00Nf2XtgpPAAz1XaNHHLxCbCQvm2Qo+ngm0stbQiwijMP
	LyFGg6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEiFP-00Gn3G-Sj; Fri, 22 Jul 2022 02:18:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEiFM-00GmuP-VT
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 02:18:34 +0000
X-UUID: ac9cbc4254bb459f8d954d11d2c9f28f-20220721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=534XN90yMTCUdzwHttvMZhXeNLNMAvse9qhBQqIt6QU=;
	b=e4HHV7G3ou/jni02C7fl3eX2kiBd4ZI0hoSWvQOSFfcgWwBgAMWMG5sa6+KMEmHjZESXXb94xLnixXFqQscIbLGcefrmVwvT49Kw0mEEjkE+vEWsoFMDfaU2Gw+SH394uccbuhP0IlvEoc/sNa18bkeD0YhmPsdDaibr87/FbD0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:39abe487-a66d-42a1-8834-3395212cfa2d,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:f3e4a333-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ac9cbc4254bb459f8d954d11d2c9f28f-20220721
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chaotian.jing@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 243895753; Thu, 21 Jul 2022 19:18:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 22 Jul 2022 09:27:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 22 Jul 2022 09:27:45 +0800
Message-ID: <fab0b6332a5a43634f3df437c2b38bc3e618aa4d.camel@mediatek.com>
Subject: Re: [PATCH v1] scsi: ufs: correct ufshcd_shutdown flow
From: Chaotian Jing <chaotian.jing@mediatek.com>
To: Peter Wang <peter.wang@mediatek.com>, Bart Van Assche
	<bvanassche@acm.org>, <stanley.chu@mediatek.com>,
	<linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<cc.chou@mediatek.com>, <jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Date: Fri, 22 Jul 2022 09:27:45 +0800
In-Reply-To: <a71af42f-3b66-c0a1-c79d-a4573d0376fe@mediatek.com>
References: <20220719130208.29032-1-peter.wang@mediatek.com>
	 <afb8d403-f8f5-5161-4680-ce2c3ae7787d@acm.org>
	 <a71af42f-3b66-c0a1-c79d-a4573d0376fe@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_191833_059615_706D5764 
X-CRM114-Status: GOOD (  27.31  )
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

T24gVGh1LCAyMDIyLTA3LTIxIGF0IDEyOjMwICswODAwLCBQZXRlciBXYW5nIHdyb3RlOg0KPiBI
aSBCYXJ0DQo+IA0KPiBPbiA3LzIxLzIyIDU6NDAgQU0sIEJhcnQgVmFuIEFzc2NoZSB3cm90ZToN
Cj4gPiBPbiA3LzE5LzIyIDA2OjAyLCBwZXRlci53YW5nQG1lZGlhdGVrLmNvbSB3cm90ZToNCj4g
PiA+IEZyb206IFBldGVyIFdhbmcgPHBldGVyLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+ID4gDQo+
ID4gPiBBZnRlciB1ZnNoY2Rfd2xfc2h1dGRvd24gc2V0IGRldmljZSBwb3dlcm9mZiBhbmQgbGlu
ayBvZmYsDQo+ID4gPiB1ZnNoY2Rfc2h1dGRvd24gbm90IHR1cm4gb2ZmIHJlZ3VsYXRvcnMvY2xv
Y2tzLg0KPiA+ID4gQ29ycmVjdCB0aGUgZmxvdyB0byB3YWl0IHVmc2hjZF93bF9zaHV0ZG93biBk
b25lIGFuZCB0dXJuIG9mZg0KPiA+ID4gcmVndWxhdG9ycy9jbG9ja3MgYnkgcG9sbGluZyB1ZnMg
ZGV2aWNlL2xpbmsgc3RhdGUgNTAwbXMuDQo+ID4gPiBBbHNvIHJlbW92ZSBwbV9ydW50aW1lX2dl
dF9zeW5jIGJlY2F1c2UgaXQgaXMgdW5uZWNlc3NhcnkuDQo+ID4gDQo+ID4gUGxlYXNlIGV4cGxh
aW4gaW4gdGhlIHBhdGNoIGRlc2NyaXB0aW9uIHdoeSB0aGUNCj4gPiBwbV9ydW50aW1lX2dldF9z
eW5jKCkgDQo+ID4gY2FsbCBpcyBub3QgbmVjZXNzYXJ5Lg0KPiANCj4gQmVjYXVzZSBzaHV0ZG93
biBpcyBmb2N1cyBvbiB0dXJuIG9mZiBjbG9jay9wb3dlciwgd2UgZG9uJ3QgbmVlZA0KPiB0dXJu
IA0KPiBvbihyZXN1bWUpIGFuZCB0dXJuIG9mZiwgcmlnaHQ/DQo+IA0KPiA+IA0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdWZzL2NvcmUvdWZzaGNkLmMNCj4gPiA+IGIvZHJpdmVycy91ZnMv
Y29yZS91ZnNoY2QuYw0KPiA+ID4gaW5kZXggYzdiMzM3NDgwZTNlLi4xYzExYWY0OGI1ODQgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3Vmcy9jb3JlL3Vmc2hjZC5jDQo+ID4gPiArKysgYi9k
cml2ZXJzL3Vmcy9jb3JlL3Vmc2hjZC5jDQo+ID4gPiBAQCAtOTQ2MSwxMCArOTQ2MSwxNCBAQCBF
WFBPUlRfU1lNQk9MKHVmc2hjZF9ydW50aW1lX3Jlc3VtZSk7DQo+ID4gPiAgICAqLw0KPiA+ID4g
ICBpbnQgdWZzaGNkX3NodXRkb3duKHN0cnVjdCB1ZnNfaGJhICpoYmEpDQo+ID4gPiAgIHsNCj4g
PiA+IC0gICAgaWYgKHVmc2hjZF9pc191ZnNfZGV2X3Bvd2Vyb2ZmKGhiYSkgJiYNCj4gPiA+IHVm
c2hjZF9pc19saW5rX29mZihoYmEpKQ0KPiA+ID4gLSAgICAgICAgZ290byBvdXQ7DQo+ID4gPiAr
ICAgIGt0aW1lX3QgdGltZW91dCA9IGt0aW1lX2FkZF9tcyhrdGltZV9nZXQoKSwgNTAwKTsNCj4g
PiANCj4gPiBXaGVyZSBkb2VzIHRoZSA1MDAgbXMgdGltZW91dCBjb21lIGZyb20/DQo+IA0KPiBJ
dCBpcyBhIHRpbWUgdG8gd2FpdCBkZXZpY2UgaW50byBwb3dlciBvZmYsIGlmIHRoZSA1MDAgbXMg
aXMgbm90IA0KPiBzdWl0YWJsZSwgY291bGQgeW91IHN1Z2dlc3MgYSB2YWx1ZT8NCj4gDQo+ID4g
DQo+ID4gQWRkaXRpb25hbGx5LCBnaXZlbiB0aGUgbGFyZ2UgdGltZW91dCwgcGxlYXNlIHVzZSBq
aWZmaWVzIGluc3RlYWQNCj4gPiBvZiANCj4gPiBrdGltZV9nZXQoKS4NCj4gDQo+IE9rYXksIHdp
bGwgY2hhbmdlIG5leHQgdmVyc2lvbi4NCj4gDQo+ID4gDQo+ID4gPiAtICAgIHBtX3J1bnRpbWVf
Z2V0X3N5bmMoaGJhLT5kZXYpOw0KPiA+ID4gKyAgICAvKiBXYWl0IHVmc2hjZF93bF9zaHV0ZG93
biBjbGVhciB1ZnMgc3RhdGUsIHRpbWVvdXQgNTAwIG1zDQo+ID4gPiAqLw0KPiA+ID4gKyAgICB3
aGlsZSAoIXVmc2hjZF9pc191ZnNfZGV2X3Bvd2Vyb2ZmKGhiYSkgfHwgDQo+ID4gPiAhdWZzaGNk
X2lzX2xpbmtfb2ZmKGhiYSkpIHsNCj4gPiA+ICsgICAgICAgIGlmIChrdGltZV9hZnRlcihrdGlt
ZV9nZXQoKSwgdGltZW91dCkpDQo+ID4gPiArICAgICAgICAgICAgZ290byBvdXQ7DQo+ID4gPiAr
ICAgICAgICBtc2xlZXAoMSk7DQo+ID4gPiArICAgIH0NCj4gPiANCj4gPiBQbGVhc2UgZXhwbGFp
biB3aHkgdGhpcyB3YWl0IGxvb3AgaGFzIGJlZW4gaW50cm9kdWNlZC4NCj4gDQo+IEJvdGggdWZz
aGNkX3NodGRvd24gYW5kIHVmc2hjZF93bF9zaHV0ZG93biBjb3VsZCBydW4gY29uY3VycmVudGx5
Lg0KDQpJcyBpdCBwb3NzaWJsZSB0byBhdm9pZCB0aGUgZGV2J3Mgc2h1dGRvd24gYW5kIGl0cyBw
YXJlbnQncyBzaHV0ZG93bg0KcnVuIGNvbmN1cnJlbnRseSA/IGlmIGNhbm5ub3QgYXZvaWQgaXQs
IHRoZW4gc2VlbXMgdGhlIGNvbmN1cnJlbnRseSBydW4NCmNhc2UgbWF5IGhhcHBlbiBhdCBhbnkg
ZGV2aWNlIGFuZCBpdHMgcGFyZW50IGRldmljZSEgdGhlbiBob3cgZG8gZGVhbA0Kd2l0aCBpdCA/
DQoNCkFsc28sIHRoZSB0aW1lb3V0IDUwMG1zIG1heSBtYWtlIG5vIHNlbnNlIGFzIHRoZSBjaGls
ZCBkZXZpY2UgbWF5IG5vdA0KZ2V0IHRoZSBkZXZpY2UgbG9jayBvZiBpdHMgcGFyZW50KGl0IG11
c3Qgd2FpdCBwYXJlbnQncyBzaHV0ZG93bigpDQpyZXR1cm4gdGhlbiBpdCBjYW4gZ2V0IHRoZSBk
ZXZpY2UgbG9jaykuDQo+IA0KPiBpZiB1ZnNoY2Rfd2xfc2h1dGRvd24gLT4gdWZzaGNkX3NodGRv
d24sIGNsb2NrL3Bvd2VyIG9mZiBzaG91bGQgb2suDQo+IA0KPiBJZiB1ZnNoY2Rfc2h0ZG93biAt
PiB1ZnNoY2Rfd2xfc2h1dGRvd24sIHdhaXQgdWZzaGNkX3dsX3NodXRkb3duIHNldCANCj4gZGV2
aWNlIHRvIHBvd2VyIG9mZiBhbmQgdHVybiBvZmYgY2xvY2svcG93ZXIuDQo+IA0KPiBJZiB0aW1l
b3V0IGhhcHBlbiwgbWVhbnMgZGV2aWNlIHN0aWxsIGluIGFjdGl2ZSBtb2RlLCBjYW5ub3QgdHVy
bg0KPiBvZmYgDQo+IGNsb2NrL3Bvd2VyIGRpcmVjdGx5LiBTa2lwIGFuZCBrZWVwIGNsb2NrL3Bv
d2VyIG9uIGluIHRoaXMgY2FzZS4NCj4gDQo+IA0KPiA+IA0KPiA+IFRoYW5rcywNCj4gPiANCj4g
PiBCYXJ0Lg0K


