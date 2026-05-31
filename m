Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B96FCD6E4A
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 May 2026 01:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QP/YmQQpucJZRAia0geXRt1bwULI4Tj+5E1XuSKtbHk=; b=vQEqK6nixSOnRSXPZXsRVm0YsZ
	drvZ4TCU7wW7hyQLGcwBTChLCDjdpIP8ZLDwaCroEL8yqRPBhOBIZffjNiQ3SCCXpwjYgjL2VMme+
	76SD+4EB2KN8wsNuxahbzvbZNuOa3FIOc/RPWj00ll7MbJJHK41CceDAxinYRtZ9JZP6Wau9QHfRU
	6pCuut6LICx9KYhQ+ZoJMzXUeSS85EwstxzargkJ9+f94YPR68IExO0w7HL3U8tIuPC7/vu/5byqs
	ROcE05pZfild6nlYqQZUNZVG9VTanvLNjmy1h/6ChlIEY9dXlz6zCiXrJG5bAW7OqM3I9MAztEF3W
	ueCzhAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTVB5-000000099nn-1G2k;
	Sun, 31 May 2026 01:41:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTVB2-000000099n2-3ILb
	for linux-mediatek@lists.infradead.org;
	Sun, 31 May 2026 01:41:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UJXKTc838372
	for <linux-mediatek@lists.infradead.org>; Sun, 31 May 2026 01:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QP/YmQQpucJZRAia0geXRt1bwULI4Tj+5E1XuSKtbHk=; b=SBld4c93EtHDw6FZ
	iqp3saJCFfg4PS1UlsS4Appqch9UUYlIFoFt/om5A4Jr/Lmvp6b8Lu/DmUCESLEF
	3efpNJgwOhXNh5R6NbIfU1sRLlAC6rvqWpZIPpZt88etreWRicCyI5/PzgafEGFa
	GuxUA+qEiWR7+XWXbJBaDzHIBVHw0ZRtTt0Rpxk3tUNB/iktz6nJEoYjWIyp3q/y
	MfH8ElRHS3fZUb/49fiKauF/hYVrbCK7mdYKmEmbuqYrkooTOQgbrMCqM35psAth
	pSQlgCX2nfOnh3Doa61hu0AKgD3bgqvsNf7O0XCFj3jylvbgPHQXMe/oP9Rnw0+p
	Xf72Ng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efrncad7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 31 May 2026 01:41:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso470977a91.2
        for <linux-mediatek@lists.infradead.org>; Sat, 30 May 2026 18:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780191678; x=1780796478; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QP/YmQQpucJZRAia0geXRt1bwULI4Tj+5E1XuSKtbHk=;
        b=GeI786vw+fq0ZtQS2BRY6emA0VtRQEXJTn04ibg9R3PYxXULmn1iaS32ifvDA+KWmJ
         348ERr8fAiK4vzI0cYApULK8xHjRrW9y7uIkzwmoRb8hGYhy2fyUOWhFYWK7tAyffFQX
         5kJeobf9bU4q9Q8ROGUoOOiEUf7+fj5jgbLaj/athv7pkSDaXzCuJBpv1R2z9lF1TKOO
         MQfA+X+By9WcLZEbqaYq8r+Y0/dIhjZFU8XiZyV9YydgvFycxvx5t4yPjXB+BO+1O5sw
         hnbuEnJVTpFwZsuza9mEd6dWl1dqMYpxaD7zfqEIpoRjeo+i0ihwKJQ2oNVJ4tyNH6K1
         fX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780191678; x=1780796478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QP/YmQQpucJZRAia0geXRt1bwULI4Tj+5E1XuSKtbHk=;
        b=L65lAArGcYNMqHa6aO6i1UWk384YuI43AmSVFRVvCln+Ypm1GbcEy/GofPqdnwhZgf
         Bx8g7ieVRPJ0MqN49gSqWHtDzTfEjabrfGaGKNkge6cFj4tTnIRKKCnQfw/07ZRhXWUy
         fpilOABDtT2N8HAscUDgRjVdD5i6b9ohkUGXyZDDb8rlTUuglaGD/FyBWed+H+DC1mgS
         1d7fi34ULOUWaeBhN78cmNMWxtC+ZS7cBnc3XbhKIC0cF5SttCS/vZtd7NWeqQg1tDuU
         Ksaoatq1Xn8eekBknMb4eRlu+nUDAPawmdlAF0regGIqGfw+xnduOl4RqlL099KSU0dG
         owbA==
X-Forwarded-Encrypted: i=1; AFNElJ9hFXhgfaAee7bYAaZK4EjPP7DGEPeYpqmnRRUdn8MhhfmFzF+1KC88C0DJOf1/22nlnBbjjHDqt2CTbLdxKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfhLw0QX7L+tHlcu2w8x/i2JeHs98QnrtsBJsXW3B8u+Q5y/Cu
	siDP+t0tovYf06ceFxM6ZN0mGDTOeg1YdJatZOWrNSjYAsJgYzoWWp59bwByKMnYwWW+LayALH0
	FSYbmmVnPLQXDEbTso0qhy+wP3Rs7jd+acpQLLem0iGpR4ptYulK0Qve3Gc9lpjlFoLVzoqQgf5
	uEiNW/9t0=
X-Gm-Gg: Acq92OFouVmFiPQ3E/da14ijBvJPrhp2ECpeKkWGQ6CXM8iA59zMDoyEDoxGTUODvg1
	iNcH5qz3m0G6S4/7GhNwcYVFeXrff5RqpplERR9zUtlC+iC+2FauLARZs4NUgL3vvnNARJOZLpg
	tqiPxbuv7mP1HSD7Vsoa9cxfvX0SktVbY5WjwbvT/4UURxuCWUjPPrd93MRdPjSEZbhRjIbTlqY
	Mq1zCmRk7tu1LuFK5Gtkw8ZaeAzT7UlhC0G3AyvOYd+TgZOSuyrgsQqugnix8NmwY8zjHDOE3xP
	NOY2ucO8Qw0pG3lGA2bYtaouenCEnbz/hqQDNKMl99QDkG4eCbsK+2DQ/SY+jpZYCut3mgktDuW
	l1y4FzGANVlIXoxQaZmVxE8kFuHkK6fjxSZuuspmHxy7BebUtit3l/x5XXQBC9gdItu//HwtfVj
	cCprJZM6/E7ERWpehYPnwy
X-Received: by 2002:a17:90b:4d0f:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-36c501b8fbdmr4902611a91.16.1780191678406;
        Sat, 30 May 2026 18:41:18 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0f:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-36c501b8fbdmr4902580a91.16.1780191677869;
        Sat, 30 May 2026 18:41:17 -0700 (PDT)
Received: from [10.133.33.28] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdcd0a2dsm3670713a91.2.2026.05.30.18.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 18:41:17 -0700 (PDT)
Message-ID: <7d49742a-7602-4f58-8dce-7e02664b783c@oss.qualcomm.com>
Date: Sun, 31 May 2026 09:41:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: ufs: Document static TX Equalization
 settings properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bvanassche@acm.org, beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, mani@kernel.org,
        linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Zhaoming Luo <zhml@posteo.com>,
        Ram Kumar Dwivedi
 <quic_rdwivedi@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260529113338.984301-1-can.guo@oss.qualcomm.com>
 <20260529113338.984301-2-can.guo@oss.qualcomm.com>
 <20260529-neat-bright-shellfish-eab5e8@quoll>
 <ada65ce2-6736-44fe-9396-d3ed632274ce@oss.qualcomm.com>
 <b445e9e3-dfda-45d6-bafb-a2deb3357144@kernel.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <b445e9e3-dfda-45d6-bafb-a2deb3357144@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y1ndnawJJdaTpA9oQUrSSbaT1a97CrRK
X-Proofpoint-ORIG-GUID: y1ndnawJJdaTpA9oQUrSSbaT1a97CrRK
X-Authority-Analysis: v=2.4 cv=FcIHAp+6 c=1 sm=1 tr=0 ts=6a1b91bf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=PY6Zn8H8AAAA:8 a=mpaa-ttXAAAA:8 a=EUspDBNiAAAA:8
 a=7_JFPPHlOpLMAyv0mBMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDAxNSBTYWx0ZWRfX6dhfuOb3M1yY
 T/9QZwDbBwpVU2+2rc8hzMCgIbsH9E7iPyZpP11Fi6WkxqfIzj9KI78OAEFf5v+NWP77kk0nc/R
 yevcyGnL+sH83hm9QrElop98rV39iqcMLx68pu7gfQFXrZ8/mQYg3j5dK8/p7V3HlyLA+LoVIJM
 Ky8sR7+wk4hnX/XgaDPmTDWkg89JVZegt6DooYSmYAJYy9JGuTjX5mZUD73DvUVR7bXGjUAXwyD
 /wZy9jy2NUGEZMsnpR/h/E0//9sCdOlcid2Qf0HJSF01ZbKHxCSDMCqQabx0v4PbQeVAUXbfKxF
 ldJGQ0yVlM1G8Dtb7+JjAi8/prbBukg68VRnkDDnF8cZSohfn9/AfYHir9LxmN7TQkMEds4owxf
 rAvkxTwMfnrnjsILqIpohxkrzFu1mxlrK6gFqSXkucYE5miDrcYyiyHeBvBAsdGkhqKiEU/YKI1
 XUUGTJrAtRkcEzAqy1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_184120_909855_589083F2 
X-CRM114-Status: GOOD (  19.66  )
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



On 5/31/2026 1:33 AM, Krzysztof Kozlowski wrote:
> On 30/05/2026 14:45, Can Guo wrote:
>>
>> On 5/30/2026 12:58 AM, Krzysztof Kozlowski wrote:
>>> On Fri, May 29, 2026 at 04:33:37AM -0700, Can Guo wrote:
>>>> UFS v5.0/UFSHCI v5.0 add HS-G6 support (46.6 Gbps/lane) via UniPro v3.0
>>>> and M-PHY v6.0. In these specs, TX Equalization is defined for all High
>>>> Speed Gears (not only HS-G6) to compensate channel loss and improve signal
>>>> integrity at high speed operation.
>>>>
>>>> For HS-G6, M-PHY uses PAM4 1b1b line coding, Pre-Coding may also be
>>>> required depending on channel characteristics.
>>>>
>>>> Add vendor-neutral DT properties:
>>>>
>>>> - patternProperties for txeq-preshoot-g[1-6] and txeq-deemphasis-g[1-6]
>>>> - fixed property tx-precode-enable-g6
>>>>
>>>> Each property is a uint32 array of per-lane tuples:
>>>> <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>]
>>>>
>>>> Accept 2 or 4 values (x1/x2 lane configs). PreShoot and DeEmphasis values
>>>> are 0..7. Precode enable values are 0/1 and only applicable to HS-G6.
>>>>
>>>> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
>>>> Reviewed-by: Bean Huo <beanhuo@micron.com>
>>>> Reviewed-by: Peter Wang <peter.wang@mediatek.com>
>>>> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/ufs/ufs-common.yaml   | 45 +++++++++++++++++++
>>>>    1 file changed, 45 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>>> index ed97f5682509..d90cf25adfa5 100644
>>>> --- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>>> +++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>>> @@ -105,6 +105,51 @@ properties:
>>>>          Restricts the UFS controller to rate-a or rate-b for both TX and
>>>>          RX directions.
>>>>    
>>>> +  tx-precode-enable-g6:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    oneOf:
>>>> +      - minItems: 2
>>>> +        maxItems: 2
>>>> +      - minItems: 4
>>>> +        maxItems: 4
>>>> +    items:
>>>> +      enum: [0, 1]
>>>> +    description: |
>>>> +      Static TX Precode enable values for HS-G6 only.
>>>> +      Values are specified as per-lane tuples:
>>>> +      <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>].
>>> You need to include them in any of applicable examples, otherwise
>>> nothing here is validated.
>> Hi Krzysztof,
>>
>> Thanks for the review.
>>
>> Since no UFS5-capable SoC binding exists upstream yet (the target SoC is
> I would imagine cover letter or commit msg would briefly mention that.
Thanks for the clarification. Will do.
>
>> still pre-CS), there is no vendor-specific YAML to attach the example to.
>>
>> Is a synthetic example directly in ufs-common.yaml OK to you?
> Skip example in such case.
>
>>> Why values cannot be on or off? Or even better: why you cannot just list
>>> all the lanes which has it enabled, assuming disabled is by default?
>> Thanks for the suggestions.
>>
>> For the "just list enabled lanes" suggestion: precode must be configured
>> independently for the Host-side TX and Device-side TX transceivers within
>> the same physical lane. A lane index list alone cannot capture this
>> two-dimensional per-lane state. The tuple format <Host_LaneN Device_LaneN>
>> is the minimal encoding that covers both.
> Again, why do you need to encode '0'?
The tuple is still needed because Precoding is configured per 
transmitter-receiver pair,
so each lane has two independent states:
- Host_TX -> Device_RX
- Device_TX -> Host_RX
A lane-only enabled list cannot represent directional combinations like 
lane0 =
(on, off) vs (off, on).
>
>> For the "on/off" suggestion: the on/off string pattern is used with
>> single-value properties (e.g. LED default-state) read via
>> of_property_read_string(). I am not aware of precedent for on/off as a
>> string array for per-lane tuples.
> git grep string-array. Plenty of precedents.
I will keep the per-lane tuple model but switch tx-precode-enable-g6 
from 0/1 to
"on"/"off" (string array) in v7.

Thanks,
Can Guo.
>
> Best regards,
> Krzysztof


