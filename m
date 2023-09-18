Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8B2CD13D1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27jMKhFWq5ruOOkWx1y1/gOso/Zj65Hopy8kp0wRAy8=; b=gwUmyp45krftRV2ouJe3hh2205
	urMgPcsk1lm4AnBOIgcc5bkZtMEbd9XuLPwM6NVAoUUveFCX7lPNukxavWP0qTKb86vGbqUE2Q6zb
	TN93vVnXYNRPaIkwXYqEOKlYeQCWWpCrGpSbPWEXoka9i7t5Ko+xcToT/q8L+LAP/9YnXJmCKlnk4
	3+dtzbH4WN3YQUGjP9ATu5jaz7gCWXq5xeCS7+EkEEJXrmdK5JvVXSPqhHzE1KvxciArLEsqsm68w
	vak+CYbKSLp9MuJ4KM/oIQWPpdnWeVR00KfGL2QhWGaG7DMf412T3yghC26VfTlAScbCRallsVMez
	ZMwZ7VuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9bq-00EqFk-10;
	Mon, 18 Sep 2023 08:27:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9bl-00EqEf-2v;
	Mon, 18 Sep 2023 08:27:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CD4F266072EE;
	Mon, 18 Sep 2023 09:27:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695025669;
	bh=0xZU9+BT1Lhziqj2peG186RnTVEcjM4RamFlwc9caGc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MCpXWpONy0BtkabzIDxKDZdBpclb4KkEO/vjdiqSRSgOHkRqs5VNUf+0IHZZbqH0M
	 /ThenAX6gk3cHjl8PWjJi5TIhQ079I4XgooYj4242puGEmZxRvwUmWhHZFE5AmJpXr
	 ORZtBymDne4IYqhlQ1R/QdHE2t9Qit3dqRD439i4wlJBAaQlKb1zLcxp39+PckL9YB
	 nu94/qKIEKzqSCn9Zm41J7txDh35e7GHSSVVn/g8k1VBoiJz/3ZGD2dUffJGlf9w51
	 JLkn7z1KFZppAxaC/KIp9MGLZ1MjWHILB5YhduiOD1DFe1dAAdyqZUv8QLvf/+TRvy
	 8Tlz+R9eNyBJQ==
Message-ID: <c2664bc3-d932-8340-b0f6-8fb1f1604464@collabora.com>
Date: Mon, 18 Sep 2023 10:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] leds: mt6360: Annotate struct mt6360_priv with
 __counted_by
To: Kees Cook <keescook@chromium.org>, Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene_chen@richtek.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201020.never.433-kees@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230915201020.never.433-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_012754_130784_62594320 
X-CRM114-Status: UNSURE (   9.39  )
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
> As found with Coccinelle[1], add __counted_by for struct mt6360_priv.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Gene Chen <gene_chen@richtek.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: linux-leds@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


