Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8D4CA600E
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 11:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=; b=Bg+C4Nn79g75WjEXjwK9M5rwYn
	EHmDWLoAmdAmqgm/6R+OupcaaO+rlNPi85kPRapSo9yxJ7m9dsGqNl2ArnQo47hefFUz0X/H+OeSS
	EpRoCCMsS4zrH3q152LAV1fAKe1nr5R1WJr2l67srIo6rrjEjX+kFwudE9ZH4FTOQZOy2ACKiAaq7
	2j8AKvgk8lvGQvBF9c5iyvbH/EYQT53UTr7tygKx1zzTFyE1wUIggikQp+NDv2Ag9rLuu7W3sULtv
	Er5H7fRKjC8S2Lvypc3on5B3/4VIoj4KAJOSeCDHMSQBKFKRLoxDvKpOvA0WBIQW0bXsB55/e/DKX
	ACDKZ7AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmFP-00000004Efk-33ZN;
	Thu, 08 Oct 2026 11:25:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmFM-00000004Ef5-3U2M
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Oct 2026 11:25:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK8oX1882247
	for <linux-mediatek@lists.infradead.org>; Thu, 8 Oct 2026 11:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=; b=ho0W5dCDqEepLeXb
	c3X6IpEzpIJuV7O9b4xR+BXQqk3t8784QEqC9pdFly9oxMZECu3kXEi5pLPm3TRH
	EvPmktk/Z6S+yoAxVcPLjsDySWgmvMB5H8ZmGNNc3h3sk1CkWxzCQ2i1pGU0CpV0
	aQ0r19woq/eVoWZW0arhYWDFK+cTaJa+l8wmP4BxqRIXLa7Qkmyw3xt2yIVHq5d+
	usqh2NhRlCCMbLucL8WaTjC33qXNtuxqzrUPtYxDkhmlwwlt71GC5EiAi0c4sqmv
	3sCAE/9yocRYyY0afMZ9e3hFLwZnACvtF1cTFAwXBQWE1uOv6MS71kMUEEXBNFNr
	yDbs0A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2tngd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 11:25:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1374719a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 04:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458712; x=1792063512; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=;
        b=IqPyuBE/JTpy/hMHJMDmuwU+mv/jJYb9qFYWdp3POAIBX3qqOjBsidzlqBFVo+kFDL
         spDDbey4sLOuuGlxbBJchHNGhatsBizVVicWTk2yS1JnxAEf2kE+cwHd74ujja0193F2
         xHEXt7msZ0zwboWA8yWBuWasjatjWtJuNYLPuALhHH489nwblJD4xSsCUgUvbumN82un
         iAnN+vd8MqJA8WFyttDkdBR+vBYKceJuSKEgBoKip4n4LAM8o8fr5WT5qGPxG2W3R60a
         /nc7vOpj8KfItx0wasMVdsM0di7dNOCsUh2AXH1jou5r5eVpHJA3VNjBWdxMe6AEyDMf
         enYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458712; x=1792063512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoILBtcVMCoKLTAUp4U834r8LIhwUnyvvhADRrKyZc0=;
        b=mEvN5ZxE7FDE85s18CZN+zhZtQHg6acQW5plzMFvHlWuxwPxUFpRP6KWo4gcgtA6Mo
         J7pIJwDzH3f64QDx4EZCj3FegCxgry35sBX5TqqPynlvPbb5YvQEdc8Fz+OE2PDPEweD
         u+39PbQoxWnBGZsNdJEcJ5Le1OESGj8fIBcVhU7xtIWFaicc5jMq+cZ04bQ55AOlzk2J
         uLTasca2LgI0v5WAr/J1qjQXqi/Kv/mcaOpih0ytac5yrcJjY+nmcSjpVUzpUSZS3D7Y
         WEMgtri1Xhao/abo8T4vnLUYmnBZry22WEy1LGlvfzPgZzfxURSPPqRbrSDAT1UL/rUu
         WuHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXOA0GEa3JJlEy/WCxzMY7i/rjZgT+YVPV2svw1DanGThjxP19a7qXhFgPuP3igykc6uPZCL3Z1PUNdcAUJw==@lists.infradead.org
X-Gm-Message-State: AFq9FYL1J3svArLE+0HzgajexhxwLVHbC9LSMe4GQani8ImRaiV0kPqw
	+yDxwWan+huTREZCryMRZu5UdUEfP4vs1KMqk+K+g1oRHUK1jfXXOeGQQXCBU2s4yDo6gegPr2q
	BihsP7PhuiPaKp69YtGR426s/i0uWVbUoApJTRi5zCihzBvPBDKWueE0MhYNahdlP8ekxZuYPkq
	E=
X-Gm-Gg: AYBFou0hwsagcEdFArj2kIgVOha3JPfTSmsZwbszxNhIBH81tBdxuj3wqM+Mk/6QgBk
	4gCHpytU/FgvW679gR3vPSZuvusuUXqMRLa67OO7JemPz1l1VELxQ8aXubd2/ChB6lXiNO8Rnt5
	ZQmDtTY90B7WjZAwB+1+yzO3U6qptFyOxcQFy83VeNn6H55NKPqNYhXLQwUibOTmrazj1HG71MK
	GaZaZLRw8hUUV2O8uHzsi7mx4GHsYwJTY7XZPkTioQUMean3pPlzuzW+PtCXHGBN2c3CdWpDPUI
	7Q+uXvr4Wz5ZFCbAK7Dl/Ps69VFtmKcNEF0liRe2qpDB9X+nYGpQL3dhNAMGkltk0y/Szinf3jO
	+gGospLNXWPRh3qHl5JwCV3uC8iw=
X-Received: by 2002:a17:903:2acb:b0:2e5:36a9:400e with SMTP id d9443c01a7336-2e600500cd9mr40858085ad.39.1791458711635;
        Thu, 08 Oct 2026 04:25:11 -0700 (PDT)
X-Received: by 2002:a17:903:2acb:b0:2e5:36a9:400e with SMTP id d9443c01a7336-2e600500cd9mr40857685ad.39.1791458711093;
        Thu, 08 Oct 2026 04:25:11 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6047201e6sm22775505ad.37.2026.10.08.04.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:25:10 -0700 (PDT)
Message-ID: <10fe8480-21ec-4e44-ab21-d88bf2ef03e0@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 16:55:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] ASoC: mediatek: mt8195: Fix register access
 clock error handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        cassiogabrielcontato@gmail.com,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Haotian Zhang <vulab@iscas.ac.cn>,
        HariKrishna Sagala <hariconscious@gmail.com>,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX5G4YJ6lttqVW
 ZVvUcszBG7CmPRT/BQVZsUjJsmLKSaO5DbnJ/peHB7o4fBjyWrGG9AEVjkGEqftf1Gh6PBzBHtJ
 4cqG1oU8EuUai3JuFwvGxdKiTSLiMjM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX/UPu/KHVCib4
 sgL9JJnH42eBDgv+0oERfCP7bnJoQ1nv0N+LNmahFv4oaJ1BQL3yZvLRbT1/rrPQ9s7IFYZ2X1X
 F9gu0T3QrEickKLBDSvkfvYG8bzMxOEV02gO1ITEhR7QQJCdREI7XzlsDgTsM0aGaPsYt+zNWNn
 nlXh5TNHBWl31mGbdA0ZxpfYP79Z+NhO6Mf/sJLS5iLeMeL/W22Jtd4m1P8YTW8YYzkTlFwr3ru
 DlJ7oeTh6aUFovwWqkp+a0TLFfwjxy1TxnAJ/tS3hPCgjOmby/6vhomE7bld3zmsA5RX1ONR2Tj
 LWi6qG94EleME87Lc8DQFI9fF98EmGfWBeCLWgi5Xi7NrDJBY/48wxgXit5HtPo3cMBO6WpM2Wx
 BudDY+3sH/8HMzL4I9RuT1K6qYUdHyFCkXkZOtUOpnjj2WwDwGPwUKXPThy0zQrDcd5/HLRAj7T
 wUDcI0g8NCZgVuU6AJA==
X-Proofpoint-ORIG-GUID: Mr3YofAimkH5IFFApl29gVA5eJyyQT7G
X-Proofpoint-GUID: Mr3YofAimkH5IFFApl29gVA5eJyyQT7G
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac77d98 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rZdDH30vr1OGgawLJCYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_042512_883184_D343CCFE 
X-CRM114-Status: GOOD (  22.63  )
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



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Check the return value of mt8195_afe_enable_clk() when enabling the
> register access clocks.
> 
> If enabling a clock fails, disable the clocks that were already
> enabled and propagate the error to the caller
> 
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> index 12d8159338be..34c828fdea29 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> @@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
>   int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
>   {
>   	struct mt8195_afe_private *afe_priv = afe->platform_priv;
> -	int i;
> +	int i, ret;
>   	static const unsigned int clk_array[] = {
>   		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
>   		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
> @@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
>   		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
>   	};
>   
> -	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
> +	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
> +		if (ret)
> +			goto err_disable_clk;
> +	}
>   
>   	return 0;
> +
> +err_disable_clk:
> +	while (--i >= 0)
> +		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
> +
> +	return ret;
>   }
>   
>   int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)


