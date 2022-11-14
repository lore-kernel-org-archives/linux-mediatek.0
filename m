Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC892C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGwb5B/zvZPWksf5sCHhn9EJNTsb6ZId42Fj75sEWI4=; b=29r8iHeqkkiLXNwfMsjj0zgBgB
	eAiFryn5xxBCVJu6DNfewxwcAvN5omOVy5uOddqbjmNhm8A1saJcHhbRbmw7pZabRxIqNAlN0wtph
	r6nidjeE5hxYXC+Mzb4oLA8kIokl6Bz5SS59eooMpKzBt3HtIJxYlGRGCJxGdLVIqXbbteY5Uppf4
	+thb9RtfWTnvVJ9wYh3YNEUjGWzQHNrsrUne36BxaDOgfNVrdksU2jnlSIFg8qDqQ1IJT0Z3CI5YP
	DbE/XULNP04f+0ZIw7xeMPmyzvKvB23qOYVYXAPts05eKfgN9ZPkQk/BDxB5v9CgGGcHMOPSN1sbe
	YrQQL3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouY7Y-000czo-Ge; Mon, 14 Nov 2022 11:59:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouY78-000cnD-Is; Mon, 14 Nov 2022 11:59:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5800A660231C;
	Mon, 14 Nov 2022 11:58:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668427134;
	bh=7cfvQwecvCp1TEqF//QrQMv/w1uD2ZumJgbzfvJ4Xd8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S2LYLaqUAWRVibS90bE/PO8KElQdQQyWN98Ep/6TiwhwnmdlNZRKS2o4DrHQM9hLs
	 je9Tzxra63NpHp6dzV6tlawpt/17IJyJ8ZZlhjq0NREXHjy65pL99yHRqG1h13aKRo
	 f3NOJiQRv4B0kOLAcdkHXPdXELI+QbsXpjVSWxE1p/aQIa5Wum4KYdCd0FpTq9Z7jL
	 Zou8nZbGDEbL01UcWUbGmqX2c2roRsIxgxhcgHypWkObMMsBhsiUjjHYh5FtzReSvo
	 TAhT8EVGh0T71LI7hs7Hdzgpzjx6gZlGOYcGUE5lON9lqkRfAYvXsA15HLT/eWP6Vf
	 QXOZ69+UnaNxg==
Message-ID: <46c17d4b-d130-86a7-b5f8-73c30d7fdfdd@collabora.com>
Date: Mon, 14 Nov 2022 12:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] soc: mediatek: Add deprecated compatible to mmsys
Content-Language: en-US
To: matthias.bgg@kernel.org, matthias.bgg@gmail.com, nancy.lin@mediatek.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221111082912.14557-1-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221111082912.14557-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_035858_789126_3274801B 
X-CRM114-Status: UNSURE (   7.28  )
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

Il 11/11/22 09:29, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> For backward compatibility we add the deprecated compatible.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...And tested on MT8195 Cherry Chromebook.

Cheers,
Angelo

