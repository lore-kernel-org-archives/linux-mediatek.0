Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD94C4320A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:33:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0035061139
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0035061139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w0mMKqTFEF6VwqLFt914/7yHJf29Ol15Kputm5vHLSk=; b=ECNOTrZ9K9f8Xt
	iLBrd19+4dHaJNwQCO/rrwM9JZ4hgzno205lz1LbzwRg57vdmJOeKShobTkKGN478INb20Nsij40M
	CBpu7H9XP7bah8qzR0rbNDg3mevYdueFjORa6nfHUlSlHfHQ3RV1zPxuK9MhoDzYWqrgGC1ckw+Vz
	XXIY3wfxJfGfyRplu/ozKo2ya9OHbByU4mWUSoO0twEvU1/P2X/6xuACIeWOA4gdApLdDpNx+2Stt
	aXb9puZBwAWCyUx+7fI82giZtZw3AEMw7sQc/ojEynzvLDAKjrXHYqIA87hKeRm+Oiccr58C5x1VM
	EP1HwBo9rFAkTRGC0WPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIqDz-006Wxm-MZ; Wed, 25 Aug 2021 10:33:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIq0v-006QYp-IJ; Wed, 25 Aug 2021 10:20:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 1A6CE6121E;
 Wed, 25 Aug 2021 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629886809;
 bh=O6J+rHSYQXPSx/jFP12S7IvB9F9Rnmxsu4WHal3JfBk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=mfiF8rnrwSWnhZtl9cutMWs9KS7pJmd5V9UXYRN7mQojIGUEEj0CjoJiCAksH2gGc
 0sDQfSJWbdZVGaAccmXKEPWlqwXymTc75x25Dr4Zbwo2jHo5zu2jcKU3EodtTt5pzN
 EBkEO6WZoa0Oq3VXCkcN/aIepZDFzn8J8SZjOYmlkGI83HD1hQpk04xBbxomNsGd2L
 6r1jWY+NYUBDYDYSKBHb/ii6+h3gTq0INasryEjUcAGQhuEicTYTnaeiZsC7hTtX9i
 jxutHwxzd62N4hM7uryPV6HPGZ0IQo4zWVqcr4J3dlmXpEuvpcbdm2gxOAPeCEHHBg
 DbZMJ33tFlJpw==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: dsa: mt7530: manually set up VLAN ID 0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162988680906.8958.16937803471017689459.git-patchwork-notify@kernel.org>
Date: Wed, 25 Aug 2021 10:20:09 +0000
References: <20210824165253.1691315-1-dqfext@gmail.com>
In-Reply-To: <20210824165253.1691315-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_032009_657536_A9FE0082 
X-CRM114-Status: UNSURE (   8.19  )
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

On Wed, 25 Aug 2021 00:52:52 +0800 you wrote:
> The driver was relying on dsa_slave_vlan_rx_add_vid to add VLAN ID 0. After
> the blamed commit, VLAN ID 0 won't be set up anymore, breaking software
> bridging fallback on VLAN-unaware bridges.
> 
> Manually set up VLAN ID 0 to fix this.
> 
> Fixes: 06cfb2df7eb0 ("net: dsa: don't advertise 'rx-vlan-filter' when not needed")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: dsa: mt7530: manually set up VLAN ID 0
    https://git.kernel.org/netdev/net-next/c/1ca8a193cade

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
