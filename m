Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF09EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0poZR46t5M9EYcvMy/s7k+sVqB/SifJ1QmZ8ZsQhhk=; b=L37DaIu3+K2r77
	LedjJIKW52Ql+SfuKuy8U+Pz2/gFSaJgqfKlgurhCUFVhLM7VaEx511zWPzP2n0LAtSeX1NAQUqxu
	An2fNIfjYhuQVAzHPqX8mb9WVwMlVQAKsKxXI5ibquC72kUkY8bX9G6/E6fA1xYAe9KlDSWddtqqq
	pyDYVzFY/Uh9nXc3UKl/MWY4mOlahdGP3p/pYrkoRjRYYZW8Bg+Aq/to3gtXyufXZINTcdK8RxjPQ
	x6Gr2TJiS+1L1qNgBir+9qo8WGOpW1jsxJROxEJ1GhpPpHBLYeB1FXDPYCvHuswosdYuQZaDAigk5
	5sYhyyhyGo/zNgN9Cd/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrICQ-001goB-Vp; Wed, 18 May 2022 11:50:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrIC9-001gei-1o; Wed, 18 May 2022 11:50:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B6EBA1F44EFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652874623;
 bh=v9BT4jY0LXkbBKEpNBl7A0GnoXGTuIN7ai0ivp4fxo0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MDHUAkFFlwdwoLrZiH6kWeRTcdEKGTPyapZ/YpbtlbTBTDYChw2zzczD8UNhaGaXX
 c7ib5AqOU0w8q3zOjUiMSs1FtnDJpFtXZqk+d/3X8SHH6FzLuptdxWC2LtFmXzQlFI
 2C3TbheXt2uFZTm7lhfp4QUqCYNFaOeDzqGhKqzhE3qunw3CiKJ+Rz4YmaSd8R3s9Y
 gdvFBxVuBF2pQ7HdfWLPJgKH5r5u6oOfUbEqConajhIkeVbJagLiATav4M1jQm4kQe
 Q3y5bhqwImy2ZiDVFg+OGnJUi5ZKo4Tz5ysJ9tSuRqOiW+t9V310+qCe36wgzVgC49
 0gfZZDVLNP39w==
Message-ID: <73f6ab7c-635e-1ff3-2d48-492c256ffcc9@collabora.com>
Date: Wed, 18 May 2022 13:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: mtk-clocks: Set #clock-cells as
 required property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 sboyd@kernel.org, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220518093631.25491-1-angelogioacchino.delregno@collabora.com>
 <20220518093631.25491-3-angelogioacchino.delregno@collabora.com>
 <81dcc83b-7ef0-779e-ad2b-8d0722b48ba4@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <81dcc83b-7ef0-779e-ad2b-8d0722b48ba4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_045025_267336_9B350229 
X-CRM114-Status: GOOD (  10.10  )
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

Il 18/05/22 13:46, Krzysztof Kozlowski ha scritto:
> On 18/05/2022 11:36, AngeloGioacchino Del Regno wrote:
>> This is a clock-controller binding, so it needs #clock-cells, or
>> it would be of no use: add that to the list of required properties.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> These I considered as somehow fixes so I did not ask to remove the Fixes
> tag, so also not squashing. It's fine, though...
> 

I'm sorry Krzysztof, for some reason I was sure that your comments were applicable
on the entire series...

I'll pay more attention next time, and eventually I'll make one more question
when/if needed. I take your last comment as "leave this series as it is", so
I will not send a v3.

Regards,
Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
