Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A40C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2JKOX0lLzMmv8JIWwhvyNjK7+1p2U/fnbEVU312lfg=; b=LcqtZrbgvkc7wy
	ulkFD7HnPzCDkr52ikb8c6UPsp+cN2fMe4of41BQatSiduQGqc9cfJlphkXw+4zbZAqH5AzM+c2hF
	9nsWcB5nTF+Q6PdwceAwQhrRHBJTDZdaI4bXgXos8tqnHgPK8w6DYxMQZgk+IeOACoW+7JMiHfQCL
	nN6p9umb/UldzKxdd1+SORsGevw7JY3U2bofBFiJXynGLYozQp+hCwR0nXlJOeK8Z9PiteQ/nZBP9
	uIOYuf5iCwPDsCWxc8S3eBXUpX1as4T0EMsKRe2Ttqc5NICMRVZe+98BA4zf+/wswUPKIzhqS+kUh
	SVKzs8OeVW+q0n6GqWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5bE-003OGC-Gr; Mon, 23 May 2022 10:47:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4VQ-002ty8-JW; Mon, 23 May 2022 09:37:42 +0000
X-UUID: ec7e254fb9c347768f7c47a5a595c1a3-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:e4e23e64-b775-42c4-a31d-4f4a8c594781, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:891e487a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: ec7e254fb9c347768f7c47a5a595c1a3-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 374171932; Mon, 23 May 2022 02:37:36 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 02:33:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 17:33:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 17:33:50 +0800
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
Subject: [RESEND v8 19/19] clk: mediatek: reset: Add infra_ao reset support
 for MT8186
Date: Mon, 23 May 2022 17:33:46 +0800
Message-ID: <20220523093346.28493-20-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_023740_675387_F0906083 
X-CRM114-Status: GOOD (  10.81  )
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

VGhlIGluZnJhX2FvIHJlc2V0IGlzIG5lZWRlZCBmb3IgTVQ4MTg2LgotIEFkZCBtdGtfY2xrX3Jz
dF9kZXNjIGZvciBNVDgxODYuCi0gQWRkIHJlZ2lzdGVyIHJlc2V0IGNvbnRyb2xsZXIgZnVuY3Rp
b24gZm9yIE1UODE4NiBpbmZyYV9hby4KLSBBZGQgaW5mcmFfYW9faWR4X21hcCBmb3IgTVQ4MTg2
LgoKU2lnbmVkLW9mZi1ieTogUmV4LUJDIENoZW4gPHJleC1iYy5jaGVuQG1lZGlhdGVrLmNvbT4K
UmV2aWV3ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3Jh
LmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9jbGsvbWVkaWF0ZWsv
Y2xrLW10ODE4Ni1pbmZyYV9hby5jIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRp
YXRlay9jbGstbXQ4MTg2LWluZnJhX2FvLmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4
MTg2LWluZnJhX2FvLmMKaW5kZXggMmE3YWRjMjVhYmFhLi5kZjJhNmJkMWFlZmEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxODYtaW5mcmFfYW8uYworKysgYi9kcml2
ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTg2LWluZnJhX2FvLmMKQEAgLTYsNiArNiw3IEBACiAj
aW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+CiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTg2LWNsay5oPgorI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L210ODE4Ni1yZXNldHMuaD4KIAogI2luY2x1ZGUgImNs
ay1nYXRlLmgiCiAjaW5jbHVkZSAiY2xrLW10ay5oIgpAQCAtMTkxLDkgKzE5MiwzMSBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IG10a19nYXRlIGluZnJhX2FvX2Nsa3NbXSA9IHsKIAlHQVRFX0lORlJB
X0FPMyhDTEtfSU5GUkFfQU9fRkxBU0hJRl82Nk0sICJpbmZyYV9hb19mbGFzaGlmXzY2bSIsICJ0
b3BfYXhpIiwgMjkpLAogfTsKIAorc3RhdGljIHUxNiBpbmZyYV9hb19yc3Rfb2ZzW10gPSB7CisJ
SU5GUkFfUlNUMF9TRVRfT0ZGU0VULAorCUlORlJBX1JTVDFfU0VUX09GRlNFVCwKKwlJTkZSQV9S
U1QyX1NFVF9PRkZTRVQsCisJSU5GUkFfUlNUM19TRVRfT0ZGU0VULAorCUlORlJBX1JTVDRfU0VU
X09GRlNFVCwKK307CisKK3N0YXRpYyB1MTYgaW5mcmFfYW9faWR4X21hcFtdID0geworCVtNVDgx
ODZfSU5GUkFfVEhFUk1BTF9DVFJMX1JTVF0gPSAwICogUlNUX05SX1BFUl9CQU5LICsgMCwKKwlb
TVQ4MTg2X0lORlJBX1BUUF9DVFJMX1JTVF0gPSAxICogUlNUX05SX1BFUl9CQU5LICsgMCwKK307
CisKK3N0YXRpYyBzdHJ1Y3QgbXRrX2Nsa19yc3RfZGVzYyBpbmZyYV9hb19yc3RfZGVzYyA9IHsK
KwkudmVyc2lvbiA9IE1US19SU1RfU0VUX0NMUiwKKwkucnN0X2Jhbmtfb2ZzID0gaW5mcmFfYW9f
cnN0X29mcywKKwkucnN0X2JhbmtfbnIgPSBBUlJBWV9TSVpFKGluZnJhX2FvX3JzdF9vZnMpLAor
CS5yc3RfaWR4X21hcCA9IGluZnJhX2FvX2lkeF9tYXAsCisJLnJzdF9pZHhfbWFwX25yID0gQVJS
QVlfU0laRShpbmZyYV9hb19pZHhfbWFwKSwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRr
X2Nsa19kZXNjIGluZnJhX2FvX2Rlc2MgPSB7CiAJLmNsa3MgPSBpbmZyYV9hb19jbGtzLAogCS5u
dW1fY2xrcyA9IEFSUkFZX1NJWkUoaW5mcmFfYW9fY2xrcyksCisJLnJzdF9kZXNjID0gJmluZnJh
X2FvX3JzdF9kZXNjLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb2Zf
bWF0Y2hfY2xrX210ODE4Nl9pbmZyYV9hb1tdID0gewotLSAKMi4xOC4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
