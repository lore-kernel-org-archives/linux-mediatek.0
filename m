Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BE5C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 20:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hTJXiDdV853+TxHQaEpAY5OaxzQP0oQwwAlF/auJdY0=; b=KWO+PEmWIuw/8J
	awsnE+NQfl/KHkpYQuAkOEk9yl7dvvqxOvOJIv7f+ri1TDKdaDGJ/sSTEmhLrc+p15IU0yNAwgGWT
	4bb9hJAc6GM498mwFPtk/xVummcz0Y7p79Kfty5LWRFXLfbqI+WR0ObhoH+Q32k6vyOzo2iDTG862
	hfqATNUQL4fHNQ4H2OU69q/qDhl6QKg0dg6VZ7LpqUVdonqxBe0GnVTj66P9DfTb7bDmSGgQeiR/h
	qKh2/1JZHdofkQ/Cr5YDyflmKIiSv9UomI1PutjRlPqoCjcp9d5HUDZyV8spNw5KK9jOrN5EZigJy
	Xr8mxbzRbgfI06OvQN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkX03-00CRRj-Mv; Fri, 29 Apr 2022 20:13:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkWzc-00CRA2-Gi; Fri, 29 Apr 2022 20:13:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id D924D1F469D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651263211;
 bh=Ygrrf/uiE7GKex7nmfQ7KPictd649a7293BtSJxSJ28=;
 h=From:To:Cc:Subject:Date:From;
 b=bF5Y9hNQy9VcyUwBt8enhkN46rRy0LwPqcxZlpmJQqFG7afz+RUXNOBkIXxBWSW7l
 n5f0x+aG7Z8YNagVc31Zq9jt0XQ3BxPvCMxt4b4RSwkHBnMAoX8zHn519KzNttEn4y
 zcYjx2Sxb8GKHejIaPnZix4Vqgg0t+qwcgN+4QKBOeY8rOnaNrcbFpym/oDFFxzS8Y
 O5HZWV8mK1NwIccTscOUmVd0y5b0wMSD3GzDx7nw2UN1qxjLjn99L3NF2/mYg73kkM
 WCw6i/oukTLnr7AJ4bDybinpRUOPB0WRM5iPsG9Uz1MgXENXUlHcDBUplbhDpKm5JW
 gMj/arQdA1m3g==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: regulator: mt6315: Enforce regulator-compatible,
 not name
Date: Fri, 29 Apr 2022 16:13:24 -0400
Message-Id: <20220429201325.2205799-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_131332_719488_3088C82C 
X-CRM114-Status: GOOD (  10.92  )
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

VGhlIE1UNjMxNSBQTUlDIGR0LWJpbmRpbmcgc2hvdWxkIGVuZm9yY2UgdGhhdCBvbmUgb2YgdGhl
IHZhbGlkCnJlZ3VsYXRvci1jb21wYXRpYmxlIGlzIHNldCBpbiBlYWNoIHJlZ3VsYXRvciBub2Rl
LiBIb3dldmVyIGl0IHdhcwptaXN0YWtlbmx5IG1hdGNoaW5nIGFnYWluc3QgcmVndWxhdG9yLW5h
bWUgaW5zdGVhZC4KCkZpeCB0aGUgdHlwby4gVGhpcyBub3Qgb25seSBmaXhlcyB0aGUgY29tcGF0
aWJsZSB2ZXJpZmljYXRpb24sIGJ1dCBhbHNvCmxpZnRzIHRoZSByZWd1bGF0b3ItbmFtZSByZXN0
cmljdGlvbiwgc28gdGhhdCBtb3JlIG1lYW5pbmdmdWwgbmFtZXMgY2FuCmJlIHNldCBmb3IgZWFj
aCBwbGF0Zm9ybS4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJh
cHJhZG9AY29sbGFib3JhLmNvbT4KCi0tLQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3Vs
YXRvci9tdDYzMTUtcmVndWxhdG9yLnlhbWwgICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3IvbXQ2MzE1LXJlZ3VsYXRvci55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9tdDYzMTUtcmVndWxh
dG9yLnlhbWwKaW5kZXggNjFkZDVhZjgwZGI2Li41ZDJkOTg5ZGU4OTMgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3IvbXQ2MzE1LXJlZ3VsYXRv
ci55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3Iv
bXQ2MzE1LXJlZ3VsYXRvci55YW1sCkBAIC0zMSw3ICszMSw3IEBAIHByb3BlcnRpZXM6CiAgICAg
ICAgICRyZWY6ICJyZWd1bGF0b3IueWFtbCMiCiAKICAgICAgICAgcHJvcGVydGllczoKLSAgICAg
ICAgICByZWd1bGF0b3ItbmFtZToKKyAgICAgICAgICByZWd1bGF0b3ItY29tcGF0aWJsZToKICAg
ICAgICAgICAgIHBhdHRlcm46ICJedmJ1Y2tbMS00XSQiCiAKICAgICBhZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UKLS0gCjIuMzYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
