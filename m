Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKYq7OKcqNIUP6ZtxCSnViR69oGCbABZ3hsGQHeMwGo=; b=bko1wsvjf8bO9a
	E/9sSNjq1DSfvscl5JWTNcUsRoyZ+70lb2+niUCLXh4Gtuay+LgL7QVU3q1t94bzYDtUQ8u0u/Szv
	+ierbCw3xAcwnNmRAGKPIW+ywrrIdiA4iPnHKxIzaPZeb1u+HV+a73drvR7tpIV2eK25Yg5yRBfA8
	wFnNEJvbaZmBPm18efCB9OvfnkIZfUhWpbsjIwLkzQ7sBtg/FyEFdQIL1LVu3kESGb63CfbaAw+BF
	H/dkzYMFzPJtMeBIKC/sGCfPsWgFN4wRp/T8ftwJzujJccXjRWGQ58SIQPIuBdLTLgkwdpH2XIbji
	8S3vUMUV5f6YIzWHaUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5XZ-003MDj-6V; Mon, 23 May 2022 10:43:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4Ro-002sZX-Oh; Mon, 23 May 2022 09:33:58 +0000
X-UUID: c9691fc8f84444de8f6851c83a158fb8-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:f7cc9274-14f9-49aa-a040-5da284f0b9f8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:cbf6477a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: c9691fc8f84444de8f6851c83a158fb8-20220523
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1768473937; Mon, 23 May 2022 02:33:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 02:33:49 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 17:33:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 17:33:48 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <nfraprado@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [RESEND v8 01/19] clk: mediatek: reset: Add reset.h
Date: Mon, 23 May 2022 17:33:28 +0800
Message-ID: <20220523093346.28493-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_023356_929620_FEEFFFC4 
X-CRM114-Status: GOOD (  15.46  )
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

QWRkIGEgbmV3IGZpbGUgInJlc2V0LmgiIHRvIHBsYWNlIHNvbWUgZGVmaW5pdGlvbnMgZm9yIGNs
b2NrIHJlc2V0LgoKU2lnbmVkLW9mZi1ieTogUmV4LUJDIENoZW4gPHJleC1iYy5jaGVuQG1lZGlh
dGVrLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9n
aW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBOw61jb2xhcyBG
LiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+ClRlc3RlZC1ieTogTsOtY29s
YXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgotLS0KIGRyaXZlcnMv
Y2xrL21lZGlhdGVrL2Nsay1tdGsuaCB8ICA4ICsrLS0tLS0tCiBkcml2ZXJzL2Nsay9tZWRpYXRl
ay9yZXNldC5jICAgfCAgOSArLS0tLS0tLS0KIGRyaXZlcnMvY2xrL21lZGlhdGVrL3Jlc2V0Lmgg
ICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNl
cnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Ns
ay9tZWRpYXRlay9yZXNldC5oCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xr
LW10ay5oIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ay5oCmluZGV4IGFkYjEzMDRkMzVk
NC4uNmVkMGM3NDVjYWUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXRr
LmgKKysrIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ay5oCkBAIC0xMyw2ICsxMyw4IEBA
CiAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgog
CisjaW5jbHVkZSAicmVzZXQuaCIKKwogI2RlZmluZSBNQVhfTVVYX0dBVEVfQklUCTMxCiAjZGVm
aW5lIElOVkFMSURfTVVYX0dBVEVfQklUCShNQVhfTVVYX0dBVEVfQklUICsgMSkKIApAQCAtMTg3
LDEyICsxODksNiBAQCB2b2lkIG10a19mcmVlX2Nsa19kYXRhKHN0cnVjdCBjbGtfaHdfb25lY2Vs
bF9kYXRhICpjbGtfZGF0YSk7CiBzdHJ1Y3QgY2xrX2h3ICptdGtfY2xrX3JlZ2lzdGVyX3JlZjJ1
c2JfdHgoY29uc3QgY2hhciAqbmFtZSwKIAkJCWNvbnN0IGNoYXIgKnBhcmVudF9uYW1lLCB2b2lk
IF9faW9tZW0gKnJlZyk7CiAKLXZvaWQgbXRrX3JlZ2lzdGVyX3Jlc2V0X2NvbnRyb2xsZXIoc3Ry
dWN0IGRldmljZV9ub2RlICpucCwKLQkJCXVuc2lnbmVkIGludCBudW1fcmVncywgaW50IHJlZ29m
cyk7Ci0KLXZvaWQgbXRrX3JlZ2lzdGVyX3Jlc2V0X2NvbnRyb2xsZXJfc2V0X2NscihzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wLAotCXVuc2lnbmVkIGludCBudW1fcmVncywgaW50IHJlZ29mcyk7Ci0K
IHN0cnVjdCBtdGtfY2xrX2Rlc2MgewogCWNvbnN0IHN0cnVjdCBtdGtfZ2F0ZSAqY2xrczsKIAlz
aXplX3QgbnVtX2Nsa3M7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9yZXNldC5j
IGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuYwppbmRleCBiY2VjNGI4OWY0NDkuLjlmM2Ni
MjJhZWExYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuYworKysgYi9k
cml2ZXJzL2Nsay9tZWRpYXRlay9yZXNldC5jCkBAIC04LDE2ICs4LDkgQEAKICNpbmNsdWRlIDxs
aW51eC9vZi5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUg
PGxpbnV4L3JlZ21hcC5oPgotI2luY2x1ZGUgPGxpbnV4L3Jlc2V0LWNvbnRyb2xsZXIuaD4KICNp
bmNsdWRlIDxsaW51eC9zbGFiLmg+CiAKLSNpbmNsdWRlICJjbGstbXRrLmgiCi0KLXN0cnVjdCBt
dGtfcmVzZXQgewotCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKLQlpbnQgcmVnb2ZzOwotCXN0cnVj
dCByZXNldF9jb250cm9sbGVyX2RldiByY2RldjsKLX07CisjaW5jbHVkZSAicmVzZXQuaCIKIAog
c3RhdGljIGludCBtdGtfcmVzZXRfYXNzZXJ0X3NldF9jbHIoc3RydWN0IHJlc2V0X2NvbnRyb2xs
ZXJfZGV2ICpyY2RldiwKIAl1bnNpZ25lZCBsb25nIGlkKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
bGsvbWVkaWF0ZWsvcmVzZXQuaCBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL3Jlc2V0LmgKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi43NjRhOGFmZmUyMDYKLS0tIC9kZXYv
bnVsbAorKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9yZXNldC5oCkBAIC0wLDAgKzEsMjQgQEAK
Ky8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8KKy8qCisgKiBDb3B5
cmlnaHQgKGMpIDIwMjIgTWVkaWFUZWsgSW5jLgorICovCisKKyNpZm5kZWYgX19EUlZfQ0xLX01U
S19SRVNFVF9ICisjZGVmaW5lIF9fRFJWX0NMS19NVEtfUkVTRVRfSAorCisjaW5jbHVkZSA8bGlu
dXgvcmVzZXQtY29udHJvbGxlci5oPgorI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CisKK3N0cnVj
dCBtdGtfcmVzZXQgeworCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKKwlpbnQgcmVnb2ZzOworCXN0
cnVjdCByZXNldF9jb250cm9sbGVyX2RldiByY2RldjsKK307CisKK3ZvaWQgbXRrX3JlZ2lzdGVy
X3Jlc2V0X2NvbnRyb2xsZXIoc3RydWN0IGRldmljZV9ub2RlICpucCwKKwkJCQkgICB1bnNpZ25l
ZCBpbnQgbnVtX3JlZ3MsIGludCByZWdvZnMpOworCit2b2lkIG10a19yZWdpc3Rlcl9yZXNldF9j
b250cm9sbGVyX3NldF9jbHIoc3RydWN0IGRldmljZV9ub2RlICpucCwKKwkJCQkJICAgdW5zaWdu
ZWQgaW50IG51bV9yZWdzLCBpbnQgcmVnb2ZzKTsKKworI2VuZGlmIC8qIF9fRFJWX0NMS19NVEtf
UkVTRVRfSCAqLwotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
