Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ABAC28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 17:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wY+75YmJF6F6iHSTUHNAJDV+N7PX1+5Hl6WRxPY2Co4=; b=yvKMXvU7VUDd2SHxvHgg3BIHTA
	JP5cJ72fJNBFnkggP9+GEysrV44odx9gU0wvt/Wa9GKkvPYYPpxZwqrosehixMCk+ArcqVFbgFaZi
	VEvn8PiPKIigO1St8XfTimbV8xOvIC6+cgMmdItge2LeuBtVJtQl4w1LytD8H3F/yK2w/zB/S5nIA
	fsWD+qrVVcJkOJavOEE6K3nUZHrp5u/eft6IVWnRMtmqVNdtny0pLmHEBsFnOXKgcAm5nffK4gPrG
	CBuJujWlH9tcmudcR+ru8+bB8VEetmP0rkoX9shB1xLENpnfsNJFDs1q2xK5zpBgrnwyAvYTXn0kJ
	zYhxYnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQBEn-00D4rI-46; Mon, 22 Aug 2022 17:29:21 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQBEc-00D4ln-HV
	for linux-mediatek@lists.infradead.org; Mon, 22 Aug 2022 17:29:11 +0000
Received: by mail-lf1-x12f.google.com with SMTP id be9so8318345lfb.12
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Aug 2022 10:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=wY+75YmJF6F6iHSTUHNAJDV+N7PX1+5Hl6WRxPY2Co4=;
        b=Qk4olVB8xIDb10EgA54jPX/P/Qz8Qfd5ZPOIP6eHYJ8mMMiosL1SnTkZkjWYP/9ZIJ
         MzViCBXQnLKWsZq0B2Tdr+9IqUpzAHfAu2miVGL3P3pXvpxeAa8RENu7VjZ+s4GYBQEs
         +YDWLFTAdyBotMOlspmwa6FDCAb8kenPU0WDS5v8yozswPr2YX5klbb+dAuXDjuKhOAX
         NKd5grHVF4UaytXHMuYnYkXAQ8ZqpbMWSDA2PBCWg7mF9nBJqXL5hPSHmlSiPX2Gxgil
         ABmmT8RjtLpjDBcS5Dd6qnsvOW8D+M0x+BL/WE3QpeKi+kQDSbQhbC19Oo1qBupCJRPz
         TndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=wY+75YmJF6F6iHSTUHNAJDV+N7PX1+5Hl6WRxPY2Co4=;
        b=gPQZTq06qwyOohGjKEWWhYOAw/uAtWRjcrOh8e8+VYg5dPhdhXEM9SS1hWb+qsVo9c
         6ltzqvXclC85mU0+4rEwVSxcM92m5g0jeKD1VxDnFgPbYtgETdUFVKCMNZEi0HGuKxBe
         pdGu7IHel1NaqB0ldkETFgq00trdO6XG1BPseXSISA3euAizpJK9pxPSrNK0H7srXqBI
         rnQRRvWP/J7bssBy0TDP8S6d8HpYQpnehlSZCBqFHlOaOpIBFl+L82lmyf59e4Pl5aE1
         EoHhaKIGpNrZONp4MlJb+d6laAn7CcSKmd3+Q5+bd4nSmBFnq+pWpXPj6wrOoxpfZaE+
         PsWA==
X-Gm-Message-State: ACgBeo14sggw16ed7pk142LGPlIZ+hJoD7EDWMyy/LeABWUoHxwd3UXx
	8KXIdyt2V9O1HeAPM9El8l6rCw==
X-Google-Smtp-Source: AA6agR6+/WgJeFE32Q4SCQCRljiwY1ET62J6fHGTG4QgqjBOsMf+vYQvQjMAbaLH24s9T3+dpWet2Q==
X-Received: by 2002:a05:6512:2c8a:b0:48a:f7e9:973f with SMTP id dw10-20020a0565122c8a00b0048af7e9973fmr7197041lfb.5.1661189347595;
        Mon, 22 Aug 2022 10:29:07 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id s13-20020a056512202d00b00492dbf809e8sm378312lfs.118.2022.08.22.10.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 10:29:06 -0700 (PDT)
Message-ID: <0de7f878-1471-4916-9384-9d966e840d74@linaro.org>
Date: Mon, 22 Aug 2022 20:29:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: mediatek: add bindings for
 MT8365 SoC
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Fabien Parent
 <parent.f@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>
References: <20220822152652.3499972-1-msp@baylibre.com>
 <20220822152652.3499972-2-msp@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822152652.3499972-2-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_102910_586532_6D0B69A8 
X-CRM114-Status: UNSURE (   9.78  )
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

On 22/08/2022 18:26, Markus Schneider-Pargmann wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add the clock bindings for the MediaTek MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Hm, when did I review it?

> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes in v4:
>     - Remove unnecessary quotes from $id and $schema
>     - Add myself as maintainer
>     - Dual-licensed mediatek,mt8365-clk.h


Best regards,
Krzysztof

