Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54059D31A26
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 08:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdiAvhIBSkRBz7twMnAqXfiNrByqG73RL/D6sMKeEGU=; b=ocX3H2vp3D79cITYWIbXiTFhyG
	nROLufwjaEkItp3k+pAeXjZZZYmkdc4fvEFBMtEpJy7tJYiE2Tyi++W2ImyYZH9XPMeQDNqSVacZz
	7aoupujoCcJwnJWcdmR/QlSOUIaDUw0ybsA+khdfWqxjRYfmMLAnsvjhBqUQvi/AToqa+YN4t8NIL
	Md8Ri5Klrrk/Jz8FPIY2oGxsIKSsGCTGG1ATZuKgFLB5oMTrMg7srxTFoz3MJz4R/3ST0MEOn9VaL
	FHCL9JYs93r+q7+m78Yhq1lrtL4x0yOF9X1VwcgXr+bpI1KspoQCT+HZSly916RqImxpIL9/3ah/r
	5LwT14Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfw3s-00000008IVA-3Q0O;
	Wed, 14 Jan 2026 08:17:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfw3q-00000008ITf-05ZR
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Jan 2026 08:17:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so46179255e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 00:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768378620; x=1768983420; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rdiAvhIBSkRBz7twMnAqXfiNrByqG73RL/D6sMKeEGU=;
        b=jO29s82qyuhuATqj0iTHL96SuxHPpHmVl4kWO79Z5SWRAnUdMKgCBHLwdu7F98uMwV
         kjr8Tapzgkl+NLHarrf+0H6Vj7YoaDboWywgat5C6ZOe7hXA82vrJ8WIuRYfB6JNb7tu
         r6bdgm4Dkcp3vGH1T52e1pCyS+yoc5AZvabeUHtGBj8J3+y0uHLJ7XEn5nb+SeW8E/Rg
         YsXSe+GFL/Xlfr+dQbI3b881irepxlx0JbRY7UcixK3SOG3wENPjmkVFaZXzWYEQHX4d
         JxzFPWxAJNS/TZgaM4lTMoMepB/VauvazMjSUznJ8vRo8bVmw28Opr+sZj7pFoMtaDCy
         Dtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768378620; x=1768983420;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdiAvhIBSkRBz7twMnAqXfiNrByqG73RL/D6sMKeEGU=;
        b=ItN8/l1tL0xDodrsKHsjnRPAMOcdNUlljLtz9gEeuBRJbcS/7IPsW7XicnE5btAy87
         UCdOLi7TlgHfY3FWEgwaErdaSrK7vgB/2xaDsXCQ0ADemeCDU8R2s2X2AJ56ur8pj91g
         KSDpOjgHUot30Wixkky7Z5r0KTO6ghFDmZXuBwWr3Mc1CaxRc7cjxsw3FDDo8xB8PcKP
         55TcwWImcL6WSrvB/q1GjAyT24NzV4X0dsNXZr5952MLrdXPCNtQJdbGrc+mJepXQn6X
         Gg1zS5p/9VhUXmiMxBLDA1lHrDJx4Q3WqhX0YePZ7X+IB/Wn7Vcg/+3IStwROkK44BSX
         pqPA==
X-Forwarded-Encrypted: i=1; AJvYcCX1K9e3ifLAYQpbh2S4L66LeRn3HE3Rj5s5kGujF0fR9dqQrMcrczeOSkQ6eOzu4B7HF8aFApgrQI/xoTK2kA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0X3z/mHxpdn9gqGtjlHsSvUl+/C5fD50rT+udyf8SYrRzjewg
	jH/DxD4pDoCbZ0PntuYCrnq8ff9kRaDz4RpBpltIpr4u5KwI9TX5AcvC
X-Gm-Gg: AY/fxX536Ju3sen2EpWtObKqOnTHXGomuiA2yqfPkNPKTaznV3x/UuIJ+itLW1X/47S
	n7XgFj/JFYeG7q4TSWeSzEtFXn8gkvdntlKQ1KzCOgY9Pk8jcZIMTrD/u4YehseQWfV5LGjR366
	ClBGn9cSBXXijXCBR+IcrhTecUCXX6GTXRE03xZk4K98I4zSHeihI12lQo9gfy5SrmcCONm9Za4
	ssuS1g102FQXCSgCATHFiyjuAlf0PP7Su91OlArEz58gIPO/ioJ29a5KPVynADMqCT2G/3p7non
	RkO7Xj4ol463kdAHfGFEFTr37z90YO6u5fdNPohvnLBphjBj/vxyl9AWHumNJg9ibZPWhBYRJ0P
	5qWLACXgcXAvAjMw29x1NVf9AD/uvL3Q6Xi6EmDGLzaK+rCHB1L0TjoBD9oxWfdRu3s8DZXGaKN
	iaTEZF3NuX3a/vhIfYW5i9xYwB75to4aCqBnPaUyNdTtgnwGzCAJU1N1LeHiLDAt2yQcA=
X-Received: by 2002:a05:600c:c0d0:b0:47e:e78a:c831 with SMTP id 5b1f17b1804b1-47ee78ac9e2mr3070835e9.36.1768378620011;
        Wed, 14 Jan 2026 00:17:00 -0800 (PST)
Received: from [192.168.1.27] (84.121.134.198.dyn.user.ono.com. [84.121.134.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee578d37esm15572945e9.1.2026.01.14.00.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 00:16:59 -0800 (PST)
Message-ID: <0eb5086c-39f1-4cf3-aa71-440036930052@gmail.com>
Date: Wed, 14 Jan 2026 09:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: mediatek,mt7622-pciesys: Remove
 syscon compatible
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 ulf.hansson@linaro.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 kernel@collabora.com
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
 <20260113110012.36984-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20260113110012.36984-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_001702_079897_B3CF798E 
X-CRM114-Status: GOOD (  13.35  )
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

On 13/1/26 12:00, AngeloGioacchino Del Regno wrote:
> The PCIESYS register space contains a pure clock controller, which
> has no system controller register, so this definitely doesn't need
> any "syscon" compatible.
> 
> As a side note, luckily no devicetree ever added the syscon string
> to PCIESYS clock controller node compatibles, so this also resolves
> a dtbs_check warning for mt7622.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../bindings/clock/mediatek,mt7622-pciesys.yaml        | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
> index 9c3913f9092c..c77111d10f90 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
> @@ -14,11 +14,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - items:
> -          - const: mediatek,mt7622-pciesys
> -          - const: syscon
> -      - const: mediatek,mt7629-pciesys
> +    enum:
> +      - mediatek,mt7622-pciesys
> +      - mediatek,mt7629-pciesys
>   
>     reg:
>       maxItems: 1
> @@ -40,7 +38,7 @@ additionalProperties: false
>   examples:
>     - |
>       clock-controller@1a100800 {
> -        compatible = "mediatek,mt7622-pciesys", "syscon";
> +        compatible = "mediatek,mt7622-pciesys";
>           reg = <0x1a100800 0x1000>;
>           #clock-cells = <1>;
>           #reset-cells = <1>;


