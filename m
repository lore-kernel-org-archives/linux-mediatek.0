Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A054C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 03:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hp/5asQJ5185VENKtSsAXGoL/B/czVCdNmppvIAkkc4=; b=xuCONgooozgnvk
	5OBjM1+8Hnnwuio3gCFXKmWypfRzytPo5B0gFfDSZWVsrmcCt5oPsE6BXGyhc6dAZJaRXwYudLeBj
	0EngDqmzIGz8U2kaHJkfhuT2m2MOZTgpOEo8oahDRM0wSlJZlln4xVpW82iolGySU0j5cGCMur/bE
	JMpESb0jW1a5GbikblOCBnLqMFOSM+xU3dgZVhPSyRM/idw2J1FWYtVjgRc/7ZA+y2CYYqJchQ9z4
	QE+XLkWXynQEURy4mYt6zrDiVq4mhovliUTLaFtZ/AkmfG16A23j/o4NnDWQk97CiPHaJR8fibQ5g
	qJd/Msx718aaMunJFo+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myQQO-00CuoL-5q; Sat, 18 Dec 2021 03:30:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myQQL-00Cunn-VE
 for linux-mediatek@lists.infradead.org; Sat, 18 Dec 2021 03:30:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBD5E6248A;
 Sat, 18 Dec 2021 03:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AA17C36AEB;
 Sat, 18 Dec 2021 03:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639798216;
 bh=LlWR27ifykUcFxLkF45w16P6KXob+Hi7ufe9f5qDSdo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jTMV7IZ+JSyMGZBsb5g5+HP+xqivOVbkhqsg0o7s5m/n2ROXoIo0wMJtnEZpf7e+m
 jOnkQ/alKMBMaOiiL0RRZLIubnGkrXmqXr/flv89EL12lxdEp6DZgh0yw6DnTNNaIO
 x4VJtRsprIU3jW5huatEoehuFmuDbHRP7Axvu10aI8c3aIE0cNm/kri9vJa5vDbi3p
 Bdh8UwMUhUtJ9QXZm/s/9XqpPQjNJgUSfS0sSd1w7mDb8NOLevzIVks56t6U1WCWYY
 /XOasP08GLHXKb1MopkCjo3enO1uSPHCCAx3HFrKFkMAG21gMmT4j9VGbHCeG2dag2
 uVhgDEiDhdc8Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 77CC160A4F;
 Sat, 18 Dec 2021 03:30:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: mtk_eth_soc: delete an unneeded variable
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163979821648.17814.352129686915909366.git-patchwork-notify@kernel.org>
Date: Sat, 18 Dec 2021 03:30:16 +0000
References: <20211217070735.GC26548@kili>
In-Reply-To: <20211217070735.GC26548@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: nbd@nbd.name, opensource@vdorst.com, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_193018_092026_78299308 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 17 Dec 2021 10:07:35 +0300 you wrote:
> There is already an "int err" declared at the start of the function so
> re-use that instead of declaring a shadow err variable.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - [net-next] net: mtk_eth_soc: delete an unneeded variable
    https://git.kernel.org/netdev/net-next/c/ddfbe18da55c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
