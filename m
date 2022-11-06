Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6DAC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDiDxLQ0rjb64xJziCsobO1Kr+/jbm6ut/9xmmhlli0=; b=Nrvik6weSzIcoB
	2JiVF0zpp22Gd65o6NdTiHfYFFG7uKD2ZAo3CAwpqB6KbaT3cSNiYpir0u57rV0i7EJLmwEzFQUBK
	OPOHC1ykScejE2wg7VC/Q0Gj1ehzhHqSXfHc+T0Gz2g6mKZ95fdUF9FEoItLyP7mnUSLw3Sz9kreg
	jRj1zyL5mUZfpJMBcVj8OxOZiv0nM5cKYdY3uSgBE55b7HNPC3RrTKWRhxGt5sChmWni8Sa7fuysR
	Gg1BhZT+vkvvgWL4C/FQkkNMdnSIVp+VQJqnGJPVleK8isdtphksDIqsxw6HXvVqYcdKHnthmy+oi
	GwawAIpD1CZEaRFIwp7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orcAy-007rbl-Vd; Sun, 06 Nov 2022 09:42:48 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orcAo-007rZp-QT
	for linux-mediatek@lists.infradead.org; Sun, 06 Nov 2022 09:42:40 +0000
Received: by mail-lf1-x12d.google.com with SMTP id be13so13042568lfb.4
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Nov 2022 01:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QDiDxLQ0rjb64xJziCsobO1Kr+/jbm6ut/9xmmhlli0=;
        b=BzwTsf7kgiD5xSMiLwVu/jxPwHD7Gndi5kHryjTT2GmoBt0IA4tVVvRxDgPyIV7rL3
         qM0Pk9ggBgD9GCw4a60aQXxCr9/RJ4gVqHcJ9vGFuKAglKI89FpK75RR7Cjvj2dO7oHK
         uQbQyIRnWkBP8NXjZUcmWdjMBthHIEie7zVKr0OyH/kdNvm09rwkxivRGEhv+6vpwRDU
         i+gMVszYcjMzdh3NYpZ58JFcOB9925VzonO6MG7+H4xl0FunZM2bR3WWinAGxGn0WRz4
         WaWJJ0vPnzNyBSLJcu7037hB8bqbmZD9BmScefbAG9w6Edhn9seedlGoadn8kXdQcRa9
         mScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDiDxLQ0rjb64xJziCsobO1Kr+/jbm6ut/9xmmhlli0=;
        b=2uJWrRWd6YEuW/nKpuRLpe9eTCOM2beoaEnQ44H0gTYVUrsr0q1Aa4QXbR4xFLx1Ad
         Ge4cd/ngjbKiYlR9F7WqEMUG0VranyYjpAvl3GjXmLhC27FDYNem5LcRwin3uTtGxcW0
         4LiIz0VsdAdWfO8X80wWuToKHABlZuz2plr/k6Acna2d8b25fS2zx4bKh4tl40ODTA3x
         8MHzGUNrTBgAG6gmD0ITmbvY279ZrurgVegFC81fi5JHw3zgpiI4c9zzzkH9TWl+UmCp
         hR955Y2vjMsPrR2ur83mMXxII9SrXGPpvLVzukIWtu7F2hZxHZzrnKoUz6cZFu3GAX80
         AY8g==
X-Gm-Message-State: ACrzQf1ufZXVTlfetf5T+yMRd74/ZJ4Xqe0QU1G8fWiRHgnRdBTlVVq6
	XmAL8a7TGAlhuEv+RblWN+f1OA==
X-Google-Smtp-Source: AMsMyM6Ww2G0QMg/H+TjQIQGbrTzVi08fyHtBFt5F0Gxp4QlpNE83Y4mhpN1b2aduhsBx4VzyepJXw==
X-Received: by 2002:a05:6512:3151:b0:4b0:efed:e3a8 with SMTP id s17-20020a056512315100b004b0efede3a8mr276203lfi.650.1667727756486;
        Sun, 06 Nov 2022 01:42:36 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id cf29-20020a056512281d00b0049496855494sm627354lfb.104.2022.11.06.01.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 01:42:35 -0800 (PST)
Message-ID: <c2f891d6-97c5-1952-2591-609e2478aca6@linaro.org>
Date: Sun, 6 Nov 2022 10:42:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/6] dt-bindings: pinctrl: update uart/mmc bindings for
 MT7986 SoC
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221106080114.7426-1-linux@fw-web.de>
 <20221106080114.7426-3-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221106080114.7426-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_014238_866370_A02516E8 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06/11/2022 09:01, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Fix mmc and uart pins after uart splitting.
> 
> Some pinmux pins of the mt7986 pinctrl driver is composed of multiple
> pinctrl groups, the original binding only allows one pinctrl group
> per dts node, this patch sets "maxItems" for these groups and add new
> examples to the binding documentation.
> 
> Fixes: 65916a1ca90a ("dt-bindings: pinctrl: update bindings for MT7986 SoC")
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v3:
> - squashed version from sam
> - v2 was ack'd by Krzysztof, but sams patch included updated emmc-names
>   and different structure for uart to allow 2 pingroups
> v2:


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


