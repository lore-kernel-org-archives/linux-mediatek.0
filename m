Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB58C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 15:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GK+kN47VRDh5Rd9IAtghxyhLdbPgGlBTCLcifjdKfY=; b=rzVSjYGC5lrjrT+nw3eGbu7nD9
	NKWjewfUuy6W24b5zWgLKqKpPLSN+WwDWccydqmtlWuw4cKTNe+V8yWtTQ1VzF7TeTCAP315W11gF
	3bLnYrrWYt2XhxXFcfC62DSwV8QrEL0CCxw3iJ+eM1rIBWtasxLz3j3rxkAJAdM7nkJf/EkJ2zDQC
	iwgnd6pU4U9pFu4Zpe6k/66dhbsEM5N/jS/XqOYfPpEELXtRPh76dFNr6cY3vfGPerKzurJK4OSON
	FWve2wZtr6MpWJhUtJ1TtTP9Wkl8fO7bA4wOm9kCFh6hBrwieZWVbVM5xHpislTw+NT3G09A2FzDR
	DEaV+06g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqcKc-000SUu-Sz; Thu, 03 Nov 2022 15:40:38 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqc5Q-000Lj4-C6
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 15:24:57 +0000
Received: by mail-qk1-x732.google.com with SMTP id l9so1317552qkk.11
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Nov 2022 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+GK+kN47VRDh5Rd9IAtghxyhLdbPgGlBTCLcifjdKfY=;
        b=CuVdKrpYE2rQRg37FPIg+JZrk4NzKKxt219BGe3CMQvQo8Lmp2ckSDbzhj0bEEUIDL
         fxTOSuzkB/5KrS//gXY6ySrTmRgRg8/Y7fvynh6m65Zh2OXxQ4VX2GSRl9UBvObPXaiB
         +vOZCa0xjXVbfTNBKAzOFM+Bk77Hb1sPLlBuXe4pMZ5UDc+2YdWojicrTPpwK/H61Iio
         yq7H5MfkITJRWQYoPFpDcBb9983wRkk5uycAbX1edw4j+1IfEOYvTWUb0TabE5T1YL68
         HomjjXu09Q9xuXt2iGFj5ybrYfCG6zH2HK1fcjAIOuAUFslSMbvF1EvI5XH6vconk6NT
         K1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GK+kN47VRDh5Rd9IAtghxyhLdbPgGlBTCLcifjdKfY=;
        b=wm/4dL0xlpE86Se54yqL8MpYoXiU2CBws1xN2tR7uoOCaYbUdxv9aqvigmToSr2iIZ
         dr0cTjvYII74LRl0rOOlC4935ydg5PBYwTNnTsDGYw/whA0iPtT1DRFjIhexq2B6wPAI
         UoLRA8rSpoLVY08mrx2quFHoEPsklpk4y3ntkB1rlqKBMxOrcEGZCL+0vmaDaCy6k4rK
         CKHFbg/9lhrzRpAaofonJBqxV3eHqNM0/xwwnIGTIMn35cwIQhtjUEVGqlwpbv6qBfN0
         q9OrqZn1KEAG/yjknw5td3bjYQk7yw8aoVs/zM3xQqMA7DbNEbLraHACS5sHHGfTYeLV
         pScQ==
X-Gm-Message-State: ACrzQf1P5vDopQs6GC7p5b0O200q88ueqATwUMVtARWBeqNNfq2ikJaW
	qbd/NR0LsJHUUnCBMbcKDpX6Gg==
X-Google-Smtp-Source: AMsMyM4JfQZmP8W7rxOWSLWL8ATCWGxBIJQoz0Nkbogfi2BmdP8tf0y5Xg2ivz3gto0bPNF2tfnghQ==
X-Received: by 2002:a05:620a:1256:b0:6fa:4c67:4d9c with SMTP id a22-20020a05620a125600b006fa4c674d9cmr10696457qkl.713.1667489095268;
        Thu, 03 Nov 2022 08:24:55 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id p20-20020a05620a15f400b006b953a7929csm907379qkm.73.2022.11.03.08.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 08:24:54 -0700 (PDT)
Message-ID: <a2b1ffe3-e2bc-25d5-f665-363db09bd959@linaro.org>
Date: Thu, 3 Nov 2022 11:24:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 02/12] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, David Airlie <airlied@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jitao shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: stuart.lee@mediatek.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, mac.shen@mediatek.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20220919-v2-0-8419dcf4f09d@baylibre.com>
 <20220919-v2-2-8419dcf4f09d@baylibre.com>
 <c91ee3ce-3f30-a3ef-bb38-8571e488b6b6@linaro.org>
 <CABnWg9t3w4o4rmNosvYCpqG-h8DESerajH7OsXEYofRf2kr1Xg@mail.gmail.com>
 <6bb3ab49-1c12-6863-a49a-2fd1f34de561@linaro.org>
 <CABnWg9uDki0ZtkxU1BPZq0ZU1mi4zFjasw+e3pQYb+Nv1MThLA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABnWg9uDki0ZtkxU1BPZq0ZU1mi4zFjasw+e3pQYb+Nv1MThLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_082456_551790_2912B3B5 
X-CRM114-Status: GOOD (  11.41  )
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

On 03/11/2022 11:17, Guillaume Ranquet wrote:
> On Thu, 03 Nov 2022 13:45, Krzysztof Kozlowski
>>> This is an i2c adapter, not a device.
>>> And as it lives inside the HDMI hw block, I've omitted using an address here.
>>>
>>> Is this valid? or should this be expressed differently?
>>
>> What is an I2C adapter? Did you mean I2C controller (master)?
> 
> Yes, a controller.
> This is an I2C controller connected to the HDMI connector, it is used
> to exchange data on the Display Data Channel with
> the display (such as EDID).

OK, then the node name is "i2c".

Best regards,
Krzysztof


