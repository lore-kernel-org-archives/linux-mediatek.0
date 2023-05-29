Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F92C7EE29
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 08:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXOvvQmFVQRAVVe/8ka4njSnA6mx+bXYCUdIr5pkYvY=; b=J4BuJ2y+1Ii5jN
	4kYmrSj7mlS6nLD7pxwIjY2gm/2ma/NQjv0Dg7Sr8c9TlFvw85347Y7UGGZHI68XvXU27rlNZvcIz
	CEUYiLinR+aI3Asq3ZBE1otomvhQXgmcwENaPTacW4qVhOn0XJ56gLvE15BKwFpqOWy2aWoM421T2
	ivsvqUA+BYeyIo+aMd0bbyPAeto9sbAE0K23X1j9QNrvQ0tv4SpHDoQkkUjZQRF5C83PGprPLigSe
	8od+svwACLoO+rP5HXW2zIZAm+YZYk1hLZuWsdJoelga//pqD5uGUq/B1M71jt2nkkc14h3GoeICI
	lNpohi9IXXfKs3jSRrVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Xu4-009fjH-0w;
	Mon, 29 May 2023 08:06:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Xu0-009fiO-1j;
	Mon, 29 May 2023 08:06:54 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7C48E6605961;
	Mon, 29 May 2023 09:06:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685347611;
	bh=v2GRVQsX6vUBhhSCAfCqx8p4bua6KbUrCIbagxRlt9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lzqdZiBcZ1UJsdSZ1VMAanlxCw+qUvn0AUsoe7y6ciE3CPoOHH0PXE3boL85ZHDZQ
	 1mEZ4mqGeAnA2Uk1QU2fonFGMihEs9S4ery53LZI76qB1OY5HoPA8dzQsJAI8jO1ju
	 lhyBCjxSvLj0JM9epRQSHuN2e7Xc4fhjaH7Ak61YBXjAYMwA1Zmh4WyQyEs6rhQKmx
	 TcdRruoTQBwTbiqP1ykCOyblpBaA14AMRk6YmXTTHlpXCSXvyhhu6eyMd+SC+mASXq
	 cFXCIhTWcLpLCvTLRrricflxRuUSsC2xLXmHwfm5xpshohEI6yoQ3btfOsy49OW8mZ
	 kGvHq0BM3r1hg==
Message-ID: <f6617221-33d1-915d-6daf-0bf73b22758e@collabora.com>
Date: Mon, 29 May 2023 10:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] arm64: dts: mt7986: use size of reserved partition for
 bl2
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230528113343.7649-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230528113343.7649-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_010652_707246_A2270429 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/05/23 13:33, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> To store uncompressed bl2 more space is required than partition is
> actually defined.
> 
> There is currently no known usage of this reserved partition.
> Openwrt uses same partition layout.
> 
> We added same change to u-boot with commit d7bb1099 [1].
> 
> [1] https://source.denx.de/u-boot/u-boot/-/commit/d7bb109900c1ca754a0198b9afb50e3161ffc21e
> 
> Cc: stable@vger.kernel.org
> Fixes: 8e01fb15b815 ("arm64: dts: mt7986: add Bananapi R3")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Since you're not changing the start address for the first partition, but
only extending it, this will not break anything, so

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



