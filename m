Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0EBC46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrP0XvZ6N3hI1TBEc9rwseAjjzXuH4K02UQxHvBGF8s=; b=SkmNPDI26BGnV6JCkXOQ1VbpfG
	lB1mBw9stCTUcRKUKfJowrzGPd1IMU8QmnHYlLKiQ464Iq2LNriNA7EIvSh82QGSdjJ/3LDYZ2aBa
	vuEXlRzhPlzl1EOHRMgO+Q9AOoExbO+4+euYpMZdtUyg74SPCRczldrF6DjYYaGVOG193ZsltX6kB
	u6vsqSuYQjYFiBAIqRZWS++qPAUKG9RI6qtb4iKRJuUStrO717kEaE3/7L3pKRVI7W/74F1wVL8wB
	UinYwbiyYJ8xxF4RlQ14N2SGTlBCd1yAmtsEPwBMEw+b3iL33Qvo1yiq9zhIc0JMv7Suvl4pgHwaW
	DM75bn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9bp-00EqFa-3D;
	Mon, 18 Sep 2023 08:27:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9bl-00EqEg-2z;
	Mon, 18 Sep 2023 08:27:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0FBA066072F2;
	Mon, 18 Sep 2023 09:27:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695025670;
	bh=q/RnJBMS2Bz4pnBRsyhr6AWWkU5fbRLwj6dY2Bv2yJ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ckplOVZBWtmlF6AlYh711gtncHl8omA0WfIROZXv1zTmLyRfS7OCcC7Jg7tRHp1ls
	 TofKCZZYZKOZMMe97UmjvxcUxA7/tLUk9wtOWRgiaILyqDeRwa5yUAFzOvfSL5qfRI
	 QEZQlKkIuoGJ3EBqFwT7cXGswWtaAXWzzSNLejr7sdEGK5rCbpyFJDxyKHlrwJj0F1
	 a2tFQ5YGVOuM7NyLmA7CfOqVxnJ3RaNnOPoR+k8+krJl6urqU3wHhhLehm76WN1q7F
	 NI/XdpDD2VVPJXMTb/eChBEE2b6MQiDPtr7LXSOJb/qkzX1idE/gqcHiqZTD4seIi8
	 fwgJ+BgXjamsg==
Message-ID: <77d5d2d2-5939-e43c-9f1c-d115274ad1ef@collabora.com>
Date: Mon, 18 Sep 2023 10:27:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] leds: mt6370: Annotate struct mt6370_priv with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alice Chen <alice_chen@richtek.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 ChiYuan Huang <cy_huang@richtek.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
 kernel test robot <lkp@intel.com>, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201051.never.429-kees@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230915201051.never.429-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_012754_130473_06FE1F02 
X-CRM114-Status: UNSURE (   9.88  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/09/23 22:10, Kees Cook ha scritto:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct mt6370_priv.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Alice Chen <alice_chen@richtek.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: ChiYuan Huang <cy_huang@richtek.com>
> Cc: ChiaEn Wu <chiaen_wu@richtek.com>
> Cc: kernel test robot <lkp@intel.com>
> Cc: linux-leds@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



