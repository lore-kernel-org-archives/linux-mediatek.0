Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C08C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 21:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkekcNUBMQj5wDEoO64O14NY8MI+HCEMoXgH3bnWZQo=; b=d7dEOHXZ4O7okeGU7C5PcYT5Ve
	nwf2h+/CDNsNR5cMFaeBOLPxggGOsSwGUNphYBasoTpLgzJj0fEkWvmofO8qfp92TYv3n+dQ3VKnt
	OoRGcp027ITRiN9581u5VE1W7mQ1SZCNvCtByt/xEI0ZNqMPpbFhSwZF/1G05QICiEj4QAf3nIo7m
	o7KapW6KXNplNyMbAS9o2PsfqPkGa/955H1ulkPpOZGNl7LrAlanOADg3y1BZlqd1kLoplR9NN6OA
	05aE8QkuUozLRPtjONK3syWqqbNdoYcUQFa3cAk1nITImubJZ3FmE8F8UemYXqHnszH5EC3tfNm1A
	KKqh61yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFtI-0000000AmYz-3R9p;
	Mon, 04 Mar 2024 21:30:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFtF-0000000AmWo-1p3K
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Mar 2024 21:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F25D4611FC;
	Mon,  4 Mar 2024 21:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7155CC43330;
	Mon,  4 Mar 2024 21:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709587827;
	bh=W27zYtNAsaurBFbAYeVJtWJ3xNO1se3Yby7vpbfIx2g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GKg6MDaw9KQctlTOAoYPW0xR33Wh575vjxUKNmIWsFhx1XVxU+wJFaUwzjcA2XwyE
	 aqBeIWpeOYsUoagOetbysEWODn0JkZKaKfJbdKy9SJL2oa7kpN8rX1+IinMijUI1Q7
	 dlfibqPUP/IjYBH0yfqT8986zMlBjWYlSYroYg/MtvpOV6wb5Kk7zUaTQBzAZ9ZIu4
	 CRo9tqUSDAPLBSG++k/McODuy5qROJm4L33MTgk2fOJFvv5TezVMlzFEgj3yMW7Hws
	 plzCUH+9/MjpGSfFO48kAgLWFeQF8oDssavLAkunTvje1VjMFBvgiNatWjA0Yqn6WT
	 3gk8vCuVEC0dA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54421D9A4BB;
	Mon,  4 Mar 2024 21:30:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] [PATCH] Bluetooth: btusb: Add support Mediatek MT7920
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <170958782734.29902.13888163732970633114.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 21:30:27 +0000
References: <20240304144844.2042-1-peter.tsao@mediatek.com>
In-Reply-To: <20240304144844.2042-1-peter.tsao@mediatek.com>
To: Peter Tsao <peter.tsao@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, deren.Wu@mediatek.com, chris.lu@mediatek.com,
 aaron.hou@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_133029_537273_D80BB1A8 
X-CRM114-Status: UNSURE (   9.52  )
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 4 Mar 2024 22:48:44 +0800 you wrote:
> This patch is added support Mediatek MT7920
> The firmware location of MT7920 will set to
> /lib/firmware/mediatek/
> 
> The information in /sys/kernel/debug/usb/devices about MT7920U
> Bluetooth device is listed as the below
> 
> [...]

Here is the summary with links:
  - Bluetooth: btusb: Add support Mediatek MT7920
    https://git.kernel.org/bluetooth/bluetooth-next/c/2ea671b17896

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



