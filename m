Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8A4C636C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:31:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5314961167
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5314961167
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcRgpj2fUVSFMmrGCbSXzYZJATrXZ62W53ZCxzLlgu0=; b=MlcMPOVpdYnbXh
	Gk0d4I7R5bKuaGJl0p2difNeZKBxkC+9xEPG9PXMZHqy2Huk3ch1GJviVlodBM9IdygELZy5LgN9r
	OvEoUpF9ySenNfrPJ6K/tO9gbND3/z2MJI4Z+cC3a0cF6L3ci5Q8e4aJaSTbiq82cJlzmwa/Qpxtr
	PNzN2CYB0bGzIwN3FBli6fwWpBaD1RWLxFRxw1Io3wiQbBjfcdNxLviPQeD5Ull4gcH1RU9BAhjOM
	USjSRnAIHCjudtcsmHyBxpXi2IY1TmRs1VewxL6/vHk4ZJj3r969k3sNDgVGaWVBZLw2nPOoo5cCK
	6liYOjelQQctIaTxHb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m45Cm-001jWK-0R; Thu, 15 Jul 2021 17:31:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m45BW-001j1E-BW; Thu, 15 Jul 2021 17:30:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 20B3F613D7;
 Thu, 15 Jul 2021 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626370205;
 bh=Flw15wMFOWTWZ7Do+OUNzQu22+yegu+u/76/RBpVfhU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ZguZuy3lQQkuS/6Fq0dHl9+jEgMhtzK+EGvgr4YT9CSs3WYP/OoMIdSSGHODf6p+t
 HeBszqG2XAb8MEF3f0St0AYHrWQUBH4HzIf7/sh0ZWkSSbRE9ixEMPiQHacB+3amFX
 UmaoIBTDzMFPiyclEYX7n9c6fAJnjFb/jfddlvnR1t9SRnxs2uPmaXXtwxbL8Pee6M
 mnQe4+0ic4Rvcnyc7A9TX8OtdckjrhqPCb4WdfH+LFqKScKCXAI9Lh/cYSzV0O5rSN
 ilxbEc3ID6nGETkQ2qnXO0H+HdyFqyrBGWkmEXmqkuDNlY76gCTFoyfFCE2yqbiSR9
 XsgYylndwlybA==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] ipv6: remove unnecessary local variable
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162637020504.11955.9930812995357254562.git-patchwork-notify@kernel.org>
Date: Thu, 15 Jul 2021 17:30:05 +0000
References: <20210715142643.2648-1-rocco.yue@mediatek.com>
In-Reply-To: <20210715142643.2648-1-rocco.yue@mediatek.com>
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: davem@davemloft.net, yoshfuji@linux-ipv6.org, dsahern@kernel.org,
 kuba@kernel.org, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 rocco.yue@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_103006_465251_CDF7FD7E 
X-CRM114-Status: UNSURE (   9.35  )
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

On Thu, 15 Jul 2021 22:26:43 +0800 you wrote:
> The local variable "struct net *net" in the two functions of
> inet6_rtm_getaddr() and inet6_dump_addr() are actually useless,
> so remove them.
> 
> Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
> ---
>  net/ipv6/addrconf.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Here is the summary with links:
  - [net-next] ipv6: remove unnecessary local variable
    https://git.kernel.org/netdev/net-next/c/87117baf4f92

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
