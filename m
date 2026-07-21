Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF5FC44532
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SBCyGgJbN6sunp0BYwaF3O9zR1Mj7Y23sL1OJAiSLM=; b=eyNgBzXl8cd620FQcWmspCrda1
	AMxlF2FJ8VjfRUMAiwtcGzS8r34DBEbPf/Lt+QTzqnpkcO7WsNR2NAApHdZXC+8cY3HGeld1ARft1
	M6mAjfc7rZ08R9xiM4Xr4qcB+xo4ma1aO2I75XCo74L3C3sPJaUBgYr9o1kEFuYGsHaaym0ZspX3s
	lAGVY7ux+JKYz7XOjKcTNbJZttvIqqjDZsN6pp9nUfb+3nyeWGni6asM4SbL/1ntjQX9W91MfitMw
	PG+PW+FQNo7o5J7clud15nHM4PdBY0eJcsceQFl7LAyNh9fpvyzVcEo77pdLo93CCzX9O4cyIdgbq
	noavQOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBiw-00000009grT-1nBR;
	Tue, 21 Jul 2026 14:45:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBii-00000009glm-434c
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 14:45:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDgAoG1971516
	for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 14:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SBCyGgJbN6sunp0BYwaF3O9zR1Mj7Y23sL1OJAiSLM=; b=fUcN344+RQW5y33K
	LIoxDMbgnxXqORPDQ4aSsSLu4S7rnHyurEQnSwr7HcaFEu7YD6u1IBM7Du1Gc9b+
	1tPcJzigyuZDUjbnITzTkaljq/AOYQtuhn5lJe6R611VJmQKgR/KmEj5uILWifWr
	FWddZeevM0srWED0IBVJ+LO116+ld2Enh7oPpglHWbeQICxhuGq1dwo0LOuAiIMl
	uaYHHljB4FBNJKP6bjPOnN0AYyJagej5euqRSUVuiMGz+rD4lmDTtHSP2s3t8mjt
	ggf/8irY6g9wnBFspeFmDhaekkWZ1SaMlys9xDd0DtMIFF7zwIfz8FaINOpjVqQw
	PZ8Jlw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6861dcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 14:45:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c083f1818so151493401cf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 07:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784645119; x=1785249919; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+SBCyGgJbN6sunp0BYwaF3O9zR1Mj7Y23sL1OJAiSLM=;
        b=RJHDazZKXkvOIVno5OW5YOLuY2OsTTFZ7q6NnqZqzrApHGY0imKKilmhb+2hGXl9XY
         fjf3/vDIt9Fd3tb4ednU1yuNlpJBumYAcRFs5dzduUusq2h5m0OTgoo62TuTbBROrSk3
         PKayeNTf79+j3DlU0qyS1CrFXBkFWAyLF35ETaq4OVjeAhOKZwOTgCVqZHNfQocw/fka
         /5qmn+poo1krr+MRE/93Bh0lqagCMsjK407aLmfa6Fq9KspHaOLhVq83RYSunJI2Movs
         mUunmlCWOJAX7jstUihBZeFNn1bcpJwbYxCJ/trYI2hLz46xe4/Hw2vTaLGXs7RsBF5G
         eW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645119; x=1785249919;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+SBCyGgJbN6sunp0BYwaF3O9zR1Mj7Y23sL1OJAiSLM=;
        b=breWRAmbv1xSlDUvD3LEVKAGeDIBt5pSfD2lUo+nd5EwK727Kiu/r9MsbFRkSBG3yS
         wmyW3R5s5R9Vf+a0DRkouxhJ9S83VxryRwT2aK+k0VwjtokqcrOiZLGrudVe0ofznai8
         zgJKMXKuNMY6TE53dIgb6SOntlqxaJ8gQ/U1WoC3tkJBoNIs11OhzRGvSC5FeRcRPdWe
         ednFIQM9MvDqBljrmyOlK/ivzgsPmPQkGYXfgz0DHf0bCKWdcWJ2IbUJnwtFNprNF+K7
         GX6wemJWca3AGdJDhVZbtTQZscZHCP6MmONg96aBTOrX3qFxZg7rd9J+ueoEc/wT3Zs6
         zqIA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1iEbJLmmyM0vZ9xKT/JW+yIR545PASw5x0BpVo0vtE1Ean2l7RgPfOIH0JCIyOsXQy/NBZ91sQA3ynFUxsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwS33sbi2EoLl9K+uwbAWepxuTRQvwE6MZru4DnUjyK4fZtCBcD
	aULZQ8/F+7HGwJY4tLGk72RWWbA6UhWZw7QFSdRK+JMLi0DBwLnUwl1V0wKa/HCFkCa0YdgL9hF
	phr+CG/gaG8vXS0kmofRDdEfLcJn2xRrS1uz0IeyiD2UFKzuyT7a3py1E3QwNkMb6fPIlW8m3Si
	k=
X-Gm-Gg: AfdE7cm1000eEE2+JbBJ5u5UxYnmNzeurWJ68Sis1UsMZJgY2w1n8KutlYpBTKK9Feo
	wj6Ma3+6wK6vNpDL5fILU6+KodYlyOxSmrt2ESlwm0lBfyyql0e83jYdP+Nn+k0559FUweqabEm
	TEHUgV8X1kfTEoNMt2Ns7Z2hgtuTSwRDxy/4agic5g5ezWybXdOInx7LGia80XIt1QZex2SREnM
	eZWeCDr0njhSoob9AXiFN9EzIBHx1c10yjh2OIJ4lT2ltXq99ohsKMeaPPd46zR0L8TN0lR/Z5+
	vPxIupgu7w2QQzm85/sWEUVePSf1TiykHL6TsbA/g7w+atHMaDAb5u8hEBa6di2LwBV1qmA59sT
	F4GwvUZe5kDDcZLpWTatpdMFx/Ww7UnkrQVposPXfkD7urHuhJHo=
X-Received: by 2002:ac8:5f4f:0:b0:517:c65c:488b with SMTP id d75a77b69052e-52137df1584mr169984611cf.0.1784645118855;
        Tue, 21 Jul 2026 07:45:18 -0700 (PDT)
X-Received: by 2002:ac8:5f4f:0:b0:517:c65c:488b with SMTP id d75a77b69052e-52137df1584mr169983961cf.0.1784645118298;
        Tue, 21 Jul 2026 07:45:18 -0700 (PDT)
Received: from [10.131.142.220] (220.171.88.92.rev.sfr.net. [92.88.171.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653698bcsm67022225e9.2.2026.07.21.07.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:45:17 -0700 (PDT)
Message-ID: <d5cab365-b781-46d2-ae36-815b228c0465@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:45:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: Remove redundant dev_err()/dev_err_probe()
Content-Language: en-US
To: Pan Chuang <panchuang@vivo.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
        open list
 <linux-kernel@vger.kernel.org>,
        "open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20260717065224.600593-1-panchuang@vivo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260717065224.600593-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfX8a7J8XSwbnOc
 Htl5SD+rWA/yBUaGCVdmll7TCaA/RnqcmdtyfBBT62Xz6P/CisUzICjgLeOtmWFIlBBmummaPoO
 pXxdLIynqo70Zolzyj0BdyB0dyuUYoI=
X-Proofpoint-ORIG-GUID: er4gTl_ok9CGtWJ13vgyiOJQ8HALLRBv
X-Proofpoint-GUID: er4gTl_ok9CGtWJ13vgyiOJQ8HALLRBv
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f85ff cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=HvFMDRKYglX6yPpWI6gtsw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfX5m90WdGR9ich
 p+cip5JsefHM5OEJajaLDyr6YsE4P2Q3bObWv45+NXue04fD8x+2sCq6o+oSTScMpooFaeCAAuo
 e28JE273LxB36lsTt7I5o+oClA5L2AoJzui2aIiaa/hZMzHPhxLq7AVO7tyVmdWMl+yx3USSaBv
 3Up1gSpILqUYav12A/zq4GJ7QSIBYx9zKXNAf+4BMWnzst6dxJCMeujc6kz7XvI5+YfEZGEYYmk
 sF3XzG33iJSluNHFlmuRHQKd5CUfzYdW4sfREMxzPPTe0NV7M479ZuTweYW9F2cowraUehkn9AL
 LiWCgn5pI18IQ4+mW95ZTAB90p/BQX4u/oym0MRTwL3R/yz/GpqZsIUJsdeFOKN4Sje8yrqQI1A
 oNCVndtwNRZl8A1AGUpB7d6valnTurqM5BMvYcyTUizQM2ffZJYP91OQ+jzkj5fE49QMix3NyDz
 +E5aLCDkrJzop+sKC0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_074521_149627_AE1D48B2 
X-CRM114-Status: GOOD (  11.06  )
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

On 17/7/26 08:52, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>   drivers/remoteproc/da8xx_remoteproc.c    |  2 +-
>   drivers/remoteproc/ingenic_rproc.c       |  4 +---
>   drivers/remoteproc/keystone_remoteproc.c |  4 ++--
>   drivers/remoteproc/mtk_scp.c             |  4 +---
>   drivers/remoteproc/qcom_q6v5.c           | 20 +++++---------------
>   drivers/remoteproc/qcom_sysmon.c         |  2 --
>   drivers/remoteproc/qcom_wcnss.c          |  4 +---
>   drivers/remoteproc/stm32_rproc.c         |  3 +--
>   8 files changed, 12 insertions(+), 31 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

