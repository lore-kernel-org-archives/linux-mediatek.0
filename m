Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5473EC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 03:20:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E320522583
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 03:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E320522583
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y31hCWSBTyex4dCnc6YaxuneNt8792rJCpIYY4Cdjjk=; b=O0vhkWc1tbvzWXlbqye2dYl8a
	3CY24uACiiY0L7oo9t9pO4i3rxnG0mrNYPpMvmp5h8bpXkGz7OPoArbfZxrhjoBknkf5ftXe5b+Mw
	rNnlEWdSU4PLLwnoYf1h2GVC9/BlfEzTASFZjIuvyaTiTzqUcaeMBB500HdzX+k+diChS61Oqn91q
	zJuC8GDOniWpzKSxsxuJOWRVDATraQ8VeFdOTV+Slvway1xBZFSdM0pB/aQeZC10in2SWhc0b4kLC
	gTvR5Bj/fdjfgXux/Qdpx96ViKqj1SERMg4tyL4z8C5+zKpEGYp0UanTtqZdfSxHVr50BJ7uv7t3t
	8AeEYo0+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Etv-0000UJ-7H; Tue, 26 Jan 2021 03:20:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Etp-0000SB-1L; Tue, 26 Jan 2021 03:20:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id DB294225AB;
 Tue, 26 Jan 2021 03:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611631210;
 bh=MfQiPkeY7Zub6JZJsjffsPcUfhKgD/9P0lXdNTtcJOs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=O0J/p737CKEKdWxc9G8BKateDJyGotX+Yp0Yv65wJv9Yw5PXPEsrckAC5iNbEza4X
 fEBD0sMBZteKZ7FKX2p/qFkCDRBuzQntmaIQmdH9kF2OIKQNzz31G/zpR9DhCaEnZJ
 BZjYcn2NgDtzXaqEX0FiaMK96JH47iv1FRSoDovfTFOGJ1bWHXVq0zkQwKiiZiQSu5
 WQzZopAuBR5nOzzjURwapnQd01VmrEuEHzyUxTbeTRckoUKSIU+3cKgLXu4Qtnf/1L
 1ycceJF8SHjWZWW7tdbKxk3ThVStJgjpemGEhYL6SC/5MqnxjP/ljiRTFnA+/yrRj8
 5iSdA71tt1SJw==
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2] net: ethernet: mediatek: support setting MTU
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161163121084.4087.12910254272532951713.git-patchwork-notify@kernel.org>
Date: Tue, 26 Jan 2021 03:20:10 +0000
References: <20210125042046.5599-1-dqfext@gmail.com>
In-Reply-To: <20210125042046.5599-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_222013_160726_BD19FB3B 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, frank-w@public-files.de, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux@armlinux.org.uk, Mark-MC.Lee@mediatek.com,
 opensource@vdorst.com, linux-mediatek@lists.infradead.org, john@phrozen.org,
 matthias.bgg@gmail.com, kuba@kernel.org, dwmw2@infradead.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Mon, 25 Jan 2021 12:20:46 +0800 you wrote:
> MT762x HW, except for MT7628, supports frame length up to 2048
> (maximum length on GDM), so allow setting MTU up to 2030.
> 
> Also set the default frame length to the hardware default 1518.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ethernet: mediatek: support setting MTU
    https://git.kernel.org/netdev/net-next/c/4fd59792097a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
