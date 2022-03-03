Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ECBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 06:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uiPdmWX6NNDyzLerfULDWemuR2nKp3mgiB16OfNkNZE=; b=gKKF52Yoj8kJzW
	UJAiumdvy23hP4iV1QdU8Uq6Oy7B7COKxKUnqPFSBGOuSDF5yxiB6EMfd6V/OguPERYQOuAUmY3FW
	AiSK2qQMk7trYnVMjlDbrKlivOhVG4Wh8WwFGWQw35BgqZuQ/0NAZeP/805bKpnwb4fKcLNs183Gr
	J63BcF4ki2ziQYQOinbfZV+sDA4fT7WvWEqV8Bathlz/jDU0GOyld8fsF0EjAajkHc5hFPfFLbThx
	tEC+Quf0qoo2sguuPzPVYn3Dnd3tBmOjs+nLXTGxwaEQuhvOQH0HPS/uRChzHX/LzHt6PZixSa/dt
	AUBNGCeRDZJDa8fCMOzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPep8-005JsC-6s; Thu, 03 Mar 2022 06:20:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPeov-005JoP-S7; Thu, 03 Mar 2022 06:20:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E5C37617F3;
 Thu,  3 Mar 2022 06:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C9B9C340F0;
 Thu,  3 Mar 2022 06:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646288411;
 bh=vX5vbaikPiileJ6XCxRR8wC2/rB2/17rVCRkkZXIKbM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=I5HykwcBsuqO22vRlMc/9uFH6c6KUeLXLHK6HauHb789dDoFcSUKBfch/XKMBtECi
 IlCg1/RaWkjUHYTxNfstT0S1/qS8cZdCGcDTzfqq3DVfSeEIM+bzdMShsBq5ZJirOm
 ekz1WhscjoS5rlpiHgupYBr1vBwHvlsSV37vz1Gw6KSsj0TYsPfDrLZjjqrKm2rbta
 72iMxJvNRZAHwNW2THKEqX+uClBhKVjCavFVVamltNGmtAnb3PSQrzvfUMZU31vqq1
 ob/eFvZ0IH8S3yoUUyuVNfqHQbjFpxWdHGoiSWG9ZCw5lmBWWDKb8iC/VgrOJ/Xsgj
 bqIayr9gnyCgQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2C6CAEAC096; Thu,  3 Mar 2022 06:20:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net v2] net: fix up skbs delta_truesize in UDP GRO
 frag_list
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164628841116.5215.9483451947853237118.git-patchwork-notify@kernel.org>
Date: Thu, 03 Mar 2022 06:20:11 +0000
References: <1646133431-8948-1-git-send-email-lena.wang@mediatek.com>
In-Reply-To: <1646133431-8948-1-git-send-email-lena.wang@mediatek.com>
To: lena wang <lena.wang@mediatek.com>
Cc: pabeni@redhat.com, edumazet@google.com, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, willemb@google.com,
 daniel@iogearbox.net, dseok.yi@samsung.com, wsd_upstream@mediatek.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_222013_998234_9C3130B9 
X-CRM114-Status: GOOD (  11.73  )
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

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 1 Mar 2022 19:17:09 +0800 you wrote:
> The truesize for a UDP GRO packet is added by main skb and skbs in main
> skb's frag_list:
> skb_gro_receive_list
>         p->truesize += skb->truesize;
> 
> The commit 53475c5dd856 ("net: fix use-after-free when UDP GRO with
> shared fraglist") introduced a truesize increase for frag_list skbs.
> When uncloning skb, it will call pskb_expand_head and trusesize for
> frag_list skbs may increase. This can occur when allocators uses
> __netdev_alloc_skb and not jump into __alloc_skb. This flow does not
> use ksize(len) to calculate truesize while pskb_expand_head uses.
> skb_segment_list
> err = skb_unclone(nskb, GFP_ATOMIC);
> pskb_expand_head
>         if (!skb->sk || skb->destructor == sock_edemux)
>                 skb->truesize += size - osize;
> 
> [...]

Here is the summary with links:
  - [net,v2] net: fix up skbs delta_truesize in UDP GRO frag_list
    https://git.kernel.org/netdev/net/c/224102de2ff1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
