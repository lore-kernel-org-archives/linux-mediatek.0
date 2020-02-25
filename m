Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E9FC35DF5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 09:34:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C16402176D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 09:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RLAGtP+H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qA3mC2yx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C16402176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qlx6Pq9K7y1WxKo7lYUeVaXT5HJlh22iFjAkCAqQ4/k=; b=RLAGtP+HvlzQJA
	zhbRPMrSZOKwZjkxli38ECCWwPhRI2mu22jZHyNCvvOUYeU6d1JXClQ+R7HbpXOcp6LDL042NczPt
	T9Er1T8IfWT319rZZe3J3xQukullZ1Ogx77bjnANOW536KJ0LutIj6pVpDEnMzlcQ/5dYRZnuYT5q
	o/sThiHWWtw3szEAQrqXrAZJvCYFjm2ee8vxwpen9OM+RLpbIV0lu0P3m2yS39wyF/+7oVvar3ngH
	lCcmGnM4JY8yKtBZaoLPJbZ6QnbDAJZwAH/oV42jHlGGiIn1GULUJXxZIX0V5upIfFAVFkRb/anr3
	cKxZiDgRnE08bLaqn0VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Wbd-0003Mz-QJ; Tue, 25 Feb 2020 09:34:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6WbZ-0003M4-5l; Tue, 25 Feb 2020 09:34:20 +0000
X-UUID: aed5df1548404bfca0bfb866c1cd1a11-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JeEC5O8xipDZ9SuDmxbr6QlkFs0WLiFE6a28FBx3yAs=; 
 b=qA3mC2yxMB6SygcRlzRMOunid/h/msgFn7q9EfYybwvsnVddVA8e/5Rbyl1ce8dsm12BVGf+sRYd0ZbMOdyKcFPjpckHBJ6fvrLIzPK5yPZA6jAc9TTdDGcO28Dby0/kRPvndC1UvYweYUztVghzl7LFWLknyV7m4Zox3zI02SU=;
X-UUID: aed5df1548404bfca0bfb866c1cd1a11-20200225
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 46452812; Tue, 25 Feb 2020 01:34:09 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 01:35:11 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 17:33:14 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 25 Feb 2020 17:31:51 +0800
Message-ID: <1582623246.27539.3.camel@mtksdccf07>
Subject: Re: [PATCH v3,4/8] arm64: dts: mt8183: Configure CPU cooling
From: Michael Kao <michael.kao@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>
Date: Tue, 25 Feb 2020 17:34:06 +0800
In-Reply-To: <20200103064407.19861-5-michael.kao@mediatek.com>
References: <20200103064407.19861-1-michael.kao@mediatek.com>
 <20200103064407.19861-5-michael.kao@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_013417_227155_F33CFA51 
X-CRM114-Status: GOOD (  13.12  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMDIwLTAxLTAzIGF0IDE0OjQ0ICswODAwLCBNaWNoYWVsIEthbyB3cm90ZToNCj4g
RnJvbTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+DQo+IA0KPiBBZGQgdHdv
IHBhc3NpdmUgdHJpcCBwb2ludHMgYXQgNjjCsEMgYW5kIDg1wrBDIGZvciB0aGUgQ1BVIHRlbXBl
cmF0dXJlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJv
bWl1bS5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgS2FvIDxtaWNoYWVsLmthb0BtZWRp
YXRlay5jb20+DQo+IC0tLQ0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMu
ZHRzaSB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDU1
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE4My5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMu
ZHRzaQ0KPiBpbmRleCA2MzM3OGFlMTRhMTYuLjc4NTc1YzMxODNhNCAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQ0KPiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpDQo+IEBAIC02MDksNiArNjA5LDYxIEBA
DQo+ICAJCQkJcG9sbGluZy1kZWxheSA9IDwxMDAwPjsNCj4gIAkJCQl0aGVybWFsLXNlbnNvcnMg
PSA8JnRoZXJtYWwgMD47DQo+ICAJCQkJc3VzdGFpbmFibGUtcG93ZXIgPSA8NTAwMD47DQo+ICsN
Cj4gKwkJCQl0cmlwcyB7DQo+ICsJCQkJCXRocmVzaG9sZDogdHJpcC1wb2ludEAwIHsNCj4gKwkJ
CQkJCXRlbXBlcmF0dXJlID0gPDY4MDAwPjsNCj4gKwkJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47
DQo+ICsJCQkJCQl0eXBlID0gInBhc3NpdmUiOw0KPiArCQkJCQl9Ow0KPiArDQo+ICsJCQkJCXRh
cmdldDogdHJpcC1wb2ludEAxIHsNCj4gKwkJCQkJCXRlbXBlcmF0dXJlID0gPDg1MDAwPjsNCj4g
KwkJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47DQo+ICsJCQkJCQl0eXBlID0gInBhc3NpdmUiOw0K
PiArCQkJCQl9Ow0KPiArDQo+ICsJCQkJCWNwdV9jcml0OiBjcHUtY3JpdCB7DQo+ICsJCQkJCQl0
ZW1wZXJhdHVyZSA9IDwxMTUwMDA+Ow0KPiArCQkJCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsNCj4g
KwkJCQkJCXR5cGUgPSAiY3JpdGljYWwiOw0KPiArCQkJCQl9Ow0KPiArCQkJCX07DQo+ICsNCj4g
KwkJCQljb29saW5nLW1hcHMgew0KPiArCQkJCQltYXAwIHsNCj4gKwkJCQkJCXRyaXAgPSA8JnRh
cmdldD47DQo+ICsJCQkJCQljb29saW5nLWRldmljZSA9IDwmY3B1MA0KPiArCQkJCQkJCVRIRVJN
QUxfTk9fTElNSVQNCj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPiwNCj4gKwkJCQkJCQkJIDwm
Y3B1MQ0KPiArCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQNCj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJ
TUlUPiwNCj4gKwkJCQkJCQkJIDwmY3B1Mg0KPiArCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQNCj4g
KwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPiwNCj4gKwkJCQkJCQkJIDwmY3B1Mw0KPiArCQkJCQkJ
CVRIRVJNQUxfTk9fTElNSVQNCj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPjsNCj4gKwkJCQkJ
CWNvbnRyaWJ1dGlvbiA9IDwzMDcyPjsNCj4gKwkJCQkJfTsNCj4gKwkJCQkJbWFwMSB7DQo+ICsJ
CQkJCQl0cmlwID0gPCZ0YXJnZXQ+Ow0KPiArCQkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTQN
Cj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUDQo+ICsJCQkJCQkJVEhFUk1BTF9OT19MSU1JVD4s
DQo+ICsJCQkJCQkJCSA8JmNwdTUNCj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUDQo+ICsJCQkJ
CQkJVEhFUk1BTF9OT19MSU1JVD4sDQo+ICsJCQkJCQkJCSA8JmNwdTYNCj4gKwkJCQkJCQlUSEVS
TUFMX05PX0xJTUlUDQo+ICsJCQkJCQkJVEhFUk1BTF9OT19MSU1JVD4sDQo+ICsJCQkJCQkJCSA8
JmNwdTcNCj4gKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUDQo+ICsJCQkJCQkJVEhFUk1BTF9OT19M
SU1JVD47DQo+ICsJCQkJCQljb250cmlidXRpb24gPSA8MTAyND47DQo+ICsJCQkJCX07DQo+ICsJ
CQkJfTsNCj4gIAkJCX07DQo+ICANCj4gIAkJCS8qIFRoZSB0enRzMSB+IHR6dHM2IGRvbid0IG5l
ZWQgdG8gcG9sbGluZyAqLw0KDQpHZW50YWxseSByZW1pbmQsIGRvIHlvdSBoYXZlIGFueSBjb21t
ZW50cz8NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
