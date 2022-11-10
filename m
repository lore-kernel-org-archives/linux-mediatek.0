Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1CEC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W006FXupaW42B/x5G9yW+O4T6r5mvU+FHMnHSKEGfX8=; b=bBo/qQK1/q8nOzxDp5CgrtH0od
	lTBjXq1ZzatJQMBZEUUl//MOa7bEM1xmKVxvzNo9dQFSiVxvDqUhzgsRMKm0UO27A9IVappWZQo5M
	A9IFzBdyUMEGnami91aP2nbWWi2u/fyC9jTpP4PKLPjKQPocQqP32S//+xt5Z+Am/LZq54/JaI0Re
	DMm7UOjaDnbgX129RzQeQSAJb5+oMk47P4OpCc4zDNzGBlJbTifA9300F0UN5CVSBidoRdQ4McV9Z
	60YdJ7hyqWyTWJeO4ULsmIzTET1VOmOkRfCijv/idfU7kryF8R3RyppFGvrb2JHNWQbsm769pmXSI
	mqEZN6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot5zR-005TeM-NB; Thu, 10 Nov 2022 11:45:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot5iV-005LwL-Eu; Thu, 10 Nov 2022 11:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=W006FXupaW42B/x5G9yW+O4T6r5mvU+FHMnHSKEGfX8=; b=pQa5xE39iYrKgLK+NZ5d2sX8S8
	sXFxIfTxnRe0tPozbToXqEzA+WwnNkZuiFt3WufmQgrR8SzpzZuvNT1GYGsRhcEm6ZuWCqXDGEjeg
	m77n/PYoTq1Qy3iyLtbSDpcANTqoLnqgY6Zn0wcX9p8EkW5n+UbAaPIx7qIyZfgT0bWDR+EF3oVao
	0wtq0J8bQ11N6t23pRQ1f6QbeA9znFYiY5bgdoQ24d1DWcNrploF6Ty9E3O0WuYL6zSe7MjwmnaK9
	xewdNtZ/PTqCS9/WVjX2wyhMUKQAcEQhx1zlny8HhF44xH/DpxbmJ4FjdDueNqx19lxG1kQe/x3Nm
	z215YMQw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot5iR-00AGUA-4D; Thu, 10 Nov 2022 11:27:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C1F9261353;
	Thu, 10 Nov 2022 11:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57232C433C1;
	Thu, 10 Nov 2022 11:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668079639;
	bh=H7L8eU5xdL9u0Jd6RrhhVUB8QU6JlkkcKX42Z2x9pO0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Qj/6/IDU7Y8snWCvvVIrp69nyF9vpSpTIkS5weVtw585GttL9CmVHQf3bFEGbRDyd
	 FdPvLzWaKHQ9dqwxhmqXGMUsbUQkli6rb6RZXxjLKGQSrsXSrHzCZ0XWQ21wAvqpng
	 bm7WNn7nJpxatkth4tsMj39nxQLiKWygWc4V4bFKlagSuBRQZMyEO9/Rf4rGf/43g5
	 2KQxMH+qI19px1A4ao6jFh9z8ndykuYlVcIldx4kC4uUmY+nPJUAyUaws4qjW5H8Pe
	 Xye1oDIJKgOOi6AOzy+xJ5W93ipwM3cw3GKj8vSTLULlfu8gVxIQK2+wM8d496g1B3
	 e4vcL2GFsVmcg==
From: Mark Brown <broonie@kernel.org>
To: Zhichao Liu <zhichao.liu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20221110072839.30961-1-zhichao.liu@mediatek.com>
References: <20221110072839.30961-1-zhichao.liu@mediatek.com>
Subject: Re: [PATCH] spi: mediatek: Fix DEVAPC Violation at KO Remove
Message-Id: <166807963802.164080.11001757867052909901.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 11:27:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_112727_575288_4816A02B 
X-CRM114-Status: GOOD (  14.03  )
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

On Thu, 10 Nov 2022 15:28:39 +0800, Zhichao Liu wrote:
> A DEVAPC violation occurs when removing the module
> due to accessing HW registers without base clock.
> To fix this bug, the correct method is:
> 1. Call the runtime resume function to enable the
>    clock;
> 2. Operate the registers to reset the HW;
> 3. Turn off the clocks and disable the device
>    RPM mechanism.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mediatek: Fix DEVAPC Violation at KO Remove
      commit: 0d10e90cee9eb57882b0f7e19fd699033722e226

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

