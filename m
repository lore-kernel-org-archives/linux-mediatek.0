Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D18AC2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jul 2024 17:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5OVZ1J75PSqabwjcSWrHCaHuo+I/FiKSeSIiY1suTQ=; b=PuRSTedzGFBPtXqYtrTqvOKhZW
	0CSKPf09IDG5svhpEI6QfpeUqY6vRIYCiOnuSZgiOS1bGmlbimlXRtFFDSSvsoE6qSD6xgHXyUGmv
	Q44ZwXqNH0FAh2tAdaQPl4DgL/Y58Ei3g1g7CW0/guPGiCK9IkR61CPHYKNq63SgqEavm0cvPSO23
	T2roGs0rNwvZ3o2ZoQSD7WVQaqRdqM06Qb8UJpocOW4thnKFSkTAH8xPZRqIpf6nSCf0kHZA0j7IC
	L1JnwHlaGznVagbdqEyxEHqLF3KnY+lQUAf0Nw85Okz8kkqhV1XpwerAtk6CWzclzss0FB17bMJwS
	LoOTgFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKrS-00000004Jjn-3u4W;
	Mon, 01 Jul 2024 17:30:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKrH-00000004Jfy-0owx;
	Mon, 01 Jul 2024 17:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B2170614D1;
	Mon,  1 Jul 2024 17:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A042C2BD10;
	Mon,  1 Jul 2024 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719855028;
	bh=/40oz/s8RXfS81mQyn18qyWYU+aDlAPyeqR/p4JT5tA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gqYrYuRzf3NTkTOhhAV4lwmrklGgFS2fdxAoSTBNzjCwicWeIvVvNqiPYR6vIx+x2
	 T3679jsW4MacnvnNlqZQRGiCI4EpeBbmP87c+cSMak7Pt9pHoOSKZkVXUaHR3/9C7E
	 q2UVT56Yu8KG8vZjJdQ9xXxQXX6tiHrue5w3egCyixEoUtStHP8yi8X+0S1Kh+BiDn
	 Y9U3cTrdyv4r3i6c85NZfog+bPqOkoFFSCyF4FnY/P2sxUcFdgBuB1fcfIXwW57COt
	 RClLO8zIwpw585IT3HFgt5fELKOk2KUkpXSN1q+U08/EDIwTHsmHTcVh2f3X0GPLOb
	 +uTAjeSBeH0Yw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 42775C43468;
	Mon,  1 Jul 2024 17:30:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2] dt-bindings: net: bluetooth: convert MT7622 Bluetooth to
 the json-schema
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <171985502826.17789.16520261156550841642.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jul 2024 17:30:28 +0000
References: <20240628054635.3154-1-zajec5@gmail.com>
In-Reply-To: <20240628054635.3154-1-zajec5@gmail.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tpIDx6YWplYzVAZ21haWwuY29tPg==?=@ci.codeaurora.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sean.wang@mediatek.com,
 linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, rafal@milecki.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_103031_321044_4F3D51AF 
X-CRM114-Status: UNSURE (   7.96  )
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

On Fri, 28 Jun 2024 07:46:35 +0200 you wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Dropped serial details from example
> 2. Added required example include
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> [...]

Here is the summary with links:
  - [V2] dt-bindings: net: bluetooth: convert MT7622 Bluetooth to the json-schema
    https://git.kernel.org/bluetooth/bluetooth-next/c/31cdab2ae178

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



