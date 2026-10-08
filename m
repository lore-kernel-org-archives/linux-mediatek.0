Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EADCA600B
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 06:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=; b=2xqftundqQ0j9yFqdQ8QgY2j9c
	gIhsa/llQoOsvGaHlrayNq29lHfOLhSHUuP62k/7gxtqZcYvWgNuZ15vXmIbI0OeEQ1UormnBAE09
	eM6CryidcvgwOfxy/X2HglESq1wCdLPY8jEcYMiUDU+FE3Z1Db9ZR2U65xhvFKitFB//CUyi91Q+8
	mgOP0B9RucjthVgcNnAM/CStUvVdzSeFDfxRAzsbOqX5fNdP0K3+cvblhEh48IVb1akNBnTOP0ITX
	0fgFK7tWO+x0DspjIVYDImFtcatFFCr9RVS4R3bS3BUZCYTWDKxUiqY0NFXv0yaRw12fMtp6X0tR6
	XBOFZ/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhT2-00000003d05-2FaV;
	Thu, 08 Oct 2026 06:19:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhT0-00000003czQ-2DUX
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Oct 2026 06:18:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BSve1157525
	for <linux-mediatek@lists.infradead.org>; Thu, 8 Oct 2026 06:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=; b=gW2v5S5e5sa5Yb41
	tkhYl/JefCzIgByxIoWKayWoEjlGs+o7BxGfrdi5I7/DQBHO9fG/857kGsp/r1YG
	3dcOPYIdnm9yYD2D+CYaipsNYW5Wd6uz3BsA1OyD8k4iR63P7/QXLahXZFslPUif
	njCLrDG6P92+PnIhXv5A12ld6WEU1WbDSOL6kpb024dAZWUVl/UCdIh3h6o58+bh
	xPVyr1w2O5hzt4QBVMektOkw201yAfcWMR0otA3TeQJv73CghMsXwfKgh+ZYMZJA
	X/2hKzAhZXUj728/QTUQzACXEP9sl3gQLK4qqHr/n8Qg025FhQ2/TO8PE86Vq4Y+
	sUrjgA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51e78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 06:18:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e80f7acc67so2932545ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 23:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440336; x=1792045136; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=;
        b=bLNq9Yw3kE+xjkr9lzE6XDvugOa9rEz92JXVpy+0ZwVy9TMmFWNuYbIWVf5aXXoRN6
         o1IqneimtBHpFZisK+6jZdQaXfxYG/UHQxCTRASF19y3kFKJuvVtMt/ba7htS+a61vLB
         idtnGrz6BnTjNsb6ys92JOtrUhJFJZD3FHR6JphrqDcjNfqKdUfIg/L+ryDoeCP+joKr
         5uHBgLCdu0CGtI9+FBEaiymE4HkKXaiRnN8YmdY99yZiYXitHWa9bpuTTd1e2/wu4SIv
         1+JF/VjQysRSrohsAeONwkfMd1pzOO0WOAlnoFeY4ebqMTPoVAeWJp32RWh2tHilSfhf
         oH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440336; x=1792045136;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=;
        b=vGKerqHoZ7o2f4FftAM1zI7s+KpNn4NHkZtHVqeJ4SUqVxHnLE3Trb86FBbBdoHeY+
         CpJjPrF5rl330390z4hjuZo/Fszm69k+Fgx8ESGLntBIu95t63wUVDuqDnjWH5ei09SO
         S4jqPJ9DuzFkPGoop5TXdV1lMjtKyDq0DzrsEoYLAEWS+OgCoWtXMF1TshLDH6OLk874
         71Zlm822nLqV8+dwq+J+Sk+RyveXTq9C8LB+CO+hlPZcMZyyFC+htFbIberoj95KwxMS
         qso2cMspmL5GaMauir5SRtqaNx3/rPt5KSCdVlJZEMH2dvUMDm9h/kc0nSrztB0DS/EA
         OBZg==
X-Forwarded-Encrypted: i=1; AKwUvBzZ40mtNoBn2kc3oHYFJJ8lOP7PYQlgxkY3YOa28OJaKtSjJgD7jwnDZIrSn+KMpYEAiip7zf5QvIgYA2qS/w==@lists.infradead.org
X-Gm-Message-State: AFq9FYIvYO8qOBzKcGSEheRL4hqn7WUYFqf4TDRiGZrw+JvrFiejfwmB
	qr3SLhUY8Kv4vGFtxqYF6idntSBTKjCisWrvpOulFWKaxAYpFYBoUJD8LD7QNtBIR4ypsWQX2XA
	3cHQvJ1FUamsHFFp9jiY9eayPmBGhxxNtOK2Ylf0q9UFzOMXudrFw5dt3jYQTqDmXnFHHigZolT
	M=
X-Gm-Gg: AYBFou0N/eyfpk50xTR7/VXLO93MlO1EPCJ9VvAUeGbXZ9byrGc1/AXtzvKzvdOuImC
	i7znxs3sWNDtrvgPB0hIlVvdCHFQOkh9ksdvRHfLgkUcQfOrUevWqt9JwDgGN1yf2y+wVwb5npf
	D9Vw1nbI0WrfImr3YGd1mwyPwQeeXzSKPQQhOHmErO/iGeyr/OAzyA+gP2BZeVZliibPEuFYcpL
	GSWX/mE62/OFBflax/yqsd8Y/egQfy8/FSg6Ad3Cwr5VEZRb9vrBpB/wxM0mb4+Y5ysZqcMYOC6
	o3QvBCXgGgwB9v8Bf1uTY0Log4yzG6YzlmI+ATDm7Fz903zswIq/394Yji7dvmw7QvUbwaWe1eh
	O5kDS24XtaNYnxu4Bxl7L2KQ7eug=
X-Received: by 2002:a17:903:2445:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2e600510556mr38285595ad.49.1791440335481;
        Wed, 07 Oct 2026 23:18:55 -0700 (PDT)
X-Received: by 2002:a17:903:2445:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2e600510556mr38285425ad.49.1791440335008;
        Wed, 07 Oct 2026 23:18:55 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e606da8fc6sm19674205ad.58.2026.10.07.23.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:18:54 -0700 (PDT)
Message-ID: <41c5a595-7f40-4505-99a3-5041641fb025@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:48:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
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
 <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zzxBZA46aBeu1vUdvM2CxZDnPiK2pKy6
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac735d0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=UesLP-FnXeQSrw_j-0AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX8kn6sHJe5v1t
 Lj9aAPwMoT2H4C67xQCPcnXe9wwEtYlIxTLyD2Shx0bhjyUbbMSeXpqFZamc9rMFckU/4lgQt5i
 lEBbrFrliWP8vh1Zb8SOUVzDsFkOgpc=
X-Proofpoint-GUID: zzxBZA46aBeu1vUdvM2CxZDnPiK2pKy6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXytChLmkCZ3VP
 5YUHCf5v8/ParKtjHV7XQmfwKtY3rOHphBJ8yN/y7oCTdDGb/sr/h10ZwlUaGR+2J9RaFUnOLAs
 R1jFzwy716rEBdNPPeVWRT49kww357LEMAwGtp3yOSY/tA+v/I3YnrQCyOPYUQXpRMsJ4OxC4SR
 lAbbkecLQFLGhjSp0CiXAl/NQW131xLiKOvxh9sEexeEQ2A0h6A1KOuKRYJFHgs5bJ6mGSMkBYN
 L6/jh9uomuRy2TIyGMcdgaqfQ0pLtPvxG1GyOPnG97FKXgAsan3DQAmnpInNC9A2n9HXAgl2Y88
 qGS49MdL1C46AABl7GOQARu9ckDcJFCa+VJjJZn31TcJsTm5+TjoOKiL/VqZjHEMFP03vtzzGn9
 Flbpa43qySp0mGME3rgqDAm/yBhwyBlHmaJ/HRcXxeXYpM3KRF0DY56jK7Cuftnh1PMiH1ZVHA1
 IvM89psYZBYvybb8dbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_231858_603340_637FF858 
X-CRM114-Status: GOOD (  19.31  )
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
> The M1 iMacs integrate Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Since it is not yet safe to expose the speakers
> on these machines, add the headset jack nodes and advertise them
> to the machine driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j456.dts | 38 +++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t8103-j457.dts | 38 +++++++++++++++++++++++++
>   2 files changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
> index 090c97bb781b..1fc74ebf9ab2 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j456.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
> @@ -88,3 +88,41 @@ &pcie0_dart_1 {
>   &pcie0_dart_2 {
>   	status = "okay";
>   };
> +
> +&i2c1 {
> +	status = "okay";
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
> +		compatible = "apple,j456-macaudio";
> +		model = "iMac J456";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
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
> diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
> index ebddde75455c..d8ea6bb53b3f 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j457.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
> @@ -69,3 +69,41 @@ ethernet0: ethernet@0,0 {
>   &pcie0_dart_2 {
>   	status = "okay";
>   };
> +
> +&i2c1 {
> +	status = "okay";
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
> +		compatible = "apple,j457-macaudio";
> +		model = "iMac J457";
> +

I don't see 'apple,j457-macaudio' in the macaudio driver's OF match 
table.The driver comment instead says J457 is compatible with
'apple,j456-macaudio'.

Should this node use a fallback compatible,

e.g.
   compatible = "apple,j457-macaudio", "apple,j456-macaudio";

or should the driver add an explicit `apple,j457-macaudio` match entry?


Thanks
Ajay Kumar Nandam

> +		#address-cells = <1>;
> +		#size-cells = <0>;
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
> 


