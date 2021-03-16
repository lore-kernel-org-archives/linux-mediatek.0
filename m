Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBE7C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 07:02:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6C6364FC0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 07:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6C6364FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7NnOSDx9yd354d/fdEZyaV8XNizzZoxQ4GwbA1/6r1c=; b=TVQmma91YoYg5kPxV3GF1m9es
	m1wdzWR99yDZDTvQuyxqlQR46S5vXLZDYh8jE8nLTt7Gq0z+L8HZocBrclCWflA31BsFgmuM6LEb3
	tAe/t61ib9A3dPIktfuPextUCFrNSQI77mkv/71hwy2rtzrEBHT4w4XPyQfDY8fuWKq8qguyLYej0
	XzpFLzY5tXVcF+Evb6lDoam2VT3kXR0r9VrU+8oHWT2X1s6PaX4jjtkQdPbr5yyal8BxYV/mIhNZx
	DOsDqEArqBlSmbRc1tzDSPSbpWxQ5R1CH9f4GO35xhZ1Q8rANE9FX/snAGNNc+0KfWiakDQNVf6QH
	s0MHj+mYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM3iY-00HZqV-Uh; Tue, 16 Mar 2021 07:02:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM3iL-00HZnL-Ew; Tue, 16 Mar 2021 07:02:04 +0000
X-UUID: f490e6f45254482d99cde7e606a77cad-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=D6TvuBrDo9Tj+Y9oMnFg6LURDUlNG0WOPrnwxEFS93g=; 
 b=dGirSR2kziraSWqJztljfOcbSYyKb9kWOnX2Mg65eOYLkpgvZ+tbfRikurEiZv0vsNzfCaExYkqhc8pAtwSrFJ6SveNTB8C7ZNw32OXQftyuyIbMPKDJX4tB05GmgJ6CxhiwiFcEK/UOYr5VFL9dE5uCUQcfKNkBA0G2vBILstI=;
X-UUID: f490e6f45254482d99cde7e606a77cad-20210315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 168497523; Mon, 15 Mar 2021 23:01:53 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 00:01:46 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 15:01:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Mar 2021 15:01:44 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: <michael.kao@mediatek.com>, <fan.chen@mediatek.com>, Zhang Rui
 <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 <linux-pm@vger.kernel.org>, <srv_heupstream@mediatek.com>
CC: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Matthias Kaehlcke <mka@chromium.org>
Subject: [v7,2/3] arm64: dts: mt8183: Configure CPU cooling
Date: Tue, 16 Mar 2021 15:01:43 +0800
Message-ID: <20210316070144.28440-3-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210316070144.28440-1-michael.kao@mediatek.com>
References: <20210316070144.28440-1-michael.kao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_070201_875872_D0CD1BCF 
X-CRM114-Status: GOOD (  12.11  )
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
Content-Type: multipart/mixed; boundary="===============3497380909129012813=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3497380909129012813==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: base64

RnJvbTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+DQoNCkFkZCB0d28gcGFz
c2l2ZSB0cmlwIHBvaW50cyBhdCA2OMKwQyBhbmQgODDCsEMgZm9yIHRoZSBDUFUgdGVtcGVyYXR1
cmUuDQoNClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3Jn
Pg0KU2lnbmVkLW9mZi1ieTogTWljaGFlbCBLYW8gPG1pY2hhZWwua2FvQG1lZGlhdGVrLmNvbT4N
ClRlc3RlZC1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPg0KLS0tDQogYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSB8IDU2ICsrKysrKysrKysrKysr
KysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpIGIvYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQ0KaW5kZXggZDM1NTBhZjA2NDA4Li4xYWQw
YTFkNTVkNTMgMTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4
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
dHp0czEgfiB0enRzNiBkb24ndCBuZWVkIHRvIHBvbGxpbmcgKi8NCi0tIA0KMi4xOC4wDQo=



--===============3497380909129012813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3497380909129012813==--
