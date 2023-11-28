Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76D6C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 10:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHT6MbAB16I8cUr3C51OtkBFFI3tsc0vSS6xJVk6WMs=; b=pJxyBe+wjqJYWdDrsbXwj7ytZZ
	Q3Lfn8CcX0xAcdUXViJ0eD34j/tt3TxosvUGZDSF8jrTCtxA2RAcdT4a44QwuAMB/aZiyek2ngz34
	GCENqtaiBdzWmZwUaM1bofxyZZRlRALFE/Hu7tIl8CSejZ1hilrJN4gOWTXW96BFR6tBCiTXJPYEh
	wKfP2nxcpEx21E/a5YHWhNuTX+KM8nVavMHSol7v1DCTATFcU27X3WS3yz0Inrs5TPJIAwWJlq+Kb
	PTnw5asamlypkeMlVzGdc5d7/eUVM3vud1MGbzWfECwIcDlXouF1kCbSLHlikDMn2bDfQets3cueI
	+e85NR7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7vDL-004qkC-2O;
	Tue, 28 Nov 2023 10:21:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7vDF-004qjB-1b;
	Tue, 28 Nov 2023 10:21:10 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EEAD16606F5E;
	Tue, 28 Nov 2023 10:20:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701166860;
	bh=54tD+0Tstg5j+b+ww3zATak7yvK6MgBTy7TZLjR9EQg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XLQhRroj4lwvhoB01HFE3noEy6wTtCG2wzTzBgATFEhAa8glnFAa0MpdeHrMwRPFF
	 lsP6riICCUjv53diP5ZWmieIMlunMG1zaBInMPuqcuTm2Se3LRwmwigjUDMrF4EQgE
	 VjxfBXeg4x0fwAxT0C7k3YpOcq9OMhhFRkio/6augFXbbBWepukZrsVrLZHPm4b1WB
	 oy9mJGlMoAsp2uY9mXkh0pMAh0QFx8wH9y2EI+hb/jL5TS1dTwHMZNlN49nuzYbtoq
	 GyJbMXaztuL99MOZ6yQV4AlMvwtF0hcDszY7KR0t4IHrZRJp/aVapZtAtO6Ayy8Rxn
	 XiHbs4I8xTUGg==
Message-ID: <36ba3f89-2bd0-45f0-8b61-59f5c6691427@collabora.com>
Date: Tue, 28 Nov 2023 11:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mmc: mediatek: extend number of tuning steps
Content-Language: en-US
To: =?UTF-8?B?QXhlIFlhbmcgKOadqOejiik=?= <Axe.Yang@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 =?UTF-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20231128070127.27442-1-axe.yang@mediatek.com>
 <20231128070127.27442-3-axe.yang@mediatek.com>
 <207c2f89-b1e7-448d-966f-0c403a9f9e8b@collabora.com>
 <ea1a82b07e98fa682140c460048901a9f962be2b.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ea1a82b07e98fa682140c460048901a9f962be2b.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_022105_877460_784BC605 
X-CRM114-Status: GOOD (  24.20  )
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

Il 28/11/23 10:38, Axe Yang (杨磊) ha scritto:
>> On Tue, 2023-11-28 at 09:53 +0100, AngeloGioacchino Del Regno wrote:
>> Il 28/11/23 08:01, Axe Yang ha scritto:
>>> Previously, during the MSDC calibration process, a full clock cycle
>>> actually not be covered, which in some cases didn't yield the best
>>> results and could cause CRC errors. This problem is particularly
>>> evident when MSDC is used as an SDIO host. In fact, MSDC support
>>> tuning up to a maximum of 64 steps, but by default, the step number
>>> is 32. By increase the tuning step, we are more likely to cover
>>> more
>>> parts of a clock cycle, and get better calibration result.
>>>
>>> To illustrate, when tuning 32 steps, if the obtained window has a
>>> hole
>>> near the middle, like this: 0xffc07ff (hex), then the selected
>>> delay
>>> will be the 6 (counting from right to left).
>>>
>>> (32 <- 1)
>>> 1111 1111 1100 0000 0000 0111 11(1)1 1111
>>>
>>> However, if we tune 64 steps, the window obtained may look like
>>> this:
>>> 0xfffffffffffc07ff. The final selected delay will be 44, which is
>>> safer as it is further away from the hole:
>>>
>>> (64 <- 1)
>>> 1111 ... (1)111 1111 1111 1111 1111 1100 0000 0000 0111 1111 1111
>>>
>>> In this case, delay 6 selected through 32 steps tuning is obviously
>>> not optimal, and this delay is closer to the hole, using it would
>>> easily cause CRC problems.
>>>
>>> You will need to configure property "mediatek,tuning-step" in MSDC
>>> dts node to 64 to extend the steps.
>>>
>>
>> If we can run 64 tuning steps, why should we run 32?
>>
>> Why isn't it just better to *always* run 64 tuning steps, on SoCs
>> supporting that?
>>
>> Thanks,
>> Angelo
> 
> Hi Angelo,
> 
> That is a good question. The benefit of preserving 32 steps tuning is
> that it can save time in certain scenarios.
> 
> On some platforms, when the delay selected through 64 steps tuning is
> very close to that chosen through 32 steps, we can reduce the tuning
> step from 64 to 32. This can save time sending the tuning block
> commands.
> 
> Thus using 32 steps tuning can save kernel boot up time.
> 
> Another case where time can be saved is when accessing the RPMB
> partition of eMMC. Each time switch to RPMB partition, there is a
> retune action, causing a certain drop in performance. If we are certain
> that the results of 32 steps tuning are usable and we use it, this can
> in a sense also guarantee performance when accessing the RPMB
> partition.
> 

Thanks for this explanation! Though, I have some more questions...

...regarding boot up time, how much time are we talking about?

I'm asking because while now I see - and agree - on using 32-steps tuning
on eMMC to guarantee performance during RPMB access, as far as I know,
there is no RPMB partition on SD/MicroSD cards (and, of course, SDIO devices).

If the boot performance impact isn't big, as in, up to ~100 milliseconds is
not big at all (especially with async probe!), we can definitely avoid the
addition of a devicetree property for 32-steps tuning, hence use a dynamic
selection strategy such that:
  - On eMMC devices, always perform 32-steps tuning (hence no boot delay)
  - On SD cards and SDIO, always perform 64-steps tuning

Cheers,
Angelo


