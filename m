Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EA1C54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 21:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Cz5Q9QqxBT/mJ42tlkxiPXIwzy6fjExSclfG0wKHfI=; b=xJacJhXOMfMATVUWRJgo4ZuNW4
	uhmrBXU4zEXbleVTX04h25s2Wgv+Ic6TlUMICEvG+eGomOpNsFqGjngSKigPgfOQjpw086B+gqdwY
	AnR9/t9c+4L6ssMnxTHFvg1NuwOp/Z5K7zH7yUqfJ69LFwwo3B6+8GDFCaF5pyfdYRNywfCrNHSjG
	ldQYNo22aOk+m+LAoRhUMJu1Cub2PKMYEWp+DZmnqww2eB6l+8Siwy+8w/ejjEmoAdmBNFGvTLfZy
	GgigjMc7PzYdJQJgKpZ+FCn4K1d2jxP2yIfB7fdHcJBk3kmeDKxxtLEnFU6YH/ZLOWmxao6wRrags
	3m4jex9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWl1-00GcMz-Bq; Fri, 27 Jan 2023 21:59:39 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWky-00GcKC-By
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 21:59:37 +0000
Received: by mail-wr1-x432.google.com with SMTP id b7so6199749wrt.3
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 13:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Cz5Q9QqxBT/mJ42tlkxiPXIwzy6fjExSclfG0wKHfI=;
        b=VjEoXjIr7IVVZyO+Rf5tXpFVDXNmFU2VGHrg6Y27hxxINfHRN3yuLXS0Gm39WZz9LV
         o+Rl3JBrr+JKhdJhfDsOtNfTAO2dPDbGXEPYY2vrDpwJZGy9iBDWrW2jtd7nbJ1NKnrA
         Ar9Snn64+bw2fVzFS5NC9gxnjTAImX+uWfzpLw8yZbaliJ0rpRc4kes3hoNW3TAfY46+
         ujOjQVD74dmDRifH6/9DCjBvAingP6reqJBmgjnpOEDfc3IU6bvMSof7VseseFCroQoO
         PDafqviQ+3QngfDtKMWOlsGxRfo9dMSx2U4r686FF9EI3Z7ETmiNcYBE4SwRHnSwXo0D
         nSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Cz5Q9QqxBT/mJ42tlkxiPXIwzy6fjExSclfG0wKHfI=;
        b=XGnzow5X32q0fTFnl/yDYUj9uWpJwKZ0X8VcQvvnW2x2MaGUCh+yobCfiztZkNpx0d
         X4FprHO/CGZHDP19VOxpJyDKfF3GyB//dnO/gZsqQdLgrpgEGC4eYx3zhhyiLCmNF7AU
         uAj+WMIevjZXeV21byUxo5ZDPLkdN592918KjnMYsbZmS6D0o72hH1obp3D+mUMbO4ex
         cXJE6jpriltCRpukSlFj9GiPhfj2isNbuURqlsffqstwXvPGoqSCY2+a8wJKP2ZD09+J
         c5gnSqMMDNpJoG9yxNF8ANlyUB9EWKRjD8eXFRdrUyLFhzlC7hsRG9rler1EwS2a2uJy
         KebQ==
X-Gm-Message-State: AFqh2krosP5I2dRUdcTPAwbg3r2vcQcINRJQho7hzMpEcCGSOzRZhodg
	sHNH7SVNi1cPYagnYDJk4zp7+g==
X-Google-Smtp-Source: AMrXdXsco7rdfIpvU1ee1v+Fg46FuX6WTwlVLTcQ3THl9hinHIVdvLedq1TNXWbLD76RPI9IPu1BVg==
X-Received: by 2002:adf:db90:0:b0:2bc:7d3c:5a57 with SMTP id u16-20020adfdb90000000b002bc7d3c5a57mr30437667wri.1.1674856770961;
        Fri, 27 Jan 2023 13:59:30 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id u13-20020a5d514d000000b002be2f18938csm4744904wrt.41.2023.01.27.13.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 13:59:30 -0800 (PST)
Message-ID: <afa4aacd-bacf-a545-3973-474286fd4b9c@linaro.org>
Date: Fri, 27 Jan 2023 22:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 0/5] thermal: mediatek: Add support for MT8365 SoC
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Michael Kao <michael.kao@mediatek.com>
References: <20221018-up-i350-thermal-bringup-v9-0-55a1ae14af74@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221018-up-i350-thermal-bringup-v9-0-55a1ae14af74@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_135936_433306_4868E190 
X-CRM114-Status: GOOD (  13.47  )
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

On 27/01/2023 16:44, Amjad Ouled-Ameur wrote:
> This patchset adds thermal support for MT8365 SoC.
> 
> MT8365 has 4 thermal sensors, one for CPUs and the rest for debug/dev
> purposes. The CPU thermal zone uses passive cooling device with
> CPU{0..3}.
> 
> Changes in v9:
> - Use delay between bank init and the thermal zone device register.
> - Link to v8: https://lore.kernel.org/r/20221018-up-i350-thermal-bringup-v8-0-23e8fbb08837@baylibre.com
> 
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> ---
> Amjad Ouled-Ameur (2):
>        thermal: mediatek: add callback for raw to mcelsius conversion
>        thermal: mediatek: add delay after thermal banks initialization
> 
> Fabien Parent (2):
>        dt-bindings: thermal: mediatek: add binding documentation for MT8365 SoC
>        thermal: mediatek: add support for MT8365 SoC
> 
> Markus Schneider-Pargmann (1):
>        thermal: mediatek: control buffer enablement tweaks
> 
>   .../bindings/thermal/mediatek-thermal.txt          |   1 +
>   drivers/thermal/mtk_thermal.c                      | 117 +++++++++++++++++----
>   2 files changed, 96 insertions(+), 22 deletions(-)
> ---

Applied, with some changes and the subject fixed:

Subject format for thermal is: thermal/drivers/<thedriver>: [A-Z]*.

Thanks

   -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


