Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E987CCFA13
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Nov 2025 03:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M80K1COQSKSOsbnYlBiyMzUXhbNJGsXiIzf10YFAobU=; b=PI2IlggUJdwnXz7f+Td/PSc+tb
	LvhgT3fJgBBVfeOtAQjZWBb2eoKg2XMd63hudpOcS+14lrO0fjQgqu0gQXgwkdgt/mnmClFll4fqa
	S3BfXT9tGJqmmafjDhx/IO5amdXED9tmkZ9hGs+rA8QtVNef9Vy8obPHABOIPnt/ntA1eNyZT7oYb
	XBEPWk5VOAFNT/ybOgEQC2RDfw0UlXRCUZU9ugjHN3QHoOkz9Ruyry56rYmvNHzJE9RgYgrKGB6Q7
	0cG/en6M6IH1k4C33Cnn94TA6TmZOZKNnbxCxM3hJvkaKbc8gWeevSlR3R6WIDZC1e/Gr3XiFefOI
	HQ3Xj3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHD15-0000000GcLC-1QR2;
	Fri, 07 Nov 2025 03:19:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHD12-0000000GcJ1-3x3t
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Nov 2025 03:19:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6JfpqY630889
	for <linux-mediatek@lists.infradead.org>; Fri, 7 Nov 2025 03:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M80K1COQSKSOsbnYlBiyMzUX
	hbNJGsXiIzf10YFAobU=; b=bn/g3237YhT6RGT/NZXYeOvYm5A3Ef/qBwofC4bb
	ob4Dv/kHYUnPlqmL0Xa1UDS8viZtBnAjyxyHlhbUdzUrYXhO4WGipDF/pR9Akiue
	+PhN6YduFkOcBVFaCl6P/j44ij1qjqOtDIzTtkiR8ARG9UJNrLVau/QwrO4d3Sev
	d5IEuMtiyWEz8BgDIp+/J9i7vls7cUmINJhhat1FNXPnBah8jPCaEUfWi7aXBjKK
	Wb7W4dNnoH3GQCxQF56O02fdue9GWMkmlqu6Ild63nraYcyvLYV/K3nzCadQ0xjj
	RhXXNa2/vwQChQFVbvEhClT+oiAhzPsfv+bBb2rK7oOBLw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9223139b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 07 Nov 2025 03:19:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e88c912928so9163121cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 19:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762485595; x=1763090395; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M80K1COQSKSOsbnYlBiyMzUXhbNJGsXiIzf10YFAobU=;
        b=TG94zPEqMTVp6CZAzJEtBYyFHbaCNcH6yo8BgB4fx5ZaOcjauA11bKOLm/6p7ydlmy
         3ZCUrw9YNuL2WiqFmgEOYvRKUfHuYUvGgnp04g5JRJgXAchwmwHudqm4dHzkJ8a9hqDH
         35wsMgmvfeO3IhipyqOJ/tioow9MJiEI0RKo0eBVOYl33hooDvwJlLxkzk7K5YGYfSXr
         +fWNPwrxQ46VipWAjUKludnnzfaF3KYsHZWW8kTcltfo3AqvEuVDmCi8jawXgP902swu
         CQkIg3lDMGBM2w8eCehBg+kZhMmx7SyXrvcgsH9I4H8/4ulL9qz+1wO6l3Wb/cg3ahVH
         gxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762485595; x=1763090395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M80K1COQSKSOsbnYlBiyMzUXhbNJGsXiIzf10YFAobU=;
        b=uF/7Ok4vsgc57FSjk9/8RVK0XLLchRl0D49Zq4qZx1RpL4f1rkL+Q8cFbFrdDYWqpx
         onnSBQaK3kbyHTDLTe+BvhqIerOOuCqqeXRZFBOqkc2bdj5mKkCrZ28AqcR9dMT3tkE4
         PPndCKCJIKz2H0uc1C55xbY04k1VNFC+gvveL5XKbpAFjiVB+YTuVRqEqoxT/eEuy9Kq
         X3oM/rmWKGJt7hQmFI7eli47JqwxLLgg5uyPzMVRcrKZtvO//W9/+M6it72yzDCO1Y+R
         ZuY3ZIMhNpwegw6s5zOEvThMmEUTJOxuKzddUznlCVI2lXncTT2BU7cPfBlhBWggo1OM
         4vXA==
X-Forwarded-Encrypted: i=1; AJvYcCVm4zX0B7GWC7AzZ5tMEwJ26aPg3GzH+ARbAeUyZeZPFh4przlDaboAuSyswWbdN5uKipDHdATPA99KERQM6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIFO1zFzlpwPZC7MMrQcXr400d0KkA1EN1Yt64PLzz706m4+ch
	lQqdtlOe5AabSreWb4e+K9sy5DGMofG3h9Vfq7orpdZ9mSJ+ByZe36NfCmNZmA968/N8wNad7Ep
	89PWO5G1wGQPu7x2kOdr/t5d4rQs7GLlRsdnXH74QKSqsrV809aXek9IiWNMEKMaqCxqNn65qOb
	o=
X-Gm-Gg: ASbGncsjAnBUQruxOuRAzmw7eUChqMvr+v6na6NL43/68tU9VOhgf9jLvWFW1aYsx/4
	GKh2mCSMPUbyUTQTL55wdVzhp8MhYkHvskgsAMeKoS97fE57ZdloMhSvUbz0JiL0bB9ke3Nk88Z
	UmYU5/0oh15c5rEGpY0jeez+hqHHVE96rCYgoju+tcb22bgybbWaZ16NtdUkBnSEOjwRGW6te4/
	Th2beXqvKnGlal7dswOjeYIV0wGrhWBuTykFQGyW0/pRiE3JGI25ItgqOSxGpoEgmzQB1e8/Jsx
	DC6McpETtodR1Mgfv8sN6dMIpG3X0vTI446PfaEXzouvs72o3Pv1pvhtJAfvb1kFnOgJsQQYiNs
	rhArTWdG/MZT3Mj8khGrNAIM/svhHI6WFrX0aBKCY805gpLLm05nPnUqrHVd9dFmidHAgnpPgyH
	q0FJHHfUfos7Ur
X-Received: by 2002:a05:622a:199e:b0:4b7:8d1c:1be2 with SMTP id d75a77b69052e-4ed94a67750mr18772821cf.50.1762485594830;
        Thu, 06 Nov 2025 19:19:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4pxfXAI2QN5tx3rdS8w62pU9piMwAcGPSHdAchfcF87faMpVG/a4sNiNd3ZJ914ce0ITvXw==
X-Received: by 2002:a05:622a:199e:b0:4b7:8d1c:1be2 with SMTP id d75a77b69052e-4ed94a67750mr18772491cf.50.1762485594416;
        Thu, 06 Nov 2025 19:19:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a593af0sm1136865e87.96.2025.11.06.19.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 19:19:52 -0800 (PST)
Date: Fri, 7 Nov 2025 05:19:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 12/13] soc: qcom: ubwc: Simplify with
 of_machine_get_match_data()
Message-ID: <zdnlmxrlagpmwcfnzka7zgmrxzya564cjbd56l22fazxxhqpjw@64zf3akyfp4h>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-12-d780ea1780c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-12-d780ea1780c2@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAyNCBTYWx0ZWRfXwlRSacwgd83w
 LCa6NKBQpiccDH1aKkgawaGVUlJX1nw8keEWcSUEAcpNyP0Na9VuDN938jcEWopHrvI175LihRB
 U/UUNmP+veHVfUE2ZFyrbzP65mGofDmz3MPvNS+tQm6Senyaehli5svp2GSk3Nj0GlVfNlCQOHk
 zgMhPQK0rxI9/kLKpdgbLJtsiNs0snYhWtkmygHHhwW4exDiMyEBKO+XS0i4HK+euaXp/ecMmCT
 au/+6Nf3S7NjhaZnMgeEIKowIhVcp7UErsE6O2hmiVz/6njIOnU6iQUAKp5hQdzzOovSKfS8dpG
 /AT6k9FUMwbDa84p3FvKYLlLwW4dl28oiUWms7xUXRSEI4t10MMGgsgH9oMkkfVeh+J2p1jnNsa
 +so57uba1GOXURZ902hrNiIT35HplA==
X-Authority-Analysis: v=2.4 cv=Csmys34D c=1 sm=1 tr=0 ts=690d655b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=228_68lKBFQWPJCgatoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9daGEB0Q-U9Z15I7XuPm2XWJH9-EIBsC
X-Proofpoint-ORIG-GUID: 9daGEB0Q-U9Z15I7XuPm2XWJH9-EIBsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_191957_099264_E72A92FE 
X-CRM114-Status: GOOD (  13.97  )
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

On Thu, Nov 06, 2025 at 08:07:19PM +0100, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on the first OF patch.
> ---
>  drivers/soc/qcom/ubwc_config.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

