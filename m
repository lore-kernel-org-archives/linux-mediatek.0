Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B8ECA6007
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 11:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hM5/nE+fuMDRbs1mg2VaperUxdMjUhS2Ee0Nt+KjhX8=; b=CXPNbVMFx6mF9Hg83HVo03xOMR
	aEXjX3XldGLZkJkvxB+ZyWpvQRnCOWdRWX8Q3GKw1UfT6f8X2vVTRVXfQ7jOAnsGmvnYPA1DfFQHG
	/HnJ2o2xDSpbfbBGeiruBvDSZxnB8EL6Dn+/z7VA5CEEb2bOQeMCvu5p/YKpsPWaYBK5BPYjnz/5O
	ZCtOtxrWn2hw9CYzSPKJzO++ktPcYoOnfh7Hcr74onKkK+JIuAq4n6usiJdhptwP2hTfautb3lLR1
	hclokqmLsJuW+gntrHZ8bdHTCdzSepHG2s3+V5lHD6o0Sd3EruFzkBxAMtBdQDfDMr3Lq04gCiq8U
	EtimlZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmBZ-00000004E1r-1OrB;
	Thu, 08 Oct 2026 11:21:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmBX-00000004E0o-0gAa
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Oct 2026 11:21:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK8TO2116437
	for <linux-mediatek@lists.infradead.org>; Thu, 8 Oct 2026 11:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hM5/nE+fuMDRbs1mg2VaperUxdMjUhS2Ee0Nt+KjhX8=; b=o6rSdA7r90kr5/sL
	/ulaUY+7hOWd7HrhkNWDjweP0N5jRvQQbVGXE5pv96/+kEYEBaay+aHwrCBRC3dT
	SXiyeS4NQSYenwMVsQ5s4Z991oU7LmRysyJWxjd6NzhMC8fCoeYXFIxrSU8wA1DR
	dcymgbtWe3DnNzgYAA/MlZ4Og0FMCmv+B7Smx7IGnEa9rgDf5NLpe83gAPxJMh8I
	Wxu72exx2O3L1PDeXKNU9pzPBUnB0VJBK6bCbn/O+VyurFWgCvdVTYIx4Vycwmpm
	WE6Px/jvfiKB3DOi7jMVmc7sT3uwUOepzH24GQEM8ykZs2CbkzEQaOnUVfwNYPEp
	vtBqLg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe52nku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 11:21:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dc7337e2a7so50868135ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 04:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458474; x=1792063274; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hM5/nE+fuMDRbs1mg2VaperUxdMjUhS2Ee0Nt+KjhX8=;
        b=Wn9+gtbcGxfel/vweuD2wyKfJoxAC6bcRh5hUZuJJQFOePyRmJlWSkHBTsn+XZaz9p
         eN5sEnV+cTNB8rP9iuees6f0x2LxG2/DVAC9z2M3At4Ux7tgMu5MC4rbyr/z+tLBKEoP
         SZszdVeoiB4PRJjMKl6hfjnwLDsU0n6DC0ZtsIlBx7LgUG3s/CySmB7D0CuvcQ8k5XCn
         s1rBZAK2muKzB73GDQSpan6jOn7/vRhdDA98cy7UMvIAhCRfxyMTmwVHXLGvlmgAi6Am
         3Tfn4DzWXFT/bFmLZmuQ7y5nlf3b5IhOy0TmVuKzgC+G4KY/Jg+K3EMxR/IpKtGRQ9gB
         NOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458474; x=1792063274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hM5/nE+fuMDRbs1mg2VaperUxdMjUhS2Ee0Nt+KjhX8=;
        b=MlhLJ8s6Ed49Of8VUtJw5Sl77ueMI5kxL4awx4I0+iA8NBcdhZOgcj2pr26jmR4IiM
         AOE08TgYGODPLmS6rSzJvEhnBobY66/wjCIqbDJYiKSC5eh5XiWOQIDh/x2uZODPXdmN
         kUpCqqHmUJlTZJrLZ1t/RGBaAmMIVdXimreHOIq7eA4ccaqkQRICjG0I7e/dVGgBtrdq
         ipljYnYbm1q+l6cdhGzeATFtOlKWClvu90oU7uOmuIcCIEELWtxcPF03L1j3igKVx4Nm
         SKFQhVzWPG9EjbkvlfvXJOlR8BPxXpsPVQk/qLeWNjlS0iUALWrjMwMEgYuy+F5Uso//
         01vw==
X-Forwarded-Encrypted: i=1; AKwUvByS2DosVJ2A+gLlaNxyIlv0Z6zx3GZL7jsL1cwlyB8ZT+nvEb3z55LByiyI9N2mko5lSMalvQVz3dThzjBR+w==@lists.infradead.org
X-Gm-Message-State: AFq9FYIlLzLcGD7jlTIyBv2n/8j9OTc1a846cFTZxkIjOEL21oCNJ/dE
	sQNhC5hYNl2YtpVQDOOXeCCe8pYcccsGL+JRdVVUVe4wYIXkC5kkzm6VbYBD998a4wzSDpeUqrO
	2jl+S4GwRmTFRZX/ZDW0VDCpx9DplaWPu4ReZ6zKRSJkArUO+LYDgL5jAhGbgngjT8MYFZRhGf3
	8=
X-Gm-Gg: AYBFou2mQRUVLa/GIRBkrBzeNZi8KVtkd6AnwoqidWcCdLz+CcCD6V1thQ8d0qPxIaf
	cL8ACuvULV2WQBw56wvzcwty0HuT1I1cldtO8vmXDUle4EjsQQc0UsRJmygDHUyDYHHlGZWhFQB
	uYHDm9l6TvgJr0OFiC3usNUVtSZLeOekKUguZ9HMdMQAOicSAlnOm9ISRlyxdj8GnTm75JWO13H
	syggPj7h0Mz6clluoLrSDUrSmBgRgSg5YxSNJEKoD8OPhCHow8W249IK/D+W8BlSFJqu+nORTN4
	sfMmsV40pmoSNVmLIU2d0SGtdb2zcAVRfiZCE96q4t7vI/ZATSr9XM73rcfXaHLKTa976ow9Bdi
	stME2K85JkCdSN+aFUIXNjUHN/wo=
X-Received: by 2002:a17:903:3246:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2e6004e1588mr46558325ad.26.1791458473870;
        Thu, 08 Oct 2026 04:21:13 -0700 (PDT)
X-Received: by 2002:a17:903:3246:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2e6004e1588mr46557605ad.26.1791458472408;
        Thu, 08 Oct 2026 04:21:12 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60443810asm22367435ad.9.2026.10.08.04.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:21:12 -0700 (PDT)
Message-ID: <56ca274e-5b56-413a-9fcd-9ccf1631d8b9@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 16:51:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] ASoC: mediatek: mt8195: Fix tuner clock error
 handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Trevor Wu <trevor.wu@mediatek.com>, ajay.nandam@oss.qualcomm.com
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        cassiogabrielcontato@gmail.com,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Haotian Zhang <vulab@iscas.ac.cn>,
        HariKrishna Sagala <hariconscious@gmail.com>,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-2-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0zOtdbzM-3P2LW9InZRPFSR0zaqw4r7h
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac77caa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=SQuuAJ8L7pDmPWVkXYcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX83FJevEralpH
 Ijv9v9lh29gaNidpBk90d/et92wADH3ey9BndE98MzpPLd9ZPyi084i3tXpOGe7l1dddeAVjVyY
 ibZuA/7fclE1RpwQoOIMr5sNsWaryb8=
X-Proofpoint-GUID: 0zOtdbzM-3P2LW9InZRPFSR0zaqw4r7h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX6JYc/LScd7p/
 xFtJbYK0ZXF88QQIUt4iRYGUFQuPpTl6QxcFOsdyHaZMcxhILiXhzed7UdisqKLe//llo+HaUit
 /Ppti6u6dhgPmR/5ZUJCkVsnFiJ1E4AKZTQ0svaOkn62Z2GWPyHdaXZBX3kvSiEWMfzmYY3bTMI
 ySyk2uq6rnFdk4dGWwg4mdKZqOApXdAZxZnvAJopcuNvitr5Cv5J4PR28vlYGh0hBlL8t93/KIO
 +iG3Wh0fNVJ3jgSZvoVcNvKgII9N5zIIqcEfHijNVerGAfurxj1NBrMW3T+C1iHdXQGuiSIBA5D
 WfpHYO9hEoCXtVkrtMg0jyn2yGZnGIsnL7Mkkl7DUCaOuBgjjzO3+0vIcL5LEmTqaoRQmlf90iv
 gOI4ywFSjzy7hhvnAJdaagOiCuqLDsN4axglg3hhI4FPY5qAo9b7Y9jnQ0uf7JspzOGaSy//lhu
 npftd/Pfh9wYv/6oGpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_042115_199714_5E16C1CC 
X-CRM114-Status: GOOD (  20.61  )
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
> Check and propagate errors from mt8195_afe_enable_clk(). If enabling
> the tuner clock fails, disable the previously enabled APLL clock.
> 
> Fixes: ff5a90173d98 ("ASoC: mediatek: mt8195: enable apll tuner")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 24 +++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> index 618d8400913a..ec1ea5b988ff 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> @@ -241,21 +241,35 @@ static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
>   				       unsigned int id)
>   {
>   	struct mt8195_afe_private *afe_priv = afe->platform_priv;
> +	int ret;
>   
>   	switch (id) {
>   	case MT8195_AUD_PLL1:
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
> +		if (ret)
> +			return ret;
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
> +		if (ret) {
> +			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
> +			return ret;
> +		}
>   		break;
>   	case MT8195_AUD_PLL2:
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
> -		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
> +		if (ret)
> +			return ret;
> +		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
> +		if (ret) {
> +			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
> +			return ret;
> +		}
>   		break;
>   	default:
> +		ret = 0;
>   		break;
>   	}
>   
> -	return 0;
> +	return ret;
>   }

This makes mt8195_afe_enable_tuner_clk() return the clock enable 
failure, but after applying the series I think the error is still 
dropped by the next caller.

mt8195_afe_enable_apll_tuner() now returns the error from this helper, 
but mt8195_afe_enable_main_clock() still calls it for APLL1 and APLL2 
without checking either return value. mt8195_afe_runtime_resume() does 
check the return from mt8195_afe_enable_main_clock(), so checking the 
tuner calls there would let the failure reach the existing resume unwind 
path.

Should mt8195_afe_enable_main_clock() also check these return values, 
and unwind APLL1 if enabling the APLL2 tuner fails?

Thanks
Ajay Kumar Nandam

>   
>   static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,


