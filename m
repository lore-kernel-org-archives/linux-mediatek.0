Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F06C8303C
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jul 2025 12:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgRbANHn+bv7tnW2+OxW/Wh9yvUY2jb9oebM1Hb2GEc=; b=4I/GpurdOnHSQ+Ar6bSv+0PzbN
	O0EHCh5J24ALvQaQpKGVGMPwNXuZzEtD8Jda8DYEjUzlF4VS0L7wVsh1NAwiQmXYAyCdMm+QOOjYO
	jISeZHi5e8atHoBpR4p5Lh0sjmho7q+MAGVsB/TfHTBKptR/vDcHbp9KP6pQeUNP8YEEQAbUAQnG9
	LWCFMrDqMWkndPmlkGyc1p9TLxbipIulDjZKvLu/nFkbLGmkvsh589tIiRSBjQwQ/einimxnv8GKh
	ysgI+hRPh5Wcg2vqHBkBCXJTNJYGaGyd5adhJrQUIz+kQ9upBopmi+nWIg8pwuWjOVUoenxLEf5yt
	TUcL75ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCll-0000000EjFo-1khd;
	Fri, 11 Jul 2025 12:22:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCix-0000000EizJ-1sRH
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Jul 2025 12:19:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAnkG1016953
	for <linux-mediatek@lists.infradead.org>; Fri, 11 Jul 2025 12:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgRbANHn+bv7tnW2+OxW/Wh9yvUY2jb9oebM1Hb2GEc=; b=V/6xW1bar7YxpMdz
	jGzXZNSYsgNxdHU8lGqAXSpNawExd/RGkVrqkOD6mtiqWKNQpTilbpx0dNg7SO6l
	b9nQMyOYUC7gVGE0mLzat8eFRnjfLmtjeM+gtdMh394CzMC8P4d9qe0YTEcJ02B6
	v/uY1Vi6z8Qrt8M4SOwcX0n6pgsc4RJQpZmnJauGSFkhqknpoCnUnemdR9Yu5Lmb
	wL2F/UYVdNDaW1+F4MMpprOjkHCy8xxMNtrwPpEYmgT9NYv0drQ0ddQBQ+YzvaS8
	69imad4Z4wJ9MDC86nnIf3ghbFoHog7HnxWd4mZYdREUAvXClnF5q9q6oXEv7rkF
	oSWndg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap8h4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 11 Jul 2025 12:19:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3ea727700so33057885a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Jul 2025 05:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236370; x=1752841170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PgRbANHn+bv7tnW2+OxW/Wh9yvUY2jb9oebM1Hb2GEc=;
        b=YFMhraO1ZS3qdRSPM81HWM6Mb56qPcclP/1tgZr8Dzsj8PePP9KUrJQj+0D8TOkXc+
         rHtqrpXd2CrxBiCNTOu4h0bHHwZZK2+IT9AdDq/LRVNx2gz7loMxOn/9OdlKKnAf5YFJ
         8cXpmfk3x0mQJHe01arJCKnSvxnAg7MiD3gD/NZFpxJC/1GIfG/1Um8ODRQe6GzlKd4+
         ILADwIl4hexhFCCRAMaGjbzhWLCyiRvOrKHZEjvKgYh61VqFyyIyCX0TvIEpt/6h77x6
         1yY8QJVsThq0NXUuWF5rs2DMul4G/Vw7jgNDwV1N01te/oQJumVd0DcLoMSwvjj0sy3S
         78Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXta3K7jTLtvtiQigfdp3KakKJQdMl2aI5TRvM7X4rHADHTeED+JFXSrH0nlJ3sZkW5ZHnTD0b0sOC6zFGFIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPyJpEW/FOiUvodiOHnZVlcowwpGTwmRYQtJSyKXdonW8h8+un
	2T4jcE86YmZK5kUi+B/CSgOUsY6H4Et1Ai3HKavQRdB/n4FjD9kYm7lpI8ERdPUW1jPk0hfVhOK
	6SERHZetKWfIosoaaPocpN/8Ygm4dOF4Q/96D+AEqk8RwUTLQ62HUYhIZh8vz5CA3VXm5mpd3Ch
	Q=
X-Gm-Gg: ASbGncu01gEcOgFiE1zceQjY//xhIvo9y0NdLvB4M4fbrial60faUIg6nw4FmryS3bH
	mZloicQfg2sjLgmDkJp7vSvHPHzjOAKXkf30BCgj7TLVxpNHJfURRfFtS/XoS3sjM4El9W8z2BS
	bQPQ6RaxbEErAbMIRNhZiBhPHw5X5j1M87tUaAF6y7Nv80P4wixffWSHnwd0xjhXiEKUNxkojrp
	Nh2k9RwE7elTJ1DaeshumxanKQxvvmOm4TDG+ln1v5A7uIcPPsr07ILCBNDcr605CoZjtc4L6jU
	3wVh9YOt56Oeaq2/AVKoP7+2G7yy4YMXcL+Gg/w2XNwO1zNMFh+dKSyNEOMdInGwU/86aMsOMfv
	0yXqI+oJgcOU6LlmR+Gss
X-Received: by 2002:a05:620a:261e:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7dde704afd4mr193294885a.0.1752236369498;
        Fri, 11 Jul 2025 05:19:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWdOt+nw01pFgLOuyNAAOJCd4H7cvcLSPFzBJPJCQX8U74WAVdoJLitJFP6NOrfYfrnxfZkw==
X-Received: by 2002:a05:620a:261e:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7dde704afd4mr193291385a.0.1752236368710;
        Fri, 11 Jul 2025 05:19:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e910e8sm292167866b.36.2025.07.11.05.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:19:28 -0700 (PDT)
Message-ID: <b9f6f827-78bf-4fee-8be2-74a9c94d9722@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
 <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
 <CAMRc=Mc7KSSTF=Jsu-_1C6eWrTXNKB=_Q9fnZor8K_4nnQ5m4g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mc7KSSTF=Jsu-_1C6eWrTXNKB=_Q9fnZor8K_4nnQ5m4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=68710152 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=RgMTYWP1_r0sjz9xMRoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Bg69VdYgC5zcI-OZGjUPkjxRckRQhn7C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4NyBTYWx0ZWRfXzlF7G2CJVjwl
 nd7A506YOwtw0Fk3/c6jzFMZBbCOAMNbppnAjcFzZaxnDJdq41ccfcp7sughvjxo+Qxu7aitnqE
 LoJ3TWqO/t9IaBJnfUyT7cjLwUdgpEpqleSazcyffNQjHPatbOC4bQnRhyXEtKli3hu33sGJY64
 ZXXrjrSPkBSK457NP1X8l1A516SiOdJRNT9YrxcAtwRoZ8w1mS/SDHKNOmQH86yG8ZFvanOvtcd
 +OkBmnymP2HqCe2Mo7wVHvCz1e4qZKh+1iFkuh5xx/0KQq+pHFtriTbH0tbVXVqhVJZpHS8WgDo
 xYhxbEfNEd5A4WzRQhqyEWmPkDS+6CS3pMze5AeX6IZ8bxj9rlxzv3uYkDs9hkvlmEU6rsOH6c0
 9bKOcXE/kDOs0ez9xysEx59gohRg9+bEiYCrBszJWE5EFAqi7NZ52OGORe94lW8CO4PD2S5U
X-Proofpoint-GUID: Bg69VdYgC5zcI-OZGjUPkjxRckRQhn7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=929 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_051931_602876_1677C889 
X-CRM114-Status: GOOD (  21.17  )
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

On 7/10/25 3:38 PM, Bartosz Golaszewski wrote:
> On Thu, Jul 10, 2025 at 2:25 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Use the existing infrastructure for storing and looking up pin functions
>>> in pinctrl core. Remove hand-crafted callbacks.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>
>> [...]
>>
>>>  int msm_pinctrl_probe(struct platform_device *pdev,
>>>                     const struct msm_pinctrl_soc_data *soc_data)
>>>  {
>>> +     const struct pinfunction *func;
>>>       struct msm_pinctrl *pctrl;
>>>       struct resource *res;
>>>       int ret;
>>> @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>>>               return PTR_ERR(pctrl->pctrl);
>>>       }
>>>
>>> +     for (i = 0; i < soc_data->nfunctions; i++) {
>>> +             func = &soc_data->functions[i];
>>> +
>>> +             ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
>>> +             if (ret < 0)
>>> +                     return ret;
>>> +     }
>>
>> It's good in principle, but we're now going to house two copies of
>> the function data in memory... Can we trust __initconst nowadays?
>>
> 
> Well, if I annotate the functions struct with __initconst, then it
> does indeed end up in the .init.rodata section if that's your
> question. Then the kernel seems to be freeing this in
> ./kernel/module/main.c so I sure hope we can trust it.
> 
> Do I understand correctly that you're implicitly asking to also
> annotate all affected _functions structures across all tlmm drivers?
> 
> Alternatively: we can provide another interface:
> pinmux_generic_add_const_pinfunction() which - instead of a deep-copy
> - would simply store addresses of existing pinfunction structures in
> the underlying radix tree.

This option seems like less of a churn

Konrad

