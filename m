Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75268C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xAxGDa/d9udzNrP9vYWE2KkwZaBQ6O9bWe8+ioOoLA=; b=WbF0y/aQMKJvbq
	vqC36MiMRMC2Rtr+6b4kZJf9eE0dDI8Na6CLAq/RPxDOnqfP2wtzK1HzuvfAlWdT2qnFPWnMiIRox
	8KtgLWfeJbgPmn2yfsvALXm5q9hmS2hWnwNnvFTJe+C0R+OOS/JMlGJEGg92+qTsFUWEhRG+iQUn2
	4WUGBVSZU/ClLKQP1sQ6shl4YAFI1sT5Tsq0W8Az4sMGzM8Ln37QdXPtfYdFBSAP86bC3GnUjGNwo
	RgsVMqTrw+EwaVaYlcMvJxTknDN56u3ov7fC4yIu94wR99t6isMdwYBcf7aNc3v0MYQqJURRqNKSN
	UGvnpNuHr16ojgGoy43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4Q8-002rsj-BX; Mon, 23 May 2022 09:32:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2or-002A7b-LQ; Mon, 23 May 2022 07:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=0OrEASwIOKToGqEn3DGiiFtENduRtr7yEVUGUly3Ofs=; b=nDZ/APQ2FX9n10F5tJfC90bxDZ
 P7agK+mt9euykTZv1ANR3enTZuDAcF2zDgphTbBU6FKir1gEifejIGnJGEo3MeMfTAEQv8G0VRQYb
 E5RknuYbS/BdTPuIcjk3THBrLxabqp0IwlYvwTDQNX464C+phdQ298tuKIAJ7bA9Yw0ii97aH3qHj
 0+mV1CA0XZwa2LjdlZBtevyITG8JPf20Tmt5TBRUsR4MHtB3URUn7Oh/tZg2m6veAPNFDRUtoZmO5
 C5/uLbjqQTROQyo5JXY0zPHxKqGn3z+QQVXrxc4rB3ZhhorwAqGbpqDNvWglVwkZn3YVx4wqazCI2
 pBY8mfyg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt18S-000scg-6y; Mon, 23 May 2022 06:01:48 +0000
X-UUID: 360694abb1774fbcbebb8c96b01287dc-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:a8e77e37-eeed-4dc2-895d-e4b31928dfe9, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:ae7b3e7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 360694abb1774fbcbebb8c96b01287dc-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1767304944; Sun, 22 May 2022 23:01:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 23:00:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 14:00:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 14:00:57 +0800
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
Subject: [PATCH v8 03/19] clk: mediatek: reset: Refine and reorder functions
 in reset.c
Date: Mon, 23 May 2022 14:00:40 +0800
Message-ID: <20220523060056.24396-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070144_787779_FA407FB2 
X-CRM114-Status: GOOD (  12.48  )
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

VG8gbWFrZSBkcml2ZXJzIG1vcmUgcmVhZGFibGUsIHdlIG1vZGlmeSB0aGUgaW5kZW50YXRpb24g
b2YgdGhlIGRyaXZlcnMKYW5kIHJlb3JkZXIgdGhlIGxvY2F0aW9uIG9mIGZ1bmN0aW9ucy4KClNp
Z25lZC1vZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+ClJldmll
d2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxy
ZWdub0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8g
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpUZXN0ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFBy
YWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9y
ZXNldC5jIHwgNjggKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuYyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL3Jlc2V0
LmMKaW5kZXggNTE5MWJlY2I0NWRkLi41Y2JiY2MyMmE0ZmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Y2xrL21lZGlhdGVrL3Jlc2V0LmMKKysrIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuYwpA
QCAtMTIsNTYgKzEyLDU5IEBACiAKICNpbmNsdWRlICJyZXNldC5oIgogCi1zdGF0aWMgaW50IG10
a19yZXNldF9hc3NlcnRfc2V0X2NscihzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2
LAotCXVuc2lnbmVkIGxvbmcgaWQpCitzdGF0aWMgaW50IG10a19yZXNldF9hc3NlcnQoc3RydWN0
IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwKKwkJCSAgICB1bnNpZ25lZCBsb25nIGlkKQog
ewogCXN0cnVjdCBtdGtfcmVzZXQgKmRhdGEgPSBjb250YWluZXJfb2YocmNkZXYsIHN0cnVjdCBt
dGtfcmVzZXQsIHJjZGV2KTsKLQl1bnNpZ25lZCBpbnQgcmVnID0gZGF0YS0+cmVnb2ZzICsgKChp
ZCAvIDMyKSA8PCA0KTsKIAotCXJldHVybiByZWdtYXBfd3JpdGUoZGF0YS0+cmVnbWFwLCByZWcs
IEJJVChpZCAlIDMyKSk7CisJcmV0dXJuIHJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAs
CisJCQkJICBkYXRhLT5yZWdvZnMgKyAoKGlkIC8gMzIpIDw8IDIpLAorCQkJCSAgQklUKGlkICUg
MzIpLCB+MCk7CiB9CiAKLXN0YXRpYyBpbnQgbXRrX3Jlc2V0X2RlYXNzZXJ0X3NldF9jbHIoc3Ry
dWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwKLQl1bnNpZ25lZCBsb25nIGlkKQorc3Rh
dGljIGludCBtdGtfcmVzZXRfZGVhc3NlcnQoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpy
Y2RldiwKKwkJCSAgICAgIHVuc2lnbmVkIGxvbmcgaWQpCiB7CiAJc3RydWN0IG10a19yZXNldCAq
ZGF0YSA9IGNvbnRhaW5lcl9vZihyY2Rldiwgc3RydWN0IG10a19yZXNldCwgcmNkZXYpOwotCXVu
c2lnbmVkIGludCByZWcgPSBkYXRhLT5yZWdvZnMgKyAoKGlkIC8gMzIpIDw8IDQpICsgMHg0Owog
Ci0JcmV0dXJuIHJlZ21hcF93cml0ZShkYXRhLT5yZWdtYXAsIHJlZywgQklUKGlkICUgMzIpKTsK
KwlyZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwKKwkJCQkgIGRhdGEtPnJl
Z29mcyArICgoaWQgLyAzMikgPDwgMiksCisJCQkJICBCSVQoaWQgJSAzMiksIDApOwogfQogCi1z
dGF0aWMgaW50IG10a19yZXNldF9hc3NlcnQoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpy
Y2RldiwKLQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgaWQpCitzdGF0aWMgaW50IG10a19yZXNldChz
dHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LCB1bnNpZ25lZCBsb25nIGlkKQogewot
CXN0cnVjdCBtdGtfcmVzZXQgKmRhdGEgPSBjb250YWluZXJfb2YocmNkZXYsIHN0cnVjdCBtdGtf
cmVzZXQsIHJjZGV2KTsKKwlpbnQgcmV0OworCisJcmV0ID0gbXRrX3Jlc2V0X2Fzc2VydChyY2Rl
diwgaWQpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAKLQlyZXR1cm4gcmVnbWFwX3VwZGF0
ZV9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+cmVnb2ZzICsgKChpZCAvIDMyKSA8PCAyKSwKLQkJ
CUJJVChpZCAlIDMyKSwgfjApOworCXJldHVybiBtdGtfcmVzZXRfZGVhc3NlcnQocmNkZXYsIGlk
KTsKIH0KIAotc3RhdGljIGludCBtdGtfcmVzZXRfZGVhc3NlcnQoc3RydWN0IHJlc2V0X2NvbnRy
b2xsZXJfZGV2ICpyY2RldiwKLQkJCQl1bnNpZ25lZCBsb25nIGlkKQorc3RhdGljIGludCBtdGtf
cmVzZXRfYXNzZXJ0X3NldF9jbHIoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwK
KwkJCQkgICAgdW5zaWduZWQgbG9uZyBpZCkKIHsKIAlzdHJ1Y3QgbXRrX3Jlc2V0ICpkYXRhID0g
Y29udGFpbmVyX29mKHJjZGV2LCBzdHJ1Y3QgbXRrX3Jlc2V0LCByY2Rldik7CiAKLQlyZXR1cm4g
cmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+cmVnb2ZzICsgKChpZCAvIDMy
KSA8PCAyKSwKLQkJCUJJVChpZCAlIDMyKSwgMCk7CisJcmV0dXJuIHJlZ21hcF93cml0ZShkYXRh
LT5yZWdtYXAsCisJCQkgICAgZGF0YS0+cmVnb2ZzICsgKChpZCAvIDMyKSA8PCA0KSwKKwkJCSAg
ICBCSVQoaWQgJSAzMikpOwogfQogCi1zdGF0aWMgaW50IG10a19yZXNldChzdHJ1Y3QgcmVzZXRf
Y29udHJvbGxlcl9kZXYgKnJjZGV2LAotCQkJICAgICAgdW5zaWduZWQgbG9uZyBpZCkKK3N0YXRp
YyBpbnQgbXRrX3Jlc2V0X2RlYXNzZXJ0X3NldF9jbHIoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJf
ZGV2ICpyY2RldiwKKwkJCQkgICAgICB1bnNpZ25lZCBsb25nIGlkKQogewotCWludCByZXQ7Ci0K
LQlyZXQgPSBtdGtfcmVzZXRfYXNzZXJ0KHJjZGV2LCBpZCk7Ci0JaWYgKHJldCkKLQkJcmV0dXJu
IHJldDsKKwlzdHJ1Y3QgbXRrX3Jlc2V0ICpkYXRhID0gY29udGFpbmVyX29mKHJjZGV2LCBzdHJ1
Y3QgbXRrX3Jlc2V0LCByY2Rldik7CiAKLQlyZXR1cm4gbXRrX3Jlc2V0X2RlYXNzZXJ0KHJjZGV2
LCBpZCk7CisJcmV0dXJuIHJlZ21hcF93cml0ZShkYXRhLT5yZWdtYXAsCisJCQkgICAgZGF0YS0+
cmVnb2ZzICsgKChpZCAvIDMyKSA8PCA0KSArIDB4NCwKKwkJCSAgICBCSVQoaWQgJSAzMikpOwog
fQogCiBzdGF0aWMgaW50IG10a19yZXNldF9zZXRfY2xyKHN0cnVjdCByZXNldF9jb250cm9sbGVy
X2RldiAqcmNkZXYsCi0JdW5zaWduZWQgbG9uZyBpZCkKKwkJCSAgICAgdW5zaWduZWQgbG9uZyBp
ZCkKIHsKIAlpbnQgcmV0OwogCkBAIC04NCw4ICs4Nyw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cmVzZXRfY29udHJvbF9vcHMgbXRrX3Jlc2V0X29wc19zZXRfY2xyID0gewogfTsKIAogc3RhdGlj
IHZvaWQgbXRrX3JlZ2lzdGVyX3Jlc2V0X2NvbnRyb2xsZXJfY29tbW9uKHN0cnVjdCBkZXZpY2Vf
bm9kZSAqbnAsCi0JCQl1bnNpZ25lZCBpbnQgbnVtX3JlZ3MsIGludCByZWdvZnMsCi0JCQljb25z
dCBzdHJ1Y3QgcmVzZXRfY29udHJvbF9vcHMgKnJlc2V0X29wcykKKwkJCQkJCSB1bnNpZ25lZCBp
bnQgbnVtX3JlZ3MsCisJCQkJCQkgaW50IHJlZ29mcywKKwkJCQkJCSBjb25zdCBzdHJ1Y3QgcmVz
ZXRfY29udHJvbF9vcHMgKnJlc2V0X29wcykKIHsKIAlzdHJ1Y3QgbXRrX3Jlc2V0ICpkYXRhOwog
CWludCByZXQ7CkBAIC0xMTcsMTcgKzEyMSwxNyBAQCBzdGF0aWMgdm9pZCBtdGtfcmVnaXN0ZXJf
cmVzZXRfY29udHJvbGxlcl9jb21tb24oc3RydWN0IGRldmljZV9ub2RlICpucCwKIH0KIAogdm9p
ZCBtdGtfcmVnaXN0ZXJfcmVzZXRfY29udHJvbGxlcihzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAot
CXVuc2lnbmVkIGludCBudW1fcmVncywgaW50IHJlZ29mcykKKwkJCQkgICB1bnNpZ25lZCBpbnQg
bnVtX3JlZ3MsIGludCByZWdvZnMpCiB7CiAJbXRrX3JlZ2lzdGVyX3Jlc2V0X2NvbnRyb2xsZXJf
Y29tbW9uKG5wLCBudW1fcmVncywgcmVnb2ZzLAotCQkmbXRrX3Jlc2V0X29wcyk7CisJCQkJCSAg
ICAgJm10a19yZXNldF9vcHMpOwogfQogCiB2b2lkIG10a19yZWdpc3Rlcl9yZXNldF9jb250cm9s
bGVyX3NldF9jbHIoc3RydWN0IGRldmljZV9ub2RlICpucCwKLQl1bnNpZ25lZCBpbnQgbnVtX3Jl
Z3MsIGludCByZWdvZnMpCisJCQkJCSAgIHVuc2lnbmVkIGludCBudW1fcmVncywgaW50IHJlZ29m
cykKIHsKIAltdGtfcmVnaXN0ZXJfcmVzZXRfY29udHJvbGxlcl9jb21tb24obnAsIG51bV9yZWdz
LCByZWdvZnMsCi0JCSZtdGtfcmVzZXRfb3BzX3NldF9jbHIpOworCQkJCQkgICAgICZtdGtfcmVz
ZXRfb3BzX3NldF9jbHIpOwogfQogCiBNT0RVTEVfTElDRU5TRSgiR1BMIik7Ci0tIAoyLjE4LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
