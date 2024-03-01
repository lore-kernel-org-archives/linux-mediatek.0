Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62720C5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 08:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chn6jp6BcjbKPL39LInzeT7Y9r+0lWaUhuV2yYjxgp0=; b=Tn5C1aWeVzSH+PGTGPsU015jVI
	xP8Ij4kgCa5Yw4xG+hvwnshWV6IKXw3EKG/bGcHRJtb5PduKFvp7tug5Q8rm5w0QgV7TRASmnUHws
	u7BH8t59O4L3kXNQNBzrIaqNfikqXOATzznWa59eOVQNtYGDXHmJ2Senm2py19DSVHsG4QLlwQGwR
	NNEcedumVQMjPcP4UlmmKbvJkgf2pnCiyMfW1qPv3M7Vr3LQPTEwpiQkNHiQ6X9I5ZuPtcJP8pAsc
	xVW2/68LWV3zZlQrNKO7Jnu745JUp+LAIYjG8rX6tKfH1bDLWhuWk7yYTCI7svbo7SDNNqtER+0bc
	w6qXCS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyd7-0000000H0Iq-0IwW;
	Fri, 01 Mar 2024 08:52:33 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyd3-0000000H0H6-1b0v;
	Fri, 01 Mar 2024 08:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709283148;
	bh=CoA/3xdsDd4t5ac8pY/l+2uKa5imLpXNOKYGL42GD1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2eLU34MPpen1ZPVUW41Vx70RazzxeE1NBcPieddH4Krxxgv3kzhQQh3oawbOOGizh
	 Na8mptoha3JHdsZaeIPwWm+h3V4UbLvjOVbt7x8PXCF4MC1RbwdpPuBE2m45McZYXc
	 RFaPHyMfY9pA8B6g5UFuZvKdevNvf5sLuVmE0ZQFF/v4NBPZv/5vK2ceUsVX1SNUcC
	 oCqN6onOsmLhmC9kLw+8Kg9JFu30n36+bl2NPtcq05mrl2Mqqf1WibDkR4/N/kbljE
	 PBjWZiSi1i6wk7u7j0UR5u3q3tWgGtBRfEW87GqEofuJTsNqIMF641LzuRglfq9lOz
	 oaRaRM0D9F/dg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5D5013782017;
	Fri,  1 Mar 2024 08:52:27 +0000 (UTC)
Message-ID: <0ef31c6f-86f1-4824-a7d0-a1d8798b6647@collabora.com>
Date: Fri, 1 Mar 2024 09:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: cherry: Describe CPU
 supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240110142305.755367-1-nfraprado@collabora.com>
 <20240110142305.755367-2-nfraprado@collabora.com>
 <e325a4d4-0df7-499c-9d55-7da093b744ea@collabora.com>
 <8a45151a-1d51-4001-b0f9-9cfb0027232a@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8a45151a-1d51-4001-b0f9-9cfb0027232a@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_005229_575463_0D210A14 
X-CRM114-Status: GOOD (  12.02  )
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

Il 29/02/24 21:23, Nícolas F. R. A. Prado ha scritto:
> On Wed, Jan 10, 2024 at 03:32:02PM +0100, AngeloGioacchino Del Regno wrote:
>> Il 10/01/24 15:23, Nícolas F. R. A. Prado ha scritto:
>>> Describe in each CPU node the regulator supplying it.
>>>
>>> Fixes: 260c04d425eb ("arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus")
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Hello,
> 
> looks like this patch was never picked up, while the cpufreq part has been
> merged for a while, so I'm still getting the mentioned hangs on linux-next.
> Could this be queued? :)
> 
> Thanks,
> Nícolas

Will send that on the next -fixes round.

Thanks for the reminder.

