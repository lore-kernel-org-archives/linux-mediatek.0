Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DEFC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:55:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6AA2610A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6AA2610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Qnk4njCLS5A9/3PPFxOYzpOFZYm/krqhaHNUEwXfAU=; b=CqMXJJbLppD/+O974JEigQzCy
	V+WOwKSwh0C7ai62d04V7V98bre4Dfh0PeeWdZ4qOLDmUXwceAk1JrFL5Wkobw59uUsS11okKAEfl
	HbHap4pXJ0++gbHGLV0kpPZUrohYKPs23yNuvMVbcbG6JrxRxUB1NlvaZhF7rGuluTiWgW0v2xvVS
	sM5IjvuFzXMgohEcidK0GW9tHper5LYn2u09d5C7QjnF3tNrHM7Z/PA7F8tpDFn6lZR9hNU4m9d/9
	mTPxZA/qJUowEGhML8B8BXMgWYqxAGfYIEGH5iMwOeXYEbNLE+BBjTjrhNXM5b5OBb0y2jhYAeig3
	bJWAx0XUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljDIi-002elZ-Fk; Wed, 19 May 2021 03:55:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljDIW-002ei6-GR; Wed, 19 May 2021 03:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=4SNfkbRqzDZ+P6okN6fxqL61nvCWq7VOzTHBHYbyx0k=; b=OiUzRdT7TLVnMoWQRkaywLq7Pv
 QY8skB0hjId3nQRLNGeLA+zBGYoEhGPY5nKK9GnASJWt23rnEPCAFcawabjF31cwm3ViFmOdS8eQ4
 8yb3SVFdIUARD9K9RnXR4WjCKn0o/XJeqYYjrDfpPI8FxyKaDVADYTLBHeW1BHHeZvyyjg1jMtAtg
 87iIxGSI8qW7jM6quxnXQFI6qf4cSQMlxQjBrbGFsrGiHll3hCuHjjLu6UPiinwifCcaOBwaFduKi
 kRQDotNPSkZuJfFHCL4ix81sVq/ThSBEbr466SVhC0rjbu7NrBKGL8ofNz5qDg01bKUFhhd3mfjNM
 HMDwcKeA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljDIS-00F6a3-OD; Wed, 19 May 2021 03:55:02 +0000
X-UUID: f170379ab756479caeeefe42c3205316-20210518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4SNfkbRqzDZ+P6okN6fxqL61nvCWq7VOzTHBHYbyx0k=; 
 b=XD5huvevJ6BzKlh8M2cITcXAy+hFDaKRgKqcsr3V8ZBoIEi+xPdl56i/P9HncxYKY2usxoKxzTA9R/NW2ou6iUaZSih70kSTOXcfm5TIng0CKIiRG4SWgZDiadLk6oQfLBG6dFAnEYvw+L1ZyVG+xo+6l67p0yVW9zLHkoUd020=;
X-UUID: f170379ab756479caeeefe42c3205316-20210518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 290895991; Tue, 18 May 2021 20:54:56 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 20:54:55 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 19 May 2021 11:54:47 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 May 2021 11:54:46 +0800
Message-ID: <1621396486.18307.22.camel@mszsdaap41>
Subject: Re: [PATCH 3/4] drm/mediatek: fine tune the dsi panel's power sequence
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, DRI Development
 <dri-devel@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Huijuan Xie
 =?UTF-8?Q?=28=E8=B0=A2=E6=85=A7=E5=A8=9F=29?= <Huijuan.Xie@mediatek.com>,
 "stonea168@163.com" <stonea168@163.com>, Cawa Cheng
 =?UTF-8?Q?=28=E9=84=AD=E6=9B=84=E7=A6=A7=29?= <cawa.cheng@mediatek.com>,
 Rex-BC Chen =?UTF-8?Q?=28=E9=99=B3=E6=9F=8F=E8=BE=B0=29?=
 <Rex-BC.Chen@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Yingjoe Chen
 =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?= <Yingjoe.Chen@mediatek.com>,
 Eddie Huang =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?=
 <eddie.huang@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Date: Wed, 19 May 2021 11:54:46 +0800
In-Reply-To: <CAAOTY_-SKcX+4U5hKOgRaip-vk+ofEWe_g4VNUxFjN7LCprq1w@mail.gmail.com>
References: <20210420132614.150242-1-jitao.shi@mediatek.com>
 <20210420132614.150242-3-jitao.shi@mediatek.com>
 <CAAOTY_-SKcX+4U5hKOgRaip-vk+ofEWe_g4VNUxFjN7LCprq1w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F8D1A7938E471559E34A2AA68D23CC1055848FF057CA6C0BB5272F2AB98E3E3F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_205500_813471_39EB2A58 
X-CRM114-Status: GOOD (  27.70  )
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

T24gU2F0LCAyMDIxLTA0LTI0IGF0IDAwOjM2ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgSml0YW86DQo+IA0KPiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+IOaW
vCAyMDIx5bm0NOaciDIw5pelIOmAseS6jCDkuIvljYg5OjI25a+r6YGT77yaDQo+ID4NCj4gPiBB
ZGQgdGhlIGRybV9wYW5lbF9wcmVwYXJlX3Bvd2VyIGFuZCBkcm1fcGFuZWxfdW5wcmVwYXJlX3Bv
d2VyIGNvbnRyb2wuDQo+ID4gVHVybiBvbiBwYW5lbCBwb3dlcihkcm1fcGFuZWxfcHJlcGFyZV9w
b3dlcikgYW5kIGNvbnRyb2wgYmVmb3JlIGRzaQ0KPiA+IGVuYWJsZS4gQW5kIHRoZW4gZHNpIGVu
YWJsZSwgc2VuZCBkY3MgY21kIGluIGRybV9wYW5lbF9wcmVwYXJlLCBsYXN0DQo+ID4gdHVybiBv
biBiYWNrbGlnaHQuDQo+IA0KPiBQbGVhc2UgZGVzY3JpYmUgV0hZIGRvIHlvdSBuZWVkIHRoaXMg
cGF0Y2g/IEZpeCBhbnkgYnVnPw0KDQpNb3N0IHBhbmVscywgaGF2ZSBmaXZlIHN0ZXBzIHdoZW4g
cG93ZXJvbi4NCg0KMS4gdHVybiBvbiBkc2kgc2lnbmFsIHRvIExQMTEgICAtLT4gZHNpIGhvc3Qn
cyBhY3Rpb24NCjIuIHR1cm4gb24gdGhlIHBvd2VyIHN1cHBsaWVzLCAgLS0+IHBhbmVsJ3MgYWN0
aW9uDQozLiBzZW5kIHRoZSBEQ1MgIGNtZCB0byBwYW5lbCAgIC0tPiBwYW5lbCdzIGFjdGlvbg0K
NC4gc3RhcnQgc2VuZCB2aWRlbyBzdHJlYW0gICAgICAtLT4gZHNpIGhvc3QncyBhY3Rpb24NCjUu
IHR1cm4gb24gYmFja2xpZ2h0LiAgICAgICAgICAgLS0+IHBhbmVsJ3MgYWN0aW9uDQoNCndlIHB1
dCAidHVybiBvbiB0aGUgcG93ZXIgc3VwcGxpZXMiIGFuZCAic2VuZCB0aGUgRENTICBjbWQgdG8g
cGFuZWwiIGluDQpwYW5lbF9wcmVwYXJlLiBBbmQgInR1cm4gb24gYmFja2xpZ2h0IiBpbiBwYW5l
bF9lbmFibGUuDQoNCkJ1dCBzb21lIG90aGVyIHBhbmVscyBoYXMgYSBzcGVjaWFsIHBvd2Vyb24g
c2VxdWVuY2UgYXMgdGhlIGZvbGxvd2luZy4NCg0KMS4gdHVybiBvbiB0aGUgcG93ZXIgc3VwcGxp
ZXMsICAtLT4gcGFuZWwncyBhY3Rpb24NCjIuIHR1cm4gb24gZHNpIHNpZ25hbCB0byBMUDExICAg
LS0+IGRzaSBob3N0J3MgYWN0aW9uDQozLiBzZW5kIHRoZSBEQ1MgIGNtZCB0byBwYW5lbCAgIC0t
PiBwYW5lbCdzIGFjdGlvbg0KNC4gc3RhcnQgc2VuZCB2aWRlbyBzdHJlYW0gICAgICAtLT4gZHNp
IGhvc3QncyBhY3Rpb24NCjUuIHR1cm4gb24gYmFja2xpZ2h0LiAgICAgICAgICAgLS0+IHBhbmVs
J3MgYWN0aW9uDQoNCnBhbmVsJ3MgYWN0aW9ucyBhcmUgZGl2aWRlZCBpbnRvIHRocmVlIHBhcnRz
Lg0KDQpTbyBJIGFkZCBhIG5ldyBhcGkgImRybV9wYW5lbF9wcmVwYXJlX3Bvd2VyL3JtX3BhbmVs
X3VucHJlcGFyZV9wb3dlciIgdG8NCmNvbnRyb2wgdGhlIHNlcXVlbmNlLg0KDQoNCkJlc3QgUmVn
YXJkcw0KSml0YW8NCg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0
YW8uc2hpQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYyB8IDEyICsrKysrKysrKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYw0KPiA+IGluZGV4IGExZmYxNTJlZjQ2OC4uNDU1ZmU1ODJjNmI1IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+ID4gQEAgLTYxNSwxMCArNjE1LDEz
IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9wb3dlcm9uKHN0cnVjdCBtdGtfZHNpICpkc2kpDQo+ID4g
ICAgICAgICBkc2ktPmRhdGFfcmF0ZSA9IERJVl9ST1VORF9VUF9VTEwoZHNpLT52bS5waXhlbGNs
b2NrICogYml0X3Blcl9waXhlbCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBkc2ktPmxhbmVzKTsNCj4gPg0KPiA+ICsgICAgICAgaWYgKHBhbmVsX2JyaWRn
ZV9wcmVwYXJlX3Bvd2VyKGRzaS0+bmV4dF9icmlkZ2UpKQ0KPiANCj4gcmV0ID0gcGFuZWxfYnJp
ZGdlX3ByZXBhcmVfcG93ZXIoZHNpLT5uZXh0X2JyaWRnZSk7DQo+IGlmIChyZXQpDQo+IA0KPiA+
ICsgICAgICAgICAgICAgICBEUk1fSU5GTygiY2FuJ3QgcHJlcGFyZSBwb3dlciB0aGUgcGFuZWxc
biIpOw0KPiANCj4gSSB0aGluayB5b3Ugc2hvdWxkIGdvdG8gZXJyX3JlZmNvdW50Ow0KDQpUaGFu
a3MgZm9yIHlvdXIgcmV2aWV3LiBJJ2xsIGZpeCBpdCBuZXh0IHBhdGNoLg0KDQo+IA0KPiA+ICsN
Cj4gPiAgICAgICAgIHJldCA9IGNsa19zZXRfcmF0ZShkc2ktPmhzX2NsaywgZHNpLT5kYXRhX3Jh
dGUpOw0KPiA+ICAgICAgICAgaWYgKHJldCA8IDApIHsNCj4gPiAgICAgICAgICAgICAgICAgZGV2
X2VycihkZXYsICJGYWlsZWQgdG8gc2V0IGRhdGEgcmF0ZTogJWRcbiIsIHJldCk7DQo+ID4gLSAg
ICAgICAgICAgICAgIGdvdG8gZXJyX3JlZmNvdW50Ow0KPiA+ICsgICAgICAgICAgICAgICBnb3Rv
IGVycl9wcmVwYXJlX3Bvd2VyOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gICAgICAgICBwaHlf
cG93ZXJfb24oZHNpLT5waHkpOw0KPiA+IEBAIC02NjEsNyArNjY0LDkgQEAgc3RhdGljIGludCBt
dGtfZHNpX3Bvd2Vyb24oc3RydWN0IG10a19kc2kgKmRzaSkNCj4gPiAgICAgICAgIGNsa19kaXNh
YmxlX3VucHJlcGFyZShkc2ktPmVuZ2luZV9jbGspOw0KPiA+ICBlcnJfcGh5X3Bvd2VyX29mZjoN
Cj4gPiAgICAgICAgIHBoeV9wb3dlcl9vZmYoZHNpLT5waHkpOw0KPiA+IC1lcnJfcmVmY291bnQ6
DQo+ID4gK2Vycl9wcmVwYXJlX3Bvd2VyOg0KPiA+ICsgICAgICAgaWYgKHBhbmVsX2JyaWRnZV91
bnByZXBhcmVfcG93ZXIoZHNpLT5uZXh0X2JyaWRnZSkpDQo+IA0KPiByZXQgPSBwYW5lbF9icmlk
Z2VfdW5wcmVwYXJlX3Bvd2VyKGRzaS0+bmV4dF9icmlkZ2UpOw0KPiANCj4gPiArICAgICAgICAg
ICAgICAgRFJNX0lORk8oIkNhbid0IHVucHJlcGFyZSBwb3dlciB0aGUgcGFuZWxcbiIpOw0KPiA+
ICAgICAgICAgZHNpLT5yZWZjb3VudC0tOw0KPiA+ICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiAg
fQ0KPiA+IEBAIC02OTQsNiArNjk5LDkgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9wb3dlcm9mZihz
dHJ1Y3QgbXRrX2RzaSAqZHNpKQ0KPiA+ICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRz
aS0+ZGlnaXRhbF9jbGspOw0KPiA+DQo+ID4gICAgICAgICBwaHlfcG93ZXJfb2ZmKGRzaS0+cGh5
KTsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAocGFuZWxfYnJpZGdlX3VucHJlcGFyZV9wb3dlcihk
c2ktPm5leHRfYnJpZGdlKSkNCj4gDQo+IHJldCA9IHBhbmVsX2JyaWRnZV91bnByZXBhcmVfcG93
ZXIoZHNpLT5uZXh0X2JyaWRnZSk7DQo+IA0KPiA+ICsgICAgICAgICAgICAgICBEUk1fSU5GTygi
Q2FuJ3QgdW5wcmVwYXJlIHBvd2VyIHRoZSBwYW5lbFxuIik7DQo+ID4gIH0NCj4gPg0KPiA+ICBz
dGF0aWMgdm9pZCBtdGtfb3V0cHV0X2RzaV9lbmFibGUoc3RydWN0IG10a19kc2kgKmRzaSkNCj4g
PiAtLQ0KPiA+IDIuMjUuMQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPiA+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
