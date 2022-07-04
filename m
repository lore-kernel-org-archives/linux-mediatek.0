Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9E6C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 09:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4B9YLkKJASUbF6SDeFOUfEsE0vnt4+YdnmVDhP06z4=; b=1764KYKt57dENvGdqLV2jpGzR2
	9jQ0wDPM6atErn5YvuccUv+4joAGqqsKltX0xulCyL28tAHkoiaxkgCCNpQDxfIowZITDN2zyf0Y4
	ybjINkC43KhQ22sxyDY+3lRGpdiseGrdQ74SYpz2ZcllMe8SeLafJc6caGb+JEjVZPqNXQMyfDvYN
	dLe10TDh4sGvAazb6RYMtCaBP3T0MFocFZrnubDSTzGJ4bAdw/3v5ZU4YbW2pU3Wc5Y8p6t+FRkLh
	sDfYzFjgSBTkuF0RwJwt5RpUFYoG2fztozTvCx/yvKJbCskjnqYwujXsW2xAuSgs5EsALD4jn8HUT
	Lsz2SxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8I14-006HNy-TA; Mon, 04 Jul 2022 09:05:14 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8I0p-006HAy-Q7
	for linux-mediatek@lists.infradead.org; Mon, 04 Jul 2022 09:05:01 +0000
Received: by mail-lf1-x12d.google.com with SMTP id e12so14655845lfr.6
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Jul 2022 02:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=n4B9YLkKJASUbF6SDeFOUfEsE0vnt4+YdnmVDhP06z4=;
        b=PYvq706wWC49R4jolMknaPmpRLaoYvxAwS/yrvpFklnZZejweFemyL+imVd3ZQHAkf
         2/oXHaA9SGkarCtUTpJuT3rbr6E8/ZVClvuR1xBNSKo+a8wG5DTug1kwbGjWuOCBcI70
         dWGUwdFSDfUGxCvJG/zPrfbQm+BbCyObhS6xtSNndCwmGipu6Cfuvu+r8eMks7OKGo0b
         2YzZ/37v4uOxttWU2JFcYvY4M9Qr68hL1wTP8MZfoSjc1J2+2NJTNQry+5XTQR6atCko
         dT/Z9yNTRRG/tHVo63yXJDe5gp8/LH7Off+y7xl7ruy7e2ZiSNNwjEwSUYfXcOFTMnzE
         rrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n4B9YLkKJASUbF6SDeFOUfEsE0vnt4+YdnmVDhP06z4=;
        b=r0OmFSdRXc5NnUsK/z3NTwxZlRQC43vwZwKttjbId8lRQZgJvbpf/g0Ha/EDjOK8Aw
         S7JZZcbliFDz4bzQW5z9RmARc84w/Kw1EChog9TGbz37T+mo1tUky5TcVI0yC5l1zyNL
         fL9I1INPXglUC176yx//QgQyVeU9KOmHT0EbW+9e5uCCy+4WgNjEWzSgvwfOKnd3c2pA
         j7EpIVg2bJQEjH6Snpz01vW3pYlaUtiiZlzgN/tw3zT2jmVxd76OZl9QySHasNpOiLUT
         5E46538inh+RJEqUvDkeS7tKEbDN1Tlrtw9GMNHaqxLQfLZsxLTaCZ9bGGb8tpTmSptk
         P2Ww==
X-Gm-Message-State: AJIora+wyvKumSweag/E/0IjZ3+PHkkbDtuqfFqh22M/ioZA9e/jFqTB
	rfPVjO5HXymLgA6RBASyDsCLFQ==
X-Google-Smtp-Source: AGRyM1sLHkpEL/e3FbHHjgOt2aInxHNlxFrHeEIa0L1/Bz4GYdHDD1jIwPyFeJeq+08viN1qBJk27g==
X-Received: by 2002:a05:6512:acb:b0:481:cce:3c22 with SMTP id n11-20020a0565120acb00b004810cce3c22mr17601128lfu.45.1656925495041;
        Mon, 04 Jul 2022 02:04:55 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id 8-20020ac25f08000000b0047863382e3dsm5024155lfq.215.2022.07.04.02.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 02:04:54 -0700 (PDT)
Message-ID: <4513594b-ece6-a4c2-82ba-d334f5c4234b@linaro.org>
Date: Mon, 4 Jul 2022 11:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 02/13] dt-bindings: power: supply: Add Mediatek MT6370
 Charger
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-3-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704053901.728-3-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_020459_877342_BC339543 
X-CRM114-Status: UNSURE (   6.75  )
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

On 04/07/2022 07:38, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add Mediatek MT6370 Charger binding documentation.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

