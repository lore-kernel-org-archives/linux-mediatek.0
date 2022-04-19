Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFF0C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMAZVuqWSNPHbvWKCBMYYQ4ffXbJmZeoR3qIBKJ+y+4=; b=34SAWh3oqt4Tar
	IBp5BObO8BC6eDEq96z58bkBGwOF2xoyjvB+q005vDn2yKPXNWmd007qvx7wSgU6Nl58OwnaU762n
	zlC3epP8syYCKjD1eudckIbq5UK5av/P/VwR9+wpVbjogssAKEaHYy3cxCSrKXzrhC6xkjLBaq1V2
	HHsAuBjCSzbKzJIloQ2ahvQzFX5lwJVV0TDIT9jR0H2t6NvO8TB30vJBpIX0g7mO9WD7v/JRKlft5
	T+tp7f3Swadzz0XabwhbjOsKFZLE7ayUCglPM/kgUjVhubTWz5jBalVq6e5mwEqyXifqqwmGTfFYs
	y5dZqWywCNKuiKepG3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngpn8-004ewl-QQ; Tue, 19 Apr 2022 15:29:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngp7A-004NPl-QV; Tue, 19 Apr 2022 14:46:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F0FCF1F418EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650379558;
 bh=FVuKTUec4tBCzLgLqf1gROYOLTVYEwjYfzcNXIVZxLA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dg7kzEFRHsPSTzBwTQUmD6Owo+bMJHYmWIxU6FFgzIoaYG+NLZ1deDBXubLqBI4kh
 Nq9OlalmpgHIk01fCbDn6Ode2D13fDxy3w9rdbRl78lf0yvXRVpwSqZb9W5yeiH7Vr
 TDKLMiPCWb0ZgWNs1kzaUv40MZbacg/a6VA9lO+wgm+cHOcg8P2DspuZ/MmLogKDrL
 RbiwMJkmfn9GdZ6Yn8KzbbXUo23ABKHi7EBfmAgil2+/cPlsJzSXmYk+UU5MV32Zjw
 PmxR0Bgp3KLlGD3V7qXwGngXqqFMop+r4cpQU7d5EtH3/qZNacGr1hmBjnSYnnT3B3
 qjCNxSo3pfLlA==
Message-ID: <3b622166-6d03-0e8c-8812-47e9fae6e374@collabora.com>
Date: Tue, 19 Apr 2022 16:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 1/7] clk: mediatek: Make mtk_clk_register_composite()
 static
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220419081246.2546159-1-wenst@chromium.org>
 <20220419081246.2546159-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220419081246.2546159-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_074601_124111_7CBB638B 
X-CRM114-Status: GOOD (  10.40  )
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

Il 19/04/22 10:12, Chen-Yu Tsai ha scritto:
> mtk_clk_register_composite() is not used anywhere outside of the file it
> is defined.
> 
> Make it static.
> 
> Fixes: 9741b1a68035 ("clk: mediatek: Add initial common clock support for Mediatek SoCs.")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Hello Chen-Yu,
I think that you should send this patch separately from the rest, as this is
just a simple cleanup that is totally unrelated to the more important conversion
that you're doing in this series.

By the way, for this one, feel free to take my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
