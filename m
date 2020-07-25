Return-Path: <SRS0=Q1uE=BE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC9CC433E5
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2020 03:32:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 385202070E
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2020 03:32:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bLDN52tF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="o9qJTpEi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 385202070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWG+dmZOu6IQRl8wzi78pKgc0i/0qywepZujzcADSN4=; b=bLDN52tF/ZPDC/W725645AzaZy
	F3RRhbpEUb4zwFaqOlfwJ8il9TbajoJyLDASen+E7FTpa2muLW/d2N3k9rv9xJuoWqBCQDi+oaIMo
	RFJzoUtzNmutTt7k8K8bbPwKxv+fjZykPGXH+tgFxg1tPza0uiXGydOnvmqH80gq0NVCubkl6umFb
	debivWk4TkdPU6M0N071THq5u3FQR4V0T9kL0i7p3wO+JNqjE0ZjY8VN8wz6meC/EK1Hj53fBByzS
	ByIT1YBmVIKdytWnTtTnlSojQm8USijF0ng1j527gMc+bqFZm0Xsq/8I8RdaSbI1voiwkYtbSYdsH
	AJmR0GYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzAv6-0004oX-Cq; Sat, 25 Jul 2020 03:32:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzAv2-0004nm-6R; Sat, 25 Jul 2020 03:32:17 +0000
X-UUID: e25098de4b6040219c570f0da781f9b1-20200724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=HyScVemOVdc/5B8+EEHmJ6YoJp6yhl8N2J1i46XS4bI=; 
 b=o9qJTpEiCHP2/KuxwIdR+f+Hp/V+/TPngUxR7814s3tOIZh4FNnEUquQuS0gA/09xL9tuif7shQ2HxzxeCUGq+/+4RmNXOcwU/hIF+9kqHahT5oVlkz0Zq19/xSlS3PMszzgTcHsqcpoZsEFrANq724x99CSYwl+ABxgqMdwPuw=;
X-UUID: e25098de4b6040219c570f0da781f9b1-20200724
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 820453510; Fri, 24 Jul 2020 19:32:13 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jul 2020 20:32:12 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 25 Jul 2020 11:32:10 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 25 Jul 2020 11:32:09 +0800
Message-ID: <1595647858.13250.20.camel@mhfsdcap03>
Subject: Re: [v7, PATCH 7/7] drm/mediatek: add support for mediatek SOC MT8183
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 25 Jul 2020 11:30:58 +0800
In-Reply-To: <CAAOTY_9hdvw7htuOkJmmmGR9SAev4O+kWuMopfP_F=8Vg=_U+A@mail.gmail.com>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-8-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9hdvw7htuOkJmmmGR9SAev4O+kWuMopfP_F=8Vg=_U+A@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_233216_433296_F22EBB31 
X-CRM114-Status: GOOD (  25.20  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David
 Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>, DRI
 Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAyMDIwLTA3LTI1IGF0IDA3OjI0ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSBZb25ncWlhbmc6DQo+IA0KPiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlh
dGVrLmNvbT4g5pa8IDIwMjDlubQ35pyIMjPml6Ug6YCx5ZubIOS4iuWNiDEwOjE15a+r6YGT77ya
DQo+ID4NCj4gPiBUaGlzIHBhdGNoIGFkZCBzdXBwb3J0IGZvciBtZWRpYXRlayBTT0MgTVQ4MTgz
DQo+ID4gMS5vdmxfMmwgc2hhcmUgZHJpdmVyIHdpdGggb3ZsDQo+IA0KPiBJIHRoaW5rIHRoaXMg
aXMgZG9uZSBpbiBbMV0sIFsyXSwgWzNdLCB0aGlzIHBhdGNoIGp1c3QgYWRkIHRoZSBzdXBwb3J0
DQo+IG9mIG10ODE4My1vdmwgYW5kIG10ODE4My1vdmwtMmwuDQo+IA0KPiBbMV0gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L2NvbW1pdC9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWs/aD12NS44LXJjNiZpZD0xMzJjNmUyNTBl
ZDc0NTQ0Mzk3M2NhZGE4ZGIxN2NkYmFlYmRmNTUxDQo+IFsyXSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0L2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlaz9oPXY1LjgtcmM2JmlkPTMxODQ2MmQxYTU2ODYzNGJhMDky
NjNjYzczMGNiMGZiMWQ1NmMyYjMNCj4gWzNdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrP2g9djUuOC1yYzYmaWQ9NTcxNDhiYWFjOGI3ODQ2MWUzOTQ5NTNjZmQ1MzE3
YmRlOGY3OTVhYg0KPiANCj4gPiAyLnJkbWExIHNoYXJlIGRyaXZlIHdpdGggcmRtYTAsIGJ1dCBm
aWZvIHNpemUgaXMgZGlmZmVyZW50DQo+IA0KPiBJIHRoaW5rIHRoaXMgaXMgZG9uZSBpbiBbNF0s
IHRoaXMgcGF0Y2gganVzdCBhZGQgdGhlIHN1cHBvcnQgb2YgbXQ4MTgzLXJkbWEuDQo+IA0KPiBb
NF0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTY3OTU0OS8NCj4gDQo+ID4g
My5hZGQgbXQ4MTgzIG11dGV4IHByaXZhdGUgZGF0YSwgYW5kIG1tc3lzIHByaXZhdGUgZGF0YQ0K
PiA+IDQuYWRkIG10ODE4MyBtYWluIGFuZCBleHRlcm5hbCBwYXRoIG1vZHVsZSBmb3IgY3J0YyBj
cmVhdGUNCj4gDQo+IFRoZSBmb3VydGggaXRlbSBpcyB0aGUgbW1zeXMgcHJpdmF0ZSBkYXRhIGlu
IHRoaXJkIGl0ZW0sIHNvIHlvdSBuZWVkDQo+IG5vdCB0byByZXBlYXQgaXQuDQo+IA0KDQppIHdp
bGwgcmVtb3ZlIHNvbWUgdXNlbGVzcyBkZXNjcmlwdGlvbiBpbiBuZXh0IHZlcnNpb24uDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVr
LmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jICB8IDE4ICsrKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3BfcmRtYS5jIHwgIDYgKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYyAgIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgICB8IDQzICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTE0IGluc2VydGlvbnMo
KykNCj4gPg0KPiANCj4gW3NuaXBdDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcC5jDQo+ID4gaW5kZXggMDE0YzFiYi4uNjA3ODhjMSAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jDQo+ID4gQEAgLTE1LDYgKzE1LDggQEANCj4g
Pg0KPiA+ICAjZGVmaW5lIE1UMjcwMV9ESVNQX01VVEVYMF9NT0QwICAgICAgICAgICAgICAgICAg
ICAgICAgMHgyYw0KPiA+ICAjZGVmaW5lIE1UMjcwMV9ESVNQX01VVEVYMF9TT0YwICAgICAgICAg
ICAgICAgICAgICAgICAgMHgzMA0KPiA+ICsjZGVmaW5lIE1UODE4M19ESVNQX01VVEVYMF9NT0Qw
ICAgICAgICAgICAgICAgICAgICAgICAgMHgzMA0KPiA+ICsjZGVmaW5lIE1UODE4M19ESVNQX01V
VEVYMF9TT0YwICAgICAgICAgICAgICAgICAgICAgICAgMHgyYw0KPiA+DQo+ID4gICNkZWZpbmUg
RElTUF9SRUdfTVVURVhfRU4obikgICAgICAgICAgICAgICAgICAgKDB4MjAgKyAweDIwICogKG4p
KQ0KPiA+ICAjZGVmaW5lIERJU1BfUkVHX01VVEVYKG4pICAgICAgICAgICAgICAgICAgICAgICgw
eDI0ICsgMHgyMCAqIChuKSkNCj4gPiBAQCAtMjUsNiArMjcsMTggQEANCj4gPg0KPiA+ICAjZGVm
aW5lIElOVF9NVVRFWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgxKQ0KPiA+DQo+
ID4gKyNkZWZpbmUgTVQ4MTgzX01VVEVYX01PRF9ESVNQX1JETUEwICAgICAgICAgICAgMA0KPiA+
ICsjZGVmaW5lIE1UODE4M19NVVRFWF9NT0RfRElTUF9SRE1BMSAgICAgICAgICAgIDENCj4gPiAr
I2RlZmluZSBNVDgxODNfTVVURVhfTU9EX0RJU1BfT1ZMMCAgICAgICAgICAgICA5DQo+ID4gKyNk
ZWZpbmUgTVQ4MTgzX01VVEVYX01PRF9ESVNQX09WTDBfMkwgICAgICAgICAgMTANCj4gPiArI2Rl
ZmluZSBNVDgxODNfTVVURVhfTU9EX0RJU1BfT1ZMMV8yTCAgICAgICAgICAxMQ0KPiA+ICsjZGVm
aW5lIE1UODE4M19NVVRFWF9NT0RfRElTUF9XRE1BMCAgICAgICAgICAgIDEyDQo+ID4gKyNkZWZp
bmUgTVQ4MTgzX01VVEVYX01PRF9ESVNQX0NPTE9SMCAgICAgICAgICAgMTMNCj4gPiArI2RlZmlu
ZSBNVDgxODNfTVVURVhfTU9EX0RJU1BfQ0NPUlIwICAgICAgICAgICAxNA0KPiA+ICsjZGVmaW5l
IE1UODE4M19NVVRFWF9NT0RfRElTUF9BQUwwICAgICAgICAgICAgIDE1DQo+ID4gKyNkZWZpbmUg
TVQ4MTgzX01VVEVYX01PRF9ESVNQX0dBTU1BMCAgICAgICAgICAgMTYNCj4gPiArI2RlZmluZSBN
VDgxODNfTVVURVhfTU9EX0RJU1BfRElUSEVSMCAgICAgICAgICAxNw0KPiA+ICsNCj4gPiAgI2Rl
ZmluZSBNVDgxNzNfTVVURVhfTU9EX0RJU1BfT1ZMMCAgICAgICAgICAgICAxMQ0KPiA+ICAjZGVm
aW5lIE1UODE3M19NVVRFWF9NT0RfRElTUF9PVkwxICAgICAgICAgICAgIDEyDQo+ID4gICNkZWZp
bmUgTVQ4MTczX01VVEVYX01PRF9ESVNQX1JETUEwICAgICAgICAgICAgMTMNCj4gPiBAQCAtNzQs
NiArODgsMTAgQEANCj4gPiAgI2RlZmluZSBNVVRFWF9TT0ZfRFNJMiAgICAgICAgICAgICAgICAg
NQ0KPiA+ICAjZGVmaW5lIE1VVEVYX1NPRl9EU0kzICAgICAgICAgICAgICAgICA2DQo+ID4NCj4g
PiArI2RlZmluZSBNVDgxODNfTVVURVhfU09GX0RQSTAgICAgICAgICAgICAgICAgICAyDQo+ID4g
KyNkZWZpbmUgTVQ4MTgzX01VVEVYX0VPRl9EU0kwICAgICAgICAgICAgICAgICAgKE1VVEVYX1NP
Rl9EU0kwIDw8IDYpDQo+ID4gKyNkZWZpbmUgTVQ4MTgzX01VVEVYX0VPRl9EUEkwICAgICAgICAg
ICAgICAgICAgKE1UODE4M19NVVRFWF9TT0ZfRFBJMCA8PCA2KQ0KPiA+ICsNCj4gPg0KPiA+ICBz
dHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggew0KPiA+ICAgICAgICAgaW50IGlkOw0KPiA+IEBAIC0xNTMs
NiArMTcxLDIwIEBAIHN0cnVjdCBtdGtfZGRwIHsNCj4gPiAgICAgICAgIFtERFBfQ09NUE9ORU5U
X1dETUExXSA9IE1UODE3M19NVVRFWF9NT0RfRElTUF9XRE1BMSwNCj4gPiAgfTsNCj4gPg0KPiA+
ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IG10ODE4M19tdXRleF9tb2RbRERQX0NPTVBPTkVO
VF9JRF9NQVhdID0gew0KPiA+ICsgICAgICAgW0REUF9DT01QT05FTlRfQUFMMF0gPSBNVDgxODNf
TVVURVhfTU9EX0RJU1BfQUFMMCwNCj4gPiArICAgICAgIFtERFBfQ09NUE9ORU5UX0NDT1JSXSA9
IE1UODE4M19NVVRFWF9NT0RfRElTUF9DQ09SUjAsDQo+ID4gKyAgICAgICBbRERQX0NPTVBPTkVO
VF9DT0xPUjBdID0gTVQ4MTgzX01VVEVYX01PRF9ESVNQX0NPTE9SMCwNCj4gPiArICAgICAgIFtE
RFBfQ09NUE9ORU5UX0RJVEhFUl0gPSBNVDgxODNfTVVURVhfTU9EX0RJU1BfRElUSEVSMCwNCj4g
PiArICAgICAgIFtERFBfQ09NUE9ORU5UX0dBTU1BXSA9IE1UODE4M19NVVRFWF9NT0RfRElTUF9H
QU1NQTAsDQo+ID4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9PVkwwXSA9IE1UODE4M19NVVRFWF9N
T0RfRElTUF9PVkwwLA0KPiA+ICsgICAgICAgW0REUF9DT01QT05FTlRfT1ZMXzJMMF0gPSBNVDgx
ODNfTVVURVhfTU9EX0RJU1BfT1ZMMF8yTCwNCj4gPiArICAgICAgIFtERFBfQ09NUE9ORU5UX09W
TF8yTDFdID0gTVQ4MTgzX01VVEVYX01PRF9ESVNQX09WTDFfMkwsDQo+ID4gKyAgICAgICBbRERQ
X0NPTVBPTkVOVF9SRE1BMF0gPSBNVDgxODNfTVVURVhfTU9EX0RJU1BfUkRNQTAsDQo+ID4gKyAg
ICAgICBbRERQX0NPTVBPTkVOVF9SRE1BMV0gPSBNVDgxODNfTVVURVhfTU9EX0RJU1BfUkRNQTEs
DQo+ID4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9XRE1BMF0gPSBNVDgxODNfTVVURVhfTU9EX0RJ
U1BfV0RNQTAsDQo+ID4gK307DQo+ID4gKw0KPiA+ICBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50
IG10MjcxMl9tdXRleF9zb2ZbRERQX01VVEVYX1NPRl9EU0kzICsgMV0gPSB7DQo+ID4gICAgICAg
ICBbRERQX01VVEVYX1NPRl9TSU5HTEVfTU9ERV0gPSBNVVRFWF9TT0ZfU0lOR0xFX01PREUsDQo+
ID4gICAgICAgICBbRERQX01VVEVYX1NPRl9EU0kwXSA9IE1VVEVYX1NPRl9EU0kwLA0KPiA+IEBA
IC0xNjMsNiArMTk1LDEyIEBAIHN0cnVjdCBtdGtfZGRwIHsNCj4gPiAgICAgICAgIFtERFBfTVVU
RVhfU09GX0RTSTNdID0gTVVURVhfU09GX0RTSTMsDQo+ID4gIH07DQo+ID4NCj4gPiArc3RhdGlj
IGNvbnN0IHVuc2lnbmVkIGludCBtdDgxODNfbXV0ZXhfc29mW0REUF9NVVRFWF9TT0ZfRFNJMyAr
IDFdID0gew0KPiA+ICsgICAgICAgW0REUF9NVVRFWF9TT0ZfU0lOR0xFX01PREVdID0gTVVURVhf
U09GX1NJTkdMRV9NT0RFLA0KPiA+ICsgICAgICAgW0REUF9NVVRFWF9TT0ZfRFNJMF0gPSBNVVRF
WF9TT0ZfRFNJMCB8IE1UODE4M19NVVRFWF9FT0ZfRFNJMCwNCj4gDQo+IEkgdGhpbmsgdGhpcyBh
cnJheSBpcyBmb3IgJ3NvZicsIHNvIHlvdSBzaG91bGQgZHJvcCBNVDgxODNfTVVURVhfRU9GX0RT
STAuDQo+IA0KPiA+ICsgICAgICAgW0REUF9NVVRFWF9TT0ZfRFBJMF0gPSBNVDgxODNfTVVURVhf
U09GX0RQSTAgfCBNVDgxODNfTVVURVhfRU9GX0RQSTAsDQo+IA0KPiBEaXR0by4NCg0Kd2UgbmVl
ZCBzZXQgRU9GIGF0IHRoZSBzYW1lIG9uIE1UODE4MywgdGhhdCBpcyBkaWZmZXJlbnQgd2l0aCBi
ZWZvcmUgU29DDQpFT0YgYW5kIFNPRiBhcmUgbG9jYXRpb24gaW4gdGhlIHNhbWUgaGFyZHdhcmUg
cmVnaXN0ZXIuDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCj4gPiArfTsNCj4g
PiArDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9kYXRhIG10MjcwMV9kZHBfZHJp
dmVyX2RhdGEgPSB7DQo+ID4gICAgICAgICAubXV0ZXhfbW9kID0gbXQyNzAxX211dGV4X21vZCwN
Cj4gPiAgICAgICAgIC5tdXRleF9zb2YgPSBtdDI3MTJfbXV0ZXhfc29mLA0KPiA+IEBAIC0xODQs
NiArMjIyLDEzIEBAIHN0cnVjdCBtdGtfZGRwIHsNCj4gPiAgICAgICAgIC5tdXRleF9zb2ZfcmVn
ID0gTVQyNzAxX0RJU1BfTVVURVgwX1NPRjAsDQo+ID4gIH07DQo+ID4NCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
