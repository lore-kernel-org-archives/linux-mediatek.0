Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F15C64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4JhC2nWay681MyZ600/nV3QW4wK4jKvMlYS/Fga+0g=; b=Hg/jaLC5OczaFWF5kuD27bqtsz
	Il533pFdosluBgLbM0yREq9QPMWJTOq5ZH5GZ98IAET3GiQjHtD8mxb8aJHVZAbfdgq9CE1vvhip8
	7Y8gfohWuqhV/HfmFJ1PVDqiErYQ9MehKUP6aUAxs1bwv+hRx3RKqtN5SJ8SzIgAyWjYfbD7jjACn
	U+DG8E0c9YYpjbbIW1jk6J0AI8X6WtbuHSPn1REz0tTfQT6G02SYvd9h/iwzrfd1k/n9RgWT1vxwh
	REXUGgs0qP4Yjh3i81xxCesun8Qu0X7VJnaTM30ThuunPuzCg3ww6Zs9l1uwCrjJOcBrvwI407uAL
	ouLOqrFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYgW-008lU8-CC; Mon, 27 Feb 2023 08:16:36 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYfd-008lLJ-5O
	for linux-mediatek@lists.infradead.org; Mon, 27 Feb 2023 08:15:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id bv17so5226905wrb.5
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Feb 2023 00:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T4JhC2nWay681MyZ600/nV3QW4wK4jKvMlYS/Fga+0g=;
        b=HrrgkbGG45vP0425yqDd/ojN0/PrHyRlPGxvZkkHn3k2S22kizVxn3pKE3ca9bmhRx
         FIIQ54GzG2GMZJMy4+mYMScSUxt1Uf9y54JjLNAD/qq1O8c6u9FUmhOooRRylmm+TDmT
         Xo5aHGjPSdBohi+w68qWMnSPPfXX+DT6QAYx+X+FgKj0Z7a4XwGyluNkghKuNeDs57Vu
         EkPB9IBIieYIi3TdVzW8NhtUJ2D3nXb0nkBHw8Gp/ksYOY6yyr0oWnODqm7lREh7Q7MM
         u/smmXzD8IifvROiO2feiK/Y4BWrXmitOuS0iRQrcCPFLDe3AUbcTcPebYgLwO4OxM+f
         a0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T4JhC2nWay681MyZ600/nV3QW4wK4jKvMlYS/Fga+0g=;
        b=qVr3r7g8vjdK7RJy15HgDRIiK5SCKx8Wmub4U5RmpJjLhSRk/RUfNMjsbIZnZd9Hrg
         23sMs6LUoCRS66Zrrq4PyFcyuL4Jrfo/ymbUY8S52d5LCPW+5IApaWJHQ5ogicqAvujO
         CZyt3twdwW6QGKuxecQgemq2BhuuvWtIwOZeI/S9MUOiw5Nq1n+uwOnEVw7ab6kWkzvW
         +QZt+JalA5EYMNKShgNYjfpVVMs+/j4DyIn8F8hF2XCbQicXGx3Y7G5PsFcS/2LhOtzw
         g92OcP+4unWBMrGfe8r4/YaNLG+xYVQYzagsB2Y9O4go90XIxuuGpnZUlIJk6P675bQv
         ziMw==
X-Gm-Message-State: AO0yUKW5QVyPD3bmscud4WzZ/YpqoJrBj9WRDyH2ZieZFYT/npEC4wlJ
	BiNBRdsKTw1I4xSQtfn/piuSgQ==
X-Google-Smtp-Source: AK7set+vvGFePt09tzp4Z32rFN7rkY2KHpQe3puGsiU0Rn3K+1kR6q98QfhqZizoskKxgi53ge2EKA==
X-Received: by 2002:a5d:5004:0:b0:2cb:5b58:766 with SMTP id e4-20020a5d5004000000b002cb5b580766mr1922362wrt.51.1677485738626;
        Mon, 27 Feb 2023 00:15:38 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i2-20020adfdec2000000b002c71dd1109fsm6363230wrn.47.2023.02.27.00.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:15:38 -0800 (PST)
Message-ID: <33806330-a274-c102-8b47-4b8a25422d38@linaro.org>
Date: Mon, 27 Feb 2023 09:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] dt-bindings: soc: mediatek: scpsys: Document MT6735
 SCPSYS compatible string
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230225101629.264206-1-y.oudjana@protonmail.com>
 <20230225101629.264206-3-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230225101629.264206-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_001541_385395_E75AFA5E 
X-CRM114-Status: UNSURE (   8.71  )
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

On 25/02/2023 11:16, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a compatible string for MT6735 SCPSYS.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/scpsys.txt | 2 ++

Previous commit should be part of this one. It is logically the same and
you cannot merge them via different trees/branches.


Best regards,
Krzysztof


