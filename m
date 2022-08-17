Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4A3C25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 05:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHBxTrGeV4uX3RKPj3kIhCR1qMWY5TMaO/ZMSAA+DpY=; b=yNYzb9iatMV6DtnItT6PW+M7wN
	uTQjONKfwwlvjyjpz9k2zZblBcsgfq/YP8AEX7ADodsh1UptKOk8JPRc2giJuCr5kskcMfZoCRpWy
	J7iUl/5stJaRyT4nnwHby9wloU9T/a5K5NXXt9qgTffGtLY5ShHCTkXGwYV9umYCG593E98+OINnR
	hTyzxAMPRGeTPfJGGTBqOPbCdsKJbgXULk6GfyeYVBydpLKFc2wrQsjOq1LbR5RXfK0+TmPMCph7+
	fI7Zj2kNQfLvfILWAiJil1TXIw+EhZqJGeyvIeBpDx6vm7ypfu1d/s1RX1nlBH4YLProSV7kcm54e
	I7iJIvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOBiU-00BD0F-V9; Wed, 17 Aug 2022 05:35:47 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOBiR-00BCvp-Ry
	for linux-mediatek@lists.infradead.org; Wed, 17 Aug 2022 05:35:45 +0000
Received: by mail-lj1-x231.google.com with SMTP id s9so12550556ljs.6
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Aug 2022 22:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=bHBxTrGeV4uX3RKPj3kIhCR1qMWY5TMaO/ZMSAA+DpY=;
        b=iT7SRCTQuPrgh4De5yQrnxK5ozQB5tyUZ8oxMXMRatGyyF1DzgWCjWenauP92iJRBG
         0VhHh1q803RGD26U/We6NvU1sSvyIzdR9HkK2SvYdzJ0KGMKL/AvkKtO5NFrfV2l4sV1
         OuMkSFqKT6N89GKjgdPtCdoxv12/4TL4pjpPdnEL8+YjaQm0F0ucrnz0YSNnxpxnBldp
         Ogxh9K57SD/lCxm8GQwbVzSvRm5nqFC0j5ukiJ0aET3Zt5Cmkhoy+fy9eHIJm/5NiVm8
         W+d5iP5RVYUm50MTv6UD99GR9aZqi1OYuBaw0XdzdCUNYOMqCvuNWnEOqPyM+dnGtf2G
         tEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=bHBxTrGeV4uX3RKPj3kIhCR1qMWY5TMaO/ZMSAA+DpY=;
        b=MmytwLwANaYKl9Y3OjNsfFm2TlYvfKjt1bvRbFT7CY262bVX+v72rrsiOE22wi5H4s
         py5lHDKCh2A2TvZThSiKF2q07x1ejUDduD4UDdrm2/4JcSQ81xJ22FrMWjulKtRsIhmh
         O6w8dBVm/juk5nH95PfOpmuWa3u8kwhcR1fGYQAvlsgG0XOUE9bsWnCbQXBGsMWHX/Hz
         jy/5Xu6lWBhttQs3GbEgAqJmVugTLJt1XoP0mOdakJAb+UAxW8lyuTjSp7FEF/GAmbGL
         8toZWVPEA17wgnSmTprxjmX/RZHmC0Y3bo0Rb6WMh1MXebqhKPkD+YnmkvIS5HkK6E14
         /DSg==
X-Gm-Message-State: ACgBeo1XSDHo+7pgf34vyOMaapFSDNG4AP8Jp/C7B3hP9L9K/FiRN2Sf
	xGxPl9KAsTdVP3EfpKU0Rb6z9w==
X-Google-Smtp-Source: AA6agR6gdlTnSi+flxS4mgsv/fvJDiQHfefYmbTiI48/+uMiUtBIk45srSbYy5of8xoABI8nx4CUdg==
X-Received: by 2002:a05:651c:c8f:b0:25e:4e3e:18c0 with SMTP id bz15-20020a05651c0c8f00b0025e4e3e18c0mr7733803ljb.115.1660714539695;
        Tue, 16 Aug 2022 22:35:39 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1b1c:14b7:109b:ed76? (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id v18-20020ac258f2000000b0048b26d4bb64sm1579335lfo.40.2022.08.16.22.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 22:35:39 -0700 (PDT)
Message-ID: <786f0f8e-7f7c-2015-dd78-b2961b715d66@linaro.org>
Date: Wed, 17 Aug 2022 08:35:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] dt-bindings: pinctrl: mt8186: Fix 'reg-names' for
 pinctrl nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Guodong Liu <guodong.liu@mediatek.com>
References: <20220817052615.27153-1-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817052615.27153-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_223544_030382_DAEBA84F 
X-CRM114-Status: GOOD (  10.49  )
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

On 17/08/2022 08:26, Allen-KH Cheng wrote:
> The mt8186 contains 8 GPIO physical address bases that correspond to
> the 'reg-names' of the pinctrl driver. The 'reg-names' entries in
> bindings are ordered incorrectly, though. The system crashes due of an
> erroneous address when the regulator initializes.
> 
> We fix the 'reg-names' for the pinctrl nodes and the pinctrl-mt8186
> example in bindings.
> 
> Fixes: 338e953f1bd1 ("dt-bindings: pinctrl: mt8186: add pinctrl file and binding document")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

