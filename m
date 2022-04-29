Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABD2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 20:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ukwHSXc7tfaZCHKiVuJnleZnl0RBRN1bk7iuiLC51k=; b=VHa5JB+KHWzJJT
	BHE89i99m3vY+5lqIlL5nngSmKcOf6aiPFhZ4oTBI90CgubQhwV7XxWE6b7RqJav3oBKqHZdILpw5
	9PdnJU75b/BOMO6f3Es4E/dwDsGqaygyQxncadK5VCCbEbAc6/C65uOvidHMoBgsBMkPYMQsFxGwp
	xTeRBV0yW7VhlKNsGQjWDtGvlcSqDdN4fxUQCRmRSlmYou89dfXcjLNL/vXnqnchj4000P1wtDn1+
	WUpp/pFc2OkSpSW1MkOxWr82n/D3M0n4ORBr/iXW+a52exTchoB6uj3/cSfvRAjumCXntJyPRSArL
	gKFnC6glOJG8s2njWOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkWtI-00CPB6-TZ; Fri, 29 Apr 2022 20:07:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkWt4-00CP5e-Qh; Fri, 29 Apr 2022 20:06:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id CC2F51F469D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651262803;
 bh=JRAg129iDB2/5CSYNVbbLVuyBCrEuyoaGLVzHKyj2fQ=;
 h=From:To:Cc:Subject:Date:From;
 b=RapoQLJhI54F0hG0vEaHBbuBphCdk16JCXEz99skfhaqxplQKqZ1A13z8r+P5xcWf
 vxSi8LrandGByTy8WQnwInxs7mYzXrHMGb2dwQjh7SvCm8EhpXG/xMOhhb37a+XVit
 Wbpk1Q6+KCz534aszmtjngOfSuE1KOLvYtd37kuYJTw7r8d08XkGAdzQlgkeIwl2Fa
 YREqh+nPIsskVk1lwHdOfnMJp8KeTWzCyBPmSJywfPhhjT3tftBlm5y42imQxavwRF
 wAQ1sHqC/Z8XF5Ql805WrNduQnFdOJX71pSBQQdzkXX6pHRgn8LD0UNgUgoyYXN5iZ
 Vlo8xTCE8aKew==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: mt8192: Add mediatek,
 pull-down-adv property
Date: Fri, 29 Apr 2022 16:06:37 -0400
Message-Id: <20220429200637.2204937-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_130647_033021_AEF4F1AC 
X-CRM114-Status: UNSURE (   8.87  )
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

QWRkIHRoZSBtZWRpYXRlayxwdWxsLWRvd24tYWR2IHByb3BlcnR5IHRvIHRoZSBwaW5jdHJsLW10
ODE5MiBkdC1iaW5kaW5nCnRvIGFsbG93IGNvbmZpZ3VyaW5nIHB1bGwtZG93biByZXNpc3RvcnMg
b24gdGhlIHBpbnMgb2YgTVQ4MTkyLiBJdCBpcwp0aGUgc2FtZSBhcyBpbiBtdDgxODMtcGluY3Ry
bC4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29s
bGFib3JhLmNvbT4KCi0tLQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3Ry
bC1tdDgxOTIueWFtbCAgIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwKaW5kZXggYzkwYTEzMmZiYzc5Li5l
NDYyZjQ5ZWFlNmYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbApAQCAtMTE3LDYgKzExNywx
NyBAQCBwYXR0ZXJuUHJvcGVydGllczoKICAgICAgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgogICAgICAgICAgICAgZW51bTogWzAsIDEsIDIsIDNd
CiAKKyAgICAgICAgICBtZWRpYXRlayxwdWxsLWRvd24tYWR2OgorICAgICAgICAgICAgZGVzY3Jp
cHRpb246IHwKKyAgICAgICAgICAgICAgUHVsbCBkb3duIHNldHRpbmdzIGZvciAyIHB1bGwgcmVz
aXN0b3JzLCBSMCBhbmQgUjEuIFVzZXIgY2FuCisgICAgICAgICAgICAgIGNvbmZpZ3VyZSB0aG9z
ZSBzcGVjaWFsIHBpbnMuIFZhbGlkIGFyZ3VtZW50cyBhcmUgZGVzY3JpYmVkIGFzIGJlbG93Ogor
ICAgICAgICAgICAgICAwOiAoUjEsIFIwKSA9ICgwLCAwKSB3aGljaCBtZWFucyBSMSBkaXNhYmxl
ZCBhbmQgUjAgZGlzYWJsZWQuCisgICAgICAgICAgICAgIDE6IChSMSwgUjApID0gKDAsIDEpIHdo
aWNoIG1lYW5zIFIxIGRpc2FibGVkIGFuZCBSMCBlbmFibGVkLgorICAgICAgICAgICAgICAyOiAo
UjEsIFIwKSA9ICgxLCAwKSB3aGljaCBtZWFucyBSMSBlbmFibGVkIGFuZCBSMCBkaXNhYmxlZC4K
KyAgICAgICAgICAgICAgMzogKFIxLCBSMCkgPSAoMSwgMSkgd2hpY2ggbWVhbnMgUjEgZW5hYmxl
ZCBhbmQgUjAgZW5hYmxlZC4KKyAgICAgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMgorICAgICAgICAgICAgZW51bTogWzAsIDEsIDIsIDNdCisKICAg
ICAgICAgICBiaWFzLXB1bGwtZG93bjogdHJ1ZQogCiAgICAgICAgICAgYmlhcy1wdWxsLXVwOiB0
cnVlCi0tIAoyLjM2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
