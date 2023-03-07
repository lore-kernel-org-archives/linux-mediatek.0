Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACC4C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gocixD/0Ivo1c8mYU0dhnEbK0BoutsQPqjSzGamkGnk=; b=FgNzpDrcegUoRkBAzamEmWL8ej
	u9zJ1wClaYNowsDE8//sJHSNmhIoqPKld6M2K2HCkIlvyPiytItSOtycRadnz7dV+qA5IjDBunCcI
	D1zWXtOiSZtUiK4DNo+U0oScu/PPEm1im0P0yYZW80vKcP17lJI2aePGmqxJSaiORVTqwkYy7cle5
	HJkLBMRiQ6whdJs+v3ew6Uk0HJiAzkifVZ0cOPoEy4Hm31/AwwhSOzydZQkZAcvGAO7+mmYUe4OBY
	/H1iYXtXe8B4zogrXqf0cHIntC01C/TYmzK0IWQryal5g7bufpjF7x/NAcW+2fDVE4mP3XTCAHr36
	cVZJfgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTlG-00Gxks-Go; Tue, 07 Mar 2023 09:37:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTl2-00Gxg5-EM; Tue, 07 Mar 2023 09:37:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C39C6602FE5;
	Tue,  7 Mar 2023 09:37:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678181838;
	bh=OeykOkW8+/Iy30seH866GojCFZ7qr8owGJJxiI7/Wkc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XrR7KDyD6Nraz6gTIYm2cS67mhiONhfQmb3R8S7Te3eUoNyNQTpUpji8Ym0IH84I3
	 oJUk4xXckeFwQqexpD5MtXFrYbHugJbiMmVzdIHz3fwZK/sELHsj6YVWBL+kLTr0Tv
	 Ij0okU3h/h2/KDsPC6I36GRmCmxHTPl/I8ljysdlbmbwMuuMyHIz0UQIA3ccSTT5xr
	 HuLInCtlRJ5bcS3qOtCjnlht6bMAk6PH3jrp1rBvnRJMkd7mDBnSCktuvPoz+p5pNQ
	 lBJCxuhyQbYWe8Y8ewbDD47KFZNGsSbrezAeA9olmgr8QGf1q+/1a6cRtZM5PFMuLj
	 Kp4N+2YlprhXQ==
Message-ID: <81d9c330-9b8a-0fd6-149e-30c77629650a@collabora.com>
Date: Tue, 7 Mar 2023 10:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 00/19] Enable GPU with DVFS support on MediaTek SoCs
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
 <b4fc6bd8-e300-0f40-4216-8b99589c21cc@gmail.com>
 <895abaa2-5fd3-9928-4e53-86ce160fbad8@collabora.com>
 <CAGXv+5EPVhH-O+ZdoLeW4OZVcEtS824oracmu3jHTa8k-tEU0A@mail.gmail.com>
 <e5302c3e-f985-b020-5f8c-fba876768eaf@gmail.com>
 <CAGXv+5FR5unBbdp0MDZY1TtSMoTtxzi2F4tO=3qZsh=3b3Ru9w@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FR5unBbdp0MDZY1TtSMoTtxzi2F4tO=3qZsh=3b3Ru9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_013720_634075_9630704B 
X-CRM114-Status: GOOD (  15.95  )
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

Il 07/03/23 10:27, Chen-Yu Tsai ha scritto:
> On Thu, Mar 2, 2023 at 7:28 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>> On 02/03/2023 11:11, Chen-Yu Tsai wrote:
>>> On Thu, Mar 2, 2023 at 6:10 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Il 02/03/23 10:36, Matthias Brugger ha scritto:
>>>>> Series looks good but from my understanding has a dependency on:
>>>>> [PATCH v4 00/12] Panfrost: Improve and add MediaTek SoCs support
>>>>> (https://lore.kernel.org/linux-mediatek/20230228102610.707605-1-angelogioacchino.delregno@collabora.com/)
>>>>>
>>>>> Did I get that right?
>>>>>
>>>>
>>>> Yes you got it right - without the mentioned series, this one will do nothing
>>>> at all (and will also fail binding checks, as the bindings are introduced in
>>>> that other series).
>>>
>>> Please also let me test them on MT8183 and MT8186 before merging them.
>>>
>>
>> Of course, I'll wait for your tested-by tags then.
>> Thanks for testing!
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> on MT8183, MT8186, MT8192 and MT8195 Chromebooks.
> 
> BTW, Angelo, I see that Panfrost keeps the GPU regulator enabled, but
> the power domains, and thus the SRAM regulator, get powered off when
> the GPU is not in use. There doesn't seem to be any damaging effects,
> but I worry about idle power consumption.
> 
> ChenYu

Yes I've seen that as well... and it's true there will be some unwanted
small power leakage.

Though, I would propose to do things step by step. Right now, as it is, the
platform is fully stable... so let's get this in so that we estabilish a
known working baseline... what I have in mind is, exactly:

1. Get Panfrost+DVFS working on current platforms; then
2. Resolve the GPU binning situation (eFuses -> opp-supported-hw)
3. Improve the power consumption (all GPU regulators off during suspend)

Thanks for all the valuable testing and support!

Cheers,
Angelo

