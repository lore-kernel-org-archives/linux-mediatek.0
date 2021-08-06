Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D9EC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 11:10:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D0EA61181
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 11:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D0EA61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VC979zLefaWluT0lVSqqLYKV+leqZdyj/FXlX1L+a84=; b=rmBehR+NN+naEW
	YA6K01ZBbUXYsMAZa5Yn70EPuPuN1G4e8HjepZBuwclOhkLAsTJ2CCWgiPOK6cID2iraO2AylF2O9
	s6ctQzj2uUJmo3uRxtmybMij62PlzY9tvbJQS1dRo7xp4tFw/BtRbygcC4uwef8GNOqIMied6IsWx
	ccM+IUx2Vt+bpmpqnAsunO1BQj+1NGgL8XIkYIzzqNYJNIDBAFn3rhQVpCzgwZl8xP0Qu3Iima4+a
	1oUS8Ha6/WwuyuykJTPgOSOvSeEDk8beWoupdYEtFkW2YttIxeh2TxEu6cEzHhlaYLhWKiGzCiR1e
	uak6B0nhoXIPc69WdrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBxkM-00CEhw-78; Fri, 06 Aug 2021 11:10:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBxjr-00CEWQ-4I; Fri, 06 Aug 2021 11:10:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 52DDC611CB;
 Fri,  6 Aug 2021 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628248206;
 bh=DeksanZJAJuEFD+IWsvGh4MfBW0sx+VI60/yKXttqLs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KULod0S8Afp1+QRyPXhkekJZ1/Igf7aFRDI3982xYH03qXofYyI6RRBGd25eiI0gJ
 FVEf+MuSQ1RGatycHrkiQ1OMuxyRpI9D6dlu5JfPjvzlYA5jg2/IXU8T96Vfbxx8R+
 K/mtcrn41hrkFxw/ERhqA1Vq/XT/Oovy7i2uRWASgyPvu3DG7kHPAUWlgtgEgcsBW9
 kFk8qzekBQKZd0TNLavTkgF4eJ8u0U1Y6VpkQ3hiemvfPzWpLKN8dBYJfIygYJlRsn
 Vu05K29/jEG9IWXyyWC6X+E/scPoCnZTJrkQoGQabTSIKZ0xa4kooMbWcJozSgWUbY
 m7iu19R0fTpKw==
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: drop untagged frames on
 VLAN-aware ports without PVID
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162824820631.31954.9293662469034354478.git-patchwork-notify@kernel.org>
Date: Fri, 06 Aug 2021 11:10:06 +0000
References: <20210806034713.734853-1-dqfext@gmail.com>
In-Reply-To: <20210806034713.734853-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_041007_238485_09DE2548 
X-CRM114-Status: UNSURE (   7.81  )
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

On Fri,  6 Aug 2021 11:47:11 +0800 you wrote:
> The driver currently still accepts untagged frames on VLAN-aware ports
> without PVID. Use PVC.ACC_FRM to drop untagged frames in that case.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> v1 -> v2: Avoid setting PVID to 0 on the CPU port.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: dsa: mt7530: drop untagged frames on VLAN-aware ports without PVID
    https://git.kernel.org/netdev/net-next/c/8fbebef80107

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
