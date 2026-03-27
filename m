Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984E410F2865
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2026 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQ//zaekyYctHeGFk8K9m+oJRUsOh3LS5cgW2knJ0BI=; b=eKFGwf5dXaO2dykJJq/2fi9LyV
	qxJkxfDkyYxcjeRlhn+OldrLo9sujdOTBAUv4iVlNrZQ2yDY3rnY85YzH9+QrtAIOklNv1HhSU4Io
	JGZbitmx8qb6Wwm/4ILYrPlE1jMqG/1CnMiNUCcDT5GQTjkk4Jit6WJt3wDjAWJ4m0JUPzZBMEA7k
	jhxf48IHBufF1G3KQaVy4hUJ/XzFoA6RhKwdIvLpQfFxdoe72U++ytp6kS9SHGHCIk5Qyvg6JOsqn
	qAbfdNFfairqehMoUXJ79DiayhmalMhDvEiBMJXwAgeWM7yA/Whm20cNcJSO9f3qAqyfFnuB20ede
	J/6iTVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BWO-00000007uMo-1VZO;
	Fri, 27 Mar 2026 18:03:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BWL-00000007uM6-3SvE
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Mar 2026 18:02:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2lve1458676
	for <linux-mediatek@lists.infradead.org>; Fri, 27 Mar 2026 18:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQ//zaekyYctHeGFk8K9m+oJRUsOh3LS5cgW2knJ0BI=; b=T1ZB8iAIYjnckWb8
	cLN+J02anKDSjFfYVxXaa6CxxObEBooyQgCPvLfxsoIcbG9V/gBew04T3N+aYj1b
	zHnbcfTEx+0OJPTsQ3hUK4IxfUnAt7XZKkw8ReN3s7CooHU4J2/vkwVgJeE2Mgwa
	m6Itsck0pDguaQH5BUC0hdfLGoElENC0kjt+FHVJ+sB6ULiJpIl5fJsJzsKfDZQL
	VYEJ9MHYQkY02ayf1e2yglbTfQd5xf7k2ji70nszmogwH3FL86oglFz7T1veev1N
	7tqGyKDEaxKpA77W/Zm5lPonEINRfPnkaU1mcvbyf4323+xVQdJp5IlqXKWcc36X
	ehycVA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6kv58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 27 Mar 2026 18:02:55 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56ae34d6738so6741595e0c.3
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Mar 2026 11:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774634575; x=1775239375; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQ//zaekyYctHeGFk8K9m+oJRUsOh3LS5cgW2knJ0BI=;
        b=RxQx1HWvgOR6Oc01EUzmmp6cyPxtltBThmLZXCWDJvhE3Vnq1Es6qfLbKrZzIWq0WB
         YqApWCKP0RRNdVSDQLcGokfe42fUK9EHmj/38b0sLHugIXPqYGJQ0BkuK0qeB+/s7CFG
         scAfAP0VK5N2gVw2jlGV/7+izUBFWNlS48g7j3PJhc+jFiOWJTuIQEcmC6MBI2YBEn+J
         S0XxVQacBB+72TsUoWQFdcAvPkhXhITWHQLPKCT9LWGMaBgZu81wq9fzBbMe6ngrdT6k
         Ayy34/rESm7RuR+6K9Ou2UoIUoeG/pAAOD3UNP1Q536UGCkbRscgOfml5riGDYUOYahk
         QE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774634575; x=1775239375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQ//zaekyYctHeGFk8K9m+oJRUsOh3LS5cgW2knJ0BI=;
        b=HspWSakOE7H+77NO7ggj7L2HrNiWlcR0XIvVUnGkwnIt10uOUGAu+fSH0+wbIh+1fo
         HG3PRkeRaU7ELLpXrdlqxmWlipSLUrNmpHoUzYe7zWFR17D/UgZnjrn9OTUML78ufcoC
         r5DX0B4j6tLGsH3isqsK+2yQa6LFeCjIFrtV88wTGjjerW06Jlm9Be5X94425VmEoEJS
         vLmhI09CJHTOcNXMeBt3U2z6u9A6TYShtb/T+beFR9tZ8D3QAZj1BnCycQSi9uhvQ82B
         eWjA2NeODn2iomSWOK62fqFty1DArdUmblb7dHp4vWt4QuYoXA07On4+9Lz/dZVRbrkD
         mCDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC63WJK+PXVn3jQgF7rlYEChph5pJIoYb/B9n34RWIvHAd1rJsQRBp1SYWw4gzil5gy+X9E6EVF2gTA2DTUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIm9U2vIiFeNuxB/2uUImkEg5a949QX2CfJXRxwJKaoV9wZqBp
	4MTu9Uz8M/+AdPmfHseAdGYaGVYiGnnqwkzPiawXsRcptxyJBI1H8IHA4XFX1mX2gE83MstThjF
	+mFSbQtlVVHnI4u1Y3s2U+IoQ5lgdXyB0xIiiGPUa/ZRVlJiBC1wG628mSxVk67360Hkwz8DbTP
	A=
X-Gm-Gg: ATEYQzxKJcrdmXEWz4mPYm16AHw2RwxS1TFjwKxRfBHL20zB6Zj3mm05Xos5Npnrpbg
	ei3ICQRNjPFW84ym/n7tcZG+VNMMUMQeOPCyp4iFzV8vqkQMZosmuDQnjKop89VIpZ+LOoMUSN6
	x68dvBeTuO+9VgWwEmziXmMQqF1mK8THxBxU67c1Y5UW6urXvfEEH1H6wpJoDm7kU/u7V4kqLKp
	Oh3ADrW9uAIJ7PKnHEBKJ5zT68Twt0SBXASiysILkeg/NKJR9fmaMm34X0/YZmqWH6+5cR64KqY
	x0uBD9/v7rx/y+pHoIArXnmZYKXBYHA0MHO1AKiHQ5DiHBTG3WBg59hlMlUQ17FioD5QEQ/N64J
	ijPO6+rXfXTyzGvAHrHogUWqBUFc7RvohmGLBv1QwlhuGDpph8mqJpWaRjmE7xUWoqiQWeAXS1G
	SVnHcIQQ39
X-Received: by 2002:a05:6122:4d07:b0:56b:982f:1267 with SMTP id 71dfb90a1353d-56d4a6680bcmr1811799e0c.13.1774634575179;
        Fri, 27 Mar 2026 11:02:55 -0700 (PDT)
X-Received: by 2002:a05:6122:4d07:b0:56b:982f:1267 with SMTP id 71dfb90a1353d-56d4a6680bcmr1811766e0c.13.1774634574675;
        Fri, 27 Mar 2026 11:02:54 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b656:6dd8:ce4d:18d5? ([2a05:6e02:1041:c10:b656:6dd8:ce4d:18d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9194311asm17630167f8f.10.2026.03.27.11.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 11:02:54 -0700 (PDT)
Message-ID: <3fafb235-7bac-42e4-a28f-c044f32967f7@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 19:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Timer driver module support
To: Daniel Lezcano <daniel.lezcano@kernel.org>, tglx@kernel.org,
        zhipeng.wang_1@nxp.com
Cc: shawnguo@kernel.org, jstultz@google.com, linux-kernel@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20260327175533.3044-1-daniel.lezcano@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260327175533.3044-1-daniel.lezcano@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6c64f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=rp_PM-kNyIFFrorm6sQA:9
 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: DG0HP57rNoILlb0VltII3OPgKVtjUnEX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEyNSBTYWx0ZWRfXxBl/tt0Vzsq5
 2NULtRYZNyt0tVEyelQ8nr7eK1UV11uw9jdUt4yMDe89QWDm/oIb6R7EpQ9hp8YK11vc37x+oVS
 HzA3Ah3l/CgrWL9FsNrBRSLpEag0+L2JdmGjf4txbPiL+8oR/eruqNyOE55I7M04+v1Kleh6Jp7
 NSlRdoiqCbExvVr8PTqu1fP0K1RKRxcAjemNdM662SE1PiRBZ1IkFu/M3ZxzTOetkQXaf6t69o8
 lXf8lb4XgDemX5lOMSKs0PINYRjJypY7dqvFqotnHTSKEVJ2iP76lrmh1GSm1QOXY8gxnc38isQ
 oT7RyNII5aqQIUWs6EhHnnI0l4xsGvp7hN526f2EgWL3wZ+gEL6U7x18QG3sZHXqg2uQiWl1v6D
 pAHLRsI2/k61329daMDU3Inl0STwGRKaZSRZInzMFa/AvaqJCZZDse7fdSj1bTK9SdRB5vQweHo
 maSb9lHb1SYPWKb0ATg==
X-Proofpoint-ORIG-GUID: DG0HP57rNoILlb0VltII3OPgKVtjUnEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_110257_980982_EEAFF630 
X-CRM114-Status: UNSURE (   8.08  )
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

On 3/27/26 18:55, Daniel Lezcano wrote:
> Converting the timer driver modules requires a particular care
> because, depending on the platform, that may be not supported.

Sorry this series has been corrupted with a previous draft series.

I'll resend.

