Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 10:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDJ5XQGvym2+0vZKfhW45VAgo6BeBGU3YvrYKT2E+nw=; b=2B4o+ApM/URm9/
	PLLyOMh0TPbaoGuhhHNPN7veeUYdcix+cSRofxPOR9EKaKBC7CsHpC5MZY8BK716KAoX0rl+x7qqa
	b/GRdox3UbWACwwIH89pZa1sKohPPHmDaCaGSxphMri7j7BdNYjKdwDRkgNLsbK9l1i65ea2CISip
	FIakPKlVWItNDkhtPY7+iALPBZILI3IEKGTf4EAVAVYneK7kNmkVxPZIYn0pWMi02BISpCHx0hLCo
	YCyqCAssK+pw9M7qlKsAo7Yr9y03QqgPnx9GsJkNRYQ5goNFsBb60tGChTCdfkLgtyLiFmNf2lh9i
	ezQhPiEYSu2ajzllHQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWyZG-00DN66-H5; Wed, 23 Mar 2022 10:50:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWyZD-00DN4V-2i
 for linux-mediatek@lists.infradead.org; Wed, 23 Mar 2022 10:50:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB5EBB81E79;
 Wed, 23 Mar 2022 10:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF5BDC340F2;
 Wed, 23 Mar 2022 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648032611;
 bh=0nZK4AfBZIKQRvSrQXHV2JkZ04BBuYgWS/yp4rPQSGE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=t0mn2e8kRqoW7iDenpOwqcqN4qagYeQe4WMUtS6V+eOYPZHbOmCuOa4cyVfoQfzCS
 G2hGSSUsGxqeIzRE2JE9z1OWgOVL5ln0qdmF3zJsBjeBd8sBU+1GHQW6IGEW0RZCi4
 CabmeBsZsQ9D6KLx8BkXs4EDX275841bGvRLxBSgIrGejSeIDGbPk915myQ5nJ4K7K
 t8ZcLbfKxA1S/+JYUkvM7av++0h8Zjc5Nf1pTEm0NS08b/9y4JRphgTOhnSIEtU4Dc
 lr6Yqn+37t0/EQ44Py5x7oCujWU4G6QtZxMICfHIJFeegueNbTAvaL1V4QTiMUkCKB
 RtNbeZ2W8sQyw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9257AE6D402; Wed, 23 Mar 2022 10:50:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Bluetooth: mt7921s: fix a NULL check
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <164803261159.27387.13243818190116041496.git-patchwork-notify@kernel.org>
Date: Wed, 23 Mar 2022 10:50:11 +0000
References: <20220323074830.GA4639@kili>
In-Reply-To: <20220323074830.GA4639@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: marcel@holtmann.org, yake.yang@mediatek.com, johan.hedberg@gmail.com,
 luiz.dentz@gmail.com, matthias.bgg@gmail.com, sean.wang@mediatek.com,
 markyawenchen@gmail.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_035015_309199_B1E2EBC9 
X-CRM114-Status: GOOD (  11.87  )
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Marcel Holtmann <marcel@holtmann.org>:

On Wed, 23 Mar 2022 10:48:30 +0300 you wrote:
> There is a typo in the NULL check so it's never true.  It should be
> checking "*ven_data" instead of "ven_data".
> 
> Fixes: 3cabc5ca2c9d ("Bluetooth: mt7921s: Add .btmtk_get_codec_config_data")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/bluetooth/btmtksdio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - Bluetooth: mt7921s: fix a NULL check
    https://git.kernel.org/bluetooth/bluetooth-next/c/864cc8a234cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
