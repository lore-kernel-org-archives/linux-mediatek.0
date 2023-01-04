Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B0AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 15:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LAyhJX1Cl37/BFFzszBPa5ox90zGFTnC9Clfn15zlc=; b=C7R0Qo7Cf92ZEHSqzbjRNCG+uy
	T6SfD1NRk2ke/UyytzNe8l0Uo3pFk47HqA5hfge7/cyT3S3kJ7Qrr3Yyn5HAbgWlHrWfn/bjWzYL1
	ySgVZxWQap9CLYfWQLvovv5/UUsVhJF2vjjgZ+eptnyWcrpPB28ChWLGqJfngrli0ggXOJBXnUwYZ
	n/Fi8tG167DIwkw63VLXA/Rrdv8irl2RqpeS0zPQu2P0h63nm4PWMQzK40oI2aftvIRbFCH21iKpx
	WfpKk+kMVNbY9DaVxO+84iq54ozj5bfNOO70UX+RZt/zIf1+T5yF+o2/n+bUiprlAm43mQe7Ik9xa
	hlnhD+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5MZ-009xl9-7p; Wed, 04 Jan 2023 15:07:31 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD4Ru-009aaz-CT; Wed, 04 Jan 2023 14:09:01 +0000
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pD4Rp-00044n-Do; Wed, 04 Jan 2023 15:08:53 +0100
Message-ID: <5db65fd1-575f-df19-0de3-b3e32e4bf1d1@leemhuis.info>
Date: Wed, 4 Jan 2023 15:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] spi: mediatek: Enable irq before the spi registration
Content-Language: en-US, de-DE
To: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221225-mtk-spi-fixes-v1-0-bb6c14c232f8@chromium.org>
 <167214860344.446872.17166503994226712534.b4-ty@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <167214860344.446872.17166503994226712534.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672841338;0ef048a6;
X-HE-SMSGID: 1pD4Rp-00044n-Do
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_060858_729322_EBBE02CC 
X-CRM114-Status: GOOD (  16.31  )
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

Hi Mark!

On 27.12.22 14:43, Mark Brown wrote:
> On Sun, 25 Dec 2022 09:37:12 +0100, Ricardo Ribalda wrote:
>> If the irq is enabled after the spi si registered, there can be a race
>> with the initialization of the devices on the spi bus.
>>
>> Eg:
>> mtk-spi 1100a000.spi: spi-mem transfer timeout
>> spi-nor: probe of spi0.0 failed with error -110
>> Unable to handle kernel NULL pointer dereference at virtual address
>> 0000000000000010
>> ...
>> Call trace:
>>  mtk_spi_can_dma+0x0/0x2c
>>
>> [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> 
> Thanks!
> 
> [1/1] spi: mediatek: Enable irq before the spi registration
>       commit: b24cded8c065d7cef8690b2c7b82b828cce57708
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> [...]

Quick question: why did you queue this for the next merge window? This
change *afaics* is fixing a reported regression (a kernel oops)
introduced this cycle:
https://lore.kernel.org/lkml/Y6dL2ZWgd1BD6kew@makrotopia.org/

Or have I missed or confused something?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot poke

