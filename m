Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 13:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WEqmEFfEDeaLB8w/uKSuNUKQSAQLRTEJZN4DMcLEQY=; b=d/P9z4m2cdZZLR
	wJKOLBqApwxNEyTwKSyocdpyZbx2TvHhTXfQxlD9zJSFNpZtjiFkEGV4swKuGtaD9AJGS4L23Kk94
	gPt0tiLwugsDXCxgckEBy9jIHqwpRWxjQq1VnUxcvqN/5RnHRz/JqGzhKEnNk3So8n81WrS1gXoTa
	QVFVNwWvM3itgB8JoNizWwJv5Wty2Ikfx+IvzDJHTPwacXrXL+UJIB1UfOWw0dr6UrCkilfK09+GV
	bAWBmnUhW+XNPTMgS3AdPsMOZKVVBLGTDkmL3ir4C1CJg7sNA3MB1HnkpUfF8ozWLoxI7BEnD+Fkx
	wWKXVtjfTcdr7bdiCTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt81V-004NAb-Dm; Mon, 23 May 2022 13:23:01 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt81H-004N6q-1s; Mon, 23 May 2022 13:22:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D4B671F4332B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653312162;
 bh=zJBx/meEVKgnjWI/EklM+94hyPmWSwELMNThgJm6lUg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BunFdwU73dubqPSW7rx74D895hMJcTYcd6qN8jpL/C2L2dkGSbvdf7x1JTB+M0ZKe
 0Wxhc3HjHNPcNjomBvWRqZ7e7teC1cQKdJgXMhRZ4N4+dW2dMmF2k/cYamAYO5joX6
 aTDmvnpDZoJGSyHPSbOYqJbDcFklr4mjrfsMzCjU2pauq31X6Fsp9NcI0oZm1k7C5U
 NlJjXVTJkRO2QDEn2rurR3ku95M4Tcuz1Adurp5tjqooSo9L4bFwvRd+zFEQbMSGgJ
 POT/pN634OKMiDfAnFoeuHMOo58bQ3Zh6JpNy5hpvkU0p/U2/XVVhK1ES06H3myDzO
 7coEpax5GyFfw==
Message-ID: <a6606891-d55f-dbce-7c5a-86390694e1c4@collabora.com>
Date: Mon, 23 May 2022 15:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/4] regulator: Add driver for MT6331 PMIC regulators
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220520133305.265310-1-angelogioacchino.delregno@collabora.com>
 <20220520133305.265310-3-angelogioacchino.delregno@collabora.com>
 <YoepiTUfdhkYByo7@sirena.org.uk>
 <6cc68be9-e509-eae4-801d-997fdc01dcf2@collabora.com>
 <YouFcSapkVC7ZfuP@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YouFcSapkVC7ZfuP@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_062247_360140_A81F391A 
X-CRM114-Status: GOOD (  29.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/05/22 15:00, Mark Brown ha scritto:
> On Mon, May 23, 2022 at 02:49:19PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 20/05/22 16:45, Mark Brown ha scritto:
>>> On Fri, May 20, 2022 at 03:33:03PM +0200, AngeloGioacchino Del Regno wrote:
> 
>>>> +static const unsigned int ldo_volt_table10[] = {
>>>> +	1200000, 1300000, 1500000, 1800000,
>>>> +	1200000, 1300000, 1500000, 1800000,
>>>> +	1200000, 1300000, 1500000, 1800000,
>>>> +	1200000, 1300000, 1500000, 1800000,
>>>> +};
> 
>>> So the top bits of the voltate selection field just get ignored?  Might
>>> be easier to just write the code to not include the top bits.
>>>
> 
>> No, they're all valid values for real... but I guess that I can simplify
>> this voltage table by simply modifying the bitmask that we use for the
>> regulators that are using this table....
> 
> Right, my point here is that it looks awfully like the documentation
> (this came from documentation I guess?) is including some extra bits
> that get ignored in the voltage selection field here.  That seems like a
> weird choice somewhere along the line.
> 

I wish I had a datasheet for these parts...

All of this comes from analyzing a running device on the downstream 3.4 kernel
and on understanding the (not really readable) downstream kernel code...
..but yes, I agree on the fact that this seems to be a weird choice.

Ah, besides, I hooked up an oscilloscope to the VCAM_IO and I can see that the
vreg really does react as expected upon setting the upper bits.. but since it
still works without, we can safely ignore them, which makes us able to simplify
the driver (as no custom code for that will be required) and, at the same time,
avoid seeing a table of values repeated 4 times in a row.

>>>> +	if (info->qi > 0) {
>>>> +		reg = info->desc.enable_reg;
>>>> +		en_mask = info->qi;
> 
>>> If the regulator doesn't have status readback it shouldn't provide a
>>> get_status() operation.
> 
>> What I've understood is that when there's no "QI" flag, the enable register
>> will provide the regulator status (EN/DIS) acting like QI, that's why I've
>> added that if branch...
> 
>> Anyway, I'll recheck this part before sending the next version!
> 
> That would be fairly unusual, often a regulator won't even detect when
> it's gone out of regulation.

Actually, there *is* support for this kind of detection... luckily the registers
and masks/bits are all dumped in a "upmu_hw.h" header downstream, regardless of
whether they're used or not in the code, so at least there's that reference to
look at... and I can see that there are bits to manage the overcurrent protection
(OVP) and configurable (OCPLVL) overcurrent protection (OCP_EN / OC_EN)...

...so, the regulator will indeed shut itself off and clear either/both the QI_EN
and/or its relative bit in the enable register... I've also just found hints of
the latter (enable register being set to 0) downstream, so I'm sure that this is
indeed right.

And finally... I would really like to test the OCP/OVP features to write some
code managing that, but I'm using a production smartphone (a Xperia M5, like
mentioned in the cover letter) for research and testing and you surely understand
that it's not time yet to take this risk... I will, later - but I have to finish
the upstreaming of this SoC and platform before chasing the green smoke... :-)



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
