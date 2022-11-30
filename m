Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41AAC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 14:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w35jd49HPhO+Jqkn0712oB2y+7R5nYXhRRJ8iiiiBus=; b=vqM9yZKgHlfhE0xsDube49M/7b
	XP1gAvsXD89EvZ4pGM4vyMoks5ev/uRfPcMBygOD0mEnEODs6FPkd8mbw+l4Ps+V5purGCsefqR4W
	CxpFRhUeRWivzse8d6+t5NnjrojtZXuk2Ls5/zMxYgV1/gbZf5WyprY1Dxk6I5eZNvheTZW33Uw4L
	fYbffDtkhsUUgBt3BTP0sIeWS3eNRZuQ5bYiKT7ThCzh0EK/RSc7lb9Se7Tb8nAK2CGzEZuj4LORi
	dP4OkaFaB8QKUGeTIpvrXnypVoGo/1kDB3xXiO7p98xIGffMU/zRAm2XEXQERjcWzuQOG/XUjrD0E
	ESR2UTFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OAe-00Gvm0-SD; Wed, 30 Nov 2022 14:34:44 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0O9J-00GuxS-5f
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 14:33:22 +0000
Received: by mail-lj1-x22a.google.com with SMTP id d3so21099821ljl.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Nov 2022 06:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w35jd49HPhO+Jqkn0712oB2y+7R5nYXhRRJ8iiiiBus=;
        b=sQf9QPXHnJLO5ms9yq3mJa19QPCRxDiHgkuCupOOOnVwn/hNs5DO/urR3joJkyBpky
         Vvr8NxI8potWAj+yauWxbTn7o/eBvAWkDYd7Bv7+lKbk7rlqBjaFR9vK2J6I/Jjz9w4l
         Ok1f5qxKhUDqXlFpHTswJlz7tnBK+QTpVna6h1OESNxClbPQv7AmNc+S+HfpqQ008csF
         d1fbLtpUQafRh03JUyoZHo8CNVytb7fZV3Uu9IWs0+6tPkHcDsRbo4UZcnsTvUvy1/L/
         4d5JWGHdX4qENUsreyoMeL9cJd2Qd3I/Ca1d11VbwJeKBiQRTBV21OwEmS37XZuujvzY
         dL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w35jd49HPhO+Jqkn0712oB2y+7R5nYXhRRJ8iiiiBus=;
        b=QHDBOow56bx1q8K4WSBqOwoQyZq3hAgYCTya3AyVXAwb1CuXqfdwPGIFR98kcG1+EG
         R06QO+4uhw+ACRoxp57TKMIcXe6L6ap3FYROVvePsSF8y1mo94Os3EFZ+uR7ZRVWsEQf
         FlJa6TzLuc8AMwSY+1a4+nzmGvvyLbbWN1GcKoY3rkdeJWYl1aoz7PP21yvVxxJyNA8q
         lyeAXkSpu0TMs/9EoImn5HtrWVNX4WTD7PVDsx+e89qBZ5x8lW/fwA/4HgbAkz79T26C
         RAAD9vxhkpF1oxWc39lLV5m9oFaqoTTaXvrcn4P8L6v0oKI6Viuq3+dZ3RI3YaFpinMf
         kSKg==
X-Gm-Message-State: ANoB5pnov0Fjbrqd9RmKj8j6jrGgEFV4cYYtVzZRyd/dMOkX7vQriTBc
	3CWNonpJFqLWpwVSr0mp8rkBkQ==
X-Google-Smtp-Source: AA0mqf5EuFHOvQQ+d29A0qJ/hg77DBRn0DLxyzPRKkxCGimdR2KB25/MA7ihtCKVDWU6yit8fGpjdg==
X-Received: by 2002:a05:651c:904:b0:277:210:41d1 with SMTP id e4-20020a05651c090400b00277021041d1mr14659593ljq.507.1669818797203;
        Wed, 30 Nov 2022 06:33:17 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b28-20020a19645c000000b004a100c21eaesm279073lfj.97.2022.11.30.06.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 06:33:16 -0800 (PST)
Message-ID: <f7eb06a5-9c2d-568a-d363-4f70ffd0c581@linaro.org>
Date: Wed, 30 Nov 2022 15:33:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/2] dt-bindings: thermal: mediatek: add compatible
 string for MT7986 and MT7981 SoC
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Steven Liu <steven.liu@mediatek.com>, Henry Yen <Henry.Yen@mediatek.com>
References: <Y4dYpoVBmKZSaX2q@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y4dYpoVBmKZSaX2q@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_063321_233750_40495DEE 
X-CRM114-Status: UNSURE (   9.16  )
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

On 30/11/2022 14:20, Daniel Golle wrote:
> Document compatible string 'mediatek,mt7986-thermal' for V3 thermal
> unit found in MT7986 SoCs.
> 'mediatek,mt7981-thermal' is also added as it is identical with the
> thermal unit of MT7986.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> Changes since v1: Properly document both supported SoCs


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


