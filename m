Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6ECC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 08:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPhJE6VPTyo0qcaO20Sn281HINRzDdh0cJ106EjQf1E=; b=vVwIuyg6lQB1xCG4rWsKpBnDd0
	uXGT4l37BQiqaQ8oCF2Jm1JdukCi6/XHfV25c28BYtEYv+vlv6zu4CVOLWbw89u5eNYQA+VapB03T
	8Cig/60ip/7nhrtP+A0WnK77SbqE8KbonxUkaUxrgYgfyq5lDL8YTgYb+RQhJoJnh2ky4xWi3xx1w
	MLG/oPrzgXe6YGNhWxdDmk4YLVHs6QpljYV9JrqNvCuGd500Ait12wBbISiFyPT7OHnznYXXmn339
	f9pi92c1bBTl7G3b/BiRuIGTqdz7ByY29kb1wZ9+GKD1pV5OykjWfiiIuvLu3pyJdsn3oR332cANS
	g2K/OaXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovwZG-002je9-Hc; Fri, 18 Nov 2022 08:17:46 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovwZD-002jbs-KT
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 08:17:44 +0000
Received: by mail-lf1-x12e.google.com with SMTP id l12so7016468lfp.6
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Nov 2022 00:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sPhJE6VPTyo0qcaO20Sn281HINRzDdh0cJ106EjQf1E=;
        b=ROvHAxbJ/IuPIP2V9+pObdDyhK8B+4WzRv7zamnhvubvuRQuxb/CHuBJ0nk7Z+cTHx
         FsPp0T2yJsa5MEq1P78Ds1LGKetgiuo1BdbOH9QDRjZwf5Q+veWRUyG+Kw97CUTMW2XG
         WGMl7OdONQeEVxFjCTVdPYDBLWjKIruVvYvBUPwbeX3PjaVt+6bUuEzfbVeB+dOGEkcQ
         KOMPfiRa6TUakJ47YGRM3Hg5eqKdYn+LoAsW7NpviQAPmXMpInFL08shmIW3VA3ZfQrl
         aNZBXfyv1BAWFz+VkzEzwGZlTbXzrjt0EY876LzSPb3JfAGs/piYzeTZ/mBIDFIDhEgF
         bBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPhJE6VPTyo0qcaO20Sn281HINRzDdh0cJ106EjQf1E=;
        b=LGDy8Pay9cCyFy6Ia2MwiySLIDJnmam2C/I1GnlS07zeEjAq+1KSkwRN4YoZjitU9Q
         CmTTrviR3XZSrTf9mG/P2ejeVuy/ub1bYt4qpQKnSEAkW74LQD0aOWe9GDs7lpdJ0w1L
         KIeUw85A/DSAmE+/LJutoFkZOI0v+AREkiL2AXKxxHt4AiJ6vgn5WKXanD3GAvbAe4Lp
         EGTEVaJRyk106yD2S6FgeXTScA8V05wxeh39nf01FsHKQhrgIMsLhDSUo++77fup4LtL
         L3q27ah1akf34/yw9zjTmDaI8Fuq0M+Q8yfWR81wKmtTY5OqLgSuE3jozrORMy8TKat2
         4oRA==
X-Gm-Message-State: ANoB5pk4O4NePD7n8yFNwxhSx3NaocAdYPcZ9NUJV8iBmRj6+jtCxvIN
	QeAVER7ThfKCEJoRsRrA68OWzw==
X-Google-Smtp-Source: AA0mqf4GUPLpKm7SefwU0ytUKYrPVdXOQuxVrXO3s0xQxqSx6/W95ez8orUQIe+uED2zAXLivIxQPw==
X-Received: by 2002:a05:6512:3244:b0:4a2:3d81:8aed with SMTP id c4-20020a056512324400b004a23d818aedmr1939706lfr.500.1668759459918;
        Fri, 18 Nov 2022 00:17:39 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b004b177293a8dsm560876lfc.210.2022.11.18.00.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:17:39 -0800 (PST)
Message-ID: <4e5e4f63-a950-f8f4-fe62-1982b66eb8a3@linaro.org>
Date: Fri, 18 Nov 2022 09:17:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/7] dt-bindings: mfd: syscon: Add mt8365-syscfg
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogiocchino.delregno@collabora.com
References: <20221117210356.3178578-1-bero@baylibre.com>
 <20221117210356.3178578-4-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117210356.3178578-4-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_001743_711786_A62A7B43 
X-CRM114-Status: UNSURE (   5.30  )
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

On 17/11/2022 22:03, Bernhard Rosenkränzer wrote:
> Document Mediatek mt8365-syscfg
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


