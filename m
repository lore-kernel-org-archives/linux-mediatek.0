Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEECC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 07:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYR4NfV8b6uyYjkuS4ioBsPmvXID6qlbvYaMpLrsWeo=; b=g1zgq55+2oxqaqLQVoy8iJalhl
	NJeE+iDJQLMSly6QTrg63sP0RDmrB4X2FYFqmT7xYzWvcXcVGyGL2cKBanZBDfVDEaFVq6/zSVl2/
	7/9WOjCFyPcZFU+W/XdM2XqaS3jAfcj5zDoSp6dYFPNIe/outD3NRlCA5zmKLRsmlMlWlCmXizDzn
	Qvh8texCq8OGe5KkKtd37od/dxi1nowXgBMi1F2wOMncEunwpM+LWnccYwnDBf7E6BZec6I0VhGjw
	BlKT5nb5rebuPNUR7kKPlZw8pvsqwNZKjvk+Fa3bVsRhsLiCWg82MVslzUVT0gWjaAkf1I6tb6cgg
	et/fVAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofFel-004KvZ-24; Mon, 03 Oct 2022 07:14:27 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofFei-004KuF-R1
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 07:14:26 +0000
Received: by mail-lj1-x22d.google.com with SMTP id l14so680876lja.8
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Oct 2022 00:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wYR4NfV8b6uyYjkuS4ioBsPmvXID6qlbvYaMpLrsWeo=;
        b=M5IEXsDyin6ySOcRWawZaJmNk+565XVGaj7rLmvlyBrXacUxV643XlZ7s41y2KgMDK
         5+/fS2rtB0F0eeiAOwBQ1wGhm52uJXweQzs5cbyQjf22hWmMA5V50a4Z/Z63SlsNGtQR
         4pPk0k4Dazr+sk0255eBtOMxj1K7aK5cRSdUhO1KVn0vxMfBlAO73AF0buE1vrfQXmUN
         5sEsw7/Zdehoj6BucczvV0RUn6kyEmAjz//wvT5nWVYl9GP0XKoN/XDu577O0IXGFeKx
         YrhJzyc97g2sFikC++1pwf7xhu6ilH/VdfrJRjY5SjvA/yxOrWbwA4VMj7cIYmzfl+Km
         JIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wYR4NfV8b6uyYjkuS4ioBsPmvXID6qlbvYaMpLrsWeo=;
        b=Qcy62145V4B3WRorGUJ6t2rhj5fxJaE9mDHRvPdpDLFKVjke+kXfmlaKahkxf7rToL
         n8ajygXnY3mfL+EfO2cSjS2TvogvQdE+l0RhPvRIbVR91ndkqLbDox3jzzpWgSDWG2th
         xdH+Lj0LqsJKtqbBMh8fEonQDEkOmQgOxZN49bb09FQDW/JGmhbAte+Gv/RYAouSwm48
         lSXvqSpHD6Re3DrXSvQlKXw84GCBTSEe42pUG0pQ7hTKTsH1qtXWv2/WV9lV9FNFmRNZ
         4c3Jl4/axkvF2a4YzbNyilEhsOMhgFYTMgR4oslx8J4id+oC6io+C/StG0aF43QfxyDH
         iNow==
X-Gm-Message-State: ACrzQf1KNCjb4LrxN1A54JinK9M5EfDDPkMidbTMzOW9cYwWB+ozPlF3
	N2zwBqcwpvr1CY07wfWxiX1V1Q==
X-Google-Smtp-Source: AMsMyM4hqeB1DIMt8vJl2VZ3nxsQtjBqiz9YIXnZZtgsKSq91gR1uL9j7f2Z9PlVU83e5X+CYjtz/Q==
X-Received: by 2002:a2e:8e62:0:b0:26d:e470:3973 with SMTP id t2-20020a2e8e62000000b0026de4703973mr209145ljk.71.1664781262835;
        Mon, 03 Oct 2022 00:14:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k16-20020a05651210d000b0049468f9e697sm1334586lfg.236.2022.10.03.00.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 00:14:22 -0700 (PDT)
Message-ID: <fe399fb3-a8b1-14d4-3460-4c4ef36a0dc6@linaro.org>
Date: Mon, 3 Oct 2022 09:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] dt-bindings: mfd: mt6370: fix the interrupt order of the
 charger in the example
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, matthias.bgg@gmail.com,
 sre@kernel.org
Cc: chiaen_wu@richtek.com, cy_huang@richtek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cc89d749eba56c5f2489d1707f7711733561b757.1664792418.git.chiaen_wu@richtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cc89d749eba56c5f2489d1707f7711733561b757.1664792418.git.chiaen_wu@richtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_001424_904520_2D4B54BB 
X-CRM114-Status: GOOD (  10.55  )
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

On 03/10/2022 04:52, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Fix the interrupt order of the charger in the binding example.
> Due to this patch modifiacation
> (https://lore.kernel.org/all/20221001202918.me7z2qzm7cmrkzsg@mercury.elektranox.org/),

This is already a commit, so use commit syntax.

> there will get some warnings in linux-next when compiling the dts.
> 
> Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

With fixes in commit msg:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


