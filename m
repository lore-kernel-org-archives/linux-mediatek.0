Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8CAD262B7
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jan 2026 02:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGLeQ9AaNbgC6w2IL1iIrozstN25/5P9Gtf7U3/XiiA=; b=5AjY+Z+/ZyLbWtPzsJX90EWPrb
	EIMqI4d52oqMgozKEsKU5eV0H7flZKD2z95OfxCms+4DErNqs5KzOLC9y7u38TLIf4xWs2xTL/dYH
	bmfUh5IiX/RprMKFrRxwFgQhAoTvgVyFwqIoYyxOmqU7ojVS5wcwFIrI2rc2DeGOOVZp2gy5WAh8t
	FSRiL+7Rgd0bU+fobJRuf+SYoYg7Rsp6/9H0CN4sWLgV5I5CNr/3zQtMGUjllD7Ax/2n5fJ7mRD8C
	fvc3k9H3RAffAVl7EzNn0cujQhjPupWIiuxRJxP6FK/WXkWOqetZCyJY3gYyYYSqV4+RuGreDA1VQ
	8udbeT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viO9K-00000004nyO-35wP;
	Wed, 21 Jan 2026 02:40:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viO9H-00000004nxL-2zfH;
	Wed, 21 Jan 2026 02:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D56743986;
	Wed, 21 Jan 2026 02:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD03C16AAE;
	Wed, 21 Jan 2026 02:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768963247;
	bh=xkc/qafbndTs+c7HESAlPKw3k1DOa7hVZ889NHj1Kn4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LTGEIv/mQRYmQ6M+EtzcqBkicV0h3i55BHt3x9N6Yozj5GsASDNytRl4DHqrPNkuC
	 MFTDtMasCvFDjtJ6G1fT+0dnLNmLWNHeqVCYiS0TMSUcoES/UmcU5Rx8QaB9ZPUawo
	 /nqNfU5DxoRlm5/wAbImX3B4hV6UN9IQltnxM4xLkrsY10BUkwEUIVQjnb58lErxcs
	 mqg3Tj1JdSWOZlw8HwuCBi0P3hzzjvDciDUUwTZ8BTYLD9COMz8D0m2dzEUQgbUIO4
	 3Gandqxpe+U6y49Q3pnwC0Ni02XwEdkHK4jX9QVZNw6CIgZJXAneCzk+kwBtNgv2aE
	 MWOoPM5cMcihQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id CCE43380820D;
	Wed, 21 Jan 2026 02:40:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: airoha_eth: increase max MTU to 9220 for
 DSA
 jumbo frames
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176896324459.699622.2094070103891917067.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 02:40:44 +0000
References: <20260119073658.6216-1-sayantann11@gmail.com>
In-Reply-To: <20260119073658.6216-1-sayantann11@gmail.com>
To: Sayantan Nandy <sayantann11@gmail.com>
Cc: lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 sayantan.nandy@airoha.com, bread.hsu@airoha.com, kuldeep.malik@airoha.com,
 aniket.negi@airoha.com, brown.huang@airoha.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_184047_771933_7ED17BD0 
X-CRM114-Status: GOOD (  10.44  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 19 Jan 2026 13:06:58 +0530 you wrote:
> The industry standard jumbo frame MTU is 9216 bytes. When using the DSA
> subsystem, a 4-byte tag is added to each Ethernet frame.
> 
> Increase AIROHA_MAX_MTU to 9220 bytes (9216 + 4) so that users can set a
> standard 9216-byte MTU on DSA ports.
> 
> The underlying hardware supports significantly larger frame sizes
> (approximately 16K). However, the maximum MTU is limited to 9220 bytes
> for now, as this is sufficient to support standard jumbo frames and does
> not incur additional memory allocation overhead.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: airoha_eth: increase max MTU to 9220 for DSA jumbo frames
    https://git.kernel.org/netdev/net-next/c/6406fc709ace

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



