Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA73E95A9A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 08:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeu3+6BwvCdX65Hv/9kapjKnYBDiUYSoLUSd89cYlJQ=; b=KsHoTYg5AkmubAF5qXIuf1tHRt
	sCWE5FfKzo535kJhtyagFWMewnUuh7E0KrC7L9cMP83C3iHogEIeRdZoy+B/B95vnMYXQkSIzj0TN
	IRARCoTSKouH7zr8YGVeDkD5D8mfiiJ2yamcfRgVayJzPzyFaDRvoDFxQLzpa1gpq2k2chiQ6nHH/
	neKi+zcirwm4mpwDcTb9wcvttxwVh4XtQGXQLM/X1Y8FBIqdDO3ZWlqEY/SO7Z7WoorS0XHNHFxF7
	t4Ik7CWi7EJTdMDU+v50UbmcwtLL3iXv4emcKluJjGFB7qlZUv9qUYKQ3ANrtHBvjmuaIh6nrwJrS
	3GDH7oZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qplzK-00A1Ay-2t;
	Mon, 09 Oct 2023 08:51:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qplzA-00A0zP-28;
	Mon, 09 Oct 2023 08:51:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6DA5366071A0;
	Mon,  9 Oct 2023 09:51:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696841485;
	bh=jVa5JJsIbd+rahqR791/qfoLZyjPB6foWAxVg7HpF4Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d9GAwpGy1eJgl1FB0lX80aRoFnxkbYksVn/r3F1yA+ms6jfgwAvql7A7GKhH2WYER
	 9V2U0IcVwCX6VQ7/5CoDDpe0Pa5ELNiivAILkwGboSQ1eACY728vy+83J8eN/l0f5y
	 65QuLsuIasNdehhJagG5lMUZH7yzReH2mnC8/KkTG0mTlQxntDoxer2Y3cAA2M27MA
	 DZDmZfeQG8uvnX9fqKL+/uNqi/EEESo00MNgeEtwBIUFJgwqsTtrWp/Bhj9NajsPip
	 dQ7XlJLz1fnitxnnLIawJwXndTPQZRjspqz9sRauhJbnDbGZAin/uKb6b6V4d1iKDo
	 V//5RC1YpI6ng==
Message-ID: <83998d0d-057f-191e-fd91-263f3c1eb2a7@collabora.com>
Date: Mon, 9 Oct 2023 10:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 4/8] ASoC: mt8173-rt5650-rt5514: Drop unused includes
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
 <20231006-descriptors-asoc-mediatek-v1-4-07fe79f337f5@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-4-07fe79f337f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_015132_843526_A65D5B98 
X-CRM114-Status: UNSURE (   9.84  )
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

Il 06/10/23 15:46, Linus Walleij ha scritto:
> This driver includes the legacy GPIO header <linux/gpio.h> and
> <linux/of_gpio.h> but does not use any symbols from either of
> them so drop the includes.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


