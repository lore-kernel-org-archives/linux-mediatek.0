Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83047C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 05:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygp9e51TdFtFEMu9HfO8gYDsmNCdbchPclbTaON3kfM=; b=MKLsMjshQ+AyaWI2JK2tQZy1nW
	lAGCBDlbMylpzqhonAu5RwBZrYJlMapsDZFKD8ieFYDXb4jHwHmWRurxohAt/QmYs5YAjUdLMzlxM
	CY8cTacivibuhhAP0YQU+Agj++HNs2bIvkYVGKGPjrqC+C2o2sTmnheyN9i1kA4MMNHjZPQ0rNpGx
	eZ2WEaPoG/H4/SViA2WxTUQ+fz4bH1JRSCx/2z6DoXlp0UNP92tKKQJmMZU+nfKmr0j80Ubo7EMbO
	fnsX4qYO+pl5MowmZNGnV1t65YtBquokJrlw3jzStLGPm9vMFVoqj0rL7SPY6OJ91DWZCmV1UKnpc
	DWETdpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfD3o-000nLx-0X;
	Thu, 23 Mar 2023 05:00:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfD3j-000nKw-2T;
	Thu, 23 Mar 2023 05:00:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F1471623E4;
	Thu, 23 Mar 2023 05:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51E55C4339C;
	Thu, 23 Mar 2023 05:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679547618;
	bh=NPnB/UKnNUercF44HUDX/+E3dqZ3zJVMKeECg6m+d1A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IsZJcdwN7BEzr41ZzVOxogP/fo9bLZra4v8eGb4EUa1bebhFu3AHFwAuHzM+uW3j4
	 FVEGqDpUtiyjsw6cxk/EY51PNCkW5TDrwdTjTsd51ePOQUek5onn2Tl45jGa/lPq7B
	 IrTXp0IXIZHn9lfxZ7RvJ23PQuYkYopnkYjMbLUUsMtjrHPdokfHMkQCvc4qPucy3i
	 87hhPSfaDMVrjblhVr9BbaSaj6CmkEPSrOyN5Fqm7vs01FRYrO2P4wqjGa7Gb80a6N
	 4bncUA09GxrPJxzloqiV5FOTNOtkvYP1pWr5dwyhHFQJHmeSVQfZaM7bnhYKVJbr9U
	 grdHl1qm9Jsfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1A7FDE4F0D7;
	Thu, 23 Mar 2023 05:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] dt-bindings: net: Drop unneeded quotes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167954761809.22889.18341092686850307793.git-patchwork-notify@kernel.org>
Date: Thu, 23 Mar 2023 05:00:18 +0000
References: <20230320233758.2918972-1-robh@kernel.org>
In-Reply-To: <20230320233758.2918972-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, krzysztof.kozlowski+dt@linaro.org, afaerber@suse.de,
 mani@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, joel@jms.id.au,
 andrew@aj.id.au, rafal@milecki.pl, bcm-kernel-feedback-list@broadcom.com,
 f.fainelli@gmail.com, appana.durga.rao@xilinx.com,
 naga.sureshkumar.relli@xilinx.com, wg@grandegger.com, mkl@pengutronix.de,
 michal.simek@xilinx.com, andrew@lunn.ch, olteanv@gmail.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, tobias@waldekranz.com,
 lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, heiko@sntech.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 nobuhiro1.iwamatsu@toshiba.co.jp, richardcochran@gmail.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 krzysztof.kozlowski@linaro.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-can@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_220019_900230_87710AC4 
X-CRM114-Status: UNSURE (   9.97  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 20 Mar 2023 18:37:54 -0500 you wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for bindings/net/can
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v2] dt-bindings: net: Drop unneeded quotes
    https://git.kernel.org/netdev/net-next/c/3079bfdbda6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



