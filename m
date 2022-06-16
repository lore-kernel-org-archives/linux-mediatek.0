Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C369C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 20:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E51hIQZ40f3QqFw80DRIhYWi7mhUqOpvxoosSE7qNkI=; b=zDRMCh2gABnWj0/a9VgMiKu9/w
	RFl/3rtSsRUV7qdVUjzBWai6hSKCv87Ju4IfSEgUy5LAfCCtLtwRt+NA9aKq0nQXetC1znUrvwKrM
	R352RvwTJARlFu0PcnEi98e9VM/tSaR19b6eHllxdtRxy69yWii6qe3HHmljbtxaRGGJJviNs1IVE
	YVUKLZ6YSAs7Oi+wIUPOFCSrPNdr7tPIMY7SGmna0YbJEcQfxehuGr/B5AxcSE6ceHvbO0MjCUziI
	i3FrvUkcnfiSZy4jsJuEdbUF3CX/0IbAyQotiVlFbO/Rx0seGF2Ea8mhezqmoTV52TRCiVdPg97/C
	scl4ht8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1wEs-004B4u-Ke; Thu, 16 Jun 2022 20:37:14 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1wEh-004B0l-9s
	for linux-mediatek@lists.infradead.org; Thu, 16 Jun 2022 20:37:04 +0000
Received: by mail-pj1-x1030.google.com with SMTP id y13-20020a17090a154d00b001eaaa3b9b8dso2469091pja.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jun 2022 13:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:in-reply-to:content-transfer-encoding;
        bh=E51hIQZ40f3QqFw80DRIhYWi7mhUqOpvxoosSE7qNkI=;
        b=IinKuwvDnNLEWJeDOevtyk/lAqJZP57Akm4dK66P3cKbLGyAYWVlcfTjjv05ChSMXT
         THEGoWaxHQ6So2p4Gi39Mb1+B/CdqUdF/CHO+ZstUngWxRe4ezHQE1keZjmrlsnHhOE1
         d2b7a25kzArhAAR0B5xiWwB8xcXrg6yuKQ7Bg/tQwayP5wod3OI5cPwdc59N7SsHh8oj
         xIUvhh0S5WDLASHWRYMixF4FY96hB2Spma7LzykNaoKVhLeA6xfEfRwLglwKCHsN+Q3H
         b6J3fY2Q/Ex4W4akScU/N9U/XcP3L8It1v3vaoICm8ThjuFDrPflSEisVvvxktcfzXGm
         g+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=E51hIQZ40f3QqFw80DRIhYWi7mhUqOpvxoosSE7qNkI=;
        b=uWLLDlYwbZW7AHwAulV+Ykk3XlZ9tuehZeqv/k2FHS7Zp44wW1i5XciWJIacjSsTSn
         23Ewu6wc2dpJoc1rShpGzKHSJa8TqyKdefHtLdj12wK6rIkIL8uoonOTk/UhSYTtYMxv
         ZyOpjEmjPgXrHZ6Y6ewYOIv5bKKTov6PT957QNR4oi9PrAb862HYIxmsca0vKzNboju2
         bapHYUgl6bBXQvMx8n2J6yjTY6MBJrzD7dryrjawWf7VTuV2U05iDr4RDuPW3MzkBQD3
         Idyr1cN6GrJP+y4QqGTgv7GRsgg6Ui56KkTisILqWym4M41wf3OosobbvigEUB84ksnY
         eCAw==
X-Gm-Message-State: AJIora+rPJnkxYHLG5XZhO052DY4tIMkmAOw4W8vHT7dtDtJzBcsH4Az
	sOHOxanAnZfnR+Tn7oTSPSCR9g==
X-Google-Smtp-Source: AGRyM1uopfEHYuWzZ4pnBMx1dSiZUpXEVR6mXp6GjuuUjON84+lsG4j8diSn65znvoiZn7uZt+qbyg==
X-Received: by 2002:a17:90a:384f:b0:1ea:fa0b:3132 with SMTP id l15-20020a17090a384f00b001eafa0b3132mr3265817pjf.5.1655411820137;
        Thu, 16 Jun 2022 13:37:00 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id m70-20020a633f49000000b00408b966228csm2225798pga.49.2022.06.16.13.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 13:36:59 -0700 (PDT)
Message-ID: <1338cf79-d57d-d13b-896b-abc0c726a238@linaro.org>
Date: Thu, 16 Jun 2022 13:36:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: adjust whitespace around '='
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>
References: <20220526204402.832393-1-krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, arm@kernel.org
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204402.832393-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_133703_372116_D4E9D2D3 
X-CRM114-Status: UNSURE (   8.04  )
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

On 26/05/2022 13:44, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Output compared with dtx_diff and fdtdump.

Matthias,

Are you ok with the patches? Any comments?


Best regards,
Krzysztof

