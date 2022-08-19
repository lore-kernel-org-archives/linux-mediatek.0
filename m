Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5D6C25B0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 04:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CoS5eHNnQZjcPA50q5WBrCtNDfv+A/be4U3keAM8ug=; b=whzD+MNuR12i6QLwiT73fwLJFx
	sjak6V6/SiOHKXRpS0HW0PW60sk5BXQ38+mpDmtPo0tP6bVR5FHtwMyDwOcDEuo6ZVQTkjPwkN4zy
	B4xMbANMUXOHjfYStmVv7EQpF2EyZuG/tqhyNJZXDSlDHRh/ETM0xn/OY9DEvRGHdkcCldfPkWusB
	MR4p2PfSzk+kIT/oInpl7wUTAqApRvh0Hmzy0umGGHYlFxTwbmIpHXcWxvbO5IyUgW4J3Q9AxW3PR
	w20ToJCy9wjJTnRI21rPpv6oMlHEAQgUnNI1pLq9vtGNgkZYLlQJUkR/n9U1p0vqLRcNc+yjshHBF
	iuPcvdzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOtBz-00GtPy-7m; Fri, 19 Aug 2022 04:01:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOtBv-00GtGs-Jc
	for linux-mediatek@lists.infradead.org; Fri, 19 Aug 2022 04:01:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 948C9B825A3;
	Fri, 19 Aug 2022 04:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9FA4C433C1;
	Fri, 19 Aug 2022 04:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660881656;
	bh=Mi88JNUIm06sZH6TJFwbkFdAcMiiOAxRt6mUAh0OcWU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CL4wEBuumdmqIuofvYxPRhp/77N5uEWsVvkWZWAl4ri8NXjCWUuiaIeK7L2CVgfx1
	 PIJg7XmmOV5OwK02lKgcxHrNpjlnBr6J877Z24Iu8oDy6yiW8bDcqujADXLQhw528A
	 U5jDv7ll0B66GcwaOYd54qcrp9XkyiMcpXur41Qgq/yfLdMfM+jMqkFfh4mBdGylzx
	 ifbTSHptZsuVKPZpOpDGMtsodJ5rYbG+w8tJduiT4l2Q47fAVscMHsrj2mcA7foJc/
	 EwJ7XQC2fYdr1eaCn/sDaIDDe28O8BXLUK4pESeq8KuIjwYrz2keMlazrWY9eclROQ
	 9xSoJxp/NBe5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 86DACC00444;
	Fri, 19 Aug 2022 04:00:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: remove unused txd_pdma
 pointer in mtk_xdp_submit_frame
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166088165653.14408.940092514189359177.git-patchwork-notify@kernel.org>
Date: Fri, 19 Aug 2022 04:00:56 +0000
References: <2c40b0fbb9163a0d62ff897abae17db84a9f3b99.1660669138.git.lorenzo@kernel.org>
In-Reply-To: <2c40b0fbb9163a0d62ff897abae17db84a9f3b99.1660669138.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 ilias.apalodimas@linaro.org, lorenzo.bianconi@redhat.com, jbrouer@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_210103_860621_39F8D934 
X-CRM114-Status: GOOD (  12.10  )
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

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 16 Aug 2022 19:14:30 +0200 you wrote:
> Get rid of unnecessary txd_pdma pointer in mtk_xdp_submit_frame for loop
> since it is actually used at the end of the routine using latest mtk_tx_dma
> consumed pointer as reference.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: remove unused txd_pdma pointer in mtk_xdp_submit_frame
    https://git.kernel.org/netdev/net-next/c/a64bb2b08623

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



