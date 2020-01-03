Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AD3C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 06:53:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E3A217F4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 06:53:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DoskWQzx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uQSWzAcN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24E3A217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATlma0WlUN9DNvEbfwGnbhklYB7aYamQIb1SKq8otVU=; b=DoskWQzxIJWpyG
	YlF+OU/SkcDPMPpckJUpALaqaqQS28F/YT53hCXn1dnTZyv+InE2TbAvRK8BtyKc1e1tIj/MH4Do0
	FDdogpoh7gGYDHVgc9lMqXSGBwuK9n3AHJ0WXG3rhAgjx6ayh7eDxAWa/IFlAVACrF6JhQJ+/g6r8
	z1w1Cv6Ub5yB0wRQ6ow8C65vG4Vo2XBazXmPJEnr+NfU9SZmdQII27VC3NjGUHa7ySps60drAFsvx
	iQT+lCO8txTy+SaUJIrNIudFLFlzfIjLdbS7+gyq7LNKhxrAwKLoeGYqRqAGPbBo/9d+ug4VGZtSK
	2nz8yGnguVDSLEqeimtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inGpX-0000xL-8L; Fri, 03 Jan 2020 06:53:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inGp1-0000Tm-F0; Fri, 03 Jan 2020 06:52:38 +0000
X-UUID: 54604a20a0eb4e07bb366da70921b34c-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xwzG4NnajscOhRyiURwp7AqLOfckk5nRtMtZCjbQoco=; 
 b=uQSWzAcNSZJnr4p2tLpG7G3wcZl7QOwus/yp0QLQYtqRnQzP7IA35pgfyEjAFw7RKan4n5Z5EDahwz6HGzzXD2exvxFWhvGhubrM5pFyCc06S12YbioD39FFS23PMYJOUgn7TEzfiyl/Ff+WBOw+KtBpkVxKDNrwaVMhmNvRU5U=;
X-UUID: 54604a20a0eb4e07bb366da70921b34c-20200102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 998554716; Thu, 02 Jan 2020 22:52:32 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 22:44:14 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 14:43:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 3 Jan 2020 14:44:08 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <hsinyi@chromium.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v3,4/8] arm64: dts: mt8183: Configure CPU cooling
Date: Fri, 3 Jan 2020 14:44:03 +0800
Message-ID: <20200103064407.19861-5-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200103064407.19861-1-michael.kao@mediatek.com>
References: <20200103064407.19861-1-michael.kao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_225235_503307_F7604B23 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Kao <michael.kao@mediatek.com>, Matthias Kaehlcke <mka@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+DQoNCkFkZCB0d28gcGFz
c2l2ZSB0cmlwIHBvaW50cyBhdCA2OMKwQyBhbmQgODXCsEMgZm9yIHRoZSBDUFUgdGVtcGVyYXR1
cmUuDQoNClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3Jn
Pg0KU2lnbmVkLW9mZi1ieTogTWljaGFlbCBLYW8gPG1pY2hhZWwua2FvQG1lZGlhdGVrLmNvbT4N
Ci0tLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgfCA1NSArKysr
KysrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQ0K
DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kNCmluZGV4IDYzMzc4YWUx
NGExNi4uNzg1NzVjMzE4M2E0IDEwMDY0NA0KLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxODMuZHRzaQ0KKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
ODMuZHRzaQ0KQEAgLTYwOSw2ICs2MDksNjEgQEANCiAJCQkJcG9sbGluZy1kZWxheSA9IDwxMDAw
PjsNCiAJCQkJdGhlcm1hbC1zZW5zb3JzID0gPCZ0aGVybWFsIDA+Ow0KIAkJCQlzdXN0YWluYWJs
ZS1wb3dlciA9IDw1MDAwPjsNCisNCisJCQkJdHJpcHMgew0KKwkJCQkJdGhyZXNob2xkOiB0cmlw
LXBvaW50QDAgew0KKwkJCQkJCXRlbXBlcmF0dXJlID0gPDY4MDAwPjsNCisJCQkJCQloeXN0ZXJl
c2lzID0gPDIwMDA+Ow0KKwkJCQkJCXR5cGUgPSAicGFzc2l2ZSI7DQorCQkJCQl9Ow0KKw0KKwkJ
CQkJdGFyZ2V0OiB0cmlwLXBvaW50QDEgew0KKwkJCQkJCXRlbXBlcmF0dXJlID0gPDg1MDAwPjsN
CisJCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+Ow0KKwkJCQkJCXR5cGUgPSAicGFzc2l2ZSI7DQor
CQkJCQl9Ow0KKw0KKwkJCQkJY3B1X2NyaXQ6IGNwdS1jcml0IHsNCisJCQkJCQl0ZW1wZXJhdHVy
ZSA9IDwxMTUwMDA+Ow0KKwkJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47DQorCQkJCQkJdHlwZSA9
ICJjcml0aWNhbCI7DQorCQkJCQl9Ow0KKwkJCQl9Ow0KKw0KKwkJCQljb29saW5nLW1hcHMgew0K
KwkJCQkJbWFwMCB7DQorCQkJCQkJdHJpcCA9IDwmdGFyZ2V0PjsNCisJCQkJCQljb29saW5nLWRl
dmljZSA9IDwmY3B1MA0KKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUDQorCQkJCQkJCVRIRVJNQUxf
Tk9fTElNSVQ+LA0KKwkJCQkJCQkJIDwmY3B1MQ0KKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUDQor
CQkJCQkJCVRIRVJNQUxfTk9fTElNSVQ+LA0KKwkJCQkJCQkJIDwmY3B1Mg0KKwkJCQkJCQlUSEVS
TUFMX05PX0xJTUlUDQorCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQ+LA0KKwkJCQkJCQkJIDwmY3B1
Mw0KKwkJCQkJCQlUSEVSTUFMX05PX0xJTUlUDQorCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQ+Ow0K
KwkJCQkJCWNvbnRyaWJ1dGlvbiA9IDwzMDcyPjsNCisJCQkJCX07DQorCQkJCQltYXAxIHsNCisJ
CQkJCQl0cmlwID0gPCZ0YXJnZXQ+Ow0KKwkJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZjcHU0DQor
CQkJCQkJCVRIRVJNQUxfTk9fTElNSVQNCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVD4sDQorCQkJ
CQkJCQkgPCZjcHU1DQorCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQNCisJCQkJCQkJVEhFUk1BTF9O
T19MSU1JVD4sDQorCQkJCQkJCQkgPCZjcHU2DQorCQkJCQkJCVRIRVJNQUxfTk9fTElNSVQNCisJ
CQkJCQkJVEhFUk1BTF9OT19MSU1JVD4sDQorCQkJCQkJCQkgPCZjcHU3DQorCQkJCQkJCVRIRVJN
QUxfTk9fTElNSVQNCisJCQkJCQkJVEhFUk1BTF9OT19MSU1JVD47DQorCQkJCQkJY29udHJpYnV0
aW9uID0gPDEwMjQ+Ow0KKwkJCQkJfTsNCisJCQkJfTsNCiAJCQl9Ow0KIA0KIAkJCS8qIFRoZSB0
enRzMSB+IHR6dHM2IGRvbid0IG5lZWQgdG8gcG9sbGluZyAqLw0KLS0gDQoyLjE4LjANCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
