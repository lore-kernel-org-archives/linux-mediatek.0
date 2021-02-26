Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8248EC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:15:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AD0064ED5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AD0064ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LzOLy+e/ayYb2RLFkTUeZBhRuEZ35MRQFdPjudfp0wY=; b=aayiXb12wboDrxfai+epwtmt4
	vW92O6wvnqH1kiEuo3meOPIwIB9rKY2gCmsFkxVYqJaRZsRU+Y+4S02aI7BuvAsiQjRcLaNsNEGJY
	QeneMPRaU9SM3tf5hurYn3iwnVtFwvxWO27Ldj/4p+2M8E6teebqQm48wZzfDP2ma7kz4o9HfbLXT
	sLqsb5D+F2orRC+8tiYQUT2u2LEmHX4DtYU7Jh2N+r9iuCR4uQmEgdkFOG4HIDvnj+2zGsxKAtDRt
	N12imfsbCWvWA6Kzxm7N1Fnahz4lQCitPK/rjTyx3bKkoh8YU1tiCGQXP2tKoPjoLSqujWo7YqNoT
	bxTaZlVzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFa9g-0000qZ-Ho; Fri, 26 Feb 2021 10:15:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFa9e-0000q1-63; Fri, 26 Feb 2021 10:15:27 +0000
X-UUID: 383fac2507fa4a84b07b5e224863215f-20210226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PVKSM4Lm1Un0eIRTe/LnvU17Suj/+2hi3zvhdZHUu3o=; 
 b=VNoxE7uO5d+hskiokRvh5NMeX97PSMud89+8mUkO5zowKa5zxj/WQPEjR3H34xXIKNvzQqao6xtHvSXTfyY2SCIvu9VEIB103OxdWhhjvz0IgIjdFbts6j9e7ZVkTLI46uA//I/RuAdGSZm4eQtFSqEWLWs2/ELmQL5fwpit21E=;
X-UUID: 383fac2507fa4a84b07b5e224863215f-20210226
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 717558691; Fri, 26 Feb 2021 02:06:54 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Feb 2021 02:06:53 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 26 Feb 2021 18:06:44 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 26 Feb 2021 18:06:43 +0800
Message-ID: <1614334003.25750.17.camel@mhfsdcap03>
Subject: Re: [v8,6/7] PCI: mediatek-gen3: Add system PM support
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Date: Fri, 26 Feb 2021 18:06:43 +0800
In-Reply-To: <YDgeAoYHgiAyU16a@rocinante>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-7-jianjun.wang@mediatek.com>
 <YDZeRc6CHV/WzyCm@rocinante> <1614224089.25750.14.camel@mhfsdcap03>
 <YDgeAoYHgiAyU16a@rocinante>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 83325A2427D844602B40EF0F0B42549976481FE7C785EA4C1A7D7650DD31D3DD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_051526_423406_96EB41F9 
X-CRM114-Status: GOOD (  18.33  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rex-BC.Chen@mediatek.com,
 qizhong.cheng@mediatek.com, chuanjia.liu@mediatek.com, maz@kernel.org,
 drinkcat@chromium.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, sin_jieyang@mediatek.com, Sj
 Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 anson.chuang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbiwgSSB3aWxsIGZpeCBp
dCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpPbiBUaHUsIDIwMjEtMDItMjUgYXQgMjM6MDAgKzAx
MDAsIEtyenlzenRvZiBXaWxjennFhHNraSB3cm90ZToNCj4gSGkgSmlhbmp1biwNCj4gDQo+IFsu
Li5dDQo+ID4gVGhhbmtzIGZvciB5b3VyIHJldmlldywNCj4gDQo+IFRoYW5rIFlPVSBmb3IgYWxs
IHRoZSB3b3JrIGhlcmUhDQo+ICANCj4gWy4uLl0NCj4gPiA+ID4gQWRkIHN1c3BlbmRfbm9pcnEg
YW5kIHJlc3VtZV9ub2lycSBjYWxsYmFjayBmdW5jdGlvbnMgdG8gaW1wbGVtZW50DQo+ID4gPiA+
IFBNIHN5c3RlbSBzdXNwZW5kIGhvb2tzIGZvciBNZWRpYVRlayBHZW4zIFBDSWUgY29udHJvbGxl
ci4NCj4gPiA+IA0KPiA+ID4gU28sICJzeXN0ZW1zIHN1c3BlbmQiIGFuZCAicmVzdW1lIiBob29r
cywgY29ycmVjdD8NCj4gPiANCj4gPiBUaGUgY2FsbGJhY2sgZnVuY3Rpb25zIGlzIHN1c3BlbmRf
bm9pcnEgYW5kIHJlc3VtZV9ub2lycSwgc2hvdWxkIEkgdXNlDQo+ID4gInN5c3RlbXMgc3VzcGVu
ZCIgYW5kICJyZXN1bWUiIGluIHRoZSBjb21taXQgbWVzc2FnZT8NCj4gWy4uLl0NCj4gDQo+IA0K
PiBXaGF0IEkgbWVhbnQgd2FzIHNvbWV0aGluZyBhbG9uZyB0aGVzZSBsaW5lczoNCj4gDQo+ICAg
QWRkIHN1c3BlbmRfbm9pcnEgYW5kIHJlc3VtZV9ub2lycSBjYWxsYmFjayBmdW5jdGlvbnMgdG8g
aW1wbGVtZW50IFBNDQo+ICAgc3lzdGVtIHN1c3BlbmQgYW5kIHJlc3VtZSBob29rcyBmb3IgdGhl
IE1lZGlhVGVrIEdlbjMgUENJZSBjb250cm9sbGVyLg0KPiAgIA0KPiAgIFdoZW4gdGhlIHN5c3Rl
bSBzdXNwZW5kcywgdHJpZ2dlciB0aGUgUENJZSBsaW5rIHRvIGVudGVyIHRoZSBMMiBzdGF0ZQ0K
PiAgIGFuZCBwdWxsIGRvd24gdGhlIFBFUlNUIyBwaW4sIGdhdGluZyB0aGUgY2xvY2tzIG9mIHRo
ZSBNQUMgbGF5ZXIsIGFuZA0KPiAgIHRoZW4gcG93ZXItb2ZmIHRoZSBwaHlzaWNhbCBsYXllciB0
byBwcm92aWRlIHBvd2VyLXNhdmluZy4NCj4gICANCj4gICBXaGVuIHRoZSBzeXN0ZW0gcmVzdW1l
cywgdGhlIFBDSWUgbGluayBzaG91bGQgYmUgcmUtZXN0YWJsaXNoZWQgYW5kIHRoZQ0KPiAgIHJl
bGF0ZWQgY29udHJvbCByZWdpc3RlciB2YWx1ZXMgc2hvdWxkIGJlIHJlc3RvcmVkLg0KPiANCj4g
VGhlIGFib3ZlIGlzIGp1c3QgYSBzdWdnZXN0aW9uLCB0aHVzIGZlZWwgdHJlZSB0byBpZ25vcmUg
aXQgY29tcGxldGVseSwNCj4gYW5kIGl0J3MgaGVhdmlseSBiYXNlZCBvbiB5b3VyIG9yaWdpbmFs
IGNvbW1pdCBtZXNzYWdlLg0KPiANCj4gS3J6eXN6dG9mDQoNClRoYW5rcy4NCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
