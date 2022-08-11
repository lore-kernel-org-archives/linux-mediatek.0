Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB2CC19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 09:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMPkpS8XZ9CZD7YiSg9zmbD0TWPYAuMvL4cZq8GvvrE=; b=22F69W8m+Xm+KfBzMTpzhZPCNK
	l2BUCgVBBx+ryRzYhL8csQYI1sAiYHAMZPc1BWrGVcHeh7rJK2hexzv6aeL1fe5veIK4fPEBBrquY
	A9lWHnlALcHcqN/j8OTy/n/rn70tu6nxPcvG1y8Qj2I4vm0LGT4JseKbqca9L1IA5Q7E4V93jlIE3
	Ksl6jVgbX0e+S9D1dSnKC10lzlJWcw4uWdNgaUUKhFtfHoS4WbLjUXdqeOOi4UKoDXi20IFYsHdxw
	CASQqKKBg5e3lWwR64YTupjs6lTBfSdtXR40JxnGJQ+TgGdt+UQUxCOJx9kswRAsuYf/BZudfcKgJ
	PS5At1cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4A0-00Aamx-Tx; Thu, 11 Aug 2022 09:07:24 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM49w-00Aail-Oa
	for linux-mediatek@lists.infradead.org; Thu, 11 Aug 2022 09:07:23 +0000
Received: by mail-ej1-x62b.google.com with SMTP id fy5so1603602ejc.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Aug 2022 02:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=AMPkpS8XZ9CZD7YiSg9zmbD0TWPYAuMvL4cZq8GvvrE=;
        b=62a0C5PIahTCbPIksLIFFasCo8TkJnD0NrXBn75/X87Qr/o+/1NPhqnBEbWnu5Wcdk
         lRYIYl5fXk0Dw9eEbPB1bObIWPebpURMO/843tj5b1d96igg9QQGJREzgVkUEQBd48r1
         kxKpJKprjM5cQJlGQYHR2VbK+7+9No/cw7W3kOJZb+hNVit8SW9PG6zuwzPCxel/IOlU
         x4Lj9TjdZwOgBZJn24Ou+97ylNvzLEaRNuj+hDRyPzdMqUWlkbPsCq/VA1u/yB0TsI/s
         EbDs0yBi+n5roSPaQhaT3pbbdy0H7oramsx+uZ7R9vaKvyP1zLu85dJVZhVje0elW2YR
         HHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=AMPkpS8XZ9CZD7YiSg9zmbD0TWPYAuMvL4cZq8GvvrE=;
        b=nUF2zHBXe6AYC506ZV0IJluIvNjYTEwF0o3LkAL9lp84btdK0RbjD5G2KPBZT+OOJz
         cUzKESF8ADqdr8IEczUOXS3gOSbtseMfJ+xeh3EFX0WwEwW5JJ8/UptRudJPkerf0oDE
         Fv5kuVUk/go2t/Uug6JcOsWSh/8fd9lkmc1R25TvGF+TD3rsKFRrGIFv4EZE93njjmBu
         5RwruvF5E3sGhBfKiU/phlxjnXukTnhCz5gDMvXahywxquTCBeqfZIHVU28Mps1RuKI0
         x865ZvYEuGLMpoMtQf5B+bPThhzgNsL7Pjb/WTwvyiqOjNSgzoqCrIHZoCamr/LrM9fz
         GQwA==
X-Gm-Message-State: ACgBeo0V2j4HJPtWAjZZUhK86kC2xC7ceoOjyew86jGq1OdtM8l3SNjj
	0zp0PWmVuCEB97yYZ6yM+IDHQw==
X-Google-Smtp-Source: AA6agR6FPq1KkD0ldPcxaEg0KRXTEf6/cyaUQQuox6k2VfpKYxcf47DjxelzwSrXqEQDqVxug6WiiA==
X-Received: by 2002:a17:907:763c:b0:730:c378:b860 with SMTP id jy28-20020a170907763c00b00730c378b860mr22547616ejc.97.1660208839498;
        Thu, 11 Aug 2022 02:07:19 -0700 (PDT)
Received: from blmsp ([2001:4090:a243:8036:200c:a862:4253:884])
        by smtp.gmail.com with ESMTPSA id m26-20020aa7c2da000000b0043c0fbdcd8esm8876699edp.70.2022.08.11.02.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 02:07:18 -0700 (PDT)
Date: Thu, 11 Aug 2022 11:07:18 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v3 4/4] clk: mediatek: add driver for MT8365 SoC
Message-ID: <20220811090718.spieeqcb5ogknlfc@blmsp>
References: <20220811084433.2598575-1-msp@baylibre.com>
 <20220811084433.2598575-5-msp@baylibre.com>
 <dc7a4f78-4244-7425-a1c2-509172ec97de@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dc7a4f78-4244-7425-a1c2-509172ec97de@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_020720_843657_633868AA 
X-CRM114-Status: GOOD (  15.20  )
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

Hi Krzysztof,

On Thu, Aug 11, 2022 at 11:53:19AM +0300, Krzysztof Kozlowski wrote:
> On 11/08/2022 11:44, Markus Schneider-Pargmann wrote:
> > From: Fabien Parent <fparent@baylibre.com>
> > 
> > Add clock drivers for MT8365 SoC.
> > 
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> > 
> > Notes:
> >     Changes in v3:
> >     - Changed all Kconfig options to be tristate
> >     - Do not depend on ARM64
> >     - Fix order of frees on probe errors.
> >     - Use mtk_clk_register_gates_with_dev
> >     - Fixed null clocks
> >     - Removed clk26m_ck
> >     - Use MUX_GATE_CLR_SET_UPD instead of custom MT8365_MUX_CLR_SET_UPD
> >     - Use devm_clk_hw_register_mux for top_misc_muxes
> >     - Use devm_clk_hw_register_gate for peri_clks and top_clks
> >     - Fix checkpatch warnings
> >     - Add missing MODULE_LICENSEs in all files
> > 
> >  drivers/clk/mediatek/Kconfig                  |   50 +
> >  drivers/clk/mediatek/Makefile                 |    7 +
> >  drivers/clk/mediatek/clk-mt8365-apu.c         |   55 +
> >  drivers/clk/mediatek/clk-mt8365-cam.c         |   57 +
> >  drivers/clk/mediatek/clk-mt8365-mfg.c         |   63 +
> >  drivers/clk/mediatek/clk-mt8365-mm.c          |  112 ++
> >  drivers/clk/mediatek/clk-mt8365-vdec.c        |   63 +
> >  drivers/clk/mediatek/clk-mt8365-venc.c        |   52 +
> >  drivers/clk/mediatek/clk-mt8365.c             | 1155 +++++++++++++++++
> >  .../dt-bindings/clock/mediatek,mt8365-clk.h   |  179 ++-
> 
> No, bindings are always separate.

Of course, I screwed up my rebasing here, sorry. Fixed for v4.

Best,
Markus

