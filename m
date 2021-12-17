Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FA4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PFBwc8O6nHtd9KOdQbs6qJ0xgLF6CAxLWfQ4TiD9S1U=; b=aoP67QXpP+IUm9
	9vctDw9yBcQVZUskxxs3zxOcQ/BjQLnrKbDBKOJJutIWX7ZXCRA+oH+jslplcPZSQWiRzZigqQw/c
	hKPFR2gfxQJHaFbloURlxvjdtSiM9X6r/a87kTSWxeaAxteiAQiCOGJY232rHIe6QgaRS3qcRk5rg
	zafrTWlxv4ttjwGKHsIA8IrBQ5MOE489pBYxJ73Voidxkpfx+WlTIlqU8mGAtlDkDMVtEbSNnvzTN
	NoXqcKibpvut13ZWPLt2yVaFRIQlUIQXr5nKRID4HGtavlla7hvL64sSG/tm8iq8K9NGdhTbGbfSD
	SoV8VmgoNHXYz7mLq6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myC5p-00A2F4-M4; Fri, 17 Dec 2021 12:12:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myC5c-00A2Al-Au; Fri, 17 Dec 2021 12:11:57 +0000
X-UUID: 06bffaef8c6f42ae8873f5076badeb76-20211217
X-UUID: 06bffaef8c6f42ae8873f5076badeb76-20211217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1089492581; Fri, 17 Dec 2021 05:11:51 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 04:11:49 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 20:11:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 17 Dec 2021 20:11:48 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, "Weiyi
 Lu" <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, Miles Chen
 <miles.chen@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "YH
 Chen" <yh.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH v7 0/3] Mediatek MT7986 basic clock support
Date: Fri, 17 Dec 2021 20:11:45 +0800
Message-ID: <20211217121148.6753-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_041156_401832_0F53C723 
X-CRM114-Status: GOOD (  10.28  )
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

VGhpcyBwYXRjaCBzZXJpZXMgYWRkIGJhc2ljIGNsb2NrIHN1cHBvcnQgZm9yIG1lZGlhdGVrIG10
Nzk4NiBTb0MuCkl0IGlzIGJhc2VkIG9uIHBhdGNoIHNlcmllcyAiQWRkIGJhc2ljIFNvQyBzdXBw
b3J0IGZvciBtZWRpYXRlayBtdDc5ODYiCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIx
MTAxODExNDAwOS4xMzM1MC0xLXNhbS5zaGloQG1lZGlhdGVrLmNvbS8KYW5kICJjbGs6IG1lZGlh
dGVrOiBBZGQgQVBJIGZvciBjbG9jayByZXNvdXJjZSByZWN5Y2xlIgpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjEwOTE0MDIxNjMzLjI2Mzc3LTUtY2h1bi1qaWUu
Y2hlbkBtZWRpYXRlay5jb20vCi0tLQp2NzogZXhjbHVkZSBEVFMgY2hhbmdlcyBpbiB0aGUgcGF0
Y2ggc2VyaWVzCnY1OiB1c2VkIGJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyIGluc3RlYWQgb2YgQ0xL
X09GX0RFQ0xBUkUKICAgIGZvbGxvdyByZWNlbnQgY2xrLW10ODE5NSBjbG9jayBwYXRjaCBzZXJp
ZXM6CiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjEwOTE0
MDIxNjMzLjI2Mzc3LTEtY2h1bi1qaWUuY2hlbkBtZWRpYXRlay5jb20vCgp2NDoKQWNjb3JkaW5n
IHRvIHRoZSBtYWludGFpbmVywqHCpnMgc3VnZ2VzdGlvbiwgdGhpcyBwYXRjaCBzcGxpdHMgdGhl
IHByZXZpb3VzCnRocmVhZCBpbnRvIGluZGVwZW5kZW50IHBhdGNoIHNlcmllcy4KVGhpcyBwYXRj
aCBpbmNsdWRlIGNsb2NrIGRyaXZlciBhbmQgZGV2aWNlIHRyZWUgdXBkYXRlCgpPcmlnaW5hbCB0
aHJlYWQ6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMDkxNDA4NTEzNy4zMTc2MS0x
LXNhbS5zaGloQG1lZGlhdGVrLmNvbS8KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJt
LWtlcm5lbC8yMDIxMDkxNDA4NTEzNy4zMTc2MS0yLXNhbS5zaGloQG1lZGlhdGVrLmNvbS8KLS0t
CgpTYW0gU2hpaCAoMyk6CiAgZHQtYmluZGluZ3M6IGNsb2NrOiBtZWRpYXRlazogZG9jdW1lbnQg
Y2xrIGJpbmRpbmdzIGZvciBtZWRpYXRlawogICAgbXQ3OTg2IFNvQwogIGNsazogbWVkaWF0ZWs6
IGFkZCBtdDc5ODYgY2xvY2sgSURzCiAgY2xrOiBtZWRpYXRlazogYWRkIG10Nzk4NiBjbG9jayBz
dXBwb3J0CgogLi4uL2FybS9tZWRpYXRlay9tZWRpYXRlayxhcG1peGVkc3lzLnR4dCAgICAgIHwg
ICAxICsKIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssZXRoc3lzLnR4dCB8ICAg
MSArCiAuLi4vYXJtL21lZGlhdGVrL21lZGlhdGVrLGluZnJhY2ZnLnR4dCAgICAgICAgfCAgIDEg
KwogLi4uL2FybS9tZWRpYXRlay9tZWRpYXRlayxzZ21paXN5cy50eHQgICAgICAgIHwgICAyICsK
IC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssdG9wY2tnZW4udHh0ICAgICAgICB8ICAgMSArCiBk
cml2ZXJzL2Nsay9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgMTcgKwogZHJp
dmVycy9jbGsvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICA0ICsKIGRyaXZl
cnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtYXBtaXhlZC5jICAgICB8IDEwMCArKysrKwogZHJp
dmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni1ldGguYyAgICAgICAgIHwgMTMyICsrKysrKysK
IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtaW5mcmFjZmcuYyAgICB8IDIyNCArKysr
KysrKysrKysKIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtdG9wY2tnZW4uYyAgICB8
IDM0MiArKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbXQ3OTg2
LWNsay5oICAgICAgICB8IDE2OSArKysrKysrKysKIDEyIGZpbGVzIGNoYW5nZWQsIDk5NCBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10
Nzk4Ni1hcG1peGVkLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZWRpYXRlay9j
bGstbXQ3OTg2LWV0aC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsv
Y2xrLW10Nzk4Ni1pbmZyYWNmZy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVk
aWF0ZWsvY2xrLW10Nzk4Ni10b3Bja2dlbi5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9k
dC1iaW5kaW5ncy9jbG9jay9tdDc5ODYtY2xrLmgKCi0tIAoyLjI5LjIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
