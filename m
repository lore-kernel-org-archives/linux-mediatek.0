Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845F0EB64D9
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 02:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKIIOHDn63npjNmCAV1x40uyquPFTsH72BXUkGpdDuI=; b=jLfSmgEqTVaiccKI4pioFVsniq
	11V8d8s6lNdudyjzGp6EmSDhon+7F8PeVPshFK2Gg0rsU4GWzwuPQCrwkuNB2dSIGm0caw7/hqoXT
	jhTQ37/F1L+siFU0tOjH6G5VqajYIcdjPRD3+BON8I9I7wlJS03ZFXkVfiifiIlUE/nQkDOd8MCJa
	noDdb4Bks5l8O1YMxMQ/s4mFwQjxe0NzaiZa0rU0jH/9bFmcvyAuvJBz4Bnc5TG7cP4BiEvHbYhdK
	L/yzy2pN87wA8YONTDfXUxO60RS9SHxq6SC7HcC35WvxRnGnyZ/vsb2TAh9OQ7ESJNzWe9tI+SKMQ
	zPUBXnzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHb5A-003EFo-27;
	Fri, 07 Jul 2023 02:20:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHb58-003EFF-28
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jul 2023 02:20:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9FE016165A;
	Fri,  7 Jul 2023 02:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B6EEC433C8;
	Fri,  7 Jul 2023 02:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688696424;
	bh=NMaIG04L/6+E/2sKovqZRj+7rHyfA4XB+GfHgtsEzmM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=azrHxF6Er9dz5uac8BGKksDnLEYAXRN1rbS3CZfh/slM4DqIfuqkZPsGz/jakca6h
	 fyj1EzFyhw2LsOEd5sNkGxrN9UnU0b+/zgbgR4ms3fZs+TjlOx78XFZrfhjfuRR8+b
	 HVdG9oz/Dy+vMOocfKwfexB/mwnfSch7lRIwypBRXT60XK5uZod3ToOKdFlWe6wWR5
	 7XhxjJyKo2teWX6gAptH6I2Hevk8StAp4yvnJYdmc7FI6DwrU/3H3WuPdalSW0CqzH
	 QQwtcEJ8MtmkW2SHpi0DZW1zZYwBVgU+n8gqZz0NdgKb3KEHKcPj5qwmC5zOQgylSX
	 QRuvwTxabhjMA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 679CBC73FEA;
	Fri,  7 Jul 2023 02:20:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] wifi: mt76: mt7921e: fix init command fail with enabled
 device
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168869642442.27656.11954856306543851735.git-patchwork-notify@kernel.org>
Date: Fri, 07 Jul 2023 02:20:24 +0000
References: <39fcb7cee08d4ab940d38d82f21897483212483f.1688569385.git.deren.wu@mediatek.com>
In-Reply-To: <39fcb7cee08d4ab940d38d82f21897483212483f.1688569385.git.deren.wu@mediatek.com>
To: Deren Wu <Deren.Wu@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, kvalo@kernel.org, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 sean.wang@mediatek.com, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, quan.zhou@mediatek.com, stable@vger.kernel.org,
 leon.yen@mediatek.com, deren.wu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_192026_762460_80762251 
X-CRM114-Status: GOOD (  11.99  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 5 Jul 2023 23:26:38 +0800 you wrote:
> From: Quan Zhou <quan.zhou@mediatek.com>
> 
> For some cases as below, we may encounter the unpreditable chip stats
> in driver probe()
> * The system reboot flow do not work properly, such as kernel oops while
>   rebooting, and then the driver do not go back to default status at
>   this moment.
> * Similar to the flow above. If the device was enabled in BIOS or UEFI,
>   the system may switch to Linux without driver fully shutdown.
> 
> [...]

Here is the summary with links:
  - [v2] wifi: mt76: mt7921e: fix init command fail with enabled device
    https://git.kernel.org/netdev/net/c/525c469e5de9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



