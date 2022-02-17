Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B180C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPRo4FK3PW17vF4wqq9gvDoPCVL+MEAFdytKG1wTPkU=; b=maDK65bO0v4a6+
	1DrdXxXMPhqZzHEfLTYqE6lEdLdsnX4g1YOkIA8E/1Pldg8a5gLMajMQ/I0OU5yZ1quYvn3gTdn8n
	5dtyWTUfZzDvknaXJorWM6h5Ew7ZNre6ViZ8z/YSAfgY2hEMBqvLSiiQz4LPfub77UbALptxwHlDf
	fAMvOmUhljmo//h/ox7R5Sk3UU9lQCfCw5dgoKbcZDCGRxLqSwt5MAdCwdPdjPSnoaEvNiCMukw25
	PiNCXs8+b3HPJeuRhUJru30jUd2Y2TId9euHuMZwXwt3bpOiGRum7emOXeCXu7WB96RwkO7T5nl8h
	1TnZiosHhaxIgJH6Kx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKncD-00CCKM-PI; Thu, 17 Feb 2022 20:43:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnPK-00C5vv-8X; Thu, 17 Feb 2022 20:29:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 32FEDCE303D;
 Thu, 17 Feb 2022 20:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83414C340E8;
 Thu, 17 Feb 2022 20:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129778;
 bh=e7gXUqdQaMp2/D5J/MXBJFTUdTqleGN92ISGm8B0VUg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=jl508gxbGjOBw2Nelk0XLCiVUqH1WDwttZn9GycQ9F/XiH6HxYuRbiFH2s2l+P79I
 34vk647I7MWDtyWdCx9xoRFwndeeBgNPGETuMNzZSwMy7GsuOl+LRIEGCth1gMfR3H
 yy5j5KPwImwXLHvNIwMBLcGhEsI/WU46q4HBCnwMawXAvF+hRHIrjsueEXCwpIP5Mi
 +GlR01yGeLJQzSkBdHZ2y1fhvClG/cG4oecAbAvisfjYuK1WIj8wGNQzPAGVeE9pEk
 C4ZtDzjG2wYwWTdIih9om/PHnp/rWO6Tehqq3iP7IRLaFq2LcpyPGxJj/jS1f55iL3
 omsR62w3U277g==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-30-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-30-wenst@chromium.org>
Subject: Re: [PATCH v3 29/31] clk: mediatek: mt8195: Implement error handling
 in probe functions
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 17 Feb 2022 12:29:36 -0800
User-Agent: alot/0.10
Message-Id: <20220217202938.83414C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122942_506701_0E08490E 
X-CRM114-Status: GOOD (  10.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chen-Yu Tsai (2022-02-08 04:40:32)
> Until now the mediatek clk driver library did not have any way to
> unregister clks, and so all drivers did not do proper cleanup in
> their error paths.
> 
> Now that the library does have APIs to unregister clks, use them
> in the error path of the probe functions for the mt8195 clk drivers
> to do proper cleanup.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
