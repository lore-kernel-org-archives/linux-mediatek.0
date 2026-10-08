Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE52BCA600C
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=; b=xl5Do0PAScxVop6HRjft5dZtY4
	T6wELVmQSPAg8fvQ4Q4nR4gk0Q1++y+S/BY4YbYOQRNzHVJEbQxGul4eKSZSq2QcsOihbwjhvkS3j
	shwBzz3vJP/XDMsS8k5jQdKw+ZI7iEZ3AOJ3sxsBu8qF8/0BaTM/qXCWzfUOZZqWEa94sFjz3G38I
	H4g7SAyJUEu5/RJQ/qX/TJq1vwMKgLC0vwEIc4VLpee7LCD29Pi3jogk/Xx4PJj/gMDsU+cyOso31
	4nbUW1YduUPvhTQMSlgl6ee4pF0oT4oULmq/qKABIh3aMKP/FQg/yJRJdzIisDqHUWQtcxOoaZC1m
	Nb1JF47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmeO-00000004Ht9-42x1;
	Thu, 08 Oct 2026 11:51:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmeL-00000004HrY-2EoX
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Oct 2026 11:51:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKJG81708558
	for <linux-mediatek@lists.infradead.org>; Thu, 8 Oct 2026 11:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=; b=fUcqI1O/4rl7SyIx
	NhvkJS+F42bLnU8/JqymQMwotM2ZGA3Bv3GJEabhst0ap0I9ZyiPdqo9RwxmsHAf
	RG1uyKqBvm9IJ31XbftFhTJFYMKMkn+KUSIzZkoI5sO8LEA4z9hoEJ0haBXRMI65
	bWQSqIBFcPYKU7+6ZwX6R4mThDR5kBs9FzWRo+uVyj9gKJ+tdnR91G9OfVXCEeOp
	ULj264Da5qCYqdSWVE2iHUc/9Rs2p2SraB2dlfw/pV0O48FI2hiV/nkBF5A2rQnF
	ddYbUzLNV+A5+uKm3P0EAs8NEG6Bp4voHyTEjunTlkbHW5apV7keHZzMwt46ZBSn
	tvN34g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3aq39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 11:51:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so6900577a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460259; x=1792065059; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=;
        b=MolEJCEGTcxxtZ6k4cB6f/VxbU2ZDA+U+v4CxqlWc6+DRn0V7uNtEBTunG+zFysXYw
         D7EifRsKApUbl3zU9PsOKW5YJeZb3APabYGOJURghOfh7DFrGQz69PVysjqZxKPUYGHE
         NWbdrm901vo1flb+3Ft6vtZxd26L7jL5IUUPDT2x2XLFbpmxWibwdUeqne3VIaLXRFjO
         Pa/gMoEhl6OhzxShOThBvtCTq2MsD6xZTKoVQEcIDRaV+UV6pTNlzLEPnXzFnbS1EFVL
         XhL0SBI0nBvHepBg4v/fn+03OIwDPbL32jrxTMw/tV5XHaD4DjZSgY3imZr3iDzncRO4
         bBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460259; x=1792065059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dERFh+6tgQKI7QA2ghVyFA6Snc4VzECI2TsSXb2K9k4=;
        b=IWVpOFQDPwd6XV21LqXMrg4mkySGT/8QtrAFJHU24fU63OsVLG1ZxRu9Sj6p4/IUgg
         ycgsCqD4l0UXxx/JBSEaG2vbAdrTPfeuxcH922NB63vvUv5OgE7SR+VhRKoIcyYW/Hm3
         mWuyFQXqMhWr8scrPQe7+bvo081XFwDkh2oTnJVwyS0hLJMssQPan/hy/CcptlbRN9BL
         5vpLRm4M42fM2QEDCIz8Xaul10PnzvptPNjajJrXNFaGmtR09Ets/Xn3J2HfSb0NSy2W
         n4pl+CkYTcVhV/Mx49N7hZkc18oxPekAd3WBote9t4WA9Z5uAwUWUCIwk4na4wW832KC
         BZfg==
X-Forwarded-Encrypted: i=1; AKwUvBzLkxAlYG+O+N2XrQxgh9HDWeYIJw9zJnWfNpDVqlLMUAP2NPMX+qgC3aC4tFIQ6w2HCTnnvTvgd+kSw1EM4A==@lists.infradead.org
X-Gm-Message-State: AFq9FYLRbOI9Ef6rYHFCVDo5xqhvLfi956jNlVwM0RWPokapXoHvvkF8
	Bh34dp7idvyXoFM3H/Mto7cFkCXWMLCpMaSjdA0ie5jaiTYI8rbLpKAwxz+/vuQo6F/3wNjGrYd
	zpM4Fpc6OUo1VrgI1r7eJ/9+bu4BheUbvs4rVJMOXqJoGRSVd4ZyT+HMMkxmJHkx5YgpDJ1TQXM
	U=
X-Gm-Gg: AYBFou2WsFgPIiDBDQTQgflLbSPd+/CQN4rgwFqRkVInzBYv8COKDxD/4Ev2pktSmrl
	VfiyOnW7W24A2CT8oQtWk6IjXgV4rJ0SSylZ/qde0ZhiHGkTSfJFs5eEWkPUDwCviI5q332CSQl
	AFjKgGDq7kVihITy7jObtj/wfzNcFxhjSc5DIZX3+Nri2rk22vAMs8oN/O/OHG+sU24Y2ULap2F
	j0LCDTEbrywiGtp0OM2RxXLF3s/yKsNH8slggbkH4Bc9CUdixtUpIJ4j+ocpqMSxrofM7zgx3+A
	g7x/dBfqG87LTcd018C9/J154sDAbxhah65X7OafK2Xp7v5Rd9IFk7QvOXJi2kXQbeo6wF2dgkD
	CFE+Wd7dgT18VrNKAiY8OvA28SQ0=
X-Received: by 2002:a17:90b:3946:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ab1b1979d8mr232245a91.6.1791460259625;
        Thu, 08 Oct 2026 04:50:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3946:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ab1b1979d8mr232209a91.6.1791460259138;
        Thu, 08 Oct 2026 04:50:59 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff817537sm3864991a91.8.2026.10.08.04.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:50:58 -0700 (PDT)
Message-ID: <eb3bb86d-3d73-4dad-8041-8d8e26c2cd21@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:20:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] ASoC: mediatek: mt8195: Propagate IRQ lookup
 errors
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
 <20261005110257.50145-10-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-10-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i4JNmg1XVqI569fNI3lyCF1NDL4k1IbM
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac783a4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fkDIAU-C-wBUwbiI5OYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX2d7efadTp+26
 izUcAxyH6PAiyU6b1Snk1rk9YOTINDeGwipMBt1EfjQ2JzwRjKfEyZRd/fhlPKqNzKy9s2HFKo3
 ylExZMNQ11mgYsjgpogcSeiGoDDQSzE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX860MqE/lM7KL
 ZcEnYUblw7hTxzQuU8dXF9h8q2zpB/rHgjAndw/kWNKUn0GEGCRXryUyt9GSApz1it1fUNTg6BA
 cALPa+PiYDBZkv0Nj2YIWBmvODNM9z+p/ELWalptEYwX2UIHBKKKUXiyzOFIFbXxzOf5ZEKoOi2
 Vkjm+Cx8Ev+2Tk3zKnzPwOg/7tVOqFjoLOJTEvFkANgenI+HToRXw2WAryRIVf3xbzOE4Hj/rUv
 Of/rn+QMAIo4Gvw1R/8NYQPBhbed/H+nbWoWUFLnPIj8udoM1WM4JWdvMUaTu31oKZ/dSPZn4tF
 lZWbHwXza7XmLGrtrU1++LH/mtfP3gMaaK/xnE4dIzfeNLSkGVirtQ+/PMgv9KbJ+wp3tWxQKlP
 3XFByIYRJ/2njYUue3kmJ/9brMf7/MsxNJ0uOelWnXmfj6+QwV4ui9bjHHHkhd8xxPZ+PMBVGXO
 nMy2N1pZIXHpheCJLKQ==
X-Proofpoint-ORIG-GUID: i4JNmg1XVqI569fNI3lyCF1NDL4k1IbM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_045101_696893_EE75E8B4 
X-CRM114-Status: GOOD (  18.50  )
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
> Propagate the error returned by platform_get_irq() instead of
> replacing it with -ENXIO.
> 
> This preserves errors such as -EPROBE_DEFER for proper handling
> by the caller.
> 
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> index 1bca2f62e76e..4ddf2114a1ab 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> @@ -3125,7 +3125,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	/* request irq */
>   	irq_id = platform_get_irq(pdev, 0);
>   	if (irq_id < 0)
> -		return -ENXIO;
> +		return irq_id;
>   
>   	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
>   			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);


