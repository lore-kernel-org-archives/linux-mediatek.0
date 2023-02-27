Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6FAC64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXjvdSe0Xoy2F99alaan33seTEDoFO78h4PoWaqWgOY=; b=hlE8w1FK/1sFu3WTWL+2acpq5y
	2B09YLgcMWuU5lTjVDZZ9k8a5I/lTKzfL88PCI4AU7Y2FrIh/4MUd4UunUk+b2rDfX2lPX15HpEpy
	TNxagUaSTUttx6OtpmMIctsZB9b+741waCTrVBIUsrvcXTpYYogBqRmwifvw5WC9UV2L6QptWkgW3
	fgNShoe3+Oa7Z3VOmU7xRDL9SQyNGozJ35xQcRXX0dS1HxpRuTzlFxC89mv2ZRM6+xojhcy1ytanE
	gGvlweQgllZFHOR/71a3AhNerGjWOr2Bdu41YHoYv/OJsVWpLJtCSQjLhvDhWP5lQZjA9uBuX+W8g
	V5/p4KmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYhR-008lsS-HU; Mon, 27 Feb 2023 08:17:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYhM-008lol-BM
	for linux-mediatek@lists.infradead.org; Mon, 27 Feb 2023 08:17:31 +0000
Received: by mail-wr1-x42d.google.com with SMTP id r18so5248778wrx.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Feb 2023 00:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXjvdSe0Xoy2F99alaan33seTEDoFO78h4PoWaqWgOY=;
        b=Lz4+9beKVbWGlNZ6JCP58x/xj/5GDQnJ5jCtQqyk+1Udl9BuMfMaqAUXJVrX2gGAWA
         H22mr9hUSs6gxP/dkX1KUIEXR3e6LG214vFsWVbuboi5zufMdpFYmshF4cwGF2NV4H0z
         qvRYWIvNKBbfobB6eeUdLDOkT0LAjGmu4KvfNxDHTvEse8d28/WUysicQIdl0aApCADF
         7J5mfxUFaThBrPciFhRLWq5t5tVGNN5vOglz34rOh4yJx5jBo9GxMZZyWytU9fihJRsn
         kOaZr0OIMAaAjnSkR9viY0q+ix5LePgu5IImhO7Rk0mYSW/eBZNbsSAZBts88SH9xCWR
         xHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXjvdSe0Xoy2F99alaan33seTEDoFO78h4PoWaqWgOY=;
        b=ivGxs+HbWlq99XlxorydVQ9tGuiX91UXB7KJo6pqGPnib634j2M0FIclCQ1EkCWUl4
         XlZBnpzXje/ek9/OLAXtt2IRhsTG/rZe87uezQX4mZy+cRUQDdEO5piGssJV9ffO2RJL
         XghK2XUGPfHv9bgrZLYmYtTy+ocOrHZNNNmtgInVoxWiQOusFDM3Ro6haIfkl60eSF2s
         jo9cNVt3onyDXw8yNNF12OpMuibKssQZJdeQaJMnXlpLahKFrVbP3u4EGVwdlVQ2ImmV
         jtgQbZ9UUJfjyprsvT6FsLHys8aRWCQ/wBSnRQRDBCvbjhTXFpckOqfXgsIjiqBmrbeo
         bk3w==
X-Gm-Message-State: AO0yUKUAfIECURolshxm4xldLaUUi/kfviv7EyQ13hnUl7h68XDq09u0
	y0NhIPa688Gx2GQsT2EHltDq5Q==
X-Google-Smtp-Source: AK7set+LGhJeW/YV/Plyh6BkEVwsi5ztKVwgCyYUJRw0gktnM8wdTkBmFtmQU+S6gcfBUUuXp8EDLg==
X-Received: by 2002:a5d:58ea:0:b0:2c7:d56:7d72 with SMTP id f10-20020a5d58ea000000b002c70d567d72mr13130426wrd.19.1677485846867;
        Mon, 27 Feb 2023 00:17:26 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c4-20020adffb04000000b002c70bfe505esm6324326wrr.82.2023.02.27.00.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:17:26 -0800 (PST)
Message-ID: <481a732d-8867-b811-e96c-caf43d08e9f9@linaro.org>
Date: Mon, 27 Feb 2023 09:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/4] dt-bindings: reset: Add MediaTek MT6735 reset
 bindings
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Daniel Golle
 <daniel@makrotopia.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>
References: <20230225094246.261697-1-y.oudjana@protonmail.com>
 <20230225094246.261697-3-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230225094246.261697-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_001728_430850_9FF08DE1 
X-CRM114-Status: GOOD (  14.39  )
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

On 25/02/2023 10:42, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add reset definitions for the main reset controllers of MT6735 (infracfg
> and pericfg).
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  MAINTAINERS                                   |  4 ++-
>  .../reset/mediatek,mt6735-infracfg.h          | 31 +++++++++++++++++++
>  .../reset/mediatek,mt6735-pericfg.h           | 31 +++++++++++++++++++
>  3 files changed, 65 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6735-infracfg.h
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6735-pericfg.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5323f71c48fb..f617042790ee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13101,7 +13101,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>  F:	drivers/mmc/host/mtk-sd.c
>  
> -MEDIATEK MT6735 CLOCK DRIVERS
> +MEDIATEK MT6735 CLOCK & RESET DRIVERS

You just added this line in previous patch. Don't add code which
immediately you fix.



Best regards,
Krzysztof


