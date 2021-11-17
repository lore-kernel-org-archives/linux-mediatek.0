Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED636C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 11:30:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA39D61BB3
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 11:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA39D61BB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Or/ao23WmpoKp5Oh6SViXkqTFM1yUkfJZuubZN7shWU=; b=iGtPZgiaipStPB
	Fr0H+9mMIDefMp0gurVxsJQ9sOsdd56WmYY3E7YJSgnRq4BqM/iodrh+EqWaGfc9VrS9yZX83h4Ek
	NCV/36kCk1V8q+hSh/v+MykOeqgiNFdW1RfgxmI5ZDMmZ6i7fqmJpuu1Oa0BFfly+HSQM7fLSTJX8
	iqWLH+WIdP5N63GGDe6tlb+Kqp3ruf2m2DhrvL4XuE5amNpV/tE3L9u2mZErHBBpPi18xLYMxqvOt
	OQFsNxvF3kMOm+h++Fs87sFwMiu+kIDJXm+Q+bMJbFXE+rU0mf5jEs0UOUdjFOlWiNa0eWvwHCvQ1
	B+RPzBXkFAlMANtsD2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnJ9M-004bCR-Bo; Wed, 17 Nov 2021 11:30:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnJ8n-004b2y-0o; Wed, 17 Nov 2021 11:30:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 1B56763236;
 Wed, 17 Nov 2021 11:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637148612;
 bh=9NAWKiUPeaw8SPyXsy2T6rO5y9Fvz/XK5iqN1WAx2SY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MMYpEL2nGIV7Aw/0VwnZ+sAhkcpG72oqd3/aTrrRHwi/XJb4sxXRnNWyKpBEi6IRQ
 A4SDl9bzlLr4kYWDP3q248H3/kd4gDOjsYWjQoYOaLvei1BCEl8Zv8fK9rshz/h2rV
 mUEwPPcdQeVRUBShp6LBdvA4orjUvWwJbEgDCFtQxnylHxVZdyL+EBU3bCSLpFBqjk
 hNc7+H7h541KBOrWLJfF9nOz8QIg09EWOuygIVXH1z7oNeukk5cUUFIozW92nLuI8T
 iHce+lH5xTIByT/mLP8sxggY0qvEeXZQzYcOQ8xMxRAe2WkvhwJaiGC/5OYDvfUgTG
 +J6z5aH1SQkaA==
MIME-Version: 1.0
Subject: Re: [PATCH net-next 0/4] net: mtk_eth_soc: phylink validate
 implementation updates
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163714861205.14428.6218012722892751788.git-patchwork-notify@kernel.org>
Date: Wed, 17 Nov 2021 11:30:12 +0000
References: <YZOCn1vMUAbhq3j0@shell.armlinux.org.uk>
In-Reply-To: <YZOCn1vMUAbhq3j0@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: nbd@nbd.name, john@phrozen.org, Mark-MC.Lee@mediatek.com,
 matthias.bgg@gmail.com, sean.wang@mediatek.com, davem@davemloft.net,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_033013_116502_C6917395 
X-CRM114-Status: UNSURE (   8.72  )
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

Hello:

This series was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue, 16 Nov 2021 10:06:23 +0000 you wrote:
> Hi,
> 
> This series converts mtk_eth_soc to fill in the supported_interfaces
> member of phylink_config, cleans up the validate() implementation, and
> then converts to phylink_generic_validate().
> 
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 111 ++++++----------------------
>  1 file changed, 24 insertions(+), 87 deletions(-)

Here is the summary with links:
  - [net-next,1/4] net: mtk_eth_soc: populate supported_interfaces member
    https://git.kernel.org/netdev/net-next/c/83800d29f0c5
  - [net-next,2/4] net: mtk_eth_soc: remove interface checks in mtk_validate()
    https://git.kernel.org/netdev/net-next/c/db81ca153814
  - [net-next,3/4] net: mtk_eth_soc: drop use of phylink_helper_basex_speed()
    https://git.kernel.org/netdev/net-next/c/71d927494463
  - [net-next,4/4] net: mtk_eth_soc: use phylink_generic_validate()
    https://git.kernel.org/netdev/net-next/c/a4238f6ce151

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
