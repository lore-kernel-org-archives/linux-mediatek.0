Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DB6C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 09:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWWILWKzQK6TMLDhFStYmh9cgs1Ee4AfC8VZ2A5psHc=; b=xCQvjA0SHMLTVtZhxwxW4J+TmD
	hF443VpVPM1wnnQDjm1KJtDWp9Nvvbi5rEeCuTycpnxedlGi/nXP7+nGOE4eb4guyC9SFQeClCgG4
	NCDp1jJ7G9BzaCMCUbCnonH0ponRgxPqigfIf1HLjtgGIdaWvQnTyAskPQqZ/sf3U8XVblj2c/FoZ
	qGQoW9TquJBPmsFSEhXBPDPwoVTm9JtxWG5o8T93Q6oieHKODo/XV2zzFvqKW+/rJf3KDsh/Ve4Rt
	02uxYonjmYfpeR7jVzTND0tj0sB8K2RpiRn4Mlng1/uBNtVV7J2Ou/ULao+chY8HGFLEsQi3JK2CD
	FJ+kdOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvx1u-0004LP-3A;
	Mon, 08 May 2023 09:19:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvx1s-0004Jr-0i
	for linux-mediatek@lists.infradead.org;
	Mon, 08 May 2023 09:19:37 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f4000ec74aso28141885e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 08 May 2023 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683537573; x=1686129573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uWWILWKzQK6TMLDhFStYmh9cgs1Ee4AfC8VZ2A5psHc=;
        b=zepka+QR+g/2xC9xN6lho0mYqW/9c/L93qnP3uJb2MyRmy9d+Cix6FiXrtP7oMPort
         jZM47KGJjHKNycjsX95yz0C6HWzXC1YswWDe90EjWVIR7MrXaCf0acLM2EN+P8SNKwWn
         u10IVWwREvgDIHQ8n2HELQiim3Ao/auzrxoWzJVmVBrpIwCE17MpSksetf+8/vpZm+z3
         O9MgFINHFH96Wg87vpjYCLChliuB/obYki61cb5Df1zeqTbRx5CYkBo8avtu0J4Uwl1/
         pFIrQhxPmpVJLtU0sfJrlSzNy/FlBJ5H17WS2D3pWdWN4HO6AUhl2dM+QLKRXziskJcG
         sRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683537573; x=1686129573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWWILWKzQK6TMLDhFStYmh9cgs1Ee4AfC8VZ2A5psHc=;
        b=kNx2V8D0Slq4zEQB4QrK8QTgpVGRwgRvXF1fsmDC0qZyxSTnVlcnPnrPn1C+xbLphW
         cidQckR8tx2LORN2eb1NIX+sX6Nt/M19qYwQAuQGijp1B0wWF4UCCCMMG3QoQD3BN9XK
         DdnUdCv3gDHRSzCdLm6sTAiODFg5gk0One0UuQvrSCDmU4BZodLkayFixWxzQeTQT1Rv
         kAwPvt2o9unYSc5elxOMsC91A0SdYM/jUh3UZAWVhDxxg+KSA27ePruJoUkSxQqrlHfO
         JwY6ISMDcDsmpbhYuptR/atQrrRkk68XMfJSq0oDPe0Ua7sTr4RF28sE3Rxz4Iz8rr6E
         OdxQ==
X-Gm-Message-State: AC+VfDxGnMbgow6IPqhK2G2o09JfATubMreeP81eqUGVRXDaOwaAShkT
	qxrN7sNa+9F78quysqYHfnEisQ==
X-Google-Smtp-Source: ACHHUZ6FNnM/7T0TwX1UpEkyd2q2m5u8rebE8CJQsnenV2MO71Oov6aqiwILhEKTK5XhBe09hMae+g==
X-Received: by 2002:a1c:4c04:0:b0:3f4:2148:e8c5 with SMTP id z4-20020a1c4c04000000b003f42148e8c5mr3393758wmf.1.1683537573557;
        Mon, 08 May 2023 02:19:33 -0700 (PDT)
Received: from blmsp ([2001:4090:a246:80f3:ef71:25ff:df82:9cc9])
        by smtp.gmail.com with ESMTPSA id o23-20020a05600c511700b003f07ef4e3e0sm19806283wms.0.2023.05.08.02.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 02:19:33 -0700 (PDT)
Date: Mon, 8 May 2023 11:19:31 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
	wenst@chromium.org, chun-jie.chen@mediatek.com,
	mandyjh.liu@mediatek.com, miles.chen@mediatek.com,
	zhaojh329@gmail.com, daniel@makrotopia.org, nfraprado@collabora.com,
	rex-bc.chen@mediatek.com, Garmin.Chang@mediatek.com,
	yangyingliang@huawei.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 2/2] clk: mediatek: Remove CLK_SET_PARENT from all MSDC
 core clocks
Message-ID: <20230508091931.yznppzp2ohham5ek@blmsp>
References: <20230505093733.221922-1-angelogioacchino.delregno@collabora.com>
 <20230505093733.221922-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505093733.221922-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_021936_254224_2C388B99 
X-CRM114-Status: GOOD (  12.41  )
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

Hi Angelo,

On Fri, May 05, 2023 at 11:37:33AM +0200, AngeloGioacchino Del Regno wrote:
> Various MSDC core clocks, used for multiple MSDC controller instances,
> share the same parent(s): in order to add parents selection in the
> mtk-sd driver to achieve an accurate clock rate for all modes, remove
> the CLK_SET_RATE_PARENT flag from all MSDC clocks for all SoCs: this
> will make sure that a clk_set_rate() call performed for a clock on
> a secondary controller will not change the rate of a common parent,
> which would result in an overclock or underclock of one of the
> controllers.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt6765.c          | 12 +++++------
>  drivers/clk/mediatek/clk-mt6779.c          | 18 ++++++++--------
>  drivers/clk/mediatek/clk-mt7981-topckgen.c | 12 +++++------
>  drivers/clk/mediatek/clk-mt7986-topckgen.c | 12 +++++------
>  drivers/clk/mediatek/clk-mt8173-topckgen.c | 24 +++++++++++-----------
>  drivers/clk/mediatek/clk-mt8183.c          | 16 +++++++--------
>  drivers/clk/mediatek/clk-mt8186-topckgen.c | 12 +++++------
>  drivers/clk/mediatek/clk-mt8188-topckgen.c | 16 +++++++--------
>  drivers/clk/mediatek/clk-mt8192.c          | 17 +++++++--------
>  drivers/clk/mediatek/clk-mt8195-topckgen.c | 16 +++++++--------

This is missing clk-mt8365.c as well. Otherwise looks good to me:

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best,
Markus

