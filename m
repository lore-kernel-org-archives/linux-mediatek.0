Return-Path: <SRS0=hrCJ=5I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA664C4332E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 12:16:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB3672078B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 12:16:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MFyZbOxX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WVq7BLBF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB3672078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2IivbzzftMlXILbOklvFivmjHzPhpgVv0yywekZViY=; b=MFyZbOxXbFlwq4
	ZX9MyeI89plQvL5dJkKUqfLKUFgV77Kt41SIudqVq7TRJLbf3R3qjrSN0rdVnupqzTKoPKZWgcdHi
	XCQvtiWCLtoGOQiUCjwSn6q3lTqdH7QAiEc8VQTfSakawRDbPnDEOZI5M5DmuiqP0Phlu0+33YKU9
	y6JMYaSsKTSZCcI7IT9vafJNCGEtkwMteN50Wy1tT1dvDrujosgnNAVkEmsZqxSBy0OI6Wn6kUF8b
	bzlfeBpViITQ3CCq7uVVGxiWT7TtFeVutP7ECMheudiSdK5+CHU2f3knSDs1vuHRHae8Kz2veDe/L
	MtvAscXgXBDBkKqn7kOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGLzu-00073n-Bq; Mon, 23 Mar 2020 12:16:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGLzf-0006oU-Pl; Mon, 23 Mar 2020 12:15:49 +0000
X-UUID: 39c0cdbfd99e499f8bec9a809d2759fc-20200323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Syxtl64f/oiHmFDozNPlTQ/y9hPgVybUbznOPaoIJLs=; 
 b=WVq7BLBFAVRGwysc2XISyaUEeWklgVbg4nAC5J1+72gq0s9hqfPeGmaRE22VMMS1//scEXCwM/w2NiRmYfM1w/gCV5GHYrM61lrM1uMi3Gk54jHUdmXeeOw+ppDb1tFtb4mqWae3A6+n1zBecWPV5UL3zXJfOayjRB7PA1wGfMU=;
X-UUID: 39c0cdbfd99e499f8bec9a809d2759fc-20200323
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1296781111; Mon, 23 Mar 2020 04:15:42 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Mar 2020 05:15:40 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Mar 2020 20:15:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 23 Mar 2020 20:15:38 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui
 <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <hsinyi@chromium.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <michael.kao@mediatek.com>
Subject: [v4,4/7] arm64: dts: mt8183: Configure CPU cooling
Date: Mon, 23 Mar 2020 20:15:34 +0800
Message-ID: <20200323121537.22697-5-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200323121537.22697-1-michael.kao@mediatek.com>
References: <20200323121537.22697-1-michael.kao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_051547_837041_830AE7ED 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+DQoNCkFkZCB0d28gcGFz
c2l2ZSB0cmlwIHBvaW50cyBhdCA2OMKwQyBhbmQgODDCsEMgZm9yIHRoZSBDUFUgdGVtcGVyYXR1
cmUuDQoNClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3Jn
Pg0KU2lnbmVkLW9mZi1ieTogTWljaGFlbCBLYW8gPG1pY2hhZWwua2FvQG1lZGlhdGVrLmNvbT4N
Ci0tLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgfCA1NSArKysr
KysrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQ0K
DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kNCmluZGV4IDE4MmZhNjI2
NGUwZC4uNTlhYjI5NTdkODVkIDEwMDY0NA0KLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxODMuZHRzaQ0KKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
ODMuZHRzaQ0KQEAgLTY3NSw2ICs2NzUsNjEgQEANCiAJCQkJcG9sbGluZy1kZWxheSA9IDw1MDA+
Ow0KIAkJCQl0aGVybWFsLXNlbnNvcnMgPSA8JnRoZXJtYWwgMD47DQogCQkJCXN1c3RhaW5hYmxl
LXBvd2VyID0gPDUwMDA+Ow0KKw0KKwkJCQl0cmlwcyB7DQorCQkJCQl0aHJlc2hvbGQ6IHRyaXAt
cG9pbnRAMCB7DQorCQkJCQkJdGVtcGVyYXR1cmUgPSA8NjgwMDA+Ow0KKwkJCQkJCWh5c3RlcmVz
aXMgPSA8MjAwMD47DQorCQkJCQkJdHlwZSA9ICJwYXNzaXZlIjsNCisJCQkJCX07DQorDQorCQkJ
CQl0YXJnZXQ6IHRyaXAtcG9pbnRAMSB7DQorCQkJCQkJdGVtcGVyYXR1cmUgPSA8ODAwMDA+Ow0K
KwkJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47DQorCQkJCQkJdHlwZSA9ICJwYXNzaXZlIjsNCisJ
CQkJCX07DQorDQorCQkJCQljcHVfY3JpdDogY3B1LWNyaXQgew0KKwkJCQkJCXRlbXBlcmF0dXJl
ID0gPDExNTAwMD47DQorCQkJCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsNCisJCQkJCQl0eXBlID0g
ImNyaXRpY2FsIjsNCisJCQkJCX07DQorCQkJCX07DQorDQorCQkJCWNvb2xpbmctbWFwcyB7DQor
CQkJCQltYXAwIHsNCisJCQkJCQl0cmlwID0gPCZ0YXJnZXQ+Ow0KKwkJCQkJCWNvb2xpbmctZGV2
aWNlID0gPCZjcHUwDQorCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQNCisJCQkJCQkJVEhFUk1BTF9O
T19MSU1JVD4sDQorCQkJCQkJCQkgPCZjcHUxDQorCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQNCisJ
CQkJCQkJVEhFUk1BTF9OT19MSU1JVD4sDQorCQkJCQkJCQkgPCZjcHUyDQorCQkJCQkJCVRIRVJN
QUxfTk9fTElNSVQNCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVD4sDQorCQkJCQkJCQkgPCZjcHUz
DQorCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQNCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVD47DQor
CQkJCQkJY29udHJpYnV0aW9uID0gPDMwNzI+Ow0KKwkJCQkJfTsNCisJCQkJCW1hcDEgew0KKwkJ
CQkJCXRyaXAgPSA8JnRhcmdldD47DQorCQkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTQNCisJ
CQkJCQkJVEhFUk1BTF9OT19MSU1JVA0KKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPiwNCisJCQkJ
CQkJCSA8JmNwdTUNCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVA0KKwkJCQkJCQlUSEVSTUFMX05P
X0xJTUlUPiwNCisJCQkJCQkJCSA8JmNwdTYNCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVA0KKwkJ
CQkJCQlUSEVSTUFMX05PX0xJTUlUPiwNCisJCQkJCQkJCSA8JmNwdTcNCisJCQkJCQkJVEhFUk1B
TF9OT19MSU1JVA0KKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUPjsNCisJCQkJCQljb250cmlidXRp
b24gPSA8MTAyND47DQorCQkJCQl9Ow0KKwkJCQl9Ow0KIAkJCX07DQogDQogCQkJLyogVGhlIHR6
dHMxIH4gdHp0czYgZG9uJ3QgbmVlZCB0byBwb2xsaW5nICovDQotLSANCjIuMTguMA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
