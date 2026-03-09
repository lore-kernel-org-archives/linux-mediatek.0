Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D091CEF36E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 06:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hNZOwQq6HWTjuqn8FSE60/aQbj4nXzSVsV920Knhsw=; b=vkihkGTUQNJvHMv2lp7/wLvV8v
	RL8iO4isfVBKX3ChX6Ty4dsMGUSyr0ciRDQJu6Wjmf863TKoaktLpLuL6ofgPkZIaC6Mj17oMj3AV
	L1reYP8MwpaoL3lLxxx/OReczbAK6ea29c+Aaq6uzzPPSPtAOJS5b8o7jL/YiukYpzQ1lIsyeb97C
	g9pVvBdqmogicGOLsNnCElgXPOCmMkPsCxeVqKG60XQmYZa2nOwHgDqB5Q7V+3jWNmLCbmm7uGw3f
	65RcqFv4/3Zomdn+TCHSCOcEXhbIRZ7eqWWd8VO/BEW/Kd74lpPWUSV4ooZgTLIsqcM4oZXf8tktD
	TCVM8ZOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTsf-00000006iWG-33QB;
	Mon, 09 Mar 2026 06:14:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTsd-00000006iSy-1eZ3
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 06:14:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628Mnp0g2071120
	for <linux-mediatek@lists.infradead.org>; Mon, 9 Mar 2026 06:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hNZOwQq6HWTjuqn8FSE60/aQbj4nXzSVsV920Knhsw=; b=eGjPs5sFBB0wJ6N9
	Qgb1n6C3mddLAUoAXZrlJV0qXQrnkB+d0SHAagrC6QLxPTAP1jQ/L8fHNo1F25rJ
	vSn1evrEH5SrKxHXmXuZ22JqN9mgfAsTZHxLd+2nbprN9Ifh9NzywkLZ1PultdM9
	iML8k7chYMsEPaGMd6Hnwqq+mRRLGAhzOy/toU7/kwUSoeXVHnZ+gziC5wXNteUs
	2EXhuMEeYa8uuXAGsVbL+ALU6J9utuXXG6N/y963hsHaqmnA0Zm42ggr9z6UHd9r
	txpa4LgTECDzWEI2ngIwsAEbg/XQb2y5JYyYjNXaZsmBBw4dvH4v+iCyYWRC4Hmd
	NSiP/w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda9bxht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 06:14:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2be07cafe1cso23073328eec.0
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Mar 2026 23:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773036854; x=1773641654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6hNZOwQq6HWTjuqn8FSE60/aQbj4nXzSVsV920Knhsw=;
        b=WILKpBxVH75gRmLfckScmzfb/B09nwJS4pZAWFmh2P4ONDA3ioDsCYRar3aow5b9OT
         OKLISgAve+UzlUEwCsrpghos6qVTXRfAOvk3CQs6F/vZgi82ir3ZZPE693RhuD2MqxNE
         hc86CdCAZGmJm4x9LVimTfZh9fN6jkqo6VeRvUFk6VVhIkKmUt1tenmWsSaeuHHOYOuV
         UHfFLMWYGS2GnUBb/iEfed/wAwLJLOqBoC/+xzZ4wlyTIMSqrHPtUbm4uOw7HGfePh75
         0XMVRD8QWMgaB6GZ4t6E5ec8QvXaSFde8B8no5YEaeUODJVApVeLUNpCLZ0bgiNcxQoZ
         xiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773036854; x=1773641654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hNZOwQq6HWTjuqn8FSE60/aQbj4nXzSVsV920Knhsw=;
        b=sjm2oTkR4OzH4uPLEQxmFd/574CMC6AES3qL5N1QVGSF5/IaHvZ1V7d4rhLXLmBpfv
         Q4V/8WpTYA0PxzyYaB/2ngG3gFNnn8v0bJB/6ZoTcBx/2j1s1dVL7GkAXUFwG9ldNZCW
         N3jMQqjcbYVlTyFiz4plhrQK5HL/aONenuHKnrk3KhR+bojjvdRRL5r/KP+u0v5VWign
         zgzjYlf6ocdzRmr6igm394h9KZC0Zz85hV2TjvSzr+85kvug50+iP8A8UbMiFdUXiAEp
         wDherneL5NFpZR1bLikhFMZimMiulAM24ooIKm3IPd/jr3SGTlfPPjTzq6AWuTL3XUSt
         Fqzg==
X-Forwarded-Encrypted: i=1; AJvYcCVZOIpptlgY7CUFGvTSdE4XL2th1Fq89XMGFAGij5AXr14fkaQ6UL4iQkPjUPQ4u8gXv/4+mqGm/EgNnLalpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXb4ZSsD16KN9fakDW79fOMeqRjR2N9k17WfIOI4shnSMW3bKP
	LenA2XmIWIsBvnXjZR1FuKGNL7A2SwxECtZSXlslj8RlTJED7HDOPtVxLLdorXRhn63JJSHLrKy
	gnd6ZrmvWcsTiaLvoefZWyKEt71aXyhhe1CFZS6z9SgfU5FwdFMNpg3cyH0XPMACzESaeUTKY5+
	w=
X-Gm-Gg: ATEYQzxZXkV7fsrjPNj8ITYddHWJDxzEx5KIFTyqT4bvOENvlh9EPoPgFKTpzchkJGy
	EgyXtQ3f9eKquCtOPC3jVGls6zJ8hUaZpIP/sWTwanbSTOq+mzHNx1qBxUTs8OnNZ1Jb6mzJUeu
	VvB9wzVtgU6FN5w3b889Oa8nnDfOJRdvsH6TIO9T/m7JxwWiCHyYlN5L0C67gQV4fGneKBtO8RX
	4ZSPcMBfY6kI+LizxXblbpZ+KkIFDKqXgV0k7MAwb13iK5khIy/s8K1pHTiD6R2f3pny7LxubmF
	WKTS5dqFltzjG4PtheIYhsVUAKGREUEtJSeOaI9sbLhADbXk6sNHKWUTGNgVvUZi7TNuf4lxk4p
	bqao6SeX7wb3z/g5uaQVd1my5tb3fCbCas1dSTo3n1psU+8dIlvSZEzc=
X-Received: by 2002:a05:7300:aca6:b0:2bd:d3f3:b0be with SMTP id 5a478bee46e88-2be4e03ed55mr4097395eec.20.1773036853720;
        Sun, 08 Mar 2026 23:14:13 -0700 (PDT)
X-Received: by 2002:a05:7300:aca6:b0:2bd:d3f3:b0be with SMTP id 5a478bee46e88-2be4e03ed55mr4097377eec.20.1773036853215;
        Sun, 08 Mar 2026 23:14:13 -0700 (PDT)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f807a30sm7572370eec.6.2026.03.08.23.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:14:12 -0700 (PDT)
Message-ID: <f801cbc0-880f-4c36-ac71-a102d3a7ad73@oss.qualcomm.com>
Date: Sun, 8 Mar 2026 23:14:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
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
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA1NSBTYWx0ZWRfXzqIp3MMjwW7I
 2zy5tw1/E20QInRR6JOEID4x7cblVngkvrc4gm3jnC0r5qkOJAioHkZY7GnHx2aPIvAk/LDqzMo
 eU+vOFvUyHy7bAagyvzGls3CipsajS7As6rYkyXjYnCi/NnJcaIIj+NJEcwcjKi/txemCkWg51u
 QfqSf1h347PY624XZmmjoVr1ucRwMgGVoYW2YDFSyudsxh+q59FpTmsIHAjUEmEfGAnA6uPZcGi
 t4WkUKLT3QT/kzL97UaFSqMhfie8w8SYhVDRUWAt4+fvXPVAvdi5RG+wAFesyuj5Ar/i+hwOw/5
 LcxdeAmRXMER1NP9/FZkkJ6CLEv1uYfonlOsyc575KVkmCrSon7n1lij2k+QOHI70EwmDMSG+hm
 OgfBNmFXguynesUuxFBKHSJpEcjh3fNp+zNlY/95qch2TFCOo1CYzrbEr6+YeRT+gzdUlGpDnaP
 kk1+xmEkoFRX9IG+ehA==
X-Proofpoint-ORIG-GUID: tkZDTwHrYeXtEZBQOIdWHYpBKWDsPzBs
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69ae6536 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=_EeEMxcBAAAA:8 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=JfrnYn6hAAAA:8
 a=mpaa-ttXAAAA:8 a=1XWaLZrsAAAA:8 a=IpJZQVW2AAAA:8 a=rNfcLUUj_lrWDsM3rXQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=czjwGCTIUPoA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=ST-jHhOKWsTCqRlWije3:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=1CNFftbPRP8L7MoqJWF3:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: tkZDTwHrYeXtEZBQOIdWHYpBKWDsPzBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_231415_468350_DACE5764 
X-CRM114-Status: GOOD (  21.82  )
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

On 3/8/2026 10:31 PM, Zhipeng Wang wrote:
> Hello Daniel,
> 
> I'd be very happy to collaborate on this!
> 
> My availability: I can dedicate time to work on this over the next few weeks. I'm happy to help with:
>    - Testing the new macros with IMX timer drivers
>    - Converting existing drivers as examples
>    - Reviewing and testing patches
>    - Documentation
> 
> My understanding is that, based on your RFC, we should use two macros — TIMER_OF_DECLARE_PDEV and TIMER_OF_DECLARE_PLATFORM_DRIVER.
> 
> BRs,
> Zhipeng

Please don't top post and something is wrong w/ your email fonts. Please fix. 

>> -----Original Message-----
>> From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> Sent: 2026年3月9日 3:51
>> To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>> Cc: daniel.lezcano@linaro.org; tglx@kernel.org; shawnguo@kernel.org;
>> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
>> matthias.bgg@gmail.com; angelogioacchino.delregno@collabora.com;
>> linux-kernel@vger.kernel.org; imx@lists.linux.dev;
>> linux-arm-kernel@lists.infradead.org; linux-mediatek@lists.infradead.org;
>> chun-hung.wu@mediatek.com; walter.chang@mediatek.com;
>> jstultz@google.com; amergnat@baylibre.com; Aisheng Dong
>> <aisheng.dong@nxp.com>; Jindong Yue <jindong.yue@nxp.com>; Xuegang Liu
>> <xuegang.liu@nxp.com>; Greg Kroah-Hartman <gregkh@google.com>
>> Subject: Re: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
>> Convert timer-mediatek to a loadable module
>>
>> [You don't often get email from daniel.lezcano@oss.qualcomm.com. Learn
>> why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Caution: This is an external email. Please take care when clicking links or
>> opening attachments. When in doubt, report the message using the 'Report
>> this email' button
>>
>>
>> On 3/6/26 06:46, Zhipeng Wang wrote:
>>> Hi Daniel,
>>>
>>> Thank you for sharing your RFC patch. I think the approach is very
>>> interesting and addresses a real problem in the timer subsystem.
>>>
>>> For the MediaTek and IMX timer driver, I see a few considerations:
>>>
>>> 1. Current approach: My current patch uses the existing pattern
>>>     (similar to renesas-ostm.c) with #ifdef MODULE. It's simple and
>>>     works, but I agree it's not ideal.
>>> 2. Your approach: Your TIMER_OF_DECLARE_PDEV approach would be
>>>     cleaner and allow us to use devm_ functions, which would be a
>>>     nice improvement.
>>> 3. MediaTek and IMX timer specifics: The IMX timer doesn't require
>>>     early initialization on modern platforms (we have arch timers on
>>>     ARM64), so it would fit well with your
>> TIMER_OF_DECLARE_PLATFORM_DRIVER
>>>     macro (if you go with the two-macro approach).
>>>
>>> I'm very interested in your approach. May I ask what timeline you're
>>> considering for your patch series?
>>> The reason I ask is that we're working towards GKI support and I want
>>> to make sure I choose the right approach.
>>
>> Well, if you are willing to collaborate, we can start right now to think about it
>> and propose an unified solution
>>
>>
>>
>>
>>
> 


