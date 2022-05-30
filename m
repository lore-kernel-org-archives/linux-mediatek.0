Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DDDC43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 08:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbb6yquQ1RKaHTJpeWlsJd+P4/eX5syFXyzfzY1LaUA=; b=S0PyAfS04IBTIc
	MkYVUHnSm7ZDXCHp6FhpZHQeXcAmkN/OK0CdV0jYYJLRzpfLi0Aaq+j1rYjsyHlxtKOglHNUJK7ue
	Z6s9KKW+r5ipDTrXZl1qsrVnw5DPwG8ystHOqacna2I95yoykZWIhAOX66K+1G4fMRgwfhAuapur6
	dufHdQbO0gWMc6M/cGzJimegXdwBa4lyySe10yg8sSRBpGBlGhleJD8vVqBJ5X2PTlxrxHgeuMKY2
	2abLwWJ03HZRTOJk0W6jyNRS3LwMi3F1YfW2NRCf7pZYOsbz9p8OXXf+Biyhw+XLpvdx7IYrozPbE
	Ejf+pLsScHT5hONNJL1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvath-005wcO-7H; Mon, 30 May 2022 08:37:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvatS-005wVq-DU; Mon, 30 May 2022 08:36:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 868C41F4268D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653899813;
	bh=Y/KtP99ehw9i7ZwsNuEGtXoz1oqAmizCXVVyI5AAj9Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y1zqd2ujFrL3awd9MbIdWvCY47uoQi3Cf8I/Gd+ZxqgM1DoSmpjFPqjlRFth+dcE+
	 Vdhtz1b765+cFXX/WbkMNGrRdpsosEPRpaoqa37XNx5DL9jLy3E9/QuHs06pZE8wRY
	 YOt+iWAFTw0Wp/lPmXRYfI10A2PkE1faj0fsuSMsXqcD9xpqfYdcqnWk6+0gjEfmVp
	 26ZJZ5iVkpCA4fbBymeP+510wy0E45gfGXBDcQjPhq7LrzsXu+DFU38I9r/vS1dyRg
	 Cgx2+97WXYGj9gxuuUuhhUrN0JEpxZLjb0OqD+q83ebINTpErHfZpi858NdDGPjwUP
	 VEZM5AIw1zJRA==
Message-ID: <5f312705-f09c-763f-7f29-5461cf08ced7@collabora.com>
Date: Mon, 30 May 2022 10:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: mt8192: Add
 drive-strength-microamp
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220525155714.1837360-1-nfraprado@collabora.com>
 <20220525155714.1837360-2-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220525155714.1837360-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_013654_626119_07E14432 
X-CRM114-Status: UNSURE (   9.74  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SWwgMjUvMDUvMjIgMTc6NTcsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
Q29tbWl0IGU1ZmFiYmU0M2YzZiAoInBpbmN0cmw6IG1lZGlhdGVrOiBwYXJpczogU3VwcG9ydCBn
ZW5lcmljCj4gUElOX0NPTkZJR19EUklWRV9TVFJFTkdUSF9VQSIpIGFkZGVkIHN1cHBvcnQgZm9y
IHVzaW5nCj4gZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgaW5zdGVhZCBvZiBtZWRpYXRlayxkcml2
ZS1zdHJlbmd0aC1hZHYuCj4gCj4gU2luY2UgdGhlcmUgYXJlbid0IGFueSB1c2VycyBvZiBtZWRp
YXRlayxkcml2ZS1zdHJlbmd0aC1hZHYgb24gbXQ4MTkyCj4geWV0LCByZW1vdmUgdGhpcyBwcm9w
ZXJ0eSBhbmQgYWRkIGRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wIGluIGl0cyBwbGFjZSwKPiB3aGlj
aCBoYXMgYSBjbGVhcmVyIG1lYW5pbmcuCj4gCj4gRml4ZXM6IDRhYzY4MzMzZmY2ZCAoImR0LWJp
bmRpbmdzOiBwaW5jdHJsOiBtdDgxOTI6IEFkZCBtZWRpYXRlayxkcml2ZS1zdHJlbmd0aC1hZHYg
cHJvcGVydHkiKQo+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJh
cHJhZG9AY29sbGFib3JhLmNvbT4KPiAKClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERl
bCBSZWdubyA8YW5nZWxvZ2lvY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
