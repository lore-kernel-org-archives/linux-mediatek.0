Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9447C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjdHED37H0OUB684Aslr4zF7ujtW00cOnAULxFJZi2s=; b=MgEEzca/mV/dTOFN96pkIWuRp1
	+RzrgcQfMePgY7wKixvUz1VrqZ0qXsTlKruBx2QobgrdWl+d+uAFRQqnxGxI4pWM7fdZzLDLz1Jcd
	Y6JxqI2Cynm06Ar7VF/bBQ8uHbRS+pvpHAdq0Lf7nQj8PY8871dPy4gBBWgxH03n8aQQtO8CluuYH
	eS/ArZ7JXCeBXf4xtycEVT+kq4FArXbw3YEwUkZkQvKEUnbU3hPkCtqxQ30hbwWguafrIzyEFTbJh
	6mZpAIGbn5IYy+yS/ElWuxHl/coqOE+eOXKoLKmtlunK1V3z2fADoUyuoAoMKBrQtleHMIrR8RbQ+
	lpKMaxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o71QT-001a8w-CF; Thu, 30 Jun 2022 21:10:13 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o71QQ-001a7F-8Q; Thu, 30 Jun 2022 21:10:11 +0000
Received: by mail-il1-f177.google.com with SMTP id n14so183183ilt.10;
        Thu, 30 Jun 2022 14:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rjdHED37H0OUB684Aslr4zF7ujtW00cOnAULxFJZi2s=;
        b=b6yan8YnvBNax1PW4k/w4MFQ+mGMt5yD+guKMOoiYONvdsik0D2c63FBQrTwdf/qEl
         s+LdY6XQ0HjCT1VEcdxdw24dCS0NPCSY8gyU09kumbB4qBhmBMNfQ2J0p5N1tdcNKhLh
         jE/vSVmmNTiq8T3rURkJO3ZOs3Q/92rtBNYJy8TbdnX75YtkeE6DXg9NnD+DsnIk6sz+
         P2UIir9oQF73yiBQZnk58AeuNQicpHq0AP62XzfXe78jkV9MAhjf2eBVOizxVOK0e594
         lSBfuV6Hc4XiDL6teuVIX6GsvWXx4oCS8NJs588j9BYq1RuF82/VPUB3YMPnr931ps4G
         ZwMA==
X-Gm-Message-State: AJIora8Zuy25QusGOK337/tR/6TNg6G6csGlvDhr4hwMwBVp4k6fb8KK
	Sq8MwYI5Y01uJ5SMVoBTkw==
X-Google-Smtp-Source: AGRyM1sb8JdYuHxyemtwGY0+ubzfkotm4D+9kKuqhtvxDwhx7morcyWKXDm1LlxKB6K0jnyQPNch7Q==
X-Received: by 2002:a92:9412:0:b0:2da:7fb4:435d with SMTP id c18-20020a929412000000b002da7fb4435dmr6483187ili.33.1656623408168;
        Thu, 30 Jun 2022 14:10:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f26-20020a02241a000000b00339f1d1c090sm8874407jaa.113.2022.06.30.14.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 14:10:07 -0700 (PDT)
Received: (nullmailer pid 3303222 invoked by uid 1000);
	Thu, 30 Jun 2022 21:10:02 -0000
Date: Thu, 30 Jun 2022 15:10:02 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: martin.botka@somainline.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, y.oudjana@protonmail.com, sboyd@kernel.org, bgolaszewski@baylibre.com, jason-jh.lin@mediatek.com, ikjn@chromium.org, rex-bc.chen@mediatek.com, matthias.bgg@gmail.com, paul.bouchara@somainline.org, sam.shih@mediatek.com, linux-mediatek@lists.infradead.org, marijn.suijten@somainline.org, ck.hu@mediatek.com, p.zabel@pengutronix.de, miles.chen@mediatek.com, mturquette@baylibre.com, weiyi.lu@mediatek.com, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, tinghan.shen@mediatek.com, konrad.dybcio@somainline.org, chun-jie.chen@mediatek.com, fparent@baylibre.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, wenst@chromium.org, kernel@collabora.com
Subject: Re: [PATCH v5 4/7] dt-bindings: clock: mediatek: Add clock driver
 bindings for MT6795
Message-ID: <20220630211002.GA3303158-robh@kernel.org>
References: <20220629110254.184213-1-angelogioacchino.delregno@collabora.com>
 <20220629110254.184213-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629110254.184213-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_141010_349423_BD3CCA4E 
X-CRM114-Status: UNSURE (   9.50  )
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

On Wed, 29 Jun 2022 13:02:51 +0200, AngeloGioacchino Del Regno wrote:
> Add the bindings for the clock drivers of the MediaTek Helio X10
> MT6795 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/clock/mediatek,mt6795-clock.yaml | 66 +++++++++++++++++++
>  .../clock/mediatek,mt6795-sys-clock.yaml      | 54 +++++++++++++++
>  2 files changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

