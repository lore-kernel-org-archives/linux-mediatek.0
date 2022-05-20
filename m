Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CB1C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 08:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fFgFM8JcWTYecytI7vnGGezSscZunUPxTKm3LQGorQ0=; b=Yz59sLRyYtHyye
	ITIDPUFP2YzUXNU7ItNEyeTzv4zwvjk5VWrMf+alRbW49OkeVJezxa3KPzg+dtd+BmMPIM6g/bW0y
	n5kpe2pnaYbBG6f7hjiQXkGvgkaXbbh9Q91BRjJah/jDteopykfO3exirh/Qww/cfg2E4kdKi22GG
	QGJ3pd4m4aQS5KzZfdfTs3eRWoUrcoM5WDMgoA02RZLYZb9jVc9YaZBZunjjKupZinAXSxN7VyS8b
	9C5sYwee8hl/haZDq5MFfGYw0+siUFQH1rG1jaLJOyCLr+FRGoGOM8h7Ghj0MXss+pFOfkolkW+Iy
	WFWNrXfCZ2Tn5QDdzd6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nry3h-00BHs4-9E; Fri, 20 May 2022 08:32:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nry37-00BHWR-GC; Fri, 20 May 2022 08:31:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1C7681F46108
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653035512;
 bh=QRFxM5xnexzlS51zoP6W7RzQXPnornFvrWlpoug6lkM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=An3qIq16ZokHIpyt0U5J8hp8A37HfFC8qTPcSum+dVEkQWYWzWAi112LA7A18DTDV
 oKtn5ik1JNUz1RWNBQ6duQy9MzT7cuAj5zwwopbR+bGtsI8JE+9gvJ830z0yCDVJ60
 W873v4TsN8LHjxGefnFIx/sYKuEOBYnJ2lHF6Y34sqrEagrTT+T5jj+Gt1C053ricX
 QxfE6hcSdp69583+3ale3LG6eSPsMyhlvO98IThkVy8z01SZAZHVexp6D5vLAGw+hg
 PuDNWuPIbLQ5gklay2nAqpqZQ110h4n46KGkwRp38+CWHO2BFDd94Dmvhnho9XznOR
 6+6+dta7/ePkw==
Message-ID: <13f49bf1-6623-eea8-0563-466876db4eb3@collabora.com>
Date: Fri, 20 May 2022 10:31:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/6] clk: mediatek: gate: Export
 mtk_clk_register_gates_with_dev
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
 <20220519134728.456643-2-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220519134728.456643-2-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_013153_787085_13148A88 
X-CRM114-Status: UNSURE (   7.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 19/05/22 15:47, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> This allows it to be used in drivers built as modules.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Thumbs up!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
