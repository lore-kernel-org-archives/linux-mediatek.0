Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E415C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 09:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2J2aTNhc8Fk+2QZu9B/DP3Bn+7R4y8GRLvltu/3lVbw=; b=J+s1zG2JNVQJ1PBlPl3mBobCja
	kcgIove3te20iAO4J9Y570WJ3SZBJ+7LNfiF0HNxm9Q+psZSQfyzmaxQSUHI6ZcJpwCORUcYtsHBY
	+Km/C2Bg10+0N+pxqW9SJhltxctti6jbFsJddDI0wB5WF1qNAQ/hqP9aUcGWXV15T3b3dd7Q2uv66
	sIk/s+jnh8uA70Ist4c0ONVV0w8f+GKKXRJWPRxQx9HwaPVWz0ANY+xQd4MkrXFopGaZ3Nn8xLFmI
	D6azXAVZ/0D92/tgr9YuIy9Ml9G3kuZCCJvqaHqUdrgqBsRUftu+/9udbuoxjvES6Qw97bVpgg/8K
	z27apxzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCdxD-000Y5k-Db; Tue, 03 Jan 2023 09:51:31 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCdik-000Tx2-9U
	for linux-mediatek@lists.infradead.org; Tue, 03 Jan 2023 09:36:38 +0000
Received: by mail-vs1-xe32.google.com with SMTP id m129so25372579vsc.11
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Jan 2023 01:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2J2aTNhc8Fk+2QZu9B/DP3Bn+7R4y8GRLvltu/3lVbw=;
        b=A5Zr2HT5mmyAp05QRJwAfVvnRBy65SHP+jupcFVWUT3FKrjLw1TpBJrXi5uhMZQq2R
         e1Pno+FyNk66ZStSqsyz8L1zf5GHQuyP/tBoj0haHLKX6AwdIamttqpqQG3TxHKXrNOR
         aDU+nLR7YBek0BvA/ibeZoZmQf4JWkzpB5yJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2J2aTNhc8Fk+2QZu9B/DP3Bn+7R4y8GRLvltu/3lVbw=;
        b=IViEDysjsjO8trVUHl8eOzOz6ndWAErP8ylM4JQOVZjSKV0bVVakLY/fsyiXwc6U2B
         AhIskcn/4Vpg5dRyTf5XxcdzB/IbyyDsv7Sq2ZgGAXJsl1UzWNDR1BJpdst2Un9RfoXl
         NVXhNz0KL+TFrk5mtiJTq/aIGrR2Tkst0/N+Skkevlbg70ulSi3OkNVdUL4LcLOT1W0P
         NfPwNbPeFIZQUc2KA1CaWaWmbICVs5mIbR1MEWvrYFMKxJFmCH0w1HmNTYwDa/z287pg
         s+gBZNycMIWuflhcOCR07IcTYaSDoRKCSGkRqADjpZdMD/rS69bzynAfHB4kFJACBcA2
         keoQ==
X-Gm-Message-State: AFqh2krkLqmMtUQ5RLG29nvGZTvptx9zq3Nj5mEQBgQS5tdgmU5uicQL
	upE3UoOYc2HcQbM05x71YT/jqoN5SrSAqcM9J9YWgg==
X-Google-Smtp-Source: AMrXdXsjYNpn4DO5afgWKbBL3BZLMSMIQCd2hnTZosLQcX2by+boAHEHDPWQ1FXpr2KldsK58GYEH3IVdxFGAqoYF5U=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr3971152vsv.9.1672738592218; Tue, 03 Jan
 2023 01:36:32 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 3 Jan 2023 17:36:21 +0800
Message-ID: <CAGXv+5GekZUSe34DxiKzdnPr-GDsmJBfAgkS1RjrN-xdeXMN6g@mail.gmail.com>
Subject: Re: [PATCH v2 00/23] MediaTek clocks cleanups and improvements
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com, 
	chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com, 
	nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org, 
	daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com, 
	pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com, 
	ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_013634_545686_A565EF2B 
X-CRM114-Status: GOOD (  19.91  )
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

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
>
> Changes in v2:
>  - Moved dt-bindings CLK_DUMMY to clk-mtk.h instead
>
>
> This series performs cleanups and improvements on MediaTek clock
> drivers, greatly reducing code duplication (hence also reducing
> kernel size).
>
> There would be a lot to say about it, but summarizing:
>
> * Propagates struct device where possible in order to introduce the
>   possibility of using Runtime PM on clock drivers as needed,
>   possibly enhancing reliability of some platforms (obviously, this
>   will do nothing unless power-domains are added to devicetree);
>
> * Cleans up some duplicated clock(s) registration attempt(s): on
>   some platforms the 26M fixed factor clock is registered early,
>   but then upon platform_driver probe, an attempt to re-register
>   that clock was performed;
>
> * Removes some early clock registration where possible, moving
>   everything to platform_driver clock probe;
>
> * Breaks down the big MT8173 clock driver in multiple ones, as it's
>   already done with the others, cleans it up and adds possibility
>   possibility to compile non-boot-critical clock drivers (for 8173)
>   as modules;
>
> * Extends the common mtk_clk_simple_probe() function to be able to
>   register multiple MediaTek clock types;
>
> * Removes duplicated [...]_probe functions from multiple MediaTek SoC
>   clock drivers, migrating almost everything to the common functions
>   mtk_clk_simple_probe();
>
> * Adds a .remove() callback, pointing to the common mtk_clk_simple_remove()
>   function to all clock drivers that were migrated to the common probe;
>
> * Some more spare cleanups here and there.
>
> All of this was manually tested on various Chromebooks (with different MTK
> SoCs) and no regression was detected.
>
> Cheers!
>
> AngeloGioacchino Del Regno (23):
>   clk: mediatek: mt8192: Correctly unregister and free clocks on failure
>   clk: mediatek: mt8192: Propagate struct device for gate clocks
>   clk: mediatek: clk-gate: Propagate struct device with
>     mtk_clk_register_gates()
>   clk: mediatek: cpumux: Propagate struct device where possible
>   clk: mediatek: clk-mtk: Propagate struct device for composites
>   clk: mediatek: clk-mux: Propagate struct device for mtk-mux
>   clk: mediatek: clk-mtk: Add dummy clock ops
>   clk: mediatek: mt8173: Migrate to platform driver and common probe
>   clk: mediatek: mt8173: Remove mtk_clk_enable_critical()
>   clk: mediatek: mt8173: Break down clock drivers and allow module build
>   clk: mediatek: Switch to mtk_clk_simple_probe() where possible
>   clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
>   clk: mediatek: mt8173: Migrate pericfg/topckgen to
>     mtk_clk_simple_probe()
>   clk: mediatek: clk-mt8192: Move CLK_TOP_CSW_F26M_D2 in top_divs
>   clk: mediatek: mt8192: Join top_adj_divs and top_muxes
>   clk: mediatek: mt8186: Join top_adj_div and top_muxes
>   clk: mediatek: clk-mt8183: Join top_aud_muxes and top_aud_divs
>   clk: mediatek: clk-mtk: Register MFG notifier in
>     mtk_clk_simple_probe()
>   clk: mediatek: clk-mt8192: Migrate topckgen to mtk_clk_simple_probe()
>   clk: mediatek: clk-mt8186-topckgen: Migrate to mtk_clk_simple_probe()
>   clk: mediatek: clk-mt6795-topckgen: Migrate to mtk_clk_simple_probe()
>   clk: mediatek: clk-mt7986-topckgen: Properly keep some clocks enabled
>   clk: mediatek: clk-mt7986-topckgen: Migrate to mtk_clk_simple_probe()

Boot tested on MT8183 and MT8192 (which needs CLK_OPS_PARENT_ENABLE fix
I just sent), so for the whole series:

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

