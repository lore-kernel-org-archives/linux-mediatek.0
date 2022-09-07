Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68309C38145
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 14:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYwA7Pl+NcFl602gfmR1HPLtktWSL+9G4eQRx66bSvw=; b=lP8FHvpJCF7fX1Zi/Rkj8AsHts
	zEMyRrxbUBpc80ywZzwygfl5EQWw/POkW1ovBkhP1/WQu+xBREpQ+oOFbOUMXNRQiBumH9zzDyqp5
	q4eZyxsXyRjVvOGq0Qp0HX8BVeI4bVYUUBkSNoHktEEiE4b+rX3zN4IdRSVPhAtkDyekQQ7mh06DY
	+YeRNQtcp1k7IivoKKESbTvL/LJOtNDpBcq6xj+KkvRwYYpcvREKbo8iEsQn85JMkDvLnZw748uto
	Z9DHl0tTlWRJSFBhEXaqDLVGqQi0Kzw65ZTnX5KkoGLJUxIzlBafYiDmEPP490kGPLwYSyfPqMaR9
	fTSIoDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVw8l-006wT1-LE; Wed, 07 Sep 2022 14:34:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVw4J-006u87-IL
	for linux-mediatek@lists.infradead.org; Wed, 07 Sep 2022 14:30:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C8AB6B81BA9;
	Wed,  7 Sep 2022 14:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77490C433D7;
	Wed,  7 Sep 2022 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662561015;
	bh=4ihs11fEXAe0fupBdMm7BL1byS2jMLCkSSEWmCDE1rU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PLADQG9IV2MRbhBDd+MED4HyFgnuM/i2oNX7C7yUf3eHG3rQSCIAT1hW65gS9DagC
	 +BG7utphkTU8Do92sUZvE5lQzSw2tHyawv7/E8i0nTRFE1y0YI2ju9aPcnF034pJ6p
	 1OKE6aDI5rjKiCIDr2enbzESERpWCjs05mEt5Zd6+pHp3Y0JHxt6H59W5yya3MqMzq
	 cSWb5hzMI7sFr9N3v66KehEGkI3SEedvwfJKJXL2Jw9TgTJgo5gyWUpPB/QnrUwfi5
	 /DSq0BspPuak3FPQkBoIMKXB2dsiZkUitmuZ/QNm+PFXq5zN6eLoyouUvhe7AbDmEU
	 csDokTrizmfmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4771BC73FE7;
	Wed,  7 Sep 2022 14:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix typo in
 __mtk_foe_entry_clear
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166256101527.8164.10142384574894849240.git-patchwork-notify@kernel.org>
Date: Wed, 07 Sep 2022 14:30:15 +0000
References: <6fb6f748b78faba37702f4757e5b3fb279eaf5ed.1662474824.git.lorenzo@kernel.org>
In-Reply-To: <6fb6f748b78faba37702f4757e5b3fb279eaf5ed.1662474824.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_073019_843637_0A5A6F46 
X-CRM114-Status: GOOD (  10.53  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue,  6 Sep 2022 16:36:32 +0200 you wrote:
> Set ib1 state to MTK_FOE_STATE_UNBIND in __mtk_foe_entry_clear routine.
> 
> Fixes: 33fc42de33278 ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: fix typo in __mtk_foe_entry_clear
    https://git.kernel.org/netdev/net/c/0e80707d94e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



