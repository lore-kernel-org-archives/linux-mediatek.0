Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F090DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PGX/aa9fLG/uNt3WKpWzBwpPGiHiEYeOF75lGEfDNV0=; b=uVD9BOf2fqud/z
	umWb570xwVgDebtb5FiOguPDmggTAZpHokiyX0+jtXXAW5KqhadpFHjpmjwNXBIqWgjXAPLLySZFD
	aAUTQscyzYY8XDrnGUq6GwaBm0GZNd8BIiZBQDW3vstqIjX8mOHsixNyqiGGfdtfT7ly//Q4wvzU7
	A0xJ2qc2B/1yhF+ay1w/U7xZQ97/DTxGJ2HyHpcMJGiyBoem2xcBzLuDMzyDfweSyn+Q6aKs6zZRh
	EB/Q6UqUELot7k+l8X59YDXtX+cAJx23BGRoRf3FK9sJSaVWU7Z1bgohQkTw3/FObKNVaWkRZe1OE
	SRx61237qQWa0JMhO6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkWkj-00CNwM-3E; Fri, 29 Apr 2022 19:58:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkWkX-00CNtz-KJ; Fri, 29 Apr 2022 19:57:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id C30DE1F4696F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651262272;
 bh=aoTbCcZZ92qztLcOxHun78cIUtr7XMDInx4IzvkcyKk=;
 h=From:To:Cc:Subject:Date:From;
 b=AQbAGPd/98luGnCQpTydxXUBRqg2ogAU9Idgb+W7cXtWtSkMeVLrb2lqcl7pP8oJ2
 B/I6qLiFNyA1UrFCLlEVtv3K+tEC/kdR/BzOyYBdD0TyoUN3/8+/bYvzZeDW1cmbvE
 rmaMtHrrIQlOES6uwiKDIW1SJ8HLqd9TshZAeXpHYzbifrQNC8WOBZEQZ/ynjyUB7I
 /ZyxjqUYTLJzVnR+EW3uL5dxTWXDpgRrdZOZzesFeA+VVc9cilfqfErZjWXELjFLId
 pw/S45N6Vmxo2uYXNCOeLECVLq9Np0FRBsIkKuL77aYOwaQWxDulP26vWVkjonkpLo
 kN4p3BaHSMuqw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: Add fallback compatible for mt8192's
 flash
Date: Fri, 29 Apr 2022 15:57:45 -0400
Message-Id: <20220429195745.2203461-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_125757_819249_18434935 
X-CRM114-Status: GOOD (  11.76  )
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

VGhlIGR0LWJpbmRpbmcgZm9yIE1lZGlhdGVrJ3MgU1BJIE5PUiBmbGFzaCBjb250cm9sbGVyIGV4
cGVjdHMgYSBtdDgxNzMKZmFsbGJhY2sgY29tcGF0aWJsZSBmb3IgbXQ4MTkyLCBzbyBhZGQgaXQg
aW4gbXQ4MTkyLmR0c2kuCgpUaGUgZHJpdmVyIGFscmVhZHkgc2V0cyBjdXN0b20gZGF0YSBiYXNl
ZCBvbiB0aGUgbXQ4MTkyIGNvbXBhdGlibGUsIHNvCnRoaXMgZmFsbGJhY2sgY29tcGF0aWJsZSB3
b24ndCBiZSB1c2VkIGFuZCBpcyBhZGRlZCBwdXJlbHkgdG8gc3VwcHJlc3MKdGhlIGR0LWJpbmRp
bmcgd2FybmluZy4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJh
cHJhZG9AY29sbGFib3JhLmNvbT4KCi0tLQoKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsv
bXQ4MTkyLmR0c2kgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5
Mi5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQppbmRleCAy
NmRiZTllY2M1MjguLjMyYTgzNjEwNWVhNyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxOTIuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE5Mi5kdHNpCkBAIC04OTYsNyArODk2LDcgQEAgcGNpZV9pbnRjMDogaW50ZXJydXB0LWNv
bnRyb2xsZXIgewogCQl9OwogCiAJCW5vcl9mbGFzaDogc3BpQDExMjM0MDAwIHsKLQkJCWNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLW5vciI7CisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVr
LG10ODE5Mi1ub3IiLCAibWVkaWF0ZWssbXQ4MTczLW5vciI7CiAJCQlyZWcgPSA8MCAweDExMjM0
MDAwIDAgMHhlMD47CiAJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDMxIElSUV9UWVBFX0xFVkVM
X0hJR0ggMD47CiAJCQljbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19UT1BfU0ZMQVNIX1NFTD4sCi0t
IAoyLjM2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
