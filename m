Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F55C7EE22
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 01:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCyoiyETjbR2Gy1/Q+DZmv1+/D0Q8RRI7wExIc4hVqo=; b=GQ4QPyX2x49+sKUMa9xOzSww5f
	lLUlWMfcVJpZnJhRCAOApR/ji+WhNyD5uqdnOjKbl6si6b6KS21f9mcwvS3cz2ryx3Nr0NODerdti
	Nbm91qeTYT0C4PByxnU8fVgu0xRFEGW98QvmHxx/RXIMKgTozCiJWftGhBRL2iyQndF63pFi217pj
	6LulYlIS1MNsaumWaZ1TaUUCO/Bgx6YZuzRn20fRCcaxAlh7G7siyPQUEVSoX5njVNjEp7bVzAuYu
	dtpGX8Kd9Hhz5PPL+XACtcIuc4pWSAd0d44DHoLBMk3sqJn4Cn1DIP5Exw+EocjBUt4QV5EyL6dVK
	j+T81qdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxHEc-00AZal-1n;
	Fri, 12 May 2023 01:06:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxHEZ-00AZZo-28;
	Fri, 12 May 2023 01:06:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D619260FAA;
	Fri, 12 May 2023 01:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27BCC433D2;
	Fri, 12 May 2023 01:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683853570;
	bh=O2xWsXKa4DjDdRZtiAgJqkrBYrAeY725PaQRhhhgrEQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pBrwLga7/TezsQ1Kh7o15ipSWuuCVFFIHPkIkomN4nRFP0Wxljj/vefQ32eDNjIJq
	 rpQ/eJoZ/LRvVBiOWMj6ZuEq0xoTzt0enapdJ7QNjA6PC5sAOpvQ2TqIAxjKxJZugX
	 r/AZvRyw4bcHXmSFA6+Yc88DAq30831M1neh3OhcpHsMofQczURhSqI5mHlMbslRAQ
	 vIgiC9wweJ+8Y1lZkhtoGmOuOnTValycTxHzZrHlqrCTAGwTQ6M/Eq0sZ01yxBCZOe
	 cSpOHkWWAiFjaIxsWrHvfIZ2WT7Q/SnHFJ52/ZwRgpMf7apNU/D6AI6IOdaQ1VCGVq
	 ToPHUTgvERRKQ==
Date: Thu, 11 May 2023 18:06:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenz Brun <lorenz@brun.one>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 net-next] net: ethernet: mtk_eth_soc: log clock
 enable errors
Message-ID: <20230511180608.6e1f6620@kernel.org>
In-Reply-To: <20230510181350.3743141-1-lorenz@brun.one>
References: <20230510181350.3743141-1-lorenz@brun.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_180611_739365_0EEE5FD8 
X-CRM114-Status: UNSURE (   9.78  )
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

On Wed, 10 May 2023 20:13:50 +0200 Lorenz Brun wrote:
>  	for (clk = 0; clk < MTK_CLK_MAX ; clk++) {
>  		ret = clk_prepare_enable(eth->clks[clk]);
> -		if (ret)
> +		if (ret) {
> +			dev_err(eth->dev, "enabling clock %s failed with error %d\n",
> +				mtk_clks_source_name[clk], ret);
>  			goto err_disable_clks;
> +		}

dev_err_probe() would be even better, I think?
-- 
pw-bot: cr

