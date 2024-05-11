Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF287C25B4F
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 May 2024 02:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1sJ6/c6nzR8zNxb5pvzb6H9RfmzHEhKoKiNgSrMz9I=; b=oWPy5FxdmgJ0Wtu7Em+eZ5XZmq
	bBJZbz4PSxOnN/d12lzzmNtzEWfow3HjjukcWWzMy4qvVXCmlWA+kPq2ly/z0orvequ46II0z8cRr
	Vch7dvhq7vjmW5BWv8XC44WzqJDaQJPrBalb/MAdsc8YYKlquvn8298oVv3tRnK/f/bMNa/fll75t
	64vk7KgOIwVS5hgAkITeqZT73jSo65vNj7RyaZ8Z97f2F4EELfLh9gDe74bcv2bpLSl8QWMEMgy2q
	MIivz+ZIuxx0D6YeoxstN/x62z6XTrvWU5eCwhMk6YfpgzTFjG7KsuYQqk5NpZuy+x49adqURpYju
	FE4XTqaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5c2L-0000000733U-2vsR;
	Sat, 11 May 2024 02:00:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5c2I-0000000732c-0zRV;
	Sat, 11 May 2024 02:00:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E586F60281;
	Sat, 11 May 2024 02:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BF9EC2BD10;
	Sat, 11 May 2024 02:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715392828;
	bh=BgsBAK0JY+nmfeUonGKRUV4Z9iF896Efa6TsEWvZ5xg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gn07Hq5Vshl41f2Qu/7VZ9ai4U62FwlOTMUwGqSR1ymd3/nyI81HzB6/GLBM2P/Op
	 4uBcZ7s7+D+skH+6tZyscceHWv5+04S7CuZyMYRigz9ILVvlZnN5DnuEBp3n4aaBzY
	 PwQ15iAHn55/wKSp6PJFV0EKx8pSwH5cSZ+IupKfOwl6lQuVjqf0PcziavTiGbO8hB
	 M86LrYDztxMUzPPa9oje+/vDaLR4eepsMsegbjw3IdDWHIJtNnI+ZyPU1duw+Aru0A
	 MxvtD/Tq8kYXQCew1jBxnG1Qn7307See8D84eCo/tk2qzsc8Q/AyeqJflcFrbTRnf0
	 iO0nQ0hb67jaA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7A9BDE7C112;
	Sat, 11 May 2024 02:00:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 1/2] net: ethernet: mediatek: split tx and rx fields in
 mtk_soc_data struct
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171539282849.14416.4543219653688344298.git-patchwork-notify@kernel.org>
Date: Sat, 11 May 2024 02:00:28 +0000
References: <70a799b1f060ec2f57883e88ccb420ac0fb0abb5.1715164770.git.daniel@makrotopia.org>
In-Reply-To: <70a799b1f060ec2f57883e88ccb420ac0fb0abb5.1715164770.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_190030_347344_08EE2663 
X-CRM114-Status: GOOD (  10.08  )
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 8 May 2024 11:43:34 +0100 you wrote:
> From: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> Split tx and rx fields in mtk_soc_data struct. This is a preliminary
> patch to roll back to ADMAv1 for MT7986 and MT7981 SoC in order to fix a
> hw hang if the device receives a corrupted packet when using ADMAv2.0.
> 
> Fixes: 197c9e9b17b1 ("net: ethernet: mtk_eth_soc: introduce support for mt7986 chipset")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [v3,1/2] net: ethernet: mediatek: split tx and rx fields in mtk_soc_data struct
    https://git.kernel.org/netdev/net/c/ecb51fa37ee2
  - [v3,2/2] net: ethernet: mediatek: use ADMAv1 instead of ADMAv2.0 on MT7981 and MT7986
    https://git.kernel.org/netdev/net/c/5e69ff84f3e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



