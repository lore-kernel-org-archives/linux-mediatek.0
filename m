Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDC5EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3quue5muaabi4CozXaKq5cpAvjxqIHPBQ6qXUTBWbdw=; b=R2L3ofGsyUqjPNsnImmqnpg1Dg
	COOxuttFW8Szs5CjZL1GC3jcy8oRwjO5sRbf/4FFKQTFSeemrOMbDOJKr7L5Cd43HzAbTH001GqZN
	R3ZB/t7vvBd5WDN1Se9+reHf5UWVmGAybdNHg7X2yH+Urv7F+A4q+jgE0B23ES5RMLnZpzVh51r2w
	rGEli0vKJW3geGNeFqEzvGSBJ/cEUCkO3vdgSOINCXcRnZSPR2761+fweLP7ywWfz7oWAyUhee9Fo
	31RdSHEGYMXKqNgt+jAcoInmfCzOcxEZLnoYknd+it6cYEWCwtnKY4NvbibFX3fHjIGRx3MrG1RKY
	AJO3BPvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzxb-005OFk-0O;
	Wed, 19 Jul 2023 05:42:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzxZ-005OEx-2x
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3quue5muaabi4CozXaKq5cpAvjxqIHPBQ6qXUTBWbdw=; b=UteXllcICy5v80noGktpo3Lk+H
	VO9OFPe97uAKKTq/SaYv1rRmYSqaDEiji7YfmbJ8OmiWiqpzwgpDikSSvnL5Z9tDQYjkX5+HTZ5jO
	OZI+8JqnZN3E0dyEwO33G0tY93GSuDpjQm7zVPeEVNKrAmDFoAeSZZUT1kJGCPZ+4iBD/8Tl3i43b
	7qEvnnq0tW022cLqanHNApCSC5EuAj2PZZw6hmhL1qhsjlrqYVe9XSqy8UFELhg/q9xHGPgbYi9fS
	rt/bhOEj5nMRxXT4nBPXPKf6am3Je83E3CAwVKBWKvOk79GCjDOVMQOUdrxdss6FuQhX9OwUYAPIs
	4xA9Yj+w==;
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLjG5-00BTkf-0k
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 11:52:51 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52164adea19so5958952a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 04:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689681103; x=1692273103;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3quue5muaabi4CozXaKq5cpAvjxqIHPBQ6qXUTBWbdw=;
        b=ai7bmqZWsoaWrpXI4H8t8ZMrZD7gYqG8TxIaP6A/L/kVtcTnV3PDNmK7VH1sFevrn4
         pHZiJp2X6jGyxaaHBuB1/HjuHO8HCfWE5CFmt2QoXooyNuTL8mgOBUHtHhhDfcVR40p/
         3nSifm44M09L5YisCb3cyB5olsUuOx+o5WH9gElgndkdtR1pTRnMqI/tp0yrzI7vZEBa
         o+IhS3jFBmJSo33v6lDFeMbClfSfmu/1bVJ6cxadTubj4bNhYhywI6fEN/HEprvlcjf0
         ZLY4mKnS4vFVx7r5DVL9BsL4g41wko3/QBY3GKAMhFTsWCq2rJUp8xb1X7He2pX+PapL
         5Y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689681103; x=1692273103;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3quue5muaabi4CozXaKq5cpAvjxqIHPBQ6qXUTBWbdw=;
        b=MLpA7ycWW91TMn742Jm4dAkyfh0NcH4RvyUGDH85zJCNGnbR6ood2+GFLKJwQDdCHf
         0NmeBUyJndLggsZvooZAIJxMsq5ZA7Rf2Lrn754c3vyHEI9E4F7KMGO1oFr4qsYrfEO8
         YZTauLpFBMTksVLhDbEqwlCoWrXZ+pmk38IAPhUgIDaep0z2dinwP/LNU9SPbCHZC9/j
         f903VTNBr33ozEMSiS/zOzy6x3doiXfGQrysGr3XdFXFhsOOOvKliGe2s6ZwetdNZ8BZ
         qG8yKOuqZcT3vdntYG2HAvD9T6QfPx09AAXwcgoiiqUw+S3HBDu+0HXXiLhl8xLWzj5t
         RzPw==
X-Gm-Message-State: ABy/qLaLExTr4J+bz8NGobSXfnQpj7+msUtqJEFJV6++a2vRpELE8WfL
	aSIFfdi8KBmaFxzYN6rFkbpdLQ==
X-Google-Smtp-Source: APBJJlEPo8s5sbjPHwSDG/7oatXTr5mKLCpvbizDsLHDd6nf2YqkStcYaR8mA4ooxcBG7nnqL/dqUw==
X-Received: by 2002:aa7:c6d3:0:b0:51b:d567:cfed with SMTP id b19-20020aa7c6d3000000b0051bd567cfedmr14504401eds.5.1689681102733;
        Tue, 18 Jul 2023 04:51:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c15-20020aa7df0f000000b005219de74217sm1110977edy.43.2023.07.18.04.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 04:51:42 -0700 (PDT)
Message-ID: <5cc44894-2309-b432-72e4-e65bcebb2b06@linaro.org>
Date: Tue, 18 Jul 2023 13:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] arm64: dts: Add node for chip info driver
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230718112143.14036-1-william-tw.lin@mediatek.com>
 <20230718112143.14036-4-william-tw.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718112143.14036-4-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_125249_564854_05485DB3 
X-CRM114-Status: GOOD (  10.12  )
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

On 18/07/2023 13:21, William-tw Lin wrote:
> Add dts node for socinfo retrieval. This includes the following projects:
> MT8173
> MT8183
> MT8186
> MT8192
> MT8195

Please
wrap
your
lines. :)

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

Anyway, your commit suggests even more that you add driver. Drivers do
not have place in DTS nor in bindings. Your code in patch 2 is very poor
quality, so considering this "driver approach" I think you just send
some random downstream driver. Don't.

Entire concept is NAK.



Best regards,
Krzysztof


