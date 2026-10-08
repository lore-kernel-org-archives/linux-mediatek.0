Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB027CA600C
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=; b=uRxmVoDCCv101omyNRB3gLk8GK
	Qzh92rdVRVZeBwvS6sYd6BaYsC2/UKvVgdi8uTXDT/TOHjJoIh1HUsQj7+A4VCIOjo3FNVO4VxCKP
	rWYYvcvonfkuaJpmipE7LeLPuuW9jdN78b3VhuC7ybzdyD0G5YrDRtJmE48ZZ4lrVmrLaIBUfBbyQ
	JHiE4TN0sEaDrM4zeJO9y2fs58BLLb9KC6UuUp4bvKzuTrqv/cTcn5kBA41ZGmlaXQvg1uwqv+qZK
	YJyp4U+esPCM5DJxe2fhxm6OqMlRY9dN1dWJAXCXsfDRfnlheD9uTGFhZc6TMuk5K+JXR+fRLeCWR
	UH6A8anw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmjC-00000004IV5-3lyL;
	Thu, 08 Oct 2026 11:56:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmjA-00000004ITp-2ctd
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Oct 2026 11:56:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKEek1708167
	for <linux-mediatek@lists.infradead.org>; Thu, 8 Oct 2026 11:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=; b=H/eOWCrPhPA2EjlM
	sTpcc099xLSGzL26cEaA8v7aYEBtZwWIBBUSm3KJNeJK5sDIMS95E54FV76NB9+S
	Jkj8ZiQnjShOhOBAJEQU9eJcCzRL/bevrK2RJgRfX4utVkjD36VCr1tv5HIuZgmA
	4wGvGfAImO2jXXtHU3mA8h0rHZaoRAo64uTCC2UovW/6fY02fiJtmS05iHz5i/w7
	qjkC5tVZJN51WCsdWpwWy5ReaEnOj7xeQarRyK/npxeO7U+13H5x+U3CsRz/UToy
	fKjvntqJQvgCfNh7OnF+S1tKYRwBBxu/vTf6rqa7QeCItQ4SAi6CJtp2nfPk6vNU
	bYhohw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3aqh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 11:55:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f75c1219so68922325ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 04:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460559; x=1792065359; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=;
        b=H4CEZddQLFvLC8xmOnqmjfSk0sN0zrLLkeJXMZDe62cFbuzz7U3TO1FHBch5WYjcpG
         HW/LKwLh2ID8lOY7DmuVojw1rnSK7XSqu4E1XicKvJfnLvUOcaWZVvuFvG11P3qky5Iw
         BmszC7V5kyZy1F7b+mCq8yXIrluHctiOLzqXcgI40Uu3TYyYozoeilzwYV91uvlPOQ44
         SuGtAkk6c9LGEnAVm2RQsIOX2o48NVZRjMA+PlRtG/EYlV5o6qLIQdHcRjRLjCmi70V2
         xOvpQR6zXVKlpa5KboPNB4oAot31KX5yoaPbDeJ3Zji1kbwJgXled02DAlyIriaWfFHW
         hsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460559; x=1792065359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=;
        b=Pq2deZZwwOz4Xtvga6Eaj8TES6cOH+ggqPQ3L/qgsbn8OlJanpsAWghIsrBx6Dek3q
         SFCtoIKjKCYEKDHCSMYycRjoX/4FxbKk7VplA9StByj1jrfBId0uzw2+LfT3FewyLpmF
         EQyPrZroOEo4zEY7L42c8ec5vhs/tw71YUiRIwml/ID5UOEc95+By2MZS0WeHrIuAxag
         S48NJUQ8EywDs2qUEOGAi+pf57UREaB8EDuj5YrmePQ9kkXJXR8IaZ1dmX6KQX9O47KE
         CejSMUnZUaBNhpIeJCMAjs4p8emaKR1JcGG8ikRnS8U69OG7Z5Qu/1lYYHogbpQsQ2l4
         adgQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5GlZJin5parGMCW0AKTayFf1Sba9j+jfb0u5NPZtRW++vPgjv0qsTek7QopMH5wLaNoEZOUoT6hTYczg4cw==@lists.infradead.org
X-Gm-Message-State: AFq9FYITLi3ZntQfqDT5pVNRpKSa2JwsVbW+wNQ/F6MlnQh0cg0ohf0B
	+0PaCEtnu4J3BH4q8/pCB3Ul0Un03JJfaclhnp2VpAdRVaHNYs344e2behzefJ0csi3mou3ZO6t
	ohgs4wqZ7A4cnHq+4RRg9p/qX8v1Jp+2OW037SuamWbmiZYRe1vdu7xL8VdWDnycmhpCOkPRJj3
	U=
X-Gm-Gg: AYBFou3hC62sAp5FS1HgTUadp1yqJq1d3V1/mzJNcAMP8bxTG3RBVO+CsYQIfhzpmVG
	ZHD1i3cCY7EA6897XsQcAeKuQ3eEJlTZ1wx1lAzuQd0MQ/Z65zieaiYsJSmwQckB2tHLlOhc+a/
	VSjg/KBk1+cR0QxiGsyXp7beptRMQWzTUENnWjbdcTBGOZPYT8pF+QGmmzAJv1wgGt+5uKifERX
	f5yol8TkqWcC4jIQPhcrM1ZDuS+a2eHxaiK0riZsrkYPJ1Jt8XvxLeYg4E7p+dWZzQbWmn8qjh5
	FTOjxtuVOCf9s674Xp+ULT/pKbzes5FoMontanPtqcDkMHBaERtM12vkoBX6EOXoC6G6gq0Elvm
	qwl7kxeqhM097c2uAAEZjdGebE3w=
X-Received: by 2002:a17:903:acc:b0:2df:9a29:aeb2 with SMTP id d9443c01a7336-2e5ffa16178mr43802695ad.3.1791460558585;
        Thu, 08 Oct 2026 04:55:58 -0700 (PDT)
X-Received: by 2002:a17:903:acc:b0:2df:9a29:aeb2 with SMTP id d9443c01a7336-2e5ffa16178mr43802505ad.3.1791460558080;
        Thu, 08 Oct 2026 04:55:58 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e606da8fc6sm22731375ad.58.2026.10.08.04.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:55:57 -0700 (PDT)
Message-ID: <87bc700a-0b67-4791-9065-b4fa4ba9b53b@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:25:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] ASoC: mediatek: mt8195: Fix ETDM startup error
 handling
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
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-12-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-12-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ldv4l0PP96UehvXjDNkEAxoVGq22UfKM
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac784cf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KMfNbJP5VoSB66bTmycA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX0kLvz/w9HhGT
 vELx1rzPyF6OB/lrRzPUTtBM/ScKTIMZap3sqNw/hDhbiY0/cfaSH5qgzRkuoBd10TZ40zum9wI
 cKqpAoRa2wzVQK8S9O+eP/GwqvZK5Uk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX/LmHWuJ81s9e
 +LzDYvSyJCoSm/tr1qHfBfFShGzPehFiKD45sbRCdIRpWv35aaSH2GttcAmyThtnZdY4W+51izV
 dTsocmEPg5USbR8wghlFUaM7UNje8PhMG2Dv42j9CUD/Cj2SfEA5HKb1s+2Y95YBq8FkzcmzaBh
 nuvUaMJgn48wR4wtjMvrPC25VWiZCIwgr/qKfLYtlRjRIpVNc1DE9kMWiLyh06JI4UW4ANKxsdg
 Hysn8ew505PFSV021nIq1BvPemy8n5IHIQBLTNpRBvBcHOZSrbirnn8VAEsIr6qlzyCsIO/hmdW
 Cf8b4QnU6aoTY73HmgcqoGjKsM5nN8VPee0rpIhVDrzPYVJKELfvWoVK+y2Du2ArfrTssdR0kcY
 wg/BGx6QLZHZgJuXqwSIRzBG4Ibojm9ezXdeBRLWZxjZt+xHZ2YcHcMFwHwEvsmGsmtMkmgAVrI
 vZxz/+U+AGEibqBcgfw==
X-Proofpoint-ORIG-GUID: Ldv4l0PP96UehvXjDNkEAxoVGq22UfKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_045600_789492_148A9B74 
X-CRM114-Status: GOOD (  21.12  )
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
> Check and propagate errors when enabling the ETDM MCLK and clock
> gates during startup.
> 
> If enabling a clock fails, disable the clocks that were already
> enabled to keep the clock state balanced.
> 
> Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>   sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 50 ++++++++++++++++-----
>   1 file changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> index fba51c552eec..1270fcac6b3f 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> @@ -1575,36 +1575,66 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
>   	int cg_id;
>   	int mst_dai_id;
>   	int slv_dai_id;
> -	int i;
> +	int i, ret;
>   
>   	if (is_cowork_mode(dai)) {
>   		mst_dai_id = get_etdm_cowork_master_id(dai);
>   		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
>   			return -EINVAL;
>   
> -		mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
> +		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
> +		if (ret)
> +			return ret;
>   		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
> -		if (cg_id >= 0)
> -			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +		if (cg_id >= 0) {
> +			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +			if (ret)
> +				goto err_disable_mclk;
> +		}
>   
>   		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
>   
>   		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
>   			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
>   			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
> -			if (cg_id >= 0)
> -				mt8195_afe_enable_clk(afe,
> -						      afe_priv->clk[cg_id]);
> +			if (cg_id >= 0) {
> +				ret = mt8195_afe_enable_clk(afe,
> +							    afe_priv->clk[cg_id]);
> +				if (ret)
> +					goto err_disable_slv_clk;
> +			}
>   		}
>   	} else {
> -		mtk_dai_etdm_enable_mclk(afe, dai->id);
> +		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
> +		if (ret)
> +			return ret;
>   
>   		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
> -		if (cg_id >= 0)
> -			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +		if (cg_id >= 0) {
> +			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +			if (ret)
> +				goto err_disable_mclk;
> +		}
>   	}
>   
>   	return 0;
> +
> +err_disable_slv_clk:
> +	while (--i >= 0) {
> +		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
> +		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
> +		if (cg_id >= 0)
> +			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
> +	}
> +
> +	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
> +	if (cg_id >= 0)
> +		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
> +
> +err_disable_mclk:
> +	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
> +
> +	return ret;
>   }
>   
>   static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,


