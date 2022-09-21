Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C17C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IT6JEcqJI3DFzEaVJ8dSJBsLw90K5SbYBxlXjJR590E=; b=ypHWuIlLwTuvcdtcLmOE2iM/Le
	JV0FcuYU1s8OVD4UBFsYxaWMQbiovnVhmDIr5w0uwIQeTns5yPUBzhX0R8dubELgB0oq0+LRhHXn8
	dLa4QytklH4c4fda9xuoerQ6vbGdv9MRxrjk3I/Qz/GLkzyqy5eGnuDA0mBIWePI/aM199jtZhJ7V
	z1zIqNpjKdwrdWeKtRxCGzzK5dxrciT3pPQ46bmCj3Pi3S2aVaYQNGxP5noKykEyDZhuXHKzRPURl
	BSO85STxArh2+tD0MVqH0ExGgnoG5CfnmpBKGG8V9ZuztCM6GiuHC6YNWqCtCGGdFHGbS5rhtMXeP
	Fh5BEOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavx5-00AMhU-Jv; Wed, 21 Sep 2022 09:23:31 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavpx-00AJ8B-Cy
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 09:16:10 +0000
Received: by mail-lj1-x235.google.com with SMTP id g20so4991059ljg.7
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 02:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IT6JEcqJI3DFzEaVJ8dSJBsLw90K5SbYBxlXjJR590E=;
        b=kMnkMAlTVSRXaxa1CyAz/HMUDwRyD9U4BpEaaKikw6N4NJ1iFTDxrhjw7uboupkrL0
         zLAqxDJlYkGjgglZI03IiCsv0IyUxo7phFVT84BzvEn7iKOn074+lxXiUkazAat0oow/
         EONLl5dEsYjdj60KoZc/QV9RxDwW3/iLExNf5b8hecUY6iubCGG2mnYeTSZXSs0uastY
         cR37koVvUkLR0gya6DMODh5PiGYFox50OEWzy+cmdeK2jmK6kBewt2aOucXg21o+NfBR
         VFKoLyZvhZH9dqwmMF6jAT3sdXE2rBpN3iz0dl+WvfECQmYyjw98SGdzyPedHFawH7Xk
         C/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IT6JEcqJI3DFzEaVJ8dSJBsLw90K5SbYBxlXjJR590E=;
        b=QJ0DPtTCXXxNzNrkL625trELd67Q+kJgTMc+vM7FZWT9BVq5K7mBZ4UT8a6rb5IDKS
         F/PY8ahJTnkcAj5Ac9xL+n2FCAoHN3mU6MfOCFc/ulhQD8kTtYDi8u0ApKJ3kB5CtuA5
         6DP5Uq68WjQpkFL54QDVe2+Yjjf5tRkIzTTfcNN3mQegwRbc62h6LubYtzckwE95IOe4
         SpEKE7+x98CV6YGLWlSi0UXWkbK5Fb5NjPNNlg9AS8UaI9c2F87hrUmKS3kMkaeFmOxt
         qirPe/O1c0QHhKwmmOYsfpyJITZjwYG7DGpIQjN0AUug+Vlirscs1c0sultGXdyD1zGJ
         zGJQ==
X-Gm-Message-State: ACrzQf0cjd+hQGjk9z/e4HBO5E/i+yY79Kfm8WGaXa83vLwfddSApCuo
	2gIW14idYw+Hh5Ws/k1abiI3ig==
X-Google-Smtp-Source: AMsMyM6fQd5NKg7ykrHov7EGyXfZT0dNc0fXfDekipf+Hm9POrmEODvkwmJcIv4qRiu8KBlM0SsfVQ==
X-Received: by 2002:a2e:bd12:0:b0:264:7373:3668 with SMTP id n18-20020a2ebd12000000b0026473733668mr7903000ljq.18.1663751766971;
        Wed, 21 Sep 2022 02:16:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i26-20020a056512007a00b00498f570aef2sm344276lfo.209.2022.09.21.02.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 02:16:06 -0700 (PDT)
Message-ID: <c5f1b3dc-e407-a7b9-f55b-0683b0e63a62@linaro.org>
Date: Wed, 21 Sep 2022 11:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 0/1] arm64: dts: mediatek: mt8183: disable thermal
 zones without trips.
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 daniel.lezcano@linaro.org
References: <20220921-mt8183-disables-thermal-zones-up-v2-0-4a31a0b19e1e@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921-mt8183-disables-thermal-zones-up-v2-0-4a31a0b19e1e@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_021609_558755_15FC4AD6 
X-CRM114-Status: UNSURE (   7.75  )
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

On 21/09/2022 11:05, Amjad Ouled-Ameur wrote:
> Thermal zones without trip point are not registered by thermal core.
> 
> tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose

No need for cover letter for single patch.

Best regards,
Krzysztof


