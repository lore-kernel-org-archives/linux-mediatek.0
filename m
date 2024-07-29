Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11507C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmEUR2rjoVTCYM81YZ9W/1Ylrv2fsBZxPt8VkdCqleg=; b=EhrSargkAWsYYsmIa1Mm685Jeg
	dayUo0+9YKkfOXuhXkH+R0n1SsanWvGGjqcTdf3GCrzvTRVDKG9SxSXzAbmjzSTAlQevAP/ZqJ8dW
	P91zl5EeRwpDMk0HUF21blzNMbYYfaNtxFR+8paxXvfFBGp9cWPaKZjBw57vB/lJI78M8F/43Svip
	A98JP6Hw+ZivJ3i8bHYaQN/JIXY1j75Nq810hURO72C0+cEFTP6UWdpKk4dJ+LLcQljP4MrsVyMYJ
	NXwe19nkyNg4OUGOUkU/kcFRNCFKAljgRj/a0nZq3EWUO7x2Yt7UxSpDPih2imz7XM9YQEras6WDT
	UF8ZmJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYL6A-0000000APco-2BBR;
	Mon, 29 Jul 2024 07:47:14 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYL5j-0000000APVO-09iL;
	Mon, 29 Jul 2024 07:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722239203;
	bh=OIF5E7D7uDH2UugAidNpKFODIsp2ZY00VQ0wHKRRsD4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PZkJq/eBERYtYY90vFW0bOwn3qwqrQuScw7QeFpwiZsv9ASvHNRalE+cYJguuJDWE
	 HPLRxR8986pyiYG84OY82zCPnIYRMBkRaHonxhHaNBMfLktsrLgf5FKv/RNUG6w7FY
	 z2VUlCsQQHClLX7SP2Ny0E+Z08b4EG9n9ymPC4bVZO/Gi6/QzR8rfjSLtG4+C/fqNe
	 GRqdQXI/Apl337FuA93Yz2LrCumdY2EfqqCDvWNzgMCGl9Uf4LYJLW2QT909/XnxDk
	 DZaayWUd46eWGGMcH+QOCZeqHYN9p0sj/FvqCae7TpwKclK9Gys0JjiUUsblrSo23W
	 McJ9gGWGT1IyQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5615A378148F;
	Mon, 29 Jul 2024 07:46:42 +0000 (UTC)
Message-ID: <9f3e5fa4-0973-45de-98aa-806af8981414@collabora.com>
Date: Mon, 29 Jul 2024 09:46:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: mediatek: mt6765: Add missing PMIC clock
To: Arseniy Velikanov <me@adomerle.xyz>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, sean.wang@kernel.org,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, frank.li@vivo.com, jiasheng@iscas.ac.cn,
 mars.cheng@mediatek.com, owen.chen@mediatek.com, macpaul.lin@mediatek.com,
 zh.chen@mediatek.com, argus.lin@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20240729073428.28983-1-me@adomerle.xyz>
 <20240729073428.28983-3-me@adomerle.xyz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729073428.28983-3-me@adomerle.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_004647_244374_667BBAA9 
X-CRM114-Status: GOOD (  11.30  )
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

Il 29/07/24 09:34, Arseniy Velikanov ha scritto:
> Add PWRAP gate
> 
> Fixes: 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support")
> Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>

Agreed, but please remove the fixes tag and add a better commit description.
Something like...

Add the missing PWRAP gate clock, used for communicating with the PMIC through
the PMIC Wrapper hardware.

Cheers,
Angelo

> ---
>   drivers/clk/mediatek/clk-mt6765.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
> index d53731e7933f..4f03a0df4ff0 100644
> --- a/drivers/clk/mediatek/clk-mt6765.c
> +++ b/drivers/clk/mediatek/clk-mt6765.c
> @@ -559,6 +559,7 @@ static const struct mtk_gate ifr_clks[] = {
>   	/* INFRA_TOPAXI */
>   	/* INFRA PERI */
>   	/* INFRA mode 0 */
> +	GATE_IFR2(CLK_IFR_PMIC_AP, "ifr_pmic_ap", "axi_ck", 1),
>   	GATE_IFR2(CLK_IFR_ICUSB, "ifr_icusb", "axi_ck", 8),
>   	GATE_IFR2(CLK_IFR_GCE, "ifr_gce", "axi_ck", 9),
>   	GATE_IFR2(CLK_IFR_THERM, "ifr_therm", "axi_ck", 10),




