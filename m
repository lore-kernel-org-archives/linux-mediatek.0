Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1502C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:19:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C4F464E28
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C4F464E28
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b7YqIg017np95EjvEPnUsjpZq2N3SS1pFgx1W1AE9Fw=; b=aDZGIKfqY0aGPWpoPhBFIZjHo
	X1KwDvlkto5N4AL8RFkMggbO5X+ZrsMp9+obOQhIdp0y8V6bAZW1i8QiJK1Jng49+UWk+/VPhnWjd
	2feZaJxQ4FXWUro8uVY3ggBl3oVlgh3erssKWClMKJUtnSPIUn1kXRNdzlNWkctXD0+09MxHvYmWI
	+0GmqE3RVTpgsQhVLKhFwoRUo099TZRCSSXmG8rOvpz2sHcjWH/syTxfpPe1Ls1XTwa074iwH3M7d
	6qZDwFJ0ysWZeviaCKnCgkt5Uq1XHgnjepSve1uHn0PzxQmTjQwrt7yvKmKmbjjq2PhrZHeNDDOVa
	9r5DJbj7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Qrp-0002An-SJ; Fri, 29 Jan 2021 10:19:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Qrk-00028B-7A; Fri, 29 Jan 2021 10:19:01 +0000
X-UUID: 54032a008eae484b9eb02fe130a01421-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=V+Ewp9/pDoC6BMoC3Kju5U8V8S16A0mf05oKNWfY4RQ=; 
 b=XvT/PQ8ietAzFIkIDjFRn6ffiZ5S5kPAak2r/ZUF0d5OAQj3rBoRBqMIc9bDdhlUgo9U6VArx5+p9JrRMnM6dd73M6JUlfguXRKMhkvErvSOkT2V+3WTpujEtfimt+HRDyP4J87LSktAJCe/JAz589mZpbDK76hITnBhGwNrtrI=;
X-UUID: 54032a008eae484b9eb02fe130a01421-20210129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 248873528; Fri, 29 Jan 2021 02:18:55 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 02:10:14 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 18:10:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 29 Jan 2021 18:10:13 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: <michael.kao@mediatek.com>, <fan.chen@mediatek.com>, Zhang Rui
 <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 <linux-pm@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [v6,2/3] arm64: dts: mt8183: Configure CPU cooling
Date: Fri, 29 Jan 2021 18:10:11 +0800
Message-ID: <20210129101012.25180-3-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210129101012.25180-1-michael.kao@mediatek.com>
References: <20210129101012.25180-1-michael.kao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_051900_422279_2C998866 
X-CRM114-Status: GOOD (  12.31  )
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
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+DQoNCkFkZCB0d28gcGFz
c2l2ZSB0cmlwIHBvaW50cyBhdCA2OMKwQyBhbmQgODDCsEMgZm9yIHRoZSBDUFUgdGVtcGVyYXR1
cmUuDQoNClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3Jn
Pg0KU2lnbmVkLW9mZi1ieTogTWljaGFlbCBLYW8gPG1pY2hhZWwua2FvQG1lZGlhdGVrLmNvbT4N
ClRlc3RlZC1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPg0KLS0tDQogYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSB8IDU2ICsrKysrKysrKysrKysr
KysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpIGIvYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQ0KaW5kZXggMGFhMzFkMzM4ZmIwLi42NGI5
YmY2ZDVkMWEgMTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4
My5kdHNpDQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpDQpA
QCAtMTMsNiArMTMsNyBAQA0KICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tdDgxODMtcG93
ZXIuaD4NCiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgxODMtcmVz
ZXRzLmg+DQogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BoeS9waHkuaD4NCisjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvdGhlcm1hbC90aGVybWFsLmg+DQogI2luY2x1ZGUgIm10ODE4My1waW5mdW5jLmgi
DQogDQogLyB7DQpAQCAtNjc4LDYgKzY3OSw2MSBAQA0KIAkJCQlwb2xsaW5nLWRlbGF5ID0gPDUw
MD47DQogCQkJCXRoZXJtYWwtc2Vuc29ycyA9IDwmdGhlcm1hbCAwPjsNCiAJCQkJc3VzdGFpbmFi
bGUtcG93ZXIgPSA8NTAwMD47DQorDQorCQkJCXRyaXBzIHsNCisJCQkJCXRocmVzaG9sZDogdHJp
cC1wb2ludEAwIHsNCisJCQkJCQl0ZW1wZXJhdHVyZSA9IDw2ODAwMD47DQorCQkJCQkJaHlzdGVy
ZXNpcyA9IDwyMDAwPjsNCisJCQkJCQl0eXBlID0gInBhc3NpdmUiOw0KKwkJCQkJfTsNCisNCisJ
CQkJCXRhcmdldDogdHJpcC1wb2ludEAxIHsNCisJCQkJCQl0ZW1wZXJhdHVyZSA9IDw4MDAwMD47
DQorCQkJCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsNCisJCQkJCQl0eXBlID0gInBhc3NpdmUiOw0K
KwkJCQkJfTsNCisNCisJCQkJCWNwdV9jcml0OiBjcHUtY3JpdCB7DQorCQkJCQkJdGVtcGVyYXR1
cmUgPSA8MTE1MDAwPjsNCisJCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+Ow0KKwkJCQkJCXR5cGUg
PSAiY3JpdGljYWwiOw0KKwkJCQkJfTsNCisJCQkJfTsNCisNCisJCQkJY29vbGluZy1tYXBzIHsN
CisJCQkJCW1hcDAgew0KKwkJCQkJCXRyaXAgPSA8JnRhcmdldD47DQorCQkJCQkJY29vbGluZy1k
ZXZpY2UgPSA8JmNwdTANCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVA0KKwkJCQkJCQlUSEVSTUFM
X05PX0xJTUlUPiwNCisJCQkJCQkJCSA8JmNwdTENCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVA0K
KwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPiwNCisJCQkJCQkJCSA8JmNwdTINCisJCQkJCQkJVEhF
Uk1BTF9OT19MSU1JVA0KKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPiwNCisJCQkJCQkJCSA8JmNw
dTMNCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVA0KKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPjsN
CisJCQkJCQljb250cmlidXRpb24gPSA8MzA3Mj47DQorCQkJCQl9Ow0KKwkJCQkJbWFwMSB7DQor
CQkJCQkJdHJpcCA9IDwmdGFyZ2V0PjsNCisJCQkJCQljb29saW5nLWRldmljZSA9IDwmY3B1NA0K
KwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUDQorCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQ+LA0KKwkJ
CQkJCQkJIDwmY3B1NQ0KKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUDQorCQkJCQkJCVRIRVJNQUxf
Tk9fTElNSVQ+LA0KKwkJCQkJCQkJIDwmY3B1Ng0KKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUDQor
CQkJCQkJCVRIRVJNQUxfTk9fTElNSVQ+LA0KKwkJCQkJCQkJIDwmY3B1Nw0KKwkJCQkJCQlUSEVS
TUFMX05PX0xJTUlUDQorCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQ+Ow0KKwkJCQkJCWNvbnRyaWJ1
dGlvbiA9IDwxMDI0PjsNCisJCQkJCX07DQorCQkJCX07DQogCQkJfTsNCiANCiAJCQkvKiBUaGUg
dHp0czEgfiB0enRzNiBkb24ndCBuZWVkIHRvIHBvbGxpbmcgKi8NCi0tIA0KMi4xOC4wDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
