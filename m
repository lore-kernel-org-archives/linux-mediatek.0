Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D11C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cxae8gv9ghFQbgIV+zWyRPdnemR4uamP3+fIGQ0mcg=; b=mLPBzRTyMHKKKYyJr5aEDFLCHR
	LqZkqR+TUMdqSx+UM17u1RrMc186D+eAzPqtOo+h3PuyIpOZBKP3zV6DZT7Lu2wU3W5qXElCRetgq
	vGImY9Ig1yJmXGsG1bjqGXz5N1ZizW/LRjJbRtFdnM0dGZY799nDYlcBJOIux+0zlkF7q4ZTFhpji
	fwSatirvn0bxK9R+YVhO44CQXVCxcfgDF4Ic2xuZy6Qhw2lRwL0M+3e5V1P6y6JHaSShAeNUZEwGo
	SxjE1CJl/e45POAzrGXsPJOce9H0PXxlinGqYCr4wyBdgEIqcZ/4yYzsAuW4QxnFmcuVcmA5z3yis
	FeYvzHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeHB-00CMqG-CH; Wed, 27 Jul 2022 10:28:25 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeGq-00CMYj-3J
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 10:28:05 +0000
Received: by mail-lf1-x12e.google.com with SMTP id m12so25370721lfj.4
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Jul 2022 03:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+cxae8gv9ghFQbgIV+zWyRPdnemR4uamP3+fIGQ0mcg=;
        b=unGh8VSdM4z9dQYZaotpL1ryQAJtRKmdzXSK3lhFziwgOgZe58IRl0RU1pj8VkTn5A
         elkIrdMs2VY5NdRDjZBCbIhXsN345uxhPlh5ZP1qtRUK2TyCtFAC2JTjjUQTitPDQuTW
         ndu7gpeqDnv6duTHuQhEkaRTUeUNMpFXJ6plWHEN9eMebgpfaXswzpE3aTOAXlPUjPHU
         dI6WqXYBRGihvlz7jNAAgUGryEgy24P0r2iMYsRI1JkbYkyCGJqXNF8PYcxdi0voKRVv
         LSHfEQm/5CSEj6yz0fnjp+n1I4cfvwnNXJTZbQkih7fxli6WdoNi6u3ZpHm2qea4GjvB
         Q8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+cxae8gv9ghFQbgIV+zWyRPdnemR4uamP3+fIGQ0mcg=;
        b=ppzqUkdy7Ql5OES7Up78O/9y3wvqyOu4F91LDgfq0SUVCZrlopM33Ccp4JXTOVHyK4
         yetiyDTIO1yMmSe8Bn/iu72siVlT9c6xBeLatV9HuGhFXG4aLb85ezrEOGckZzoSfZhM
         wx9dN63iJ2Sj2oQs3KdWq+BPUhqZUZ72duaZ28aKF2Qjkl+9A0DyB7WUpqJfZ0Hy2izm
         WOhA8xwrYGE3KwM+iavSUqRj4eKLst3PDSqsOR8ckQrCrAA3WFynhl0p5T+o7lBVxfyN
         rlfcwKNEQVBzEYra/toyvgmIwEj6z3acA2mjfh4fIbjdYDjXTaj++Vj4EmlZFIpFDHS+
         MeZg==
X-Gm-Message-State: AJIora/AWOhL2tGlt3b1yBjDat5qvU2PpL1SLcBnN2d9Unn8Pf8LrJb3
	ArQMw9eDukPAuYi9XM33yZhrDQ==
X-Google-Smtp-Source: AGRyM1sl8aBw5QZ2EVsyCzqKkcJGvcqaRHRnIc4WpVubax801paGLnvD6aDVAIrlGAggKjSJkOFyhw==
X-Received: by 2002:a05:6512:1093:b0:48a:7c08:8d29 with SMTP id j19-20020a056512109300b0048a7c088d29mr8053245lfg.540.1658917680455;
        Wed, 27 Jul 2022 03:28:00 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id m3-20020a056512358300b0048a85bd4429sm2102539lfr.126.2022.07.27.03.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 03:28:00 -0700 (PDT)
Message-ID: <ff0341b1-e6a3-c2ff-4095-a6cc3641c82a@linaro.org>
Date: Wed, 27 Jul 2022 12:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/7] dt-bindings: mediatek,mt6779-keypad: add
 mediatek,keys-per-group
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
 <20220720-mt8183-keypad-v2-3-6d42c357cb76@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720-mt8183-keypad-v2-3-6d42c357cb76@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_032804_176892_2CB94464 
X-CRM114-Status: UNSURE (   9.51  )
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

On 26/07/2022 14:56, Mattijs Korpershoek wrote:
> The MediaTek keypad has 2 modes of detecting key events:
> * single key: each (row, column) can detect one key
> * double key: each (row, column) is a group of 2 keys
> 
> With double key, two keys are physically wired to one (row, column) pin.
> These keys are in the same "group".
> 
> Multiple keys in the same group reduces the number of pins which
> minimizes cost.
> 
> Add a keys-per-group property to describe this.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

