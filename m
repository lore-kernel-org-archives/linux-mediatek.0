Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23276C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lsg3cGH4xyPMmWpji4YGsAVCLflddF8SbE22FFQNzzs=; b=x/6mQ4u/HVj8po
	s1OZy3oxpX4dhkyqP7UEzi0yQBCB+Syngne924F3DtdgWP13ouE/AB7VSaf4ECbk7EUVbcOPO/E+p
	BUAteYu1rD+W0f4eo7VKxgD+VnHyqW/wpkNhW9n00CvaW3HfpGPLtjAKzfhR4KP1OSQAr8t5C+q+O
	FHgfJ+i4HVKQPLjM7IsJObUtKDpZnbtCw095HmOX+C4GvtfZwLV3UvZTJEdM3YjnEabssgR5OaLNF
	rolJlgxJ/QTgrtdlwNAVLmYRr98RT0HnGOd7YYr87ZPfxkXTaNJjykeKfDqEzr2sOcAOB3YfxwuEB
	yyuByJJbKELoaRmWSdUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndrjo-008Y7L-3G; Mon, 11 Apr 2022 10:57:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndrjQ-008Xx0-6i; Mon, 11 Apr 2022 10:57:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8A5AEB811A6;
 Mon, 11 Apr 2022 10:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B779CC385A5;
 Mon, 11 Apr 2022 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649674633;
 bh=ZNQVA/M8Q2O7+k/ddbWMeIkFCGFecU+Sa8c0sLoBaAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nXOHAhexHw0CA4I5ggGKFryk6/ao7dG4ZLiHhZUGsjLOFPH65nQsFhtsWlaZQ9N1q
 WuRSVdS/MFeGJzAyO1gbqOHKaImysX/uZBwN8rrMAWbIlDaJRDzBjOmLhlsRoJfjYH
 Lf7gB3Ml4gny8dsYqavXcd3AlCBwQkdxTSNr7YeyS8ZtFj39FW34sp22W8nwUxT/eE
 1erogll5b/M96OwKYByOPn+bqPhaDC5y+N0hYWS6ySXfE82+7UB7CPRpf0YXgcnsZP
 e3/qMQgvUvtS5KrP7k/OVmd/WklzWehUoUbu/S7cWgTMiQYTbnf6MaXQdCQZVuDJ8x
 NL/hFlcPUgLaw==
Date: Mon, 11 Apr 2022 16:27:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 0/3] dmaengine: Use platform_get_irq*() variants to
 fetch IRQ's
Message-ID: <YlQJhSH8YCcqJ+A2@matsya>
References: <20220404155557.27316-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220404155557.27316-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_035716_431494_E7A8AFAC 
X-CRM114-Status: GOOD (  11.08  )
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

On 04-04-22, 16:55, Lad Prabhakar wrote:
> Hi All,
> 
> This patch series aims to drop using platform_get_resource() for IRQ types
> in preparation for removal of static setup of IRQ resource from DT core
> code.
> 
> Dropping usage of platform_get_resource() was agreed based on
> the discussion [0].

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
