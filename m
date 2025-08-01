Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04143C87FCA
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Aug 2025 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Obmn7BweOFvcjYjMX6MqF3VWPW0BsDq7Re6ntdnZEEA=; b=fXxZM/NQeide/ViCBa6AB4Tk1A
	XDxSchF6Ivp5Zf4y+Hwt9eqwOhxgwvAFZE46Zz2X/WneaMDtTZzjiez27MUvrK2o1qFweNORBCJKe
	z/+HIz04k23W2HI911z/MUHBlEyoRbYSWARMunrY3U1gMvv00CfRXvTKhy9Ep7SNUrPI9l1gYOf1x
	mCTa6Vm855/2gIQ2n8AnsEVDCerkGyER16It4rOiyPSFp4pLqakY0YEMbND9VfE1vDLaL0HTIu0OZ
	jes9EEEa7AVhpamKaHWxsCahAevkfJcI3/LdD6ThoMe6ImgIQVQEE5XKyUx5PfJsvHQivD4Rx5oQB
	6/eki9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhsMr-00000006Q0N-1gxn;
	Fri, 01 Aug 2025 16:12:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhsKP-00000006PgA-22FA
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Aug 2025 16:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D3E25C6860;
	Fri,  1 Aug 2025 16:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1997EC4CEE7;
	Fri,  1 Aug 2025 16:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754064592;
	bh=557zFmaKmS5bXOb+hv1LzxNQ0EgTYImX1LKbBCq3dEQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WViL9ibGPexJ1p5LhUn9e0uJTI+eX6Svug5ZIc86AB+Bjjjdgh67xU0jDbNgD+aOR
	 DDzf0wehy9DFzcHHPLoAo1SvVnJfppdzcGLDGCCeevoR8sunPcQNvOJnenCiVcStx0
	 nenD956h0xsoA3qcN98eEdENC9qheLfveCLQtajO5+bP62YJ86V7r5gHcDy8y2fGDG
	 lJAbXUcbIifmkePQCQ5HwoOcuy9yiQyk0YK9fWCdlxHTC1QCuG6XjWcMzFcFwxvjwq
	 D0ca8C31sTGXEDiGZsPPW/RjInDqXsMAEvleS3ZQ7sFE4fImd8cIRU5qAGBPjrqG6F
	 ay6MowWFP8bXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD03383BF63;
	Fri,  1 Aug 2025 16:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtk: Fix wait_on_bit_timeout interruption
 during
 shutdown
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <175406460749.3987296.5929961346941776054.git-patchwork-notify@kernel.org>
Date: Fri, 01 Aug 2025 16:10:07 +0000
References: <20250724085117.2678313-1-jiande.lu@mediatek.com>
In-Reply-To: <20250724085117.2678313-1-jiande.lu@mediatek.com>
To: Jiande Lu <jiande.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, chris.lu@mediatek.com, will-cy.lee@mediatek.com,
 ss.wu@mediatek.com, steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_090953_570216_69438E97 
X-CRM114-Status: UNSURE (   8.26  )
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

On Thu, 24 Jul 2025 16:51:17 +0800 you wrote:
> During the shutdown process, an interrupt occurs that
> prematurely terminates the wait for the expected event.
> This change replaces TASK_INTERRUPTIBLE with
> TASK_UNINTERRUPTIBLE in the wait_on_bit_timeout call to ensure
> the shutdown process completes as intended without being
> interrupted by signals.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtk: Fix wait_on_bit_timeout interruption during shutdown
    https://git.kernel.org/bluetooth/bluetooth-next/c/5ecd1fbdacce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



