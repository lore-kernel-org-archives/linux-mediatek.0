Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA86EE49A4
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Sep 2023 18:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDCAj2yppIFdywj5lD7BbXiNjTCKcAO2uX6tq2atsSU=; b=HIFex22lrT2bJgEw+oankb4CTg
	4spW/6DzGXu8dCpS6P/LpnX+SQacUdESeruVlQbG8bv5bgTspL6tobM01OyF/RrjdioDHlvs1pDV3
	5du89ogD+C4dSLdiOciWPxlFv6RUlYyDVXcZoi8EtC1qcywfsQitaRfA5JsmRr1L2ZTkES7RumVPa
	4RNPAIjtB5bv73uuXVeWaNZclmMPTgmkBVXcfD/sISVh13BCc7WbeaNzg5Ozf+lPcJYwXEGnzFi9N
	zEfrDtsOMHfLGRBiPq0A6/LhnoBo73ANwftk1n17qUVU6MCDZGoivs0DlxJVKjuU16WubCYvmpuUc
	A61NAoBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfOjb-00GnnZ-0f;
	Sun, 10 Sep 2023 18:00:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfOjS-00Gnld-2G;
	Sun, 10 Sep 2023 18:00:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 55F8FB80CA9;
	Sun, 10 Sep 2023 18:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D277FC433C8;
	Sun, 10 Sep 2023 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694368821;
	bh=7pMVydPneVg3URKXwfaH+adzpHN2LLjVZsTSGuRN/Dc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WNCcNX0j78tRLBxMWD5xHUNdVWsV4X1c4GJprcT9133xluNlViXTJ+y1MbbMmvw4S
	 9l6p0mwmq1ciXkoHmtsYyK8lFvb1p3EVodnEbrR25eIRn+6jRHWBjTxm2wzjyRS6Mh
	 /jvEouU2JwW8Gm/EnKA/L+ncaZS7ANxE1SqxSdP9VAlRZQQbAQGSZNr44Pfjzomk2O
	 YmugA3EJ+2/4ZTwGg7O1MhyTBgt+SEpxLAiqRaqU5NrZ9WSluxkkNsOvrlaLWdV7jR
	 voEyBX1vKb3bWRjPhlJDd4v26hqNBBRPVghPsTewXgHu/u+K2aUEWjjrhAgY/J0FrG
	 nZp7NWsEXqO2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B8F74F1D6A8;
	Sun, 10 Sep 2023 18:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/11] add missing of_node_put
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169436882175.20878.16500068409286410519.git-patchwork-notify@kernel.org>
Date: Sun, 10 Sep 2023 18:00:21 +0000
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 rui.zhang@intel.com, amitk@kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, linux-mmc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_110026_901109_30651591 
X-CRM114-Status: UNSURE (   9.85  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu,  7 Sep 2023 11:55:10 +0200 you wrote:
> Add of_node_put on a break out of an of_node loop.
> 
> ---
> 
>  arch/powerpc/kexec/file_load_64.c                    |    8 ++++++--
>  arch/powerpc/platforms/powermac/low_i2c.c            |    4 +++-
>  arch/powerpc/platforms/powermac/smp.c                |    4 +++-
>  drivers/bus/arm-cci.c                                |    4 +++-
>  drivers/genpd/ti/ti_sci_pm_domains.c                 |    8 ++++++--
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c      |    4 +++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c               |    4 +++-
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c |    1 +
>  drivers/mmc/host/atmel-mci.c                         |    8 ++++++--
>  drivers/net/ethernet/broadcom/asp2/bcmasp.c          |    1 +
>  drivers/soc/dove/pmu.c                               |    5 ++++-
>  drivers/thermal/thermal_of.c                         |    8 ++++++--
>  sound/soc/sh/rcar/core.c                             |    1 +
>  13 files changed, 46 insertions(+), 14 deletions(-)

Here is the summary with links:
  - [02/11] net: bcmasp: add missing of_node_put
    https://git.kernel.org/netdev/net/c/e73d1ab6cd7e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



