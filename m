Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65614C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jj2lht7pb541wT2odPgD35DJmimaN/w2/zcPQTHPO4g=; b=Fs5+N5Og2rXzhx
	NbzanJfSZQXdcZpmsaBQEo3XvAVJnAgEEYAlDfZwk8lVqfb44AiSF+vzAhOnXtTlyoy0id8ct5XYO
	beSeAOOJIR+hOgmlaBEMz6qplkg9SzhAUgMKCbGXKczWJ4GQGAUYZmAOQItYIRLAck2g1AYor3R70
	BGEPf4Rg4p+btaJWZIMEXPl1JhopBX9vZlWfi7CTPUH87M11aA8xqPRTvQ9k7iMGSaLCSN5Q1lA0f
	J150bz7I498ZXMv9apO4DwqTysmfboNwErpDvq7kEgUyaiyDvBnK2wn6mM6+oDHpTow6P1Aw+Vs/w
	eLHvkUo6QrEwSZJzTMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYn7-000b6e-Jy; Thu, 03 Feb 2022 09:52:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYk3-000ZMm-BG; Thu, 03 Feb 2022 09:49:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C764A1F45307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881766;
 bh=uXlE7ZgmZCPiQSZDSfYjZ//saRDp/ZdLtxVuwjRJSJA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CtFlxPYcpoKjtHove7Yb+rDAGLttgOlB6mjh3TmkVVSroXN/40MSFrlD41LL3XCWC
 F3FDebKHc7tXHGnaH6pQefXWGAJBrojavanmRs/hG7Q5Ybs8On/1rFxzIpe+ZXhpS4
 f9A3avD8j9+Ubqo3K3jVb0g4fGCmlhL+06lwbwnAqRfA0ws7v/C6h1b1/X0PADntiz
 d5D5hXl2KvU9mEQ6A0VDI73rQ9ezh0HeMmW03dZhYeM1my9BnJ7PzD8G/zli1DlFVa
 X8uEdnLr1CO13TkbWmY8e47o14A6S2RWP89TvIc6n6jtkLrM2oCYiHulm+pBjMxB83
 eflLXzIerSXdw==
Message-ID: <9b9a639b-aba2-74d3-62af-70812ced735c@collabora.com>
Date: Thu, 3 Feb 2022 10:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 21/31] clk: mediatek: cpumux: Implement error handling
 in register API
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-22-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-22-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_014927_605217_7A46ED35 
X-CRM114-Status: UNSURE (   9.36  )
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

Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> The cpumux clk type registration function does not stop or return errors
> if any clk failed to be registered, nor does it implement an error
> handling path. This may result in a partially working device if any
> step failed.
> 
> Make the register function return proper error codes, and bail out if
> errors occur. Proper cleanup, i.e. unregister any clks that were
> successfully registered, is done in the new error path.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
