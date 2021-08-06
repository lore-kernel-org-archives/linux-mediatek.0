Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40889C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 11:10:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05A5961181
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 11:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05A5961181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYGWFgKQNKw0VUcQ0EAOr4/8vhZV5uY8ZvvueT5nVag=; b=goo7QNzTTzOQDz
	TvOevSQEcosMtJ6cKGh1C2+fDwkiMes5he/wDm8eiA0feIPcc8x1BuaQ707/Pgmagffu5NGemtkxK
	qDZBjjYfFYS44gRoo/SDipz0ElV/e5xURG+4aHQmDnSI7T8ZtSM6wocZF90uIN0UHjq9oI0Ve7E1k
	B5+DtO6LSkAw8RQtOEBk6lPHcipg7TiVvtP3ExRqXhSASQRYns/oi7hy8sTcFMyTwyW5wYpbjiITz
	lj9zwnnSpPLeIEuMugOAEQr9aamTSIREzlhkP5ecCDBCVCVSLthAHrGK5WqePrYoOWBrnyWanmFyn
	xF3xGCQ+9FYithGSD1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBxk5-00CEbt-RA; Fri, 06 Aug 2021 11:10:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBxjq-00CEWJ-N6; Fri, 06 Aug 2021 11:10:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id B128561184;
 Fri,  6 Aug 2021 11:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628248205;
 bh=Forx3ImztBpSG2TKZ1Gvy+15tskdGHf8cQn36yqEqVE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=N+vwUn7ZyTkosISZkElxXFKvIjlZHtRib32n8DB8vLb1jsLVZmkT1dSWts7QVwZ7/
 mEAPFKnsT2KiUFuXak7a+ih0MUi2ADEB4LySyc16J5KxVEp4cNO7swlEBgknxnl40F
 oIHK/hb6X+5Zacxfs3tM+xqqp+zGjtOxxdiknQkGAsSwekM6rP17P8C0BEGa90KUT5
 y53indSuv1t0dvV9Y7QR0b1rTyqwTkcSz4BuoPxfs+Uy04meXksPV1jJfs0d6hNswY
 hP3IXImv1MBLV1XiXI0/v2aOF6RFxy82MxmopEL2lj0pWvuzuEpbTu1NAWOONuawps
 EdjQ51qjjwOfw==
MIME-Version: 1.0
Subject: Re: [PATCH net] net: dsa: mt7530: add the missing RxUnicast MIB
 counter
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162824820567.31954.9014839863327381261.git-patchwork-notify@kernel.org>
Date: Fri, 06 Aug 2021 11:10:05 +0000
References: <20210806040528.735606-1-dqfext@gmail.com>
In-Reply-To: <20210806040528.735606-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_041006_813558_EEF900D4 
X-CRM114-Status: UNSURE (   7.90  )
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

On Fri,  6 Aug 2021 12:05:27 +0800 you wrote:
> Add the missing RxUnicast counter.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
>  drivers/net/dsa/mt7530.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [net] net: dsa: mt7530: add the missing RxUnicast MIB counter
    https://git.kernel.org/netdev/net/c/aff51c5da320

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
