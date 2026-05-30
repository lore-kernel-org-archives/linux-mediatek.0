Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D23DCD5BD0
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2026 12:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nin2RexOF9iwnmMuFG61q/RqPczDKVNMSIjMs8/E8aM=; b=Kc1JDsoDW1iSGVbYDfqyLGd4iA
	W4w9OMzBsb0u5Uq+jz9snvbJarors9mVmUtTBVy3c5Zj0kbxGG4/EdXXjujwFMJvRrQQ2h5TvoSew
	ZNibX1gT1sRjSX4NBY20VitO979DNikGSJPguIcnOGIxLA3O6uI/132Jo/TLUMH6z5jc3WEGdg4Mz
	8YMmnQOZVinoBb5tfsBixoPvVbTGIk5d2ScfTbC0DzgG+MEyfezTKvuIXbvVCXlfbwOeSo4rA7b7i
	QljNi4BkWk8BYEKWGrOH/4ijzEmYy6kaSGjlkaIAEhQFEGeT7Rif4W5fdhhObTyzdGnbvGYH67Fz4
	IDWKXDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTJ4a-00000008k8z-0CBl;
	Sat, 30 May 2026 12:45:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTJ4Y-00000008k8F-0f4z
	for linux-mediatek@lists.infradead.org;
	Sat, 30 May 2026 12:45:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64U3QRCv1400718
	for <linux-mediatek@lists.infradead.org>; Sat, 30 May 2026 12:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nin2RexOF9iwnmMuFG61q/RqPczDKVNMSIjMs8/E8aM=; b=miv3gCRaRoUeDlx4
	OD4Yfrm+nG9seA4EnIU3oyzrx1uJQ+nnIM5V/WIDWiLMl6+Gu+Y5hT2PFqrmegKE
	XI+YQ5ooCXc3necMfA1qaCBakIp09err41Ut4jvpHwj/BRf14Hr6BK5+bKJZ/sfJ
	RA7Q6K+OU9wKifPgd5ZXfXBWBQ11FcByjkb7o9LILN9XF2cDbZZvyENjGZvAraga
	ak0SVrS9ABLaxJ3tgkDfhjSceupxqeBkPUoNw0s8dpxShf5TvjYZM4IOHJq1Buz3
	4UncoICJyfDZm4JWlEsQGyZcnhx/BOL/9Z3dpLVJ0leVmZ7UptkpwPRsFT1jy22n
	L84Wiw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyurxn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 30 May 2026 12:45:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1845bddfso20283855ad.1
        for <linux-mediatek@lists.infradead.org>; Sat, 30 May 2026 05:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780145147; x=1780749947; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nin2RexOF9iwnmMuFG61q/RqPczDKVNMSIjMs8/E8aM=;
        b=RBnoP7qwOZ9unzXMUKpt0X++e3/gNOIx17axcIVneD0CeMd/7l016JSLTIg6FLQxt8
         cqDdIbHI2Hm7TOJMXjqwtQlUaLv9nPajZgMGjvFHDi7XGXOaKALQ4oJNXSaUdeQb5r1a
         nVEysx1qDjaUUtjsnAiNYGShwlPEhuEpo7Sw5vfEJUgHWRDZkncGATNWv9ojX8j5q598
         HHTa9pSA8g5iVZYNMN6qUVFlyqupPlhyZOCR7ImYwMDNJlS+ZVxN219IDDBHfQSpEMvh
         sWaOmqrTPaOmr0zGuNBtyoDNhLsjTKlDUMQh4NYqO2qY275wytX7cmnap2+Zg+eISwp7
         DzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780145147; x=1780749947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nin2RexOF9iwnmMuFG61q/RqPczDKVNMSIjMs8/E8aM=;
        b=QEFIZAhxkMEFVvyttYtRYpYPY+1sgSuvXeZVfIErdXclz1ir3uo0AlL9rJMV7L+jON
         UymD7IQyFd7w+Lchm95dLuXUPEi4bhoJPbzEukjdmtkVCUcpwI1rIDayoTnY02VJYOtk
         Div9XK9I/NF9notFZOVd6GnaUfdFWD4j3oI0yVB1Mkd5j8FqanVYR9WkcpPdzOcRpayq
         sLylKXdgEOp+EU0R8rfu5zBOor36YgwZadEu5k3vjfsAM7s4DDpa5xhYDH96UV1O0phq
         ZUackTytH4iFo4MzP/I3msup6XISy8F9n3ulU0VFKMRUlWtLd4HZITYuuN/t7Ldkk/+I
         sYmw==
X-Forwarded-Encrypted: i=1; AFNElJ+NMIXKTlPNzjmoRqOONTaB458UBxcRYU7L6smVmEZlpWbyu+sCto43XT7JOAaZaYX2WHZGKaf+tDajyQFioQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDiFYSFTKK8Y1rqN/HbSbHlKCh136UAb2eOP7l9LlvBImCJTYd
	lGz9tiDsSIYuOxpcgsgJO//X3couP7Gsk4Qxp41VzT3G8/oGI8eYyMM6rDbEjEh2Iex7fVDXKBE
	TX+J/ufcYmzFHKsjGP3JEW1/rqZ43+Jdk0pS2B3RucXk+2gEtypwts4MKrodoPRTrMHSYSIiHv5
	8=
X-Gm-Gg: Acq92OEWoN4EG0dh123cSLxpyQr3yYjvkL+ogxxO2O9J447SY9gFJdI95AJRqw2y4CE
	yR2RD8u3aL6EIzEUmwyjzhAdaUm1j+FYrE/aM/mkip2VWXwSjll69f1VJ8QmIZrkcjJl/4Yinyz
	7QO97KT6L7kD4mi00oCFIo2H8Coqp8qfvff+JSIaJzuJqx1g5T6Ud3NJUJ0tf1oSyWQbvMOj/Ku
	jN1663+gV7k+TK3JYiqKSQRTFyZ7IxWQu00N3CBGtlOhQJ4NrKDsUOjcqd6Yd9A8GJQMwXlmMJE
	ROY3ILTq0SSx/zR0xhXCyAY/Y9IJchN83lgQTWrxxYYzdawZjotbn844ECG9/jsf76dMew9U73B
	TonOK5+qQJEbPp/hw3HjW8yJxOVkaAPM5oeIGA34uIBs5eO8Zymc7/EfVI93rIlrRjgNopqCBtV
	Q/UTGbTzuhJ+9CUmOzmfA3
X-Received: by 2002:a17:902:cf12:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2bf367d0043mr46268735ad.16.1780145146408;
        Sat, 30 May 2026 05:45:46 -0700 (PDT)
X-Received: by 2002:a17:902:cf12:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2bf367d0043mr46268355ad.16.1780145145817;
        Sat, 30 May 2026 05:45:45 -0700 (PDT)
Received: from [10.133.33.28] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6f57sm49204365ad.13.2026.05.30.05.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 05:45:45 -0700 (PDT)
Message-ID: <ada65ce2-6736-44fe-9396-d3ed632274ce@oss.qualcomm.com>
Date: Sat, 30 May 2026 20:45:27 +0800
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
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <20260529-neat-bright-shellfish-eab5e8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDEzNyBTYWx0ZWRfX4NyDyp00xMOG
 lm9t7+uq3E5SGu84fZF72VlpgXvFSPBsI3lZ+F1dVfiGiuQ2SndVxZn5JAfctvqAQZNGWPukFTs
 /gC67pOqTaM9lRA4ej4HHRcTd3a6vA1Sda7h+pQ1Sbgc2Q4nF50yTSWwVJqrwRPUZ+3cKqoi079
 wgqTyHnLM5EDerJXNG3zLcaPf19YIXSWt+totv5tlccnwywzO1PQ1BbFkCxKqU9nrvOR3UIDJDd
 ejMwFCZ7tBWqShBOeX4XOCm7j8gS12lFFKQ67HqzDfzXNp04DMFuNq3lty/x7IHg8vjjLL4Hp22
 Z4oJe82DR9WQslJkkKPzsA7Tlrn8s30sbOevc2TeD92x2l4IepZJ3Ua1flejN2F8zNly6zXkTg2
 O+PqcnMKEifCEWNIjLSdb8UfDJhujLJoFRjKsY9vUOld3ur2qC3seXS3VGcGCJ81Mcn+XvHAYqy
 S8wfGYjnUs1xenPy6vA==
X-Proofpoint-ORIG-GUID: Ob9Xg2WZLRVWLCqYcUewfBU58i28yMsn
X-Proofpoint-GUID: Ob9Xg2WZLRVWLCqYcUewfBU58i28yMsn
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1adbfb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=PY6Zn8H8AAAA:8 a=mpaa-ttXAAAA:8 a=EUspDBNiAAAA:8
 a=pYZB3BhZI7Cztb0yzh8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_054550_310412_044B57D4 
X-CRM114-Status: GOOD (  21.54  )
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



On 5/30/2026 12:58 AM, Krzysztof Kozlowski wrote:
> On Fri, May 29, 2026 at 04:33:37AM -0700, Can Guo wrote:
>> UFS v5.0/UFSHCI v5.0 add HS-G6 support (46.6 Gbps/lane) via UniPro v3.0
>> and M-PHY v6.0. In these specs, TX Equalization is defined for all High
>> Speed Gears (not only HS-G6) to compensate channel loss and improve signal
>> integrity at high speed operation.
>>
>> For HS-G6, M-PHY uses PAM4 1b1b line coding, Pre-Coding may also be
>> required depending on channel characteristics.
>>
>> Add vendor-neutral DT properties:
>>
>> - patternProperties for txeq-preshoot-g[1-6] and txeq-deemphasis-g[1-6]
>> - fixed property tx-precode-enable-g6
>>
>> Each property is a uint32 array of per-lane tuples:
>> <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>]
>>
>> Accept 2 or 4 values (x1/x2 lane configs). PreShoot and DeEmphasis values
>> are 0..7. Precode enable values are 0/1 and only applicable to HS-G6.
>>
>> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
>> Reviewed-by: Bean Huo <beanhuo@micron.com>
>> Reviewed-by: Peter Wang <peter.wang@mediatek.com>
>> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/ufs/ufs-common.yaml   | 45 +++++++++++++++++++
>>   1 file changed, 45 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> index ed97f5682509..d90cf25adfa5 100644
>> --- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> @@ -105,6 +105,51 @@ properties:
>>         Restricts the UFS controller to rate-a or rate-b for both TX and
>>         RX directions.
>>   
>> +  tx-precode-enable-g6:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    oneOf:
>> +      - minItems: 2
>> +        maxItems: 2
>> +      - minItems: 4
>> +        maxItems: 4
>> +    items:
>> +      enum: [0, 1]
>> +    description: |
>> +      Static TX Precode enable values for HS-G6 only.
>> +      Values are specified as per-lane tuples:
>> +      <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>].
> You need to include them in any of applicable examples, otherwise
> nothing here is validated.
Hi Krzysztof,

Thanks for the review.

Since no UFS5-capable SoC binding exists upstream yet (the target SoC is
still pre-CS), there is no vendor-specific YAML to attach the example to.

Is a synthetic example directly in ufs-common.yaml OK to you?
>
> Why values cannot be on or off? Or even better: why you cannot just list
> all the lanes which has it enabled, assuming disabled is by default?
Thanks for the suggestions.

For the "just list enabled lanes" suggestion: precode must be configured
independently for the Host-side TX and Device-side TX transceivers within
the same physical lane. A lane index list alone cannot capture this
two-dimensional per-lane state. The tuple format <Host_LaneN Device_LaneN>
is the minimal encoding that covers both.

For the "on/off" suggestion: the on/off string pattern is used with
single-value properties (e.g. LED default-state) read via
of_property_read_string(). I am not aware of precedent for on/off as a
string array for per-lane tuples.
>
>> +
>> +patternProperties:
>> +  "^txeq-preshoot-g[1-6]$":
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    oneOf:
>> +      - minItems: 2
>> +        maxItems: 2
>> +      - minItems: 4
>> +        maxItems: 4
>> +    items:
>> +      minimum: 0
>> +      maximum: 7
> What is the meaning of values? Nothing here refers to the spec, so is
> this driver specific?
These are not driver-specific. PreShoot and DeEmphasis are standard
features of the MIPI M-PHY / UniPro stack. The range [0, 7] is defined
in the UniPro specification for the relevant PA layer attributes, and each
value maps to a specific dB level as defined in the M-PHY specification.
I will add the value-to-dB mapping table to the property descriptions in v7.

Thanks,
Can Guo.
>
> Best regards,
> Krzysztof
>


