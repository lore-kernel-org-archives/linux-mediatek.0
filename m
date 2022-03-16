Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD3FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEFJleacwqxayMdwZBTMfXVqCQMpa8aGZe9sv7CgiXQ=; b=KOX9NL7gjvF462
	paJ9ZuPRE/uhIos4hGELCT338wwd1bHkpP0FYMs2loexvTGA+VurGr79J/NIQ2bJDmHHQatdHLLHQ
	RubskVJKSX+QTmwh8GllnmrSO0ArXrkf6cqFk3kAYDm8tMKeWqCB6sOOcKG4FIZVG/36kZjDUrwIf
	PhAQTAnS9joWZw5ZXglm7OIX9CkmiaXSqcXgieB2jtJQScETRmIA8eaC9VdN5PhKpx+zHg2mRkY7j
	sVW9MuJnSgDxHfW2CMAqGcNUihx5e1BBJO7e3QDlLJ0NWoeqZQIPRHYv4DS/ggQ8G6exq0LxGFuY8
	Eo2bLmKwKu1tKQbQ8gWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUPDI-00CAU2-SO; Wed, 16 Mar 2022 08:41:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUPCH-00C9xC-A6; Wed, 16 Mar 2022 08:39:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 58FF01F42D16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647419996;
 bh=6WPOPppOizB/g6/lobcK77bh8kHrOplZbelFC9CpIUA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TsC6ZfsFhZMI8I3s5v4tGkqvD7QjPvEUK4JAC9QWKIRtcvTmcegSpYoLXW3QEvOaV
 zY8g2543I8SuerAb5P+hrNx8jktdaljoKpX+hlFAOdpANKmF95IajB0G3ggtFH9RjP
 F6OVWzO7QIeeEHT8GfP81mzL4kIYkFbcx1pUt+V8atadstuNrlNLvexxKsKYEexyAg
 fvI7DdBNwLiPPX29THesY728mJHPDGh9hJkIUSAGuwOSOZUDDkUZuab7DgJuTHsuoX
 d2/yRSVZJ/qrqZ+kJjcNdLgI3iiF/6fxz0woGZHMzrTsH2zrBgV1Zj9boZyCupIseq
 jgKkJ+lGw61tQ==
Message-ID: <4d602be6-e357-2a6a-cd99-c89c67a98f17@collabora.com>
Date: Wed, 16 Mar 2022 09:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1 2/4] dt-bindings: pinctrl: mt8192: Add
 mediatek,drive-strength-adv property
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: kernel@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220315211936.442708-1-nfraprado@collabora.com>
 <20220315211936.442708-3-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220315211936.442708-3-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_013957_533040_09E7CA99 
X-CRM114-Status: UNSURE (   8.51  )
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

SWwgMTUvMDMvMjIgMjI6MTksIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
QWRkIHRoZSBtZWRpYXRlayxkcml2ZS1zdHJlbmd0aC1hZHYgcHJvcGVydHkgdG8gdGhlIHBpbmN0
cmwtbXQ4MTkyCj4gZHQtYmluZGluZyB0byBhbGxvdyBmdXJ0aGVyIGRyaXZlIGN1cnJlbnQgYWRq
dXN0bWVudHMgZm9yIEkyQyBub2RlcyBvbgo+IE1UODE5Mi4gSXQgaXMgdGhlIHNhbWUgYXMgaW4g
bXQ4MTgzLXBpbmN0cmwuCj4gCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJh
ZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
