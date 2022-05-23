Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F16C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLd8grApIEegMsKfGQBKc8k+aEwasVrZfI6vwlD8KvQ=; b=pFg2a1n61vzpPu
	mnMgmQP2ip10n/WZkWQXiFuU/KFng9XOcKfPfA5s7XHk+80vO5FGfM614ISOjucHVx+OE4N3Kjv+J
	7Qz0RHxayIn78L569kTYTdyEyCjAeg58PN0FZLLsAo+SxjItn2fCsnGnQl3KaTVvf5gcHFrGm6sVX
	RG2MXh+cBmAaU/I45Ludl6MmPuYF/yN256Mxea/wGX197RA+hOCnh/vk+CqQHBIMxJ6V+n44OLAXq
	UN0GQ5sREsQW6jq/G13xkxuW3YCeda3TCSjyytbudlbA4I0FuJHTeZ5LFtRENLR9uS0EkE35vi70h
	qDoSqCKnFnJzileH7o4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5ZU-003NDn-RY; Mon, 23 May 2022 10:45:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4Rr-002sbQ-Lx; Mon, 23 May 2022 09:34:01 +0000
X-UUID: 2bde582a7ec541349648846f6b291c79-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:884ee5a1-693c-47cc-8680-da9cf82c6bd2, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:a7fe37e3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 2bde582a7ec541349648846f6b291c79-20220523
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1221213907; Mon, 23 May 2022 02:33:52 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 02:33:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 17:33:48 +0800
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
Subject: [RESEND v8 04/19] clk: mediatek: reset: Extract common drivers to
 update function
Date: Mon, 23 May 2022 17:33:31 +0800
Message-ID: <20220523093346.28493-5-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_023359_842496_ECD499A0 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

VG8gbWFrZSBkcml2ZXJzIG1vcmUgY2xlYXIgYW5kIHJlYWRhYmxlLCB3ZSBleHRyYWN0IGNvbW1v
biBjb2RlCndpdGhpbiBhc3NlcnQgYW5kIGRlYXNzZXJ0IHRvIG10a19yZXNldF91cGRhdGVfc2V0
X2NscigpIGFuZAptdGtfcmVzZXRfdXBkYXRlKCkuCgpTaWduZWQtb2ZmLWJ5OiBSZXgtQkMgQ2hl
biA8cmV4LWJjLmNoZW5AbWVkaWF0ZWsuY29tPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlu
byBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KUmV2
aWV3ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNv
bT4KVGVzdGVkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9y
YS5jb20+Ci0tLQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuYyB8IDM4ICsrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMo
KyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL3Jl
c2V0LmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9yZXNldC5jCmluZGV4IDVjYmJjYzIyYTRmYy4u
MjJmYTlmMDk3NTJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9yZXNldC5jCisr
KyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL3Jlc2V0LmMKQEAgLTEyLDI0ICsxMiwyNyBAQAogCiAj
aW5jbHVkZSAicmVzZXQuaCIKIAotc3RhdGljIGludCBtdGtfcmVzZXRfYXNzZXJ0KHN0cnVjdCBy
ZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsCi0JCQkgICAgdW5zaWduZWQgbG9uZyBpZCkKK3N0
YXRpYyBpbnQgbXRrX3Jlc2V0X3VwZGF0ZShzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJj
ZGV2LAorCQkJICAgIHVuc2lnbmVkIGxvbmcgaWQsIGJvb2wgZGVhc3NlcnQpCiB7CiAJc3RydWN0
IG10a19yZXNldCAqZGF0YSA9IGNvbnRhaW5lcl9vZihyY2Rldiwgc3RydWN0IG10a19yZXNldCwg
cmNkZXYpOworCXVuc2lnbmVkIGludCB2YWwgPSBkZWFzc2VydCA/IDAgOiB+MDsKIAogCXJldHVy
biByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFwLAogCQkJCSAgZGF0YS0+cmVnb2ZzICsg
KChpZCAvIDMyKSA8PCAyKSwKLQkJCQkgIEJJVChpZCAlIDMyKSwgfjApOworCQkJCSAgQklUKGlk
ICUgMzIpLCB2YWwpOworfQorCitzdGF0aWMgaW50IG10a19yZXNldF9hc3NlcnQoc3RydWN0IHJl
c2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwKKwkJCSAgICB1bnNpZ25lZCBsb25nIGlkKQorewor
CXJldHVybiBtdGtfcmVzZXRfdXBkYXRlKHJjZGV2LCBpZCwgZmFsc2UpOwogfQogCiBzdGF0aWMg
aW50IG10a19yZXNldF9kZWFzc2VydChzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2
LAogCQkJICAgICAgdW5zaWduZWQgbG9uZyBpZCkKIHsKLQlzdHJ1Y3QgbXRrX3Jlc2V0ICpkYXRh
ID0gY29udGFpbmVyX29mKHJjZGV2LCBzdHJ1Y3QgbXRrX3Jlc2V0LCByY2Rldik7Ci0KLQlyZXR1
cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwKLQkJCQkgIGRhdGEtPnJlZ29mcyAr
ICgoaWQgLyAzMikgPDwgMiksCi0JCQkJICBCSVQoaWQgJSAzMiksIDApOworCXJldHVybiBtdGtf
cmVzZXRfdXBkYXRlKHJjZGV2LCBpZCwgdHJ1ZSk7CiB9CiAKIHN0YXRpYyBpbnQgbXRrX3Jlc2V0
KHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsIHVuc2lnbmVkIGxvbmcgaWQpCkBA
IC00MywyNCArNDYsMjcgQEAgc3RhdGljIGludCBtdGtfcmVzZXQoc3RydWN0IHJlc2V0X2NvbnRy
b2xsZXJfZGV2ICpyY2RldiwgdW5zaWduZWQgbG9uZyBpZCkKIAlyZXR1cm4gbXRrX3Jlc2V0X2Rl
YXNzZXJ0KHJjZGV2LCBpZCk7CiB9CiAKLXN0YXRpYyBpbnQgbXRrX3Jlc2V0X2Fzc2VydF9zZXRf
Y2xyKHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsCi0JCQkJICAgIHVuc2lnbmVk
IGxvbmcgaWQpCitzdGF0aWMgaW50IG10a19yZXNldF91cGRhdGVfc2V0X2NscihzdHJ1Y3QgcmVz
ZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LAorCQkJCSAgICB1bnNpZ25lZCBsb25nIGlkLCBib29s
IGRlYXNzZXJ0KQogewogCXN0cnVjdCBtdGtfcmVzZXQgKmRhdGEgPSBjb250YWluZXJfb2YocmNk
ZXYsIHN0cnVjdCBtdGtfcmVzZXQsIHJjZGV2KTsKKwl1bnNpZ25lZCBpbnQgZGVhc3NlcnRfb2Zz
ID0gZGVhc3NlcnQgPyAweDQgOiAwOwogCiAJcmV0dXJuIHJlZ21hcF93cml0ZShkYXRhLT5yZWdt
YXAsCi0JCQkgICAgZGF0YS0+cmVnb2ZzICsgKChpZCAvIDMyKSA8PCA0KSwKKwkJCSAgICBkYXRh
LT5yZWdvZnMgKyAoKGlkIC8gMzIpIDw8IDQpICsgZGVhc3NlcnRfb2ZzLAogCQkJICAgIEJJVChp
ZCAlIDMyKSk7CiB9CiAKK3N0YXRpYyBpbnQgbXRrX3Jlc2V0X2Fzc2VydF9zZXRfY2xyKHN0cnVj
dCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsCisJCQkJICAgIHVuc2lnbmVkIGxvbmcgaWQp
Cit7CisJcmV0dXJuIG10a19yZXNldF91cGRhdGVfc2V0X2NscihyY2RldiwgaWQsIGZhbHNlKTsK
K30KKwogc3RhdGljIGludCBtdGtfcmVzZXRfZGVhc3NlcnRfc2V0X2NscihzdHJ1Y3QgcmVzZXRf
Y29udHJvbGxlcl9kZXYgKnJjZGV2LAogCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgaWQpCiB7Ci0J
c3RydWN0IG10a19yZXNldCAqZGF0YSA9IGNvbnRhaW5lcl9vZihyY2Rldiwgc3RydWN0IG10a19y
ZXNldCwgcmNkZXYpOwotCi0JcmV0dXJuIHJlZ21hcF93cml0ZShkYXRhLT5yZWdtYXAsCi0JCQkg
ICAgZGF0YS0+cmVnb2ZzICsgKChpZCAvIDMyKSA8PCA0KSArIDB4NCwKLQkJCSAgICBCSVQoaWQg
JSAzMikpOworCXJldHVybiBtdGtfcmVzZXRfdXBkYXRlX3NldF9jbHIocmNkZXYsIGlkLCB0cnVl
KTsKIH0KIAogc3RhdGljIGludCBtdGtfcmVzZXRfc2V0X2NscihzdHJ1Y3QgcmVzZXRfY29udHJv
bGxlcl9kZXYgKnJjZGV2LAotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
