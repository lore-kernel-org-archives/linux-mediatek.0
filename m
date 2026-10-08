Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16C8CA600B
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjZbxDwM0WjPpEr48TjC2geEGFyibd9+X1oZ7NXBEZI=; b=bz/zRQqxCKPqMz9j6Y70A93HzO
	gNf74qVw/rP8orhPtsZAs2HPIO6k11vK2aZEditzeAtKHwNbC4MZ18+koJnBmCRCy+Qk9Zc+8Fk0L
	0CCPrh7NIVcglIq9ND0wj/a2f0a+umCbPq3d6Jwo1V1vuiVF2LIf9CwQx3swzZhhtiUHQEJHtjuBH
	Ym0w5Qu4c+G1S/LNQeBdM7zwYXBbfxTX2ms/jxNL75yuWdYhOZqKrhH4VhXGvknFooVJeRslYBX3Z
	rgPr6KUMYHvn2E6NsMrjRztBH7uvHi5hU952g5bz/YxqaSwdNLiwN5oQpUwTxQDXisv8nHy3bwWWi
	zO8v3Rsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmWV-00000004Gq2-1fI4;
	Thu, 08 Oct 2026 11:42:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmWS-00000004GoZ-3iKv
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Oct 2026 11:42:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BJwZn1881908
	for <linux-mediatek@lists.infradead.org>; Thu, 8 Oct 2026 11:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjZbxDwM0WjPpEr48TjC2geEGFyibd9+X1oZ7NXBEZI=; b=At1Jql3EGdrWhOW7
	NuPq60MwP0gjrEGtwxAWWf68t5bnUtuFk2x2aOL7N/Gozfo0KvRnY3mCe5R2TsAw
	WorVmwJB5Cr0QabS6TT9dYKt0HasWXHER8ADk8h+iK+H6tZxYWNL1nlsW8ASvOSs
	rX2wc/ucoDS+JCKMgFpELxZNiU16nwCvoyIw9kHyDNWSPlIyf9yv5EjneiAMUxCR
	heUoR5yq81U8DPBeAeJue0D+vTu2ViXz2DuRxbVpBESHBarWMtiNXkpTzsO9xp0y
	7zeU9NtBCio2DkqClLdhf5toYm7cAjqeYBOezG8V7Xn0UIEXuwf6OibKw6+jC4mh
	1lDFtg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2tq8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 11:42:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso452412a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 04:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791459772; x=1792064572; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjZbxDwM0WjPpEr48TjC2geEGFyibd9+X1oZ7NXBEZI=;
        b=cemnrIfuCR5jPTUqVJrrxN21e9Ty9z374aOJjF9iJZ6gKrWDUud80JonvoO0b1TnbY
         433wLBdHhKzUBr5t8qyhKhMwAm28RlQaehxxLN1ghjMErbKBCz1DIeDq603xqRlxsd3M
         OBu/4Amz87GrsiaO7t8M7Wnwyutqx0tM6MjVZ22DGbLVnzaHacqSVgxOOIUcOB9GxqpH
         ZZ8AhBL3rqfhmTgtLGZZHT2M49W/brZTZNFa2y15DE0M9KtLg/KkyIvREOZPQOOyaPWq
         Ehvso+PqeirY6kFT14ODOcIc2F1Dm3f1rUWMYbdkC56yEflucde+GYd/R+BwQBKXVQjw
         iN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791459772; x=1792064572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjZbxDwM0WjPpEr48TjC2geEGFyibd9+X1oZ7NXBEZI=;
        b=SAq7IGG7Sbtsv9c1M9GKEdtlMcI5Bf2A8zWuKksBRBYi3nmWKgW30JPdg+kJO+DCA+
         ZeWhvM9BQ20FDavy4P3Oa2ayPKo6+zeF5PZlvsFcelY3OOYMZ+SgDoISed2BsLxSnj0X
         Va4S0f8EKkiRCvNVkmImtUx8vs3lMTvoYV5LLEE8WuMWEVDDYp7uA5cWloWmYBnAILJN
         INnknGIvRhdT5xRvO/y0dymVDnmwfO3Vaesb3dtJfKsO2gPc4mjPH8SSMlWCFPPgvnTq
         9d3Yiv/XHQ53yMPndLQYSYjki6q8TGFQYR6qhQ5UAUTUAlZ6RxTiPHFsUqjjGdrkKMH4
         2dXw==
X-Forwarded-Encrypted: i=1; AKwUvBygZ5FwlOyItGFNXEUA9y4FSMg8M1g7DFag8XvTGk29bHBC6m5nXdJaL/LgCUoAJz49aUW/ZWbppxZdVC/8ag==@lists.infradead.org
X-Gm-Message-State: AFq9FYIvZPhfRGw3VpUa3ElYxBFP1CBrDh2MkvDKjVUX8gcIKXq5GHVd
	bYs7agLpwC2vx3EGBdhqs5kLC5/mG7cwdDYr2GkX6sOJP7K6WjGuPxgM0swx+LKFUgcYecBMfRv
	0V+xADdfGn88R6k+Nj2lBN0Pi2mQMT+8BASMAnANMjw1qaVWr2r7onpnPwoFjnHXNf49IHwSRjS
	o=
X-Gm-Gg: AYBFou0mrqa2tlleeEYscWpHRoul5lx7HQJiRim8NDMVbMzzhUKGCQt1askl3ATzF4o
	FhO233NYbYmxRjWF03phWKy9cVsxApveVaTJC7KKHrxT6BfvW8PnmysP4G18CqZ4QVGvUXTxaB/
	n58Ab9PWuDScUSIUVXrQ1woMXbPPU4g62lDkscPmoHXh3odM4PbdRJrnj9sGuMo149LefwlcM4h
	6aqQlTiWZEgP7+mxafG39XYrGICnw7xNwtPEtzLlKb4QekJm8RVgGYCGyeNE3p5sVPmbFlUaXQy
	1Pw74dZYKR0hc7HBP42LCL8FCvMA/hEHf9Z3fvh3IUtHqhetodqaaZ7oJOgaDluRiP18KRRbXqp
	gZE8yRiC1A5ohSRK3dWe3ccEYmz8=
X-Received: by 2002:a17:90b:5490:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3aaec84421fmr1220448a91.19.1791459771632;
        Thu, 08 Oct 2026 04:42:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5490:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3aaec84421fmr1220424a91.19.1791459771026;
        Thu, 08 Oct 2026 04:42:51 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cc1fbb2sm3776475a91.17.2026.10.08.04.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:42:50 -0700 (PDT)
Message-ID: <018b4233-8a2c-48b4-bbd6-4c471dd14568@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:12:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] ASoC: mediatek: mt8195: Fix paired memif clock
 error handling
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
 <20261005110257.50145-6-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-6-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfXyl4zqwHdtj+E
 UPkrS/+G7BRe97ilRQYPVl1dK93pq74RkY3hlRhePJFeH3LQAsZP1Dt+oVkApZtCefiKU5tI6+L
 0SXcMmAa1ioAO5d7Bb9pD953tJBQoUI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX+09bkW7/DEK1
 YWKyPNJyxeLtlSAz3nwhgpDQ1L000gG363zvtF8fKlXVYoD1B1puv6wqnFQ84PJuGGHm4zJSG2X
 /RsiwEcjNaR12uC/U9iyErI+zkKOUGYKhiVXsLjdeEKy+gZTqx1JGOe1P84fFJ2SJ7QCS8DVSfo
 e0EZx5a+vX2z9pb4/ajqc+y2w4BYOlUGHwFB2sMzZd44RYO287FOWE4RPzzXoWEnsx0SJqrNbqi
 V9pWXOhJ9G4DEavc6UyU+WPCQr4ICfmVpd/d1QH9DrFC6XsyMupTdb0Orm2Zi1bpI9TduOJK0Gt
 uGc3+GHMpErDWmZTa/i+6YC0dvZMtf6/o0uP+LFj3dWcwh4lQOq4DyT+Uxpt3LjWvsFK9S1g7Lb
 JaG38vsi5e/a+8WO4PtsGL+/XLKM0I/zidujQjs1yipNO5teonjSh2JOBQMGJEvZGYZQqe1scOM
 4GmkRpmbh3ac76sW2EQ==
X-Proofpoint-ORIG-GUID: ki96Cark0oYk1wyT3jHq5985O7RAwWd5
X-Proofpoint-GUID: ki96Cark0oYk1wyT3jHq5985O7RAwWd5
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac781bc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=JvgeKo86Odfbx7RWJVYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_044252_937666_B9B5A3D7 
X-CRM114-Status: GOOD (  21.38  )
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
> Check and propagate errors when preparing and enabling the paired
> DL8/DL10 memif clocks.
> 
> If enabling the second clock fails, undo the clock that was already
> prepared or enabled to keep the clock state balanced.
> 
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 24 ++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> index 52c3381e6766..1d3e01e2c3e7 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> @@ -286,15 +286,23 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
>   	struct mt8195_afe_private *afe_priv = afe->platform_priv;
>   	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
>   	int clk_id;
> +	int ret;
>   
>   	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
>   		return 0;
>   
>   	if (enable) {
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
> -		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
> +		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
> +		if (ret)
> +			return ret;
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
> -		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
> +		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
> +		if (ret) {
> +			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
> +			mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
> +			return ret;
> +		}
>   	} else {
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
>   		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
> @@ -315,6 +323,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
>   	struct mt8195_afe_private *afe_priv = afe->platform_priv;
>   	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
>   	int clk_id;
> +	int ret;
>   
>   	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
>   		return 0;
> @@ -322,11 +331,18 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
>   	if (enable) {
>   		/* DL8_DL10_MEM */
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
> -		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +		if (ret)
> +			return ret;
>   		udelay(1);
>   		/* DL8_DL10_AGENT */
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
> -		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +		if (ret) {
> +			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
> +			mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
> +			return ret;
> +		}

This makes mt8195_afe_paired_memif_clk_enable() return failures from the
paired DL8/DL10 clock enables, but the return value still appears to be
dropped by the trigger path.

After applying the full series, mt8195_afe_fe_trigger() still calls the
enable helper like this on START/RESUME:

    mt8195_afe_paired_memif_clk_enable(substream, dai, 1);

so a failure from clk_enable() would not be propagated back through the 
DAI .trigger callback. Patch 6 handles the prepare-side helper in 
startup(), but I do not see the enable-side helper being handled by any 
later patch.

Should the START/RESUME path check this return value and unwind the 
trigger state if enabling the paired MEMIF clock fails?

Thanks
Ajay Kumar Nandam


>   	} else {
>   		/* DL8_DL10_AGENT */
>   		clk_id = MT8195_CLK_AUD_MEMIF_DL8;


