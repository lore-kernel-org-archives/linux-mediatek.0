Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C34C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMNSuukR796AteOGVO7gcq0GojgkufY8KxjCAEvPEdU=; b=r2Jq8F5G0dZpqb
	Sm9DjH4BYWjBlYgyh33OYwT6ANh/JWHPkSi02054HpA4SRCYGZCyZdp/xnqQTk1xMgeuH7wDGFwy9
	ObgCf3IcyA5XLZvqIBJW6bZRHUayQacRFwPvLL2to89W9BFuYqxf60q3I2mOKQntayg3EhTrWB+xx
	WRotEmPEESIvjzIqksEuvYnAjbm9FABL7mTyRxd5NiCdMTbNSb6hqhU5Uz/hMq42oh1ZBmC0Vod/V
	mBGuZQrRxhZXxe0N02IyAOvvdZbmuLRBL9cc3mrHC8v2gUjmY7i/B9Zv9d4XRqICq8r9d1PWbPqkR
	5cagphcv5WY0x8LKGYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5ZY-003NG3-D1; Mon, 23 May 2022 10:46:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4Rr-002sah-Lq; Mon, 23 May 2022 09:34:01 +0000
X-UUID: a248b344d1f44c39926e2b4d249a97c3-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:b4b4f474-8d8e-4740-b26f-bde8f2dfc244, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:a8fe37e3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: a248b344d1f44c39926e2b4d249a97c3-20220523
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 638271247; Mon, 23 May 2022 02:33:52 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 02:33:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 17:33:49 +0800
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
Subject: [RESEND v8 09/19] clk: mediatek: reset: Change return type for clock
 reset register function
Date: Mon, 23 May 2022 17:33:36 +0800
Message-ID: <20220523093346.28493-10-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_023359_836739_12BE006B 
X-CRM114-Status: GOOD (  12.43  )
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

VG8gZGVhbCB3aXRoIGVycm9yIGhhbmRsaW5nLCB3ZSBjaGFuZ2UgdGhlIGZ1bmN0aW9uIHJldHVy
biB0eXBlIGZyb20Kdm9pZCB0byBpbnQgZm9yIG10a19jbGtfcmVnaXN0ZXJfcnN0X2N0cmwoKS4K
ClNpZ25lZC1vZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+ClJl
dmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5k
ZWxyZWdub0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJh
ZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpUZXN0ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEu
IFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2Nsay9tZWRpYXRl
ay9yZXNldC5jIHwgMTUgKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9yZXNl
dC5oIHwgIDYgKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuYyBiL2Ry
aXZlcnMvY2xrL21lZGlhdGVrL3Jlc2V0LmMKaW5kZXggODllNjE3ZWE2MzkzLi5iOTcxOGYwZjlk
MTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL3Jlc2V0LmMKKysrIGIvZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvcmVzZXQuYwpAQCAtMTEwLDggKzExMCw4IEBAIHN0YXRpYyBpbnQgcmVz
ZXRfeGxhdGUoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwKIAlyZXR1cm4gZGF0
YS0+ZGVzYy0+cnN0X2lkeF9tYXBbcmVzZXRfc3BlYy0+YXJnc1swXV07CiB9CiAKLXZvaWQgbXRr
X3JlZ2lzdGVyX3Jlc2V0X2NvbnRyb2xsZXIoc3RydWN0IGRldmljZV9ub2RlICpucCwKLQkJCQkg
ICBjb25zdCBzdHJ1Y3QgbXRrX2Nsa19yc3RfZGVzYyAqZGVzYykKK2ludCBtdGtfcmVnaXN0ZXJf
cmVzZXRfY29udHJvbGxlcihzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAorCQkJCSAgY29uc3Qgc3Ry
dWN0IG10a19jbGtfcnN0X2Rlc2MgKmRlc2MpCiB7CiAJc3RydWN0IHJlZ21hcCAqcmVnbWFwOwog
CWNvbnN0IHN0cnVjdCByZXNldF9jb250cm9sX29wcyAqcmNvcHMgPSBOVUxMOwpAQCAtMTIwLDcg
KzEyMCw3IEBAIHZvaWQgbXRrX3JlZ2lzdGVyX3Jlc2V0X2NvbnRyb2xsZXIoc3RydWN0IGRldmlj
ZV9ub2RlICpucCwKIAogCWlmICghZGVzYykgewogCQlwcl9lcnIoIm10ayBjbG9jayByZXNldCBk
ZXNjIGlzIE5VTExcbiIpOwotCQlyZXR1cm47CisJCXJldHVybiAtRUlOVkFMOwogCX0KIAogCXN3
aXRjaCAoZGVzYy0+dmVyc2lvbikgewpAQCAtMTMyLDE4ICsxMzIsMTggQEAgdm9pZCBtdGtfcmVn
aXN0ZXJfcmVzZXRfY29udHJvbGxlcihzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAogCQlicmVhazsK
IAlkZWZhdWx0OgogCQlwcl9lcnIoIlVua25vd24gcmVzZXQgdmVyc2lvbiAlZFxuIiwgZGVzYy0+
dmVyc2lvbik7Ci0JCXJldHVybjsKKwkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCiAJcmVnbWFwID0g
ZGV2aWNlX25vZGVfdG9fcmVnbWFwKG5wKTsKIAlpZiAoSVNfRVJSKHJlZ21hcCkpIHsKIAkJcHJf
ZXJyKCJDYW5ub3QgZmluZCByZWdtYXAgZm9yICVwT0Y6ICVwZVxuIiwgbnAsIHJlZ21hcCk7Ci0J
CXJldHVybjsKKwkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCiAJZGF0YSA9IGt6YWxsb2Moc2l6ZW9m
KCpkYXRhKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFkYXRhKQotCQlyZXR1cm47CisJCXJldHVybiAt
RU5PTUVNOwogCiAJZGF0YS0+ZGVzYyA9IGRlc2M7CiAJZGF0YS0+cmVnbWFwID0gcmVnbWFwOwpA
QCAtMTYzLDcgKzE2MywxMCBAQCB2b2lkIG10a19yZWdpc3Rlcl9yZXNldF9jb250cm9sbGVyKHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCiAJaWYgKHJldCkgewogCQlwcl9lcnIoImNvdWxkIG5vdCBy
ZWdpc3RlciByZXNldCBjb250cm9sbGVyOiAlZFxuIiwgcmV0KTsKIAkJa2ZyZWUoZGF0YSk7CisJ
CXJldHVybiByZXQ7CiAJfQorCisJcmV0dXJuIDA7CiB9CiAKIE1PRFVMRV9MSUNFTlNFKCJHUEwi
KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL3Jlc2V0LmggYi9kcml2ZXJzL2Ns
ay9tZWRpYXRlay9yZXNldC5oCmluZGV4IGNjODQ3YzY3YTJmYy4uMjYwZjI1ZjI3NjU2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9yZXNldC5oCisrKyBiL2RyaXZlcnMvY2xrL21l
ZGlhdGVrL3Jlc2V0LmgKQEAgLTU2LDggKzU2LDEwIEBAIHN0cnVjdCBtdGtfY2xrX3JzdF9kYXRh
IHsKICAqIG10a19yZWdpc3Rlcl9yZXNldF9jb250cm9sbGVyIC0gUmVnaXN0ZXIgTWVkaWFUZWsg
Y2xvY2sgcmVzZXQgY29udHJvbGxlcgogICogQG5wOiBQb2ludGVyIHRvIGRldmljZSBub2RlLgog
ICogQGRlc2M6IENvbnN0YW50IHBvaW50ZXIgdG8gZGVzY3JpcHRpb24gb2YgY2xvY2sgcmVzZXQu
CisgKgorICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MgYW5kIGVycm9ybm8gb3RoZXJ3aXNlLgogICov
Ci12b2lkIG10a19yZWdpc3Rlcl9yZXNldF9jb250cm9sbGVyKHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAsCi0JCQkJICAgY29uc3Qgc3RydWN0IG10a19jbGtfcnN0X2Rlc2MgKmRlc2MpOworaW50IG10
a19yZWdpc3Rlcl9yZXNldF9jb250cm9sbGVyKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCisJCQkJ
ICBjb25zdCBzdHJ1Y3QgbXRrX2Nsa19yc3RfZGVzYyAqZGVzYyk7CiAKICNlbmRpZiAvKiBfX0RS
Vl9DTEtfTVRLX1JFU0VUX0ggKi8KLS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
