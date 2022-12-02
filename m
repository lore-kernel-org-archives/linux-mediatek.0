Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E0BC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fy77QwyeFC9NGVYfR61oam3ElHvTBWWQ9cZrOGPBDtU=; b=X9WqfMjDNJ7LV7
	ohXnO3/Q81bNxcLSIYAJ0Phw6DXPl8AHT2jS0uRO42XQs5eRdLvjqXqQEFbH8v2707xi+lVSZWx4T
	xvmaei66vB/V5SyslHHNtzhiOCqorC5stIqM118IQ7e9rmiuJiSpYP8UZkGl21cGHMUh7oLyIGJG5
	J3O5gwWeC/fthDVv7VDNU2xkWV3z8DpGPxvHz5lvl1kE7m6etNJ1HUoduZDMEHyERHKjrjCG8xq0u
	avnodEZ36qm6AQ8ngNKUUU4Ur2BN7+od+QGNw8XwAzHtjbc+orhq9uvD44khLc4SuDhUAxFMT6eZO
	nKX7E11Dbbd8+f6te2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12DS-00EsJS-Tm; Fri, 02 Dec 2022 09:20:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12DG-00EsCB-3N; Fri, 02 Dec 2022 09:20:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F7DC6602BB8;
	Fri,  2 Dec 2022 09:20:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669972802;
	bh=WsnwT6RMOoj+xc9Gp4IEpzEBUTanWc1prySPc8HuK6E=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=dEBPz/hn/fyvVtgwd3/q4Ub8zC0o8CPcW2O4z2nqGWK6gPTT8Qbv/IBzO9jEMVdR0
	 T2McSzLvYSqCwSUTE0J5bsLnFtxag4MJBlOAFg1c9TpSgw+aPe3E8rhk7gEu7LFSuI
	 6Ws3tQXtqGV2Kmefm3bqfCvIzhznUV/M/QOKgtb3MNg1mB+oHcwNLlBcDRumHI9VPf
	 9W6M2NCyeZJGg7nWp/zcRU7rhMqkwne9dNMyuh+kJQ4GRvYElXMUVXhgDRmsW4Lvz0
	 aL0bsjMjRO46SxQqiFJ0gwSWUHgNEUYdV6iuWYFLM1mrHzdyUH6wAhdTHPjxp90QT7
	 EDW6rpxPnc40g==
Message-ID: <c76bd301-0e8d-2d2b-0d3e-a57ece9b496f@collabora.com>
Date: Fri, 2 Dec 2022 10:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622)
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
 <eb142a22-b35e-ec3f-ee0a-9e3e7b24cea6@gmail.com>
 <bf8d2a8f-7654-29be-1104-a842c6657b5e@systemli.org>
 <02c2c955-940b-b315-0474-85d0eddad7a3@leemhuis.info>
 <Y4jHvomTrU8guBox@makrotopia.org>
 <47a4665e-333d-a6e7-a2da-96cb06c2d87b@leemhuis.info>
 <20221202052716.uj3kzkunazmgazeq@vireshk-i7>
 <0ebef1a2-6b5a-04b9-a79b-79eb3349c32b@collabora.com>
In-Reply-To: <0ebef1a2-6b5a-04b9-a79b-79eb3349c32b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_012006_339843_AFD8541C 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, linux-pm@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?Q?H=c3=bchn=2c_Thomas?= <thomas.huehn@hs-nordhausen.de>, jia-wei.chang@mediatek.com, linux-arm-kernel@lists.infradead.org, Nick <vincent@systemli.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/12/22 09:57, AngeloGioacchino Del Regno ha scritto:
> Il 02/12/22 06:27, Viresh Kumar ha scritto:
>> On 01-12-22, 16:39, Thorsten Leemhuis wrote:
>>> Thx for clarifying. And I noticed I made a mistake: I should have
>>> directed my earlier question wrt to any progress here more into the
>>> direction of Jia-Wei Chang (who authored 6a17b3876b) and Viresh Kumar
>>> (who committed it).
>>
>> I was waiting for the platform maintainers to come up with a fix. I
>> have sent a patch now to revert this, in-reply-to this thread.
>>
>> Please confirm this is working fine. Thanks.
>>
> 
> Can you guys try this patch that I've sent a while ago?
> 
> https://lore.kernel.org/lkml/20220909093724.40078-1-angelogioacchino.delregno@collabora.com/T/#u
> 
> There were comments on it, but if that solves your issue I can push a v2
> to solve what was reported.
> 
> Regards,
> Angelo

Wait, sorry, I've re-read the stacktrace and that won't help at all.
MediaTek, can you please look at this issue?

Reverting the proposed commit will make MT8183 unstable.



