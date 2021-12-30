Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C0AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 15:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CO35835Rk7EYuSfP/Qml38OduBbtPbnEts6csaXpYKA=; b=ER0MWIrAupSUDh
	ojY6IbE94FF9Zb8SXRyTy0sa/9dgqXvQP8aR3fIbN+EE7HU2L+6YQDComrI/XgT3D7O0CHVv6lwHZ
	UyWMN7X5xStT6BMssfpqwJ8oukHkIgvbQ2oaQxmAtcClT+peg4630hfcDjTYHKFH41T/Nljiuaoer
	DE+J2JToho2wDc/A1ItEMOfSaB9yWDNgFwUSTt95k2G4Knkhr13g4iVLkAylQRMLvPdcBqC0PFIQt
	geYpOjL8awbfHOXi9K5PY4C60mw8OtWLGuCztkPtrw/c0WPVW4+8yeSwM5XXgZMCxf91TxADf4dlQ
	6lX3g3lQn9i6LUguTZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2xNw-004eBb-Sr; Thu, 30 Dec 2021 15:30:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2xNV-004e52-QH; Thu, 30 Dec 2021 15:30:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id s1so51196672wrg.1;
 Thu, 30 Dec 2021 07:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1jof+DZebMLPiQc0TwDMmSnKuPJVGago0B+tjBwIYlw=;
 b=OZYYKWmxJBwf2rALtePHVS5iVQMWA2WaSnbsSEYQnasSAZbu2SogzxPvsH7rP1Z7GT
 UGJMXslRLv9dnu1DEgFUCQhuZmfavkZDCl1cKazBsWGvsFZShnCxYJ7dnOzbJMR8uxuf
 ilazXWBQFquKFYhUFEHXTR81dmAM0AETc+A+50T6ahvzFWkbNZwC+OVb8h2kymGRWjNo
 PMvMiCvY4ovqjukVwQL72U4imxJ0i/QtiOXJ3uoNF8ie6gcfa8K6LgMYuekZKw7zRMRQ
 BNOCziQY+5xLAWR2kxNKwmKTtBZ29pk//hWTqgCe2NgR9ZONCO2YeZHvjfMaHKnpusG3
 bKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1jof+DZebMLPiQc0TwDMmSnKuPJVGago0B+tjBwIYlw=;
 b=u7N9tpKNphfkLi+AZ13bxdX01/7ZuSepr/2JbCxdpOk4NuvB5n2ZwoIGMHtRg2eGx9
 odCjN8JGbJjoIzINW2GK4xFqlH4YnCYoExrn0K3/v/o5pv47V5nq3XEtCXblKHzAADja
 DWxFZ3xNXy2Xq3xoaefG42YMEY+/FlANA5U22PsT5/qng4PTZCh6WGe6A9V5Wm1fax3i
 pAbJwjSDPW0L8HtHTzjotCOG04HYhlhoYE0dWv++O7zLgT7ohTJvQjchBURaDf3v7TqB
 F5uUJUhEGOsCTXssS1fW6EI++i+/T2MEITdzkUUz9KIuGDw2iYuBDW+n3BZJL/Xd5RnP
 nEGw==
X-Gm-Message-State: AOAM533oB/ia6oWloUJw4wWTxvArRYxA2/PY4LquXJMA1Uyo9Omup4mB
 BbdzEOaPpLp1S0Vqo3/+fcDva9SinOJ6FQ==
X-Google-Smtp-Source: ABdhPJx5+OCjcspjRbYTsb4M9GjVMlH0pAjXWZCbNoB4HSUcvc6rFly+j9tntV0aChPYTZHYQgTHLA==
X-Received: by 2002:adf:dcd2:: with SMTP id x18mr25558357wrm.173.1640878202749; 
 Thu, 30 Dec 2021 07:30:02 -0800 (PST)
Received: from [192.168.1.145] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id d4sm23839556wrx.102.2021.12.30.07.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 07:30:02 -0800 (PST)
Message-ID: <98efb356-dc0d-fa7e-5579-7984f2bb3e84@gmail.com>
Date: Thu, 30 Dec 2021 16:30:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v20 5/7] dt-bindings: soc: mediatek: add mt8192 svs
 dt-bindings
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>
References: <20210721070904.15636-1-roger.lu@mediatek.com>
 <20210721070904.15636-6-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210721070904.15636-6-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_073005_902592_EBB9850D 
X-CRM114-Status: GOOD (  12.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Please add a commit message.

Regards,
Matthias

On 21/07/2021 09:09, Roger Lu wrote:
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/soc/mediatek/mtk-svs.yaml         | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> index a855ced410f8..59342e627b67 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> @@ -22,6 +22,7 @@ properties:
>     compatible:
>       enum:
>         - mediatek,mt8183-svs
> +      - mediatek,mt8192-svs
>   
>     reg:
>       maxItems: 1
> @@ -51,6 +52,13 @@ properties:
>         - const: svs-calibration-data
>         - const: t-calibration-data
>   
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: svs_rst
> +
>   required:
>     - compatible
>     - reg
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
