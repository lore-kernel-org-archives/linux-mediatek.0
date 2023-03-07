Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6ACC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 08:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nDYeNViOfggxIfzDROShYRUgmdfTcb/BnnR2M5KEIc=; b=ktU3wX3AqKE4ZKBXpDkIUTzyCO
	8WZYJIZzbd7cxtEz33+yoCQsn7N/IsRK3iMyzRzJdHwPhX/yOR8TJvCym1zf5VlmIOMn41nvVcDWB
	KyWgOxqY5uXpc4Q2yhNOI0PkITPbBG+J2Pu+oOHTeTIVozJnk23BdM0kRkog3HfD1dXWi5bLWDkmV
	ByfzPKA6GJRoa5etxj9UgshR21GyyHjZIqXtvLaxKRhN/ksL0QI+K/q3YK3auWHwu8is0hu77Umhu
	sKTlUjGEATjkOYnL9bEi2wTNiUPlEI3EqNP+n2iN62nAt7Qa1rQWM+QTlM83XaE4fV49l3VHnjAGY
	ESBz4N2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSUu-00GezU-DN; Tue, 07 Mar 2023 08:16:36 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSUl-00GevH-41
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 08:16:28 +0000
Received: by mail-ed1-x536.google.com with SMTP id u9so49092579edd.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 00:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678176982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4nDYeNViOfggxIfzDROShYRUgmdfTcb/BnnR2M5KEIc=;
        b=w8llI7QPcpMyUTDXYAZJGp1+kvh1rlpFLMjH8wbFFDZww7zjI+hLF3l0py/pym6MY+
         9cQAvW2mQjavd2f/CXHyyk1bGlydLLpHrz7RdnmV+HxkdBx77YoqhVUog+iBKCE4AjHm
         e9etJqugxqb3EEaDRF0LNlr+GsmIdkLLhLnPezid7kcj3lGI0g8YHFmeis9nEDeNlNPX
         JgTXzDmZIfR6Mrp6YXdD1CWaToVyoHMRHIFRXLqPvqX6kct1VQGPDgv5X/pdbahI8yyj
         Vo3glMnWIRVqSIXYXW7jRIsim2WlegveWdkCOeM+fZ4hrzb42ehfmxa8V8KSomzkVPa6
         yXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678176982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4nDYeNViOfggxIfzDROShYRUgmdfTcb/BnnR2M5KEIc=;
        b=3+ztxHle0HJ+wtNKdbToU/6xApaWtsfHtqV4dMEWrMf7luxNy4MzcYuet3t3Eu4Zjb
         M9RU2ef7KVSaWrtfrwMOOXGOWJNqj1KJ+ZyepZCqejzi1kbEG+8aWKl2YjbPWunFEYLs
         jlPCpsaOAebmVDlpu9Ux7qhItxm0QopRtgB60uS4OKx6uHFIZitaCmZXeylaD9WaUphY
         mq/oU003nBT/k2JAKOeizgdQNqL/QV6qMZdCssMORCmdZQ3zrf3DmQHDllebC7zsa3Gz
         jPiFfNh8WN3y5J49KebNqNJBGBIFMfHqYvjVca17DJJ3wwp9V+Zz4X5rsXBYGytB8scg
         k9xQ==
X-Gm-Message-State: AO0yUKUltMFGx93G9S4SDZGp3VYU/r0omK9g6TAgXIt/lJMJpDnav6gZ
	iANTlkd7mxYudcsBSDm8phttuxeOZrqernA9W0w=
X-Google-Smtp-Source: AK7set9pStbAm3PmBs5vLzhyt+fZdTXRfRWPgXBTYQeJjhU+7VkWzt64OghaTAQEV09Vb5icRVNAlA==
X-Received: by 2002:a17:906:6a1e:b0:8b1:fc58:a4ad with SMTP id qw30-20020a1709066a1e00b008b1fc58a4admr18504773ejc.11.1678176982155;
        Tue, 07 Mar 2023 00:16:22 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3? ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
        by smtp.gmail.com with ESMTPSA id j23-20020a170906255700b008d9c518a318sm5788324ejb.142.2023.03.07.00.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 00:16:21 -0800 (PST)
Message-ID: <e8c0f0db-fe2a-52b6-ac8c-7810b348af8c@linaro.org>
Date: Tue, 7 Mar 2023 09:16:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] dt-bindings: display: mediatek: Fix the duplicated
 fallback
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org
References: <20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_001627_171987_AED3B08C 
X-CRM114-Status: GOOD (  10.79  )
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

On 06/03/2023 17:20, Alexandre Mergnat wrote:
> The item which have the mediatek,mt8192-disp-ccorr const compatible already
> exist above. Remove duplicated fallback.

Your commit msg is really misleading - I was looking for duplicated
compatible, but could not find it. You just have there unnecessary one
more list in oneOf, so this could be written simpler, but no compatibles
are duplicated...

> 
> Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr")

Style issue, not a fix, because nothing is duplicated.

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> Fix MTK color correction binding
> 
> The fallback compatible has been duplicated in the 137272ef1b0f commit.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



Best regards,
Krzysztof


