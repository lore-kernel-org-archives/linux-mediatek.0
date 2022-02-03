Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FF1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2USY+cfdlbfRTty2d/J2Z/zQ8DJ6i7bxMLmF3qkPLK0=; b=3+bwmMYNivrDad
	vxPFjRkE7TqkeBl0K5vSlfKsO8iWRvdx4PiEGYFq1zGsWNNVgD+mddWbnv0j018scLv1vJBqnEeMc
	tvfRpTe5hwiD+y7EinSf94nFrDZObCpiEXDod5SUyuBeFBoXdjCLOKKfYbiO4PQCZzuTkXwVSe8b+
	smIyZERUlZPfJaTLbpxNaL8f/xlZqIMMvJTTN1q3AA5ZJWogMegjCfUVQLKzF/rN95O5t/hhD+ZcB
	zfTQ+fjNYGifzjHOiuO398122wfPXPqBA14pETaya3/M15nfwnAHz2v7Y4cP7HepTmlsov7VMg2PT
	qq1+clsrR7d6D0MQfnUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYjc-000Z52-Ng; Thu, 03 Feb 2022 09:49:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYiI-000YGy-KC; Thu, 03 Feb 2022 09:47:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DA3221F45305
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881657;
 bh=JwV0A7bKfw2t49I+q52URU9G7qRHadOUm5Qr7PbD0Gk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d1UzUIZvHUO59Gd/9Jqnj9c4N0bc3XXx/fnTcvlluuX743InESwIVwHI0WkfJcJLq
 rwxiksuHSDqcn79L6PuxK7t3GmbqMl+vuNID+A3MF/Hd55hlQp95sn+eoPRCXs1RkP
 EsaHTnlE0AaJkl9H0TrvZVTU4yFdEX+JgQwBSHgisBTaqXOVJLmoKRr6jc1f4WKvCh
 K+RXKJNspFSx0uhbPxbo4xj7Z4tNgLWNdC6YBaoPhUHjDd4T4r2Pt4so+G21rX5LgL
 p9QbTj9q/BxWBDHKSRig7k1KVXcf1DTbrhdElGGLMzr6ke1hM+uAEcth4xwfJcRfMo
 mrB5VuJzapRDA==
Message-ID: <ae5874a7-aa2f-e738-1d2d-884011d824b2@collabora.com>
Date: Thu, 3 Feb 2022 10:47:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 25/31] clk: mediatek: pll: Implement error handling in
 register API
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-26-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-26-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_014738_847513_1397BFAF 
X-CRM114-Status: UNSURE (   9.26  )
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
> The pll clk type registration function does not stop or return errors
> if any clk failed to be registered, nor does it implement an error
> handling path. This may result in a partially working device if any
> step failed.
> 
> Make the register function return proper error codes, and bail out if
> errors occur. Proper cleanup, i.e. unregister any clks that were
> successfully registered, and unmap the I/O space, is done in the new
> error path.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
