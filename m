Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295C0EEB596
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luACkZMQYaAff8AQJIHA/Ls5QqC1rb9Wh8NKaWNzkDk=; b=jGs4a+Ueoa0aFYUhje60doOeB1
	Axox5xOO9r2WHDy/d07GvZvEUYTHPz2/qbe6gzGghXblCrQwY+iqx79hse++dzLaRPTH/pjyYb0Wn
	h34zYTw7reGnltBJtLo0BJlWNp5pT+KoR9GEmLpzAdYwp6rBM2UWI3OkNqnfNi5NEPwaQIx8C0rrQ
	ds8y+FgCa53VhQDlc3s3mQgcPFGw1JNbMR3Zjk70x2Jq88R71TBwqRAmrZMtLcv9tW3nAbKsk1GQD
	h2gBBwJ2hW6o48WJbp3CbdQ375Q61UCybrtVBW3gvXbhDBq+7A3jd8ofIe3B/QBpz3qPY3fKHiCkd
	z1QVykpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJaO-004poh-0g;
	Wed, 13 Sep 2023 06:42:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJaJ-004pmE-1L
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 06:42:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-402d0eda361so75235485e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 23:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694587365; x=1695192165; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=luACkZMQYaAff8AQJIHA/Ls5QqC1rb9Wh8NKaWNzkDk=;
        b=t/XASGQbWce0t66xvV+c0kcnhlmtmmdGDokZr+3CXJhCSJKNICY/prR7hvBy0DHWmT
         eXbir59sAJ7PUmvNoXeIR+RGz97X8DQBzdHnIrZ4HUIWfyuxUXTv0SawUprYge5pm4+S
         GNiVyIqfaYwT2C9gADGfQVFHbtByngYJZ8i9d7yeuEX3qPObVujRsOuYYoR/yDAi682T
         HCQVh3F/Abf8Cpqj5qHKr8TP9qO3KIfspSdmCv34lJeYAY/FJv38j+N9XLiiv4FVNRT3
         NWYXxrZIqzok27BWGSTXYOPFJrJ775C/IpbRs0v4PF7C9mdp0K6CP/3FOmYCTdtxEbYF
         r2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694587365; x=1695192165;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luACkZMQYaAff8AQJIHA/Ls5QqC1rb9Wh8NKaWNzkDk=;
        b=vU4QcFRlSOlp8KnRpXRrbeIV1+0NXMfLv6b934sYDRHqW+jqXT5FTGz9VVeHOk21TO
         mqu8DeNjz/tK3uKUMe6KqwQoMqzzMg3H9KNNLV8ScVPtEhtk/qfuL1Y6kxHmu5aRzlYG
         8bt7eDEhYGTI3JMkHAvuzzcOriAC0BWFHU8IQh+xgeJYvhH64ShhG1Bd2u1KNuQlBqGi
         g1PIyXZ4Tx0gXeMCeqEF03WACElPs7bYXKA++qf8dX1tcxejicw2yjFPD6Q8xf1jWbjW
         k1DNvKUzaBv3o6O+bZHnTVgEa9NDaWLo7Pw+h+zCpJyHsHv8JGXIYP9cOv1ogrMUpNOn
         wiWA==
X-Gm-Message-State: AOJu0Yx2n3N+H8PQgO5oKfUkBbug68IWr3Kp4PuPP7xKAFa8YlAWErfH
	0SYTdfE4jztSPl7a8QzX3iz1kw==
X-Google-Smtp-Source: AGHT+IEAIxQH5qvSmuuETYLt+QKKyHAu3o6+POI2RoUl/25iI03HCsIv5WiySXLmuGaNLQvvl6o5UQ==
X-Received: by 2002:a1c:7210:0:b0:401:cbf6:e5cc with SMTP id n16-20020a1c7210000000b00401cbf6e5ccmr1291026wmc.22.1694587365204;
        Tue, 12 Sep 2023 23:42:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id l17-20020a7bc451000000b003fe29dc0ff2sm1043821wmi.21.2023.09.12.23.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 23:42:44 -0700 (PDT)
Message-ID: <be7d9ab7-9559-3f22-cc07-6fc3e018ef37@linaro.org>
Date: Wed, 13 Sep 2023 08:42:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add mt8390-evk
 board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230913040449.29560-1-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230913040449.29560-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_234247_473488_58B0CBB5 
X-CRM114-Status: UNSURE (   8.64  )
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

On 13/09/2023 06:04, Macpaul Lin wrote:
> 1. Add compatible for MT8390.
> 2. Add bindings for the MediaTek mt8390-evk board, also known
> as the "Genio 700-EVK".
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


