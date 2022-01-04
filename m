Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E863BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 04:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eFOw3Vhxuo4wobOMkF4gTX+Dgwiam76IHj0PhjAyY/M=; b=cX7fNJaeayayvi
	VRFa8bwBqm24rhixkJ6tonVeH2811bOzpyr8Qdog69hNYDxwQIvkkSwKrxnewpWUe/q506W6eShGG
	DK6jmpEJu6akOfmYbt1gfcJOqulMR+QcPMbkIFvky04bELMMzHuB9C+A2x0xTTgNcDG1MSSJNBpuC
	9VSVFbtitCUiIu73z1ORhWj02kzrdBOZ5Ct9O01Zl0yiXZYIcaULzlN3fuJkDQmX+XLLih0BWQ+AC
	dTbrUxwNF9KUE1t/ix0q7IGijBYJPs9UNmOnelnf5/5RBg8NWq2YgXNnHbQcti4/MNQENll2++/B7
	qThbV8ZQ21d8zm61oCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4bpN-00ALNC-HH; Tue, 04 Jan 2022 04:53:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4bpA-00ALKg-MZ; Tue, 04 Jan 2022 04:53:30 +0000
X-UUID: 4258ea8bb0b94a7a8ef86b8f79edbd9a-20220103
X-UUID: 4258ea8bb0b94a7a8ef86b8f79edbd9a-20220103
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1930165417; Mon, 03 Jan 2022 21:53:18 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Jan 2022 20:53:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 4 Jan 2022 12:53:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 4 Jan 2022 12:53:14 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, "Weiyi
 Lu" <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, Miles Chen
 <miles.chen@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee
 <ryder.lee@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: John Crispin <john@phrozen.org>, Sam Shih <sam.shih@mediatek.com>
Subject: 
Date: Tue, 4 Jan 2022 12:52:40 +0800
Message-ID: <20220104045243.21521-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_205328_754060_28EE607E 
X-CRM114-Status: GOOD (  12.01  )
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

U3ViamVjdDogW1BBVENIIHY4IDAvM10gTWVkaWF0ZWsgTVQ3OTg2IGJhc2ljIGNsb2NrIHN1cHBv
cnQKClRoaXMgcGF0Y2ggc2VyaWVzIGFkZCBiYXNpYyBjbG9jayBzdXBwb3J0IGZvciBtZWRpYXRl
ayBtdDc5ODYgU29DLgpJdCBpcyBiYXNlZCBvbiBwYXRjaCBzZXJpZXMgIkFkZCBiYXNpYyBTb0Mg
c3VwcG9ydCBmb3IgbWVkaWF0ZWsgbXQ3OTg2IgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyMTEwMTgxMTQwMDkuMTMzNTAtMS1zYW0uc2hpaEBtZWRpYXRlay5jb20vCnRoYXQgaGFzIGJl
ZW4gbWVyZ2VkIGludG8gbWF0dGhpYXMncyB0cmVlIHJlY2VudGx5OgpodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tYXR0aGlhcy5iZ2cvbGludXguZ2l0L2xv
Zy8/aD12NS4xNi1uZXh0L2R0czY0CgotLS0Kdjg6IHVwZGF0ZSB0aGUgZ2l0IG1lc3NhZ2UsIGFu
ZCBhZGQgYSBSZXZpZXdlZC1ieSB0YWcgZm9yIHRoaXMgc2VyaWVzIAp2NzogZXhjbHVkZSBEVFMg
Y2hhbmdlcyBpbiB0aGUgcGF0Y2ggc2VyaWVzCnY1OiB1c2VkIGJ1aWx0aW5fcGxhdGZvcm1fZHJp
dmVyIGluc3RlYWQgb2YgQ0xLX09GX0RFQ0xBUkUKICAgIGZvbGxvdyByZWNlbnQgY2xrLW10ODE5
NSBjbG9jayBwYXRjaCBzZXJpZXM6CiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1h
cm0ta2VybmVsLzIwMjEwOTE0MDIxNjMzLjI2Mzc3LTEtY2h1bi1qaWUuY2hlbkBtZWRpYXRlay5j
b20vCgp2NDoKQWNjb3JkaW5nIHRvIHRoZSBtYWludGFpbmVywqHCpnMgc3VnZ2VzdGlvbiwgdGhp
cyBwYXRjaCBzcGxpdHMgdGhlIHByZXZpb3VzCnRocmVhZCBpbnRvIGluZGVwZW5kZW50IHBhdGNo
IHNlcmllcy4KVGhpcyBwYXRjaCBpbmNsdWRlIGNsb2NrIGRyaXZlciBhbmQgZGV2aWNlIHRyZWUg
dXBkYXRlCgpPcmlnaW5hbCB0aHJlYWQ6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIx
MDkxNDA4NTEzNy4zMTc2MS0xLXNhbS5zaGloQG1lZGlhdGVrLmNvbS8KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIxMDkxNDA4NTEzNy4zMTc2MS0yLXNhbS5zaGlo
QG1lZGlhdGVrLmNvbS8KLS0tCgpTYW0gU2hpaCAoMyk6CiAgZHQtYmluZGluZ3M6IGNsb2NrOiBt
ZWRpYXRlazogZG9jdW1lbnQgY2xrIGJpbmRpbmdzIGZvciBtZWRpYXRlawogICAgbXQ3OTg2IFNv
QwogIGNsazogbWVkaWF0ZWs6IGFkZCBtdDc5ODYgY2xvY2sgSURzCiAgY2xrOiBtZWRpYXRlazog
YWRkIG10Nzk4NiBjbG9jayBzdXBwb3J0CgogLi4uL2FybS9tZWRpYXRlay9tZWRpYXRlayxhcG1p
eGVkc3lzLnR4dCAgICAgIHwgICAxICsKIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0
ZWssZXRoc3lzLnR4dCB8ICAgMSArCiAuLi4vYXJtL21lZGlhdGVrL21lZGlhdGVrLGluZnJhY2Zn
LnR4dCAgICAgICAgfCAgIDEgKwogLi4uL2FybS9tZWRpYXRlay9tZWRpYXRlayxzZ21paXN5cy50
eHQgICAgICAgIHwgICAyICsKIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssdG9wY2tnZW4udHh0
ICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAg
ICAgICAgfCAgMTcgKwogZHJpdmVycy9jbGsvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAg
ICAgIHwgICA0ICsKIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtYXBtaXhlZC5jICAg
ICB8IDEwMCArKysrKwogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni1ldGguYyAgICAg
ICAgIHwgMTMyICsrKysrKysKIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtaW5mcmFj
ZmcuYyAgICB8IDIyNCArKysrKysrKysrKysKIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5
ODYtdG9wY2tnZW4uYyAgICB8IDM0MiArKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHQtYmlu
ZGluZ3MvY2xvY2svbXQ3OTg2LWNsay5oICAgICAgICB8IDE2OSArKysrKysrKysKIDEyIGZpbGVz
IGNoYW5nZWQsIDk5NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9j
bGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni1hcG1peGVkLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LWV0aC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni1pbmZyYWNmZy5jCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni10b3Bja2dlbi5jCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tdDc5ODYtY2xrLmgKCi0tIAoyLjI5
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
