Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC47ACDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 00:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyEL2P0zESGSKVS0cSaZ1IlmMty9BxAWnwWCEPe7+U0=; b=xSHGbvsoHw02aZyWQBc3/Yg9pN
	UjAlzp5eeok/be6H2jcfzRzzYseFO5qa+cQP+p12gfGEKeNmmTpTtQdPlgMQAEs+8Aigtj+o7BtPS
	bHdnWWJwT1mKEz9aFvB72gwKWwsNBuiWg1XxFwiDjZKeHFXesuLdj8IENr8Wk9I1JGPSUz+6OwGGE
	FyxX2nqB3HcHgUs/usnLe2KlNxXAgRuxqh8Z2UybevanHc1U/hEBYAvTqMmFeG4Lfz9/T3MTuTmKd
	kxUukIpFZpG60Kf6AD5L/TOKhgunyQqRK672hXPZXJihKpJekS8l7jWDupp2UVwsg7SkVAK7am/vC
	pv6qbEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjay-00H2sT-1Y;
	Thu, 12 Oct 2023 00:30:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjau-00H2qb-0l;
	Thu, 12 Oct 2023 00:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A94D1B822A9;
	Thu, 12 Oct 2023 00:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A59E3C43397;
	Thu, 12 Oct 2023 00:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697070625;
	bh=51tfv3kMjBGFcDAc9LOdPgHNhgvubjVRO3ku7iHFAX0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OIbMzeaFADSfHFDUuZnm3TXeyFpyzFQa8nPFMovLi6AKX3fexivxBQdA84p8cWRQd
	 58+KAzs7gV/+/w7oq2l9anaxlWcS5cdG1vQOEikVEx76mzKx0LQVzl1nyepk+LH+Mx
	 B0d4pvj/j+6H9gHSSZS5Hn8/AHI+QY/vu2zAtmo+29oaJSZI6VqYcSJOtlOIl4I4KN
	 oL6cKas+G0IIERb2WADGf5vY/Lfgkb9KRf8nruq9od6Iw6CM97u5FGX+GxSxDTTcVT
	 meuFRIPcocSLvfBe6ZqMXf5SJy+H3UievbpkqMT21FbQSHBPFLwdDGdl6QX20dalK4
	 88knMj6OPtzjw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8F904C595C4;
	Thu, 12 Oct 2023 00:30:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: dsa: mt7530: replace deprecated strncpy with
 ethtool_sprintf
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169707062558.15864.9019771433715033154.git-patchwork-notify@kernel.org>
Date: Thu, 12 Oct 2023 00:30:25 +0000
References: <20231009-strncpy-drivers-net-dsa-mt7530-c-v1-1-ec6677a6436a@google.com>
In-Reply-To: <20231009-strncpy-drivers-net-dsa-mt7530-c-v1-1-ec6677a6436a@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: arinc.unal@arinc9.com, daniel@makrotopia.org, Landen.Chao@mediatek.com,
 dqfext@gmail.com, sean.wang@mediatek.com, andrew@lunn.ch,
 f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_173028_435060_85D47D7D 
X-CRM114-Status: UNSURE (   7.40  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 09 Oct 2023 18:29:19 +0000 you wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> ethtool_sprintf() is designed specifically for get_strings() usage.
> Let's replace strncpy in favor of this more robust and easier to
> understand interface.
> 
> [...]

Here is the summary with links:
  - net: dsa: mt7530: replace deprecated strncpy with ethtool_sprintf
    https://git.kernel.org/netdev/net-next/c/ac49b992578d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



