Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC84C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vr8kyzGc58EgbmtYBXNNFkogvTVhiZ6IXXtx5CJi08Q=; b=Tf19z+QFjuA2Li
	j44sstUuihR0TwAsz6oYK8N2QJQ3x74YT+nhy5k5d0ESC+60ufPvj83s7hGrEjaqOqtX7jUdi/0fc
	ehTFS9/T63GoFbEipuufZcyctdwX0N9Tbd07A3lTNTvhnzap8lynjCAEVq3/IUj1zuFEfw+Hbeh7V
	KdUQuRZMpGMVgE6Cdnn3Nq2lWAbg5I+BkerNBL5MmgUrL5z/lnsRj9LVbJJy8lccsKUCI29lt9aPe
	o9NgFN7JLayuyBOW6xw8smxjzNGT7+sKY89IgAU4fkG5aAroSmlTV6k7Y6pKn2vZmcxOEscgD+64T
	4pwkpzht3ySjRiljvliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFZ29-000iH0-Oc; Thu, 03 Feb 2022 10:08:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYlr-000aUU-Km; Thu, 03 Feb 2022 09:51:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 047F81F45310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881878;
 bh=8BA8FbyMXCVWi9MgGTGjuCY6gVmGgcfHC25Y0eM01Z0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FsTzSneQrqvQeV4J11obzePF8SRKsS5pmNFQdXp7DVoxoTWMz0Y0C1snQXNQk3SIx
 sftfKT7mkLmyVEWRUAC0HN6fssKFQz1Rfo1yNj6pPAx83f33/2+IjjMzROJ7d1AlGk
 6DzAqpgIcq4kDOAwzO4pzYylIENjovSamQyf+/DRSjr7UrMOvP6oaJrYo9J25AUUML
 vjGSnFJ+T8ffFBT1US5EZ0QZOFjhad/z+7qkH/OQWUvlUScksZ6T/PGDs597SuyCg5
 Og+Y8mMLF4eS+DEp1TtqERIwEWFk1gqJFbMBYfKQJHHP3S7OxGjOoVs5YUOQdG/9wF
 xVybjj+bCKh2A==
Message-ID: <45e0ff88-c2bb-b546-9290-db9ff4c978d6@collabora.com>
Date: Thu, 3 Feb 2022 10:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 02/31] clk: mediatek: gate: Consolidate gate type clk
 related code
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015119_871143_8D55A9BA 
X-CRM114-Status: GOOD (  11.91  )
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
> Right now some bits of the gate type clk code are in clk-gate.[ch], but
> other bits are in clk-mtk.[ch]. This is different from the cpumux and
> mux type clks, for which all of the code are found in the same files.
> 
> Move the functions that register multiple clks from a given list,
> mtk_clk_register_gates_with_dev() and mtk_clk_register_gates(), to
> clk-gate.[ch] to consolidate all the code for the gate type clks.
> 
> This commit only moves code with minor whitespace fixups to correct
> the code style. Further improvements, such as internalizing various
> functions and structures will be done in later commits.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
