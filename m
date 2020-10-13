Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E89C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 10:24:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D4502080A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 10:24:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KLjjsngm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="V5HvdVYD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D4502080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HYMD/CGDhpt2NrueofYqMkFPyYZ+wEi8Qgkj52/fzmQ=; b=KLjjsngmYgO93qP3fdnz6JMU0
	nCtYgZwG7Q93Zs0azp+WRae8cclJbZYTFFNW4x0ieATq5h+pznpz4GxU03wwXgHj1xoh/NsUzsgou
	Zkqh6a/ROvmcUAp0AwqoyAjxD1TFeWPQ3097rfy8FoQSnIPDTppSaX0+rORgbVSPcs/eRIj+1zYx9
	m941JHsl1b2ULwCuhOmedsQ9vshlfVwP4GmgZL5HJJOzAvMU22eTYnV/GAy+BzV9KZJZIwq+K9dyn
	g2ytims9a6esYzyVPZj4iknLkeYpOpHXbml2frLNJQBFPlltbvgYQS8tuFs07uPon8jH2WxFAwDRR
	MHbZLj8mA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSHTb-0001yR-0v; Tue, 13 Oct 2020 10:24:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSHTW-0001wU-N2; Tue, 13 Oct 2020 10:24:12 +0000
X-UUID: a5bcb04602ba4ba6a8e0ffa76723d566-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qiedL0JxT+BhogXj0HkQMKXH7NoJA144Q5PDLAu55v0=; 
 b=V5HvdVYDIVnMjV1ReyIE25A/9J9z/mxi+7NkB1OuCxOlYph/vMTd8BA2APOe5kX0Ih0y8gWT+YmZQ+1d3evIhFSokidgtfHC5dyaileTKtng/JNX3DUZUcWDjZ0tVNsDhFnuoxrEudYfx9CmJA8i2K2PKavoGNb5uOg1XQJBIcE=;
X-UUID: a5bcb04602ba4ba6a8e0ffa76723d566-20201013
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 642378932; Tue, 13 Oct 2020 02:24:04 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 03:24:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 18:24:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Oct 2020 18:24:00 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [v5 2/3] arm64: dts: mt8183: Configure CPU cooling
Date: Tue, 13 Oct 2020 18:23:57 +0800
Message-ID: <20201013102358.22588-3-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201013102358.22588-1-michael.kao@mediatek.com>
References: <20201013102358.22588-1-michael.kao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_062410_895339_41B330F7 
X-CRM114-Status: GOOD (  13.21  )
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
 linux-kernel@vger.kernel.org, Michael Kao <michael.kao@mediatek.com>,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+DQoNCkFkZCB0d28gcGFz
c2l2ZSB0cmlwIHBvaW50cyBhdCA2OMKwQyBhbmQgODDCsEMgZm9yIHRoZSBDUFUgdGVtcGVyYXR1
cmUuDQoNClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3Jn
Pg0KU2lnbmVkLW9mZi1ieTogTWljaGFlbCBLYW8gPG1pY2hhZWwua2FvQG1lZGlhdGVrLmNvbT4N
Ci0tLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgfCA1NiArKysr
KysrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKQ0K
DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kNCmluZGV4IDFjZDA5M2Nm
MzNmMy4uMDYxNGYxOGExZWEyIDEwMDY0NA0KLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxODMuZHRzaQ0KKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
ODMuZHRzaQ0KQEAgLTEwLDYgKzEwLDcgQEANCiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvaXJxLmg+DQogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0LWNvbnRy
b2xsZXIvbXQ4MTgzLXJlc2V0cy5oPg0KICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waHkvcGh5Lmg+
DQorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3RoZXJtYWwvdGhlcm1hbC5oPg0KICNpbmNsdWRlICJt
dDgxODMtcGluZnVuYy5oIg0KIA0KIC8gew0KQEAgLTQ1MCw2ICs0NTEsNjEgQEANCiAJCQkJcG9s
bGluZy1kZWxheSA9IDw1MDA+Ow0KIAkJCQl0aGVybWFsLXNlbnNvcnMgPSA8JnRoZXJtYWwgMD47
DQogCQkJCXN1c3RhaW5hYmxlLXBvd2VyID0gPDUwMDA+Ow0KKw0KKwkJCQl0cmlwcyB7DQorCQkJ
CQl0aHJlc2hvbGQ6IHRyaXAtcG9pbnRAMCB7DQorCQkJCQkJdGVtcGVyYXR1cmUgPSA8NjgwMDA+
Ow0KKwkJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47DQorCQkJCQkJdHlwZSA9ICJwYXNzaXZlIjsN
CisJCQkJCX07DQorDQorCQkJCQl0YXJnZXQ6IHRyaXAtcG9pbnRAMSB7DQorCQkJCQkJdGVtcGVy
YXR1cmUgPSA8ODAwMDA+Ow0KKwkJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47DQorCQkJCQkJdHlw
ZSA9ICJwYXNzaXZlIjsNCisJCQkJCX07DQorDQorCQkJCQljcHVfY3JpdDogY3B1LWNyaXQgew0K
KwkJCQkJCXRlbXBlcmF0dXJlID0gPDExNTAwMD47DQorCQkJCQkJaHlzdGVyZXNpcyA9IDwyMDAw
PjsNCisJCQkJCQl0eXBlID0gImNyaXRpY2FsIjsNCisJCQkJCX07DQorCQkJCX07DQorDQorCQkJ
CWNvb2xpbmctbWFwcyB7DQorCQkJCQltYXAwIHsNCisJCQkJCQl0cmlwID0gPCZ0YXJnZXQ+Ow0K
KwkJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZjcHUwDQorCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQN
CisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVD4sDQorCQkJCQkJCQkgPCZjcHUxDQorCQkJCQkJCVRI
RVJNQUxfTk9fTElNSVQNCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVD4sDQorCQkJCQkJCQkgPCZj
cHUyDQorCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQNCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVD4s
DQorCQkJCQkJCQkgPCZjcHUzDQorCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQNCisJCQkJCQkJVEhF
Uk1BTF9OT19MSU1JVD47DQorCQkJCQkJY29udHJpYnV0aW9uID0gPDMwNzI+Ow0KKwkJCQkJfTsN
CisJCQkJCW1hcDEgew0KKwkJCQkJCXRyaXAgPSA8JnRhcmdldD47DQorCQkJCQkJY29vbGluZy1k
ZXZpY2UgPSA8JmNwdTQNCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVA0KKwkJCQkJCQlUSEVSTUFM
X05PX0xJTUlUPiwNCisJCQkJCQkJCSA8JmNwdTUNCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVA0K
KwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPiwNCisJCQkJCQkJCSA8JmNwdTYNCisJCQkJCQkJVEhF
Uk1BTF9OT19MSU1JVA0KKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPiwNCisJCQkJCQkJCSA8JmNw
dTcNCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVA0KKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPjsN
CisJCQkJCQljb250cmlidXRpb24gPSA8MTAyND47DQorCQkJCQl9Ow0KKwkJCQl9Ow0KIAkJCX07
DQogDQogCQkJLyogVGhlIHR6dHMxIH4gdHp0czYgZG9uJ3QgbmVlZCB0byBwb2xsaW5nICovDQot
LSANCjIuMTguMA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
