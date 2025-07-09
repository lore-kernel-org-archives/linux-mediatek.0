Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EB3C83F09
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2ietRUbMDbJ4mE4kCJF5gt9v+ZI/BJHpjh+AfLfssc=; b=zszMsA6xNQj0xo+OqsE6hqORdB
	PuvMePrWK3ZqFMQyH3hAqeLZohegd8rw6UdxgG+Mvh1xr44gDdm5wgUVBQnLIjE749+AHa9GgjWki
	e2Ukpy+2FyXNEA6AFKw1GEWwUSmTzE/vrg6tfLQ7hqBlK9V2U32W4kFFg6j2Y6D7hMBVeDi6mCNP2
	ptCkMWiEVDPnbxSV+QnowuuuX5kb+SQDY3U/rRWL21NxfkYLIiP7CulOm2KIYeCq3kWGyIv3Bszfk
	phnzZTg/f4rMpkfudtaKCGBxVS55WxHZ/uQfcZUgIU1PSWzg/nPcmVa95YogTZ/9S+9RyqMOEff0X
	OktZFSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcoW-00000009y1Q-45PO;
	Wed, 09 Jul 2025 21:58:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZZ9t-00000009VNf-3mmB
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Jul 2025 18:04:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569CowsQ011638
	for <linux-mediatek@lists.infradead.org>; Wed, 9 Jul 2025 18:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2ietRUbMDbJ4mE4kCJF5gt9v+ZI/BJHpjh+AfLfssc=; b=VkHrX/iB1owUSxld
	0k+fbo6IcOvwtEYGSSRlKjHpAinC0RiWd73EPPUC6SOM4iBvvYejo9Hir/sSs1M+
	BimAHnZ5h1Bm7K6EukFdGpofuYt4/4mVpL2Pvk1zuKqdOPMAEA0hUXCuPSLOmkJI
	uxhP+dVMdAmPY42H33WwyFKvhLTjLI7hykoi46pR/kn5Hgzte68IRcBVaBSbbEgM
	cHTfSuCq3FFJOsKCluYO73ZuMuweN68F4RZKBYnZjt9JHLQRIPG83VqGx6D6sB7x
	NYtuDq+MO3CE2+WCNg0do2owYKfya9Fs8n2UT5JIvD2kgG7SZnFYVVqX1VOzqctq
	+OrFUw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafj1a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 09 Jul 2025 18:04:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d094e04aa4so3596785a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Jul 2025 11:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752084280; x=1752689080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2ietRUbMDbJ4mE4kCJF5gt9v+ZI/BJHpjh+AfLfssc=;
        b=jIdYnL9yVWJcIsEk5s2cQEdTLcvhGZ1ZAZlBdEKrVB0oXR3R+R23k/UesyJMHMYBnT
         9N3vKQeejBXzv6xUE9I3sxgTudO/auaCGbmFp/AdrONZf+C/RiYozDgoKAAEMCbrxAky
         m7p80O+rUu+KNzBOfKJR4bdh2ZNh+qfgcZ6HelLBTIfQJyCn4UxP1WDhoJOaFNafVg4k
         pZngsftOZHZ1mEPD5TGzMxSKfyYFlcLVYvdza9cJ1ET+wlfmrJMKTQEi+oeiFoFRxAHV
         7kbbcL90EIvpz5OWLC8VgWIvkMnoLBQ8I450FFewa9u5pjFTW9EEkHKJ3Uksjjel+Cbz
         SO/A==
X-Forwarded-Encrypted: i=1; AJvYcCVT/+/QGavxS/WFpY+Hb2QHcNKWI3HrdPYoAllvUokJqPwyx5hgZlKzppBZ9LfMfZDZq0CjL8U4kkCi/G84gw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtby/EHpA/Y6j7kODqayIEO/BvnJlCo3+tooO8BqUCYA7aQUJc
	WQqE0vEZgNGApjPouJEUhZlzOdErZx+MJ9bQ4UcEOHWV28aeN/kYfESNglzN2PC2xkcSLiF0hz6
	a3F+XMhS9jRWuZ/8uqXKb6q2MPv6ND8IHAwqR3o1H5+E+O6D4rHl0atoMsKqW+QNo4U4nOaKFru
	M=
X-Gm-Gg: ASbGncunXkgEsv4bPirZj2suBhE1qCB4qWLIUt1dygF257ANcIQFDS70dWqoMFeEtbb
	mb5NCzXht/aLxORj6cciXZwNTd8RjO2SxMyWhK6CnNnKHRd02mGW+4lsMlaPqgLB+oXnRjsd5OR
	0X/QNuCgKnJ99E6UH6vGt8wpofG1dH2cLlEXD78SQatryliS5zwwhpAWKIqIupGiG/JrBWKkKuJ
	CQTwHWhjMOsVnFJza90pNHRTvklflUl9I0pm4kTxdqf1yKeAe4GXf/IlvkLyQW9s8ZOyLAbTHS+
	yCpEejL3hpX/4nLBgv2npBemgXt6hGVVRFnOXbp/JNKaZr3fMFt/vIU5c2+sE510fzVMVb8ggX6
	V4F0=
X-Received: by 2002:a05:620a:2681:b0:7db:3fbc:d71f with SMTP id af79cd13be357-7db8b3307c8mr183720985a.0.1752084279982;
        Wed, 09 Jul 2025 11:04:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRdyICFCZxRrKtqyaPtAi/LxAqDz5IEHfkpkf3qpn9haIG2NUFS9hpsW2SKi6yjsOjwAtEOw==
X-Received: by 2002:a05:620a:2681:b0:7db:3fbc:d71f with SMTP id af79cd13be357-7db8b3307c8mr183718485a.0.1752084279403;
        Wed, 09 Jul 2025 11:04:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692f555sm1156700766b.60.2025.07.09.11.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 11:04:38 -0700 (PDT)
Message-ID: <256e01fc-fdba-4006-be8b-236fbbdf9f25@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 20:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] pinctrl: qcom: add infrastructure for marking
 pin functions as GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686eaf38 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NA2ShB3TTlD8ZNnRZVMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kkOY7V3e1e7jrvTkghaUrwcw9lyIjOEx
X-Proofpoint-GUID: kkOY7V3e1e7jrvTkghaUrwcw9lyIjOEx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE2MyBTYWx0ZWRfXw3dQmFGD7EQP
 mLJEm8R/88i8jpew5ttbjkej1i4X6J3Rd3pBmazmfJ+3C36kuvP9urOqIieQvhmyXn5YBsnOSgK
 7or5lncOQaNYrjI1kOSLC6zy+99eMSjtMc31U2niz6H+ubndkIyWzDQ7x8T8ADhXX7RE7RDtezK
 XL3N+PwPn6NKO+9ZxYs+ineIK2fX1Bh9pRr9db7Vm6IM4oQLYaJUflbVm/MPheGFHNpYMZ5L7K4
 Xf+e2k+KcmFGpbapZevLGW1b9VMLwhebbC2pm6FW/JsJFcyljd/8AKOeXMkPTKpD/JBHVLCktvR
 /DrwsdGKrLtumGzfz6hvPzRPz4Va8lToKnbkD+/Cuxg8gFirUNCwo1QsQu1BTamfwxeuHccdJJj
 8YgGoErTI64Bo5zkebnVp/z0JMcuf6NLDoPfzkKlvK3ecATRJmptpYq0TB4G9PdrUqchuWVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_110442_061794_40A2256C 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
> pin functions and assign the .function_is_gpio() callback in pinmux_ops.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

