Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9D9C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z33rM/h/GlDJMPaTzwReos/+8Z/HNYbQEZfYG6DUeSU=; b=Nji9HC+108QZC5i1Y3UV4rfAP5
	McD9oeuj7YOLln7U3MryreK03UNt3zhL8iegLP9ENvlOpuCxaaeXckBCcFsqhGZZEp72y9izooB6f
	Co2zkG44DdFf25Sk1gm1+sWVUDkU/hzwiSHVtrYzFIL8MwfwmCEfyUx5NOOEqZ3P8nUSfDIdEd9Nx
	Be9hve5PyHjVqmWUXX5ZeX1UMYsuCCbBlBCjmUg2z5OXrl4AhfwReXLfdihYf1WglW9tIyivo3w3T
	kLJQXQ8XSKOvhrdVJACyheTpxHnAofep4f+Td35qNioyqdwlE/CCvkYUjaLX3tBP4rUvXhDC+o7YM
	Ua9DqUJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeFh-00CLnZ-UU; Wed, 27 Jul 2022 10:26:53 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeFf-00CLi0-1r
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 10:26:52 +0000
Received: by mail-lf1-x129.google.com with SMTP id bf9so26358219lfb.13
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Jul 2022 03:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Z33rM/h/GlDJMPaTzwReos/+8Z/HNYbQEZfYG6DUeSU=;
        b=fgebQcKdw/6LPwbhDVieKfEk9ZXG4yQLpXIdRfYG+Z5tRiOjTWbfrCwl8KTrNr6Myx
         TZWe2LK1bwwL5Ky7WiEpPMf2yG9JlOY0yc100LEFaLna4xgFVoe+MXLkm1Twh+lviVTi
         qfXrqMTkDTX5lHGeSA1/4lRRjIWCzbMX0LD1IZnd6G4a2CAGFOreLDh8ZM5vjM25a6kB
         dH5H3J0oPpVdeB2CKxKMBdcGelcN3vtnuV7bIm7P8KJNHnvxEJp2AcO1WAMgTw1Cifmo
         CmiVNplBlXOgpzOmM+Wlsum/AMmyEVzAmPxWfBTFYv5cm24MgS4krICxRrCjcYlUFcxb
         M7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z33rM/h/GlDJMPaTzwReos/+8Z/HNYbQEZfYG6DUeSU=;
        b=BNgfSylrLl8v/XcPghEZeBDFi9mXJfKGfJwlUIErL5QNUWokxA9JYppygxVZRFchMx
         CcUqYI3TwDlGE0EQo0oNbjtFLRimlSC7pmHyuMGk44cgMH2lPMFzGUwHGMVGbgJbZfEx
         18A1k8oOHpdhxL6xmCvA2pW5qgGPFY9WPRcHsgJHvQnCf1NIRyPsjHxTJJkdGNqOvkow
         iauaNmxdPoyhkeBlCOTzB9N7ykpcSaDeJ8//dfybkGbF9nN2+geKuG8tXArCs1WLQHDS
         jqt8zdjQMV1tuDFB+L/T/iajYcBjXsCuzHE4P+jHmsaGiOxO5GbGiEKXIaDtdJQsxGah
         bO4w==
X-Gm-Message-State: AJIora+DnjNDgvQvUBdHCNN4t76Fmyk1L4N6ZjdB3GrMGae5MC9wI+O9
	2rPAt0P9lS41f2bM9g05CMQ3sA==
X-Google-Smtp-Source: AGRyM1uzvrmok+B71SjJ0xUan/RKfTaBGV1waMaJriK6Oe72/2/Wan5P+Xay5aCki1HX5CUSZUfxzw==
X-Received: by 2002:a05:6512:1048:b0:489:ddda:d2a3 with SMTP id c8-20020a056512104800b00489dddad2a3mr8303696lfb.57.1658917602712;
        Wed, 27 Jul 2022 03:26:42 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id y3-20020a2e9d43000000b0025d83984893sm3680646ljj.68.2022.07.27.03.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 03:26:42 -0700 (PDT)
Message-ID: <a7230c4d-94dc-c0fb-e39b-50de971da511@linaro.org>
Date: Wed, 27 Jul 2022 12:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: spmi: add compatible for mt8188
Content-Language: en-US
To: Sen Chu <sen.chu@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Hui Liu <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220726103729.24525-1-sen.chu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726103729.24525-1-sen.chu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_032651_133552_0BF362B2 
X-CRM114-Status: UNSURE (   6.80  )
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

On 26/07/2022 12:37, Sen Chu wrote:
> Add dt-binding documentation of spmi for Mediatek MT8188 SoC platform.
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

