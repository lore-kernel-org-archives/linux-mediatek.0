Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48640C77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 13:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/uJoEfdBrHkM8umj9Qzq6MjpEIPQ75HXLhRcJDJNhI=; b=GV0L28ZAmtgO0Y2oMXwRFta4zi
	PkiadYQpx9kZZYmbQAjf7UczpsGRfByqEL5wPkQenbgruyTK1UgvM4xLkcyBgw/8qjVlZq5a+kQWC
	yrJV0L9bdv7VYCk6TTX3uqNarCNlh/Yi6z4GfcH5XsmhNjD/HTwVpGUShi199MBpA9XDwEPGa1TtV
	mdUJN8anMBAJ3+lq0tf+BEeDEQ4p0AQCJt5rvOHg4X5cCbDC84jtsfeMm31mSuFBCQ5I9Oc9XsdTn
	QuazmQN2dfD5h0YYh7UPhIOI9t0tTVecCemq7JIYZwY9HlQaeSdao3nc/X47VaDSuU0aEzF8j2mi/
	fNblISZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmxCd-006IZr-0a;
	Thu, 13 Apr 2023 13:41:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmxCa-006IZB-1D
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 13:41:30 +0000
Received: by mail-wm1-x32e.google.com with SMTP id bi22-20020a05600c3d9600b003f0ad935166so531292wmb.4
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681393287; x=1683985287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o/uJoEfdBrHkM8umj9Qzq6MjpEIPQ75HXLhRcJDJNhI=;
        b=qSaoqkqkXL6KGFFgIvLODD2VAFqyodvQSgU3JqfWiN448FpeIYuzdy7SuHZZEsBeFR
         Qj5dZ7MZ/gFqSKI5yYikfFNmI/SFl3LnEbdxO1Kh5l27EFL5y00P0ts79XVTatBUjxMd
         X9PqfQqBaa0dp2JARMfHxT5hwo+Ru0T25lpk+MtMnJ1Gri/TqB+K4rck/fANnMKJGSDi
         G11D7L8Ds7426Iya87fZYsH1rIFI0NwD5eoF9mUqkR70pO/hYdDGOuN1PWGQUnQw2q1i
         zexerlbyF6t9bADh1BfBpoSK960IU68mOsrjJySi0NI44F5PMhX0837tf5z5l77jg+GJ
         tBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681393287; x=1683985287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/uJoEfdBrHkM8umj9Qzq6MjpEIPQ75HXLhRcJDJNhI=;
        b=iHoIVUPj6Pzga5m78yQAbW66Y4XsRxTvPO2Iu6K9S9vNf+5A4ZblS/82JDYojZXhdP
         P19oPPw4qjlbLgjw+0IMhscqerkUXd+V+b2s02gOssoDsh2HFNq/TqPCGOHARs+P42HG
         wbQWH2S2rFwLcPtHQyv2QZJw0RlzCw9EPU4lsg8GYBsarheAhBhJZEUWtnc3W9lutxxk
         16zJ2mC9UEywhn0IpeR3Vf0GT19Frt8Cu5avYBywCUj8fXZ3BfQTBNzCjoLB2ckZw9eJ
         BLCAi707IBwdRK8toPDGU65Dey7PvyHILuW+axyffga8wFmKntLxS8K5T7HsukFzMthk
         sdKQ==
X-Gm-Message-State: AAQBX9dqJQrr1IPAHFuLp7Aacr/d5DK7QWP7TDOyIfV+KsxugtMVQrwZ
	hTkrI2J+Wty+kjXXalBJSjJjCw==
X-Google-Smtp-Source: AKy350ZTQwiWfW3YM7pVVGvdZnslX3wudj8JovNDzaTTKOlXEzGpDqVhqmlxUMJSphB5wrVujBhi6w==
X-Received: by 2002:a7b:cb06:0:b0:3f0:9564:f4f6 with SMTP id u6-20020a7bcb06000000b003f09564f4f6mr1908290wmj.1.1681393286675;
        Thu, 13 Apr 2023 06:41:26 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id p8-20020a7bcc88000000b003f04f0c5a6fsm1837156wma.26.2023.04.13.06.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 06:41:26 -0700 (PDT)
Message-ID: <f4ffb7ab-7f61-df0a-fca8-54585fca16d2@baylibre.com>
Date: Thu, 13 Apr 2023 15:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/7] leds: leds-mt6323: Drop MT6323_ prefix from macros
 and defines
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 pavel@ucw.cz
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-6-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412153310.241046-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_064128_419841_E7778E1F 
X-CRM114-Status: UNSURE (   8.31  )
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

On 12/04/2023 17:33, AngeloGioacchino Del Regno wrote:
> This renames all definitions and macros to drop the MT6323_ prefix,
> since it is now possible to easily add support to more PMICs in
> this driver.
> While at it, also fix related formatting where possible.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre


