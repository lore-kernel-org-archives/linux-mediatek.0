Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7090C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 09:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cuuLaPO18WcO9O3UJvo7bAmBoQpt8l1ul6YZ7HfQ+uY=; b=sqiewgzCNFTUsu
	i8KJ+XeXrWgAIS7Zi7EOA6e0lpIL+3ZBKGPJU57zcYJX9jCJZQe4roUOYXt5BmNI8vG91mF2ZDJhv
	jPNCMP6BewqMULSMsYpXErtRmlUv98YQoLq/7fdXxwu1fqSzIViFxzufAsvDQq8Cu29uflJg3an8A
	RpA+ieyZKvTTK8nD4OHlu+kbtjkTUkCgmkZu9kCPhFA7oo6rBJZ2MmSMzzZWlItDaXJ3BywyR9sI2
	6EJbVwHPlKRMsjvWaZNbX1454Jv/7KD8N1bvXtN/vKdwekMszvhTWhqpQwOJdFNIZ7IlhdiCSXeUg
	D2SsZqtTAyz/i/r06jhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntQzM-007Rkf-3H; Tue, 24 May 2022 09:38:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntQz8-007Rej-ET; Tue, 24 May 2022 09:37:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B48671F42BE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653385069;
 bh=qHa34R8f2dgn0S0aTujwYgvn8k0a6Ednt5C8zaOJtHE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rbi97nHhxIbIYR01ryXjkpEsOOYmYxRBjOpv8gBgFlqcAJNu0iYeUXjUlBgvOSBDz
 JMUDqtYfaufxibthmP3yLbdrJzcVBz42ptkJQlmcHoAKRmT36SKicme1prIYCDawEw
 +QUBsNagovSXHlgBBScMriv3mnO1BNY7Dpll16KhY6L4L+knJtiNfgQ7MxkyGLKYhZ
 5aazG1w7cSwCbc5MQg/FCrM2LorBLSe5BSW4z7ifVn3nxJh0wXzTyuLsU0FUwO9In7
 qm6zVx/6yuc5vbhDtOatD2QmT36VRa3JXjYXVTNimA6oRtFjpIE7A1QxoHr3gDjyjP
 lubz0MjIud3Og==
Message-ID: <911c729a-b9dc-056a-7c83-718ddb52db95@collabora.com>
Date: Tue, 24 May 2022 11:37:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 7/7] clk: mediatek: mt8192: add mtk_clk_simple_remove
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220524083843.9994-1-miles.chen@mediatek.com>
 <20220524083843.9994-8-miles.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220524083843.9994-8-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_023750_666268_AC6F868F 
X-CRM114-Status: UNSURE (   7.61  )
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

Il 24/05/22 10:38, Miles Chen ha scritto:
> mt8192 is already using mtk_clk_simple_probe,
> but not mtk_clk_simple_remove.
> 
> Let's add mtk_clk_simple_remove for mt8192.
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

[For test on MT8192 Asurada Spherion]
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
