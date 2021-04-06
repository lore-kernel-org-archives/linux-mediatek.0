Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76916C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 23:30:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E2FE613BE
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 23:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E2FE613BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HJc+VmJw2Ot4hyQPXWyuE78+yuYwDAwhH+UV8V2vfSU=; b=AWcHIVkJG/dnig7iohdlsaLYw
	sp77CWyYYzzpgwHu5KfG/ld1DZnf7nZ0u+rAU+0TcPGLNW7JyF5eVKeGjw/0PBjhH3in9aa0/0wOe
	BKZjrK5C2MgJpwW+wQcHBszOzXY5cVg4nB6jsM5rbQl0lx2+x8DVHI6EViDt4bOs3qJQQjtYjOKB7
	pbWo82vooNFLkvtRhoeISree0VkvKyxNV/ezNzp7JNY4Jm5dJ0+WRx2Wf0VbmhsTKrzu+y7aY8c8h
	0cYPN4oraBrJvtFne6pm0LkrGnMXaEqrJz/+NnXSAEQ71+5YNpk2arLMUZ8ep7HVUTABAieqPRXqu
	rbrdK7kIw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTv9W-003cb2-Tl; Tue, 06 Apr 2021 23:30:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTv9C-003cZ7-5Q; Tue, 06 Apr 2021 23:30:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 51C79613C0;
 Tue,  6 Apr 2021 23:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617751810;
 bh=ZIUFsrMXmGIIHPw5n0/I5aDetMQFS18Ze+FEc3jJQjQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=D6FIaM2Pefyj/JFnRiRVFJGC09E4o8VZXp2EbNlRAKZPk2KOH7Zx1V+MCwu+6gNvF
 /E4tcVdAPANPtMZ7qYrcROXhFe4h40Px7k0HT7fW5LYN2NrMqn2upByNV4HTS7Dm8r
 rOrb6Od8ow87iESnVTqmIA40G88Hvbm5HT4n3MCCFb25uC4K5YDtLJdhRc1Op6rutH
 q4j0x9mrUIV6yvsXNnWcM+snkAD8kBVtmoX2WRQ+0esCaMaBCBVfqDm8yYm0GXRA6H
 WgegEfzfDc8ShT1H+C+1fCpjTd/3v2gOYS0KYl3XF6ipV0NwNjVgbqxfl6mFUsSymf
 /7pqHHXKgME0A==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: remove unneeded
 semicolon
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161775181030.15996.4622517435029624196.git-patchwork-notify@kernel.org>
Date: Tue, 06 Apr 2021 23:30:10 +0000
References: <20210406030433.6540-1-linqiheng@huawei.com>
In-Reply-To: <20210406030433.6540-1-linqiheng@huawei.com>
To: Qiheng Lin <linqiheng@huawei.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_003015_728946_11AF84F8 
X-CRM114-Status: UNSURE (   8.09  )
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

On Tue, 6 Apr 2021 11:04:33 +0800 you wrote:
> Eliminate the following coccicheck warning:
>  drivers/net/ethernet/mediatek/mtk_ppe.c:270:2-3: Unneeded semicolon
> 
> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: remove unneeded semicolon
    https://git.kernel.org/netdev/net-next/c/3b2c32f96edc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
