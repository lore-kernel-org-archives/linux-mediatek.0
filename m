Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4387FC83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frgttlq1wUpHfs85c6sOB8oFTBM5O4TFBHJ8W4S/2Zg=; b=aElJYreuqyt6RgbRJps4LQ7DOR
	LK+qb934gNw9i1p5DUiqznco1EfDY27dhmmkZusgLhBJLhn792k5UFOBHvH4MFQ2Em22FpRpAGkoi
	6uQlgk25F0VklZwG0p79gPGql1sQhAXLQnrCPA9yVJ1T7nAyYx7nEXezySgBuseSA/Iqp7Fk6yaRd
	CTnnwCwTTsBKnHiHKMM/yBvw8oz5T0CtCQ9QgCTls/G9kN/wQrhg7UUtw3i7YFhCR9reGLNsjoe2j
	oUpnSCV+utnbKQLP/YGrvXMP3TEnv8EW05QJm5Kg7aY41e8BczTVMQ/pNfUIQokGfwjrJpvjItxG+
	GYTb52LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewNb-00000007a5i-3gfw;
	Thu, 24 Jul 2025 13:53:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uete1-00000007H6d-1G0D
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Jul 2025 10:57:50 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9tGTo001523
	for <linux-mediatek@lists.infradead.org>; Thu, 24 Jul 2025 10:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frgttlq1wUpHfs85c6sOB8oFTBM5O4TFBHJ8W4S/2Zg=; b=MCM9U+EIRXdUhkkj
	RnaQHyphmlwj8ufux4uRqT1CeeRyh4WJeQyMhFCoM7HUZE8B54OyMur9MQ7pLAHK
	q7Q1KVrS7BFGTDMUnHwdUrmlCjNOXtf0Rp/Gdwturu54n0TsR+qJU3AtKnFv2WhV
	Ajeq9g9mm1HxhnKm5PMSdv09h5GF5GTeKQLa+UREcjMI+vHbBSZEp5ZsQOJYdrBc
	29cuk/jHFBZqdsYWQeB8ET0R6F2HpIBhXtEQ0eTVFTrqxXZJKuhGlQ4XUWQjybWw
	SQmEEyV1+dpeOxXC5puV3gSzpq8fRjewj3wouaPKzcYBH4zMbbbQ82M9zd+81FQV
	uLJMxQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1uf17r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 24 Jul 2025 10:57:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabbaa1937so2435286d6.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Jul 2025 03:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753354666; x=1753959466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frgttlq1wUpHfs85c6sOB8oFTBM5O4TFBHJ8W4S/2Zg=;
        b=tWgS99FmXTMpT44NsAC1rXBKp1oNm7kL7plXr6dVkNU2SeIPIhlZzmZhsXTwBO9haX
         ypvZ6+Imn2znrHjmtspksP3o1xqqiHsJEC1Z7gY68Vzy0RTvD7mrMS//U2AYKFz8N9BV
         07CBEqrkRnFgFfvv/p6ouhm0RddJhnF5wAmVdW/COEsZTOW+J4+32+bJrakZ+3K+XPAY
         8Uan1Vty9+D8jVcS9LPq98wx5SN8qVvGPBSvPWbEQwW6cjlDkGUQEUUG0gnGIL/03ApA
         N2/SzkHz5wh8KsCBUPptkZER1xMklYJAip3thFSgNvD42qxuCDHZL2qNp58Yjwl/O4JP
         m01g==
X-Forwarded-Encrypted: i=1; AJvYcCV1pxCXGQN3XxKs99nOYhM/HSLdElq6fYw28mBfCWTwTxUGzg6aiJ8zFTDo6pSei3yo9+KKUXKXrsZcN7eTOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqZazb2LyF72hrviVBzhY9VCmnnnfC9PGWouh+PB5wvXy/pfr+
	c9orXnZXvglHHa+pQA8IQ6aIM1AlPunelzBTD+NCrJRYE2tbivNEg2/7nqALbJxN3g1JEmQC2yc
	6mi8ZEj70ZFk2y4OsMeJEJS+oU4Yp//eVwolJG7TFff7K8hMwy1B6XVyiIQzsIhVCMtMFgbQYoN
	o=
X-Gm-Gg: ASbGnctDY89mitf5jFJMkAvYLrPuXsi4RMlNGtvnjlfv2bzHGbqhfFg14ysdhEEM7ja
	6rL5SHAl6c98fFzRHgW0TX8YM8Qe1S3SMa6g/REx37qRX3o8e5dopoMbf9w4IuF/iay6nAIgcfM
	v1X7sc50OWlbMZsr7uQNHp8B32JYqV4l5L7U/nEPorBFzVrvmNE3UkfhTOdLXV0LlQ9GY4XX5aC
	OGbJQq3wqTJTozMaymyeKS533vKB49Voyq6T6SYfcvAjWqZH/MfQi+DvpDX4iSXF9MAZUuFudCS
	bxNdSA6DqToqJx2qS7eESuFhFLy+6943rnJEmFL6mP2jAU56ijLpS/BwjJW5eudnM3CEIT8AsVC
	mfjRNZKaXJhUEydwpmw==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-70700537849mr43874566d6.3.1753354666030;
        Thu, 24 Jul 2025 03:57:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOPUGD8doV9+jglxqU2GB0DYEWEF7aTYg/TWGqOaOfQBWULvPms9oF3r1fFWzU0hBkNoKlEg==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-70700537849mr43874396d6.3.1753354665532;
        Thu, 24 Jul 2025 03:57:45 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cc6e753sm95191866b.50.2025.07.24.03.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 03:57:44 -0700 (PDT)
Message-ID: <bbb07270-cf7d-4fc6-9a74-334fcaf00f05@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 12:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Andrew Morton
 <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang
 <haojian.zhuang@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-mm@kvack.org,
        imx@lists.linux.dev, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-11-af4db9302de4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-11-af4db9302de4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=688211ab cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=jpok1_DMC_Ne8w05vhoA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4MiBTYWx0ZWRfX5KmwKyWcywe2
 Fg6xPdaPrz5b+3w+1WoAART6PhQzZnWgYM9V2SAiFl5N99fA/gW0CFKWBIZmVGS+Az2vMbeznpI
 x9TcbYiFGpl92UJ0CwPfNRz+pA2CRl1/vimezKRCmQ+w3uSwO78q4hXQyJc8kL39HPSZPymwTx2
 tviCQgNh674B88sRYsN773vCBoOkNQouEVp0kzn7iWYAPwYFMPNFoo3aUcp+eHaD0iMlNb8ZgF8
 dzXePThD6wRmyVXKPqU/d77i89ZOlkB9K+WwJpmkJ3sxDSmIKxF30HziuLFD+DLs8ptjkBZhFQD
 YRbb7Gp+ZVtj0cA5+bZpR0R3egN9hgaKeWXfT5pIHOwxtchpc1xX9/ie8lSv3Gob102jaNUAiYm
 WnFtPc6R2UNAATY1LQzBQoKjHS6kqUuuQQ2646G/y1lCqFkTkXG8KscA2t+HkV7Bieqxo4BT
X-Proofpoint-ORIG-GUID: K80ld-gSbNd5mnUnSf475WY4orB8apa9
X-Proofpoint-GUID: K80ld-gSbNd5mnUnSf475WY4orB8apa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=508 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_035749_349040_A8FC0C75 
X-CRM114-Status: GOOD (  11.50  )
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

On 7/24/25 11:24 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With the pinmux core no longer duplicating memory used to store the
> struct pinfunction objects in .rodata, we can now use the existing
> infrastructure for storing and looking up pin functions in qualcomm
> drivers. Remove hand-crafted callbacks.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

