Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E357FC47080
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 05:20:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70DFC60FF1
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 05:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70DFC60FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqrBUQVNxvl7MeHSz6O+Ivu7RtgflVXHu2RbUIofxTE=; b=y4KyuJ6bOfiYKk
	7/qxu5BxripH2vZbVQlR13NFpu+RG8pPsZcnjTdDPo2Fc1zDqmTgA8JJT1M+gLaxTrpajuH30eiyU
	Q6p2yEXLAYsFS2eyHwD56iadKTsHRb+Z0ja+QHbGOcveyvIx3WnY12J+IyH7sgu5VmKSotthgB+RF
	LRFdo8AxRSpZKyk35wmDTdEk5bni2QNYFxNC8+dsV7GVOeu6ca7kllXO3URWEbNmFM1/vjPkRyB4Q
	d3zbLApfBvmt01jG9F90u/QxsEoGHG+4BjvjzGIQLyGeZ3s3wq64o6VNYcKpPTqaFDxa8jcFS8qak
	XFgLBdfnRVRMl029xl8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnwp9-00EgZt-OP; Tue, 01 Jun 2021 05:20:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnwow-00EgX3-9K; Tue, 01 Jun 2021 05:20:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 13D6260FF1;
 Tue,  1 Jun 2021 05:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622524805;
 bh=CzQags+F5o0/Apoy9lwYQTIaCJ4cyLY+pvrSw4+O4dE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JMB1npHKHWLmXIsHpQXFs461Xut8UoM+wHIoL53z1PxZklui3+L7cwU13BRauA9Xt
 IPIHTQIsESpezW3sJosXKybpbBVFX9y5veZ7gRY+T2VMb4b6mdVfi0jX11ZFZrxuM1
 68YkEJx8oQZkzdXG1O1mkXa3jEaYVA0BVoOFFsy8FCwo5UUnszcPaZ+6ZRe2AS9GaQ
 5vmOmLB9oD2vJP7nATJ8whxefuyO5CRnBnc4Ul9raY0mkIoffxNaZjCz4Z3Xgt+bH7
 DstluKNoqCApShnO5KJtZQxq2zmsWuOVtk42WYEN96PV9l2lHC1PXbPb+eMburBTLE
 I6mBAg7dXxuxQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ipv6: align code with context
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162252480501.23898.10631295560871610587.git-patchwork-notify@kernel.org>
Date: Tue, 01 Jun 2021 05:20:05 +0000
References: <20210530113811.8817-1-rocco.yue@mediatek.com>
In-Reply-To: <20210530113811.8817-1-rocco.yue@mediatek.com>
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: davem@davemloft.net, yoshfuji@linux-ipv6.org, dsahern@kernel.org,
 kuba@kernel.org, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Rocco.Yue@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_222006_370527_23448466 
X-CRM114-Status: UNSURE (   9.84  )
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

On Sun, 30 May 2021 19:38:11 +0800 you wrote:
> The Tab key is used three times, causing the code block to
> be out of alignment with the context.
> 
> Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
> ---
>  net/ipv6/addrconf.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Here is the summary with links:
  - ipv6: align code with context
    https://git.kernel.org/netdev/net-next/c/12e64b3bb9a8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
