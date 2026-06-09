Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67964CD8CA4
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsAgKQLTqqBsaH8gJxz6UunUN+XMU8p/s3pmuCBnLdc=; b=aIUzOf9R2H/ALg78fVgIcu8Res
	S5d3Ot0gOZaKz+T7kOX3+uBSJV8pEaT1wTkapnGdMCI31mcZt1k+yFGrzZh3JTCU3VD+2Kln4HxOZ
	y0XmKyUX74reBlBL48I55SWv+IStFdPj/qkxBlMl/MA7YCLi6PDnD5D3bWfcBJ1xd30bl5kb0mYvO
	4yzCUly/tOoZUjZLWFnTdfK64ZU5A8X9Muy3eEqLRX/mHrnHKtO3AfWjNAZGuFWa9/MGYo2IzvRDk
	16LPGUPZ/IHcMtWdXBqJlg5ODfX4/mEB0TbanFQNaT8QZ9amwFrx7SUNJMStu7HWOxcpeh0Lmy9NG
	b2ofJ5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsTV-000000059uP-1iwB;
	Tue, 09 Jun 2026 09:10:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsTS-000000059t5-2Tmp
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 09:10:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rIgB1585628
	for <linux-mediatek@lists.infradead.org>; Tue, 9 Jun 2026 09:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FsAgKQLTqqBsaH8gJxz6UunUN+XMU8p/s3pmuCBnLdc=; b=jYvHar5WxGNuOfDH
	aRKrJA7I/I4F1R6q99UP41suPPlymT8UHMSKOoWBlYAx2eUJRtm13uPMEI2kmmWl
	XfrQN1lQJ/MpA7r5occZ0EhWYp1IAnXJc2xh4DTfxFPjk/pibv96THd+qBIPlEfx
	Qk58Qb74lWhVWHHjRr3Q0gS6AR5W1n9fI0h/MAIWdkXILgMgtA/Srk32VyAZHHjC
	edYMIo+wrDA8aM/7PRzAdaAYBnkNevWNNbxJqkrBOveRiEmDRzdo/5OBt0vwBTjL
	S7Agtv5Hfh1WPr+ie0D15naBJUwJISxwXHJLQHlBoCKiy0HtDrnx6luuFsCSpcEF
	v8AZ7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqggbxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 09:10:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bb6c41341so5943857a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 02:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996217; x=1781601017; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FsAgKQLTqqBsaH8gJxz6UunUN+XMU8p/s3pmuCBnLdc=;
        b=i1U+kxITuq8d5k6n0+yGq4UcNCmIwiP3/T1aTYYj6lwopMqScvmyE3QOGhMg/WrQLO
         sg+Qd019/sXATeYTSUSYPTcNiIYGX/nmgJm69pEePSM2SvSmvCDPbsZ+3wRpXR2bOpPo
         o4TxhKFETEftLOkvwsUB2zzExBr8CBexxhUW7CUi1WqcvHMoSCOy/egBzY5wcKt2ZlDJ
         faN6YIrCQm+M665YEEfqO3eXiQvfx0o5AecifDa3LcCA/xf6BqdRwpLZ0HgICdamOfyE
         h6PYmISweMkyYpgFwv3CgaEZjBtxyMLOYvdEfb3R1LAOSmOMwZKga+U2W9O2WLgvxo7S
         Oy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996217; x=1781601017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsAgKQLTqqBsaH8gJxz6UunUN+XMU8p/s3pmuCBnLdc=;
        b=n96nmO/JMQMzW0pPG+FF6vjMkf/VaFXJ3GoIcUIh1QJQp+igQkoorGVwnfFHz7Jlf4
         qQ9JyqpjjXUn1tOpqnqQifib3S446HKK5UqAyyoGU4CTRK3viiVqUvgpofKZ4YgCpv9f
         zkGXiZE9jEZigGWZN1hQK1qBFw6ZiT1ZS5l8O+mac2XgK+KuBUW1NzTdyAdG76SqQIoD
         EVpZyfWajYiSkBVNNgM0Pay6LKSj5H3OTjxBBponInbhm6W6QDKGHL2iqpkrf7RS/czt
         VsKaqcfmrg21pLtnpzxx5NYay9GVVoOxyowTuIJxmDlWjcnuouKgY3q+LhxcTGS4Tzmv
         8dzg==
X-Forwarded-Encrypted: i=1; AFNElJ/BekWNZcmuttqpZ15haMjvzxU/dWbhZtlRsrhshpqZEUcnAKo+vn5ITFpVTUDUylOXIh2WtdEvc3Ob2pEpdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjT9jRpzArow2x2uC84zTNctDPyDAan/+qyYK1EYJLvi7uZlCX
	GLxTTBh5zyc173yIzRtRNsfc0XuPYSEOiab8B28j3+o0UpRbcz1sW0YPog5Lp6su8Im3Vhf5ROW
	JTaqphzS0USJvbNa+HZb9IXEqL4vhJ869C+DSquakWcpps61RsaQ/rNBPQ97MwAQIBYhDYJxu8+
	I=
X-Gm-Gg: Acq92OEngqYGT3S76IqcF6YxZ4TjJLZ21A584DJfV4EuhEp1EDJtwx7yhJgRs1VA1ja
	9xbZCJ6uwWFzgjvVCiZaX6MNopgIxyPo/212j2yllQgUZK5iTcl8WC+t0K4TzZViCYDJL0wb0SW
	ijJ9zQ7kOmy+Uvn2YRnMBK8jTtg2dupDgMb56UU9PtkWwukDs7x4GLiH0AA8d6gjcJP1838yeGF
	PdliUp1vaKZmA3uU4AbThbnwqSOpJWnkcdu7ckr5ajPJTEGhiwoh1fZO5DnazErmh6OgJWGnL6g
	KbJd9Nq3GSI5IkBAdt5RwntEd9B3w0BbRMy5HvAwOySuZlwqqx5+t97+HWAQr8w2Ntn4WnugqGk
	qtA83i8jObE8EMqep0qbHhSXrYTF4fidTwWxq4gEsHVH/JMwr6xzmBi2u++Y10hOgWz5murK7Kc
	VznFJgoDoJheuRT3zqZ6Q9qw==
X-Received: by 2002:a17:90b:3d8f:b0:36d:70c8:3a3 with SMTP id 98e67ed59e1d1-370f0772dc6mr20194894a91.15.1780996217263;
        Tue, 09 Jun 2026 02:10:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8f:b0:36d:70c8:3a3 with SMTP id 98e67ed59e1d1-370f0772dc6mr20194847a91.15.1780996216828;
        Tue, 09 Jun 2026 02:10:16 -0700 (PDT)
Received: from [10.133.33.202] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6d109dcdsm20890722a91.9.2026.06.09.02.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:10:16 -0700 (PDT)
Message-ID: <5f74ad99-87ee-4d21-ae26-80dd462d98f2@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 17:10:09 +0800
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
 <7d49742a-7602-4f58-8dce-7e02664b783c@oss.qualcomm.com>
 <64bd6272-6111-4ffa-8a4a-366d0c287693@oss.qualcomm.com>
 <87c9f8cf-1300-4dae-82cd-fe6427649cea@kernel.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <87c9f8cf-1300-4dae-82cd-fe6427649cea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfX1aTFpR1fqLpD
 sV4FadbfOgI+wrO+qE8Evs944/0tnHI/q41Pm9sFbBbjZdDsoSNzGI7GdwSmwdv6zKJCRGHlTF/
 QJ37ScuOSxP7Otz61XCRYv4TbYMJxXrBc+qhmrEXfDpJ//MG4uDYd/aQUhbPntqdxt5aG7BR1ux
 DXxpxgA1J/M50piZOVGVBKw4oDs+1wXvry9piNELXV9gmgqfZvsJHnkG5HSKwXmNXeyFwRplOqu
 g9hjI+kEHehjfOuI36HTtdMbE5Uc7sUPFL93Al3D+cPn1nH2c7zxltATKVKfN90RoV1whbOjCAL
 Y71RDrMkNMmsHDVjWNOAly9HR2LHh7QGUloexuIoSNvMBvy3/BaU8w69L7ka9uJcm4anleQBJaz
 GWaRAutAmdNOTuYXMWY+E3sRpjlIjH1v1cg73jDe2+mipkwYyeORD0o55lISK+sbpjqNDQdR+MN
 i7mdBa9K7RJHGBSL0Ew==
X-Proofpoint-ORIG-GUID: kNLUhfjwaNj_9WdJeaJ400DXvNbbDy9l
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27d879 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=uOah4UoORehCN5dyJioA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: kNLUhfjwaNj_9WdJeaJ400DXvNbbDy9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_021018_654223_293903D2 
X-CRM114-Status: GOOD (  10.73  )
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


On 6/9/2026 3:08 PM, Krzysztof Kozlowski wrote:
> On 31/05/2026 06:48, Can Guo wrote:
>>>>> is the minimal encoding that covers both.
>>>> Again, why do you need to encode '0'?
>>> The tuple is still needed because Precoding is configured per
>>> transmitter-receiver pair,
>>> so each lane has two independent states:
>>> - Host_TX -> Device_RX
>>> - Device_TX -> Host_RX
>>> A lane-only enabled list cannot represent directional combinations
>>> like lane0 =
>>> (on, off) vs (off, on).
>> How about we split into two properties, something like below?
>> tx-precode-enable-g6-host-lanes = <0 1>
>> tx-precode-enable-g6-device-lanes = <1>
>>
>> Only listed lanes are enabled; unlisted lanes are disabled by default.
>>
>> Are you OK with this approach?
> Yes, I do prefer this, because we don't have empty entries (<0, 0>, <0,
> 1> ....).
Thank you for coming back. Sure, I will use this format in next version.

Best Regards,
Can Guo.
>
> Best regards,
> Krzysztof


