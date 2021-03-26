Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3A4C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 23:01:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A98F61A28
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 23:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A98F61A28
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MltsVstf5M5VP1UHzTSD0F6K2exdjX0ZT7C+/Qpt3J8=; b=X4nor0r6la+G5NuQx9zbCysud
	e88G55h5wzFh8YH+EsLy+DybYKgBvO+eMzJVzcgUHI1Hoqe3rNR+COwB8yrxULUbnVZaYwjtz0jFW
	ETeRIZbaV00wumy/rs5zfzyBhUaWhuuonSCfPNV1xBK0QIQRee5oyCGeMAh+Gfq6/Sa9ppFF9AW/S
	IaRULhxvIgKghuWK3//4qi8/5ky1dgeFnD09i5JwYHiob2oPT00fVA6L/yPrPrgmtbs5/TtdMkmr6
	eEgvqAmRMXiU6nBONVn980Aoar4zcrSar8pM/bL8Hx2doObLyRBPaFrlVmfulF4zWCD59z8aGEKxw
	ynm03Ux6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPvRf-004TrP-Fq; Fri, 26 Mar 2021 23:00:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPvRD-004Tok-Kr; Fri, 26 Mar 2021 23:00:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 9449461A21;
 Fri, 26 Mar 2021 23:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616799612;
 bh=6WtEF5UlVkpKu1h/9A8YKlArvdpJ5cgCBFw+HVMUQFE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=G4bH1F5506Eyg8ElIAcFrP2cylwjH+/EVw8bE3A90S8XCAFkieq71zGxslWUzvhd0
 sqLMiouDHizpwmw3f8V4UGxoUDVPFzuMwrcPYxikMGPAYDfhACOvqS3EJ8YE9faCDS
 Oc+YzhJhhaSvlWCAFSb0O14mqJRppiwloVsOzPAQHp69XHOkJxZkuPY4qPiuDsG/4g
 thgpQRflFFWwoUQhmjyaBvG7DR5AIUYP2hjxtt/piu8sRnSViTBFrM2pRRDtztZwiN
 5/4cSoEWwho+PDz7/3EfFIcsQ24vCvcC89ikC4BeNEv4fjshmR6VTuug3w0uPUxdle
 cDZVo6l+muzww==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: ethernet: remove duplicated include
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161679961248.14639.5462729926726566402.git-patchwork-notify@kernel.org>
Date: Fri, 26 Mar 2021 23:00:12 +0000
References: <20210326024046.2800216-1-xujia39@huawei.com>
In-Reply-To: <20210326024046.2800216-1-xujia39@huawei.com>
To: Xu Jia <xujia39@huawei.com>
Cc: nbd@nbd.name, sean.wang@mediatek.com, kuba@kernel.org,
 matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org, hulkcommits@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_230020_502859_386C88D5 
X-CRM114-Status: UNSURE (   7.07  )
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

On Fri, 26 Mar 2021 10:40:46 +0800 you wrote:
> Remove duplicated include from mtk_ppe_offload.c.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Xu Jia <xujia39@huawei.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - [net-next] net: ethernet: remove duplicated include
    https://git.kernel.org/netdev/net-next/c/aeab5cfbc8c7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
