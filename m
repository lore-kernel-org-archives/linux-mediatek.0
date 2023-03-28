Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C43C76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 06:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=451j44+6MRrjjocPev25db4ORq+gaZ4ABjFTXWHPHzM=; b=COHe8C3VZlffxu4lLOwCXRLvMi
	ItNRtkiL+EOy9/9cU8BgRr5B18/LfJEkT8GtobnIPjusP8fMESLBh8Gu8S86aMeKiFaWCllwJv+Cu
	ddRfHWjS71ezj+VfNZgaLg2HuCk2Rzq+rXy2D5aB1dJxb049Pz7JywtmwvRK2ZcTWmL+aKNmt1xoL
	XSfr7IvOQ56ydY9O5jEloFAocDaLoiJjyk6kKdc18SKhc74m6iXL+LTJeOvfcF29QoiqDt+KsCtbT
	73n30bBcTfNbma5E9oqTRU6VulP4mjmCPH+W6177CEcwgrk4r+bUDnwl9+i9G4xf5E125Gi9uNbuR
	Zsc0UvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph323-00DLEu-2l;
	Tue, 28 Mar 2023 06:42:11 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph321-00DLDi-0W
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 06:42:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id h8so45333689ede.8
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Mar 2023 23:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679985728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=451j44+6MRrjjocPev25db4ORq+gaZ4ABjFTXWHPHzM=;
        b=Qe8/nJ97su7uPLmdIjcVPCheqGdN7PQfAi4CTS73IRaZ0u66bA0GBLRqfvZky48jcR
         DqvGguKXS5TUPzEmjpceIrMqMgqalZ45c3gG0ji4aYvZghRtrkiTDKHmt6Qwyzi6vRVt
         BHVbWc3BARQZM2ciJBh5+7S5w2Yf4/efHb/5Z9qjP87Hh5kiH/5Qz28Pcy661mzeaL2H
         LnH01tuYR8Lp6tcdJiyD+4SSXQveH6YTiZpmhCErptaMJeXmTVTM0LHwpwqjL/alt11G
         d5n2HW5FSRp+0RPS1a2oxGNS4skGS2ObBRIww+Ho96KRn+GOgiViEFtQbmlvmqY6BVkL
         wW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=451j44+6MRrjjocPev25db4ORq+gaZ4ABjFTXWHPHzM=;
        b=kqcV/KIyonEFZBsXBl9DSp6jjnYrktV7TkotlpNoJXyMxgaw2swghis3h7rNQKrkU9
         J0Jwc+OAhwbQxmk5VT7rk3RU8dHGqmdNYcS5vo/ieGwIaYjIO4WzJULuaRwHE0hCWske
         VXQCUlvqjEO8jtth5X2gNqhaSPNS+0Euzlq+iRSFGrHHK9csV1i1n6xuuFtdnvWvKNKx
         zf7CTIQX1FzOwFSDzXV63DkYmEXzdRS5f7C9fbNxEp451BjrXWJJ0fbihR290D3kbTuH
         tQiWrwLnUonX9QmsqKLoYYlSlLHdRiiXQbz2YcLtR9Amgb5zRw7L2tvk7MWnVxSsKQev
         WF+Q==
X-Gm-Message-State: AAQBX9dLXNVYEdLG+ShA2CtZfpkp1cBbAgTO+QnYTEvRJFkXbLeIgwUv
	JbOW6rc2htAP6ViCUa/NH4Dt6A==
X-Google-Smtp-Source: AKy350bPobP7mxNYomM7mTnUP+KR0VKgYBLm04hWoARq4akmXfxUlUHc7yIwq5WmnLYkEcUIdmxlTg==
X-Received: by 2002:aa7:c90d:0:b0:4fd:1ff0:2291 with SMTP id b13-20020aa7c90d000000b004fd1ff02291mr13811380edt.18.1679985727914;
        Mon, 27 Mar 2023 23:42:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id s30-20020a50ab1e000000b004c5d1a15bd5sm15403339edc.69.2023.03.27.23.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:42:07 -0700 (PDT)
Message-ID: <acb67dc8-0186-695b-5986-6f1d91a0108c@linaro.org>
Date: Tue, 28 Mar 2023 08:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: rng: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230327170153.4105594-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327170153.4105594-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_234209_199568_F98B5B93 
X-CRM114-Status: UNSURE (   8.29  )
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

On 27/03/2023 19:01, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


