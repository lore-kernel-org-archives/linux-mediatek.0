Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D15CD54AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rpz/1/Wy5NrhEfVUxzivRQ+5fZLudtCsoZpIvvoXvkQ=; b=KB90qaMec6IimPzFsV+S2z/JyE
	wYK/wMI2zNP3qEPT5AIJCS9rzODVvD0FR8ey5CCIUXOqJSf3ZVsmClbhr7NRxgQVeoP9onNyBTogf
	ywV2N5Kg6VXCTCbYSiMUes82ka7TbySSxSM4QGtRDmbgcFowAwD1fneEtVQDZ9zoe4BEf/bQGYj8D
	Za4b6pEEai1GEGb7QFh13B05jeLNx4ehuv6WvE6U8pCCwaH8nvSuHdOsGgNQPxnfTm4B9elu/J0IJ
	C0LucDHwqUOEBP0nqUGPkfiB83euVhdAqifmqjoLr0e20a/igWDv4Pn+Qf8/63mHVzZiH0CZGbD7Y
	CbVeWEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYLY-0008Un-1p;
	Tue, 19 Sep 2023 10:52:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYLU-0008Ri-3B;
	Tue, 19 Sep 2023 10:52:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BD76A66071A9;
	Tue, 19 Sep 2023 11:52:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695120763;
	bh=QcGJGu+vMVFM/Aga4X3LUn1iwVKSKDmFF54awTg/A70=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XsYzeYGM1Z6puB66ZRn9YFFXiS7eKo+82uLha4cqjDWTxx5Ec39nbpzubtY10lqrQ
	 Qvt0RPzjRjlmpzR8bZhP3389PEnOUeN1gKCxhaGGHTZOUGr2H8bmDRIcbUllbUEvvq
	 BcmKHcgMRDLHjzFVMVmFTDBnNR9xp+jBOZQYasl7vJnispz9JpSxtWVnf2YpfR0sD1
	 bYGrY8Sy2b8QTva3Xt+L51e/0LtdbJCc1KC+JkG8sYnezT26CJaj9mVy/9BvZ000G1
	 snpkpLcE1Xs+AFk8O8syZ/ZTwdS1XBFhBuXsmuGz0xP0T09geJRF3TSBL9VxssKdsr
	 cpNbmDD5tOJsA==
Message-ID: <0009f224-aac4-6681-fde5-cf1ead94c604@collabora.com>
Date: Tue, 19 Sep 2023 12:52:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 2/2] soc: mediatek: svs: add support for mt8188
Content-Language: en-US
To: Mark Tseng <chun-jen.tseng@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230919014439.5795-1-chun-jen.tseng@mediatek.com>
 <20230919014439.5795-3-chun-jen.tseng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230919014439.5795-3-chun-jen.tseng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_035245_186404_5F9D5F22 
X-CRM114-Status: GOOD (  19.25  )
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

Il 19/09/23 03:44, Mark Tseng ha scritto:
> MT8188 svs gpu uses 2-line high bank and low bank to optimize the
> voltage of opp table for higher and lower frequency respectively.
> 
> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-svs.c | 184 ++++++++++++++++++++++++++++++++-
>   1 file changed, 180 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 3a2f97cd5272..f31e3bedff50 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -407,6 +407,7 @@ struct svs_platform_data {
>    * @dcbdet: svs efuse data
>    * @dcmdet: svs efuse data
>    * @turn_pt: 2-line turn point tells which opp_volt calculated by high/low bank
> + * @vbin_turn_pt: voltage bin turn point helps know which svsb_volt should be overridden
>    * @type: bank type to represent it is 2-line (high/low) bank or 1-line bank
>    *
>    * Svs bank will generate suitalbe voltages by below general math equation
> @@ -469,6 +470,7 @@ struct svs_bank {
>   	u32 dcbdet;
>   	u32 dcmdet;
>   	u32 turn_pt;
> +	u32 vbin_turn_pt;
>   	u32 type;
>   };
>   
> @@ -751,11 +753,12 @@ static int svs_status_debug_show(struct seq_file *m, void *v)
>   
>   	ret = thermal_zone_get_temp(svsb->tzd, &tzone_temp);
>   	if (ret)
> -		seq_printf(m, "%s: temperature ignore, turn_pt = %u\n",
> -			   svsb->name, svsb->turn_pt);
> +		seq_printf(m, "%s: temperature ignore, vbin_turn_pt = %u, turn_pt = %u\n",
> +			   svsb->name, svsb->vbin_turn_pt, svsb->turn_pt);
>   	else
> -		seq_printf(m, "%s: temperature = %d, turn_pt = %u\n",
> -			   svsb->name, tzone_temp, svsb->turn_pt);
> +		seq_printf(m, "%s: temperature = %d, vbin_turn_pt = %u, turn_pt = %u\n",
> +			   svsb->name, tzone_temp, svsb->vbin_turn_pt,
> +			   svsb->turn_pt);
>   
>   	for (i = 0; i < svsb->opp_count; i++) {
>   		opp = dev_pm_opp_find_freq_exact(svsb->opp_dev,
> @@ -952,6 +955,29 @@ static void svs_get_bank_volts_v3(struct svs_platform *svsp)
>   	for (i = opp_start; i < opp_stop; i++)
>   		if (svsb->volt_flags & SVSB_REMOVE_DVTFIXED_VOLT)
>   			svsb->volt[i] -= svsb->dvt_fixed;
> +
> +	/* For voltage bin support */

I already asked you to please send the voltage bin support as a separated commit
because this is for *all SoCs* and not only for 8188.

Again, please separate the voltage bin support from the MT8188 support.

soc: mediatek: svs: Add support for voltage bins
soc: mediatek: svs: Add support for MT8188 SoC

Regards,
Angelo


