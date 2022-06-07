Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2724C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 16:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAYDiNleJnMPacC5j4hzcJv9c5nRwgwAaRtrxyDfUNg=; b=XyxsvOwOUcgtfU
	hp8ZUYTXTbjgdy+8KCR5HTCzdmWc3quXlkWdcWTinMLXl8ltC0uV5IuY9I3gZydhsyxP2HEdtcF5O
	xQ1/wbPQcenePUvTaO7L6v4oXRleuWAyrfp7pzzbDFEtGKXlSUXhTv64kKpM5LKeHu8VHUw99hNmx
	3FZhxSETx8saZjpSGhINV90IHmFrpm5FpiqSvz9e7O0iUd9Ton5wKbt0LZmGSwmlDlNNCZY8t/sxf
	VeQwWDAeVGblw+NEgWfqE+RMQd9VFR640l4aSt0oFK4tFs6IbeQB3hUSL3v1MGBBlE4oXOJQpDJ2S
	R8uX3vg3f5KrENrE8GYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nybna-008OVe-Vr; Tue, 07 Jun 2022 16:11:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nybnQ-008OQv-86; Tue, 07 Jun 2022 16:11:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 67-20020a1c1946000000b00397382b44f4so9795978wmz.2;
        Tue, 07 Jun 2022 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HudpD98f6GFJ5B/ZS9VSp+I100XFU0qZ9neTB4R0OMA=;
        b=qyER1BKCu5XFFcoaFm1MFRkKxiu9zEa3kZsdfZv1/6mmYCTzyMybulbXhrwXGq7kzt
         PCUoM5v2soN6LfMJ75DkcY+kh3Kz4W8/Ji46gkh5PQWbjsr4Dz7/c9ORGmlu8IvltBAO
         5yddMZ8lDQZa/5jKz2toQFdST6PTnojwKW5HocjKg7Ys9X2r9PKlBUhukc39BAvAkRe/
         84xISuv7mlDp1fuuxrqnVq64ZvDEvmWYEWhEbpbSJd7+KOgnT0OnkqIomRRo+2vK7dvr
         XuMFGfcZAR6uHZDPLCMOIuxCg4IFJEvPpY/TAiIiCUEd+uY4vnyN2qq6HwAomz0s4FdE
         6xTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HudpD98f6GFJ5B/ZS9VSp+I100XFU0qZ9neTB4R0OMA=;
        b=ci22ukPyfZuqPst+CMbKifCL6ZCHdxMQsIntY4mHqodRgXQOTtp9IgGYeI53l6xyeg
         IJHL+jkxFcIsSKnpQkWDNc8sV+jEHlpNuRosid2DP4qT2pR82oQ7xszfKI0KY+XTKxig
         yH4jVnU8Jy0kTO5tjpGAXSwWz/O6u8hvly+tRRkfPHx5GTVD1haUar6U7N0QAX8a2F+B
         h6SS6U34Fy+IW1DqQG4r/2Bjyis1rgtTn65WOMdxElqbXVo+TSlEgw+7e6WRupmtcTf7
         O/wscqLM74ujONhvK7MYws2gUOc1FKiEwDCiFqA2iiA54/S6O2PAzZ+cevAW5L6A6qnk
         xgWg==
X-Gm-Message-State: AOAM53018dsJBGo0uT0DJeEVO3xiAGpDRsmOSYbhsIErR95QOKZ0g+5M
	yIdFWCqYJ7Nu2NIKI9N7woQ=
X-Google-Smtp-Source: ABdhPJwyDmBTK3dce68p6NIVVz0SZn6aoAX+f6bCgJzS860gTJqa6XBrNDKM7ZVk+1RuQ6nEhVOqIw==
X-Received: by 2002:a05:600c:198e:b0:39c:2b73:60ab with SMTP id t14-20020a05600c198e00b0039c2b7360abmr28420635wmq.14.1654618263856;
        Tue, 07 Jun 2022 09:11:03 -0700 (PDT)
Received: from [192.168.0.36] ([37.223.143.134])
        by smtp.gmail.com with ESMTPSA id t22-20020a05600c41d600b00397550b387bsm24690689wmh.23.2022.06.07.09.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 09:11:02 -0700 (PDT)
Message-ID: <afd9ab8e-5bad-54ee-3f44-5e0cfdb22e75@gmail.com>
Date: Tue, 7 Jun 2022 18:11:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: mediatek: Add CPUX System
 Timer and MT6795 compatible
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 daniel.lezcano@linaro.org
Cc: tglx@linutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org
References: <20220518112435.241116-1-angelogioacchino.delregno@collabora.com>
 <20220518112435.241116-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220518112435.241116-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_091108_334320_4E527A2A 
X-CRM114-Status: GOOD (  15.72  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/05/2022 13:24, AngeloGioacchino Del Regno wrote:
> Document the "CPUXGPT" CPU General Purpose Timer, used as ARM/ARM64
> System Timer on MediaTek platforms and add the MT6795 compatible for it.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../devicetree/bindings/timer/mediatek,mtk-timer.txt          | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> index 6f1f9dba6e88..49706cbef45d 100644
> --- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> @@ -2,6 +2,7 @@ MediaTek Timers
>   ---------------
>   
>   MediaTek SoCs have two different timers on different platforms,

Nit: There are now three different timers so maybe:
"MediaTek SoCs have different timers on different platforms,"

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> +- CPUX (ARM/ARM64 System Timer)
>   - GPT (General Purpose Timer)
>   - SYST (System Timer)
>   
> @@ -29,6 +30,9 @@ Required properties:
>   	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)
>   	* "mediatek,mt6765-timer" for MT6765 and all above compatible timers (SYST)
>   
> +	For those SoCs that use CPUX
> +	* "mediatek,mt6795-systimer" for MT6795 compatible timers (CPUX)
> +
>   - reg: Should contain location and length for timer register.
>   - clocks: Should contain system clock.
>   

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
