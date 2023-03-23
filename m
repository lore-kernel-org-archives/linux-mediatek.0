Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3110C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 10:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wiqhdnXIk/NcU6/Bf3sB3AeFGAs+Gfdj17owfU9DjgE=; b=qhlrEdoEi3qnLlzdcZk0+lmNnz
	s0jieT/UetTEC+9UdXQKrvOOovY6RKS6AK/Vl/qCVgUIV6SgvNfrH+Fb24C5CXW1Gn9OeW0dnU5Oe
	iO5FH0eD7gVCbTYgFsf6B7A1VQmKumjAvjunwSA+RiUQGsObWztaamf3YY0XTWF6iXrLUFcjcZzVB
	YImZbrkivLemf5B01gMkC1lcAz7Pk3Vps1P20VNA5WRg+v0Qil50KgLMFYuKOokmnzP18VNjBLwVC
	lJPQWX6v+gGaPT3AH910r2cV8a3k5VWFZTb5PZEpa16pQ3UPj+2Gw1DfmWTw+An900Aa+afDQWwzz
	cYnCx/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfIJF-001axs-35;
	Thu, 23 Mar 2023 10:36:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfIJB-001avU-1L;
	Thu, 23 Mar 2023 10:36:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7961B6600880;
	Thu, 23 Mar 2023 10:36:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679567795;
	bh=jIgvWhgm+9PSBUraP9OHdAeWySoS60VL5lcO1FVaiPE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZgAFdYU6N/IMlq31x3w8mwWPvHi+WpJRNzhP7yxXN0vyJ62hCLzwJKfrKgaGBlsw1
	 AuxjcEYNFgW8RxvPYBvVikeb1WB/iUWR4cz0Uf84/qfnpLjzMS0cU1FL9OEVX9Sn9g
	 cAR3jceK+HJUkOu240zcRAHFWFbSJQ+WDpcO43Nd/5lbqbnRW65o/IN2ckfYYaZaG2
	 HYmpkAfydxohZatq9HdVqQwKsKo7yKsOZ8CjA4Rq7HmXryG4Pi8iqzImACS9t6Vb3W
	 W9OEPEh1NVpxd3ohFqamstu2DKfX7KxmIrY8abPHOhM9WB2aQzTXYUgx4g/StTcCKf
	 yNemXg1Cq7gWw==
Message-ID: <e90dcc00-7685-befd-2a93-aed4ea8b1b2a@collabora.com>
Date: Thu, 23 Mar 2023 11:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 00/19] Enable GPU with DVFS support on MediaTek SoCs
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
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
X-CRM114-CacheID: sfid-20230323_033637_585672_19BCFC76 
X-CRM114-Status: GOOD (  11.37  )
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

Hello Matthias,

The Panfrost driver patches were just queued to drm-misc-next [1], can you please
pick this fully reviewed and fully tested series, so that we get them both to land
at the same time?

[1]: https://patchwork.kernel.org/comment/25265910/

Many thanks!
Angelo

