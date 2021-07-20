Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA37C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 14:10:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1A5D61186
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 14:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1A5D61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LcBLvxEE5BweNB+OlWDSnI/7rh64uRsD7AYmfP/lqr8=; b=EhA4NEl49Dzam7
	rLIdbakMQmrZnpqobSv4dA6g2aK1q7KyMvmwOGg52ah5xdxH08I0arUJ/GKsFUEqa77e59I7YUbS+
	nAX2KkBXhmyI1dAW+ap8Uuz8hBE8VS89UQlTiYF3U7itTPwvongwv+XAEZ38oDfYsPBssXe5sA0v6
	kEr31UuzxPr9hZ9rQMmYGkaRVxDV9LDPbdhloLlSAUYFG6HiAG/HxbD3DGfXUAn33hEg6plZBPJpR
	o2K6RLH+9+zL9ppca3yncVep6tVsA9wko0F4R+us67sJQqDIoAgOLk4hJB51W2LCoXEtP1ocHqxaX
	QZwSWhqqL5wDUQctq1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5qRt-00D6va-60; Tue, 20 Jul 2021 14:10:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5qRg-00D6tv-RA; Tue, 20 Jul 2021 14:10:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 7347761164;
 Tue, 20 Jul 2021 14:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626790204;
 bh=Bd5JuhPoUZKO+A7WZ4bG6yZW93bX/sNKIzmRbyAgJVg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=H4ItY9JHQjrai52JKIlz1JgnL7038sMkbsS+bm/cfY6aoBC8bucRJNi3WCqeakeNo
 MV8dXIeQd9yGSKry47TLsaSHY3s+/kbfjn23gLc5rp4yYnQsLe0LRzYbcHU79V7tQJ
 KxXJsKItwgabLk8bfHk5/ZfdEiGv6mhzqtVTOTH0tQs8NZmjmPz2WDla6iV3WPs/0B
 +oPcffLIMj9fAvHAzPxJAfeXyzXyPQDsdyl4D0ZvOQLwPaq0zqRLyvIYyMOk2HF/Ij
 vFPIjRjoMHsgC397/KhkqxAMR1c5po3f78DBO973FQcEerkvaML47NLtdTnY2aMex2
 MFq0PYajT4fbw==
MIME-Version: 1.0
Subject: Re: [PATCH net] mt7530 mt7530_fdb_write only set ivl bit vid larger
 than 1
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162679020441.11280.8855545832870036826.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jul 2021 14:10:04 +0000
References: <20210719182359.5262-1-ericwouds@gmail.com>
In-Reply-To: <20210719182359.5262-1-ericwouds@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_071004_939844_A1593E1F 
X-CRM114-Status: UNSURE (   7.23  )
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

This patch was applied to netdev/net.git (refs/heads/master):

On Mon, 19 Jul 2021 20:23:57 +0200 you wrote:
> From: Eric Woudstra <ericwouds@gmail.com>
> 
> Fixes my earlier patch which broke vlan unaware bridges.
> 
> The IVL bit now only gets set for vid's larger than 1.
> 
> Fixes: 11d8d98cbeef ("mt7530 fix mt7530_fdb_write vid missing ivl bit")
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net] mt7530 mt7530_fdb_write only set ivl bit vid larger than 1
    https://git.kernel.org/netdev/net/c/7e777021780e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
