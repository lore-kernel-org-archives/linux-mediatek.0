Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C21CD5BD1
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 May 2026 04:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebaidKmwGs+8gsq9/tED+PDL0d2FG0p3YyTatOrtOrc=; b=qNk+TNu/XxxrrlTwG97y8QS1IU
	bkgEzSazUJhLG6j2hAhznCD5l5kFSlQQ87lXlLh5T4K3/YVkZmSGtOf/Vbvdn1MPLu4LPfJ34+ivN
	hg1li72tpmH4vScmxDPVnJuqWTk+YQpUdjiJo7MbXLpYCmnSZvPcfVTZhLdSJIBkHCM7PnctpFyrN
	AQ9QOFLmVVeCX7WEYUyuZ2kvakm1Kxa8gAWbpwdIF+CuavWBuXBS+3W3MHorpquGLX/MtkIU1U0KB
	v8+rFEVRXTUAFBETv8vuAaTl9OBRq7pHMIblXr6RGtP1LKLm4AS2xuZH2hRv33Mb9thfZjydYMeTm
	EQF2/rfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTY6R-00000009EpC-3wuD;
	Sun, 31 May 2026 04:48:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTY6O-00000009EoS-1jnU
	for linux-mediatek@lists.infradead.org;
	Sun, 31 May 2026 04:48:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V2hTNq409138
	for <linux-mediatek@lists.infradead.org>; Sun, 31 May 2026 04:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebaidKmwGs+8gsq9/tED+PDL0d2FG0p3YyTatOrtOrc=; b=VJWlsWwyZap7jo9p
	+c95UxByQXJIPd8GKlRYl38DlJzBkjE0LaqD/zhRDa/2loQpEJ6o4HQ6/CLVN8X+
	Aj0XJzpgpSycAdpEPouLTzsHp4d7sQP4+H03mKyu6JyCHYl6/5lLQqfV56jGIib/
	jrl1A1warljlrMiWGxAQkARxY08Ahh0D9JKN62kRoIMtwslkh3nXywD71AxMeygq
	DWWEiaFNconLlZqOPm/bxjmXZdeHRMUGUlcsuGEwCsVs847J+lRttqt2dbn3ZicM
	cOFoRuPxNFOYIDIsnSiBbu/lT6o0B+4K22JyRjZyQLAcfVRPThBvy+r/t9yMiJa/
	gygqHg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efxy7t07a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 31 May 2026 04:48:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a2cde332so102327a12.3
        for <linux-mediatek@lists.infradead.org>; Sat, 30 May 2026 21:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780202922; x=1780807722; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ebaidKmwGs+8gsq9/tED+PDL0d2FG0p3YyTatOrtOrc=;
        b=MXIXYE2N8fC2v6eBWYPg/bPYfoFhTjnnvJlvLhi/PSe/VnU/YgATupJ5V4YMPfpvQo
         oREMJQDD815gv0X89W3BpaiseexW3o9ptWRhwvzf7nMxA0eC5G88TqNT3e6U/L9LeKen
         iSjuW8Py3Un3m98I5hKd04FLxdAy3ly+HzCkqo72+9a0q3d5M2BprgcW1PgUppYQnTDe
         X3a2e/t2Jlr+Eg7qeuLtM+O0g6ZsiHyWUSbuFFBiphftIohU5BAqTcb+vms1iS1NYyio
         VHnOP4ktwT/W4FeUJbqF7yLhn+KToMLjhNhKvMyNnB3JKcn6Sq4dWUuHs7nS51knZiKa
         RgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780202922; x=1780807722;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ebaidKmwGs+8gsq9/tED+PDL0d2FG0p3YyTatOrtOrc=;
        b=milZZSWzhCINse/Ra8wF34FBMFYM41b6w0IjM030vHaL9BqQzV0qdCuPeD1EnC6In/
         7gpWKTLLCV85Pet/X8GxaXokXc3d3o7a4YazG+fM+J+ywqbqDbcOWbrF9SJ6bGULm96h
         Z9TI69tmRRbELiDG44rsZLH6+64cWk+F0nty3loaBPWImr9SkcWgB0Vg32DWlRPYyl/M
         8qqD3EtAmh/t7q9r3c+92I9sg0Z/+mMF2mbJ++6Vpc1znUCU3pnraBmQGhY4JRN3fU/M
         8Pcmjgv0lW+h/UuVcVpBX8HFN566/xWUqrJ4OCaeqBmZXxoAlzaeqe6UY0GdiUZnZYaW
         fRfg==
X-Forwarded-Encrypted: i=1; AFNElJ9b/6xwgA/XdpQtN7mzmeMSofKVSXEP8mzz0j9RiY3hin0TD8ohxGNLiiY27MlkvQpzjkvHrEAP+8Y4cv1Kvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEGSg8OYhe8Kl1IMZPdGz/uOC5iprFvFm015kKjo1tKpX49ktT
	9Ndm6/Cu5mVQ1OpM5OpjmbI48df6xUs2h8JfJhkRkdVhe9TZdwWxYdOyUOtXws6iq8OTce0Lw0y
	WIwBikXvGUTAcWuxdySaNEYJYd3N6m8ANK/hZrkhmbxLfqHCKdhx8nQorjFXctvD/Zr9amb62SM
	c=
X-Gm-Gg: Acq92OF9CHkTQHHa3snIUJJXOHdh/TQWXlXrMrOlQ9ov5p5sTffkp0NuW2ewLu6uLPA
	rrX8zyo4SSNdu9wn4j+CNmZwaIey1r2SEf9tEH+smuJKBSjs2xEqPbytRfkpWPPXteQc/ReA8w7
	0w6DX1QogvZUv9ub/cwXLRkXukg9PhGOmmq7mJzgWtAodiK/xLtdgnZgjN48Q66alPmYre3u6nr
	VuiwS1BhZ2Siu1dLbwH5FFBXz4jCaNMOayN0ylLwGrQ3YkCI4GwnxtZF95QxKAC/KcwW8Fi8Tcr
	rY0HQkWzBzmzUrNSju8AC+BO5s7sYoQ7AbPaeX/jwpbDpeEf5bAX3V2UjTNWjT5XW2cuj0O4UYN
	Bs8INgLtJOBAxaVuqQAKsH8Jckr3puep5CBxHBUBXEAX9EkGcndxiDVug86163Oh5SaILflLgXO
	2YxxiBrdZhJZtGOsXP/iBq
X-Received: by 2002:a05:6a21:700c:b0:3b2:92e0:f987 with SMTP id adf61e73a8af0-3b427c66ad6mr6162199637.16.1780202921709;
        Sat, 30 May 2026 21:48:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:700c:b0:3b2:92e0:f987 with SMTP id adf61e73a8af0-3b427c66ad6mr6162179637.16.1780202921198;
        Sat, 30 May 2026 21:48:41 -0700 (PDT)
Received: from [10.133.33.28] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a7c24sm6719775a12.2.2026.05.30.21.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 21:48:40 -0700 (PDT)
Message-ID: <64bd6272-6111-4ffa-8a4a-366d0c287693@oss.qualcomm.com>
Date: Sun, 31 May 2026 12:48:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: ufs: Document static TX Equalization
 settings properties
From: Can Guo <can.guo@oss.qualcomm.com>
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
 <7d49742a-7602-4f58-8dce-7e02664b783c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7d49742a-7602-4f58-8dce-7e02664b783c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=POg/P/qC c=1 sm=1 tr=0 ts=6a1bbdaa cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=PY6Zn8H8AAAA:8 a=mpaa-ttXAAAA:8 a=EUspDBNiAAAA:8
 a=yqHtDKZHdI7dvUF-9VUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA0OSBTYWx0ZWRfX16U9zxj3YoDK
 Y6nvMFSIzHQmqW8wO3LIsDHM1dRcyorlzf0fgi40gRGq+1uOk6JrTxw+4Stgk1If+fuG9OjZjAd
 1jC+HMlv/8ej1WzO4W//np8OK4ockpml+t/yMfY+kI9KNBXHoaIWywGBgv7Yq2zUM2bywl1UejO
 1T6DQnauGPGVtlDBapQ2wkzA7+GWsZxbUQHsnJgfgIYJ//kR/cuiwlpqXA3I66Cu2ic7x7k+EO2
 geZYzcohWqT32qzQEpEvuhguXXHAPa1FpKKTUu3YW6K9SMrfo6oe9RnTmtCHoEW8XtNopSGS33i
 wky7e1lYbwipQhZbxswkv8NgjCkB8Tm3bXw3jGE0EWMfYuWVOx/Z25pA7p16wIZQA1eEibjGwmW
 Kk1iBdl0DAwVTpcHu9OBvwmNoAZjaV1fW2EKgHYi2qXxSZZVjgOh+lojloefPBSfCZorHvlX9CU
 a6oD9FKsYN3TVlXV0pw==
X-Proofpoint-ORIG-GUID: UOFjfjWCS_SNEDIn705hDCMNDwBZWWIK
X-Proofpoint-GUID: UOFjfjWCS_SNEDIn705hDCMNDwBZWWIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_214844_496694_416C8FBC 
X-CRM114-Status: GOOD (  21.33  )
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



On 5/31/2026 9:41 AM, Can Guo wrote:
>
>
> On 5/31/2026 1:33 AM, Krzysztof Kozlowski wrote:
>> On 30/05/2026 14:45, Can Guo wrote:
>>>
>>> On 5/30/2026 12:58 AM, Krzysztof Kozlowski wrote:
>>>> On Fri, May 29, 2026 at 04:33:37AM -0700, Can Guo wrote:
>>>>> UFS v5.0/UFSHCI v5.0 add HS-G6 support (46.6 Gbps/lane) via UniPro 
>>>>> v3.0
>>>>> and M-PHY v6.0. In these specs, TX Equalization is defined for all 
>>>>> High
>>>>> Speed Gears (not only HS-G6) to compensate channel loss and 
>>>>> improve signal
>>>>> integrity at high speed operation.
>>>>>
>>>>> For HS-G6, M-PHY uses PAM4 1b1b line coding, Pre-Coding may also be
>>>>> required depending on channel characteristics.
>>>>>
>>>>> Add vendor-neutral DT properties:
>>>>>
>>>>> - patternProperties for txeq-preshoot-g[1-6] and 
>>>>> txeq-deemphasis-g[1-6]
>>>>> - fixed property tx-precode-enable-g6
>>>>>
>>>>> Each property is a uint32 array of per-lane tuples:
>>>>> <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>]
>>>>>
>>>>> Accept 2 or 4 values (x1/x2 lane configs). PreShoot and DeEmphasis 
>>>>> values
>>>>> are 0..7. Precode enable values are 0/1 and only applicable to HS-G6.
>>>>>
>>>>> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
>>>>> Reviewed-by: Bean Huo <beanhuo@micron.com>
>>>>> Reviewed-by: Peter Wang <peter.wang@mediatek.com>
>>>>> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
>>>>> ---
>>>>>    .../devicetree/bindings/ufs/ufs-common.yaml   | 45 
>>>>> +++++++++++++++++++
>>>>>    1 file changed, 45 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml 
>>>>> b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>>>> index ed97f5682509..d90cf25adfa5 100644
>>>>> --- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>>>> +++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>>>> @@ -105,6 +105,51 @@ properties:
>>>>>          Restricts the UFS controller to rate-a or rate-b for both 
>>>>> TX and
>>>>>          RX directions.
>>>>>    +  tx-precode-enable-g6:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>> +    oneOf:
>>>>> +      - minItems: 2
>>>>> +        maxItems: 2
>>>>> +      - minItems: 4
>>>>> +        maxItems: 4
>>>>> +    items:
>>>>> +      enum: [0, 1]
>>>>> +    description: |
>>>>> +      Static TX Precode enable values for HS-G6 only.
>>>>> +      Values are specified as per-lane tuples:
>>>>> +      <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>].
>>>> You need to include them in any of applicable examples, otherwise
>>>> nothing here is validated.
>>> Hi Krzysztof,
>>>
>>> Thanks for the review.
>>>
>>> Since no UFS5-capable SoC binding exists upstream yet (the target 
>>> SoC is
>> I would imagine cover letter or commit msg would briefly mention that.
> Thanks for the clarification. Will do.
>>
>>> still pre-CS), there is no vendor-specific YAML to attach the 
>>> example to.
>>>
>>> Is a synthetic example directly in ufs-common.yaml OK to you?
>> Skip example in such case.
>>
>>>> Why values cannot be on or off? Or even better: why you cannot just 
>>>> list
>>>> all the lanes which has it enabled, assuming disabled is by default?
>>> Thanks for the suggestions.
>>>
>>> For the "just list enabled lanes" suggestion: precode must be 
>>> configured
>>> independently for the Host-side TX and Device-side TX transceivers 
>>> within
>>> the same physical lane. A lane index list alone cannot capture this
>>> two-dimensional per-lane state. The tuple format <Host_LaneN 
>>> Device_LaneN>
>>> is the minimal encoding that covers both.
>> Again, why do you need to encode '0'?
> The tuple is still needed because Precoding is configured per 
> transmitter-receiver pair,
> so each lane has two independent states:
> - Host_TX -> Device_RX
> - Device_TX -> Host_RX
> A lane-only enabled list cannot represent directional combinations 
> like lane0 =
> (on, off) vs (off, on).
How about we split into two properties, something like below?
tx-precode-enable-g6-host-lanes = <0 1>
tx-precode-enable-g6-device-lanes = <1>

Only listed lanes are enabled; unlisted lanes are disabled by default.

Are you OK with this approach?

Thanks,
Can Guo.
>>
>>> For the "on/off" suggestion: the on/off string pattern is used with
>>> single-value properties (e.g. LED default-state) read via
>>> of_property_read_string(). I am not aware of precedent for on/off as a
>>> string array for per-lane tuples.
>> git grep string-array. Plenty of precedents.
> I will keep the per-lane tuple model but switch tx-precode-enable-g6 
> from 0/1 to
> "on"/"off" (string array) in v7.
>
> Thanks,
> Can Guo.
>>
>> Best regards,
>> Krzysztof
>


