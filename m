Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FE7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 10:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjmPsz8PLbnWnmrZVqoKtl/JGVUf2zkELmd4YvHgvnE=; b=nYGlhPqjMszj43jZvVM0PsaTo4
	s14V8JECgsC+bVEfcwCqWZmUJPZQw2ywh+FJT46+p5VEHDjeOnkYaqT4rvMV6vz6AOfeV87AMA8ux
	hgufq6ElR+IAtlJjTmZQWGezLFUTG/aVsnf7Ozpaz9E75P3KsgAvtMCKHSMopLASvlLaec0SiIr9t
	7J2nKY/VZukALfrl/b1DdGkcfN0Z+wYO+fODkdb+XtqicX/0pwtoKtXWy6KWqKt382PyBNiNqjFdm
	aqaXfEZa2rYIXk54rli7mY8I4yJClvAF4vrzX5GG0bMSnqAsMQDY2+DHXEqLoB0AJ3TsH+x/J5YjP
	zKz3AVqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rUo-00Aemv-Oe; Mon, 10 Jan 2022 10:01:46 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6rUb-00Aegf-Bx; Mon, 10 Jan 2022 10:01:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1D5A31F43727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641808891;
 bh=fRV4dFn3irT6J0vQoA0RItda1+ceONurgTgIO7cm5k4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=S1cpCYLYuHJTUi+1Ij27MvLzhLfJzzBU6Ah2/Yx4I54IibcqHQeuSt5R+8Nt/tvrD
 rW3IDIp8sg8abc/RN/Pdi6a8/YM9e7MiWJ9UUcy0aXlfm9XCdomlezxR//Kbyy33kR
 z10C2eem3vaJX34/id0pr+iNsvge5bBY9r1Opd/TuSp5hK3KQ563yQ3wpmlWb6UQNU
 n14B4rSZ9RU23aeFU1C0IhPFVJ9KqJGxBytMwbCVpgwDStFWrSdC2aJYpcx0Vv3JDJ
 hUT5bakZDqAuPWLmvEbMlrbapxe0+yphptydHpbXx42I70WqPVLZ1KX1vAcXzbiDFz
 FklGFVbuLazaA==
Subject: Re: [PATCH v1 2/2] iio: adc: mt8186: Add compatible node for mt8186
To: Guodong Liu <guodong.liu@mediatek.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110084841.575-1-guodong.liu@mediatek.com>
 <20220110084841.575-2-guodong.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <292950d7-d057-4e66-5d0d-a5144f50f2ce@collabora.com>
Date: Mon, 10 Jan 2022 11:01:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110084841.575-2-guodong.liu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_020133_579096_84BD4A2F 
X-CRM114-Status: GOOD (  17.58  )
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

Il 10/01/22 09:48, Guodong Liu ha scritto:
> This commit adds mt8186 compatible node.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/iio/adc/mt6577_auxadc.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> index d4fccd52ef08..fb08d761589a 100644
> --- a/drivers/iio/adc/mt6577_auxadc.c
> +++ b/drivers/iio/adc/mt6577_auxadc.c
> @@ -46,6 +46,11 @@ struct mt6577_auxadc_device {
>   	const struct mtk_auxadc_compatible *dev_comp;
>   };
>   
> +static const struct mtk_auxadc_compatible mt8186_compat = {
> +	.sample_data_cali = false,
> +	.check_global_idle = false,
> +};
> +
>   static const struct mtk_auxadc_compatible mt8173_compat = {
>   	.sample_data_cali = false,
>   	.check_global_idle = true,
> @@ -334,6 +339,7 @@ static const struct of_device_id mt6577_auxadc_of_match[] = {
>   	{ .compatible = "mediatek,mt2712-auxadc", .data = &mt8173_compat},
>   	{ .compatible = "mediatek,mt7622-auxadc", .data = &mt8173_compat},
>   	{ .compatible = "mediatek,mt8173-auxadc", .data = &mt8173_compat},
> +	{ .compatible = "mediatek,mt8186-auxadc", .data = &mt8186_compat},
>   	{ .compatible = "mediatek,mt6765-auxadc", .data = &mt6765_compat},
>   	{ }
>   };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
