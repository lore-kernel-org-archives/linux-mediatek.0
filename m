Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF75C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 15:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9VmIk7EvxjmIdORz2a8mXrvjMbHMHIoL3OWltIiPwt0=; b=i8kij0jaD6keIx
	RPbmCIGVmCbn4hAQYLwaJZQT3AAWIF9YLZbF+SOXBj6swj3pXKtRogVePiFx+ZmDWjiTleVaCNJya
	ROXPJjy5L135ZE+YAsT6g9HQjb5L1w6v4m5I/ZlGklw/7frNFwULX14FkMsKNEGJSqBkteq1S7FNL
	jM154mS613IR6H1NR8WmJZqFFqxWtGD7cHeoY4zUe45Bj4hjEYGB08zZZoqXwAOlPlJjTq0XfmgfC
	vJDv90mGDx02JstoCyhxWE6ndeTOj2f4vrq8yCxGUtloYQYSGrRpNa/ExfjCWRjLsTaLBCc3gvwaT
	MRVmWlQz848TMjaKfBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7fI6-002obK-Pu; Wed, 12 Jan 2022 15:11:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7fI3-002oa1-MD; Wed, 12 Jan 2022 15:11:57 +0000
X-UUID: 59df810816a34b12a1fde7ac84c91e5b-20220112
X-UUID: 59df810816a34b12a1fde7ac84c91e5b-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1667018405; Wed, 12 Jan 2022 08:11:49 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 07:01:46 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 Jan 2022 23:01:44 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 12 Jan 2022 23:01:38 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <shuijing.li@mediatek.com>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, Guillaume Ranquet <granquet@baylibre.com>,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH] drm/mediatek: DP HPD Detect with debounce
Date: Wed, 12 Jan 2022 23:01:33 +0800
Message-ID: <20220112150133.11275-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_071155_744162_604D7C96 
X-CRM114-Status: GOOD (  14.72  )
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

RFAgU3BlYyAxLjRhIDMuMyByZXF1aXJlcyBkcCBkZXRlY3QgdGhlIGhwZCB3aXRoIGRlYm91bmNl
LgoKVXBzdHJlYW0gaW1wbGVtZW50YXRpb25zIHNob3VsZCBpbXBsZW1lbnQgSFBEIHNpZ25hbCBk
ZS1ib3VuY2luZyBvbgphbiBleHRlcm5hbCBjb25uZWN0aW9uLiBBIHBlcmlvZCBvZiAxMDBtcyBz
aG91bGQgYmUgdXNlZCBmb3IKZGV0ZWN0aW5nIGFuIEhQRCBjb25uZWN0IGV2ZW50IChpLmUuLCB0
aGUgZXZlbnQsIOKAnEhQRCBoaWdoLOKAnSBpcwpjb25maXJtZWQgb25seSBhZnRlciBIUEQgaGFz
IGJlZW4gY29udGludW91c2x5IGFzc2VydGVkIGZvciAxMDBtcykuCkNhcmUgc2hvdWxkIGJlIHRh
a2VuIHRvIG5vdCBpbXBsZW1lbnQgZGUtYm91bmNpbmcgb24gYW4gSVJRX0hQRCBhbmQKb24gYSBk
b3duc3RyZWFtIGRldmljZS1nZW5lcmF0ZWQgcGFpciBvZiBIUEQgZGlzY29ubmVjdC9yZWNvbm5l
Y3QKZXZlbnRzICh0eXBpY2FsbHkgSFBEIHNoYWxsIGJlIGRlLWFzc2VydGVkIGZvciBtb3JlIHRo
YW4gMm1zLCBidXQKbGVzcyB0aGFuIDEwMG1zIGluIHRoaXMgY2FzZSkuIFRvIGNvdmVyIHRoZXNl
IGNhc2VzLCBIUEQgZGUtYm91bmNlCnNob3VsZCBiZSBpbXBsZW1lbnRlZCBvbmx5IGFmdGVyIEhQ
RCBsb3cgaGFzIGJlZW4gZGV0ZWN0ZWQgZm9yIDEwMG1zLgogVGltaW5nIHJlcXVpcmVtZW50cyBp
biB0aGlzIFN0YW5kYXJkIHJlbGF0ZWQgdG8gdGhlIGRldGVjdGlvbiBvZgpIUEQgaGlnaCBhcmUg
dG8gYmUgaW50ZXJwcmV0ZWQgYXMgYXBwbHlpbmcgZnJvbSB0aGUgY29tcGxldGlvbiBvZiBhbgpp
bXBsZW1lbnRhdGlvbi1kZXBlbmRlbnQgZGUtYm91bmNlIHBlcmlvZC4KClNpZ25lZC1vZmYtYnk6
IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jCmluZGV4
IGEyNTZkNTUzNDZhMi4uMDVmNDAxYTAyNGE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5j
CkBAIC0xOTMsNiArMTkzLDggQEAgc3RydWN0IG10a19kcCB7CiAJc3RydWN0IG11dGV4IGVsZF9s
b2NrOwogCXU4IGNvbm5lY3Rvcl9lbGRbTUFYX0VMRF9CWVRFU107CiAJc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm47CisJYm9vbCBuZWVkX2RlYm91bmNlOworCXN0cnVjdCB0aW1lcl9saXN0IGRl
Ym91bmNlX3RpbWVyOwogfTsKIAogZW51bSBtdGtfZHBfc2RwX3R5cGUgewpAQCAtMjIxNyw2ICsy
MjE5LDkgQEAgc3RhdGljIGlycXJldHVybl90IG10a19kcF9ocGRfZXZlbnRfdGhyZWFkKGludCBo
cGQsIHZvaWQgKmRldikKIAlpZiAoZXZlbnQgPCAwKQogCQlyZXR1cm4gSVJRX0hBTkRMRUQ7CiAK
KwlpZiAobXRrX2RwLT5uZWVkX2RlYm91bmNlICYmIG10a19kcC0+dHJhaW5faW5mby5jYWJsZV9w
bHVnZ2VkX2luKQorCQltc2xlZXAoMTAwKTsKKwogCWlmIChtdGtfZHAtPmRybV9kZXYpIHsKIAkJ
ZGV2X2luZm8obXRrX2RwLT5kZXYsICJkcm1faGVscGVyX2hwZF9pcnFfZXZlbnRcbiIpOwogCQlk
cm1faGVscGVyX2hwZF9pcnFfZXZlbnQobXRrX2RwLT5icmlkZ2UuZGV2KTsKQEAgLTIyOTYsNiAr
MjMwMSwxNCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgbXRrX2RwX2hwZF9pc3JfaGFuZGxlcihzdHJ1
Y3QgbXRrX2RwICptdGtfZHApCiAJCW10a19kcC0+dHJhaW5fc3RhdGUgPSBNVEtfRFBfVFJBSU5f
U1RBVEVfU1RBUlRVUDsKIAl9CiAJdHJhaW5faW5mby0+Y2FibGVfc3RhdGVfY2hhbmdlID0gdHJ1
ZTsKKworCWlmICh0cmFpbl9pbmZvLT5jYWJsZV9zdGF0ZV9jaGFuZ2UpIHsKKwkJaWYgKCF0cmFp
bl9pbmZvLT5jYWJsZV9wbHVnZ2VkX2luKSB7CisJCQltb2RfdGltZXIoJm10a19kcC0+ZGVib3Vu
Y2VfdGltZXIsIGppZmZpZXMgKyBtc2Vjc190b19qaWZmaWVzKDEwMCkgLSAxKTsKKwkJCW10a19k
cC0+bmVlZF9kZWJvdW5jZSA9IGZhbHNlOworCQl9CisJfQorCiAJcmV0dXJuIElSUV9XQUtFX1RI
UkVBRDsKIH0KIApAQCAtMjkwMyw2ICsyOTE2LDEzIEBAIHN0YXRpYyBpbnQgbXRrX2RwX3JlZ2lz
dGVyX2F1ZGlvX2RyaXZlcihzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJcmV0dXJuIDA7CiB9CiAKK3N0
YXRpYyB2b2lkIG10a19kcF9kZWJvdW5jZV90aW1lcihzdHJ1Y3QgdGltZXJfbGlzdCAqdCkKK3sK
KwlzdHJ1Y3QgbXRrX2RwICptdGtfZHAgPSBmcm9tX3RpbWVyKG10a19kcCwgdCwgZGVib3VuY2Vf
dGltZXIpOworCisJbXRrX2RwLT5uZWVkX2RlYm91bmNlID0gdHJ1ZTsKK30KKwogc3RhdGljIGlu
dCBtdGtfZHBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qg
bXRrX2RwICptdGtfZHA7CkBAIC0yOTkwLDYgKzMwMTAsOSBAQCBzdGF0aWMgaW50IG10a19kcF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWVsc2UKIAkJbXRrX2RwLT5icmlk
Z2UudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydDsKIAorCW10a19kcC0+bmVl
ZF9kZWJvdW5jZSA9IHRydWU7CisJdGltZXJfc2V0dXAoJm10a19kcC0+ZGVib3VuY2VfdGltZXIs
IG10a19kcF9kZWJvdW5jZV90aW1lciwgMCk7CisKIAltdGtfZHAtPmJyaWRnZS5vcHMgPQogCQlE
Uk1fQlJJREdFX09QX0RFVEVDVCB8IERSTV9CUklER0VfT1BfRURJRCB8IERSTV9CUklER0VfT1Bf
SFBEOwogCWRybV9icmlkZ2VfYWRkKCZtdGtfZHAtPmJyaWRnZSk7CkBAIC0zMDA4LDYgKzMwMzEs
NyBAQCBzdGF0aWMgaW50IG10a19kcF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAogCW10a19kcF92aWRlb19tdXRlKG10a19kcCwgdHJ1ZSk7CiAJbXRrX2RwX2F1ZGlvX211
dGUobXRrX2RwLCB0cnVlKTsKKwlkZWxfdGltZXJfc3luYygmbXRrX2RwLT5kZWJvdW5jZV90aW1l
cik7CiAKIAlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7CiAKLS0gCjIuMTIuNQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
