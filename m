Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88314C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjiV4oMYPRviFe9GPeQKWxwx45uYQNCigeP9MktrmTk=; b=BptOr43mNjDsVJ
	vO9MzjDQGYIcdPgQQlN4j11iyLkhrlUavOaj1X7DysIFM0Jyz7Tsgzoton+8HFxqNho55ogRc2TjA
	KXYSVPIWOQ0tsqopgrjCxKuIL/adLOcVTPyj065Ff37t+4+rMQlbzeCQyn19wee4ZazfjVEo7qicu
	ydy/XkXkpFTHtTWGMqbigXWP09XepiwpDXe75Ktab4m5GzdYve365P56N0TOSvezDfPIdosnSzVzs
	46nC4U63yzw9i9tFX4Rgl8/LUsB3/gQsUniIhWyzyixlqBMWHNfCVEWQUAociynDBZsam1kVpoE/X
	bdALhcScsFU480x0fW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYnF-000bCB-GH; Thu, 03 Feb 2022 09:52:45 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYk3-000ZMv-LJ; Thu, 03 Feb 2022 09:49:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6559E1F4530B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881766;
 bh=Of7oXGSalY8GMvTSh6/0F56IhoQdOKeGHppjik8SJNQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kEZlArznpmpT7aiN9P7Hw67DevLiKyOcOOIu78W+UWP1gIZYXxN4HRRitanm70F5y
 Okb/QKnTQi1UA5wR75nauyGH+GfbNTYOyeTe6bdD87o/iJizacEXXfpFa6p6bGvKfw
 dtfB7ErsVHmXRzRtmnHHv/XBmYxlw7eBGswVKtMA7kEdgiD/A1Sq2HJnkdmkthieBI
 Ad2KB8uDPD04aS2dota4//vmSR6fXkq8aKAj/litMftsBcfQzOZfKjCAHDfNGt3+e0
 bLbbO9GU5kjo0dDwiENUDuilVCrXDKfcjeRhJxE0C8KLHM3cafwJzyA0GHnl8g5TDP
 m2r3TRwy/vOUA==
Message-ID: <7cbb238d-2cc3-9660-c229-3a2350992772@collabora.com>
Date: Thu, 3 Feb 2022 10:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 19/31] clk: mediatek: Add mtk_clk_simple_remove()
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-20-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-20-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_014927_885389_BB9E7C9F 
X-CRM114-Status: UNSURE (   9.17  )
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
> In commit c58cd0e40ffa ("clk: mediatek: Add mtk_clk_simple_probe() to
> simplify clock providers"), a generic probe function was added to
> simplify clk drivers that only needed to support clk gates. However due
> to the lack of unregister APIs, a corresponding remove function was not
> added.
> 
> Now that the unregister APIs have been implemented, add aforementioned
> remove function to make it complete.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
