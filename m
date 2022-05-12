Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF29C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3a3UV1X2UmffBpisQHW6UxgxbDTO66J3I41B6UHQJ5g=; b=ox32o+btWqR12C
	RkHglcGve4CEKBVcAaUyelkY7D7Tkd5yP8wcdi5AWAE5P65F3l3WEs/8QiHnocGRhTHo3NC5Dya5d
	y5mjxP8J8M1E+QkZXjfhnQkkYKO+80SaO3sHbr+ctDLS9nBShlmL6C38WfaULI8WKTRG8g93gVUtC
	MoQihdRYdaswUGRxeO/RxrD+vrITHiuPnnz4rURAnadvKBd8V/5OWiPHHsC0c6YFq+dOvSqWHvQlM
	XosDVyDywSzlZhJiwBvs2EksAzQgD+CCjkJoypuAIPP/2n1IZbEoNgp3ORcgw5SoEAZZ5QAMWkZ0K
	02cbIIZ3mEsTiVwxy+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np3kK-00AqXC-Ob; Thu, 12 May 2022 08:00:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np3k9-00AqTY-Ic; Thu, 12 May 2022 08:00:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F8D961F03;
 Thu, 12 May 2022 08:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 514E0C34113;
 Thu, 12 May 2022 08:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652342412;
 bh=gNpLYA0CVJo+44QjEOzPtR7Xpn/S46BHQXAcJmGmc+g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KVzTM/PZ2Nb9gxqx7Mb8Ztk2peiZX1GYuUdzV1Cw4ddlm3fkBXLMkXlD4iauHfLus
 vSkDGPsNDc1wPj20DK5pHT6PI347LU0GLJ8yHHKpjqk3XMqpQNE6FklfOmnzui06jQ
 mwlHh9GSmSk+9M4NVDxLVTIRn0YMqQPhy0tiJBv1Go7JfkxOqK7+SOvPZMbS8qexvI
 oFdJ18k0KcX0HiBjZdiz0YdPrnK2E4nsg/tj62DiOOAJ5DiuGrtoSLg++DsI5bb70p
 SDn6uRC5ryG2D7szqCKpv/8BnZfke/7MJjw367nPoBD8rM3SwjPDH7G+zj5LQUCowu
 7DzPcYTIyu9iw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2EC24F03935; Thu, 12 May 2022 08:00:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] net: ethernet: mediatek: ppe: fix wrong size passed to
 memset()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165234241218.23640.3865091641010227800.git-patchwork-notify@kernel.org>
Date: Thu, 12 May 2022 08:00:12 +0000
References: <20220511030829.3308094-1-yangyingliang@huawei.com>
In-Reply-To: <20220511030829.3308094-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, nbd@nbd.name,
 davem@davemloft.net, kuba@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_010017_687903_0EF2435E 
X-CRM114-Status: GOOD (  12.55  )
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

This patch was applied to netdev/net.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 11 May 2022 11:08:29 +0800 you wrote:
> 'foe_table' is a pointer, the real size of struct mtk_foe_entry
> should be pass to memset().
> 
> Fixes: ba37b7caf1ed ("net: ethernet: mtk_eth_soc: add support for initializing the PPE")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - net: ethernet: mediatek: ppe: fix wrong size passed to memset()
    https://git.kernel.org/netdev/net/c/00832b1d1a39

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
