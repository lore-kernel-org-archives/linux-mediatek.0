Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B185BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 11:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26IHYl+k/Qw6BtN6AqlZk1xXb8qLGq6DVfqplOtDXBE=; b=KwF/08GT0bjKMx
	cNf5f7WxZBpTihD5LaRORQu3xdz9/6IaVuaxkz4HXqhqiAlhH9a5aWLqfPJerNbkMbOFUdFCWcxBh
	ndt6503VG5ORpGWVkWokA39K4AaQfVfylRsFBrbtKl1o4+tcTZiOYYTXijwhVU0t+gOrDnGnlMoOw
	f/K0C7ZJ8FSdxVfPEQUG8c5pL2e0jEpNq2V+rDs7bcTVRozc3UxC1D37zZGoMdCCAl4DMO5cUJfOO
	dkxAh1QhnOKpEUhqoldsfr3dkCZzE4fnDa77hXLbg1D0Ks+Xs6KFdilcYfXlMzaEciJBF6TVtLJaV
	T00zeS4q+Y3/bUjJ18RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUoB9-00FoHl-Ph; Thu, 17 Mar 2022 11:20:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUoAy-00FoDC-CE
 for linux-mediatek@lists.infradead.org; Thu, 17 Mar 2022 11:20:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 161CE618BB;
 Thu, 17 Mar 2022 11:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 803F3C36AE2;
 Thu, 17 Mar 2022 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647516014;
 bh=nCuwQehZV3E3+yHCPJUenkVbOnNfVLacM411RXq1JBQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=lX9UWohllyxg/2VmSSr4NgF9UCMF0/A/Tpq7Et1aKpk87D77wei9aN4oI7mr5KWf9
 g15UpVyqIArst4kd2Vnh22Nrt8QwnYXHJXWZ4TCxK5rQo6WywInZEVNA2f48vApRru
 Qx78D/GS8slE1Ez465DFyfl/LucxYSqZQ+m59CS4cqFHj+HzuD5cGwDBNLpUd89ZjX
 YR2PDXYQXNipw2uK3xN6G0MDYqplflniczsiRv5pX4GS0ek5Hi7aAEzM9p/jZwQGqQ
 PhA/QRYb9fOBn1cePptVSZaH84wMr1hm6oonpasWLmsG9kGx8IyCm+3ekHZjkVb9De
 lo0Rx+p8BdlfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 663C1E8DD5B; Thu, 17 Mar 2022 11:20:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Bluetooth: btmtkuart: fix error handling in
 mtk_hci_wmt_sync()
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <164751601441.15552.578400949800414032.git-patchwork-notify@kernel.org>
Date: Thu, 17 Mar 2022 11:20:14 +0000
References: <20220317075740.GE25237@kili>
In-Reply-To: <20220317075740.GE25237@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com,
 luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_042016_492150_0DE3D2DC 
X-CRM114-Status: UNSURE (   9.51  )
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Marcel Holtmann <marcel@holtmann.org>:

On Thu, 17 Mar 2022 10:57:40 +0300 you wrote:
> This code has an uninitialized variable warning:
> 
>     drivers/bluetooth/btmtkuart.c:184 mtk_hci_wmt_sync()
>     error: uninitialized symbol 'wc'.
> 
> But it also has error paths which have memory leaks.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtkuart: fix error handling in mtk_hci_wmt_sync()
    https://git.kernel.org/bluetooth/bluetooth-next/c/65d6602f6334

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
