Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1244FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 12:30:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2B9E60F24
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 12:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2B9E60F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoe2mYP073yYo1W6X+AD/XLyg4oZoY8NX/aORCQlIGo=; b=ifE0sg4cLQkYuM
	vlh6E58JAJWNqk/gVP6KDRvkNomfjbZPEc/aNxlMTjp0ZQrN/iM+lrIRqClMAZRnGv4Z383hftHlW
	ECCp4nfeS4pQFdG7P8FVzYdXE/Vih2e28y1gm3ea3nrt4FDy6lnDwF2++djdFqxFXHfdc6aaVYzW5
	daYpzT8bPSmeocWaJp7ZYm1Bx83J+acCRkoaud96Rxm9wCDURaWz0SGKwB/DC43oT2LrFsW/jkAhR
	FHd84OfjkmIPRgZUDyVz3XQrtBXk21BM1OYvqYLCwvoUFtgTWgueknYI3dTW5mfXl+aB7UQRonWDY
	Bs4Cy1c2yegBhyk3Kpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTNrd-00BOdm-C7; Thu, 23 Sep 2021 12:30:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTNhw-00BJxC-Ub; Thu, 23 Sep 2021 12:20:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id DFC9061216;
 Thu, 23 Sep 2021 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632399607;
 bh=lpaHmJdutw6QGCs+Z1MC3vR6wrPOip7ATYJeW38L4z8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=R1urDZBjThH69X36nftHctH5f4985k553Jh/xTtVG7iu21b+JfBZb8H6pW9wKVV1b
 MyWq/1SakaovmTR2GWwwr6c9H9n0g1tI5f2LzWFO0GBq/2ak3Ivh+stibSNa88f9eN
 hZeaTZYCIWoJ0r2FMu7tatyFiayVEpxAb9q0htfnUXc0zZtZShcbmac+27e0VZIOyH
 MLxQV1MMPBXD1kx2KzsBQWDoSz1fklDIBge/RO7bYarfHyie+plMOmP2pTmDyR8NCE
 vjp5TxwNKMMtc7A85u0GqHcx7M00jXGQvh3zxlQu0aeC6sOsZ+Xjo7hBlavn7sWBVh
 6pUBIr+DlzZ9A==
MIME-Version: 1.0
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: avoid creating duplicate
 offload entries
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163239960784.10392.2828841075323631519.git-patchwork-notify@kernel.org>
Date: Thu, 23 Sep 2021 12:20:07 +0000
References: <20210922235548.26300-1-ilya.lipnitskiy@gmail.com>
In-Reply-To: <20210922235548.26300-1-ilya.lipnitskiy@gmail.com>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, pablo@netfilter.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_052009_096105_65F940D0 
X-CRM114-Status: UNSURE (   8.56  )
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

This patch was applied to netdev/net.git (refs/heads/master):

On Wed, 22 Sep 2021 16:55:48 -0700 you wrote:
> From: Felix Fietkau <nbd@nbd.name>
> 
> Sometimes multiple CLS_REPLACE calls are issued for the same connection.
> rhashtable_insert_fast does not check for these duplicates, so multiple
> hardware flow entries can be created.
> Fix this by checking for an existing entry early
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: avoid creating duplicate offload entries
    https://git.kernel.org/netdev/net/c/e68daf61ed13

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
