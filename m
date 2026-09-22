Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2F3C982FA
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 19:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=; b=GOAyjeyTQG65pRsvDmBiEjqgwx
	fI5eHMNEvGKpdygGnm0IvTZgPyokgK4HTjw3MESbk7TWdmILEhUNQmlo6CRP6Sqnj5sD3BtaNF9RC
	97+hr75QHB0sury9iaXMTEd19mnaMpE05zYUUR15ZF2LTlj8BYDdyE6AasDgR4MNZZnfvFKu1HlaF
	+SSfNogqXu2OKyj4vI1WmVhv7lJE9gQiMyqY4iM5fVoUaM9zUnr0GdxDNoqqBR/kg7ACu17i60jSj
	QZIwfwTVoOxBHIHJZiOb04iIj9Z4xm6OnXiYpsbXAuyMndaVbCg57l5cb5JPkb1t5enGEpoKO7MeE
	3guI1gWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95yx-00000006N9N-0frQ;
	Tue, 22 Sep 2026 19:16:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95yt-00000006N8D-3eq4
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Sep 2026 19:16:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBhuQ3897576
	for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2026 19:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=; b=G1ADCi8kpSlVZNY/
	wy4USVl13QGfszXumugmn4e6Gr7BjqN8TZmtIYSK8IE7EuVVBV9A0Yv3rc40jtYS
	26xcDOhoXXf6ygzoy6/iNma0NlKVst7wSvXHgAjP/RLh4l7EZLKscHh6/o8pQrYU
	bUlYXtiH7C3H4nZGe6kJZ3WNtTyvi4Kwd7sz7MD2cD/ej8nBjr8cbPOqbZa5EBTo
	Haz7C3JHMUQkhkIiUBaYxHEueu3J8m4Mftqm0fHUek26gNBjkL2y6jhz7KTBQMlV
	wdX7bvcJthgfO9pXlh1/wJzdDR/OQ87+gLpEqZdOMtD7p/J60DFWIwVudAGFhr18
	RkwEbQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma00k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2026 19:16:42 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438719cc1eso187530c88.0
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2026 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790104602; x=1790709402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=;
        b=MoWPUOqBDHKSJTGRXtfTlIrEEA79jKrwiwJkbQmJYnc1PKA00BWH2SDAD3HzH92sU1
         M7RxPJCvZQxFkkn7hoVZJWeyesyglANPvrjMCXw921v6lOdTjmt7G3fNVlzPipnLeNkx
         vHsL+UD48X8VbJdT/J+ORCufgnvgEGiuOHn+9dBZ0YLvewNhXs7RqbDjPtCGjpDYME1m
         rdd4m5Dm9arLqLqiJDkQl4J0vaEOtqmXs9s5KUAxD/vUtrZg0UdXV/1T/y9/suC1nQmz
         vuM0CcJfLT1Mo2p7/6x38WAYxWu2ojL9viwF62LC1zZo9GdLJHw2bDEVVIUEr5L9s/YG
         VADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104602; x=1790709402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=;
        b=I906kCncYHUAg8MLMfe6PXfrmFmvbTDMd1RoZtqfY6ubRpYJysaujxPnNmrtcT92iB
         so/h2TuqojwiQGUUsYk0b0pT+SyZSMZMRtV5+pkGOfW2pbRxnTqcuP+SWwGFmf8Sjrd2
         3REQowzrARZu4iVtiablySQls2918WuQM0jFEtqh032F3H1lV4oEEd7misOYf7Umgrk+
         QrD79V0YE9COHZoGI8dOBot6S7E2BOI841ojx0t6RdINNBLeaKNUBbWEWVvN1MxMg0cM
         sV9YILzOopGvyw1JCPh4kfO1RTDUKcaQ+PSAAwfvHGsP/5FQs6yintOutdrsy2tSN+Wi
         Y0gQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZM/Lmv72nxI8KsO62IbsrftcRIwuLohCxTJiB86Gd6p5C8dO8k1eAN3oaWECg5DSJfrMg/76+mJW6IOjSgA==@lists.infradead.org
X-Gm-Message-State: AFuF++ml8W5N8IycfgqMcorGFl7UH8lDCVDGSoACJTAF565DgC0lcKHS
	K5/KA72sWJv6aPo86KjD+humVOOSB5yoUf+XuiguyKIlRnKG/l9vnETTIi3d0oZhlmiJQdomuPf
	XwvlWTJzO3jvS7AVfdDdWhyo0F87CniqBokHyh/vSCnHuV4bwUg3NebT8vgiuJ9Hjpt5XSj2g8s
	A=
X-Gm-Gg: AYBFou23VCprAw65fm19v/AJY+uqHO5bdCwH3o/L5Qun1iGqeeSumZo3Vjch4jsDsrK
	32VCeVAsm9t0ueiyRqgFckHzzw82WuKSydC4VMdnzV28jr87DIoLbbXrcNt3Of15mkX7Z5Jir9Q
	RwhpiLNmjMqWuaUdoNkD4qngbZMhmQ2H/Ku0Lwsxl3DbtQytWxFmqZBv2S5N+xegHAten9GZzgv
	LoPmPTqVyhbLtOuvK0rH690WTAawtIpsbI/on1iuYC2gEIhw9F+FI6kiIzbVBXVfkNHCkgmpLWB
	XADUkCG7tabovmrD7qG8zZUSoIRk1+mUd8o7UDo9Em46taDGQfDuJ95e+SYmxOVCHguk1bxKmQu
	oPnKd2jh8fmzwOPpFbdwtJChQS/kKl0UXoA==
X-Received: by 2002:a05:701b:428c:20b0:141:5281:8a41 with SMTP id a92af1059eb24-144f91377b3mr374885c88.9.1790104601532;
        Tue, 22 Sep 2026 12:16:41 -0700 (PDT)
X-Received: by 2002:a05:701b:428c:20b0:141:5281:8a41 with SMTP id a92af1059eb24-144f91377b3mr374847c88.9.1790104600692;
        Tue, 22 Sep 2026 12:16:40 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm521798c88.13.2026.09.22.12.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 12:16:40 -0700 (PDT)
Message-ID: <318f7e47-8a23-4253-860c-0e9874864a13@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 00:46:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Keke Li <keke.li@amlogic.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Xia Jiang <xia.jiang@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w0oI_h2X9mm3EG5Dng8smIKOoEbGLC33
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI4MSBTYWx0ZWRfX+IyCpGMmtIFA
 XwLDlwMTQgEH8eFfvgH3ax854kmxw58l6rp76yXioCqeBQGyI+6ZQbHQ0jZKkY92dPnFZcfcyzG
 GXpx4c7VBU43686jTGVgU7oVGmMfTEI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI4MSBTYWx0ZWRfXy54AkT2VPk/e
 DvsyUMYU0DTRVtRziFIWpDD4R2jqh5uqLq9gSgD0Q8/lNvGXOleI/eziMX8XZSRzOoim/eCQXOh
 k+xEYIz6502CvCej+3X86XZkhX6qofhd6fpyH4WZuHOPkYrQdF5fXmbgeVpmYJsc7YLBOaPTnDf
 SfYSrJ1xshbqEcNBkIDFtdKGHnoZiyejjFHrEXAk4yUu3MgJSa9aHbGSL/oIgrrur4xAq3vuPMX
 uz2bSYUSxd9xcZtsAVRZl3ZCeI+Jb9qBI1hK5K8r4mlryZojUkVV0Lstm5RMEbl+awWeoYn2nff
 k2nQdZI0zg5WqBKdCWGfaupT75ymzaKCS6SSeVKjobXZCFhWCBkP9gcDvwOq/Y0WpDxqfGe/gsY
 V2tMMNGalqBXjaufGkU7zpXjdL1JfpsR54BM7itWb4QUn44e15jjKgsDlDRLR8zztQbQxdWV5PV
 1+fGw2jQ5HW/i2TrhiQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab2d41a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WJcS3fml3CefRcin8NsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: w0oI_h2X9mm3EG5Dng8smIKOoEbGLC33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_121643_924072_26C549A1 
X-CRM114-Status: GOOD (  11.77  )
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


On 8/2/2026 1:25 AM, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
>   .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
>   .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>   .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
>   .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
>   .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
>   .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
>   7 files changed, 28 insertions(+), 28 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


