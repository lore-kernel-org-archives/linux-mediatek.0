Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C51ED5E146
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Dec 2025 12:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1bUZC3wQ09/vUi2Wz/LwL1M7PS4s9jI4u+ipA1NkPU=; b=foZZpE4NLzPRUbrgs+rTz6gXVw
	YTyBVUmbRR8H42qKTOTs8sBAzhjTzwAGkjBV6IRABRCNVrALcQVPHK2ZbY4x+AWcY0g42ijGAU/dq
	Gf1Z+WZOYr2jARLNOn7M5LdT0agbr4LxG9r+yjD9Q16R1XMkanxqIJ5s+GYvJcD+5sJHbKSRcHLpQ
	hGFsQWchtuFRY6tRNgb2RT+UW6iErOLpSgbbECcLMnQ1KAveDl1wBufwI+2BNmR5djRcztl1UyBJ8
	BFtQUyXnFCp2lFLuNF2UhKQVq0YuHrYX5j6SGtNaUA7GGuAywVzvfQlG0iPvpOfhb/42mNULe6TuX
	P/xRqNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVTm2-00000005A0o-3IMT;
	Tue, 16 Dec 2025 12:03:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVTlz-000000059zo-2xXj
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Dec 2025 12:03:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG7kDDL1205156
	for <linux-mediatek@lists.infradead.org>; Tue, 16 Dec 2025 12:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1bUZC3wQ09/vUi2Wz/LwL1M7PS4s9jI4u+ipA1NkPU=; b=WTuuKQx8zjT7yA9n
	RcbkvqABZwczl032YJYNNIyEMQQ0tM+vIYIzu5g3Dn6Vu8y9nSVDA/pHjGy0I+DO
	kf15TiqGU4+zNGPYK06xCKaXZJ7qclWs1jao4YkvXbKIZ+pyozusvyzYCINi6/br
	lzPLi01djXZzGrCWTp/xAGD0biZWoAwBN3OsG6oF/2MURjRalhKBPSMz+q37jOOJ
	ZGEoNU9XbiyPLo0IR26nMlkTduTn/0lQvy11X/NvYy+zjberHj69u4tyOk1aPwTS
	9jI8WWAUDGCRH2jNuU0sknu4VMLaz4s2VrnNfRIrO6wuKogI4/A5TufHPHXhPrLf
	BdTovQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2pdaks3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 16 Dec 2025 12:03:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bbb6031cfdso67002385a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Dec 2025 04:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765886580; x=1766491380; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1bUZC3wQ09/vUi2Wz/LwL1M7PS4s9jI4u+ipA1NkPU=;
        b=OXwmOqGEkE5uf0OTlUpU2LPpvd783N0vDmMZPYxPaEeIhRfd2aemMDIPwSNg4r/Tqy
         XAmC1rh8lDTzpe/zyFJdKMYWQ0aJzdokD2G9NF3+xYxWqn//BYcf+YOdlm0X/paIYqd1
         ThuBIUhWwB3OOBoB9HR385lLkJXnkDO+ROV1/hu7GKMt7MDLjypBTg0r/DEEuUFuSho4
         KCDuhYTncwhSCiaDT+sJ8aBTdhFSGmpv0UINNr8e6gMvjdVeliTkKo8F55pyILUiqY53
         HCMew6QSzmmHzV9G9SIKgRCAiA4u7vdMcEbFa4j/OYxKyBUSzZmzNwWZFkxW4C2ch9Zu
         PKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765886580; x=1766491380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1bUZC3wQ09/vUi2Wz/LwL1M7PS4s9jI4u+ipA1NkPU=;
        b=xBkQbkJJRCShbGhsb1wVsvyizSFVdN/1d5Yk7tCA6BWeJ9ct+K6fZ3KKpmbxOkNagt
         ob3FbNiMBfPxHGs4in8SY3nt4xHCEGqxoGSBn4YcD4Im2FSkuHsUWpfiaNdqE0dw4lxw
         U0dOGLZBGuKJXz7pSkGqhNhldImnDzWAQnC041YWjw48pdr88MuhVhjatNoP7IemdtWo
         F6mqYeZrliQpuUitUJiAZKTN59GpVs93PXW/2CD6qlqqAQm4/+anoHiuqcPAYDTvZmfZ
         IXI5d5J8RrIQZtqYTl33dyeEsFMtcK7FqhdD6PA33ULtt7DHPXBsPfLed3lhG1jbp8UV
         xgQg==
X-Forwarded-Encrypted: i=1; AJvYcCXz/HHHoYlzM7iiU9/EbSUMIsAHfpIW4DX4KTsKujO7Z0Kyw0rDgLgTs1eZLQNnlevFVHWTGk6UflPkhXfBVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnr5qozfUPCeU/yDangDcin/Aup+jp9m0cjfsmGjFrZqD/l8nT
	oUclOmatxhKHpSUSzk4hNx90LIGPJQnNIWQfL0i1TTbH0XILcjCUin/DD/y7uXu5vlSx/oeX3e6
	3g+z1ibBFssznuktKMeMPnzP0Hh/PWZpmPn+er39g7BS3Kv4nCyGRdy9ptKCahSZYu2M31ebbjm
	Q=
X-Gm-Gg: AY/fxX4CZTxq8E6+fE19pGa6KSyQ9TtSt7Kjce7CEyt3YBy1OEjg6qY8zJx6zNJdrXB
	0I40lFrg/0pxGs7coNN2KrJ58q9HUX9d8s9oSTOaF2Ild8FNv5eYhy0PjY2y/b3jb9/tfaNRe6q
	iu7LQK5igUc9/ELLt/pPOTFLi3vVcGLWHl+ItVv4lUf/EJ31JmRyR7zQ5KrGVSaIimN1BSjsG6w
	NJHBC1NFHD3qiLMFGivU4nL/jWQIeeiNp6u1GAjAH+5hdHN/D/P7ityfYZTc4XlrXFFB76reZsp
	E7lo83Qnp245CAmUhDpoBXpQlaneBe8kk2zv5XqhEvEKvFeCuQuwZc1kruOGurq/s+ktYyV9aj7
	1j0EPqu2iLZK7/NqMYTq4Brryz7lMxxCvaGStpnzCV+C/8+xNS+O0K+V8bLGIleCS5w==
X-Received: by 2002:a05:620a:468f:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8bb3a0b7e5amr1437505685a.3.1765886579622;
        Tue, 16 Dec 2025 04:02:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+LwGQhgX+HV6xSu98Kp8PBKIcLhjvja7byx1nEf8nekydl7DDS37zTtoZtPzNHvCnZUEeTw==
X-Received: by 2002:a05:620a:468f:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8bb3a0b7e5amr1437499185a.3.1765886578963;
        Tue, 16 Dec 2025 04:02:58 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-649820f77e3sm16041066a12.18.2025.12.16.04.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:02:57 -0800 (PST)
Message-ID: <695ca5d2-b713-4838-8427-a9d31751c0cf@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: Remove unused includes
To: Jonathan Cameron <jic23@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michal Simek <michal.simek@amd.com>, Vinod Koul <vkoul@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
        Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Philipp Zabel
 <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
        linux-sound@vger.kernel.org
References: <20251212231203.727227-1-robh@kernel.org>
 <20251213165949.4b51f7cb@jic23-huawei>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251213165949.4b51f7cb@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P8yr1tE1hPMWWt2SzCGA6f7PLPu5cH95
X-Proofpoint-ORIG-GUID: P8yr1tE1hPMWWt2SzCGA6f7PLPu5cH95
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMiBTYWx0ZWRfXyZnXeDPeRUDm
 u1y0PQYA1Yrza2XB74gq6Y1SzW5f9dFlK0HmrTmunAyjLAx8gCWvxmZSK/OqJrrCfIIJjjp4wbO
 C3dk8IanRTPg4FtGgGA5Xd34xKmS4yvT3EQ2Jv6m1zSHWh6yP2123kZSUwGiW0m/FsOxvJyDJLy
 P8p8KnVs7v98ptgAELnf6PDLC3KNxQ0lQbWQwpA/W2H7swAELdPbLalmt50RBRNCYyNwmJDtr9c
 dszVy4vmfAee/kfJ3KG3oEAxgaMmw/2butznK6T5Kzs10eXzxYNRZzfEh0OyJ0rorldEdKCp9fF
 5woiIMGtIN8BaWsnPMw8714VZ9lm2D4wuxrtsao9q4CWDgK39H76temc3QSMp+Z2AUD39QsiKPK
 tCnO4O4yD5YfDbdIgSDFOWy+y/41KA==
X-Authority-Analysis: v=2.4 cv=JYqxbEKV c=1 sm=1 tr=0 ts=69414a89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i0EeH86SAAAA:8
 a=UbNXja__m5_aMge2JzcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_040323_771751_95B562C8 
X-CRM114-Status: GOOD (  12.37  )
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

On 12/13/25 5:59 PM, Jonathan Cameron wrote:
> On Fri, 12 Dec 2025 17:11:52 -0600
> "Rob Herring (Arm)" <robh@kernel.org> wrote:
> 
>> Remove includes which are not referenced by either DTS files or drivers.
>>
>> There's a few more which are new, so they are excluded for now.
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com> #for-iio
> 
> Ideally we'll get a QC ack on those as well.
> 
> Jonathan
>>  .../dt-bindings/iio/qcom,spmi-adc7-pmr735b.h  |  30 --
>>  .../dt-bindings/iio/qcom,spmi-adc7-smb139x.h  |  19 --

Those are being moved to dts/qcom:

https://lore.kernel.org/linux-arm-msm/20251127133903.208760-1-jishnu.prakash@oss.qualcomm.com/

and will hopefully be in use later in this cycle.

Krzysztof and the submitter agreed on that outcome since they represent
hw constants and aren't "real" bindings (connecting sw to sw)

Konrad 

