Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D578DC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 07:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Decr5ToKuusJ1vsOCi3GGboMucraQ2C0wQliP84kDVc=; b=d8torFKmNq0VlVsnr83MiaoHr2
	17oB915egLwgu/CHvyYf6lVZUM0fZZF2JejG+KU4Q6C68g66NxZh2UuL+TM8232BFZ5Z9uMOb7vG6
	UoZF9GEQGmAkckS6MobHaxhfY0V35JhftBqDQRySayu1h+AvfZE/9zMPjCTZaLQu5aSCjJisMIG7q
	904RBNsqOkHK3lcjLByee0PJs1jM9YgsJEXmbJFictOQ6+BDmqiFIZ3QeXVyFIoppneIs+Fxr2gIq
	Ppb21Cvj9wEkl0IGtEeS63uJUHCoCvO8gRhy62hCwbipqpHEnAbwdfMfy2ZYMgyaFTVfNtD88W8pZ
	BZDPFQGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GHc-00GRjI-13;
	Wed, 31 May 2023 07:30:12 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GHZ-00GRi6-26;
	Wed, 31 May 2023 07:30:10 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f3b5881734so6279891e87.0;
        Wed, 31 May 2023 00:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685518208; x=1688110208;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Decr5ToKuusJ1vsOCi3GGboMucraQ2C0wQliP84kDVc=;
        b=LtrOdGC7HJo1sApDCqRePuNWVdNNXV63xK9ISycJWamft6qwOtumOnVXflAwX6lFnm
         JFjZAFJAXNyROl4nqsslRIpjXzpR4QP+WimLl/3zJqsOleavMjoI7ckDRqwQ8+EaidzQ
         irPA70S61W0kkp8IawqhJKVGV0sJRPFbwZ7Pxsp/zAriJj4rMGl9nEUTaI+vK7wH6X6g
         D6VYR9U5CYk8QAjKGMceTvX3RgPBQJKOgQF/iFYkfRRGc3Lc1waidQhPwyyFwk3uP1jo
         Mlg7RgIeSYLwcbwdFs1mJJpCsWAngGw0iP9P2MWyxEDMIyfj6yie+FUMM9cu8US0pu6J
         LtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685518208; x=1688110208;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Decr5ToKuusJ1vsOCi3GGboMucraQ2C0wQliP84kDVc=;
        b=Wo/DsQBac8R2tNUUZU3lmXUQPCaWrcNme/wSBzmMDCFqVy564cMrNaD9wU2nVWaSz2
         YNZMUGq6u2YuDtIN2w23iQMjNineAsOCBI4m8QGLzoiJNz+yD/GNJZTGDhpRLitEZbP1
         SiP9DeJtpbDU7umQbyNeSAbXFx5lEw3HYulmEwawBTSeslaYxKicIbviIDrUDhj7t0ek
         I9v5sc/dupiOlf2ArZw64VmB6kLx2X72cq5PdA2uP3/7GE/nuBsD7ydOph+B/cP6wEVQ
         GNUYY0g84G4hToAVR2QE64rTyA5TJArepudnPAEqJNMLHdIdfv16sraZZg78irQTaVTL
         MeRw==
X-Gm-Message-State: AC+VfDx4h2gyOR1ycYf2y9xDQxFu6l2xwRdm6tQLbRkX6HL7f4dtZaZ2
	D8+2HYkT72TA7zs13rosEok=
X-Google-Smtp-Source: ACHHUZ6bUGgErD5qHlh8IDTMiiRSsiMsY0Sy2BjrFL/lJ52tDTu6aM/tYw+aZ3otauLHaaEkq7Ju9A==
X-Received: by 2002:ac2:5237:0:b0:4f3:982a:8be1 with SMTP id i23-20020ac25237000000b004f3982a8be1mr1891949lfl.69.1685518207312;
        Wed, 31 May 2023 00:30:07 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q1-20020a1ce901000000b003f423dfc686sm19446289wmc.45.2023.05.31.00.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 00:30:06 -0700 (PDT)
Message-ID: <90ad9b86-e03c-8e80-88d6-d514bbe9cacd@gmail.com>
Date: Wed, 31 May 2023 09:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: kukui: Add scp
 firmware-name
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230220093343.3447381-1-hsinyi@chromium.org>
 <CAGXv+5E4_k1jKTnninYkuT6Tf=skB00AowHpM+hc8j_VFM-RfQ@mail.gmail.com>
 <CAJMQK-hnK69iVJhqW_8UtKHHLQ3608Cb74Jk_b+xHH0BBu4yVw@mail.gmail.com>
 <d39b0e77-e013-fe7e-9523-9bdbaacb5853@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <d39b0e77-e013-fe7e-9523-9bdbaacb5853@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_003009_694483_1A08A7FA 
X-CRM114-Status: GOOD (  12.99  )
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



On 30/05/2023 09:12, AngeloGioacchino Del Regno wrote:
> Il 30/05/23 07:12, Hsin-Yi Wang ha scritto:
>> On Tue, Feb 21, 2023 at 11:25 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>>
>>> On Mon, Feb 20, 2023 at 5:34 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>>>
>>>> The upstream SCP firmware path is /lib/firmware/mediatek/mt8183/scp.img
>>>>
>>>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>>
>>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>> hi Matthias,
>>
>> Kindly ping on the patch, thanks!
> 
> Agreed. Matthias, please pick this one.
> 
> Hsin-Yi, can you also please send a version of this patch for stable?
> 

Applied thanks!

