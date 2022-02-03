Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC0DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7x188X5Mw3NLHsTEj6EKTCsX9nFHCgXm3MCV60jUVAQ=; b=ZB5enRCL5DO0MB
	2+7UBRkF/ZjB/WJ8uelDcxelXCFbd4pk/4vXs9E9TpP6Y4MZC48u0AjyV4VKZ1VOVktF9DURaVQxV
	290oTMjnDTSktdP2jEfWSpCahKlraGuH8lNpU9MuHpHrTry+2vZHuGM0jkaOaSoLC8mtwwWjTt+N6
	8PKkbPPNvGeHCXFYIWeK43jkkIMqEi0YCMNsFIIsUOqDwhK9IBwf68l5JKNpbc4Fbw/z2nSnX8iQ3
	UJS7wzPmKVglTAmuvmE5sCOUVXrF5h4CLhgitB6Oi4fZrrnhvfYn4tC7mRRd/i5yz51NNKNi0eaSe
	P4bVtbclBd+ewA5G+yYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYzo-000hBz-6G; Thu, 03 Feb 2022 10:05:44 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYlg-000aNh-S1; Thu, 03 Feb 2022 09:51:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id ED5681F45311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881867;
 bh=Ng6BX49JV9c3BZn7jU/h+TPKiJrrjsEs4Yh+faXunQM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Thobw6v5uR2WlURFKu10eIE4gZB50/TDNdX7/SKRq5t2XylM8CyxZOHe/v/k0Ujl5
 +Lk8RKt6/1mPkwuDeFLYTke3+thRvr0GrBYfgVfVrcY2uA1oenvO013dNnCmXiIEA5
 4Cmg6BzWOqWk/o1fUNEiX7zxqigmx1nbLyenylf0IQJMPYCQIbw3ZNUPf6QH9OvySx
 Wn05c4SqHEpPoNhbN+PUX6Gs2Fip3Hvc5dKeaV60rBrC/eYkQOQy9zKylqqJXI7gM6
 tFH2PI7lA2zxL/jGc7t0BSAn8AkBFGLMefsxdJGd/Vne9JJfio1TUx3W75OR+O2Ezw
 aAhIK/8Pqrz1Q==
Message-ID: <8e4163ae-368c-592d-e1c7-83e0649a6140@collabora.com>
Date: Thu, 3 Feb 2022 10:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 03/31] clk: mediatek: gate: Internalize clk
 implementation
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-4-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015109_135312_8A297AFE 
X-CRM114-Status: UNSURE (   9.35  )
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
> struct mtk_clk_gate and mtk_clk_register_gate() are not used outside of
> the gate clk library. Only the API that handles a list of clks is used
> by the individual platform clk drivers.
> 
> Internalize the parts that aren't used outside of the implementation.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
