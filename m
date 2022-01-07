Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7A9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 02:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+quVcrKDip79pQjSyhON/sHFlH+PDPc4DUeV5fmg6w=; b=4OvtXPud3mg3Ng
	dLwaj3drufNUkb0QDbJP9inp+g4t44xWYXDVr4vLDtEiI2ynk0UoPsH1O7SYeGACzqm8Ar+znHoyH
	GtHwACRiQPLjXkwrMibSmZ4uNbQa7/rynGVJ6e6AyDq2nwclgmUgLM35CuM0+Wb4gSK05xPGPZmh9
	JiouVqAN2D/cD7X/SlZ+MimG0HrKWceZsEBtGPxUaCZzqVxNl4CO1UZ8YsYfsLZGJif0KEbhm8iLc
	nTQfuOzLGzYAKuP1dB0ttY1nPOpVvIhpNlQygPzH6+qaAs3gfs/V/oijyCY0EpEPBBEqHXQ8C3e/p
	yj5wY8u2Ji9zfYI694RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5ezD-001wn3-3w; Fri, 07 Jan 2022 02:28:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5eyi-001wZu-1f; Fri, 07 Jan 2022 02:27:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BBDDFB8240F;
 Fri,  7 Jan 2022 02:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFC8C36AE5;
 Fri,  7 Jan 2022 02:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641522457;
 bh=wMrnuKLVipxEQwYq49Wt5ylnblmw0aY97RFd9CHzOJE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=mIBYwZC6r6FLI91Ygr8uLNBJYT3deW1eKGcoGuqyLs6u56uYRDmcB3NoS0J5Gs933
 HZwI78sIfqBeXRl6DQAajjKttqcRXVcmrFWhc+VZd3+GXdftYOS9eDXwNMNINHHPXr
 XwPYT02pQX7Xz+2tPpkHHSCBm0IQSOteX3COxha6g9Lea5An0s9LICTCohssO1m5tc
 K9WCMBwmuKPzgIOGqdHOy9QfUdR8gzAc6w4XjlsWHpFSMClavN6MClEqA/KTVkaGlo
 QB6ISWCsS1027noh4X169IVcthqTsfV8PQ9B36+Bzc8nBdSB6uA+GxgdDypBYXVrHL
 s2SZNkcsl3DnQ==
MIME-Version: 1.0
In-Reply-To: <20220103143712.46675-2-angelogioacchino.delregno@collabora.com>
References: <20220103143712.46675-1-angelogioacchino.delregno@collabora.com>
 <20220103143712.46675-2-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/2] clk: mediatek: clk-gate: Use regmap_{set/clear}_bits
 helpers
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 miles.chen@mediatek.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mturquette@baylibre.com
Date: Thu, 06 Jan 2022 18:27:36 -0800
User-Agent: alot/0.9.1
Message-Id: <20220107022737.6EFC8C36AE5@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_182740_260482_8FB7E4C3 
X-CRM114-Status: UNSURE (   6.67  )
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

Quoting AngeloGioacchino Del Regno (2022-01-03 06:37:12)
> Appropriately change calls to regmap_update_bits() with regmap_set_bits()
> and regmap_clear_bits() for improved readability.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
