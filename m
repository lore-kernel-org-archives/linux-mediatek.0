Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B712CC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 09:21:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B7BC60F14
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 09:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B7BC60F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4Oqc/TFNpoYGd0cK0OccZk6NEbaTXL+0mj2BevuN8M=; b=huRzy5CXIT4YzN
	vT87c1C76mwSnR6pOfVur/I6QLKPc+LB8BlWvkufTrEpNME0CKvozzEZSnV7DAAa2wg75QunhnJqc
	amhKmYyAGh3hBBVqijUO3GGXkqp8EhetKlnufynI5Q311nHp1+NxjUhyjVw6CdYik1+wXx73Ksw9u
	u8enPHQBh0WtlaEbUkad2Nutk6reu3auhmtV8tQ6vvzTpO2GojZRQd/YEIRUglimPoyCvfejJxBrj
	AxMjWM97+nFS2GvgfRrNhV4gX++tL64SaspcafEizfP5hMhnsoQlNe/pCn8T5JDoqNSpwvwFzTziK
	DP7LzZ+FKFS2En3p7iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBD5b-005OMw-7L; Wed, 04 Aug 2021 09:21:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBCuc-005KOB-N1; Wed, 04 Aug 2021 09:10:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id BADC261050;
 Wed,  4 Aug 2021 09:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628068205;
 bh=MB37BoflNXbs9FH9YcZB2Z2pMR25pzrNeNuYx1/iBBU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=t68VeIp3hOUBKxWiS0NxNof70QR57kqqiqsaaGC/pSULVh7NNiGONmTnWOW+kO+6W
 u8owK+ofVTJ+lSzRcj56tBUCytWn+E1kNvAdl+iD8fPw8CKttz2fYnkDzzVG0GAYss
 N62v0D/8BQWYZqr29/jTIautFQj1oJ8EqgtkqCNJnig27wgedGF5cUP42fbrJo/t1E
 c7xOD2etOkMan4mwAStQjv9W8bSj9vf1lhBsaAmDYm8cxUDCqd0hGzH/BHMhkrp8B3
 hOqL8cdfGtkXUWh4fB5Uo/bfOjIzCLXUFVocxcLHjIMX+6hBmd6KB/ES1vQEsEhEY9
 YibzmYJXLOYyA==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: add extack arg for link ops
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162806820573.32022.14403323895648321150.git-patchwork-notify@kernel.org>
Date: Wed, 04 Aug 2021 09:10:05 +0000
References: <20210803120250.32642-1-rocco.yue@mediatek.com>
In-Reply-To: <20210803120250.32642-1-rocco.yue@mediatek.com>
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: dsahern@kernel.org, davem@davemloft.net, kuba@kernel.org,
 yoshfuji@linux-ipv6.org, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, rocco.yue@gmail.com,
 chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_021006_834283_6DFB5672 
X-CRM114-Status: UNSURE (   9.68  )
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

On Tue, 3 Aug 2021 20:02:50 +0800 you wrote:
> Pass extack arg to validate_linkmsg and validate_link_af callbacks.
> If a netlink attribute has a reject_message, use the extended ack
> mechanism to carry the message back to user space.
> 
> Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
> ---
>  include/net/rtnetlink.h | 3 ++-
>  net/core/rtnetlink.c    | 9 +++++----
>  net/ipv4/devinet.c      | 5 +++--
>  net/ipv6/addrconf.c     | 5 +++--
>  4 files changed, 13 insertions(+), 9 deletions(-)

Here is the summary with links:
  - [net-next] net: add extack arg for link ops
    https://git.kernel.org/netdev/net-next/c/8679c31e0284

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
