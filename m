Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B4BCD37BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 14:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UN8N/8Rd/l5yHZ6Aa+xS7WFzqqmE33I5ZJ/Yz6nyES0=; b=XAqJIx+oz85r26bKQVcpsoPIEl
	N64j6bkMzcZ6RmRhMlAnP0O153/OxwQFJVpcJ9ahn5zEK9+HQtu7qPCqzSE4Na7JJU5qcpQYBu5go
	TVCtnlZXvYxZSRQPv6/Qu84/oXm2WtROD88DmEiUxy6BZxS0YiPHXDBc+gc4YyfwUdfiOwVW5KSs2
	rSlmQlScuDKWAIqclnFVQEInzF9nKsPEQteMrPZ1MlJSQOJhtI+9lf45dk3XNzF7xT0M+fCs93ZqC
	A40/jUhdPsAnrVRjek8NIEwBap9xzuxunNUtiKfEv/uO4JAOlOOVxYSHk5vcQZiA9j73cCxDbPVGC
	h3JboGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRew-0000000DuoH-1CQQ;
	Mon, 11 May 2026 14:31:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRet-0000000Dumy-148L
	for linux-mediatek@lists.infradead.org;
	Mon, 11 May 2026 14:31:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62569417A8;
	Mon, 11 May 2026 14:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F6BC2BCB0;
	Mon, 11 May 2026 14:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778509857;
	bh=/0/OKEmHChVqa5OQdaSIlxd1uMo/9Enr7N6RJ9MUYBk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AxbnpBUyXS5O6vr7XQrrJo39g5OqcckKvWNC9r48hJTrEKtz9PPEXtD5PRHA43Tqs
	 F8bV61GNCLzP0jlV2MnE8+NFvHekxi8YxM125OAJrQAhm8Co0gVJvPPxL++ogk18cV
	 NKO5ucZEhMbtosP56RSFzmKfB1D3fU8AreoZmaOfxkqLgS/WarrIbMdVS2vV1olnTt
	 knxGwGyFeZ/Xlo5CX4dwulKSyUFosLTW5kMfwX59JUmJpfOkNEWkZJvC7ZCWFuDQN+
	 ZHyRtb4yoE+doQXRjXStHMhs/AuKfAOi6k4C6TfViuh0HwZ2dvJmRbI3EvGWKUttiY
	 PNk6u5a+YG5Iw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE163930002;
	Mon, 11 May 2026 14:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtk: accept too short WMT FUNC_CTRL events
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177850980405.2266296.3114753928820395948.git-patchwork-notify@kernel.org>
Date: Mon, 11 May 2026 14:30:04 +0000
References: <770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi>
In-Reply-To: <770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi>
To: Pauli Virtanen <pav@iki.fi>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
 luiz.dentz@gmail.com, tristan@talencesecurity.com,
 linux-mediatek@lists.infradead.org, sean.wang@mediatek.com,
 mark-yw.chen@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_073059_312511_B541FF9A 
X-CRM114-Status: UNSURE (   9.61  )
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

On Fri, 24 Apr 2026 22:24:29 +0300 you wrote:
> MT7925 (USB ID 0e8d:e025) on fw version 20260106153314 sends WMT
> FUNC_CTRL events that are missing the status field.
> 
> Prior to commit 006b9943b982 ("Bluetooth: btmtk: validate WMT event SKB
> length before struct access") the status was read from out-of-bounds of
> SKB data, which usually would result to success with
> BTMTK_WMT_ON_UNDONE, although I don't know the intent here.  The bounds
> check added in that commit returns with error instead, producing
> "Bluetooth: hci0: Failed to send wmt func ctrl (-22)" and makes the
> device unusable.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtk: accept too short WMT FUNC_CTRL events
    https://git.kernel.org/bluetooth/bluetooth-next/c/162b1adeb057

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



