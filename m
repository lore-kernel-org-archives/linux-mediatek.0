Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540B5C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PBagjR5C4V9LkY0l2vowABlGELKGQbRlFijftnEI/w=; b=SFh76Qqz7L59OL
	aH9R/E5tcweW17I5yrJ+9HolNpYl+N1c7l4yTKDSDcu0eD/cPxA8SOXg4tS9cHRUkVKeMvSpnqIbD
	wzVjZzcsSLWv+nCMtR3LeWk6LCKtULJfb3U2DBM3oHx6k8qDLCHE1vYkKK7qiXfWS2KjVv8WRkqmV
	SUUbRXJG+KlFi/nI+qFuP09jU/KDmmI5ZyuFsKPg0yu6l32LpgxIJ5BOksKwQkx9VJDJdHTDS/nwB
	inxGcny70al1DXeXnN5qVS+qadu3xQqjzhx62ukbXS5ngu5AEdbT7uNfaAY6KFGJwr5AO7xb7SGHK
	HI+GlADuJ7RFdsFP91Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3v5-002dvT-Tk; Mon, 23 May 2022 09:00:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2oa-002A7b-J4; Mon, 23 May 2022 07:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=ullJe2oAklRDkSjU+rrFUlkPCTWn9jZ5rk3NnZCEilI=; b=fIYKmUGV+PBCbN96gp7kPw9vu2
 VzQBUkWeK1AyNuJfTSi1xmjlBG3XhxAt8q5qkm2eUNHddATgjLJ7/7r7DNJqiyFbmThjcliTY/gqT
 FFgztpZKNH+WTiRIjVpKwgvahsdcSlihJTTfP7DJzogGSS7sZ3DAgrBdZ9jhOPGNfhQyFXjttHzMr
 3usOHXkJyYUv7fat0NMzcpR7Mr99DVCsgDRK87hjFF25XqxtcO3sHtHr3cqnDTyiTZz8kdIeJFIsI
 JFo2wqiznfiOk4ZZEWuT2IZ73l73B57Qk1RuQYLlGSjow//t3A/oUfOWwN+nRw2YYYQRz+nmW0WFi
 EzGn1vjw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt1Hl-000syX-0y; Mon, 23 May 2022 06:11:24 +0000
X-UUID: 54f0e3e8e2ed45b989bbb86305d4564e-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:5e7e2789-77e9-4730-bacb-163b0fa3bd0a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:f0fe2ee3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 54f0e3e8e2ed45b989bbb86305d4564e-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 12600686; Sun, 22 May 2022 23:10:52 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 23:01:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 14:01:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 14:01:00 +0800
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
Subject: [PATCH v8 19/19] clk: mediatek: reset: Add infra_ao reset support for
 MT8186
Date: Mon, 23 May 2022 14:00:56 +0800
Message-ID: <20220523060056.24396-20-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
References: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_071121_724521_E5BFEAD1 
X-CRM114-Status: GOOD (  10.49  )
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
LmNvbT4KVGVzdGVkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxh
Ym9yYS5jb20+Ci0tLQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE4Ni1pbmZyYV9hby5j
IHwgMjMgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTg2LWluZnJh
X2FvLmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTg2LWluZnJhX2FvLmMKaW5kZXgg
MmE3YWRjMjVhYmFhLi5kZjJhNmJkMWFlZmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL21lZGlh
dGVrL2Nsay1tdDgxODYtaW5mcmFfYW8uYworKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGst
bXQ4MTg2LWluZnJhX2FvLmMKQEAgLTYsNiArNiw3IEBACiAjaW5jbHVkZSA8bGludXgvY2xrLXBy
b3ZpZGVyLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTg2LWNsay5oPgorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jl
c2V0L210ODE4Ni1yZXNldHMuaD4KIAogI2luY2x1ZGUgImNsay1nYXRlLmgiCiAjaW5jbHVkZSAi
Y2xrLW10ay5oIgpAQCAtMTkxLDkgKzE5MiwzMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19n
YXRlIGluZnJhX2FvX2Nsa3NbXSA9IHsKIAlHQVRFX0lORlJBX0FPMyhDTEtfSU5GUkFfQU9fRkxB
U0hJRl82Nk0sICJpbmZyYV9hb19mbGFzaGlmXzY2bSIsICJ0b3BfYXhpIiwgMjkpLAogfTsKIAor
c3RhdGljIHUxNiBpbmZyYV9hb19yc3Rfb2ZzW10gPSB7CisJSU5GUkFfUlNUMF9TRVRfT0ZGU0VU
LAorCUlORlJBX1JTVDFfU0VUX09GRlNFVCwKKwlJTkZSQV9SU1QyX1NFVF9PRkZTRVQsCisJSU5G
UkFfUlNUM19TRVRfT0ZGU0VULAorCUlORlJBX1JTVDRfU0VUX09GRlNFVCwKK307CisKK3N0YXRp
YyB1MTYgaW5mcmFfYW9faWR4X21hcFtdID0geworCVtNVDgxODZfSU5GUkFfVEhFUk1BTF9DVFJM
X1JTVF0gPSAwICogUlNUX05SX1BFUl9CQU5LICsgMCwKKwlbTVQ4MTg2X0lORlJBX1BUUF9DVFJM
X1JTVF0gPSAxICogUlNUX05SX1BFUl9CQU5LICsgMCwKK307CisKK3N0YXRpYyBzdHJ1Y3QgbXRr
X2Nsa19yc3RfZGVzYyBpbmZyYV9hb19yc3RfZGVzYyA9IHsKKwkudmVyc2lvbiA9IE1US19SU1Rf
U0VUX0NMUiwKKwkucnN0X2Jhbmtfb2ZzID0gaW5mcmFfYW9fcnN0X29mcywKKwkucnN0X2Jhbmtf
bnIgPSBBUlJBWV9TSVpFKGluZnJhX2FvX3JzdF9vZnMpLAorCS5yc3RfaWR4X21hcCA9IGluZnJh
X2FvX2lkeF9tYXAsCisJLnJzdF9pZHhfbWFwX25yID0gQVJSQVlfU0laRShpbmZyYV9hb19pZHhf
bWFwKSwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Nsa19kZXNjIGluZnJhX2FvX2Rl
c2MgPSB7CiAJLmNsa3MgPSBpbmZyYV9hb19jbGtzLAogCS5udW1fY2xrcyA9IEFSUkFZX1NJWkUo
aW5mcmFfYW9fY2xrcyksCisJLnJzdF9kZXNjID0gJmluZnJhX2FvX3JzdF9kZXNjLAogfTsKIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb2ZfbWF0Y2hfY2xrX210ODE4Nl9pbmZy
YV9hb1tdID0gewotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
