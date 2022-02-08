Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0832CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 13:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTzSv841rvwhYU7+w5TX/1ekELHiMEvgczqWLtdGRKg=; b=Ya4GgMBqYN6apG
	GQzpjZH/CXBw/Ybejp8ZjeTGsJapBUsTcc3uJr43L0QKIc0K7HMcCCR32/40aImccvEdYO/m2Hzp5
	JOeRXdn2x7mbFhKYzzgDAzMsRnWVS1J2S8vhYZwzIr4LEfzLinMy4opqdvyIXgkxYoVZpjwfYbisj
	OGCWhk+YiCASnIEVBHkW4uGRzgJfJhddHcPnFC0HUGm9POvKJNToYRZD2+jdxQa9cdlqkFtQhpxRv
	SES9fADZEsRHLhqZ/pNOT9UxJ0ZY+zk/5l4+WXpGRtWd3xkeTtYzVM9/MJGyEpPeObRjDwN9iDTtN
	qGfcO4CAixm8xYrslpLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQZK-00E7E3-EQ; Tue, 08 Feb 2022 13:30:06 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHQSk-00E4qk-3j; Tue, 08 Feb 2022 13:23:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 43D0A1F44D84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644326596;
 bh=opnGxqDeIEOnpsQ9yljfEaIzlBoUQF7+NaaOcrN86+I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=acb0aGkWrQQZ5J9X3qtgqhR7z8pxVBAyIlkxi0kNlQ4AqHuD9Ht60kwZv1N1bySoI
 DUBj8oVN+SusfB6BDvEAunM8bdsB7yoGRsew/LtI4aruBSMoFM2xVchuiacg/3Ga6g
 X1+L0h9c2u8QAO90mmhnxHAqVPoqu7PHYMmK7XIAnhF/1re14l+Tbeisx+zK47vlv1
 BWrIY31g0ymL5lyb9xzS6iBhFAuxKiGeFC5hLYsdCuzKDrblc4EU3xPAJ2/4ilZqow
 PVJ8toTPWQrqbPzAyjB8zvqLuVDykY/Zhbn5xOzQSO22Zu/jNzh7Xy2F1UNYCBe3bB
 crlTFxHqhMYag==
Message-ID: <4d889428-6e11-5df2-3c0a-8f4f60a9b580@collabora.com>
Date: Tue, 8 Feb 2022 14:23:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 28/31] clk: mediatek: mt8195: Hook up
 mtk_clk_simple_remove()
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-29-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220208124034.414635-29-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_052318_341477_B1CD08C6 
X-CRM114-Status: UNSURE (   8.91  )
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

Il 08/02/22 13:40, Chen-Yu Tsai ha scritto:
> Various small clock controllers only have clock gates, and utilize
> mtk_clk_simple_probe() as their driver probe function.
> 
> Now that we have a matching remove function, hook it up for the relevant
> drivers. This was done with the following command:
> 
> sed -i -e '/mtk_clk_simple_probe/a \
>          .remove = mtk_clk_simple_remove,' drivers/clk/mediatek/clk-mt8195-*.c
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
