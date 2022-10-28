Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C129C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 19:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SScI5S0L2zJiX+Huq/JArdE5hfBhAB9KqAp9NCyBI9o=; b=H7Pu24oYKA6lyY3Wu7ovV62itP
	7mNf2Ti3MBIHCAdyJo8l1stc4O8+qaTl5H4uIVolrd2FPmx8m7JbdQHT6Px2yeMzzusi5wwIM1caK
	3Ju/hRLP9nvTuwv4irN4aGdwYSMnskzCMouEXKqO/d9eofX9U5SFIbvQSEapVoRWB/FXTBgx3r8Lt
	SI5K7nliTMvwifnk1dUshWNHrrs1GiyMZi9a/YQK8wCVnTOdZhB75erk7j0P4NL4LYBROnrmFQDpD
	+2lHFe/eynNW8mXWEIPrAh0Vg9yCNjdDwsXWvEiPKMjXnEJRIPuh4dHbg0e1ukqOuBDYLw6gNTRl0
	r0m6TqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooVRh-00238M-7H; Fri, 28 Oct 2022 19:55:13 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooVRe-00237B-Gs
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 19:55:11 +0000
Received: by mail-qk1-x732.google.com with SMTP id 8so4160550qka.1
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 12:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SScI5S0L2zJiX+Huq/JArdE5hfBhAB9KqAp9NCyBI9o=;
        b=QNsJfn4JCx2/by6jfL4AHcMYuDhGD1I5ZNC49C17hWaO14Xv3De+bFPWY/xI6Ue6rr
         Y1YGPMtzQFKJIKzjv6mikRd5y3GwepYK6/MLAnBP6LucWOyorx9sci1jXLitfxrFXFr2
         ey6upm5l0UyH9o49HU4+nYmSAyyK1M8H3CKX9B2EQqRsvE+05UaGksyM4W4JwBeMkHY1
         BCXiL8EkZrNkxkcTFDM+bynmNpHN6XRTsLGve3ljt5syITa3ajPE161Oxo2DBm6UIXFm
         A3L0Amlb0bojBfU3ewo2MBW4YOCAnnmeg6KGztsdQQ9372dT17rL5C4X48x75hfbLfI4
         SFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SScI5S0L2zJiX+Huq/JArdE5hfBhAB9KqAp9NCyBI9o=;
        b=1v6+68zHYsK3AFhsnbU3bPOZe70srOdAMBmjahD/2yPw9u4ZAovFuraWqPc0G/ttKb
         wi1VzvNtjGSMAphjB30eTQfd0f5AzMce+vOr7qwinRlQqTOM5K4FS1sYh4DF7YdvEfby
         Qm1NAu2kx92aJIBF4wAmKmeC10Ix2Pb9IckEUCgtmZtGxj8eUbgvO6iIbnEHiSl8brJR
         02OcZv95/2WVxhwhMEcEVPBPDI+i2uM2iMUkjVGhRn+GCGtq7l9jKw9s0uW1oOh7MAc4
         qu4pDRinfuXSxZ8J//cuN1Gp3rKGkHoXOgd+AOrIAd36ylheOn0ypSPmX5TCZxriHRKt
         1BJQ==
X-Gm-Message-State: ACrzQf0lT++ogNzBNIODeCtyFtSIBBdNA+jdM2siatjkN2RWsFm1JaUS
	PSzih+wFzoOdXApCD3apdCae4A==
X-Google-Smtp-Source: AMsMyM40ef28CAfMEXrKpVIkQ4L0OJahlWdUPU9M34nPxcffPVJNbnZHF/L56Klwr/2FzFOj1i5V+A==
X-Received: by 2002:a05:620a:e:b0:6ee:86e5:66f8 with SMTP id j14-20020a05620a000e00b006ee86e566f8mr741287qki.163.1666986909085;
        Fri, 28 Oct 2022 12:55:09 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id f17-20020ac84651000000b003436103df40sm2854204qto.8.2022.10.28.12.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 12:55:08 -0700 (PDT)
Message-ID: <07aa7a43-2ed2-007a-c629-a71449828f15@linaro.org>
Date: Fri, 28 Oct 2022 15:55:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 05/13] dt-bindings: pinctrl: mediatek,pinctrl-mt6795:
 Fix interrupt count
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
 <20221028153505.23741-6-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028153505.23741-6-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_125510_591611_8719CAA8 
X-CRM114-Status: UNSURE (   8.47  )
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

On 28/10/2022 11:34, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The document currently states a maximum of 1 interrupt, but the DT
> has 2 specified causing a dtbs_check error. Replace the maximum limit
> with a minimum and add per-interrupt descriptions to pass the check.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


