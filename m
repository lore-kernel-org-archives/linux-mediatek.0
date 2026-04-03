Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE65E7E34C
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2026 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XgaQEQBW4nx5/BlnDB5CAJ3u2Ziz0/DMOb/BBMOzuM=; b=ad3TCoGJLS99abicPUo3nyDXSF
	j5dyJYsdC2rYScbXxArMQXEwuL65NPw4Brs1U8Tm0/uqk/FAq8Nh9NaAim9KrJo7Zf+NtV36e8cPC
	nJA0sjabJL+3v715c7NDsLVBOwltJTuQAwsSaN/3j7Hxr6pe+lOSpI1E0jHq9xRQnIpYpBCaFwDX4
	MiT1/GA7iQDqJE+m4bVNoqVvL9DGcer1r0Lz59k9QZTRZ/k/aPMHr4fy/yDqFl4H8pZKSPxSA1HE4
	uO6TxfS4X+h87Ob9JqWZ/+jGmmvTXid+6mkER8Q5PxTASFUEFP4LDlPe5pbFuwnPU73aHnBZ6EB1J
	WUPta66g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aEs-00000001kSr-2RUe;
	Fri, 03 Apr 2026 08:50:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aEq-00000001kS4-2yQu
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Apr 2026 08:50:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6332t35s1562125
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Apr 2026 08:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XgaQEQBW4nx5/BlnDB5CAJ3u2Ziz0/DMOb/BBMOzuM=; b=IBUdbFSKCyAiTQj2
	k72Rp4qUkvy47gil/DVfe7BsjRSosSulbH3Q6gxkNvBfxF2HwnLZFqrM814d9m5t
	tSjxwDcEGSfIIykHzdgBwYvw8RVELBwu25oGn8F+J+IWUnrU96Ggit9Ae+bQ1WrS
	pE6ZnBMCGnT51NFpsBU7JzrzNOZQ9PTyyZOB0LNvs0jwCyi4m15NAh33iw1fm4+6
	9JOSJyh+xqjEwt27EQ6D+gRmVTb4ghWdZhoHsAYTHbwpnQtJw3LdHpnLJidLPqgV
	HEIiuTsWLBBAl3Pix4+/0Z74zL8xURjM/cwtN7aF79NX0GIrmQMPcIjMOGF64QcS
	kwqe+g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um72suu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Apr 2026 08:50:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b44f7b7bbso48591471cf.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Apr 2026 01:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775206247; x=1775811047; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/XgaQEQBW4nx5/BlnDB5CAJ3u2Ziz0/DMOb/BBMOzuM=;
        b=SQXPIL3cGnahgSBH4EXlKxRPeqykMDTHdy5/6Oh3uDCW7O3CVDd9YGlOWmGq2ucZSe
         Ul3zl2rMSUFJwduUzcxdNJB7ifbE0f7H4L8U0c2ZRvEe9+pySrWuN69ye4EXqS8eeOvw
         WYV2h5ISqI0lJrFzTSugjgjsC7xxxr7zOCFoqJmo62Ec+yXdtlvw6FMPjDWHw0roeQMJ
         lbe5oXVyhq3oy4YQe8kr2fELvxBKrJ1FR9SIK4QACgcmZpnLFo4YTN6AoOMCUU8GgAuP
         vWzDenNaS+vOdCsI71EUqBN91lhCuuPs7JLmUKHdemdeY+f7UROVY4NOxAydGUtXv7fj
         Oxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206247; x=1775811047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XgaQEQBW4nx5/BlnDB5CAJ3u2Ziz0/DMOb/BBMOzuM=;
        b=B4b52sFpAdIPeLYAPfmaHDE9K7Pedmqu3RVWV7PsLG5vglQ9IDtASRvhVvQ3rOx4sF
         CxHK+oQpii4t+oWcQgsmyjhBauwOi7P8C2auNGMzVgFzxRAIA6WdNhiS6BjgfBsKDAPp
         tgWwb/Qot0kq2SS7f33OLxcG1winh2VK0KmQSyqqIGOphH6UUshVNo2cG7r4LjpLbFVU
         +xGNg3VVaUvzls8FfSwPIqUAqvrYB2Z3pE0htRjFNiEYnL7fcvo7d4ppsmdcKZma4MfE
         +8eatO6nvjjqDqmlYxhSNKONnUVtKfSw/6kYmiY8VZxr8ajDL+tj5wcWgg2lmLBiDxie
         ppDw==
X-Forwarded-Encrypted: i=1; AJvYcCU7iuR3qvF2ixPcAfT42HSeJBlaw+3dqPf5U/pZeAn7kI9BRZ0jp9VueBb854pOxDq3jzhBu0XYk4/jyt60PQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjR9I/T6Do4CzCZyC3TIsWhqHCgRuI/hGNrAUD+j4ClVqja30u
	SK4j42hZjRy0m5GUwZN7TeUvDgM5M5PhADLWVbUcOCcs8Oc6dWlli30SO91L0k0OR7Pw/7b+kqT
	V1jsiWrhTdXw8rSmvoWM7Tf/dNSaNOm18adtPItsXWjp6h+nmZzCAlqwMEMuSBmhjerdj2xo3sX
	o=
X-Gm-Gg: ATEYQzxDc7O4YC/+VScfeOnX84cnZIDImMS6UrT9z+Ua9/WcsgSO+txNVGB3rJ91ORW
	ufKvZeusrNcmXVMjh0JjDf7v2V/5H2eiuWEVL2lNwz8hgNPmq5ehZ6/g9GrctWRzZNQ2VNzNfAi
	zlLbasD4giiuwhec0NOd2eAsuQ9O4kDGG3/BEY7QFDd3ECqTfRRjTyO7dfE41jfc404l+Y2A+dN
	cXZ789ffrWGzOf2S1aWosxXTVR5tgyESMjw9Q7meP0caGdMBdM4g8MMgw++A0gyHhGuiJY/xs43
	A7pse9wVefVd3aeXE3MoRL395+Ax0EM0bAqq66idJN1mxoX6moI0Zv0yqsCetkJx/nB2qDskFcc
	hr4sXMPfz92Ib8KTMC02RxtOYkzkpOpQI36eLXnbGZiTr/lB5/CDhxhPo85qFOxwKDJ2ETy0IHf
	eI6yOTmMvF
X-Received: by 2002:a05:622a:2292:b0:50d:6b06:a44e with SMTP id d75a77b69052e-50d6b06aeb9mr7296971cf.17.1775206247323;
        Fri, 03 Apr 2026 01:50:47 -0700 (PDT)
X-Received: by 2002:a05:622a:2292:b0:50d:6b06:a44e with SMTP id d75a77b69052e-50d6b06aeb9mr7291691cf.17.1775206232638;
        Fri, 03 Apr 2026 01:50:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e56fesm14515027f8f.27.2026.04.03.01.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:50:32 -0700 (PDT)
Message-ID: <3b4c4607-83e8-4621-ab81-cfa5e82b9460@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 10:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] [PATCH v1 resend 0/7] Timer driver module support
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        "tglx@kernel.org"
 <tglx@kernel.org>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "jstultz@google.com" <jstultz@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20260327180600.8150-1-daniel.lezcano@kernel.org>
 <AS8PR04MB842096EB48B0B607711702EEEB5EA@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <AS8PR04MB842096EB48B0B607711702EEEB5EA@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69cf7f68 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=7_RI1GwYu90yzXy_LAkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: GcNKebJ3nF5ceHu97jrI64-_MokBaQDo
X-Proofpoint-ORIG-GUID: GcNKebJ3nF5ceHu97jrI64-_MokBaQDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3OCBTYWx0ZWRfX0xgoGGuNjZtl
 0qRGX2dSxsdqQ40l+jtlD197kjvkgZFcvMxcpy5LLE6NnrtIZWzikO39w/Nbvj9LZGna8XMqZqm
 89/bc/UzBYO/Ivr2am4d6qTnGrvMy0TH6ASCmiYPKW1McXFI1sFxk7VUs8x3Fl063FoX+bvoUFb
 zQAj+01Rngawz8obY5lSteSjg3jDsC3Tj7KGZedwDwIoo/haUjMCpvE2XG1YLnPFdDZ7PlMtQQ3
 AxPH2gXTWPB0MAxWRnb03hEYrdeZAAUUdadp5tQ50/hvvrD6gYiM6F6otwvxnJDSXKvfU86pjSq
 BQ8X31OVpgD4xvZp094YM6rW4aMHG093J8Ncng/cytQBiK8ma++L19+jWKSEzGxEAbVkNK3V3b+
 yoMopIIOMkbfP0ROMqnu629G/r69OYXud4JKZutU3fgAIvj7yDj+SW6HnIk89l2+wvWiEdQANQ7
 CS/Ri/n8ynZuwPDltVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_015048_746389_D49CC06A 
X-CRM114-Status: GOOD (  12.75  )
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


Hi Zhipeng,

On 4/3/26 09:59, Zhipeng Wang wrote:
> 

[ ... ]

>> 2.43.0
> Hi Daniel,
> 
> Apologies for the delayed response. Thank you for working on the timer driver module support series. I've
> tested your patches on i.MX platforms and they work well with the TPM
> timer driver.
> 
> Based on your framework, I've converted the i.MX TPM timer driver to
> use TIMER_PDEV_DECLARE. The driver has been tested on:
> - i.MX7ULP (ARM, no alternative timer): built-in with CONFIG_EARLY_TIMER=y
> - i.MX8ULP (ARM64, has ARM Generic Timer): built-in, module, and
>    CONFIG_EARLY_TIMER=y configurations
> 
> All test cases passed without issues.

thanks for testing

I'll apply patch 2 and 3 and send a v2 for the next release and wait for 
more comments.

   -- Daniel


[ ... ]



