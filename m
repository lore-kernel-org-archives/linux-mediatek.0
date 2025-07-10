Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC40C83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 13:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytbTCzKHlppw2SwuVFycJKbJ22dHTAoFO6LLPths6vk=; b=XycBWVVnKBxlGzR5JHXyddDmS4
	QoCuxEdsWUfGwZ5JeVpzHNkSETmRmVvQ9/yHywoYzb52irRlUTjXU8BAUD17XRiPx+ih4GQaoBMxV
	jg2jKR0Ka0uWvkMBa6wtYvg8aL25v2ep92bVl6DtDJIp/ynlEUJUlMa3r70yr2WSh2b1SrA+SW5Sv
	16aYSQp75sW59JGFig/CICdup6/mPdSlnFqN4/Trav1yOaWBYWzR4igm5SPmT0etX9BLabl/4CPU8
	Zjs14+v9WKKg7QgNR/o/KGgwe16Iq1UDJrfobym+l9WXQFWpD+jYooUQ9iTi6ukfskLi6E9ZHqcqP
	ge4ClGxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrYs-0000000BzBX-0XrM;
	Thu, 10 Jul 2025 13:43:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqL1-0000000Bl8L-1cDy
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 12:25:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A97C9W012565
	for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 12:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytbTCzKHlppw2SwuVFycJKbJ22dHTAoFO6LLPths6vk=; b=BCBl8BQnoib8Svq+
	gfbo5fvs1mFg9wD06+fQV4mO1Yujoh6bcMlpk5i47P8zlnXcU5yE4ZPwbEecRf7z
	HReJSijPmv9Gp6e0mRCjmIfajjbIqmhe3BWdIlgQb6g38Hx/ZsuGU9wx4aia/xCq
	t65mAn4ocuHMxGM3JMLfvliRQ5mq3GSqvx+vUYklz9zLmSMOwausfZgxwXWK+7pV
	ascfe6QsPtHKFrGuwBjcVjOkEd5w391snbN4+StyJ49NENL9SDRm9P/7M6Jw740Y
	ZM2RR9kJr6fV2QFImPUZcizk7Q6lu8vj3hI3OZxb1BKUqfpC/fc5ge10boKpxYZ6
	dv6zdA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn8dwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 12:25:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a43924a1bcso2225371cf.2
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 05:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150317; x=1752755117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytbTCzKHlppw2SwuVFycJKbJ22dHTAoFO6LLPths6vk=;
        b=hxyItmTAF4MeoMwAFxvGptS0PgY2RIcoY0qtGUC699Xu8nUIvaG7m1kQSfbGaKWvEe
         eL6gHjgwOaesyJiXMhHof8iBkW6QBJ3ChhswCnWA2OAb6J3tcaWk5BlymCk3t2Sdu3ya
         SQbfoBZAHlCtuNXAnF4W4JYJY8IwNi3OtLlckItf5YrxjqwPFD4eYOoyIi52Z07nvt+Q
         ch2G26Thssyk061om0E3O3N9+fq3KBTef3CoMFpuhmNNf1XVq/tKzTUjaQBWl8BngxMY
         leaAJh7S37ezCUlv1aKDyD4Z6rS4IQ5NQBDHSqSQo4CzvXlDjnejdMw73Kw1vG2dKo1U
         4+3g==
X-Forwarded-Encrypted: i=1; AJvYcCUO/QDA7gMKU9aSoT403hhZn0K25bq6I8TOYFyCUTYqCVi1eTAiKrkXjjQUFJFURCY0xK/Eyrowuk3hyUFgRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSGBatbvHiluW+Wkv4N5w00/vy+jDGJ+mPu21LOtMTaYVrIOaC
	NuwmSN68g46csp10NyYzHWe1vGjcaJ2etCetSrU2IRR2NuQ9YRaWZsnEA6Gpbi64qrVXYcO1snx
	ZDsNPVOoMvFaxKpQcUnxfZ4ZqGkIrae53iyR8FcrY5/xN33tlGrCtWOP+cJzBFDWoo5i2psA/+m
	c=
X-Gm-Gg: ASbGncs8sGw8pczU0xHyIpM9xPHgZgPuQNz1tHzboSgPQaCnnunEnY3BLPsyG6+RP+c
	gqej4k2nYMx08yRqHOI5w/8f1YqCHme9KCa5Y/kpJt7mKjKyJOTieVPr+s1+kqKJaF9h6pnohVS
	taqreufGboQs0Xdtn3uKEXk44zKEIa9jrgeGWwLVKbE6QvwmwxJoMjv8VdgMABqmvi/zNghFiw9
	80gZIBlW165+y3c+s5+a8ecnl1FRZPGnIHl6FYd/9YJs0JwAAWXvcAs95fRfuXvalD9z1ZskEuV
	dMIVmQxXpS0+BndlpYmXlPk4iZpcgCakblSGFq5atz5FI9Rtt89EuauIUlKOckFIcpU0P2IvlF8
	RGmk=
X-Received: by 2002:a05:622a:18a9:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a9e72c759dmr23061911cf.5.1752150317044;
        Thu, 10 Jul 2025 05:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL2upV2JP4A2q8XY4xH5jOb8YXZErvSG6S/PQkLmFjLIJfoL6nTfAPNahLLoITNqEwR13IJQ==
X-Received: by 2002:a05:622a:18a9:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a9e72c759dmr23061571cf.5.1752150316273;
        Thu, 10 Jul 2025 05:25:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611d1062950sm455639a12.65.2025.07.10.05.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:25:15 -0700 (PDT)
Message-ID: <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:25:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
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
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686fb12e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=SCCoO-_AHFKZ3jW1OIgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8BfrqoCtlZYVp0xZGeNh0vrpLHuWvnn4
X-Proofpoint-ORIG-GUID: 8BfrqoCtlZYVp0xZGeNh0vrpLHuWvnn4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfX9uoVK5ROhyRs
 R66zTZ26sn3JUZNr/Bro/Hc7MH/J95tYkS8+fiqXbhwnW6Mdf27YdI1E1O4sPKrWtF2jx6aLj/u
 bmZtLpY5cdxH7TJUXVjsUpDWItcHCJ6AHMIPtYlVKRwIIpCj7816qgFQ63HcSNPASIMcyHP5vJF
 ISRp6qZWvGD3IyqcQvVHBjKqIuejvG/Pw3RbIVxcBdfh4vWTOQoTvaCmg/CsNHyVoRk8/oGMrfa
 SeESBLotA+wyz8u9Ik7b+rrn2PaTpkZlG8+gAKfvU5l5v5DBDV5ZQsCr1yHHdFEFwsd33PCcrVm
 N6wXqE12JoDlRR0gW1hEqCe8DmRz3Pf1hWNj7jdtZNrQY+TosVwojrXV4XHHRXJ3opWKnDb4rs7
 RmANhrZirSHFKAHNhbT21EJ0t3EdZB5uD7iMo0wVDLks9pD7WYzZ9fxkAGoDXBfPz1hOfRI/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=807 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_052519_548836_B20C9AFE 
X-CRM114-Status: GOOD (  16.36  )
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
> Use the existing infrastructure for storing and looking up pin functions
> in pinctrl core. Remove hand-crafted callbacks.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

>  int msm_pinctrl_probe(struct platform_device *pdev,
>  		      const struct msm_pinctrl_soc_data *soc_data)
>  {
> +	const struct pinfunction *func;
>  	struct msm_pinctrl *pctrl;
>  	struct resource *res;
>  	int ret;
> @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  		return PTR_ERR(pctrl->pctrl);
>  	}
>  
> +	for (i = 0; i < soc_data->nfunctions; i++) {
> +		func = &soc_data->functions[i];
> +
> +		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
> +		if (ret < 0)
> +			return ret;
> +	}

It's good in principle, but we're now going to house two copies of
the function data in memory... Can we trust __initconst nowadays?

Konrad

