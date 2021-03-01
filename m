Return-Path: <SRS0=HsXE=H7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDBEC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 23:54:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC34F60240
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 23:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC34F60240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yltRYM53ffLLIgDpteFoWJY5yDAMhT/uIWGF1xchv7Q=; b=XxQNp3L4NDHRPHM7A+sXmUwxT
	duuvIf9lVvHROYNdsLPMILg3Y8qP1+EsNCQ1c9aLVoquqI3Rv+il1imPOD0AANVEwZVGlwxHkK3dH
	TnyQLtopFG6cyytk00icr70yd4k3rbXaFRCf8R2MGRqcXiHXx+fwwpUCFatSkh5sRKY3DfiaZdcRG
	+YvSTNSyoD4L9OVkhpxFHm+LSx9XPQjSJ1ZYJZPJb0kQ0MOEBfInn1KyWFFWHD8Jg1W5pU0q+W3WW
	9EqhPovpWhiyxVqBVjKFA+SxMirOcWLhNRFenUJQKloxksULIX6JDOYwCHF8ogIgQNVxf975ztgZw
	I0DVMn6MA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGsN7-0006uo-6I; Mon, 01 Mar 2021 23:54:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGsN5-0006uU-Re
 for linux-mediatek@lists.infradead.org; Mon, 01 Mar 2021 23:54:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id ACEC960241;
 Mon,  1 Mar 2021 23:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614642877;
 bh=4POY9hPulA7pZxJfhv2cwLhfelwQTch7J+hsYCBVSKc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=NXca2sdpTJjfREDpYr9rsEjLGkOCvA7P4woZcX9IKbtA6Jb44ffp3GyrDPEcK9/mj
 oCpqC7/ZbNmeuZa+11cJTg5rBEjuhB/RFOp7W9GgC/nUlqEhQa6qgWW3vGW5xEJJ5h
 N90q3ur9CX+e/khFoByoIhnLhmoTCQ1quz86oGBX+pRbiNjyRHkfA4l8NCoBE5R+8V
 kL6NNlIYAoYidpK6hwpCJTHhdLh+1iRe2GrzCqBRPiHA6S6LOQ4nqZ+nYyCwUrWoWQ
 z6fpCj7YZXxqwhrE73OM7GyvCAzBmnbOccQ8TRobn5Y3ddzK2BZxdUlxxnR5Xk0cRF
 aqVC15Xg7eHyg==
MIME-Version: 1.0
Subject: Re: [PATCH net] net: dsa: tag_mtk: fix 802.1ad VLAN egress
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161464287765.7970.7338802339733391563.git-patchwork-notify@kernel.org>
Date: Mon, 01 Mar 2021 23:54:37 +0000
References: <20210301160159.7622-1-dqfext@gmail.com>
In-Reply-To: <20210301160159.7622-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_185439_968049_7495D2F2 
X-CRM114-Status: UNSURE (   7.29  )
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
Cc: andrew@lunn.ch, Landen.Chao@mediatek.com, f.fainelli@gmail.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 davem@davemloft.net, iochesonome@gmail.com, linux-mediatek@lists.infradead.org,
 kuba@kernel.org, olteanv@gmail.com, vivien.didelot@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue,  2 Mar 2021 00:01:59 +0800 you wrote:
> A different TPID bit is used for 802.1ad VLAN frames.
> 
> Reported-by: Ilario Gelmetti <iochesonome@gmail.com>
> Fixes: f0af34317f4b ("net: dsa: mediatek: combine MediaTek tag with VLAN tag")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
>  net/dsa/tag_mtk.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)

Here is the summary with links:
  - [net] net: dsa: tag_mtk: fix 802.1ad VLAN egress
    https://git.kernel.org/netdev/net/c/9200f515c41f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
