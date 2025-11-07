Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49050CCF9E3
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Nov 2025 08:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=; b=I2aW88buAySDDEt5vA8HkhQPiX
	jaH5AM4JaXNBjtcxnbIN/jd9gk0MfcfZUJgZluBF+G14Oh/ABNGOg8famg0uxTMaVUXrqSeTngOFU
	pC0GXTPE2ZBJ2tXAPZcHBou/EKFpLlnDQ80x6aq2FPy0KT/i/JolO/7GzZ4vMHhSBViMB164wCMJV
	I/nIrfKAlxb3N52D1Kt3ckUSU6K0uOwaRPCXaOHx9f1W1AaHMphPAz3nyH7U7z3WbHw0RgNg1B+jo
	4vFka/6+wL9b/E12eCsnvYCHnP2fy9wgIekTE+5YUnHfxi6e5yxnwdBAFPGa6svm/xSpaOc6c/u09
	cHs+jQzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI6F-0000000GuO9-3ire;
	Fri, 07 Nov 2025 08:45:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI6D-0000000GuNX-3BU1
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Nov 2025 08:45:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A74ld5L583527
	for <linux-mediatek@lists.infradead.org>; Fri, 7 Nov 2025 08:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=; b=j9VKSGL5ldNhCJw0
	IDsem0Fzr4SZuyQvM/h+H2DD1w1AXbGzSR3pIfo38NsMeard3DiozlihvbgOA8mk
	E6iXrhmwPw+FvmJt6QIA33bRR//xSA+t/4krdqjLlTv+Ktsev+bV4kYprelpwNdF
	GRGMArQuSTUJWlqAla3WFLSuaGWvjhBrDvToC7CMXn0vN+J1xQZllcYOCXarce4g
	qBJRGRQBgZLrKak5prqU40NrNsbZbzxGb2YBYOhfRhU9EAFl2akC7pCJS1EFpvvT
	BJycTnz7G1RABrBE0q3f8B1E86f9WqOUQCb0IEp4y1Fp73PNUYDuiP/x9QZmB2cp
	h7FEuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yktjcxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 07 Nov 2025 08:45:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8906754b823so20444085a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Nov 2025 00:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762505136; x=1763109936; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=;
        b=NVc/l6DYalY32PluePuz/Q9mZTflZWFWyqarMmMazbN2m5VgwK6WFAfcrJWFuopauA
         SfV9qDTFeVuiIm2hN4UJXiAcabYZbKvOGm1zEXIfnIH6Owsrff1qpqmatGa6A70S+YrE
         m/dO+9B8+WKbFFVtQgURBtguYrBD4pN9AUO5NyV68TxA9FhSPKAyIJawvBvQhAtRuW5I
         YN+MzmHViez7PJC+hxHUgBNc77P+qV+UctVgDkLMCCoElvU6NwOTpR+UCEPG6ckMvGc5
         pbWCCIap3jjLg8UDVGVBQHT26tpa2fEyVMxN+ns5cZbtMnv3CPI8SAWVtIkRcE91JuVR
         d7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505136; x=1763109936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=;
        b=kBLA8yRSO3DJ0fSSpa6piMWr6ktmZhBLwa3cw9IEJCJuHrpwxj3h1OZm+BBzRdfwK+
         QScUFp9e9kRn4k+bhDnIxbxnpWMcf33uATE8x/ENAf7vkiEexJwuAXkkNuY1ixaKc87p
         wjpUEHhTHVWm3jBLpMkcE0+DLI8tMupZ/qMNG+d+kWuOCqPKkntTxqVQFGYqN2A1DlIB
         w6pcoLwLYlZtLhVlvZIX1MqiFEnbG3FaTK5gPQFnyGBtcYyTNZJy7M6BNvGhztganpuM
         LY17mG+i8mdBuYQFapOXvX71v0SidM+ubqbgpoL0OftRaaPv46JJnZgaS9SCZJucN0uD
         rOIA==
X-Forwarded-Encrypted: i=1; AJvYcCXqgerHsVP5aTmv+vu95zyOicx2T3mNdIJelEHs5ZKi7UMiHMEhpeE3qnIKEatrywXWEjpUKfAXwt2c/AJQeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEklXgnL74oubwtH3KEvfLbZ+OeElGLXFf0RhTx5QxKCe0UPD6
	XfA9JFIObnvMVnyEVKqyHfmpd6Ffuap0CRn9M+PiKHJXlNFLxYNtYA3sPex4z92lX3AFL0dMbNL
	szN4m07f3mTZwzF+SVdZO5udg3sFllMPruY13MTYVNbwykdlCVbKGYHIKr2ABZTYD/7HYiEBNDM
	E=
X-Gm-Gg: ASbGncv0sy/k5TGe9nHBCIN7+OsReMAvlmMDK9CeOkTyyIL/fW3PAmLZiZaAkWj5VPB
	qBNXQKfvgRNH8EAAoRVnvjcjwUKkkljxncoPA8m/5FGjbmGTMsdzCv8jbzKwm57T2tRHt8hIhkJ
	AdcorFYZyCrN9a3Sd6DNUNPRuLt3hrK+WGxbQpl0CrZ2ca4R4+6xDAisriGFlYdFWgweZMS/w5v
	Oh0jcKjG716oocqCCrsxIPmU+i03RCVFRwHfBqprcAzWlKOMZtdy8WqEzIpcqNh+SDBR9x3MqK9
	NDDJAP0+i+02EUA73jfpK8NTCr5eXtFNIAmmf35ih/vzvGZGpEofK3ITul/DRjdxIUXk1P22lgt
	49UtPoN/tLdzW3IIBy5U/uTF7FCCts0PRoSIgUOmNjDBveUGWB+kejDlx
X-Received: by 2002:a05:620a:29c6:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b245325b1cmr200934785a.9.1762505136077;
        Fri, 07 Nov 2025 00:45:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvBCF3YyaLzOcN+aoUwXSd+qKgBVW+y3iV9o0DDasJiaqAVotNnEsYQ0f5UYACwqcVlSpGpA==
X-Received: by 2002:a05:620a:29c6:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b245325b1cmr200931685a.9.1762505135491;
        Fri, 07 Nov 2025 00:45:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97e563sm184419466b.41.2025.11.07.00.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:45:34 -0800 (PST)
Message-ID: <c7065cd8-9819-4af1-a346-4daaa4e306e9@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 09:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] firmware: qcom: scm: Simplify with
 of_machine_device_match()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
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
        Thomas Gleixner
 <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-7-d780ea1780c2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-7-d780ea1780c2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690db1b1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=TYptV6U4Xydj_hDeH6gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: n-3irirW3Sn1ycCXtQU9z--va9xXfZ96
X-Proofpoint-GUID: n-3irirW3Sn1ycCXtQU9z--va9xXfZ96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA2OSBTYWx0ZWRfX12pwYzCwX7UR
 TUIHespYcljNefwekbtIyqrDF2qAA7lc7RENEnDvnNh37Srxxfa2dR33726e82DK95bc8eX8Nk7
 j9OKPjYlJZnJGVLeJKyN+Ure/EBpEhttSVcmKZooZ/BAem9OAhk8xNMTlIBWhb6n+Gom7CWO2Za
 M2CSSAsK/FlajB3jUbSPmlu+ksT4XUzRwcXerJFdy/bokUYoI8Ofanvffbwi0BW2vfnEoIaFaey
 wvGBaYxz71w0hPa27EHsT3GFGwZHx0tFwkzLEz4hgsDvCko8HgNsh+0NvhCVL6N9HfUlUGSwrhj
 sKlCOxAEedlzzdyaNZH7bUqU9D8xCVVRHjlzG4FWAxzNAfRsqFBY4/qNsxPygeoaTYkXeeCZ+Ss
 tBqthECk7tmB/KDfaVfUrJOUVJggsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_004537_811868_8839F36A 
X-CRM114-Status: UNSURE (   9.13  )
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

On 11/6/25 8:07 PM, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node and matching against it with
> new of_machine_device_match() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

