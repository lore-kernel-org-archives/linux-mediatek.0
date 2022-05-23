Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F27CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5O1UEPsHUvq9uZyUPdP7d7xnwAWKJ0gBEkPjvxWCtI=; b=uMyt4lwleI7mJh
	tUPNk1GVIW7bKddweL0ev0KlN/oX5UkQglYDmDB/ggVLyLmneBeZqB5eV+JclYh4K+t0qCt11roM2
	h+fPaoqT59SjnG7PdV4bw7plJ83zER4ZdcYqyH817BpsQ637mtitt5bSHyk4zRuV7sUVcBOlcRc+r
	zN/XXWXgkpw4mJSW7amIU4NFW32/krjEovVhwR2Bv7wXupIn6FwH2rmeYCJjzHNuYDN1l95CSZKKg
	hpTHGr8Wz/9vaLVC2rKnh0mW6g8FR7REyvFiRUjtBl5Qx2sHG1ebIcnrZPuzGnGhWxVrvX+NSo70O
	dMY3zq9vIAAma7yOuyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6DR-003hBS-Pu; Mon, 23 May 2022 11:27:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5de-003PVD-KY
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 10:50:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 168A061234;
 Mon, 23 May 2022 10:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73FC2C385A9;
 Mon, 23 May 2022 10:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653303012;
 bh=vL0av8qajrbUGlMbyUnN70gRfBZlR5Yqly8QGb2oG2M=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IG+Bg4LfjKRYYCcrYzNmHl8FhniYOqinrTPwxi2C99a9c5G3kY/bgIy20gfrVg9R6
 Ue+fgPyn34GPcvX+W9KcYKmdgSe1GqLMU+HKIJw8IxuY8td0BZVhz9EzvWEwyrGl5S
 SPJDUdDEjMeD9wIx7WWaCouWmZGG++XZnb0Wvg/yqb8Y8ezPcu2Rn3NosVn2yk2+UM
 eb6sXUeD349/P5a7LgM1hNI/lm7UznXBQNQKRhyqWP1lTCbV068qZdSvQhTFq3fVHU
 wYLkFbpqj7uX3V7TvXsSY23yGRBl2ug/0crg00FE+4iYky3MGt6oAwUHT9CmEgkGx/
 2hvBAlKI3Pjfw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 550AFF03938; Mon, 23 May 2022 10:50:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: fix error code in
 mtk_flow_offload_replace()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165330301234.7594.6324399945658700644.git-patchwork-notify@kernel.org>
Date: Mon, 23 May 2022 10:50:12 +0000
References: <YoZPQNFPTQI/6ZhP@kili>
In-Reply-To: <YoZPQNFPTQI/6ZhP@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_035014_802781_2C0FAB52 
X-CRM114-Status: GOOD (  12.48  )
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

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 19 May 2022 17:08:00 +0300 you wrote:
> Preserve the error code from mtk_foe_entry_commit().  Do not return
> success.
> 
> Fixes: c4f033d9e03e ("net: ethernet: mtk_eth_soc: rework hardware flow table management")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The original code used to preserve the error code.  I'm pretty sure
> returning an error is the correct thing.  I guess please double check
> this patch.
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: fix error code in mtk_flow_offload_replace()
    https://git.kernel.org/netdev/net-next/c/0097e86c8ec5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
