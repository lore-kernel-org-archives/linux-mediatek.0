Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473CDC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EhnlcHs6StCunPDrh9Eb4ccpjCZuI/GBBxQPpJbHCo=; b=hTCMs7+mNGLrL6
	CMeIWIIFQ2VD+Mns1FwdlM47DeIoFxVCuyUdx/LacVBorDuCt4N/fvZgB9j8aR7bjuDIBTxypzR43
	nI7vkNDbjyuOo5dQ6X07Wl41repRkUL84asC987uz+je7nfN1iN/Jr97yUIjc8BEQhad7LECnXVkv
	e9xFtQWeE8UHa0IhdT/OrNP+ZnsuPL9GV6NsrSm9Y41i7g7wKkWAS+6xwA/sRYLuad8NqBPM3vpsk
	WyEMe44HIpmdO1xJbZRyc5UaI4n+bh9ZCefQxbqUhADp0j44jReaRCofVUotrW6KjnvemZhhcvQrM
	NDU5+grPljLKraSrQ++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKe9F-009w7k-HR; Thu, 17 Feb 2022 10:36:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKe91-009w3l-EM; Thu, 17 Feb 2022 10:36:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6526A1F4597A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645094174;
 bh=fGfpAy/ESFXY/EnVqngS5rsBomyxVvTAFX8QacphIcY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Crm/1JaNK3v1Ta/KCpFpWZcr6bqqElrwyAOBaL3ATUv7pU0eIjaqAJ+6ejIfwhpIQ
 RLGY4tz3Ve9DsnAVzwW9zmMUOdRcfrDDc6rm0Znnn4+61XRHa5ZgAE5yajMo1SeqOz
 ukuU++Ud8GBwHsf6DsZLqXHGIcmHJmCaY+APEFVW7wJpZaQI++/hTJjx/E/F0Sx9+N
 /edvHLay7KlyTVg4G+hkuy+b62GFP0AX8Z69xb6Me9mJKEawxD/+000hwqTryKH383
 TW3++7++BSWELbEo7Ar9weR9Lm7N4W1O1QipMKCzNm/l/7Wr/hez/QF/SzbpZIijxE
 3EibbCKvuAopQ==
Message-ID: <286d040f-bb9a-d3b9-2b91-d758f0d0748f@collabora.com>
Date: Thu, 17 Feb 2022 11:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] arm64: dts: mt8192: Add watchdog node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>,
 Ryder Lee <ryder.lee@kernel.org>
References: <20220207094024.22674-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220207094024.22674-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_023615_647189_99AF66CB 
X-CRM114-Status: GOOD (  14.16  )
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

Il 07/02/22 10:40, Allen-KH Cheng ha scritto:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> Add watchdog device node to MT8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index cc3953df0153..c1d4030e7e4b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -301,6 +301,12 @@
>   			#interrupt-cells = <2>;
>   		};
>   
> +		watchdog: watchdog@10007000 {
> +			compatible = "mediatek,mt8192-wdt";
> +			reg = <0 0x10007000 0 0x100>;
> +			#reset-cells = <1>;
> +		};
> +
>   		apmixedsys: syscon@1000c000 {
>   			compatible = "mediatek,mt8192-apmixedsys", "syscon";
>   			reg = <0 0x1000c000 0 0x1000>;



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
