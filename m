Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C54C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 May 2022 07:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+mNgxNly1KEeYKerKLekQUWlZUdnNwPAQFH8uMlisU=; b=SjpG2oic8xmeNw
	fMkaULbhRoY1N8UEcxwcUq5biby2UJH8z5jkh/jbjznnEAWOAnk6QczfLQHUAToy/+J85NTxf/xBz
	SnLv7P4SFh92ZV1l0+WPekIWtkJJGejtNeO8Bwgg+o+az7eFj9wlSNh/Z+HyF0sj4W2bu63FAgEhW
	3J8xXte5AUNm1SzQ3dHym3ExlC0dwBL0Flm5aT9g4i3rPmP8bU/B/dNyHcVRZ0MHjRL05MyJ89E94
	F4ePK45Kqtf2bijhy/ADAfWp4KZ0b2u8cSBUFb5QvOjRcR05lWgL86AZYu0XqOPbdAWTTWt0dnb95
	c3ulSUMnSSh4MJOCFVEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuU70-00Gpnx-R9; Fri, 27 May 2022 07:10:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuU6y-00Gpn5-JF
	for linux-mediatek@lists.infradead.org; Fri, 27 May 2022 07:10:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 841EDB822BA;
	Fri, 27 May 2022 07:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 440A1C34118;
	Fri, 27 May 2022 07:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653635413;
	bh=A/2gODPzUDB9QlUQzay9mwbFSu2RC27by+yM3INsZvk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fOAZ+p4VJR7iVojcURe+zSE5KdLXwnklkGpP6wmc0B88zYw6i3mrENWg1mzNcWKog
	 IsB4jo5qbH/bXGaHQyeViMHLP9bGWyZfJvgyR2fE675BqIIzOvuTiZyzPD0SnQ7omV
	 V1vEhk/9bZ0L/R7+J75/Ad5SZ089t0f+xvDXGnz8TEollCJDNchGGm+ARlwSIJaq5G
	 WlLTTJEiljjDO/NX+xQsRheQemSCbvifhpZAhHd/e+pIOALBFSL3vfFoIaUGVUWDFV
	 MsO9CwEyvqZHw4OzVN5XvKbB7p3z5dFATOpEI7D+xbGwW0exbLNUbNDUqgzXyeF0yn
	 lAqZSnms+bgmw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 233C3F0394E;
	Fri, 27 May 2022 07:10:13 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: out of bounds read in
 mtk_hwlro_get_fdir_entry()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165363541314.15180.4008920253875767970.git-patchwork-notify@kernel.org>
Date: Fri, 27 May 2022 07:10:13 +0000
References: <Yo80IuC/PRv7vF5m@kili>
In-Reply-To: <Yo80IuC/PRv7vF5m@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: nbd@nbd.name, nelson.chang@mediatek.com, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_001016_812280_B6765D43 
X-CRM114-Status: GOOD (  10.41  )
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
by David S. Miller <davem@davemloft.net>:

On Thu, 26 May 2022 11:02:42 +0300 you wrote:
> The "fsp->location" variable comes from user via ethtool_get_rxnfc().
> Check that it is valid to prevent an out of bounds read.
> 
> Fixes: 7aab747e5563 ("net: ethernet: mediatek: add ethtool functions to configure RX flows of HW LRO")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: out of bounds read in mtk_hwlro_get_fdir_entry()
    https://git.kernel.org/netdev/net/c/e7e7104e2d5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
