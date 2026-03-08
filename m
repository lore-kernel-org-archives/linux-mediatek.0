Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A6EEA8541
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Mar 2026 19:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79xZZRDxRUZmFN/ScsbUTEulHr8w+sHYp39DIi5RtUo=; b=n78hElWosViLepQgWWLRGx/Qna
	nMNlEavZlsgjg+LdixKqts9Snf+spEoF/N28/75MO3pe5syk52KKBzP3+Dk5UQMTAaIptN1qsIgbj
	yk8+lMytrovrLAO3uF9nKQ+bKIFMZa97vgVymJdNfYbkMQdPsLICk0tafxo4gAtSIr7zNBVxcx+cT
	40LroYxmZ+8dGQJEGWp5AswNm9eUz5QJ2RWtrp/9TRHTHK9bqSwD/Bm4RZ7iXAUHQ/ZDcOT90B2WU
	y+5QJi1vzEQOJ+oO39dSP/zsZXHCcyZhbI9P0rBqHP5w6cSUF9tiaCFjBcwljHTF2bpUEH5BsFwKO
	Lb3sJ7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzK9i-00000006JUr-0U6L;
	Sun, 08 Mar 2026 19:51:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzK9g-00000006JU4-32Tu
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Mar 2026 19:51:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628DCYwC3902539
	for <linux-mediatek@lists.infradead.org>; Sun, 8 Mar 2026 19:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79xZZRDxRUZmFN/ScsbUTEulHr8w+sHYp39DIi5RtUo=; b=gGzXN73SQvs9FalS
	5KHr0PqdqzUzJ8UyLuRhVKQ18n0bt6Kqq03IGZqJaTSdIQAMYWXtfYcd1q5l1yLa
	BdQ7GeASgfJkEWOdXh9/tgldplLFayMonH5DaTwIMJEkFbYd7xpLps2eicjjx46g
	UD5PAobnm+Nj/6d9YDeMi19ehQd5ASxuOQmCaz+xEpT6GGMRW5DeYJ0NA+EPJ5Tw
	mQ9QhRYcYIxA9hQrf4M8Fkz7asTANQPfXt0aCqiSE1w8aYnJ21oyTD7cvJIiiU/f
	LpGDQrneMLU/8xmTVQ0VBi+2O7+Q96Zgf0m9JM4FRtFX93haPO/HYOq4Bg1mvbfD
	vQ3qCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcse2xrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 08 Mar 2026 19:51:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd39bso972723285a.2
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Mar 2026 12:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772999470; x=1773604270; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79xZZRDxRUZmFN/ScsbUTEulHr8w+sHYp39DIi5RtUo=;
        b=hJSpsFjO20tpQ0aUsXlKU/8eXtr4SQVOHSwN+vz5rm3xAWPcArLAT4A66rRb1QXTrC
         iIaXK89p9iUh8LtlEdZbrrWDjypw3gfq08uvPG50UBl/djwoEKA58vRWoAr0VYGl0VXz
         buFq90SazZSb81tHn4md4rle/6zRJlXbkD8LrjIcxJniE93WODMlwaApm9q9wmQp53gc
         DLmRjeIS5812dsK/ocHumBbmOkPp2xMN80EBY27xqHj7V2N1OFW7E54xOe/h7YlJdEU7
         f/now7I6pDWmmbMSAavY1LUKzfa3HXmap+xi8evqA3P+FzysfZsW2/ji6m1UwtmiWxOh
         GQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772999470; x=1773604270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79xZZRDxRUZmFN/ScsbUTEulHr8w+sHYp39DIi5RtUo=;
        b=nmEIjN1VPy82lsAOVkCrSoPhdekDn5i7xyOEQoovRGqyQAqh0mNpG8u/gS9C/ryZxZ
         MeAkiUWWr16SVqJu2ICSpjlqfAKDCEcgoiai+3wCaHm3JazfqLnlh34ARwyrjxh3C7Ge
         ctbcrIvsIEprEAmNzft1puFxjVmCe1djw6+zIWGPpsFfYC1IE9ht9LXV9hdMPnjjldTT
         cDhaydAsx+Y43krGnzy79u+1UzUa+LyD1oA6k619gnPAzLJ9zUTEtjhXxdapUfsrMGaY
         lDcDR5D2hyDHIoHgThODl34RbHM8Y/GT+kdnQjUtwb7z4FKWDk0JGuLtgGR0G64/ki1G
         BLyg==
X-Forwarded-Encrypted: i=1; AJvYcCXVzdDKvXXtXBrSeclNpQd2siW9Tvvd6GlBgyO2+wlqr2Bogp+6j7hkWO4YYFU6ihGWZLwlo5zYabVpRi+BtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ/8f02jZuV3S3/60DF6HhlaldMaDvd7aKdDaKmFF8XCZsPVi5
	ZO3LEQf586qBDSbddqvM5F+dc5OFs91crTAyhBdmaOq6pcaGWm7+Chp4zA5T60sAaguLB29Q33A
	PubkAKaa0jgxiv/YEtpQOdn5nT94aUJFQs713u+5260/w9q3cT8hnxcCgpJCVWnQrqG1xv5l/9O
	k=
X-Gm-Gg: ATEYQzzS221W/K5UyFpPtwVtEGuqDCd0qY7cOVGKCKFkM4JtWSUykWMsOp1lZKfNVWg
	6T3WxXhxQHrFyJ4iULA9xd7i4/XUlliw/haEAOL235aNvxUIOMsGmWLIt1IuPJCj2IeWmxulGg6
	MYCwbMBdxLBbfPaP032Ze3kGPN8RhD++3q5N9RizO0MAqPBkEaM8nXRf8UAy16nFF04x4ospEPC
	jCbHz8jUZfYyWLcCx+8Gxc2Xj14dW/88bYCRAM8vI7gKB41Fi1IJ058F3nwxA4+YbFaL6Asx+PC
	/PTllLOdsol0wZJQ67UsOMRCH4g7Wvj2YhWWhZMTzacWxQWb6mr0WOspcBTGThZuguTFVf7TeG1
	2JyBw9HuRzFRiPYWFfQmycibyAZZjQix4YS6YKHq/mFlO+K/RF7A2kb0dapYIFjqeMiFkgb18AT
	omnqL9ZK5n
X-Received: by 2002:a05:620a:4723:b0:8ca:1240:4992 with SMTP id af79cd13be357-8cd6d4f9cbbmr1241002085a.47.1772999470065;
        Sun, 08 Mar 2026 12:51:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4723:b0:8ca:1240:4992 with SMTP id af79cd13be357-8cd6d4f9cbbmr1240998585a.47.1772999469498;
        Sun, 08 Mar 2026 12:51:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48536b5b3absm21039905e9.32.2026.03.08.12.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 12:51:08 -0700 (PDT)
Message-ID: <6255aa0f-529c-41cb-be32-e5d54a839125@oss.qualcomm.com>
Date: Sun, 8 Mar 2026 20:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "tglx@kernel.org" <tglx@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
        "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
        "walter.chang@mediatek.com" <walter.chang@mediatek.com>,
        "jstultz@google.com" <jstultz@google.com>,
        "amergnat@baylibre.com" <amergnat@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>, Jindong Yue <jindong.yue@nxp.com>,
        Xuegang Liu <xuegang.liu@nxp.com>,
        Greg Kroah-Hartman <gregkh@google.com>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
 <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
 <aaiByowtXrTxPsd7@mai.linaro.org>
 <AS8PR04MB84206CF559371D3966653F8EEB7AA@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <AS8PR04MB84206CF559371D3966653F8EEB7AA@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IdqKmGqa c=1 sm=1 tr=0 ts=69add32f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=upsBVkoUhz0hqrFZ6ZoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Q1fCST-kJXyINSE5POgY1qVl4KfVZH63
X-Proofpoint-ORIG-GUID: Q1fCST-kJXyINSE5POgY1qVl4KfVZH63
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE4MiBTYWx0ZWRfX5rtMiK8zWj27
 biqOXCvDcscQTIQn/IuXxLlltTAQyFsq47FPDoGZcxWWANxWcOu6CekH5bniYjwbxVgRZE5t9cq
 qsEGLBEP5NKQ6Z+fODbv54yP1CyqJjsYReVJQfE0FCBw1MnNj2uYSGa0gtRN4S5LJDa5jXfY8jb
 pet87YJdy9feM1Rv2vPEsczTJba0z035yhfUlb8kINHSNgbzvPMiDxnwJVCa9M48kuXG5v19I3w
 e3vDFndhooDXadRzD74whcrKj2vCAeUhHVPfOwqsmDMrWbASA8ryE2OBfKu9lqzVUG89Ek/3KGh
 OEXQZSYSahmFPgItlPdJVdScjIQiFfH0hSQ3s2t5oLun1PZfkNe00VyPx3ugkTXWrqfa+m+aRX0
 LULLJqoOvi8dTFnyBa4RsFlUHqlFjhkcmbtO0Mg9qKxYRWVIaejme3eX8FohAkbLEpg8CoW49tG
 EompELPJI7cMGJUje6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_125112_780968_90F1725E 
X-CRM114-Status: GOOD (  18.56  )
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

On 3/6/26 06:46, Zhipeng Wang wrote:
> Hi Daniel,
> 
> Thank you for sharing your RFC patch. I think the approach is very
> interesting and addresses a real problem in the timer subsystem.
> 
> For the MediaTek and IMX timer driver, I see a few considerations:
> 
> 1. Current approach: My current patch uses the existing pattern
>     (similar to renesas-ostm.c) with #ifdef MODULE. It's simple and
>     works, but I agree it's not ideal.
> 2. Your approach: Your TIMER_OF_DECLARE_PDEV approach would be
>     cleaner and allow us to use devm_ functions, which would be a
>     nice improvement.
> 3. MediaTek and IMX timer specifics: The IMX timer doesn't require
>     early initialization on modern platforms (we have arch timers on
>     ARM64), so it would fit well with your TIMER_OF_DECLARE_PLATFORM_DRIVER
>     macro (if you go with the two-macro approach).
> 
> I'm very interested in your approach. May I ask what timeline you're
> considering for your patch series?
> The reason I ask is that we're working towards GKI support and I want
> to make sure I choose the right approach.

Well, if you are willing to collaborate, we can start right now to think 
about it and propose an unified solution







