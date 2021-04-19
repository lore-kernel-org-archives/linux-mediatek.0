Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EDCC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 22:50:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE88561090
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 22:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE88561090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cMdUXXPdiizl3o99U4xqgtI12hv+2sqPh/vCWYCX7O8=; b=qhenreFZ/CLSIPD/TThyXbCrx
	M97+1E0Z258Ywd97H0XTnjpWCFOS0e3zcMcfH0jqp3zk96h8fgijEO0aMq8f4nHhYKV6W55EA+QFE
	MB0kjyfbiUx1rGRXqH7Bz9E1lgXGBr/TxMS+Up/uvTGVbfPUj+3e2v8hwQkDIG7Gem4F/3AwmV8dd
	5DY1gdyUvF3RMyKmjd+ZHTnTeGOlPfQtSpIXqpQIVQgUGxfNafAqw37d+Egwvtr893QzBleRpBjqX
	HVelXKwrriqin3PaLyo6n7oFVq1vfedsiwfqJZnN7KGHxcQNzWsuY+Req57XyImFo2/vY3oHuhcNb
	A0WzjHv0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYciq-00Ajmz-FJ; Mon, 19 Apr 2021 22:50:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYcib-00Ajma-NB; Mon, 19 Apr 2021 22:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:To:In-Reply-To:References:Date:
 Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=fHqNhmw3NM1DV1QPehNgVYkeocHiDVZqGDVyVyRDvvg=; b=xInNjwcS8/8WeVaSS6J1MyUeXb
 AtyxsIyPFhro+cu58ZnXR4V6t3xIKPvqgSfFnND6RJLsXOhb5kM2tRU8h+tDh4mkPQm7+XRT43Jpp
 NZ2ZCMQe0/i7yfTYa81USm4QWtukZ0rZYW3R+5BWBXJWeMNin8s50naaFBFLE5aQ/NjBaxMm9O4I3
 Pau15CI3RjQ1w0BBK6kPjmT6K+f9kLscFr/xxVxw1PM1zmtsoJdRLCTQDK7MK5tHFslugOTsWRBJL
 ofUzUJ88UQUiY8C9zmITYsiNdMhrK0F7HM9TIzC/lyi0LR52uwCVzqBDN/8mg4ZmWKA6OEEpI7oFt
 zOYxX5Gg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYciY-00BhQc-MU; Mon, 19 Apr 2021 22:50:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 0E6A8613B0;
 Mon, 19 Apr 2021 22:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618872610;
 bh=Jk/LkQJ09g29F/PEPEPO6oOekEBT5G3dcIDdlVgIRYM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GKzM1p0gk38IlZhfzTbxo8EH09Sdvv4mTcp9aoj7OCN++VgSeob51+McOqjJcXs5R
 ER29Q+vQy2g1NfC+XvidlZys4SbPzZ0gVPxwd0UygpWZzqtE82YZwaCicjWwf8MnjF
 jY3A97WwbITy4Ye18td1Tk+NXVtxbbpM7BgjuBJb+ahKvX01HVX96Z8Hzkqj+LmaO3
 umYWEAiGxjwIVzpW0vOlIo42pYZVZT4I0XjByMTlcoSmtrXdrOq09pUADBTtbGzPen
 NFOhdXHS49274NihvGKs4D2QT+fRBIJoyq1OzrvJ21gecGWJEiAGxKjtw41SO91Nv3
 pILtaj4xWUl/w==
MIME-Version: 1.0
Subject: Re: [PATCH v2 net-next] net: ethernet: mediatek: fix a typo bug in
 flow offloading
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161887261000.25363.1625251709846918967.git-patchwork-notify@kernel.org>
Date: Mon, 19 Apr 2021 22:50:10 +0000
References: <20210417072905.207032-1-dqfext@gmail.com>
In-Reply-To: <20210417072905.207032-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, pablo@netfilter.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, frank-w@public-files.de, d3adme4t@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_155010_781458_E4322BC5 
X-CRM114-Status: UNSURE (   8.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Sat, 17 Apr 2021 15:29:04 +0800 you wrote:
> Issue was traffic problems after a while with increased ping times if
> flow offload is active. It turns out that key_offset with cookie is
> needed in rhashtable_params but was re-assigned to head_offset.
> Fix the assignment.
> 
> Fixes: 502e84e2382d ("net: ethernet: mtk_eth_soc: add flow offloading support")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v2,net-next] net: ethernet: mediatek: fix a typo bug in flow offloading
    https://git.kernel.org/netdev/net-next/c/6ecaf81d4ac6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
