Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53D2C77B61
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Apr 2023 15:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hacll8+yaet7lqpDVagmKNxxYLLu5u39JL1nBadScbw=; b=VrghLt3+UD+u/6mDEkffm6qQyc
	O/UcOV/aL1hwJaIVSIMARYq3w9VPFtiLyebvIz/DJIh7Ec3qIb1CD+IZcyqL/TCKdVehgj3hDiMcG
	UpDFMi4ePH+yixPG08LHK6NzRzCwYlo2VD94KTqofOdA1NRF4wqI7r6a6Of7DBCrVsbM0S9/pmWoU
	iHPJkuamCamI8EYqucwIs90kum25ChowSELWG+vJK2iEWaBpa4aDPfl+PpsCvzEopKrNoE0Qz9+YH
	gy69hJP4CFxsZTkEfF8hbAIY3LPwxrM3DNqJdomUmrPkQ8tvVW/bD11ao7hdzg5Gh87ErWrn/S+2/
	pjE5VWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po4jS-00E3hK-1z;
	Sun, 16 Apr 2023 15:56:02 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po4jP-00E3gF-1p;
	Sun, 16 Apr 2023 15:56:00 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7606e2d0376so168598439f.3;
        Sun, 16 Apr 2023 08:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681660558; x=1684252558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hacll8+yaet7lqpDVagmKNxxYLLu5u39JL1nBadScbw=;
        b=qJwLZCG2kjlFkuOacT62j2DLSGMVkMSvkWKuMjx/ukIb9huzFbZ7FtLBaNyJQ+n9oa
         jgkDWa10wZ2Qbg/CTi/abpQ1PNf6tErIB1b1w5u8zfrhm5eHVVF2mzPAKQUCdBETs5vg
         K0RfQoKeLk0+Csepq6e+0HGRzjoCdx/SSEYJZFWCSccVfy8+M8zXlDQaw7w7mmor90V3
         YRpnNvEbHKHJwDYLcfm6bA2zj71r7NNYJ/H5YY+Dtvk4YqdITI0I2ZkQkc4ZU7kf3kcw
         KxkWz18GDmaMMLGAn+5O82KJ7IhipQx6X58EPQML+zD41s7fJm4fvzGoE5BpSZ7CdJfI
         MSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681660558; x=1684252558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hacll8+yaet7lqpDVagmKNxxYLLu5u39JL1nBadScbw=;
        b=iGghB+1gsuZfzjdEusWMfXxSNOz35pop1vW7YMpYjeikZLgIwlwa5vosl3GAQqGCyI
         Wo+j5314Z/s9E4NXBqDkxNHXUG2EcfMz+lJWh1kfgzZ/NTVsvniPwuQQCbRY39JPBHsO
         fRljab/yh+Ti+x9MIzrMg3AfvACrRVU5+gja0kN7NllJFr2+VGJHaYJwU6QrY+D/TqDp
         pl3IMFcqWM7h4Z7rKmME7givrR5FDjzZHdEXWw8SofXhqnHsWKRsv8k/y4YgR2O6HqYJ
         SGEDielqfvefGwByXkjI2NrC0E0fvlF3/D9tw1lz6hQiKLgiviRC6kLRX5sNNS1UhChb
         kNrQ==
X-Gm-Message-State: AAQBX9dWUAMyejeREmIsZHNlpqGnq522dBRImGZAyZxtH4a1Ynf6DH5K
	cbtBEPLswVfnl5Zdfai9css=
X-Google-Smtp-Source: AKy350bcBAXoqSlGftfK2IcoMq6UqJp6qXR3y53cZ8bxc4ZyTZGOTYw4lFyE5OiUj/bZ3y6GdgxQCQ==
X-Received: by 2002:a92:c088:0:b0:329:4a17:4b17 with SMTP id h8-20020a92c088000000b003294a174b17mr9506677ile.21.1681660558139;
        Sun, 16 Apr 2023 08:55:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d134-20020a02628c000000b00408b3bc8061sm2711163jac.43.2023.04.16.08.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 08:55:57 -0700 (PDT)
Date: Sun, 16 Apr 2023 08:55:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: reset: Add binding for MediaTek MT6735
 TOPRGU/WDT
Message-ID: <ecfbaf67-de10-4c2a-ac80-6668ba465d64@roeck-us.net>
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
 <20230302124015.75546-2-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302124015.75546-2-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_085559_609558_DC6F1FCE 
X-CRM114-Status: GOOD (  16.57  )
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

On Thu, Mar 02, 2023 at 03:40:14PM +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a DT binding for the MT6735 top reset generation unit/watchdog timer.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../bindings/watchdog/mediatek,mtk-wdt.yaml     |  1 +
>  include/dt-bindings/reset/mediatek,mt6735-wdt.h | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6735-wdt.h
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 55b34461df1b..009ccdb60b84 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -22,6 +22,7 @@ properties:
>        - enum:
>            - mediatek,mt2712-wdt
>            - mediatek,mt6589-wdt
> +          - mediatek,mt6735-wdt
>            - mediatek,mt6795-wdt
>            - mediatek,mt7986-wdt
>            - mediatek,mt8183-wdt
> diff --git a/include/dt-bindings/reset/mediatek,mt6735-wdt.h b/include/dt-bindings/reset/mediatek,mt6735-wdt.h
> new file mode 100644
> index 000000000000..c6056e676d46
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt6735-wdt.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT6735_WDT_H_
> +#define _DT_BINDINGS_RESET_MEDIATEK_MT6735_WDT_H_
> +
> +#define MT6735_TOPRGU_MM_RST		1
> +#define MT6735_TOPRGU_MFG_RST		2
> +#define MT6735_TOPRGU_VENC_RST		3
> +#define MT6735_TOPRGU_VDEC_RST		4
> +#define MT6735_TOPRGU_IMG_RST		5
> +#define MT6735_TOPRGU_MD_RST		7
> +#define MT6735_TOPRGU_CONN_RST		9
> +#define MT6735_TOPRGU_C2K_SW_RST	14
> +#define MT6735_TOPRGU_C2K_RST		15
> +#define MT6735_TOPRGU_RST_NUM		9
> +
> +#endif

