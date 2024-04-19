Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5D4C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 19:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfAUC+j95Xppd+ZvpAxMoLMCiWMg9h57fGH9s9pVsAU=; b=iu9Lek1MykENlPZXb0sMYzS1O/
	AwVjeneLD25eI3G/zGJNXU5+OuEErvuBMAqFkh+U9PLP5r68LbuhQ0IL8MFhycFgqQ6eIv4bHvwfy
	NJHvW6Y9eTjGgploH+LcVS67VcRC6pqi/uhCikB4vKTX6zCxlnMQnw2Dr1xB51h4trjln7JKs6Fdi
	d5/m/KOMfBwcDOwBG//EobdnXhrA423WWBahOJ4u4bXVbiiGL8o/teT+b1+RhgKqwiZKbjDX3Ryz7
	nFcwYxl/27djNvFbTLmzxezzwucmehvs50ZnVRM1FHFRXn7mw5yLQtSs8CfspxaD8dcQ/ZSSWrgln
	pU4E0WnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxuFn-00000006pY5-1rxF;
	Fri, 19 Apr 2024 19:50:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxuFj-00000006pXR-3ouM
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 19:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 619E3CE1B5C;
	Fri, 19 Apr 2024 19:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BA63C2BD11;
	Fri, 19 Apr 2024 19:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713556228;
	bh=x65GC0z98wTskh1l/wQIaNPdpvTmTWBoTgqMEUh8VgI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bUvR2KTlwI0I5MlLSJBpJhei/zHRCUBNLss9x0eWamMcK2+V+jhLoKwvL5Mzq6yNB
	 7dO/TBaVHUDla3aregIl0rtjUoY71QPxKGHNbqQIxI5VAmfayqp6oopTVv76rzrKpc
	 UfAHNkxu8PrRcaZQxXlr4veHAZtdL1Dle150bQhA2+0R/XOoOZC1hxpPW0sZ8klc70
	 V6MsTq/CHF9NYEJj+s0aJhScInyFiWdaO5T0NroIFYuHyynKF8/KFyfx9xItV0z4NJ
	 cfTcrysGnH4az2uejPqUtjwITLPA1RgO3x73g1Q6oKEjpbTF6ZBIrzakNIe1SMoqlI
	 utxJnHgx7sYqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B967C43618;
	Fri, 19 Apr 2024 19:50:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND] Bluetooth: btusb: medaitek: fix double free of skb in
 coredump
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <171355622856.26355.12127979464027120079.git-patchwork-notify@kernel.org>
Date: Fri, 19 Apr 2024 19:50:28 +0000
References: <da0859c4b24d314d9ff38179c26a58ee7e3f16d6.1713395895.git.sean.wang@kernel.org>
In-Reply-To: <da0859c4b24d314d9ff38179c26a58ee7e3f16d6.1713395895.git.sean.wang@kernel.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: luiz.dentz@gmail.com, marcel@holtmann.org, johan.hedberg@gmail.com,
 sean.wang@mediatek.com, chris.lu@mediatek.com, Deren.Wu@mediatek.com,
 jsiuda@google.com, frankgor@google.com, abhishekpandit@google.com,
 michaelfsun@google.com, mmandlik@google.com, abhishekpandit@chromium.org,
 mcchou@chromium.org, shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_125032_246737_32B08519 
X-CRM114-Status: UNSURE (   8.61  )
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

On Wed, 17 Apr 2024 16:27:38 -0700 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> hci_devcd_append() would free the skb on error so the caller don't
> have to free it again otherwise it would cause the double free of skb.
> 
> Fixes: 0b7015132878 ("Bluetooth: btusb: mediatek: add MediaTek devcoredump support")
> Reported-by : Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> 
> [...]

Here is the summary with links:
  - [RESEND] Bluetooth: btusb: medaitek: fix double free of skb in coredump
    https://git.kernel.org/bluetooth/bluetooth-next/c/6764ab72237d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



