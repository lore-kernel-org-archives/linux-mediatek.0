Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57952C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UY5iuEzddJy7Jsu/1PTiy8KE7WoMJiAayKTBsEV99c=; b=YqAoe+ziW3OB2sBsWthD2Ooz8H
	yWSM1NPYlSSN2wW5cRYIEI/2uGwy/2XGop79PvU+Lx2cUoX1ZLyhAZuMURoFcCrO/3LOfXH0xjz+p
	1zgdVoAd4ph0JC5t+yPPgSAG54wPFjMwyQfXuqDwL9Uf6l3fKl0i9D3Q/Bqwu96blzsAYYZxg7z/0
	HqOLuBvTBiOxPSmL+dbOnHcZtyUJiHTviGdvujM4ksNz4d8z8SbP26A62xWtENWnUaQnyD0GaFp2j
	P3mXFLE8/2N19ZmCuEM9muodo4p5AFVaXxD4Slhz4/ZxjJrYxLxMboFiLQdu/IIyK1nWntuJrw9Qw
	/y3WsOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWma-000AlH-7l; Tue, 07 Mar 2023 12:51:08 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWmP-000Agw-4l
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 12:50:58 +0000
Received: by mail-ed1-x52f.google.com with SMTP id u9so51874912edd.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 04:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678193451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9UY5iuEzddJy7Jsu/1PTiy8KE7WoMJiAayKTBsEV99c=;
        b=b+bXytXwVgLrHVTUhYHA/o+BOCnksL/g7Qxp00rpVB1PeDBaCfpzd08Bu1xy8G7A1F
         A5tQULIHCYSWRP7w/6qrYje6Xt2oJE9VzIoHyqJsd5YmRUS2x6BJijVkcrPT/ZCsQ5xt
         kcb4VD2uNVgef8W8eEvXtjno/rfagdBix+CDNWXYsx9JtTOazq6Of2kulJgHHCbwyoA3
         Bcj1FWl3oWamfjtxLohEkZ6rw1/97UX4I1qwPL2jHqVguB8cYuQ+PHKlkSX6oD+nBuqx
         TDVp5xOKCwaC/6gFNglgJgO7efCGio1+ldQ3NvUYPfeyJ+z+0hsMwyUpKXOnSTQWVF6S
         mQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678193451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9UY5iuEzddJy7Jsu/1PTiy8KE7WoMJiAayKTBsEV99c=;
        b=dhq9QwZ5pykb37pD4eFfcuwkStOhKavpcIQlisGmqhQYNdZ2QU2k0AzBp9PAWNyYPE
         /VQO0C82u+Ytwh6stuqS7cl+J07dyyaSfaBMt1Kii6cBPDKoOMI/gz9CHeR1xP02quZj
         9REGlhXbQQrAaIxemjNYq4aLLp+15KPUGOWOqaYE1Z5Yarb+8c7dyZtK9x4bCJIvUhjg
         WamLLZBKQi1nolWKkma4H//cih/9uBdqRo+qhRnBl1SxlCzfsYIxyDbgH4xvVNk+B3sX
         scvV/2tKK6y7WoLN4Dzv4wczgsSuOhtWqzgUfqHcvavc4yInXGPsLzy/KfEUD2Tr72x8
         czPw==
X-Gm-Message-State: AO0yUKVROfklPdIajbanCLIZX+rzjzvdUEa4x+nYnCt5OXc1phq4zHpl
	ceuy0h9aPoOJQl5K4jFY8SbP8g==
X-Google-Smtp-Source: AK7set+pdgHLGptuoirUA/qeW3eypJ8kze1cqV+VkXp/vY5g9ijFcb6atsoRCHygwl7vA0Nuj441XA==
X-Received: by 2002:aa7:c1c4:0:b0:4c5:bc48:d422 with SMTP id d4-20020aa7c1c4000000b004c5bc48d422mr11627825edp.7.1678193450993;
        Tue, 07 Mar 2023 04:50:50 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:a60f:e604:c252:1f3d? ([2a02:810d:15c0:828:a60f:e604:c252:1f3d])
        by smtp.gmail.com with ESMTPSA id n24-20020a509358000000b004af5001c7ecsm6666266eda.12.2023.03.07.04.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 04:50:50 -0800 (PST)
Message-ID: <caf54c57-f9a0-b434-8973-6734851153ff@linaro.org>
Date: Tue, 7 Mar 2023 13:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] dt-bindings: display: mediatek: clean unnecessary item
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@gmail.com>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230306-ccorr-binding-fix-v4-0-117daea88efb@baylibre.com>
 <25019fb1-87f7-b863-48e8-a164d0e08265@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <25019fb1-87f7-b863-48e8-a164d0e08265@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_045057_222214_D375C662 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

On 07/03/2023 11:17, AngeloGioacchino Del Regno wrote:
> Il 07/03/23 11:07, Alexandre Mergnat ha scritto:
>> The item which have the mediatek,mt8192-disp-ccorr as const compatible
>> already exist above. Merge all compatibles which have the same fallback
>> under the same item.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> 
> Alexandre, the Acked-by tag from Krzysztof goes *after* your S-o-b :-)

b4 puts them like this and there is even rationale from Konstantin about
it. Anyway, it's not submitters job to correct b4. Our tools should
implement the process, not us (the users), thus if the result is
incorrect, then the tool should be fixed. Not the user.

Best regards,
Krzysztof


