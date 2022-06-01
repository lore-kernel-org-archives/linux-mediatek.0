Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FA2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 07:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Me8hvoAj3IUX19ui6f5pAg56xmmWSTJSkgspHVZyOpI=; b=3asfoLRfIEy2kf
	UKCz9AyvRM6Fxbmk3mWz4cWPNsWRdRb2d03pPvt0sRSvrs4Ij9NQhy63U2PpURLE+6B3Kfl0C6Lwm
	JZzsrYPmNSg+1rSut5+tWX39LZ9HbMw0f2SBuwmel2yIM4WWQhjA6Ru3yDJe2nt5hujcb3UYp1jBp
	i88FMZ1I3Kr4pmwIl9cugf+WZvfce0Hh9cZVE+VeifVWcUu4YT5lsfUDbtM25yh5M6jdVmJtj7K6N
	fNHsRPbeAUfTIzzaAZcVdcSVBwl6iHhxIs2qwRV4KsM8NC/Ig/QO1efTZg+PuMk9cvrvU1LwQkiWk
	v/ZO8HSWkescoVkQTNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwIwO-00EPXH-18; Wed, 01 Jun 2022 07:38:52 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwIuh-00EOeX-Cy
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 07:37:09 +0000
Received: by mail-ed1-x529.google.com with SMTP id fd25so985753edb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 00:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VGujkgTLGJjJ+UW8ObqRqsyAB4WEAUQn5faiR07jbVk=;
        b=eyS+I6FEnnSZ8vn2minglzX0RsZyoF9Qj5V8Mh43eR015TdUWXV4qkKWOZX2lZeySE
         t7BZBTp+ir4baIug9pll2zWzvszfRqc0r5vLzK1maxAcIdwZ/iaA1Isq4KwlmslVPRYh
         MIoVcBzLyZGyCFwXmKgLxcLRCyyiq88Xgxjiq3FFvEx5MmyZx+OASqZcPLHCKnw0JUjU
         7A2ayEZqWCb7MgWHsnp8p8rpoMQoKD4IyvQ73+Lcsl9Mj4iotCbbp0u3KSqjjZacai+Q
         /bXpn9G0c8CDLyqR79vDzIVBrNyJ35XAvFM05cJlklgGTzza55YihjFCrxtX/6ii/mNt
         whSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VGujkgTLGJjJ+UW8ObqRqsyAB4WEAUQn5faiR07jbVk=;
        b=WQa5Fl343CnbhER4dxuCgZ6ouc6vDObZNc2fGhHSegCsqyTRY6JNV4sNalwK8p/IUv
         czqjbaIYwHu9+KXDewLZbJ+YC+QsFwFegZWVAAXvNn9v7Ben6Fdu6lnvhMr3BAwT2306
         GOKrkf+MzxzPpoCj97v5aH37jq0KCl9Y3Wo5rVM9dr4CsZGA3yC/O1vAjjBhjjqLv7Oo
         /q2x+Z4608P0K5ZkpvrRKO6Gvd6coSQLewY96q9CWeaTtnJLlQVLTqM0wlk0pGOSXQtu
         +a5mhE15uWAX4zltcY4Lmpe/8kxiZJvR46B4dNXoJcEl+xOitFZ0xbbKpqcxwErVN577
         11rg==
X-Gm-Message-State: AOAM531lWEg7bcaezvkSU1Hgk00t0fh7VRSNeYzLMtc2qZOuX7Qk03yI
	rolAJrAjhIf/6KGsTVZDrjZ0Jw==
X-Google-Smtp-Source: ABdhPJxcXWYO+A4vQR4Q7Xl2APBu8dwgsKRiYU4keddDiGzFAh3Q4PYTBvmzIZbnnxHwvAbJiIod1w==
X-Received: by 2002:a05:6402:48c:b0:42a:e585:103 with SMTP id k12-20020a056402048c00b0042ae5850103mr68634819edv.375.1654069026243;
        Wed, 01 Jun 2022 00:37:06 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a22-20020aa7d916000000b0042dd4f9c464sm495356edr.84.2022.06.01.00.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 00:37:05 -0700 (PDT)
Message-ID: <dcb8c59e-243f-11c8-f10f-e037f9bd2e8f@linaro.org>
Date: Wed, 1 Jun 2022 09:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND 05/14] dt-bindings: backlight: Add Mediatek MT6370
 backlight binding
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: cy_huang@richtek.com, alice_chen@richtek.com, chiaen_wu@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-6-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531111900.19422-6-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_003707_496725_8A685B3F 
X-CRM114-Status: UNSURE (   6.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31/05/2022 13:18, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add mt6370 backlight binding documentation.

Please apply my previous comments.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
