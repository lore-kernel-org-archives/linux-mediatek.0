Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB6AC4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 00:46:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E05423DE3
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 00:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E05423DE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUck2x/FqsU+BhltL9EMWO/w8oNFFYvFQG1tONuaGW4=; b=oaEstn0PXosB2brdcX5OzbZRuz
	G89yZ9xROiM5gq7W3nFS8VF39k0RUxRpvRmlY4osBkmYmBL5zdaH4LBU9BL+RqUtEkg7dxa76jQQ+
	2+g5pl5KFz9qtjfn22vDubQEeOr4Ez8jrkNabvXe9KZMkz29znoF7r1HaYxx1BHNn1d49bJZmUSqn
	65ADOThWKiSsEZmLWVE15U0Xa3QqHcNowCCAjwuq29cZNxOw9v27G9iTSvUQd8kO67y6jcdf6xFLS
	UziStoY2Po7sQHgSQVPDYhWQlvSAg31jLJXMFEMcdWekw+weFOafWoZjn7GHTshw4IEWyAOL6kR67
	Pfk8TOdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knWZv-0002KF-Re; Fri, 11 Dec 2020 00:46:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knWZq-0002ID-FN; Fri, 11 Dec 2020 00:46:32 +0000
X-UUID: 48c14fe381ef4ac78a8d21bf73638ed4-20201210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=9ay92vJHRsP0Lw8N1DrQDzyGcCnZb1dWhvfOIQHVeYI=; 
 b=KsmbUWR4AylzxChSk5Ev9LqtDoy4UBeJA8RNuczWV3JiSuSx2BIt0JG6HZG8F0OGt/U7GTg5wff0jyxWEDFUtUTctJg1Fw+AXa+9p1w463fmeqNrpvN1347dZXu07JRTMm2UHKUGny/rNp+44errDMKE045XL9PFvWDx41NFs5o=;
X-UUID: 48c14fe381ef4ac78a8d21bf73638ed4-20201210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1996628767; Thu, 10 Dec 2020 16:46:28 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 16:43:39 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Dec 2020 08:43:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Dec 2020 08:43:35 +0800
Message-ID: <1607647416.12750.3.camel@mhfsdcap03>
Subject: Re: [PATCH v8, 1/6] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 11 Dec 2020 08:43:36 +0800
In-Reply-To: <CAAOTY_-oL+NyzDKssCjyP=E8Py3oyEK6a6s=XoYvTFymZE9-zQ@mail.gmail.com>
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-oL+NyzDKssCjyP=E8Py3oyEK6a6s=XoYvTFymZE9-zQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_194631_195514_4F9B55E5 
X-CRM114-Status: GOOD (  22.66  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIwLTEyLTEwIGF0IDIzOjQwICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMOaXpSDpgLHlm5sg5LiL5Y2INToyMuWvq+mBk++8
mg0KPiA+DQo+ID4gcmRtYSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBldmVuIGluIHNhbWUg
U09DLCBhZGQgdGhpcw0KPiA+IHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJkbWENCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxkaXNwLnR4dCAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNw
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLGRpc3AudHh0DQo+ID4gaW5kZXggMTIxMjIwNy4uNjRjNjRlZSAxMDA2NDQNCj4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkaXNwLnR4dA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0DQo+ID4gQEAgLTY2LDYg
KzY2LDEzIEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKERNQSBmdW5jdGlvbiBibG9ja3MpOg0KPiA+
ICAgIGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11
L21lZGlhdGVrLGlvbW11LnR4dA0KPiA+ICAgIGZvciBkZXRhaWxzLg0KPiA+DQo+ID4gK09wdGlv
bmFsIHByb3BlcnRpZXMgKFJETUEgZnVuY3Rpb24gYmxvY2tzKToNCj4gPiArLSBtZWRpYXRlayxy
ZG1hX2ZpZm9fc2l6ZTogcmRtYSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBldmVuIGluIHNh
bWUgU09DLCBhZGQgdGhpcw0KPiA+ICsgIHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJk
bWENCj4gPiArICB0aGUgdmFsdWUgaXMgdGhlIE1heCB2YWx1ZSB3aGljaCBkZWZpbmVkIGluIGhh
cmR3YXJlIGRhdGEgc2hlZXQuDQo+ID4gKyAgcmRtYV9maWZvX3NpemUgb2YgcmRtYTAgaW4gbXQ4
MTgzIGlzIDUxMjANCj4gPiArICByZG1hX2ZpZm9fc2l6ZSBvZiByZG1hMSBpbiBtdDgxODMgaXMg
MjA0OA0KPiA+ICsNCj4gPiAgRXhhbXBsZXM6DQo+ID4NCj4gPiAgbW1zeXM6IGNsb2NrLWNvbnRy
b2xsZXJAMTQwMDAwMDAgew0KPiA+IEBAIC0yMDcsMyArMjE0LDEyIEBAIG9kQDE0MDIzMDAwIHsN
Cj4gPiAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNjcHN5cyBNVDgxNzNfUE9XRVJfRE9NQUlO
X01NPjsNCj4gPiAgICAgICAgIGNsb2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfT0Q+Ow0KPiA+
ICB9Ow0KPiA+ICsNCj4gPiArcmRtYTE6IHJkbWFAMTQwMGMwMDAgew0KPiA+ICsgICAgICAgY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZGlzcC1yZG1hIjsNCj4gPiArICAgICAgIHJlZyA9
IDwwIDB4MTQwMGMwMDAgMCAweDEwMDA+Ow0KPiA+ICsgICAgICAgaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDIyOSBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KPiA+ICsgICAgICAgcG93ZXItZG9tYWlucyA9
IDwmc2Nwc3lzIE1UODE4M19QT1dFUl9ET01BSU5fRElTUD47DQo+ID4gKyAgICAgICBjbG9ja3Mg
PSA8Jm1tc3lzIENMS19NTV9ESVNQX1JETUExPjsNCj4gPiArICAgICAgIG1lZGlhdGVrLHJkbWFf
Zmlmb19zaXplID0gPDIwNDg+Ow0KPiA+ICt9Ow0KPiANCj4gSW4gWzFdLCBSb2IgaGFzIHN1Z2dl
c3QgdGhhdCBub3QgYWRkIGV4YW1wbGUgb2YgcmRtYTEsIGl0J3MgYmV0dGVyIHRvDQo+IGFkZCBt
ZWRpYXRlayxyZG1hX2ZpZm9fc2l6ZSBpbiByZG1hMCBmb3IgZXhhbXBsZS4NCj4gDQo+IFsxXSBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gv
MTU5Njg1NTIzMS01NzgyLTItZ2l0LXNlbmQtZW1haWwteW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5j
b20vDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KDQp0aGUgZGVzY3JpcHRpb24gb2Yg
cmRtYTAgaXMgbXQ4MTczLCBhbmQgbXQ4MTczIHJkbWEgZHJpdmVyIHNldCB0aGUNCmNvcnJlc3Bv
bmQgZmlmbyBzaXplIGFscmVhZHkgb2sgbGlrZSB0aGlzOg0Kc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGtfZGlzcF9yZG1hX2RhdGEgbXQ4MTczX3JkbWFfZHJpdmVyX2RhdGEgPSB7DQoJLmZpZm9fc2l6
ZSA9IFNaXzhLLA0KfTsgDQoNCnBsZWFzZSBkb3VibGUgY29uZmlybSBzaGFsbCB3ZSBhZGQgdGhp
cyBpbmZvcm1hdGlvbiBpbnRvIHJkbWEwDQpkZXNjcmlwdGlvbi4NCg0KDQo+IA0KPiA+IC0tDQo+
ID4gMS44LjEuMS5kaXJ0eQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0DQo+ID4gTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
