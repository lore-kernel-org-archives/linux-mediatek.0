Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0157C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 22:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sYZDb0rLtNfsTlj6AhUFNQ71syHEe3kIXyGSA7b0/0=; b=uKuOCcHCT6RftsbQ930X1CXE37
	Lnz0yaWi8ioZI2COEGogp2dC9elpT13xCj/rIb5dTxdy+h9ih6a0QbmYSrhif2prcKUr2XohRR7MO
	HrgdTQ6SQvzYqVMICLoJd2Xp0TJBf1StEWGDUSgo2xYGKxgsWbHET1AJxtIq6+W6uAkvnop6R85xj
	eWZWaXrspAy5YJGzv5ItVB48RQcboSe//9ik5E40HvYogSzLBnohVGjEq0Q+naZaP6K1lsPPJgBGb
	gY0rqP6sruHZLaM0opq/sTTXFgNDSVv4kBv5ujVdjY9pAfdbDkf+DOcPXcg5CHmf2ujwgzOXOzxL7
	95I8sgyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB1wV-005Ht0-Ch; Mon, 11 Jul 2022 22:31:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB1wJ-005Ho7-8p; Mon, 11 Jul 2022 22:31:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 81E08B815F3;
	Mon, 11 Jul 2022 22:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7317C34115;
	Mon, 11 Jul 2022 22:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657578695;
	bh=ZL3TQAfBSmk88tbrJpOmYI/DhBKsXihG4ur1c9u/6CE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QtJ45TwDZh+xTseD9Q7Supflim9NOmwQnMYu1GnBsZen5AI4G88aNxeC08vWmvjSp
	 fNsYmzSznBL72MKmU2EAVwkuPE+QISPpc/NP7g0ZEVAqa7TocWxGfDYz4a/U/vO8mi
	 nvDV87fgN2s6Rt0pVAPruKZJBBvPjCVeASosS7loZwKJFb/2wJBhDNRZk8Y6Wmd8ze
	 PNh9klXnqkV4gjjI3SYVne02mJ+IrIeshlIQyQVwXsNEZ1Ka0gReOMBRUmMMKcV71M
	 VGrUcwGf2n2hst0JLqHPH7SJX+xegIde9+jvPPelECh/swLvBxIPMhbGnigPVIT+6q
	 FKAIKevSOy06g==
Date: Mon, 11 Jul 2022 15:31:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: David Miller <davem@davemloft.net>, Matthias Brugger
 <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <macpaul.lin@mediatek.com>
Subject: Re: [PATCH net v3] stmmac: dwmac-mediatek: fix clock issue
Message-ID: <20220711153125.74442bce@kernel.org>
In-Reply-To: <20220708083937.27334-2-biao.huang@mediatek.com>
References: <20220708083937.27334-1-biao.huang@mediatek.com>
	<20220708083937.27334-2-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_153139_495991_281A9E5F 
X-CRM114-Status: UNSURE (   9.29  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 8 Jul 2022 16:39:37 +0800 Biao Huang wrote:
> Since clocks are handled in mediatek_dwmac_clks_config(),
> remove the clocks configuration in init()/exit(), and
> invoke mediatek_dwmac_clks_config instead.
> 
> This issue is found in suspend/resume test.

Please improve the commit message so that it answers the questions
Matthias had and repost.

