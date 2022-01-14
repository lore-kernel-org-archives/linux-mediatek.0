Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083FBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 02:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+A6HTzmkPLtLz50VwgqqPB36HGRGEf1LxEX6llWy+Hg=; b=uPHElYBhRBDDVG
	NOKEJefvsz7m5OTE6jrXXcFuEUXI71sA1R1gd0ESt9bE3KyidLowvCD9jeXYPVkFDxLLOUxNvVfeE
	A/+5sepgLsNWCf/V1XMZH6qXJdwi/Z/6KaYlFzWnUxHYpFgoXC0CaSZLC8m4IRmNnFxq6VYVGbgm6
	451hIAFNKLFhyt2h1HuAWD1dYrV2c3tRCOOwxjjbfsIrbYTHfj1vemjWNOGiwpTZZ7huzLd9c3zgB
	xzhiNSsb7oo7LrcpU4rab0/O+6lDx2VBkRUqOr/9sFeZnDHI99tBhoPxCiXtA9oX6Ps9wkXWFKGrb
	pAS11QC+DL8arOWKWNeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8C48-007TD8-WC; Fri, 14 Jan 2022 02:11:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8C3w-007TAo-GA; Fri, 14 Jan 2022 02:11:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF24B61DBE;
 Fri, 14 Jan 2022 02:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7C9C36AEA;
 Fri, 14 Jan 2022 02:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642126291;
 bh=ECoPZQ03l/tvX2xKpinnD5nyg0Av0Lc/GL7f/7msvYk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Euny0s5w8MF1IOzDdgvDtws8Pqxq9Z9km2iYH35+JIrxBIUoP+QgWU55BTQzdOIGR
 k1CG+9aFwEEMfNNBlHiRdXNr24G4aDyHWlpzkch9fsJPJQDI3ByeLYoazcYCKwITOe
 IxhMBZ7K0gg7AEBtuCQIauqreeSahazQMCflyrxMA3HA0Ysum8I6i9oEKzezKtAL6t
 Pt0GSvKpd1VfUc79MrjpibfgbL4OQTykQgJqYuno/ngUwxMtDbHARE/nDAB8Ck8p8Z
 bih9D+qOukKhZTmuxrygKndFVT6rSIpZekXHYYCQafvj8NXHlUxdr0yKwxCWtUyE7l
 Q7/PG/CobVryQ==
MIME-Version: 1.0
In-Reply-To: <20220110171000.24316-4-miles.chen@mediatek.com>
References: <20220110171000.24316-1-miles.chen@mediatek.com>
 <20220110171000.24316-4-miles.chen@mediatek.com>
Subject: Re: [PATCH 3/3] clk: mediatek: support COMMON_CLK_MT8192 module build
From: Stephen Boyd <sboyd@kernel.org>
Cc: Miles Chen <miles.chen@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>
Date: Thu, 13 Jan 2022 18:11:29 -0800
User-Agent: alot/0.9.1
Message-Id: <20220114021131.1F7C9C36AEA@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_181132_636249_CEA17E2B 
X-CRM114-Status: UNSURE (   7.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Miles Chen (2022-01-10 09:09:59)
> To support COMMON_CLK_MT8192* module build,
> add MODULE_LICENSE and include module.h.
> 
> Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Cc: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Have you tried removing the modules? And then reloading them? I also see
that mtk_clk_simple_probe() doesn't actually unregister anything, it
just frees some allocations. Please fix this before making these
modules.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
