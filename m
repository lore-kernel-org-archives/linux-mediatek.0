Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCBBCA600B
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bNjCY5IuNqeL630y0MA/dAo+PQXTKhAK5hHxNKru7o=; b=UiAACBNnavvW1tIPYGLxe9W0KN
	Tm0iY28qAItYPDY1ZtyMe67+d9jfgQkyBfrQCUbpvw7HwLgYdBmbpsWgrHwtj1ZjKZl9mfm8L7PWP
	nGLtBZWTBeJP9mzs+ffmuDLurpPomoy5Z3MTPgrcklJMBPMcwWgi7wk5IwntVwgEHxquCKqE+u5fP
	Cog3GJ7Tvj9w2uTgcAHf8S3seTEZZyR2ghYch0oCyjydjx/8MLqVima4LhTX0Ww0tY3XBK0AIAHLp
	Dxc3VJiKkWxD3L2RbOfZtMvi9vdYdIryqwF+vFz8Rt7XfIc5HdVOF+cK2Par9IjGWqCrI9rnh8S19
	FrhCHzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmhc-00000004IIO-1gCT;
	Thu, 08 Oct 2026 11:54:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmha-00000004IHa-1vaV
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Oct 2026 11:54:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK4CJ3099306
	for <linux-mediatek@lists.infradead.org>; Thu, 8 Oct 2026 11:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8bNjCY5IuNqeL630y0MA/dAo+PQXTKhAK5hHxNKru7o=; b=N8e8+fBh6SfK0Lv6
	KsPvsmj8Xl7TCdUDRDqXu2u2MTAXKhOxa2LPWdFyHxBzwaX4yMhfyvR8ksxw8Duz
	nIBo67XHK+sVvNOWx+UlxwBvKAyrcCvAZpFxypcXJTAIs52M7xlbIrjKuGtZbKVe
	qLWroJ6R0qnMMD7KZzzs/7gkuubtD0rmavcnO0sBgxTbLTvJQpewigkxHYjJ8sLD
	eHddYT028+wK0/4gn7gu0iOTDGLwyECTUk5JQ4r8/zU61igmtNaEceQhTYqNT6dI
	WGXsw8Cvf+bGFrgrStJrq1EGYNrYyr7GYwl7uZyTfjSZMz0n2TlyOw9EQk+qGxbn
	soHCmA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe82pev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 11:54:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deda201bcso7976526a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 04:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460460; x=1792065260; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bNjCY5IuNqeL630y0MA/dAo+PQXTKhAK5hHxNKru7o=;
        b=gkj3ve6l1RbnEDrPuu3J0Fv7fG+TlAmjzDPU2lOb73EOzY0uLAXcB2cRG0uCVLJAZO
         TKNqBKOVPIZ/qihnjlCQfwANnh2Ik1SsY4j4U7vC0WlyPRz96vkon9AyLtP5YoaqSzfD
         XRpl1QKp0hTU3RIz8J3d7ZUWXQn/qjTOD3q8oljIIH5SNz1dkmocRhvJ6Vr/+sOugc/6
         bOsFF/900fyECP6M1aw3NgJ7osm/AgTMFiwLA0kvy5ryyFAtetU7V3YgW0/FoNwOVZKv
         S4WsXnsHk/kQYA5iftSBAro754W2GYotkvhb4rRYpDc2uGwODg9bTZvdyBlrCu9FUJF2
         XDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460460; x=1792065260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bNjCY5IuNqeL630y0MA/dAo+PQXTKhAK5hHxNKru7o=;
        b=GH1EANmh4FLgpY+sQXy+W/DYjXDUhRJ8QAgg4tv4lyqtkRbdJTdnIvVkWJxRfS9B5b
         prvzpWJD3STvFFZGtQsXpGIByg/cG6vuU2jWs67xnE1C9xttVD6BNRE95hFG7bvIsDRY
         G0+egrHi1MfLuOGjMlsf85+/T8Y5J4gUOAitymLL7hbVHIs60kAZbEHfSGI3R8is+Oau
         wPwjcGtnzMx7vOM/+QJyPXdsQQm1ouhMPHczgS8aQkQ0w7isArpiKNoNprl+F4jFvh1+
         rrjwrqalyUaBWvKQEABvqmxKQDdrUPN9545AYEW2T3rkiMq520zJXJ73FO4jy20mt/0a
         M2xg==
X-Forwarded-Encrypted: i=1; AKwUvBzLBcam4o5Yjnptw3y2UVo+66n/PZZtBy+twlKnraa9cyngeCXYC9oWlVPIjReDVUHM7sl/TPUQJgRZWQeNkQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIdmHi2qsBfdpwrXc6cA7vhNKDJVkbdOqN5xeU4nmWLmW6ct5Nk
	eMDF/oaGgIRIIA2eoYiUsO7h3IGaVFIOLAJrDp/CEfqIywjPSWDTd3xB8uFa0Tdc7qXow63r3wX
	mT0foRti0N4BXmMpZwTMzn5MzgLp4rW6Jn1no7fPig81RXX/uMLtEZRIsJNFv0TuAQC6OwwVN7N
	avT0KUi1o=
X-Gm-Gg: AYBFou2XWUyHLFrkB/yG/biAYqJZARD60KPBOIhgz+Qr/vGnmEh5w6RBR3wxQBospKC
	nx9bjZ+tVWGZCuH5kCni4Eg50Rsf0NMY7J6UhTF5008c7nOnKX4lXQo/RqsK9C29b354GZpcqbT
	gRKi5n6leMd8d/w5NqGwc5bMzSXrjqg73WqCm2yasKCKl08wpjh5oAdoSHiawLJv29ArEe6VvjX
	q5LlQH4CVsx0DTzhWzVM1eiNWQ/JEq7Mc/YBkg/JRcdV56nu/SfRFO/J6iRjloKlcoTnuWOb/Sy
	zokUCA86eLd/Jivd0SyPUtXWX1dEG1t2vVemZIKlDpIi4/fwB/qCmratKsobc7Nz5ELtD7PQxzO
	5dWmc6FeAHd1nm0/djsLkkh3OKmA=
X-Received: by 2002:a17:90b:4b83:b0:3a8:272a:a328 with SMTP id 98e67ed59e1d1-3a89f649778mr4613696a91.9.1791460460124;
        Thu, 08 Oct 2026 04:54:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4b83:b0:3a8:272a:a328 with SMTP id 98e67ed59e1d1-3a89f649778mr4613671a91.9.1791460459686;
        Thu, 08 Oct 2026 04:54:19 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff5aeef0sm4180880a91.14.2026.10.08.04.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:54:19 -0700 (PDT)
Message-ID: <3ff784e0-142b-4234-8597-4b12b91dde82@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:24:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] ASoC: mediatek: mt8195: Fix ETDM MCLK error
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
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-11-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX6TYVW+68W+vU
 V7dUaW2qcdLGVM+Mi4wR1Yc7URz4je59TP2P5vOgPVt9MrNXU17Aqux2fJMrPdrIAmKBy1Ve6N4
 NRuBeTJ3R04O8BUvnKCzDFWFqwGbuSvpmBoDML+OXqLhwMVwFmf0pA31lVEB/XcFlSBBHnSE3fM
 /b0W3esLnRpqkSElHk5EiXjUuVswVhsj1aa2iG0oKycXoShEY+IGGfnUexxONISdPFGA3qy4/us
 iMXIiWzRs6LiasEToAzOt7wbb5WLuz3ww69/m5U0EKtBP1phlJpyuTQTgb9A9Iz/KOJZIF6uasZ
 MMhg/1TpV6e/a3/aqsLuhXD+rY9349REXskxvNguM/XuFJMu7FISNkPt5D+W48fQPsxQb9VNdbp
 5z20dcJZTzI+M0wD1D8kE3Wo4Ke8lojHrW0f1x1a+6z4d1QtLjBKiftqJVDl09702lAfA2gs0XM
 XoUAtPr4jpjWjbctICQ==
X-Proofpoint-GUID: Rd8_sZ-ZyWzfLzv9ja8ObA0k3ZK9Ie4e
X-Proofpoint-ORIG-GUID: Rd8_sZ-ZyWzfLzv9ja8ObA0k3ZK9Ie4e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX31UvTzJOeclv
 hTZbFpHLpXWrYYaVk5LsTU4lVlJvTmjpLLAsnGSNc5boUHz7IqDjXuHOt30qHkQQxb8e6E6U2GF
 7F6oiNpib+VDPHw4PJKyHKhcx0zVdw4=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac7846d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fkDIAU-C-wBUwbiI5OYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_045422_620819_F57754EA 
X-CRM114-Status: GOOD (  16.74  )
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
> Propagate errors from mt8195_afe_enable_clk() when enabling the
> ETDM MCLK instead of always returning success.
> 
> This allows callers to properly handle failures when enabling the
> MCLK.
> 
> Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> index 1a20adb2cbf5..fba51c552eec 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> @@ -1549,9 +1549,7 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
>   	if (clkdiv_id < 0)
>   		return -EINVAL;
>   
> -	mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
> -
> -	return 0;
> +	return mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
>   }
>   
>   static int mtk_dai_etdm_disable_mclk(struct mtk_base_afe *afe, int dai_id)


