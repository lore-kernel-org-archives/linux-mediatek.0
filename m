Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3472EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 10:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WmD2ZbzTN/Vtlg0T92d2GxGh64ySTZP6ZkP4sc1nBw=; b=S7NTS4kC9glcGh
	RJL4duLEiDK431BO85KY8CNNK2N/OkQU6YRaP+D2AXskZDYPEYMRNnehJ3Ypbxrbt184o/93PnAiU
	RODbDcTF/1Hui+4oH5mBECuuQW5+GDKoRxlJXdt/wxpBr844pfPxqfUgSGsc35q/oW14iqqXHQ+xn
	12wGEcmU0BcjiKy0g0gqmYJctjEeXos9oHjPhMXK0Lkb220iL3TNEiwd2D/QNqrC016toZjfprbN5
	+EtVGPPy3IDuRhKl8ALhGW8CRyJmg/OJhIx6OnZAcYZe8y3YuQa9Nd+tfw52CjpJcImP3yZHzysiu
	WcqdubpT73CBpbh1YyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no0Cb-00De19-28; Mon, 09 May 2022 10:01:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no0Bb-00DdX2-Td; Mon, 09 May 2022 10:00:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8AAD0B80D3C;
 Mon,  9 May 2022 10:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49070C385B0;
 Mon,  9 May 2022 10:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652090412;
 bh=29mSpAua4b8hjk9GKvTkGUR9JajuXItC18hWIP0Js8A=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=O11DO6mYOO600sMRMllIbjLkarWSnk5FMiBm79/PWIWaAuiYSyCCavJbhm0hg+KzO
 DQhvNtMZW5ILPkNUbD5QfiTkLpLy2r8rN0C4RFyBUFqWqEyq0PHK/vo4GSiPM9XEIO
 4ftwcJxqiiW+g9c41Dk/7ixHMPjSBQ+V+3VYAvp/yAkWglySpqoylz3rCT7ifKJ5rR
 9jfF5PMeSRvJMI1TDFZyug/E5Oyzv3EXur/Pryk6tj+c9MaiGqWVnUMDvtCgduQBMS
 u/c0O76qUzl4o/VEiQ5Id0B0eKAcdigpVH/e0S5/6MdV5VVSjbqPFjPWauHcBka19r
 eYmpP52r2ieow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 30B4DE85D8A; Mon,  9 May 2022 10:00:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 1/2] net: fix wrong network header length
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165209041219.866.7810964831911496184.git-patchwork-notify@kernel.org>
Date: Mon, 09 May 2022 10:00:12 +0000
References: <20220505054850.4878-1-lina.wang@mediatek.com>
In-Reply-To: <20220505054850.4878-1-lina.wang@mediatek.com>
To: Lina Wang <lina.wang@mediatek.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, 
 matthias.bgg@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, hawk@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, edumazet@google.com, willemb@google.com,
 maze@google.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_030016_151226_58FF8744 
X-CRM114-Status: GOOD (  11.00  )
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

This series was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 5 May 2022 13:48:49 +0800 you wrote:
> When clatd starts with ebpf offloaing, and NETIF_F_GRO_FRAGLIST is enable,
> several skbs are gathered in skb_shinfo(skb)->frag_list. The first skb's
> ipv6 header will be changed to ipv4 after bpf_skb_proto_6_to_4,
> network_header\transport_header\mac_header have been updated as ipv4 acts,
> but other skbs in frag_list didnot update anything, just ipv6 packets.
> 
> udp_queue_rcv_skb will call skb_segment_list to traverse other skbs in
> frag_list and make sure right udp payload is delivered to user space.
> Unfortunately, other skbs in frag_list who are still ipv6 packets are
> updated like the first skb and will have wrong transport header length.
> 
> [...]

Here is the summary with links:
  - [v6,1/2] net: fix wrong network header length
    https://git.kernel.org/netdev/net/c/cf3ab8d4a797
  - [v6,2/2] selftests net: add UDP GRO fraglist + bpf self-tests
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
