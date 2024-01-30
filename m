Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B0BC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 12:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FM5Jv2ykjkKS9BAvCVVWB0r190nreD7RnvO+E/m5m5w=; b=CZvXryKj2cxQTt2QYOtNIGVvn1
	SjKTvkwqQDwUDdn75OSSnSzNPsuSx2f/gl3PlAM1a0aCG/vmfbVze2jY2zr8KdPTZ3LsIqG/8rp55
	7ACqhxagW9XouwoRkubtILg8XRf1ZiaIQnm5xUGcJgBoK+Bi3/P5+IAusJ/yzvwpa0i4aYuY9TO56
	IWiWx2OKvMLR+SMsF7yOm4PyNG0C2qV4XRRXn7Z8us187Vq9B8Dz6PfuF36FI3wWI2UaK/lN+HMQ8
	dpOAnD+bLy7hHq7rdnScwe59h/Q1crrzGRPcbRv4mDegb+7GKFGAEgtxa27le7yfZCa1O2BtZRU1k
	rH8fAG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmwi-0000000GcPw-25Fk;
	Tue, 30 Jan 2024 12:10:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmwe-0000000GcOL-3cMA;
	Tue, 30 Jan 2024 12:10:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E5B73CE1A1F;
	Tue, 30 Jan 2024 12:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25058C43394;
	Tue, 30 Jan 2024 12:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706616626;
	bh=ZWN9I22FnsH58CTQa5pd4CXfCR+OhSYKRggqL9Rt5Gg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GHvQcBtT0D+CRZV3GeXl7jiKSdGS9wcN/Mdbc1b93f4Ej49kP7UZsKHmiyUK/FnBk
	 foZMC5RTikbC0vpeGtQSeYt2Kw7vFfufSjWLuPFiGRX6BIIQoTVTlV8yCSaFV2j9+G
	 qBLUximMUOPToY3L9+KwaZwzqL5jNE9wHHVywHepDcNpEdp4eaC84Uk8MvsPUfUPL1
	 WTy9KTtKfJGzp5QLIr79OzCK/qHyCe1HOu9ZKgyniqb83WL5N0KXe4BCLeSwMUF/vy
	 WmEZtC3oTmEhDyM+ppDu9fiPwuc/3E86Amot6cNBa1QWIuY7/uwssRE3J8Q7uNQpMG
	 86PIu7jSARyoA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0A2E7E3237E;
	Tue, 30 Jan 2024 12:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] net: stmmac: dwmac-imx: Time Based Scheduling support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170661662603.28218.1318230641182920988.git-patchwork-notify@kernel.org>
Date: Tue, 30 Jan 2024 12:10:26 +0000
References: <cover.1706256158.git.esben@geanix.com>
In-Reply-To: <cover.1706256158.git.esben@geanix.com>
To: Esben Haabendal <esben@geanix.com>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 rohan.g.thomas@intel.com, quic_abchauha@quicinc.com,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_041029_097898_0BE9C181 
X-CRM114-Status: UNSURE (   8.64  )
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

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 26 Jan 2024 10:10:40 +0100 you wrote:
> This small patch series allows using TBS support of the i.MX Ethernet QOS
> controller for etf qdisc offload.
> It achieves this in a similar manner that it is done in dwmac-intel.c,
> dwmac-mediatek.c and stmmac_pci.c.
> 
> Changes since v1:
> 
> [...]

Here is the summary with links:
  - [v2,1/2] net: stmmac: do not clear TBS enable bit on link up/down
    https://git.kernel.org/netdev/net/c/4896bb7c0b31
  - [v2,2/2] net: stmmac: dwmac-imx: set TSO/TBS TX queues default settings
    https://git.kernel.org/netdev/net/c/3b12ec8f618e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



