Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BD3CA600C
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 11:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7lpyucCLeWRSMKbZZ43xEGjQe1T5CLWa0gZpcDiXl8=; b=sTCzVGHqjYz+a9qjFL8n4kk1/f
	HM/pfwlyRVD9tkffh+fJBudpnWQRGsy4VGYnPiOv06INMGMwwur1KTNxBCWXGqy4QO4cZ8HuIL0GE
	oxom5IdnsWDx/9HCe/54bPaxFmTr5+Kv2Hd56vOuLMz9OWtd2yG6Yaji26deopOOJsM6EsSHGttaN
	10RfloSiGpYF1ibMz2c8mJxo76yVn821BSRAWd1yCoQFVMOLdMIrbA/SIGmXjI5o53hYR0LIaAjGV
	KvfLerEXpXjSpEtvcE/9BB3TgzBxN1+6cT8J97kIl1+zT5MUiTI7jkQjU41iAYM2QUh6lMjMBRblL
	aYRNqvnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmcR-00000004HeC-1a21;
	Thu, 08 Oct 2026 11:49:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmcO-00000004HdB-23Ci
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Oct 2026 11:49:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK6IY2383949
	for <linux-mediatek@lists.infradead.org>; Thu, 8 Oct 2026 11:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J7lpyucCLeWRSMKbZZ43xEGjQe1T5CLWa0gZpcDiXl8=; b=akue/Wrx4LlADWhe
	kc1Qhr/HbliJoEWUnAfatjZVPBrg4PEcWq3UuVdOhvPgBMXkST3yW6J98j3TXfMH
	UarS26K1NApJT87nwcT9pt2V2yb6YKqfBJIVRRM8ZXRbTVu6NnpjZPNziUe5Rckv
	AvWknQoyiMtViplbVMMcEl1X+FU+bvNXuCQhsi20ZVNZ+pgxXeRnu1F0hFK37tcl
	kPRu0KWpBDzGhzkebWwI8ZvinfHHjwOlzy4p/sjiztyxwJv2gXZzH8C7TwL2Rgkt
	mO6a8imA71fYTcrNPTXx+2/gJkkp39+p8thw79kLk56gqyC2PIByW8cd0QZ4EMAc
	ojqhww==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jtqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 11:48:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so7458286a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 04:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460138; x=1792064938; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7lpyucCLeWRSMKbZZ43xEGjQe1T5CLWa0gZpcDiXl8=;
        b=cW/UqvxJH49R1PZxRpDZi9OVhN9s/cdCChv1I5mtQ7qMV1SAfuQ2pziSt7fldKz/xh
         /pOgFTSQIfMzAK4X6JweItWTZOoHuoZYhMVzdsotnbPI44x0j86+1G5WqCiXq8/kgJA6
         fOcKhuuJ3nUuyUV50ruDyEQ7WKJ4B28G7LnOwtg/SSWczod0rOQ6UPwEFentMrjbK5RK
         KIOdLeGYS7sJ7CjeemfO6Ha7nfI3y+cZxnEzbg4wNAM/oj8kiJHujYwdaooJOVCgPwsU
         cEyQXID12Y46zeH//Z0jfo0qFm2ALoVjDTlZDbymimiM3NDp/dXMZwbEzi7UMBhgck9G
         B0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460138; x=1792064938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7lpyucCLeWRSMKbZZ43xEGjQe1T5CLWa0gZpcDiXl8=;
        b=By3zk7D4n8q0GMQGlZB2UoiiqzVWKEoOOxTQnlPvOTvNMb8ArfCLQKrCvwPB7zZ0Ss
         63BgZPD9/Ng8OReKprdcFaGG332bZZL5MqarvPb8FBPpYyOC0KXKrwFwXlw2i+g1zWgW
         1sLu55eEp32eRHQPFmANbRqKkGQlVx7gk+LvpmPcEcjWW223eg2jv9g0rlxiqM47BE48
         FH4S4ijA5FMJsYNEGvQXV+Ai6bbVbVK3Z/k8eH+FrkJgMFwJBIij8i/hSitRWzyjRkk7
         ALf2IbE5FzU0uv35faskG6qBuKiBTMd9cLZWva+7b6zIb1NyDxREkMnYkblOJ1h5Z80s
         aJXg==
X-Forwarded-Encrypted: i=1; AKwUvBxhJI7lTIZpR6kGbVFlZOgZINkzlB8O4hzUZiGuig4A4MfAwtS2DxyQ6dUFlCWtdXGvYBdPqJE5ze+2RGcvNQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIZzhd/y5xggbnnwlGbxDQBWJNPEbujmZ4o2RKXjTwe4bwlOruY
	VC7LJbclynCgzwYWPgUGZBs5fReTjzaD5KmeC622jdtDIxI/Xuv4s+R9byNy2zp4hZn2VQ5yByS
	JruY19QCDxZ5FFIep8/ygoRQlyF86AaYrikRdFQzHNDGnVYW2hobqGojkf2JNXRpB7T/68fQ10Y
	A=
X-Gm-Gg: AYBFou3WTag2JzgPdGoT28yM1mLw1aKQc6vHyOm1VzfLuL11oX2f1QFjId4k6zYNF8R
	O3rIeXMcE+B2b4WUmvDPtPSud44sdaZXIFfKuGAsTyg0lHPerkYUKSG6PVNLMDPzmy6wMo6dnVd
	0E6tSPydIszKhxpvblChpE2Mlel3SNkKpPiI6qm9e9EfdtePGYnZCOdk55vcvHGe8d1k7/30mgO
	nCsNDv9pa/qaHKja98rea7YVYPa8FdZMa1nrD+PjAqj9EbByk1PzaCPefS0ECphlmvDVDjB/HJp
	2yhi6+6whnpXxttgE5vIV4rI+mHcze+H53q7PZxaVfHAH1TfEo5rhv/lFKLl/vBA+G16neljUQl
	ttj7lAVQKrubIMdNn4VaXFb6sbb8=
X-Received: by 2002:a17:90b:3d89:b0:3ab:c80:936d with SMTP id 98e67ed59e1d1-3ab0c809900mr758639a91.19.1791460138264;
        Thu, 08 Oct 2026 04:48:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3d89:b0:3ab:c80:936d with SMTP id 98e67ed59e1d1-3ab0c809900mr758586a91.19.1791460137159;
        Thu, 08 Oct 2026 04:48:57 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff5cd5c3sm4315881a91.17.2026.10.08.04.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:48:56 -0700 (PDT)
Message-ID: <0fdc0f3a-48b1-481b-8ef0-8d415d99e6ce@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:18:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] ASoC: mediatek: mt8195: Remove redundant error
 message
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
 <20261005110257.50145-9-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-9-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX2ihIrZ853mTI
 6uSOcHkOpSvXkbQvqlpybNN7UqpChXMns+qx2pTTPcvUz88M5PyWvDJNK64b+473Mh1toxfkMTB
 d0IKEohgw4dU/bFg7PZx6vW5TCU5cf4=
X-Proofpoint-ORIG-GUID: aOX0kBNd7f4OocA090UqfBXWGrzjhVdq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfXzqV5h1YnxErp
 L/wN2s29CKERVu16cpD3vqo4YDKi3u166zPPNfXxRKRwNRpsK+z9jJbI+AinE0Hd7znnTnOsoDw
 9MH9hiJC+APDBrxePmGAt93vLo/RPeOSKMFRr2KJ0YtY/OyGAgcs2Bk4b7Q2jormMEL3w39vccI
 /I5s1/DYZCmHLii/iBKk03vu0k0e0OLjskpdgId5RC6Q7AE3k6sbAaYs5h++NKv+vf27LmSGNSM
 j3q5HMLljkoAl9+x4jpcrrqQaSvwkQudqqRT4NOjzRf3LcNtpDr3QxgTg/L2RJT6pbdFje6AmyZ
 M+OMeDp4WM0aec3tNHUpqDLs3sjvo4KXSajhnkCF/EUNQfLSuKIT4oJ539Mr/D3x0OQdbdkWsRZ
 9nkWmP/Ftq3QMOnRXJOI1OGczlZJmDH61kw0F8tG1HfIYzjNgLHJWyf0bq82zs+z4LrPr+jYU33
 e7/6d6Emce46DweCtMA==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac7832b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SQuuAJ8L7pDmPWVkXYcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: aOX0kBNd7f4OocA090UqfBXWGrzjhVdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_044900_639455_0A68DE5B 
X-CRM114-Status: GOOD (  19.51  )
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
> The errors handled here are already reported by the called functions,
> either directly or deeper in the call chain. Therefore, the additional
> dev_warn() and dev_err_probe() call is redundant and can be removed.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> index bb357cc674cb..1bca2f62e76e 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> @@ -3083,7 +3083,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	/* initial audio related clock */
>   	ret = mt8195_afe_init_clock(afe);
>   	if (ret)
> -		return dev_err_probe(dev, ret, "init clock error\n");
> +		return ret;
>   
>   	/* reset controller to reset audio regs before regmap cache */
>   	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
> @@ -3130,7 +3130,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
>   			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
>   	if (ret)
> -		return dev_err_probe(dev, ret, "could not request_irq for asys-isr\n");
> +		return ret;
>   
>   	/* init sub_dais */
>   	INIT_LIST_HEAD(&afe->sub_dais);
> @@ -3188,10 +3188,9 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	/* register component */
>   	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
>   					      afe->dai_drivers, afe->num_dai_drivers);
> -	if (ret) {
> -		dev_warn(dev, "err_platform\n");
> +	if (ret)
>   		goto err_pm_put;
> -	}
> +
>   
>   	ret = regmap_multi_reg_write(afe->regmap, mt8195_afe_reg_defaults,
>   				     ARRAY_SIZE(mt8195_afe_reg_defaults));


