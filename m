Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881AFC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0FjrDkNUCpl42OCQi+z5TCOnGoZjEEOT+WVFo+b6KQ=; b=cW/4Va+zajlHPC
	L/U3Dm5p3Y9+plWK4axDJVWbfoLLuQ3vfSF0AbtMBQohk/CxielIYNFxCOOTBbd0fydEZjh/uNaAj
	XKnzWJCtR6Xx4G6Y+hgozH0hF0ZMulqzHKwlyFA45nzKaF05fzsrnSIEw8aASXe507h1yuofEbaD0
	zMmGpebGmzA7QaxFWPlm5XUvmfCpGSk3o/qvU4HvPv9fmuYHMcLjsHLeFVQ7arTg8WMPnw8ZEhOVM
	XEzP5SUrCUeeTXMhNgOEhT+8myrQ37v5+4EjaslPfwS2rdm2MMVuJoX8O9ivunE+hxQ6Vxongx1NU
	5LwpXKTjSKVk/0kjd/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5ii-003S08-WB; Mon, 23 May 2022 10:55:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4bY-002wUU-LS; Mon, 23 May 2022 09:44:05 +0000
X-UUID: f32d5e38e8f843e5b8aff844fd0613a6-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:fa898720-feb3-4f8f-b1dd-38fb1e4600e7, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:c95e487a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: f32d5e38e8f843e5b8aff844fd0613a6-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2125882649; Mon, 23 May 2022 02:43:52 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 02:33:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 17:33:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 17:33:49 +0800
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
Subject: [RESEND v8 08/19] clk: mediatek: reset: Support inuput argument index
 mode
Date: Mon, 23 May 2022 17:33:35 +0800
Message-ID: <20220523093346.28493-9-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_024400_764903_56A55E4F 
X-CRM114-Status: GOOD (  17.76  )
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

VGhlcmUgaXMgYSBsYXJnZSBudW1iZXIgb2YgbWVkaWF0ZWsgaW5mcmEgcmVzZXQgYml0cywgYnV0
IHdlIGRvIG5vdCB1c2UKYWxsIG9mIHRoZW0uIEluIGFkZGl0aW9uLCB0aGUgcHJvcGVyIGlucHV0
IGFyZ2VtZW50IG9mIHJlc2V0IGNvbnRyb2xsZXIKc291bGRlIGJlIGluZGV4LgpUaGVyZWZvcmUs
IHRvIGJlIGNvbXBhdGlibGUgd2l0aCBwcmV2aW91cyBkcml2ZXJzIGFuZCB1c2FnZSwgd2UgYWRk
CmRlc2NyaXB0aW9uIHZhcmlhYmxlcyB0byBzdG9yZSB0aGUgaWRzIHdoaWNoIGNhbiBtYXBwaW5n
IHRvIGluZGV4LgoKVG8gdXNlIHRoaXMgbW9kZSwgd2UgbmVlZCB0byBwdXQgdGhlIGlkIGluIHJz
dF9pZHhfbWFwIHRvIG1hcCBmcm9tCmluZGV4IHRvIGlkcy4gRm9yIGV4YW1wbGUsIGlmIHdlIHdh
bnQgdG8gaW5wdXQgaW5kZXggMSAodGhpcyBpbmRleAppcyB1c2VkIHRvIHNldCBiYW5rIDEgYml0
IDE0KSBmb3Igc3ZzLCB3ZSBuZWVkIHRvIGRlY2xhcmUgdGhlIHJlc2V0CmNvbnRyb2xsZXIgbGlr
ZSB0aGlzOgoKSW4gZHJpdmVyczoKc3RhdGljIHUxNiByc3Rfb2ZzW10gPSB7CiAgICAgICAgMHgx
MjAsIDB4MTMwLCAweDE0MCwgMHgxNTAsIDB4NzMwLAp9OwoKc3RhdGljIHUxNiByc3RfaWR4X21h
cFtdID0gewogICAgICAgIDAgKiAzMiArIDAsCiAgICAgICAgMSAqIDMyICsgMTQsCiAgICAgICAg
Li4uLgp9OwoKc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfY2xrX3JzdF9kZXNjIGNsa19yc3RfZGVz
YyA9IHsKICAgICAgICAudmVyc2lvbiA9IE1US19SU1RfU0VUX0NMUiwKICAgICAgICAucnN0X2Jh
bmtfb2ZzID0gcnN0X29mcywKICAgICAgICAucnN0X2JhbmtfbnIgPSBBUlJBWV9TSVpFKHJzdF9v
ZnMpLAogICAgICAgIC5yc3RfaWR4X21hcCA9IHJzdF9pZHhfbWFwLAogICAgICAgIC5yc3RfaWR4
X21hcF9uciA9IEFSUkFZX1NJWkUocnN0X2lkeF9tYXApLAp9OwoKSW4gZHRzOgpzdnM6IHsKICAg
ICAgICAuLi4KICAgICAgICByZXNldHMgPSA8JmluZnJhIDE+OwogICAgICAgIC4uLgp9OwoKU2ln
bmVkLW9mZi1ieTogUmV4LUJDIENoZW4gPHJleC1iYy5jaGVuQG1lZGlhdGVrLmNvbT4KUmV2aWV3
ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJl
Z25vQGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8
bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+ClRlc3RlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJh
ZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgotLS0KIGRyaXZlcnMvY2xrL21lZGlhdGVrL3Jl
c2V0LmMgfCAyMSArKysrKysrKysrKysrKysrKysrKy0KIGRyaXZlcnMvY2xrL21lZGlhdGVrL3Jl
c2V0LmggfCAgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuYyBiL2Ry
aXZlcnMvY2xrL21lZGlhdGVrL3Jlc2V0LmMKaW5kZXggMTFiMmY3NGYxMjFkLi44OWU2MTdlYTYz
OTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL3Jlc2V0LmMKKysrIGIvZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvcmVzZXQuYwpAQCAtOTgsNiArOTgsMTggQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCByZXNldF9jb250cm9sX29wcyBtdGtfcmVzZXRfb3BzX3NldF9jbHIgPSB7CiAJLnJlc2V0
ID0gbXRrX3Jlc2V0X3NldF9jbHIsCiB9OwogCitzdGF0aWMgaW50IHJlc2V0X3hsYXRlKHN0cnVj
dCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsCisJCSAgICAgICBjb25zdCBzdHJ1Y3Qgb2Zf
cGhhbmRsZV9hcmdzICpyZXNldF9zcGVjKQoreworCXN0cnVjdCBtdGtfY2xrX3JzdF9kYXRhICpk
YXRhID0gdG9fbXRrX2Nsa19yc3RfZGF0YShyY2Rldik7CisKKwlpZiAocmVzZXRfc3BlYy0+YXJn
c1swXSA+PSByY2Rldi0+bnJfcmVzZXRzIHx8CisJICAgIHJlc2V0X3NwZWMtPmFyZ3NbMF0gPj0g
ZGF0YS0+ZGVzYy0+cnN0X2lkeF9tYXBfbnIpCisJCXJldHVybiAtRUlOVkFMOworCisJcmV0dXJu
IGRhdGEtPmRlc2MtPnJzdF9pZHhfbWFwW3Jlc2V0X3NwZWMtPmFyZ3NbMF1dOworfQorCiB2b2lk
IG10a19yZWdpc3Rlcl9yZXNldF9jb250cm9sbGVyKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCiAJ
CQkJICAgY29uc3Qgc3RydWN0IG10a19jbGtfcnN0X2Rlc2MgKmRlc2MpCiB7CkBAIC0xMzYsMTAg
KzE0OCwxNyBAQCB2b2lkIG10a19yZWdpc3Rlcl9yZXNldF9jb250cm9sbGVyKHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnAsCiAJZGF0YS0+ZGVzYyA9IGRlc2M7CiAJZGF0YS0+cmVnbWFwID0gcmVnbWFw
OwogCWRhdGEtPnJjZGV2Lm93bmVyID0gVEhJU19NT0RVTEU7Ci0JZGF0YS0+cmNkZXYubnJfcmVz
ZXRzID0gZGVzYy0+cnN0X2JhbmtfbnIgKiBSU1RfTlJfUEVSX0JBTks7CiAJZGF0YS0+cmNkZXYu
b3BzID0gcmNvcHM7CiAJZGF0YS0+cmNkZXYub2Zfbm9kZSA9IG5wOwogCisJaWYgKGRhdGEtPmRl
c2MtPnJzdF9pZHhfbWFwX25yID4gMCkgeworCQlkYXRhLT5yY2Rldi5vZl9yZXNldF9uX2NlbGxz
ID0gMTsKKwkJZGF0YS0+cmNkZXYubnJfcmVzZXRzID0gZGVzYy0+cnN0X2lkeF9tYXBfbnI7CisJ
CWRhdGEtPnJjZGV2Lm9mX3hsYXRlID0gcmVzZXRfeGxhdGU7CisJfSBlbHNlIHsKKwkJZGF0YS0+
cmNkZXYubnJfcmVzZXRzID0gZGVzYy0+cnN0X2JhbmtfbnIgKiBSU1RfTlJfUEVSX0JBTks7CisJ
fQorCiAJcmV0ID0gcmVzZXRfY29udHJvbGxlcl9yZWdpc3RlcigmZGF0YS0+cmNkZXYpOwogCWlm
IChyZXQpIHsKIAkJcHJfZXJyKCJjb3VsZCBub3QgcmVnaXN0ZXIgcmVzZXQgY29udHJvbGxlcjog
JWRcbiIsIHJldCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9yZXNldC5oIGIv
ZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuaAppbmRleCBkOTkxNTEwYWUyZDguLmNjODQ3YzY3
YTJmYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuaAorKysgYi9kcml2
ZXJzL2Nsay9tZWRpYXRlay9yZXNldC5oCkBAIC0yOCwxMSArMjgsMTYgQEAgZW51bSBtdGtfcmVz
ZXRfdmVyc2lvbiB7CiAgKiBAdmVyc2lvbjogUmVzZXQgdmVyc2lvbiB3aGljaCBpcyBkZWZpbmVk
IGluIGVudW0gbXRrX3Jlc2V0X3ZlcnNpb24uCiAgKiBAcnN0X2Jhbmtfb2ZzOiBQb2ludGVyIHRv
IGFuIGFycmF5IGNvbnRhaW5pbmcgYmFzZSBvZmZzZXRzIG9mIHRoZSByZXNldCByZWdpc3Rlci4K
ICAqIEByc3RfYmFua19ucjogUXVhbnRpdHkgb2YgcmVzZXQgYmFuay4KKyAqIEByc3RfaWR4X21h
cDpQb2ludGVyIHRvIGFuIGFycmF5IGNvbnRhaW5pbmcgaWRzIGlmIGlucHV0IGFyZ3VtZW50IGlz
IGluZGV4LgorICoJCVRoaXMgYXJyYXkgaXMgbm90IG5lY2Vzc2FyeSBpZiBvdXIgaW5wdXQgYXJn
dW1lbnQgZG9lcyBub3QgbWVhbiBpbmRleC4KKyAqIEByc3RfaWR4X21hcF9ucjogUXVhbnRpdHkg
b2YgcmVzZXQgaW5kZXggbWFwLgogICovCiBzdHJ1Y3QgbXRrX2Nsa19yc3RfZGVzYyB7CiAJZW51
bSBtdGtfcmVzZXRfdmVyc2lvbiB2ZXJzaW9uOwogCXUxNiAqcnN0X2Jhbmtfb2ZzOwogCXUzMiBy
c3RfYmFua19ucjsKKwl1MTYgKnJzdF9pZHhfbWFwOworCXUzMiByc3RfaWR4X21hcF9ucjsKIH07
CiAKIC8qKgotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
