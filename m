Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132DBCA5FFC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 18:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcOII1yaaxjPXRPocOIPIwuUNH/5UAtstICER0t6wfI=; b=GaNZYVygaaRGKxPIenR/BLKMSO
	Cv3qHbayxr2ePb1YpKkWUrUYCxUDSYUfYEHO7+brEycubZtdIiJS6HOmjmuaQ/hVZo5hU6zJcfflV
	VaEMPgPiAAIsXRoPR3uJgB4i+7nv4xclyQEnjl/3iZShw64/4epFiHTUTsk+b6/DgUzn4MaWdhUzl
	FYqwfjMDkj2yJ0C58gfDVQSnNzZMqEn1ewEynZizv3W/7Sb9kQq0Aw3EEFO3lCjq0OZY2Go3/3FaV
	ZwZSWVKs1q5JzF73DzKyoyFhjB5E45ehw3QHKao6PSEotCZ+9XytxN4jAgMoMN0E/WuSQddEnr8Oz
	I/vUwudQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWRx-00000002xTG-2s9V;
	Wed, 07 Oct 2026 18:33:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWRu-00000002xRa-1hN0
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 18:33:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697IAkbi3847482
	for <linux-mediatek@lists.infradead.org>; Wed, 7 Oct 2026 18:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xcOII1yaaxjPXRPocOIPIwuUNH/5UAtstICER0t6wfI=; b=giuqBmir98/FhzyO
	dF+rAIA5MY4G3hqnIvHGreVP2UFZtipw8mb61SjqW8gP1lmzOCSY47CEgIT5uWKv
	zVe/xNuv+/SV5+pXhPMrDqPyDFgi5t+de6lLLO1jLy/DCAKJU+WoWDcnk9iKRcPs
	I9KonsWQh8sZEvbeOnxNbCG/VfbgJktbnI2ptL7JS2d7fIH7vvoFwbk5XqhcSgNq
	MhsAldLT6LkShz4FH85UQsut4p2NNynrySR1UCa/yw9c8RBOrtbLlBoHxkv51x0l
	CIaXfxA/FR/ThnN92VpijtJYR5mnMhqUaitsaWgteHtIKv8v3709N9YkIwPkYumU
	mpXYYA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5tu805q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 18:33:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso8474542eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 11:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791397985; x=1792002785; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcOII1yaaxjPXRPocOIPIwuUNH/5UAtstICER0t6wfI=;
        b=MsqJKU/DbOMrjAg8Ux9XbuihW9GPK+2TDwgD+gSojFB0iKw9wX1abCKkAocjYJpkfB
         h8BaUY8Vn4aHvul1/74XHS4PuZa/eAfrXRkHfKw+5xYskE4tHZhO9VDBV3wUEf9XjDMd
         D3+/n8xoBSDwnVzlySax8eU/QS2jej9+NUgv+aFEBss/OKNHVynmA0/7Xfjse5R8zVb2
         zWcldPYuCfHkuJYQSvj/ummM8UYtoeyFef/Uyv+GFJ+w8I/sMIMmMOmyvLcVMxeKmrNj
         8Bo9kdKL6zEKYRMoWqPExH4VnGsUu2o2sEH33LVmGnt2BO+IoF6iN474PIi4Ka9xx+aq
         no8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397985; x=1792002785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcOII1yaaxjPXRPocOIPIwuUNH/5UAtstICER0t6wfI=;
        b=GpCpvlBvsPyQLXWSkwTmBoQfYydGeYD9osIIcBoEE5+EXwdESOrI9pGb57lwlERHcO
         8lrmvrFGGAgx9j7USo5ZF+JRUlGp5FzggIOYRSfnmzK2cFc+NNhExjezaaKVgmMfU+F6
         lAUIfLXaYHVl+xk0Kd126B3zRMk9Q0nCd6j7aHEHJzLdsGDDtTX2FPdL/CoMGNav303G
         NATfg3ekcWP+LbC2JHuGPuZ/eTbwjjIM0+J512GGzjC5di6SMxqCURQSbJyLHxrOVbY2
         Gw4BlhUjlqI4lM/YmDyKurgfJxaR+pDEHIen+xJ5n8E7DJbwAYB2y2of5rqq2arSJ0Gx
         npdA==
X-Forwarded-Encrypted: i=1; AKwUvByMkaFOXkC0dvSpPSUnYqSNfZtRnYLmMz1g9sCQ7WWZpZPSsgZjWsLMldD1zOYNaDjqRrlzqMjY9oo0ew71CQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lFLXOk3pS3I6B1iBUBt8apexWdpWmQzEqbhyv8bwe62Z90adIo
	YciQGM7fCa2Xmv1BynpElNvZiHzZBweT7P1j2zzzSSbeL/siGfCqB2KtQofaGoXjyQHTGA9mAdm
	3MYq7cA62JDDNuMq5R9nRYAHoob54yxbbpru50AAxp2nvLZuxsLvFKzNflVOds4rqoJielH0mEW
	g=
X-Gm-Gg: AYBFou1mXhtwO90Rtj2oW2INkqoxQ6wJ8XobwTH3BdRl87H5tly4ryepqXzC0ajoscp
	GTW28HTH/irhKIpqvS3zwA9+MBs5TQBoqNWpAv5mEfyNNzDqqsh0bhPm7K09T5/PEp8dfe3IV0E
	+zIRPi8e4Pxk56n9NgDaOVDr7/wH6/VQrUfc3WzZEMzQc2greVl4K7rdhioqJKCOutziEsN3/Yq
	wMqjqSyBUn9STORSEyyeMi5tkHHejbmEkq94PUet6Gvl1p4IGU+0RuDnBIGfrFkD9zwIGN5U4jh
	NrJ0mkVSXIGiwxLoWDa2LHN+kp21plMzrv2nD/tJY5EsCgjKOzLNtr9ye/20aChd4xe2uiBA1f2
	gDenf+l8lgFjCg6fyewtvKQILOAA9
X-Received: by 2002:a05:7300:ac94:b0:343:4a95:f120 with SMTP id 5a478bee46e88-3515dddaea8mr3997314eec.25.1791397984884;
        Wed, 07 Oct 2026 11:33:04 -0700 (PDT)
X-Received: by 2002:a05:7300:ac94:b0:343:4a95:f120 with SMTP id 5a478bee46e88-3515dddaea8mr3997250eec.25.1791397983841;
        Wed, 07 Oct 2026 11:33:03 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af90521sm16456444eec.19.2026.10.07.11.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 11:33:03 -0700 (PDT)
Message-ID: <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 00:02:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
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
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: luWrdGzfggowonMYuiojGNW-Tv31I9f5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MyBTYWx0ZWRfX5ye3yjJdoTuF
 6Diw3wnsyPmKL7ir0LzEtg8J5dh5bHxo1/SJizsvgP5M4YVEihCC+2qjR5OX6LnkIscF7paAYcc
 9UBXTcbE+bjJDWUFEHsuKDkl0cD34o0=
X-Authority-Analysis: v=2.4 cv=H75OUOYi c=1 sm=1 tr=0 ts=6ac69061 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=KKRqKo6ZSQ7ryDd2x_cA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MyBTYWx0ZWRfX2LKcVO9WtD+L
 iLcA3CEchYE1sDdxmeVO8yGdKpIrnHb087n1CTCW0Oj2JlnewOAO+ONYJtVRVxoE6JTNF0LFqPD
 Mcd/8q2RfaMYR817syCSP5xegIBUxqHIfG8HMAJHF/6N1p1dlMRWaCaPkd7IPedkuwzRTFG8lNX
 +lbpyBIPrlTOB0sZBWZSwjpSMBfmnO6dhTcS0f/iRihOdIxAByDOYwQkzckBcxqbp6uGQO9JNLj
 J1tWnZmB6jeRz8q4xYgZ/iaxkVmldE7udmA1NbK1BXuJ1loEy5DZQaLrOmRCRf0/0ihlPuvm/Fl
 0TuLx9FqdrouGrFswl+VQxMWvoUQJfjLL3NLLnM5LtkSghFAu3HINV+bJP4VVRgpo7zSFCZXsYl
 qc3pr5Qwa/fVaOTr32OIikmY4I7KyRCETBU6GujB4Up/m32ttgXWmO41l3EO7LQOtRpKQ3NLms6
 4FOWF3L8RBQ9FzYjNlQ==
X-Proofpoint-GUID: luWrdGzfggowonMYuiojGNW-Tv31I9f5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_113306_459036_54A309A2 
X-CRM114-Status: GOOD (  19.93  )
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
> The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Add these nodes and advertise them to the machine
> driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j313.dts | 82 +++++++++++++++++++++++++
>   1 file changed, 82 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
> index f8b2b1637b9d..cdda63ca8b34 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j313.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
> @@ -55,4 +55,86 @@ &typec1 {
>   	label = "USB-C Left-front";
>   };
>   
> +/* Audio codecs */
> +&i2c1 {
> +	status = "okay";
> +
> +	speaker_left: codec@31 {
> +		compatible = "ti,tas5770l";
> +		reg = <0x31>;
> +		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Left";
> +		ti,imon-slot-no = <0>;
> +		ti,vmon-slot-no = <2>;
> +	};
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +
> +	speaker_right: codec@34 {
> +		compatible = "ti,tas5770l";
> +		reg = <0x34>;
> +		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;

Both speaker codec nodes reference the same shutdown GPIO. Is that
intentional for this board?

The TAS2770 driver requests 'shutdown-gpios' per codec instance, and 
GPIO requests are exclusive by default. So I would expect only one codec 
instance to own this line, while the other appears to fall back to the 
register-only path after the GPIO request fails.

If GPIO181 is a shared physical shutdown line for both amps, how is the
power/reset ordering expected to work across probe, suspend, and resume 
when only one of the two codec driver instances controls that line?

Thanks
Ajay Kumar Nandam

> +		sound-name-prefix = "Right";
> +		ti,imon-slot-no = <4>;
> +		ti,vmon-slot-no = <6>;
> +	};
> +
> +	jack_codec: codec@48 {
> +		compatible = "cirrus,cs42l83";
> +		reg = <0x48>;
> +		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Jack";
> +		cirrus,ts-inv = <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible = "apple,j313-macaudio";
> +		model = "MacBook Air J313";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@0 {
> +			reg = <0>;
> +
> +			dai-tdm-idle-mode-0 = "zero";
> +			dai-tdm-idle-mode-1 = "zero";
> +
> +			link-name = "Speakers";
> +
> +			codec {
> +				sound-dai = <&speaker_left>, <&speaker_right>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 0>, <&mca 1>;
> +			};
> +		};
> +
> +		dai-link@1 {
> +			reg = <1>;
> +
> +			link-name = "Headphone Jack";
> +
> +			codec {
> +				sound-dai = <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 2>;
> +			};
> +		};
> +	};
> +};
> +
>   #include "hwmon-laptop.dtsi"
> 


