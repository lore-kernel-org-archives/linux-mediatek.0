Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648BFC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WauxWS+UFNRuX8QrRlVVfNokiQNA9AOaCZ9qssd3Ccc=; b=SM+btWIvnpU6Dp
	mt/36UDAkGF+1oNa8YPiCaNp2E3KU38uU2xP9b1TtcpSPXlcLw8aB7DootJgDAqB+ykYTg66wWBUV
	z/emlHkek57XRqVQoT5O5cil/SNlKgOnkYg5wyRxqRpGeRYTiMLzsnlUxUCxlJhMRbewMzmHNC9rr
	o++Mv6nalSxh0cGGHjXLyhHY8k5rtUFKh0JLlkha4SEFa64vOVnNxOwV/HVv3MSARaoCxSkA1xECV
	94PVakY4LAyoLAyiB813YetKJ/yHrVhfAaLttu+jVa0ZxWAZgquOuHZ8oKlbtBPHrMH91PGFd74n5
	giY4p9j7iH9zeHA6R5CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYiI-000YHX-Tc; Thu, 03 Feb 2022 09:47:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYi4-000YAo-Ni; Thu, 03 Feb 2022 09:47:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CADE31F45303
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881640;
 bh=m9MLBN9ORSXZfgMj3WYcXMzwHzNPjhfv/4IsqIC0ZKg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TU8k5MweW/rmmZ4AJ/RMc/xNtSSVnI149PAhIv8E7YoKVgTbdoKBOp0rZK2nHAHJh
 FL2XXwdcr2sWEs2wrEHlx8RQZ6el4oup13GC0k0v60CpZoOI6/3IspPbsRFEr3u0bG
 Chgs5miwBnMOBHo8Mok4PlwIyuhEEL8DrPa8LhKE11N0Vo2tsc3H95fUZFoaW4BXzP
 ZxB9zcGDLsWahz8fh4qttFfkOwaufzT6YE2WsRWLxJOkfXDrKnoZsqVLzdPRRWpMBc
 vZmb7EUtKIGi/cadxMyySIwRw4+aX7xewg7JJMMD/WXYWJZLk/t7E6folq/0HMNakR
 VR+hm6xVsMNDg==
Message-ID: <752d5d00-4e05-1bd6-564f-3bce21a35713@collabora.com>
Date: Thu, 3 Feb 2022 10:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 15/31] clk: mediatek: Implement
 mtk_clk_unregister_fixed_clks() API
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-16-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-16-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_014724_936310_8DF9733B 
X-CRM114-Status: GOOD (  11.04  )
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
> mtk_clk_register_fixed_clks(), as the name suggests, is used to register
> a given list of fixed rate clks. However it is lacking a counterpart
> unregister API.
> 
> Implement said unregister API so that the various clock platform drivers
> can utilize it to do proper unregistration, cleanup and removal.
> 
> In the header file, the register function's declaration is also
> reformatted to fit code style guidelines.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Hello Chen-Yu,

I like this entire series, but I had to manually apply this patch (and some of
the other ones)...

Especially for the ones that will be touching MT8195 clock drivers, can you
please rebase over series [1] by Chun-Jie?

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=603955

Thanks,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
