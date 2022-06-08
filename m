Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1FFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 04:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xF9w5RUuziDXIqsjR5k4wgroaupAJu8YUd5Xxz0+AGU=; b=BI1L4utTnluPTR
	f1wiHC8+Hv4Rv6PwBFYnnCTg30ySS7wrSVQmPVy80gdl7ScjW+jtEowiDkZuU3x1ACBQ13+7JpYXN
	A1kD59tCc2+8qQklSoZputMzku91fgCNtzlBj5aF3hVTEcCZbYdyOl5FvEkIzsCziaCuv+tEbbSyN
	PJBV+h9WNKaXjVEUR2ETX9FPPKy8wrgdzv9WO2KGkIb0JMHbQ4FezhqC14IFB6A+9u1QbsoTDCLNn
	PRYLE0mdVSj2LVIlVyEFUa6bEBLYn6pioRkQ+Q4MbVNrfizThe6wUUSLVmp3wtnf9tlPn8LMe9d4s
	OGnpzTDxlge2Ua4/FP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nynUT-00B3UK-KP; Wed, 08 Jun 2022 04:40:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nynUQ-00B3Tv-Ia
	for linux-mediatek@lists.infradead.org; Wed, 08 Jun 2022 04:40:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id ED73BCE264B;
	Wed,  8 Jun 2022 04:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCD15C3411F;
	Wed,  8 Jun 2022 04:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654663213;
	bh=o8KKfyujSJ6MuGuTHIV87gs02dgmDj/K8UfuWaCC3K8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XD8TGZZYawk+yUBZ2cEjlVFDkbwv5voagW3YKkYRQP4CaxreLTn7hOiq79S7nVpYP
	 PlDG/Fjw/3QLzm23RJ//pAfvk36cY7lBHV79Nh0wnDrONAXKQ13vVRDktgi0gN4R4U
	 JBaMG9m8od1OqJi90oCCqIf73d7ZqbNmxdSttchdjjQIbAsdWlpCt7M+Y2dsR+BYam
	 Lm1VE5mQg1PVlHfIlm/rE3IZhxUheUL93b+f9Kru6IopINJNpORZFIRZ3O2pTwCIN6
	 QBo3+9ZTB0cZ1m+jEAw9RRBSNfFu1NCjSHmNSTbz5oBlRqT5aMrtvaaH1WC2t2QAXp
	 UN4g0eyz7Frqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C380BE737F6;
	Wed,  8 Jun 2022 04:40:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: enable rx cksum offload
 for MTK_NETSYS_V2
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165466321279.2228.5866925498609293271.git-patchwork-notify@kernel.org>
Date: Wed, 08 Jun 2022 04:40:12 +0000
References: <c8699805c18f7fd38315fcb8da2787676d83a32c.1654544585.git.lorenzo@kernel.org>
In-Reply-To: <c8699805c18f7fd38315fcb8da2787676d83a32c.1654544585.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 Sam.Shih@mediatek.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_214018_831825_B9A0C489 
X-CRM114-Status: UNSURE (   9.19  )
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

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  6 Jun 2022 21:49:00 +0200 you wrote:
> Enable rx checksum offload for mt7986 chipset.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: enable rx cksum offload for MTK_NETSYS_V2
    https://git.kernel.org/netdev/net-next/c/da6e113ff010

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
