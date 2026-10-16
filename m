Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A712CCA464
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2026 12:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFSnFBHYg/fTRbadTyfMpG/V5zT5Z8plQKNhaT3h4mw=; b=DtCFTgRmU/67ez0AO4wZLPvwfV
	RzGWRJk3l8ZMd+tIBMTjD+UPmlBBYgrmNTpaLFk7YfRQJC6thu62JkoUjK+QeOxhprIQXp3l29+kL
	bFsJiXohw6W2PshGlCpYHOAFchbqwhkPV5aFNIM0bpO17SinZ5BxP/NVdElR1MzNWL4puaMwwqbf5
	16dNbe/aZhTAKaFxnqUz+QUsdLhNGtj3FGHueKes6kytrnyjBfrtTWPnciguxxRTq5bFOkwW4ZeUe
	oVcA0sFCDtpmUWj6vAve4n7SbK0+H/B/772oyngVyeXY4ihtfpCIUYstENbL2qa4/eIe4L7NfGUUV
	gstu7urg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgcO-00000002oUR-1pKn;
	Fri, 16 Oct 2026 12:01:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgcL-00000002oTL-2WYf
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Oct 2026 12:00:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA6tm1946118
	for <linux-mediatek@lists.infradead.org>; Fri, 16 Oct 2026 12:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFSnFBHYg/fTRbadTyfMpG/V5zT5Z8plQKNhaT3h4mw=; b=j+MDOWuuEAnLtaCj
	dhFfpJnZaceAOQg7i6HqGoiSNkMEqpi+VhjA+RPY1AWyLZJt3fV1CeQauB5MM0cJ
	h2upB3hlkhqTKsXo6fjvYEyDLzIfJleHYS8d3AsV6v22dqmIyqSIMxZ10MKAvHQ/
	7ZwxiaOxEa1dlBaPT/ULmtLCoATOdhbn/fbNBZSMqQCx5ncAFd7o+iG5tKw6kR9m
	cASy1YgBuiLiy6AyUO9C+FgVjbVLpo8sGSQXrPnX8fMdgLvxBICgthIgul9Fq8Ba
	vgREYwsQ3CjM5qGEFMNBA275Rct0ZEC6O6Nfi0/lu+dwkO+H1HL29vyTfP8YcLCK
	VbWWgA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yrtx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 16 Oct 2026 12:00:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ccacc75a997so1713260a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Oct 2026 05:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792152055; x=1792756855; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFSnFBHYg/fTRbadTyfMpG/V5zT5Z8plQKNhaT3h4mw=;
        b=JCqRgDdtgAa7zmbA8FAqa2ET6udH77HLjVlR/aRkCoekbELwVjQob2Rq3fJuyhnUIo
         YT9KLcaQ/XWWxJiSl71BKPllQl61lkBpnNXmqqKE6UPIXUF5TEH5VOE3z9H8lLvGQz37
         tEmG+am9SS0EM84Yd2coj+DV2MpYoPsYb1eH5l/VADYg6t9SmuyYBY19psnhQd9TIBcl
         SdQ1vd8W4tyRTQbZsN6aQzEkwqplYC082JNF51i5fUT3faN6M7uDNbcGzxbHifqhzrI9
         tf9Jc/LO72KnLeT1oStSctjw1Laazj443LEYhiSfYqjcuLoxDvK+FUAC+RG/0qY752Al
         XogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792152055; x=1792756855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFSnFBHYg/fTRbadTyfMpG/V5zT5Z8plQKNhaT3h4mw=;
        b=0fc9eVaArO7O6j9Zi/FxOeVJS3vAW1MSyG6bQEfGwOA3cYdcHi8YwL7Ic/tb4lHSwQ
         XQ9pnLj4FBJW9H01xYpl8ljahDbt6uSULjjCp1XHnIqzWAlswiEwHd732acStrpmbpB+
         xIvGJdAS7nPhJZ+LyzkfIzIha5Lg0wsUDvnU8nfN0er9IQUabHzJBuBVdBiPMa384Xwu
         pZNzdEl3oWDpz0Fm17aCpLtymJ5oeLzD4HUaXQt1MuXAd+18dqGfyPrSjfusJ9i2+BlD
         x79vlKmyavIQsVk4czFrFSz3yi0bEVeKeugzY3Nrzs1VkcKuG6iPTDMUuSLimAfDcHhl
         K6xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJEDZocGOGsvr5XoQYlJ+lic0C5uPHdHWTJnAiePMrvNX8/RCTymKhIbTJf8F1CG1G2w0bUJ5bBTUyEFM3yA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLNxtPP3nOaPD67bfFUzxD4GZErSc893svMm6tm0dr7ACRRBc8C
	JXPX5+DMXn3vcDJGzy1PPJljVKQpHnKr5NctSXiaxrcoRV1SLSnxO/lXVvYIpmOBybyZ/1U/wJu
	yHsflQBzOzbBz1NZo0T1tSmVWT0SPo3irsz204cqfCpwjQIsOuf6Ys6aIdMFt2LKck9DIyj0jb7
	k=
X-Gm-Gg: AYBFou2BgurBqOgw6V+/BtS+eEqV7DmPigNlDlMNwff815q2yKPXZfU6v34364Fz5jo
	8TYVMPnn6xJ1gaANMI4bFbN2n6H0BzHRbj7nWLypVbtFgbbCBxpjfw3IcbI8gPF/YZIjJq1RIZE
	9gpfdqmqaCKcvHKeOwXbAvIxLnQCpBJX584PjzlKGmz1IypTWJSV3az7l1WMpTASsuu953/c6NG
	iR0pbnnPEtXQbxPkXq+gC5iEB3EZciOAwdw9+3052ey4hLlAx+bfr/2gYuG8j7XzGHYFzkphMX/
	E5hDM3PFzkWQInSc78DWNXcl2ZJ2xSUFIQ8lkzzEdQRdkvymVF7BZIkteD7JSlT8xNTuNIwK6xd
	Wlp/uP2jizqf32KQov/7iSgIvBgc=
X-Received: by 2002:a17:90b:274d:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3acaa8d21b7mr3444878a91.62.1792152054896;
        Fri, 16 Oct 2026 05:00:54 -0700 (PDT)
X-Received: by 2002:a17:90b:274d:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3acaa8d21b7mr3444817a91.62.1792152054113;
        Fri, 16 Oct 2026 05:00:54 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc48e8646sm3775998a91.10.2026.10.16.05.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:00:53 -0700 (PDT)
Message-ID: <3e247695-90ab-425a-a8c0-d6350362d1d1@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:30:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8183: Leave cache-only mode before
 enabling clocks
To: mocker-mug-unwoven@duck.com, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, ajay.nandam@oss.qualcomm.com
References: <20261016-mt8183-afe-fixes-v1-0-f0db51e0c073@duck.com>
 <20261016-mt8183-afe-fixes-v1-1-f0db51e0c073@duck.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261016-mt8183-afe-fixes-v1-1-f0db51e0c073@duck.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YTqSevcqxJ_wz-K4r9TiETWnS1npF1qz
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad211f8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=oAJgE6QaAAAA:8 a=VwQbUJbxAAAA:8 a=RUIXpT8KVlbvrv2-URwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=x6WLLiyY5-E8SSaYOalI:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NyBTYWx0ZWRfXwfJDialDZglj
 ucHDyBGYsEEj5kP9CpuBT60xGBNhhxJKABeZbBINpxQB/wDjfBQuXSD0Kz1EY1Yw9g3bHM+fX5q
 kAGXWf8dxMAJYynQdiImTv0QYhurz2Q=
X-Proofpoint-GUID: YTqSevcqxJ_wz-K4r9TiETWnS1npF1qz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NyBTYWx0ZWRfX6IqQax4sfBe8
 rNKcJtcdqbx5DZbDnDOKRVi3U4Dy4YSSj2skkV0ryz2ZPiPwBiYELxWevbWE9D40wi9Jz7rwi5F
 9+8bxKFmWNeBKRxEp7bd9qhYL8QVDucCQAMAsEO5fPlbwcYOUXRkiparMBx/NVe+6ORczRYoRDE
 WsUEg28mlxEIRhX1BB6/ATLWx8itJyjic7T195j0OoGZLDy8WJ5u+1AMJBJKhUktmbA5rsx1u0V
 Ko6+jI26eZGrR5CLx6PYiBLhOJRyCnTqPmxQg2FFobuqTfivuyveg/y6g4S6UR2M5amhftsN+yY
 TsYCr3BrXaM9RR4omwuc0WtrKqUJuuOMAR+6PGzsTXnXozaAoBVmMQE/o8eHs8+epwmDQfD/pct
 gAVrHpDm9ADcRRPF4vtdGf6LlU/QBHRnTuGipe9xmEOx8zLY7eOzJ0ZBEWmkS6IK5X4/EO/bKhg
 9xM363T5RqTM2L/T7Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_050057_760977_2792F756 
X-CRM114-Status: GOOD (  28.17  )
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



On 10/16/2026 1:44 PM, HuskerMinion via B4 Relay wrote:
> From: HuskerMinion <mocker-mug-unwoven@duck.com>
> 
> The audiosys clock gates are bits in AUDIO_TOP_CON0 and AUDIO_TOP_CON1.
> The clock driver writes them through the audiosys syscon regmap, which
> is the same regmap the AFE driver uses. The AFE marks both registers
> volatile, so while the regmap is cache-only, regmap_update_bits() on
> them returns -EBUSY and nothing reaches the hardware. The MediaTek gate
> clock ops ignore that error.
> 
> mt8183_afe_runtime_resume() calls mt8183_afe_enable_clock() first and
> only then takes the regmap out of cache-only mode. After probe the
> regmap is always cache-only at that point, so the gate enables are
> dropped. The clock framework then counts the AFE and I2S gates as
> enabled while they are still closed in hardware.
> 
> On the Amazon Echo Show 8 (2nd gen) the bootloader leaves these gates
> closed. Playback and capture never start: the memif current pointer
> stays at 0, no AFE interrupt fires and aplay fails with an I/O error.
> clk_summary lists aud_afe and aud_i2s1 as enabled, but with hardware
> enable N, and their power-down bits in AUDIO_TOP_CON0 are still set.
> 
> Leave cache-only mode before enabling the clocks, and go back to
> cache-only mode if enabling them fails. The bypass case used during
> probe is unchanged.
> 
> Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: HuskerMinion <mocker-mug-unwoven@duck.com>

This fixes the ordering on resume, but what about the suspend path?

runtime_suspend() still switches the regmap to cache-only before calling
mt8183_afe_disable_clock(). Should the clocks be disabled before 
switching the regmap back to cache-only?

Thanks
Ajay Kumar Nandam


> ---
>   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> index d8938542b..d6175da3b 100644
> --- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> @@ -706,16 +706,26 @@ static int mt8183_afe_runtime_resume(struct device *dev)
>   {
>   	struct mtk_base_afe *afe = dev_get_drvdata(dev);
>   	struct mt8183_afe_private *afe_priv = afe->platform_priv;
> +	bool reg_ctl = afe->regmap && !afe_priv->pm_runtime_bypass_reg_ctl;
>   	int ret;
>   
> +	/*
> +	 * The audiosys clock gates are written through this same regmap and
> +	 * are volatile, so their writes are dropped while it is cache-only.
> +	 */
> +	if (reg_ctl)
> +		regcache_cache_only(afe->regmap, false);
> +
>   	ret = mt8183_afe_enable_clock(afe);
> -	if (ret)
> +	if (ret) {
> +		if (reg_ctl)
> +			regcache_cache_only(afe->regmap, true);
>   		return ret;
> +	}
>   
> -	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
> +	if (!reg_ctl)
>   		goto skip_regmap;
>   
> -	regcache_cache_only(afe->regmap, false);
>   	regcache_sync(afe->regmap);
>   
>   	/* enable audio sys DCM for power saving */
> 


