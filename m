Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2C4C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 03:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+EcLxFdPAG9beA5jxW52uV+Ropckq4iOqAuudT+ZwI=; b=UblBiEZ0rySsXRcnEVid0963Gz
	CpcVvg/K84dk4895EjZfLvjRhGarlmvWYWVp0TzwEc6yrwni+61EC0tCcJCdf2wnbCa2v2XYFT6x8
	zGQ5534Lq7qBDjubsuzKgDi+CBLmKaM0OzAhUlU4/uW3vhYeTRdhUmx00S8/6wz/dUiPG130u7quO
	KcccLgJKYLq/8lPGltjgXjLfcLMhIKI5KArhRw2sCHo04oAIrHAsOc9dcOJz+NOru3BoP5XRD/atR
	esyQ2g08MAV7uigjYC7t/oDEra7ujaBwDNs4d5Qu3z1hvx1hhlFm0PmWX1auvL/URkYILLL7rcJ2q
	4PGAHQbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBphF-00AMIv-8y; Thu, 14 Jul 2022 03:39:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBph3-00AMEz-W1; Thu, 14 Jul 2022 03:39:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B6F161DC4;
	Thu, 14 Jul 2022 03:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA429C34114;
	Thu, 14 Jul 2022 03:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657769952;
	bh=zopjln99q1rxFvM6ak58aizazSshf28UHBqgM18CFvY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O17AZt/AeHkPn061iiEgqkpCxr/6kBkYFumRDxFpzpRDC0oakyZZ3XRGmfmEY6Ei9
	 3ywnUmTLEXIsHlVvHMGqzUgTIpER87EFYeXOUR4n/d6QlwlK/L0Qmk8IRQ32aEqWdO
	 +TRWuSukauk6OJIVXPhjRbYzN8zLn+pXZ1FOgs/Md9SffssjYPWH+RzvTOOR3XEm+K
	 7vnP1QnI8vnpRqzgkdhK1tFUJDN0trTKm+UI85RlhJTRLnmpf6th0iuPXZsZGNsfNr
	 KrJuGiYy2WyUx3ImBk01c8POD00qj2MivZaDPDLEOrZHOJZ1icPv4DjGAl3WhPv/OR
	 ppqEbKU1SP4kA==
Date: Wed, 13 Jul 2022 20:39:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: David Miller <davem@davemloft.net>, Matthias Brugger
 <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <macpaul.lin@mediatek.com>, Jisheng
 Zhang <jszhang@kernel.org>, Mohammad Athari Bin Ismail
 <mohammad.athari.ismail@intel.com>
Subject: Re: [PATCH net v4 3/3] net: stmmac: fix unbalanced ptp clock issue
 in suspend/resume flow
Message-ID: <20220713203910.74d36732@kernel.org>
In-Reply-To: <20220713101002.10970-4-biao.huang@mediatek.com>
References: <20220713101002.10970-1-biao.huang@mediatek.com>
	<20220713101002.10970-4-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_203914_101684_16579364 
X-CRM114-Status: GOOD (  11.04  )
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

On Wed, 13 Jul 2022 18:10:02 +0800 Biao Huang wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 197fac587ad5..c230b8b9aab1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -839,14 +839,6 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
>  	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
>  		return -EOPNOTSUPP;
>  
> -	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
> -	if (ret < 0) {
> -		netdev_warn(priv->dev,
> -			    "failed to enable PTP reference clock: %pe\n",
> -			    ERR_PTR(ret));
> -		return ret;
> -	}
> -
>  	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
>  	priv->systime_flags = systime_flags;
>  


drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:837:6: warning: unused variable 'ret' [-Wunused-variable]
        int ret;
            ^

