Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6A6CA6002
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 17:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ppSelj+LbGu462DrTIiLj378C/LDIJk0hCQ7sXm9YU=; b=xoDRyjcyl+Jg86rcr2aNrDoDki
	kPHH1xddmJBUVCRW9zvZ0AqgGnw2wtMaoJrBUeZT+F20xWnWBPYp2ZTF/uTjiovgAuPpn9vGU2/+d
	0Z+LQqqKPkU5lWXH9FcwwZ3tK5u8HALfYJx7MeW+tb0W0AxypL2oJ1kyxzYJvHgAnYUFP65A+8K8x
	IJVOpHMT90m5YzgKM7eUAZu8PBn1vBI5sEoxR3/h4q4CHecjhKK4KYJl2AjEheB23J89ZRPRs+Lfq
	V9m6hMF5sBXDzALHOWuv4Kflz3VEIG8NxPn0J3BUEFV5ZVqGqJWGDyzekVJhitb0Cb4DgyfxZpuuC
	W4Uk4ToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVZb-00000002o8Z-0UlE;
	Wed, 07 Oct 2026 17:36:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVZQ-00000002o6Y-03kn
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 17:36:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtKmO3417631
	for <linux-mediatek@lists.infradead.org>; Wed, 7 Oct 2026 17:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ppSelj+LbGu462DrTIiLj378C/LDIJk0hCQ7sXm9YU=; b=GWkuaMYmvttLGWdx
	Yhyxy3cHPd8w1tL64rsju7EXYjQiJaEpYJutWTHO00eHVlC1pZ7Fshjrr6O6Co1t
	fOAZ3B/3qSpZatwz9JwsVmkksLP3/EbGFfF5rjx8wPAIA0acOi5DIixp9DXcoro/
	IN2ZfK2ug/Cz4wRfTZrNXkP5CbqZGDvB76CbjhpKXo57iUP7ZCjemJW2BhDnZdSb
	JAdwkmD1wG3cxrNilnYkTVWMuqpv+oJ/Zq0AXrJPaxykgRePQ89yLoHAWW/Jf+1Y
	SYOuB8gXGtY7E3tMCfN7CRnQBbbDRomEVPhuWHfs6KHYXoJWwrWbDCTvr4FGk8sm
	7GNd7w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u3b9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 17:36:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88a1de72cf7so2007678b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 10:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791394606; x=1791999406; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ppSelj+LbGu462DrTIiLj378C/LDIJk0hCQ7sXm9YU=;
        b=C8CZoQur7e5Ck15y4SWvk4COYFc52QFumKjxJJz28YLg4CD3YcVhpTzaQWCg2H4QJm
         Y/hcpBtZjdMeLIYfWry0n2mEy/Wppy7CabTQnR+CFY6xxybdV62bkB5j4gzsehyiBcHI
         Bmi+rFPe0cFvflq9yR3nSG39uc/kSMFT2FdB99uKPjhaPSrneVJbCIfvHZwVMPGFsyv3
         UIMiOB8dpG80LyUD7+qo2yMGpwYVkAzLNblO1i8r1h1Y3tAhL9xqaRWn9/b/BZjtsR9A
         MpJIqPx4U/re2yBglT0p76CEGtgrwbeVeYLMJLGt0k4ANK+tl+o/6P5sqTwEvyqsBGG0
         JhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394606; x=1791999406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ppSelj+LbGu462DrTIiLj378C/LDIJk0hCQ7sXm9YU=;
        b=KSwQsGyk6wuiNb+//4igtE1OWqn8jcg1hD8rjizNY8+zJSzjGPiT0xFn+DhZ+yRtij
         nRWYbxI06rsNS/z3UCfdemPZlh/RWJVD082YyUB9qJ9mgj9UgA4zqx5NOm5vOdGbE6Wo
         uHQcogcWNykbrP2MKXHyHdtcG8brKFvrPp0AuG0nVQLnytNObnSpthGGO6tptxgYuHsv
         okvkZ9VLo0EAT4gOHXyfXxTGF56er/cCt6iwEPA/yqwcg9zS2cHuOGb3RHyHyOw7zwn9
         Hq9rZxxss1aI8WantnwmNJXV4Z9mBfy1jE6FubFSKpl1xTKc6i3a3ZfkOkpdShF2Thrc
         YPvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvneNW6JzInryHJ3j4vNoA8F4QZlVh38gdfMycVn2w6RnRbZLnT/ynDSR0bHoK44cz+jFpBV93J/Ahq7chmw==@lists.infradead.org
X-Gm-Message-State: AFuF++mFy1IOdy6vcLitbdS/jMZmtee5nWysku1/KSHO3EH7WiBdQeDq
	O7vkF1LYffCoUE+Kv/5zAZZo4jPLHfayNTZCS2euuy+F4PNMNBrfS4NDjNmcFmWNbaFtrOxFjbl
	uL2lfBpsaN34gi+pKuwp0baFe9cCiygwn0P4fOWE8D6hxKysauYeXXQkHbbl2zPN4izLBAi1xob
	s=
X-Gm-Gg: AYBFou0Fq+jzVZrScxDeeRewgEwQjUigRF5GEBrJndCwCvdT2ZPmsQlfmv11Lj5f9zJ
	B3WBkJ3egwqV98w8BvTVlyt9O5JLlfqsqSsFgateKzUVeYKX10JPlwX7kPtvOqd0A8g/XYTbHK+
	V/vIhifpM7JyHo57Nslfg+VN6GmpBtybdmiFra4Edmv2XWXMhZ0fB0KHLTZAmpw9O0jCJ/hsWB0
	SXvNofvnFWL8YaJX8AsKrIxfT5IgKBuXAzwfFQQ/c92EanyxE0n+GwPrRcyuAruVEvUbXy8L6w5
	h6kfE09zIj49IEzglWw6Cspdcw65VJtSb6svUE/T15iLaOiczg53Ds2iTWd+fnuiwqHXEbr6S2T
	q693P+l+124U6eoGQkBRixFTf94bf
X-Received: by 2002:a05:6a00:2350:b0:87d:b6d3:256d with SMTP id d2e1a72fcca58-8904434a3bbmr4021105b3a.2.1791394606329;
        Wed, 07 Oct 2026 10:36:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:2350:b0:87d:b6d3:256d with SMTP id d2e1a72fcca58-8904434a3bbmr4021084b3a.2.1791394605829;
        Wed, 07 Oct 2026 10:36:45 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bbd8dba3sm616161b3a.53.2026.10.07.10.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 10:36:45 -0700 (PDT)
Message-ID: <602b728b-d94e-41ea-bb19-dc8bb3a0e9e5@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:06:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/21] ASoC: ops: Introduce 'soc_set_enum_kctl'
To: James Calligeros <jcalligeros99@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, ajay.nandam@oss.qualcomm.com
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MCBTYWx0ZWRfX0S9E9917VRo9
 8KEvP/a6k3SyiieFNOGgYTuzwoPNv+s6oSbb1hQk+c1jn+YXCr+c1pvU6FWWh4OBHC5neZSkLhu
 j0rinuJ4Ck5Ru4xENybYKgTr3yNWxao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MCBTYWx0ZWRfXyKzYksQgP+XK
 2Za1wllqykiU+VXJkrmuukBIbLPeIDdgMPEqwT8o0y1GhTJhTCqWYXsnuZv6R77HAcrgoPRIOvm
 vgG71Zitvpv3Z6hVoNPL+0e3pW+jb45O2Z+kYQ0a9XMreMennxzXpFzoNgcDVrdYs7KYQ5l+idZ
 vBuOu4hS0so4bLe1Bvqt0255NMPZlpQZqpOXUbhrN8sKGwnz8EU6FcHtgRsLLpGDFRgz6yCuQC3
 ydvF04FZNiZKmeqQcD0g64+hGUY2iDF5RoAIlHtCXK7dt+uNGfqA+1qa3xtKH8tKlhXIdcA9K0w
 FU/TbBA3ENlr7C0UDfhwlN6+p0KXZlfPpFbbveuENuUsw6w1LMeoFfMci98jYzjh8ZWSf17eG5S
 G8UPM76qNnt/vOlcA+M1kePA2ImDS4wDMYkJlwArnxzzSAGRx6LIcf1t/fuHuN80NlvwiNPbDJe
 5D97e47QG9iC0iIUDSg==
X-Proofpoint-ORIG-GUID: Y6FfoWr33_Kw6q30SLfQYjv_n0EeuXs_
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac6832f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NwbpVL58AAAA:8 a=pGLkceISAAAA:8 a=xWCIabhjMllZ6jREgyIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=tNWvAHffTtQgx3ZTRG8Q:22
X-Proofpoint-GUID: Y6FfoWr33_Kw6q30SLfQYjv_n0EeuXs_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_103648_075025_22EAF605 
X-CRM114-Status: GOOD (  26.21  )
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



On 10/4/2026 11:33 AM, James Calligeros wrote:
> From: Martin Povišer <povik+lin@cutebit.org>
> 
> The new function is to be used to set enumerated controls to desired
> values. It is something a machine driver may call in fixup_controls.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>

> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
> @@ -505,6 +505,75 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
>   
> +static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
> +{
> +	struct snd_ctl_elem_value evalue = { 0 };
> +	struct snd_ctl_elem_info info = { 0 };
> +	int sel, i, ret;
> +
> +	ret = kctl->info(kctl, &info);
> +	if (ret < 0)
> +		return ret;
> +

Could this initialize the control IDs before calling the control callbacks?

The normal ALSA write path does not call `put()` with an empty ID: 
`snd_ctl_elem_write()` resolves the control and then calls 
`snd_ctl_build_ioff(&control->id, kctl, index_offset)` before invoking 
the control's `put()` callback. This helper builds a zeroed `struct 
snd_ctl_elem_value` and passes it directly to `kctl->put()`, so 
callbacks that inspect `ucontrol->id.name` see an empty name.

There are existing enum/mux callbacks that branch on 
`ucontrol->id.name`, for example `rt700_mux_put()` and similar SoundWire 
codec mux callbacks. So this helper should probably initialize the 
callback objects from the target control before calling into them, e.g. 
set `info.id = kctl->id` and `evalue.id = kctl->id` before the `info()` 
/ `put()` calls.

While touching this, it may also be worth heap-allocating `struct 
snd_ctl_elem_value`, matching the nearby 
`snd_soc_clip_to_platform_max()` pattern, since the ALSA control value 
struct is fairly large for stack use.


> +	if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
> +		return -EINVAL;
> +
> +	for (sel = 0; sel < info.value.enumerated.items; sel++) {
> +		info.value.enumerated.item = sel;
> +		ret = kctl->info(kctl, &info);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!strcmp(value, info.value.enumerated.name))
> +			break;
> +	}
> +
> +	if (sel == info.value.enumerated.items)
> +		return -EINVAL;
> +
> +	for (i = 0; i < info.count; i++)
> +		evalue.value.enumerated.item[i] = sel;
> +
> +	if (kctl->put)
> +		return kctl->put(kctl, &evalue);
> +	else
> +		return -EINVAL;
> +}
> +
> +/**
> + * snd_soc_set_enum_kctl - Set enumerated control matching a name
> + *
> + * @card: where to look for the controls
> + * @name: name
> + * @value: string value to set the controls to
> + *
> + * Return 0 on success, else error.
> + */
> +int snd_soc_set_enum_kctl(struct snd_soc_card *card,
> +	const char *name, const char *value)
> +{
> +	struct snd_kcontrol *kctl;
> +	int ret = -EINVAL;
> +
> +	/* Sanity check for name */
> +	if (unlikely(!name))
> +		return -EINVAL;
> +
> +	kctl = snd_soc_card_get_kcontrol(card, name);
> +
> +	if (kctl) {
> +		ret = soc_set_enum_kctl(kctl, value);
> +		if (ret)
> +			return ret;
> +	} else {
> +		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n",
> +			name, value);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
> +
>   int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
>   		       struct snd_ctl_elem_info *uinfo)
>   {
> 


