Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F88EFCD70
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 09:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvNOJbFeM+aL7yxqK4J3Mnt9hg3UFgTdAbcvPH6KeV4=; b=4Hsw5gVniCREX75cihtLXV79E7
	1cJzO6h6TAj5lBHOqOo12rGNrBV98G6tzw34Hyqpvw1XLr5VwNfw8QG1PimCHGAdoFQ3hhhAieqyM
	apm40a8/adbnwJC42SikfxFvM8HodZ2lGhz0LO8Xe+S52S9yVv6Gwm75gmLJcGHryYEcjMI/DUMsO
	hh9Pz5IAIFOEPv3DYUjPqNbsxK9lBkwChsBvvKoxLnDUj0Ptzt7rggPN61edcOqg6BFFA8bmRGb3T
	s+nc95W0JZjirtdcJDf83xb+j69DdACOv9RRovRSm3RVVgemAGJiMYyNOj/Hei3DgBSjlZ7UQNfH9
	yp0QeMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX4r-00000006z7Y-27kC;
	Mon, 09 Mar 2026 09:39:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX4o-00000006z5f-3tdQ
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 09:39:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297tm1Z657703
	for <linux-mediatek@lists.infradead.org>; Mon, 9 Mar 2026 09:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FvNOJbFeM+aL7yxqK4J3Mnt9hg3UFgTdAbcvPH6KeV4=; b=CTXHV8yAFPcVejau
	NMbfyIFzsaNBaoSE6z3AWcaSUMk6/fggz8Uk7py9Sr5CeS2CILNRNEJxSLCxUU/l
	pVgaf68xLqNnfngNNCCAqLYXWctc23QlJphVwwxWN/JNZIzkNVdU2g3Iu6bBTNvH
	lrTyYpl3w3fsVHL2SWi2+KTppgmc88Th7+AIEihCECDOAOulTyyEHIpRoKh6uWJ/
	c1H5ufDY3nrSjEX6JL//3k/J/X7/jxa7Ekvlc0C+xvpGTRX1lT2d0lB5J4BUhYOp
	97Wh+ELyBrXWxZElYAOentEhysPmViV3RkldTGzJD5ed/LuRCkPFb/zolZbrBFcB
	GSWuAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crb14vxhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 09:39:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd900cd3a7so90263985a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 02:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049141; x=1773653941; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FvNOJbFeM+aL7yxqK4J3Mnt9hg3UFgTdAbcvPH6KeV4=;
        b=BQH4aL/C0Gdhexz6KQs1dkxkntt1kgDUVQdYgr1QGDbxw6y0KHkbVchcwzRHWOLBHL
         ocl+Z25iW1SfKsKqyMWbEhlyeCwUzDU18vwZQRKfG8RhEuxp2moxcFdovXOr8ikaQofa
         T8rLc1Mo6dJzUt7DhDTYaVKq0oqIwB67/GZdxSFU6ge3d4S7lNdIeOW+YuipOKsyTxL7
         5MFk6kuOdmGcCaCuu3zJcZsMgHVyuLvdnEuYHxNDa+3eZThiPvOLDLeTWLcRau21qn7N
         WenB4nFsM0+i4eV893RTDovcBaORiCzcxqGR10ldm6ICnaQIdFrvaS5TOXpMh7eSB1jN
         wzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049141; x=1773653941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvNOJbFeM+aL7yxqK4J3Mnt9hg3UFgTdAbcvPH6KeV4=;
        b=OLX7nBriPK9TaKrP6QM2HYT55hw/J0KJLYhRaf2ThzWcuQJBc/+3yUsI5qiYxq/iiH
         2eE8trAllK+vPO3em/RPMJZOsEjlgw1uwRfWFXmYxpp4VZjTJwxCvaIpzfdXexZ92A3Q
         sB8F3Snx32ZF3VzE7KMgKa5cS/M98XT6pvXKIkZaSbDiuRSS3b7yPC7zzZhnhReCmtRY
         zbThyf/ril0HzbLDS0ChS3C4V+d0SEkBYS+lzLOxj6QiqOaqVXRqS0H8wiwq3JSaw8v7
         /tLiTUjL5wej2OQiy3hYSfo52xWl80r2PH0d8PygwwrB0vEONhyYqTfO1l203qQeqkQc
         cEXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoNrp5uJOjMdTpy1+g5cqo4eoXYmEG/3CZgkq3bWKLjaM0YdFxea3n6lvoQdHcqGUDhHCfWSAjSzo5FwS/zw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/mp3XxN8Kz72HTIKaC5DuavdtK9wEWy+mKY/lQWXYjOkd9eeO
	BPs9hwjb386AEHrLvxYlz7TMIIecm8Lq/91OmzYwJ5/yCJki0u5uRmkGx8Le0c1TCIN/WOMULO+
	6XuW+Wmgp3mycOUTyB4Ly5/bNrV5NDn6ZB00NW4Hzb+sZxv6VkNU67LFznU1cUb/wzyh+vrqfHS
	s=
X-Gm-Gg: ATEYQzwE+QWD+t3Ki//rjQ4GZCBoTnFYa4xS9OYke4fpQHEVEMjL6iDsK/QONw+eXA8
	Ige7/WOIFphXMkKLI/CbJQfmJNtAhHOuty0gnwvS/CZi9ufaFrRdAoy3U5ZuOmi+BL0mQsHIXVd
	lvlvdYkhB5uDKGHDJbqHQ0Tjm8Fwf2pKk9ndCcvzF81tanW3UOHJDVSkWKzTVfTKoFZCeK4pWo9
	0BPqZ2tnoVByCWKdoEaWEovmlqrjpL/woOY29x2qe26wxk3ho6d78rtPbxIy5vvGqN8pxeEHyoW
	zjTSImZaOCcQy1ggLTL7ykUIOAO5UWxEBQiCY0TZMo1jQOK1TLO+s1uOhR9JEYRN6P2Y/3G2ZYq
	2EKRIILVDOhYIlJrNfGU7cHoszi5orn7NNPoNYRqHml2gFzvWAq5hlu8W+asjdRKMZOg6L7/Uuy
	b5Pwnwd6Ti
X-Received: by 2002:a05:620a:25c7:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cd6d3403b5mr1301714385a.3.1773049141143;
        Mon, 09 Mar 2026 02:39:01 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cd6d3403b5mr1301710885a.3.1773049140631;
        Mon, 09 Mar 2026 02:39:00 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48534fa65a6sm77570025e9.2.2026.03.09.02.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 02:38:59 -0700 (PDT)
Message-ID: <019942a0-e9f2-45f1-8e04-26ecc9822705@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 10:38:59 +0100
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
 <6255aa0f-529c-41cb-be32-e5d54a839125@oss.qualcomm.com>
 <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IYSKmGqa c=1 sm=1 tr=0 ts=69ae9535 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=l2TV3C2-n_0iOSrWiQ0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: fTdpshkohg7OR55V9C8kuyoG5MhkTo1w
X-Proofpoint-ORIG-GUID: fTdpshkohg7OR55V9C8kuyoG5MhkTo1w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4OSBTYWx0ZWRfX+TFWlBX7KCV2
 uJVHOTRqMVmtTxdyjpMYr5gWr/VjwXZkboVPwKSRc6mxFKo62vsKccgojHo0Fw04BtFdnvlXmgV
 zz45/mjQ/EfTV40yGlkzCe/BRyn3JVu88MEZE1LamwLewWLDEp4K1HEqsn1zJp7BWVF1KKzjqs3
 3FNrQxps2+rpkIgpqnPL7QCORbrKCEKh5nnQqEa3S9Llkc/MthA71fbnC5r5SUSQ1EjEuBIBG5U
 b4ILpQipN9jlfF80kBTS5yWjcyBe9gZNHGhThzUM0mA9a9rt8k4U+GtaqqMpiJzwxQaTL4CCPAP
 ftvRxd9GLvwp+K4IHtupg1nGnBT/bUfzK60km7yfpWqso+BLMMAYxRBBEVJOBcVGB4k9zW567+R
 P8sNwliqPatI9uhCxvvRb6vaMovlLEap4S2MuWFOFyWHw03azNfgKHjKLsTqfxb8jCP1rTlnKQ5
 4+z/eHpoPb3DXrT/U8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_023903_087460_DC030FF3 
X-CRM114-Status: GOOD (  15.04  )
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

On 3/9/26 06:31, Zhipeng Wang wrote:
> Hello Daniel,
> 
> I'd be very happy to collaborate on this!

Great, let me see if I can cook a patch in the next days

> My availability: I can dedicate time to work on this over the next few weeks. I'm happy to help with:
>     - Testing the new macros with IMX timer drivers
>     - Converting existing drivers as examples
>     - Reviewing and testing patches
>     - Documentation

That's awesome, thanks

> My understanding is that, based on your RFC, we should use two macros — TIMER_OF_DECLARE_PDEV and TIMER_OF_DECLARE_PLATFORM_DRIVER.

Yes, but also sort out the existing TIMER_OF_DECLARE macro vs MODULE in 
order to prevent #ifdef MODULE in the drivers

A side note, as Trilok commented:

  - you should not do top post. Keep inline comments with the previous 
emails so we can have the context.

  - trim the emails when possible. IOW remove text not related with the 
discussion

  - use text mode with the mailer, not html or whatever

  - for more information refer to Documentation/process/email-clients.rst

Thanks for your help

   -- Daniel




