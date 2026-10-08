Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6A6CA600E
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 09:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=; b=k9gnzRbJCSEfXBfSpZyb3Fa3yU
	oZQLbYl2YpuS0lEKZEcavZrc29LDMIqo17kj+qMyLV7ayTqXgI0CoJtyaDppWrgf0k8n5PiKtCyO8
	gVF4ymlK4f6B+ZR6Et+S/f6CwIhcZ39nBUqQkjhaoQ8i2Zd0IZ4HTHDdgrs9Y+Po//2W6UJARUsN6
	MKGhyNLtStXANwvUD48m3AIc0GqZd9AvyV0dpUVawJIMTVOeDzkqalCXAqOBtCoNq19j7uf/OUayu
	qyegFX5kICNLMmovGjcRbiYTozoPirsZ/BnEpaOrqnwMXKQhKzHaPjrkS+Dwx6cZ2gn1ycQC2njEm
	yJ0t0T6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkRW-000000040Mb-2uUR;
	Thu, 08 Oct 2026 09:29:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkRU-000000040Lk-01BI
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Oct 2026 09:29:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KPL33308217
	for <linux-mediatek@lists.infradead.org>; Thu, 8 Oct 2026 09:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=; b=ffMQqqlrngRc9MV9
	3LljFSL01DDjGEACnX59qfF16x6zKB+5G67wXlhJ4wUv4zv8rwm2FOzyOtnbG2Bv
	YiC1BE1yWYDxH8tALMOCUoES5FGood7IUrEQkeNZeznK0x3Xto0q9/bydUAPSyUe
	ZB15fNOF58GzTRGUTkqpNMobZk0TenZxxmkAlnUtnhmsTfx6txntq00BGf6W5/WJ
	CsQ/lEOJOkZgU4BCNSkNEtjO1zEauOqElYaKLf0K9r1xsVavJJO2poM+sauiLGp5
	75/kHFny8Ap6JQT1DTgCNgSXVwqR3mvgd+m2fjvqpoA5NbGVhMYVKmTLoZJfDeXc
	QwHcCg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg9rqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 09:29:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so3179703a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791451773; x=1792056573; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=;
        b=khCgPeNT7H9CEdQY28VN3JywrS7krQRrS3vuVKu3lO0nU4UGyUvt534qk4XP4NyrMb
         KQ/r4bMmp9tw5j8rKXO24P3BBmh8ijGNu3fCzDqvOtQZ7FrjyL6WbpafER+uQA3zZtK6
         4I+qBzp2BCW+ENC7LGypZx6w0l9UrobGl1zv6Ehw/Jkgdrga6W8+E6yf9eq/Quf2NxYw
         +gPE7NpfLuQhvPeBdEegpFrYQHF0AgctqhlIEp1KA0AFQoylJVvJ7Nb50bDG4/A8KSpz
         N7AVMDZazHMJKKmV7KgBOFuWRTYyR8Lo431+guJqN29/oaqJJYr37DqLpMXSUKlC2Xr9
         wuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791451773; x=1792056573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=;
        b=HcRbPW0GTAXHCA7UM6X+CbAxBOw0A7tHkOK74Gm+915hfClKZVEHYewqBibY7Lihi1
         cWMzKUvFWdUwEaSa6jEoozE1shEWgQV2FqVmChtdE5MmMHDK4BPg9Y9AUuhx7utPrMcM
         81G6xiFLkh3ntSILx+UAyQa5Fjk86Q5gKXjdQnx8/U7VyiaOYHITsTm+q7VKGIS3bj0T
         D9A71TQWhy3p5XmkvmaJ3dfCs0BymYKwaj5J+dUNAZqo3Tg2/Oy7dpLEM/sg8k/EogXC
         SA+XTnxWgeoNvhcZI6RYxntfqjvuJXpfQO1y3gkNhEO/D9KiyvOwH+5BCWvC/bZL4uSd
         c0UA==
X-Forwarded-Encrypted: i=1; AKwUvBySpwYxR0Uxwq2oNNmIl5awO3CMsUoDYVZEiEQH3BEPBF5O1QHbmznb6VCdcMhVh5voTLIfYpvDErIhYLGs1g==@lists.infradead.org
X-Gm-Message-State: AFq9FYKfPpYNoyz+P68hbvi63XcXl/KwhKeMVt5cFkqH7sz9hhSLmJhQ
	r+g8g4kKo3Vc2Lhq/uub8bPgEdW8SB1G7MmQlrGLSZMI9TMF2Iy/kj/eUxSqpHxabfVvyv7I+EP
	h9VW+u1ilSKUUxf9szfi+DDwjilXUSBTxWpHdNBh8jYZNL9IQrXsT6sbAHvPZUcmkyc/h2ibMKm
	Q=
X-Gm-Gg: AYBFou0qZHHyLjsfzw3itinF1k2ZZze8/0LQYevlCUQxgGJhOOorkPAww1vJHYEvVTP
	uFCiKyvpRQPvUnb4EiBfqAax0bKtissQf0eKONj70HiA+v7HQlLL32R8rv/NUQvZy92wbDu9iFc
	HRreoK+P3Z74XU9b+COQ6LHIhd9CuuwL1NmskNC283FD6iX6Ib0i6csKNqyUceK9UihgpmqgTWf
	0InVkDP/nC9VrrqMrl8Ip872nruSja24r6rMOs0hIf+h2ITJG46kqdM78N8pcsQUm10zBVZAebN
	dGQ2KkCZIoj/bIGa/wJY6YNSJrY8zuYX4hEvKeehYgfeXNTCGI98qytdVyIrJ+S00D+4I/YaR88
	shtiMn7o9NEFRsBxek/F+yyzHt/w=
X-Received: by 2002:a17:90b:4a41:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3ab0c809861mr582615a91.35.1791451773132;
        Thu, 08 Oct 2026 02:29:33 -0700 (PDT)
X-Received: by 2002:a17:90b:4a41:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3ab0c809861mr582594a91.35.1791451772573;
        Thu, 08 Oct 2026 02:29:32 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a79babsm3415638a91.6.2026.10.08.02.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:29:32 -0700 (PDT)
Message-ID: <dd8a9faa-9d6b-4846-b38b-711df8c2d6a8@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:59:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/21] arm64: dts: apple: t602x-j47x: Add
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
 <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1HV8rw_YcDqFPWtuqQg1bQyA81SLTsCP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX9zLMbTjprwEO
 6tzM5Lv2Po5bISVBoBqb2nj2D2WHS/dEA/wo5AULZ7HLDGrdgk/aYpiQB3BdTAdGQJPPG+Q3phe
 FmtviodFttOasOvjrg48AWOoS4wRmxY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX9JY0bzE3G9tb
 wCvkCfIPa126k34FGwssjp6MiGtoZDr02dUggD4FvJPcmZk07UG5egMMJZw241EupIeZLWoqqi2
 s3WeuM0bQvrn2dqXRP20iGNyqo+ERd0+YtysS+LI/fXBQ1Mr8AcpwTDpKPRao5KmlG247spm64h
 BPotROpKeBPyUgiue3apfXySCHjuLGb5wvr+tTAy5ecj9wu4GTEgsNWYoFGTr0/ArU9Nl39RQbl
 00ql00sYiOb6r/gzRfzPRIOP+1vkihhFiTERLFXWTzuCYM66fFMXdye5eHEkcHzkin4RCdNwhYM
 MpC0Nuoh/8OfBl93gPOIukFbiXbUhXP3Y7e1je4vX86s+K52QvNdeM1siKa9Y+vz6f7jNfEnv2t
 89gwv6DSaI+KpraWrMBbqc+uoDzGTvINrfvtCWJUm7meNXtpVp8LgCmeUUArgs5V4UME29BXgr+
 i4w0Gzuupks2Ks+3tCg==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac7627d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=oNl7twi5fxIAqsTzne0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 1HV8rw_YcDqFPWtuqQg1bQyA81SLTsCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_022936_058067_75EA0382 
X-CRM114-Status: GOOD (  18.08  )
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
> The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
> variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
> advertise them to the machine driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
>   .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
>   .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
>   .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
>   4 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
> index e3c2635d84fa..7b4c4ef471be 100644
> --- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
> +++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
> @@ -46,4 +46,9 @@ &pcie0 {
>   			<0x300 &pcie0_dart_3 1 1>;
>   };
>   
> +&sound {
> +	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
> +	model = "Mac mini J473";

Should this be "Mac mini J474"? The board file is t6020-j474s.dts and 
the root node identifies this machine as the M2 Pro Mac mini / J474s.

The fallback compatible to apple,j473-macaudio looks fine, but the sound
card model string should probably describe the actual machine rather 
than the fallback model.

Thanks
Ajay Kumar Nandam

> +};
> +
>   #include "hwmon-mini.dtsi"
> diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
> index 9fe17f1f7f59..f8f776f9eb1e 100644
> --- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
> +++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
> @@ -36,4 +36,9 @@ &pcie0_dart_1 {
>   	status = "okay";
>   };
>   
> +&sound {
> +	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
> +	model = "Mac Studio J475";
> +};
> +
>   #include "hwmon-fan-dual.dtsi"
> diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
> index 32938a3bf96a..153899f1569b 100644
> --- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
> +++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
> @@ -73,3 +73,8 @@ &bluetooth0 {
>   	compatible = "pci14e4,5f72";
>   	brcm,board-type = "apple,canary";
>   };
> +
> +&sound {
> +	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
> +	model = "Mac Studio J475";
> +};
> diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> index 926bb4ab77af..7f1faefcf9bb 100644
> --- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> +++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> @@ -36,3 +36,13 @@ &hpm2 {
>   &hpm3 {
>   	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
>   };
> +
> +&speaker {
> +	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
> +	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&jack_codec {
> +	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
> +	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
> +};
> 


