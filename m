Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD79C54EBD
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Jan 2023 22:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSyezriUL/lNJCBbCnrFB5rH1MXCIbx1ORje4SC5K9Q=; b=n0h82Askp9wiYBxDWf1EGbFvDV
	IBIL7XoJzuQZBUBkXZ4VVxF2I9h430BiDNUad3CX+g1Y+Dxh/QkFSbKr6I+XtZzPyDh/Y9h4MwW0p
	GeN7PjAfNDfB1VUt2adwOy8vBnfQzdy0jdY8opxW9vNhQjMjclN5OxAbnDA7zIlS/1YUbSStZ0UJa
	i+/L4iLSt3ppFo1FcIfuomYFjrmCq5PwerAfsx4RfC58f4S2kZJnUeZtOAhYPfQmQGAmpsutp0Hbk
	B5rDmpHmSuOk0yeWVI1TAUG7dqw6C0GnbcRjIR0Ra+VXBm+IGZKDkK+BeZ0e2QcaATujIFuRF/PC9
	ATlF9tCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEdp0-00FyE6-Qz; Sun, 08 Jan 2023 22:07:18 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEdox-00FyCb-17; Sun, 08 Jan 2023 22:07:16 +0000
Received: by mail-qt1-f172.google.com with SMTP id fa5so1209827qtb.11;
        Sun, 08 Jan 2023 14:07:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSyezriUL/lNJCBbCnrFB5rH1MXCIbx1ORje4SC5K9Q=;
        b=es2keTY2sNd2wHX3r9k3M3mFRKLDwO/QpR+N8ngI23KLtKqbf4U7+mpdAa/a5AnfB6
         zRIMGpZil+01isay+hHYSSvJ3qFpj0h/bgPMnS3LA6pEISczUcGkCJ/9IT3C8/SA47Nc
         VDkvoMiYG0zz/K2/t36lwjkXZoDPn5Hv/i+jWg50+2v55NT4A/WuQzt1V4j4khfpXLYC
         8YY3CLtmJG8fo8Yf7suE5+YX02dIly8hUVkCwGD9CRdzIQMX/L2WCz/POh9e3f+Qit09
         ztIuH8Oi2M6JC/p4QJaXBMhQbglo0LNBG3UWZ4hjB6Z7mXhjaHin66+WTIicQPEeh03j
         u/Dw==
X-Gm-Message-State: AFqh2krruauqkGihDLeqB8OFVFBKCVXEjz33MoVlY1vHqjXVYXzbZYRt
	a414P3e/I+05S4FPFbJ3dw==
X-Google-Smtp-Source: AMrXdXtiEZ+bMuMU+KeikknktjQhAuTk6bddM96Sps6T8MQGto5OfixHJF2B/USv9hnPuMQKfyfn5g==
X-Received: by 2002:ac8:4e04:0:b0:3ab:5dc7:6bf0 with SMTP id c4-20020ac84e04000000b003ab5dc76bf0mr85234496qtw.36.1673215633610;
        Sun, 08 Jan 2023 14:07:13 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80a5:9b51:39ae:24d1:33f3:811e])
        by smtp.gmail.com with ESMTPSA id bp32-20020a05620a45a000b00705b4001fbasm1425450qkb.128.2023.01.08.14.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 14:07:13 -0800 (PST)
Received: (nullmailer pid 345158 invoked by uid 1000);
	Sun, 08 Jan 2023 22:07:07 -0000
Date: Sun, 8 Jan 2023 16:07:07 -0600
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, Fabien Parent <parent.f@gmail.com>, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 1/8] dt-bindings: power: Add MT8365 power domains
Message-ID: <167321562678.345108.18031842904012970078.robh@kernel.org>
References: <20230105170735.1637416-1-msp@baylibre.com>
 <20230105170735.1637416-2-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105170735.1637416-2-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_140715_086802_B5BBE8AB 
X-CRM114-Status: GOOD (  11.46  )
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


On Thu, 05 Jan 2023 18:07:28 +0100, Markus Schneider-Pargmann wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add power domains dt-bindings for MT8365.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes in v4:
>     - Add infracfg_nao as it is used by mt8365
> 
>     Changes in v3:
>     - Renamed mt8365-power.h to mediatek,mt8365-power.h
> 
>     Changes in v2:
>     - Made include/dt-bindings/power/mt8365-power.h dual-license.
> 
>  .../power/mediatek,power-controller.yaml      |  6 ++++++
>  .../dt-bindings/power/mediatek,mt8365-power.h | 19 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

