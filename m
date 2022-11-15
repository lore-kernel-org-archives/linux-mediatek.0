Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB3CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 10:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1JeqX5odSdiE9z+C7xfGPHj1H7CFKFZd62JsMUYziw=; b=x2KeMWS36wUhYLiwjQPxX+fYna
	Bp/vW0xhgi6GAMLz19cXJ1nnd0TE+8IuWYF2tiqI0XKcV3QsIaQdWrZiP77NTkCkg099igCkyepJh
	OBXGIgjXXEIn+apctPA2Pcuvj69Kakz3F2b1ZTju5fHWsBaNG4KhJlF8kNEXP9zMz2X2IMB8XFcoD
	OLiH4plSjbKC7WhasRE9zpF2E+A+1ZmwDiskBZzti07rjX/f3FHAfmUZJ2XxA1LyDlCdVuuupkrxi
	6+G3dcoyTq3rwpZrq62dYlJZwlzQ7ktFueNMkj+53OkmSVHa5z0n/bTiUaUGReipMRcfE0a/i4Vcr
	LJfTH3Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousje-009f62-S9; Tue, 15 Nov 2022 10:00:06 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousW4-009Xa1-Ik
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 09:46:06 +0000
Received: by mail-lf1-x136.google.com with SMTP id j4so23636893lfk.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 01:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1JeqX5odSdiE9z+C7xfGPHj1H7CFKFZd62JsMUYziw=;
        b=MJrc8NbiTdlLDGD2cQVlGwIJq1WMjvYF5NiLIIBqeL8kYw8rVh858vB5aEDpVfxVLs
         MZM978vFS89anAMKLhhThPII8gebNMTJ2OW/FLlo5XA1F76euMs5PEgz38F69xqA5bZK
         NOZOCazl6hao1uSdHoZebPFO8L/NdHjpCk9zHxcU7IIuAizAQw/oJ6rFom6gswehkAJR
         dRUjCyGCC4T0W/0T7gdSS1LrJhulckqFwR78KtOKdzcHdO83tZOVDGlPrYkMpO+pa8Uj
         p3VjwEdqGF3QV09RM89Gx3bZXbXzkGttHPPhu66Cp1RZPQsL1sYyB0jf08+Y6cYlgoqW
         wx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1JeqX5odSdiE9z+C7xfGPHj1H7CFKFZd62JsMUYziw=;
        b=y83Cl4kskxOnQGM64CuTt4ZFTL358U2MAoBYENa+7ZXZ94JegnNQ2kG0Ny4flxKZP4
         7acK71fWrc8sbfBJVVRvXM/tjvt8HMfDwH4vj1KdAidQEYfe2jhlMnDw3NgBF2MgPCyC
         Rd2GGs4p6wHQf8AcQR58Rrbsn6cnzXv5P81NJaZE9AcxgOx3kcpOPJCRjwQU7yPS6PWv
         dutsfxNqC5GS48MpF4IfAjHqAj410rxeR4HNf5LRsfzX8DZ55VwgsQ54KVpoeisBqe3V
         THMjQrBj0R320XG9nwqOpBGutAl/AGCI23p0+eBPYmvyjrdSq8jqBPX7MplBqlqGeEIm
         Hzhw==
X-Gm-Message-State: ANoB5pmBDjNU+vZNtc/DK+mph9Zh4fGQ4nKxyyEFoxnj9PCzTeiXyv97
	Ti1TycEATLo67tCL0M5doWZ51g==
X-Google-Smtp-Source: AA0mqf4YOnEtNhH9OjeHwVCGPWZiIhF5Y7O+6X5Fm09KD2pOC0mh50rSsWImI6hnrZ5cDgrqD/wv1g==
X-Received: by 2002:a05:6512:1115:b0:494:7055:b085 with SMTP id l21-20020a056512111500b004947055b085mr4910808lfg.109.1668505564078;
        Tue, 15 Nov 2022 01:46:04 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u3-20020ac25183000000b004ae394b6a6fsm2129960lfi.246.2022.11.15.01.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:46:03 -0800 (PST)
Message-ID: <817f4249-cc98-d3f2-dd55-4e26b2326884@linaro.org>
Date: Tue, 15 Nov 2022 10:46:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 10/15] dt-bindings: timer: Add compatible for Mediatek
 MT8365
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-11-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115025421.59847-11-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_014604_648392_40838592 
X-CRM114-Status: UNSURE (   7.81  )
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

On 15/11/2022 03:54, Bernhard Rosenkränzer wrote:
> Add dt-binding documentation of timer for Mediatek MT8365 SoC
> platform.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

I am not going to review this - please go through comments you received.

Best regards,
Krzysztof


