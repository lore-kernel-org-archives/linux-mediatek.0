Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A36CA6002
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 18:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=; b=q+jzL/Hg4DZziTYeqYCX0RAlB7
	sGBVDAsyMno4iAv+jCDJLitNVBoHWJJbp50HluAG7rHDT/mZwXrrop4CLBlt192eBsE01zAuRNuhg
	3K3vxY2nRPnVNuYyhBELgAsJISPXzAXNC5Z//HYlaQUv5NFcq0hLK6oNUQLHWtbKmmA/BywUJQb/Z
	ffmQE1aOAvFNTA4w1KQonmEOqGv3iGMOdA8pp8iPatgZmc9ojcrfpCqixDIVMFJKK42L0MVPq5gH7
	5UNOC2mmBI7Tpr566CPm/Np16aDmVBGlrvaWT2VwW+QeF0rLENDjq9fwrvl3Yl/LobZbTN4DkUmuM
	j3obo14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWIJ-00000002wbU-1Vnf;
	Wed, 07 Oct 2026 18:23:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWIH-00000002wb9-0rDC
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 18:23:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697IBIwT503364
	for <linux-mediatek@lists.infradead.org>; Wed, 7 Oct 2026 18:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=; b=FGEjaKTKiTMns4jc
	ySHa7nijzGtMIzNX1sSiTKtCsnriO7FROVZ3uqr95gbCSh1QEPWJTvdAjroTzvh7
	vYcPaHGJ6Ni6uDM+Kqv0tkvF65ayaBCtGgwTBk9gPPqQX5HrxgEOAVQtIbMNMQMj
	Oo91QuNpT9Dnx1I0182YQ5mOj09u9Wpx0oK/t9LZzDnhtmCbBYnMGadTb8IYul7F
	3Svyd2viG0xYmLfiWAq2CXnj9ztrwoWhjfIZQs/5z909hqEd8GRhoJ5FtXQHXuTv
	PhFEUlCW70YfasD5eZZt+1tvYLBw8YdQm5heGuDGBChfTtry9UsR+gRyN4xv+I4o
	b0OzSQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5pv718ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 18:23:08 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dc57e2a3f2so6562432b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 11:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791397387; x=1792002187; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=;
        b=kK2WJxQ/WEWWhwIXSyBwtcnWdFoVvCfIuhiIF1vWB035961b1IvKDOecjfBnqu/epE
         3oHBmRervsuGv7kVgQlKYfl+SPV/xCXvQhsLYsXBa9gPkwBt8XP8pB/BN4BCCOqndT6N
         IvlYz4/NBrE9JrLrmUC2Lik6wyisUm5mBepsRJ80LXVKIZfGBEfxJHiS5MWPR1wkMXOJ
         5dK9edpu7o/VsbFxTCFM9iOzUSVo2DUkiACs7XlOXMhD8GWOULh3uPQF5yyD8Tx7H1Nv
         HODk0Tg1XNWeMM/HJtQJ9sg9vsTGg3hjjg4VeYYYZh5vcIJs+okjNKHSHVUkIW9iw41u
         o4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397387; x=1792002187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=;
        b=am335cIDeVwWFRxlcEbj6SyXJICF8LidmOKhh8Exf0731gKTgJi4MzP4SFpmXArVzg
         kJSfBGXq7Urp9J2kgUfYYJ5Z/bBQQkC6yEsq/y3CwICdV1WzEu8gIfhQDay923psN3jj
         uSH4ccE1LTaUG2yS1AtU9J5PczrN19/t/Q5Mmff4fLB8UMvt/bQ1wvIQhw4PJyEsamq6
         TyvDF8VkOsTuko9H8Lm7i6a0BwZIBnusFOkuC6KAft74oc+FKZ6XBL7NnumlAzEwSqAG
         WTDBbmPxvMl3SzdjrC1jBBQzloLbjNZ+Zreulxf9GeIKdz8ZixEIyDEAvMDRYeAoLU2v
         hfrQ==
X-Forwarded-Encrypted: i=1; AKwUvByFz3M4zdtM2nqwy6+7PT+l4eQv4pQZGZE8P6flMp8syEaZrAzFDYiaULlPyVb6aBpbxkjXI64797/ewMM6mA==@lists.infradead.org
X-Gm-Message-State: AFuF++n/c1AngcKoi7sMq4Paif3haOzAhnVCD6dWO9NomNPPCFYQS+eN
	+H6DNzHnBqjJmCFrGP/p5QqxWmWw+x+F+tT+iMkz/DnUhWm+atefnllahRNGRugrG4dUZRvfmYK
	TyHW+scJtMO1coUBzxhFlkqMf66U5TPq92e+rcPEqzibRKYecgONgCSSJSAsUA72d0EPuVkaKCZ
	Ufq5M964c=
X-Gm-Gg: AYBFou3KU4h0cp461D10mtg0ida4wEV5PO1dkyBEnveHMlM1lvn4OmlHWkQV312RhZX
	VaBsNcSnieLc+Jo8+iEEAP54EX5LQLCY1lPpG/OgNJ0Ai9x4f3nlTNs35rKL60y5CeEvVN1TiST
	XndrRDbRXTdkOTVQtSDxjBXPTE5icJ/qIK+92EdAFmKc/aVxKZHn1dMV+O+vZ46mZsgpjM9a1aW
	AvCOdlOthYLtIpHIaQctEr0nX9RJQP6MgQ+VbEXKKuR3cXq94K2apAQbG88Zp/UlRq35gwrA/40
	xN7iucYM2sXZLGfA4TpGm8lF1XiVcDJbxAJJE/jXjNkJYBjZnkzVmFqONO0f9wK/P94jVeIOP31
	qGrSzhPUlrR5Df+g4b3cn1y6omkyB
X-Received: by 2002:a05:6808:6804:b0:4f5:5f73:21d7 with SMTP id 5614622812f47-4fc46883340mr3275047b6e.56.1791397387417;
        Wed, 07 Oct 2026 11:23:07 -0700 (PDT)
X-Received: by 2002:a05:693c:894f:20b0:351:69e8:d419 with SMTP id 5a478bee46e88-35169e8d438mr1958297eec.22.1791397050030;
        Wed, 07 Oct 2026 11:17:30 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351735e316fsm980093eec.11.2026.10.07.11.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 11:17:29 -0700 (PDT)
Message-ID: <126c4b96-f50a-4ea3-8df3-a7118870a5a0@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:47:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] arm64: dts: apple: t8103-j274: Add
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
 <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MyBTYWx0ZWRfX0keYsW1cnAHY
 9bY+UJ7j7sdXfNGF3AoZp6dPkPfi3UypOl00yuF3LgvqAp2K98UcuHIYZtE9cpV3IETe6f1YWHO
 GPizT2rfJJwxegdaCt3F4Exnz0jI8T4=
X-Authority-Analysis: v=2.4 cv=J4I/fwnS c=1 sm=1 tr=0 ts=6ac68e0c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=UKJZ3Gop6vG71Bmy1WEA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: X4dVA9WULY5jcTMBN1g7dI3BXh5of1WS
X-Proofpoint-GUID: X4dVA9WULY5jcTMBN1g7dI3BXh5of1WS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MyBTYWx0ZWRfX8S6haAAAMnAq
 FgiGjlo6BLKhgSQmlG7drtsS1adU45FkbxeBsQ7dnD+uqQ07+niO0+SW2PlFC7MJlbG4zqA2PfR
 TGDUYPp03N84ru8yZyb7c8mDcTB/A+L/mnVKRpBwoJZIGiQwlVQU/3s0YGO2oq9r6aFn+1xkHGG
 Ld68LML2P2YK2csoYVeIw3J41Jl08ALHI1/U/RBV18huXsBBrcUo51/epzlt4Gw8WmT0CgqLcJU
 WuGWDV0hHtitY6ShBpxnxKeLvdpu/B76eD+MzwI2NXTwCxbejOC30RuqxDzzt93qIMQlypKgLEo
 iiWu7Kxf/tPglTy5QAO58vTnxGtwBOGas549BULv+O0AsAaT4qmmyZ/1tr0fGDEih8neWTp4wmK
 gracAzs+zD7V8mAgubJw6NxzbfNXSu/BariJrUUimDntNt/L3PaFI6I9sRx8WWoQRNWWljiFqBf
 kvEILnNLXmXaFI5JXoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_112309_282280_21D1189F 
X-CRM114-Status: GOOD (  18.75  )
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
> The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Add these nodes and advertise them to the machine
> driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j274.dts | 67 +++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
> index 1212852251e0..6121e3a89a0f 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j274.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
> @@ -75,4 +75,71 @@ &i2c2 {
>   	status = "okay";
>   };
>   
> +/* Audio codecs */
> +&i2c1 {
> +	status = "okay";
> +
> +	speaker: codec@31 {
> +		compatible = "ti,tas5770l";
> +		reg = <0x31>;

The binding documents "ti,tas5770l" in 
'Documentation/devicetree/bindings/sound/ti,tas2770.yaml', but I only 
see 'ti,tas2770' in the OF match table in 'sound/soc/codecs/tas2770.c'.

Is the expectation that this node should bind through the TAS2770 
driver? If so, should this either use a generic fallback compatible, for 
example:

compatible = "ti,tas5770l", "ti,tas2770";

or add `ti,tas5770l` to the driver's OF match table?


> +		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		ti,imon-slot-no = <0>;

