Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FC6EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJpWVVgNFDFGSwPz9bSH/7LnX7sKc5ufyiPgjBrjVoQ=; b=bLU8AGujzPSELPzVtkaKD4/nPC
	6WTvvC/PONAgPd/PDqpHPDTcTIao4UaWyt0bjyL/MsNIdGDzcqs4I0YlCsjgVbSqG7Gxlsp3XM6un
	ORFnZ3qhoxbxdrmpMF624AO2gR/8IiR829fA6YEsiowOopBhYLSLFMe23ub1Rx2eg9QHlle1SEXNu
	M0jb93G1EyPPqs/os3RcTCvXvt0kOz8sDp2/Q7PwmcO7hVA7UJBel7NygqrrKWrXQZn4dI8HRGfHr
	0j28r5IrUqwr+6KmTQHrD6MV+uZsR2ikW7iEp6aCnSsSChb/z/VvMs1Quaiko/Cup29CxmalueNHd
	N50T9YJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM17O-005zfG-22;
	Wed, 19 Jul 2023 06:57:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM178-005zOa-2A;
	Wed, 19 Jul 2023 06:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mJpWVVgNFDFGSwPz9bSH/7LnX7sKc5ufyiPgjBrjVoQ=; b=TfBpH+lnFpiYb0n4fW+hT7l/SC
	yHAuQrEn4lGTce9yLMkQc1MvIYZpbq/1an2g7eP+n/w7YvJupkddxKveT5wQL517qRPFkkuAd8QiA
	nMQNNFFJkcCJ/E70Us9n5W10RmkMDbcwBESqtAHfpstzrhmOpToxS/L+KNTrFZ6E2/XpeaMIuCGFZ
	z1zc3hViqyUlXtYOfmD6ZXCiRiuI32UPW7ZLg37FvcLZDfCIkdnC06iiQYO/qsyHJk09u7CmJ8xrx
	FWKRvXkrvnVT/q+BRkXuM/PrqTeViAFCpxoNrJb6Q3hm4jb8e3HgbNyGdT76GUgy2cXAz7kW7Y0Au
	3GyKEd+g==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLfdh-00BI6w-1K;
	Tue, 18 Jul 2023 08:00:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D066D614B4;
	Tue, 18 Jul 2023 08:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35DE4C433CD;
	Tue, 18 Jul 2023 08:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689667222;
	bh=lNuU7vFuvRCSkCwLvhhA5jM0tivFsuhgy/tJEQUCrFs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fyYosWK7+6ToIJGk78IKhuAdQ+/nq4t8MWCSvQVqp/AxiB2pxCXYTgdiZg7K80CZP
	 MIwZJBgs4VHTI+do3H43tOb3XNY6z5S893ltxj79lrse0wc92Nk9Ojg0YwcXZeljXK
	 hOVFXnbwyPMr1s+z817sOG7Of3JgqoAzKNTC+oai0uQHPjTwuJpVxyfvk98i2kxsqZ
	 gUIdv2I4BNN0zQIqFKrfHWEsztJVOBQln65Kgl5Y9tKBck6d37GNgJa274i+YLThGW
	 XNRThgTE4hwjLWO0LO+HXlt42YMj+TQ5aeqiePtORQyZF8p15jPg1Eo3+sqE32j3/m
	 VJt3m316V9nOQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 10A4CE22AE5;
	Tue, 18 Jul 2023 08:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] Remove some unused phylink legacy
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168966722206.706.5080340489033162242.git-patchwork-notify@kernel.org>
Date: Tue, 18 Jul 2023 08:00:22 +0000
References: <ZLERQ2OBrv44Ppyc@shell.armlinux.org.uk>
In-Reply-To: <ZLERQ2OBrv44Ppyc@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.belloni@bootlin.com,
 angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com,
 claudiu.manoil@nxp.com, daniel@makrotopia.org, davem@davemloft.net,
 dqfext@gmail.com, edumazet@google.com, f.fainelli@gmail.com,
 florian.fainelli@broadcom.com, kuba@kernel.org, Landen.Chao@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 sean.wang@mediatek.com, UNGLinuxDriver@microchip.com, olteanv@gmail.com,
 woojung.huh@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_090058_023113_C4913B5E 
X-CRM114-Status: GOOD (  12.92  )
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 14 Jul 2023 10:11:31 +0100 you wrote:
> Hi,
> 
> I believe we are now in a position where some of the legacy phylink code
> can be removed!
> 
> I believe that all DSA drivers do not make use of any pre-March 2020
> phylink behaviour - all drivers now seem to set legacy_pre_march2020 to
> false, and the conditions that DSA sets it to true are no longer
> satisifed by any driver.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: dsa: remove legacy_pre_march2020 detection
    https://git.kernel.org/netdev/net-next/c/a88dd7538461
  - [net-next,2/3] net: dsa: remove legacy_pre_march2020 from drivers
    https://git.kernel.org/netdev/net-next/c/8f42c07fb0f2
  - [net-next,3/3] net: phylink: remove legacy mac_an_restart() method
    https://git.kernel.org/netdev/net-next/c/76226787e137

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



