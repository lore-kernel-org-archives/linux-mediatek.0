Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD9AC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 03:45:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF04B64ED1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 03:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF04B64ED1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a3Od39DORarDBu07gT3IU0yweFpiRzLZ0oU6J3StyAo=; b=b1hGfq+gqArpv7dfr8Fh4OYId
	1wGMGl9N0lsDLjKPgk+4NaPBka7H9jTyJuv1bv6cvyN3zrSS9no9tEC/YUVosj0pLzgITS1PiKxUI
	xML3vKIVCh5oZ+ajCY3z5D/Puf9FM8gjsE/FJhzzovIPCMdvZ3KCdbH/1p8icRUathRxR4zsjzEka
	LddsKl5NdBn/UaqIArXHbhifnwKi3qViQozMYhsOiRbp3c3AVPOplWemD866y7SYeHVcJMgH/7AZl
	jbWuMB9abXNyjKFA1SUBLD4QuaMLZ9iGEIK4ZBVXyYhDn3FynRL3NpoPV9LB63qxgOeHRHjFpC05f
	VFCWnwTAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lF7aJ-0008Ax-Ay; Thu, 25 Feb 2021 03:45:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF7aG-0008AK-DS; Thu, 25 Feb 2021 03:45:01 +0000
X-UUID: c99aa27118ef4b96827c81ce4e961313-20210224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kjY3YWrArb7e1auQGb2M/I7sB1u1U1g/YZLxN9Rl800=; 
 b=ROu/egn/o8mV6ahwqK0C3xgYpHrYFB0Tx5QVbeuDRlVB7nHzohGoh4kXqve+ZdIn9mLQb15TACgDOqGTsgScq6cDyVXi5sWMyNohnQod3l0WRNlqG/sTFzyA1flbE6BhD3xNFfVchlZYsz+uHdJ5F43ZYFq7arXytwb68URxXb8=;
X-UUID: c99aa27118ef4b96827c81ce4e961313-20210224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 513572246; Wed, 24 Feb 2021 19:44:57 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Feb 2021 19:34:55 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 25 Feb 2021 11:34:50 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Feb 2021 11:34:49 +0800
Message-ID: <1614224089.25750.14.camel@mhfsdcap03>
Subject: Re: [v8,6/7] PCI: mediatek-gen3: Add system PM support
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Date: Thu, 25 Feb 2021 11:34:49 +0800
In-Reply-To: <YDZeRc6CHV/WzyCm@rocinante>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-7-jianjun.wang@mediatek.com>
 <YDZeRc6CHV/WzyCm@rocinante>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B8240DFBE026559C95C4FF794CAECB89FE75F5E7653980143DBA6B8E787D410D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_224500_669021_40FF2B2E 
X-CRM114-Status: GOOD (  18.93  )
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

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LA0KDQpPbiBXZWQsIDIwMjEt
MDItMjQgYXQgMTU6MTAgKzAxMDAsIEtyenlzenRvZiBXaWxjennFhHNraSB3cm90ZToNCj4gSGkg
Smlhbmp1biwNCj4gDQo+ID4gQWRkIHN1c3BlbmRfbm9pcnEgYW5kIHJlc3VtZV9ub2lycSBjYWxs
YmFjayBmdW5jdGlvbnMgdG8gaW1wbGVtZW50DQo+ID4gUE0gc3lzdGVtIHN1c3BlbmQgaG9va3Mg
Zm9yIE1lZGlhVGVrIEdlbjMgUENJZSBjb250cm9sbGVyLg0KPiANCj4gU28sICJzeXN0ZW1zIHN1
c3BlbmQiIGFuZCAicmVzdW1lIiBob29rcywgY29ycmVjdD8NCg0KVGhlIGNhbGxiYWNrIGZ1bmN0
aW9ucyBpcyBzdXNwZW5kX25vaXJxIGFuZCByZXN1bWVfbm9pcnEsIHNob3VsZCBJIHVzZQ0KInN5
c3RlbXMgc3VzcGVuZCIgYW5kICJyZXN1bWUiIGluIHRoZSBjb21taXQgbWVzc2FnZT8NCg0KPiAN
Cj4gPiBXaGVuIHN5c3RlbSBzdXNwZW5kLCB0cmlnZ2VyIHRoZSBQQ0llIGxpbmsgdG8gTDIgc3Rh
dGUgYW5kIHB1bGwgZG93bg0KPiANCj4gSXQgcHJvYmFibHkgd291bGQgYmUgInRoZSBzeXN0ZW0g
c3VzcGVuZHMiLg0KPiANCj4gWy4uLl0NCj4gPiBXaGVuIHN5c3RlbSByZXN1bSwgdGhlIFBDSWUg
bGluayBzaG91bGQgYmUgcmUtZXN0YWJsaXNoZWQgYW5kIHRoZQ0KPiA+IHJlbGF0ZWQgY29udHJv
bCByZWdpc3RlciB2YWx1ZXMgc2hvdWxkIGJlIHJlc3RvcmVkLg0KPiANCj4gU2ltaWxhcmx5IHRv
IHRoZSBhYm92ZTogInRoZSBzeXN0ZW0gcmVzdW1lcyIuDQo+IA0KPiBbLi4uXQ0KPiA+ICsJaWYg
KGVycikgew0KPiA+ICsJCWRldl9lcnIocG9ydC0+ZGV2LCAiY2FuIG5vdCBlbnRlciBMMiBzdGF0
ZVxuIik7DQo+ID4gKwkJcmV0dXJuIGVycjsNCj4gPiArCX0NCj4gDQo+IE1vc3QgbGlrZWx5IHlv
dSB3YW50ICJjYW5ub3QiIG9yICJjYW4ndCIgaW4gdGhlIGFib3ZlIGVycm9yIG1lc3NhZ2UuDQo+
IA0KPiA+ICsJLyogUHVsbCBkb3duIHRoZSBQRVJTVCMgcGluICovDQo+ID4gKwl2YWwgPSByZWFk
bF9yZWxheGVkKHBvcnQtPmJhc2UgKyBQQ0lFX1JTVF9DVFJMX1JFRyk7DQo+ID4gKwl2YWwgfD0g
UENJRV9QRV9SU1RCOw0KPiA+ICsJd3JpdGVsX3JlbGF4ZWQodmFsLCBwb3J0LT5iYXNlICsgUENJ
RV9SU1RfQ1RSTF9SRUcpOw0KPiA+ICsNCj4gPiArCWRldl9kYmcocG9ydC0+ZGV2LCAiZW50ZXIg
TDIgc3RhdGUgc3VjY2VzcyIpOw0KPiANCj4gSnVzdCBhIG5pdHBpY2suICBXaGF0IGFib3V0ICJl
bnRlcmVkIEwyIHN0YXRlcyBzdWNjZXNzZnVsbHkiPw0KPiANCj4gWy4uLl0NCj4gPiArCWlmIChl
cnIpIHsNCj4gPiArCQlkZXZfZXJyKHBvcnQtPmRldiwgInJlc3VtZSBmYWlsZWRcbiIpOw0KPiA+
ICsJCXJldHVybiBlcnI7DQo+ID4gKwl9DQo+IA0KPiBUaGlzIGVycm9yIG1lc3NhZ2UgZG9lcyBu
b3QgcXVpdGUgY29udmV5IHRoYXQgdGhlIG10a19wY2llX3N0YXJ0dXBfcG9ydCgpDQo+IHdhcyB0
aGUgZnVuY3Rpb24gdGhhdCBmYWlsZWQsIHdoaWNoIGlzIG9ubHkgYSBwYXJ0IG9mIHdoYXQgeW91
IGhhdmUgdG8gZG8NCj4gdG8gc3VjY2Vzc2Z1bGx5IHJlc3VtZS4NCj4gDQo+ID4gKwlkZXZfZGJn
KHBvcnQtPmRldiwgInJlc3VtZSBkb25lXG4iKTsNCj4gDQo+IEEgbml0cGljay4gIFByb2JhYmx5
IG5vdCBuZWVkZWQsIGFzIGxhY2sgb2YgZXJyb3IgbWVzc2FnZSB3b3VsZCBtZWFuDQo+IHRoYXQg
dGhlIGRldmljZSByZXN1bWVkIHN1Y2Nlc3NmdWxseSBhZnRlciBiZWluZyBzdXNwZW5kZWQuDQo+
IA0KPiBLcnp5c3p0b2YNCg0KVGhhbmtzLg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
