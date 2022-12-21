Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9163C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 10:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCg4ewcZtUMK1IVsshtWQ8Dto6+9EqSdTyozNP+tggY=; b=c3DfAloikVGsluzK7kryhbZj/n
	I3lOBKQqS/lFrfCRAkfL3HnQMri6BZRqBk51W3l25fS16TFP51zuCI3JzWdi5AMvlq/sT1rSzZxKs
	SQGyst4Lbkje+Kupd/ICXoxyZfiVwXgUAWww4x/9Lc0luM06WbNvdE2yEPVILj8Pf2iRfNOKxPuPr
	zdZMiQneTqALOE2e32wqx639FHFyLDZg8sNp9jkmBEJABdL7/Bo7zcHnXw2GMIyUABqlKRBLWX1Lo
	ACj6/XQ9He9iEJuKkblbhD236iQb7otxy/ZGdImvCu4aqttTRhqNMCxcg16FHfjdcUiUBiBOTU9MN
	ne0xWX/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wFi-00DNRE-Pr; Wed, 21 Dec 2022 10:23:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wDa-00DLmZ-S4; Wed, 21 Dec 2022 10:21:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9EB446602CBE;
	Wed, 21 Dec 2022 10:20:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671618057;
	bh=4XAFAvREPt9mELPunubuWmSA1SRawFig707S7i4tp50=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L824nQQwaWZop8xOF/IUB0BVf5zE6Osn1O5fsLXd+eOrIxOAZBMuv/jfXG0fPJQQ0
	 4uXxLaodRCsn/RQWdbdI97iIHvIC+ndpro0wiEe56Tea7uTQuR2qwpqsWH0z1GbcZR
	 5QDxV0H1+rUA1D7LLlW55spD9A9EbCqbvycdJ1hHfdU3xqq3sHzVohhwHCuX9J7UF5
	 Zea1OkPR/j6GuwFIXggmWKMrL0zASp7BAqsGfylBIy62LQiyUBUttD8iSRp5+n9boV
	 6/P7NFLmB3pEIc+4WL00G8FNI/+y8E4PtfkSo6I16eGJvmzGCliE8PAcvHeD48auzm
	 imZqL9D8bu7Sw==
Message-ID: <7cba92b5-b0fe-cb26-cdec-463a00657d29@collabora.com>
Date: Wed, 21 Dec 2022 11:20:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/6] soc: mediatek: pm-domains: Add buck isolation
 setting in power domain
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
 <20221221034407.19605-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221221034407.19605-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_022059_106057_E2EF6C87 
X-CRM114-Status: GOOD (  17.13  )
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

Il 21/12/22 04:44, Allen-KH Cheng ha scritto:
> In MT8192, we need to disable EXT_BUCK_ISO before turning on the ADSP
> power pm-domains (mtcmos).
> 
> Add the MTK_SCPD_EXT_BUCK_ISO flag to control the buck isolation
> setting in the mediatek power domain driver.
> 
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-pm-domains.c | 8 ++++++++
>   drivers/soc/mediatek/mtk-pm-domains.h | 1 +
>   2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 09e3c38b8466..63f1e183f645 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -218,6 +218,10 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   	if (ret)
>   		goto err_reg;
>   
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_EXT_BUCK_ISO))

if (pd->data->ext_buck_iso_offs && MTK_SCPD_CAPS(pd, MTK_SCPD_EXT_BUCK_ISO))
	regmap_[...etc]

...so that we validate that ext_buck_iso_offs is actually present (as I
suppose that this is supposed to *never* be 0x0).

Regards,
Angelo

