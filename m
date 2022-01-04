Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17908C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 05:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/UsSzWiyYhfMfoBWFHDGXtPjy6ydrvCS7caZbCq1A6Q=; b=J/lspwhRCWMOB6
	6jaZ/VHifBAi+7HfYs+2CUz72fGiLI7UoDRRcxHfJUJhu1kSSh0e5pEtqhDII6IuofO5quozp+GYX
	IKsvVODUceDY3IkngBd11avhtaAQmgOydtKaSmT7N29vz2QLei9ZHnmUXD2qwuEm34f3DGzsodJOH
	x4+Rnuj/2RuW797rTImE1FR+Yds9J1RNMc3S7sFE02sbdDUEkRBlR5z5v08qeFLD8mkyNEoAgM5Cq
	G9FM8D0l3OfPSpvHSlVqVGi5gA4jikmLx9Iab5Szi6WuP0MHbsSxXuV4EuFQomDzuC9AQfla8xAvG
	jrlB/RIypqprFF4cU8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4c0u-00AN4u-Gj; Tue, 04 Jan 2022 05:05:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4c0h-00AN2g-Rf; Tue, 04 Jan 2022 05:05:25 +0000
X-UUID: 6a627f8f9d37457a8f3a334025d3579e-20220103
X-UUID: 6a627f8f9d37457a8f3a334025d3579e-20220103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 603291566; Mon, 03 Jan 2022 22:05:19 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Jan 2022 20:55:18 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 12:55:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 4 Jan 2022 12:55:17 +0800
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
Subject: [PATCH v8 0/3] Mediatek MT7986 basic clock support
Date: Tue, 4 Jan 2022 12:55:08 +0800
Message-ID: <20220104045508.21614-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_210523_926352_24D449BF 
X-CRM114-Status: GOOD (  12.62  )
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
MTAxODExNDAwOS4xMzM1MC0xLXNhbS5zaGloQG1lZGlhdGVrLmNvbS8KdGhhdCBoYXMgYmVlbiBt
ZXJnZWQgaW50byBtYXR0aGlhcydzIHRyZWUgcmVjZW50bHk6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21hdHRoaWFzLmJnZy9saW51eC5naXQvbG9nLz9o
PXY1LjE2LW5leHQvZHRzNjQKCi0tLQp2ODogdXBkYXRlIHRoZSBnaXQgbWVzc2FnZSwgYW5kIGFk
ZCBhIFJldmlld2VkLWJ5IHRhZyBmb3IgdGhpcyBzZXJpZXMgCnY3OiBleGNsdWRlIERUUyBjaGFu
Z2VzIGluIHRoZSBwYXRjaCBzZXJpZXMKdjU6IHVzZWQgYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIg
aW5zdGVhZCBvZiBDTEtfT0ZfREVDTEFSRQogICAgZm9sbG93IHJlY2VudCBjbGstbXQ4MTk1IGNs
b2NrIHBhdGNoIHNlcmllczoKICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1r
ZXJuZWwvMjAyMTA5MTQwMjE2MzMuMjYzNzctMS1jaHVuLWppZS5jaGVuQG1lZGlhdGVrLmNvbS8K
CnY0OgpBY2NvcmRpbmcgdG8gdGhlIG1haW50YWluZXLCocKmcyBzdWdnZXN0aW9uLCB0aGlzIHBh
dGNoIHNwbGl0cyB0aGUgcHJldmlvdXMKdGhyZWFkIGludG8gaW5kZXBlbmRlbnQgcGF0Y2ggc2Vy
aWVzLgpUaGlzIHBhdGNoIGluY2x1ZGUgY2xvY2sgZHJpdmVyIGFuZCBkZXZpY2UgdHJlZSB1cGRh
dGUKCk9yaWdpbmFsIHRocmVhZDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjEwOTE0
MDg1MTM3LjMxNzYxLTEtc2FtLnNoaWhAbWVkaWF0ZWsuY29tLwpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjEwOTE0MDg1MTM3LjMxNzYxLTItc2FtLnNoaWhAbWVk
aWF0ZWsuY29tLwotLS0KClNhbSBTaGloICgzKToKICBkdC1iaW5kaW5nczogY2xvY2s6IG1lZGlh
dGVrOiBkb2N1bWVudCBjbGsgYmluZGluZ3MgZm9yIG1lZGlhdGVrCiAgICBtdDc5ODYgU29DCiAg
Y2xrOiBtZWRpYXRlazogYWRkIG10Nzk4NiBjbG9jayBJRHMKICBjbGs6IG1lZGlhdGVrOiBhZGQg
bXQ3OTg2IGNsb2NrIHN1cHBvcnQKCiAuLi4vYXJtL21lZGlhdGVrL21lZGlhdGVrLGFwbWl4ZWRz
eXMudHh0ICAgICAgfCAgIDEgKwogLi4uL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxl
dGhzeXMudHh0IHwgICAxICsKIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssaW5mcmFjZmcudHh0
ICAgICAgICB8ICAgMSArCiAuLi4vYXJtL21lZGlhdGVrL21lZGlhdGVrLHNnbWlpc3lzLnR4dCAg
ICAgICAgfCAgIDIgKwogLi4uL2FybS9tZWRpYXRlay9tZWRpYXRlayx0b3Bja2dlbi50eHQgICAg
ICAgIHwgICAxICsKIGRyaXZlcnMvY2xrL21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAg
ICB8ICAxNyArCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
fCAgIDQgKwogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni1hcG1peGVkLmMgICAgIHwg
MTAwICsrKysrCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LWV0aC5jICAgICAgICAg
fCAxMzIgKysrKysrKwogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni1pbmZyYWNmZy5j
ICAgIHwgMjI0ICsrKysrKysrKysrKwogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Nzk4Ni10
b3Bja2dlbi5jICAgIHwgMzQyICsrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9kdC1iaW5kaW5n
cy9jbG9jay9tdDc5ODYtY2xrLmggICAgICAgIHwgMTY5ICsrKysrKysrKwogMTIgZmlsZXMgY2hh
bmdlZCwgOTk0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9t
ZWRpYXRlay9jbGstbXQ3OTg2LWFwbWl4ZWQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Y2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtZXRoLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LWluZnJhY2ZnLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LXRvcGNrZ2VuLmMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210Nzk4Ni1jbGsuaAoKLS0gCjIuMjkuMgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
