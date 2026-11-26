Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC88E606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gngDbEO6;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z0zHOKBc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PnlEO0P5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B7T1/nVBEREpJdJWj80b/dnoP++w319PyP5R6m3DFZ0=; b=gngDbEO6Fe7pKZ
	BIO9pXCD7cxQr3z84gq70ol+pJnIyBkpcQo+aPSZIMkDvptewyYBp2oE6lp8vwHxssAJ/IUZzDG28
	LX93yPYvQYYQBgCFyyTbRi6TVe5VLqPUI0eW8WzZ2PdEC2eGtQE2yf96ZRzhF/UVyY+LHw5Bj9YLJ
	TYd6OJ+gh5SSePvry6y2qP9wgXZcuxsR34zfJZpq+TqIrICt7uySDpxEF2bo1i+rzmvX0AhQVd3Yh
	VjlPCOkYC1bGy0RGKPP9LXVlUfEPh1K5b1OFqkbgnguN5wECk702cjnvJe+Jz5ZNBn3C2J02B9vov
	OsDHwKIWMXOWSXoInSTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMwO-0000000BcGE-1IZx;
	Thu, 26 Nov 2026 00:02:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMwK-0000000BcFU-3ycN
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 00:02:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJB7Z61794585
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 00:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7T1/nVBEREpJdJWj80b/dnoP++w319PyP5R6m3DFZ0=; b=Z0zHOKBch2c98mCk
	Je3/utDj/6DWW7Y3mEh4ebKMbUBAnaavE6sDooW2+yKA9WF4MLvDCNrrxnZpGZUk
	OCOaCafv5XyyspMKsT2+53w09NWBrzc9Wa7YzSJm52FS05FF+OD/hFs7oJNTkaDG
	8ETlQnfH3znOYTrfL9ahHEdaL7TThnxZAtX6v8llGz4LG8Q4WsNR9KZXYcbRwUrs
	vB7TlXCf0fbJaXsGW7H1GBXdsux12YnT+wl5THZqRhAtzz38m/508b+RnFdSVX1a
	tJrlYI7Jc4D3yK8XuQ9C9zj5x6CBZU+3cVCC22dgAtIBr8wiMR9diMZCi5OJ3Xb9
	Ulfrcw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnu61d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 00:02:15 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecb636b587so1084853e0c.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 16:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795651335; x=1796256135; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7T1/nVBEREpJdJWj80b/dnoP++w319PyP5R6m3DFZ0=;
        b=PnlEO0P5Hv3uvBpR7GbWg0jTGyJZ8PS1OA3pwVowxBK3oazSZ9BSaIRDuVZYYKcpO1
         rLCfIYlbMMGeB19BVkx+NjGNLA28ssLEZI6Pnrzx0XRoZsOUVfBUJm5B/cxSmxpwIKK8
         3JJllS94/4PXUH/6hegTciELPU/pRA/26Q6l7wNComT2Frz1SMuSBwoZwVwl4L7jTlka
         r4MWlcOy7dyKo6moVBV7Lm85g76o2f2xZJQnnCLXyMxOnqRgJUa0cyzuaXvsaN5hyplR
         CqtmsG6dYol7RHSW7ER5gABVSUPPj6+RiET5WSpYmpOuM/5IDLI3X/HKGjp6cUK4fjdv
         INcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795651335; x=1796256135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7T1/nVBEREpJdJWj80b/dnoP++w319PyP5R6m3DFZ0=;
        b=khAfCwK0YFBvEXfd/Kh0Y2MfK3Qax8tWfYhabLjyO5TUkiL4yl87MlmW8GWBrjeiQ1
         YBBZp4XTsVA6RXEUjPSuDTGUT7dWV5b/seFF3HxOrKVrPGV/o+owyKaiDqr+4ELhCRId
         M34TqFE/Ec90WrJxGn1y86wvF7Nb5jh7PSVv1wTdzMm4i0yB4iWcoqFcFWr++gghy8mn
         Q8BRxSRsLg6LpBfJwNXW6c+CCsa5ScBpzwftu21lWVDYb4/zwe6y96WTMxTeXb/5fdSL
         tjtmcK6jkat9drPopb/TgsJMg/C8oYTwqHyEJdRIM0IPLudCTtsF4/AGRMHO+iahHQoe
         aJlA==
X-Forwarded-Encrypted: i=1; AL+hErFFdWW/GGg3kOuypwstYH7L1IWfYua4QQW76QLVM7w6DrPir0WdBgIGFhAvNUAXjubnCxB7K/Y2NgAQf5Hzaw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9xjpXNQOfcTRQdsWjljpFtlc2Sn+uDLUmerqQE9SRQ7LwEm8wb
	tdvuE62cg7IOiXG9FivTi/1r851s3CzrHgfkKw2X4NghQGtoMqEc91z8clyusqaqLitUCITKhjZ
	+1ECjMEyfGvtnTbnabTXJiXoaS7jeE5vL/3A628F9Xgi/RqFpmP25eZm4Fc4PvoamnyViCtdkmJ
	s=
X-Gm-Gg: AZFdTZf38Kr+xYWQoRzQDrnSqFN70WSTKnq5Z5VMAsk8IOm9jIMWSXp+oJfvuu/s0qW
	nAEu+g76Z+rdNDc2O6XZorAeevJokRGDGSjZy48Ohuv11RKcs3Vk39MI027WgbuUlYvaCycl22R
	VEt+KH7yOh7SjwqpKPGzRjhiHDnXicXiEE9GDYqcQ76BuLnAWO/ep3l/7e0s6O9xwAFNqqfeGbs
	oGGmDfKW23n0hjVwK08dALHX6g7eziCI0aD1e0FnUatuD8SRFoC5Un7kc9LA6750uxmrtIiCs/p
	lFwSr08QzgLwM8QYnbsuXOPyb5aEDas6pZ3BbRyeSmor/bRdqcoeedv8OcpvNnC82k7Rx99LaQ2
	7w0AftywrOP0K0+LU5PkNGCqQsnh0AgQa7z6hIelN4exsRrcqW/pNbTkHDYGMn/Ms1OzMt8ufxY
	A2K1RmqKQKYT3Vf/mLTFptJH8X0Gza5LvR2ac=
X-Received: by 2002:a05:6122:e44b:b0:5ec:b4ec:e93f with SMTP id 71dfb90a1353d-5ee8aef5b41mr10335486e0c.10.1795651334947;
        Wed, 25 Nov 2026 16:02:14 -0800 (PST)
X-Received: by 2002:a05:6122:e44b:b0:5ec:b4ec:e93f with SMTP id 71dfb90a1353d-5ee8aef5b41mr10334927e0c.10.1795651330438;
        Wed, 25 Nov 2026 16:02:10 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:f3bd:f67e:d6c3:ff0a? ([2a05:6e02:1041:c10:f3bd:f67e:d6c3:ff0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm761206815e9.13.2026.11.25.16.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 16:02:09 -0800 (PST)
Message-ID: <1e12ac6a-eb73-4f54-8a79-8da13d6c1638@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 01:02:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] clocksource/drivers/timer-mediatek: Enable the GPT
 irq before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA5NSBTYWx0ZWRfX7CsVFDrpYmnu
 +33T3R23dAluaKdEy6/lyTqpJsMoSfnRONtgLvbZBfptcTJARR2FOLGenrH8xs4lNK8rFH2DKCM
 M71ssT2L5EyzvhXM2J9Oy0TCgbrsLhw5rVxv3/Q6J1VWm46VCJyEUdWOm6di+kdKMaYAJuzBkne
 FBBq6jfaxHLtVzTWkBGopnlw95Gl+N+GqlUQiZacpj30Gc+1w4AREBLWBJwO3a/y9UTLeEzOKMj
 +9/YWHX4yRmzjmc2hBqbiyMpPdH5KzZfKgt9f7eJDwvemdls6USYno2hD+aTyDHbTP4YDhuhZDL
 xZyVV5ydkjjp2tQCxMWbvs9fcYqZox+L0dTd/kdTenm8AKf9ZCWXZ8aD786e37aFnsl5IFUncFK
 Qvf65c5mx2yvl+14eN8yVenLCa4u6cdZXv3Ekadl0o6fRoAZgLPOgRYrY1B3skYLRfaoRYepNbv
 KLgYkZxP4szKFS+HgjA==
X-Proofpoint-ORIG-GUID: wV7ddo6Z_qO51aCxQ_Emp0dHOzz6kQil
X-Proofpoint-GUID: wV7ddo6Z_qO51aCxQ_Emp0dHOzz6kQil
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA5NSBTYWx0ZWRfX0lTVpPpieo4i
 6ee4mGlWuLSr7C9ZvQNCGFRsVVX6ZngS6F4PkBBTCGxooclamgJvdYH3bORUVXJjmK/dw2sjelf
 uHZMN2bzdBEBKhRf1ziaXzm/xnRd0g0=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b077707 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=Ll55pq3paLvcCbb_psMA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1011
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_160217_137845_6DC9A5FA 
X-CRM114-Status: GOOD (  33.74  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/26/26 00:22, Ryan Brue wrote:
> Since the driver probes as a platform device, the GPT clock event is
> registered late in boot, when PSCI CPU idle may already have put CPUs
> into a state that stops their local timer. Those CPUs wait in the
> oneshot broadcast mask on the hrtimer broadcast, and
> tick_install_broadcast_device() arms the new broadcast device to expire
> at once so that it wakes them.
> 
> mtk_gpt_init() sets the timer's bit in GPT_IRQ_EN only after
> clockevents_config_and_register(). The forced event fires while the bit
> is clear, nothing is latched in the status register, and the waiting
> CPUs are never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle
> state in use, this hung the boot in 20 of 40 boots, and in none of 16
> with this change.
> 
> Enable the interrupt before registering the clock event. The IRQ line
> stays disabled until enable_irq(), so the handler still can't run before
> the clock event is set up.

Please have a look at:

https://sashiko.dev/#/patchset/20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4%40gmail.com

> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
> Reviewed-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com> # on mt8167
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org> # on Hana (Telesu)
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
> Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
> MT8173 with PSCI CPU idle the boot then hangs about half the time: the
> broadcast device is armed at once to wake CPUs that are already idle,
> and that event is lost because the GPT's interrupt is enabled only after
> registration. Traced on the board with prints in
> tick_install_broadcast_device() and mtk_gpt_init().
> 
> This is a resend of the 11-03 patch with the review and test tags from
> its thread folded in. The code is unchanged, and it still applies to
> v7.4-rc4 and tip timers/urgent. As a 7.4-rc1 regression, it would be
> good to have it in 7.4.
> 
> This patch was developed with the help of an LLM coding assistant.
> ---
> Changes in RESEND:
> - Collected Reviewed-by and Tested-by tags from v1; no code change.
> - Cc Daniel's oss.qualcomm.com address and Chen-Yu.
> - Link to v1: https://lore.kernel.org/r/20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com
> ---
>   drivers/clocksource/timer-mediatek.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 842d6ee4259e..1b2cbcc2795a 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -339,10 +339,10 @@ static int mtk_gpt_init(struct platform_device *pdev)
>   
>   	/* Configure clock event */
>   	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
> +	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>   	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
>   					TIMER_SYNC_TICKS, 0xffffffff);
>   
> -	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>   	enable_irq(timer_of_irq(&to));
>   
>   	return 0;
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84
> 
> Best regards,


