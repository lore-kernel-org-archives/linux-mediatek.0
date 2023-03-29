Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7204CC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BL2itQzukLRwkGxIdHjN1VJkHZ8v7g0L+3aB4SoIfhU=; b=cz+Rpi0bTKUFTb7yEGNe+zd8Yn
	5/X9+Lsq52VCRvSYzrmmGM8DwvLhAbquztwlnzMWViLcsYCQIg9yFYiPiVAYI0F8aBBDHagM84jvt
	Xzv8L2BKcBgg4hN7HBjNq3KV/NgVt/b6yUpr+YibB80y937EXwQhufydlt4Qs9GsRsR4gBTP3ukcQ
	jubmKqQxtKU5kgTqenrMgYwqThdF8YZ1YkRsQtQr9O1jWodpmxd3e6ifdC0tySE/6YYn4B20TaFnY
	MG9noND4KolZCokQWw8ys2wciow1zkPcFcpkXib9EakVUSt7DiarB54c/7b50qXkkJbdI5Hxv0he8
	cwRrMkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQjH-00H07w-2w;
	Wed, 29 Mar 2023 08:00:23 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQjF-00H06M-0Y
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:00:22 +0000
Received: by mail-lf1-x12d.google.com with SMTP id q16so19016695lfe.10
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680076817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BL2itQzukLRwkGxIdHjN1VJkHZ8v7g0L+3aB4SoIfhU=;
        b=yEec9OikNdut9qNOpXOS7YhiUrTl7g+qZgWu/lPjLyerRtom8d2ID1wb7ODdWSqG3M
         SQ1jF0GCZQii+ThZdpc2sO2aslJgs/Uai+NcZhQ+VNocgWjOATzme5tBTd3wgehQuB31
         3aukxeicKmfDAX4RDZEyitq5Ih7NSPW21FDNDn0wroOPYUoJIyaT5O0KDPZ2ce9kTJ9w
         V9lpv3e5/eFULKitL59D7zzsqLO/Xoh2CUtuecIjl2jNy6O9qUduu3fZ+mqm2rW63Jju
         3mhIypbLJ7U27cSHi3PCHPCubBkyILNXKavz4RcMGPvPp1gV1Dr0eFNtkZ/gwL8BXQq+
         3XVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680076817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BL2itQzukLRwkGxIdHjN1VJkHZ8v7g0L+3aB4SoIfhU=;
        b=oxm7y0YULKh8FIuUGQFxHCsAZrwXZB6gaUeAqecuuOyPD5zgu1pYyffsxfUCGP+si2
         ADpeUNf76x2AcV7Ta2L15QEbF00P/DAMPwbrwuHIdLoAxR/IcfygF/kyxZz8esquQcJ6
         U6vXtkXoJRmqsVkI38Ar7Qyf2oeMXv7CetT07jX0UjrimScNPSaJ/vneooHAgNpVhOq+
         FKwA/07bY440OKyr9MOamW5ZdbuHSNnOqL5V4Uu8z5P7Cpt2Rho1vfbl1WTse77c8cyZ
         B3mCQdWBDpcMkM2cmlL7qP7QnmuRdWCL2g++dZA+RV5+GZocCbZZH0bTpXaU0FIdjYrz
         Zhrg==
X-Gm-Message-State: AAQBX9cubURWjdHCU3htl0+NkjQxnkmiC5lrxjcRI3tlTX/2YrL5BV2y
	HiDEgwLZOA/S6RBQ6QU3J8A8Zw==
X-Google-Smtp-Source: AKy350buG4bPyFyMS83rhjniPHydkSePEYgBaTDKNZ48qvCPbrcmXETHLl0aQrjPXtzHeQHaEUYlUg==
X-Received: by 2002:ac2:5fe6:0:b0:4e0:a426:6ddc with SMTP id s6-20020ac25fe6000000b004e0a4266ddcmr4409082lfg.0.1680076817323;
        Wed, 29 Mar 2023 01:00:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h13-20020a2e900d000000b00290b375a068sm5361127ljg.39.2023.03.29.01.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 01:00:17 -0700 (PDT)
Message-ID: <24105ee4-4ad0-9aaf-566a-07033aabdf4f@linaro.org>
Date: Wed, 29 Mar 2023 10:00:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: deprecate custom
 drive strength property
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230327-cleanup-pinctrl-binding-v1-0-b695e32e4f2e@baylibre.com>
 <20230327-cleanup-pinctrl-binding-v1-1-b695e32e4f2e@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327-cleanup-pinctrl-binding-v1-1-b695e32e4f2e@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_010021_217488_00F700F2 
X-CRM114-Status: GOOD (  12.71  )
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

On 28/03/2023 15:06, Alexandre Mergnat wrote:
> Deprecate mediatek,drive-strength-adv which shall not exist, that was an
> unnecessary property that leaked upstream from downstream kernels and
> there's no reason to use it.
> 
> The generic property drive-strength-microamp should be used instead.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml      | 8 ++++++--
>  .../devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml      | 6 +++++-
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


