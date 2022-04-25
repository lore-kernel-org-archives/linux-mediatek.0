Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F09C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 08:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qRY9oj+PJOXPMf/jIt4LPdLxKcHDL8uOH5qyVj9aYoY=; b=M+aTS11utI48R9
	Pz8jpeXQxhHJ+0tXip5fgsr30GsnW49pRotRD8/oYtfwltk7K7xnA6gaXqA+lzSLzIjrivAR/1ojJ
	6bqIdXD7H/JWvI6D8UuH4Hv78IjFdV87Jq0tGLMPSkbEkNat9CnqvUI7S5iW0dJy3PQQR7eCSq1Mi
	lsKA1YFAGwoVQBPr9uDFy2EhbN3j+VXkJcyyJRsjUY8U7vdTl67cFbUTmFFQLbOiSIkMnFOHNaNOb
	rUosLRTVpC9BLiC+ZSAGRsbp/10hvNcHnGljjoHSa3H61D0Lw+teUZ8TErUuZWFVqmXnHaaiJltTP
	9IXUuh0+667PeYKwdM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niuGP-008lx0-D4; Mon, 25 Apr 2022 08:40:09 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niuFy-008lmz-1Q
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 08:39:49 +0000
Received: by mail-ej1-x636.google.com with SMTP id i27so28162310ejd.9
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QU0P/yAfdxW/XnE/c78tJbGnzMjRbqhHEjthPCSj6z0=;
 b=uKKuhcN10zjj5rrz8Ng44AmhPCp+HTfJhDmESFQEvFhtKVvzut4wXwX+gFe1UkPydE
 DceCNtbPYwS752H65OcgKMSFq2nrvLuXT5AIKDXoJxZdLU2gBud7LG8tK4bemyaHh2Sx
 hVA1nWcqKkeKhybwvOxb2T0YoMX/C8Vmc2c3F4+BnxtF5N0H1uq1mANt8pFZb/h7ICqI
 TCUeSxdE//BYw5wO3XJiCnlOdH/ikEPfvSxZW1QXHf9isRRZszCz/llXTDqdUv2kStAt
 +fv58RIKjAwUx+2fVM4a6VAklPEnGQA0YNTHhTQ+ovu0QglGZvLMVNniUibZFu+h72BI
 w7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QU0P/yAfdxW/XnE/c78tJbGnzMjRbqhHEjthPCSj6z0=;
 b=IXbT/Rf2VWXabLyydz0Kox8Bh37UECf6x0t1alHdRd6eUOmI7hBleZUzqdRqB3ZYBo
 AGMB3ssBie/Sh4oXyzUWtjF4Qxt+QEI7j6DcDjZCVWG7LKEUw8xRf+1gIEsJ5BFjNO4H
 ioxOmnxYl7Hgx1qnOKZSjw6ZzOsRC+qv0K1GgWV5b1EfpP/Cj0AevTcfJtF5lKXGeEPI
 XqYPDrJrc8iZoQvAKgHULFNN9TnmkNXJM4aWRbv48Ltj8O3lTcQ8GO6F4akTSIaUUian
 jW+HMOzn35GJnh1FsWssygNyQl4/uv1wHbmYX8HwF/GlVpkj16RPSupv2g/fpt9Spy/7
 w46A==
X-Gm-Message-State: AOAM532+bQ2oIiwqDjNbiQvl4a10VLePEx4P/50O2oMnq9PHtYwJk3zz
 2f8XS6+uVnsV6UTL/+xYngT+2g==
X-Google-Smtp-Source: ABdhPJyQUNqDfJDw3xSJNGHEn0eczeJmWdHT3pf53j2e9iW+bgV4YOfUt0x2JDGAg5L2QzbRAANsJg==
X-Received: by 2002:a17:907:6e18:b0:6e8:c408:1bfe with SMTP id
 sd24-20020a1709076e1800b006e8c4081bfemr15347193ejc.467.1650875978503; 
 Mon, 25 Apr 2022 01:39:38 -0700 (PDT)
Received: from [192.168.0.240] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 o1-20020a170906774100b006efef41ac0dsm3360787ejn.215.2022.04.25.01.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 01:39:38 -0700 (PDT)
Message-ID: <925fbd8c-d6a7-04a4-c5a3-ae9d84883749@linaro.org>
Date: Mon, 25 Apr 2022 10:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: mediatek: apmixedsys: Convert to
 DT schema
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220424084647.76577-1-y.oudjana@protonmail.com>
 <20220424084647.76577-3-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220424084647.76577-3-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_013942_128178_6FFDE8A5 
X-CRM114-Status: GOOD (  11.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 24/04/2022 10:46, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Convert apmixedsys bindings to DT schema format. MT2701, MT7623 and
> MT7629 device trees currently have the syscon compatible without
> it being mentioned in the old DT bindings file which introduces
> dtbs_check errors when converting to DT schema as-is, so
> mediatek,mt2701-apmixedsys and mediatek,mt7629-apmixedsys are placed
> in the last items list with the syscon compatible, and syscon is
> added to the mediatek,mt7623-apmixedsys list.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../arm/mediatek/mediatek,apmixedsys.txt      | 35 -----------
>  .../bindings/clock/mediatek,apmixedsys.yaml   | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
