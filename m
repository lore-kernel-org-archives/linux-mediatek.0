Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98153C6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FUSLMud1/EUO2NdxXWv5FFRYsGvYVv9Bj/E6FNg3XM=; b=15hYhWzbrIiJSRBCFdQLKnvtsj
	Ug22pznF+AbWszVsdd3MHEPzr6XK3rHGOUZHOOx50KslAKuZSD2mx4MsmBpy+M70SfAzEvk66CFgD
	733adnjMoZVPCp6He3lvVw+j0a6xht9JPDHL3HjIetW+N5rxl0FoOrrfhtDkplgwbdaU+f9VjDXdI
	gsqeUN+019momg/IhGX5xKNyrytnCq5Q1c2VNkPoW05KBzJaYe8K9Q4INMTiHnYsDRchM80XBHmH+
	QFGhfWWbfeZxsYA9VpazFqGhRhAyxxkCR1+Uos65//E39gji29ZdreC13wzqKUy8jENbPKeBZtFIM
	foTSeK3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paeSv-00Ewxb-1a; Fri, 10 Mar 2023 15:15:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paeSr-00Ewtv-RC
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 15:15:27 +0000
Received: by mail-pj1-x1031.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so8060936pjn.1
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 07:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678461319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1FUSLMud1/EUO2NdxXWv5FFRYsGvYVv9Bj/E6FNg3XM=;
        b=KSYL0HeBee6gC3Ooo5RDvQ/NDo7NPFYFWoexV+6YlpPeBL6uPGEaAhIssTKs8/hOmj
         FEVHYrXZGi8/E6F/NRYAnX4IewU6GMRlWIQwRv/urg11l/hIiEaX4Ao4OMblkslH3T+g
         xtctco4x3tmMfWf15OmHVER+prZt8kcCIpGvAOlTc9cteSgE5YuzbfHtkckPXTqKJ6Ow
         VnezORrkqdvYUpUqdLCt5jFhQQOE0vOl3hALjZlWpMR2RnVm0WIBN0/oFOylw1QTGxWV
         diKo5pC9r3aWeEY9FQw/EKIxzy1GWafAFOAJi3rLsbPd/L3h1qk388sZHtIPBfR4A0z4
         dDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678461319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FUSLMud1/EUO2NdxXWv5FFRYsGvYVv9Bj/E6FNg3XM=;
        b=f3ZMGJkeIzMjmmcnwrhIQ/h3JQZ1c/L9Dm5W+hl/X+wxrsTOmg3wt8FIlPTK49ZWqg
         bmCXFZL6qdKploAHQzsc34xdxlxxgt/VgmozQ5v59NM5nfU5nyWeNdS18GsiftaMqNtC
         h9EXMoTE2MTq9MCIfYaPd++UaYAp9TaKcgtu3ebaIVF0EclW1g+s+eXmv9q9AiqmdEsk
         33b1LT0SzQRjWIn4BhKP1ygOK8ysGA0w1YbSlGrPW2Mki11cIttxRNTXw/FjLcMNXTRj
         xPc7KXusR2wirTrYz4v2aLN3NBdCOyAv7cdp2NuEjkaRrUhUNoZazgAPPQO+1bfMlvDW
         R+GA==
X-Gm-Message-State: AO0yUKUl9KMx+TYBhXsgWWAPGW0WcpNTP4DGAJspkQF8nZkN/gb+/WtR
	sqkWd6GcXx1tf382DZJ9X9hACLKcao7LJ+O8Xv6Xcw==
X-Google-Smtp-Source: AK7set8Y8SU2ADi3YJHj/fTmISh50U8e7aW35JZfQM4zz8PalMuTuLly1fUEosqA7lI1e3N8DnOnGTzVYF7XqEfZhTI=
X-Received: by 2002:a17:90b:1283:b0:234:925b:7d61 with SMTP id
 fw3-20020a17090b128300b00234925b7d61mr9645464pjb.9.1678461319609; Fri, 10 Mar
 2023 07:15:19 -0800 (PST)
MIME-Version: 1.0
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com> <20230203-evk-board-support-v2-2-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-2-6ec7cdb10ccf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 Mar 2023 16:14:43 +0100
Message-ID: <CAPDyKFp-2H_7G4bOjYHpXBHe2=8VTEwF3w6HmrPsOwKaZ+auiA@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] dt-bindings: mmc: mediatek,mtk-sd: add mt8365
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, 
	Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	devicetree@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_071525_902577_4F43288A 
X-CRM114-Status: GOOD (  12.88  )
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

On Tue, 7 Mar 2023 at 14:18, Alexandre Mergnat <amergnat@baylibre.com> wrote:
>
> Add binding description for mediatek,mt8365-mmc
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 7a649ebc688c..46eefdd19a2c 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -34,6 +34,7 @@ properties:
>                - mediatek,mt8188-mmc
>                - mediatek,mt8192-mmc
>                - mediatek,mt8195-mmc
> +              - mediatek,mt8365-mmc
>            - const: mediatek,mt8183-mmc
>
>    reg:
>
> --
> b4 0.10.1

