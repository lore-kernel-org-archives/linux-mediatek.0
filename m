Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A131C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZn0/bUL/R3+BbxIltrZMIryUyJPxLS/EdXBarSfxvM=; b=X35Ck6W7BPpX1q
	ATURKB9jpSuCWTJhW4d/DPcWzTavEBbrFAzvFbHW6fCPlE9MZ50KNE1koTu97bWXxDy3zvK0NFkmg
	LXeWP2JRAqmCZ4Ja1D8RjrSuXUdU0rzhso2YdMO8Jb2AeZNRO0TWAv/qjTqwWD30I8pFk/NS45bYy
	Vefu5H+kQjWh3VT8ocF9UJrcfBjJc1lSyHmBOhdHKLQNpkzcVXr7NKrtWTduqvKc2cZBigzU/kEph
	NjgbE41pKC4BY0teeWO0ktf191OHFm1O9qXBwwN/zYBHF4LHripf0cvxThN3hJ9VV3YAGMwuqRKAx
	deiOfGQ3G6zOxUmu/I5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVAnT-001ONn-2N; Fri, 18 Mar 2022 11:29:31 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVAnF-001OJf-Ez; Fri, 18 Mar 2022 11:29:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2FC531F45EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647602954;
 bh=yR6YIljfGinF+pJoIGBmN8q7+1O8ZzcAnqybJw3gz6o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E8KU89+4XqdG3J8L/OLvNgA8upKBw/lygW9TlmKTChO/fWZuTxAKqOVrkhGEHE5PR
 c1Ryx3Vb+ETKbMRiLx6pJnL+NA2cDmyUdUJynygITn8Wb9TBa5wDM295sjIftjUl2B
 MAg9nV3rdwRkQQpDBMxI0C90KVKWsDkNvPDrOuy1HDy4YCzPHEQgVfA7C1LsGVRhAj
 pfu271TQ3FdfpyAjnkxjslqSIpCW4nytRx86bQwaPHHVJaPhfTN1btlb7QpB0l0lYA
 8ZgZiIiTho3/i1kGNMNsbs/WiZ/aS8aDvQqp0uTJp4CRPanOklvbHzknoBcvPf4Zok
 qLFCymsgSwXhw==
Message-ID: <a6844feb-98d5-4f44-f8fa-87f47aa9ec93@collabora.com>
Date: Fri, 18 Mar 2022 12:29:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V5 1/3] spi: mediatek: add spi memory support for ipm
 design
Content-Language: en-US
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220318025027.31281-1-leilk.liu@mediatek.com>
 <20220318025027.31281-2-leilk.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318025027.31281-2-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_042917_709858_B8D795AF 
X-CRM114-Status: GOOD (  14.10  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/03/22 03:50, Leilk Liu ha scritto:
> this patch add the support of spi-mem for ipm design.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>   drivers/spi/spi-mt65xx.c | 302 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 301 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 1a0b3208dfca..ea6223259060 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c

...snip...

> @@ -78,8 +79,21 @@
>   #define SPI_CMD_IPM_GET_TICKDLY_OFFSET    22
>   
>   #define SPI_CMD_IPM_GET_TICKDLY_MASK	GENMASK(24, 22)
> +
> +#define PIN_MODE_CFG(x)	((x) / 2)
> +
> +#define SPI_CFG3_IPM_PIN_MODE_OFFSET		0

This definition is useless, the offset is zero... and this is used
to bitshift zero.


Please remove that, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
