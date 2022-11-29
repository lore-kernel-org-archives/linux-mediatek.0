Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FCFC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PO/cDnZZW/RlYHuzoKyfVL5YxwkikYi3mPwl9HeEE7E=; b=j4MJkoPQMpM7M+ONePxdJK3iqx
	ijP/5Q52MlSY9ZE6+bgzI79utO2qfF7H0eXE6OmfUu7wrHxwG/P6iM8NUpQ5ynt95lpGz5XFMmViO
	2NIlHAgSpMOjOP9exthsEQ1uQ/BhE15j4+FcVVLRRcRje0wksMxCdbATl7xoABMrgwyXBxTDNcag5
	4qJqqv+KJUlTIx07ZDwajbh+Vk/oxA3dEzW9A0p3J3pYhtOI9GB1NDDtco2tZ7uXZyZ+uCvkgV03L
	9mYotURF32XKh0L1kAtjLi885np/s6wmAM54LnbssZFyVKdzZB9iNGS2bEH0zxoF5UMUiG6IV/gKU
	ciq55C3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuez-006lFr-Os; Tue, 29 Nov 2022 07:04:05 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuew-006lDi-M4
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 07:04:04 +0000
Received: by mail-pj1-x1035.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso518139pjb.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 23:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PO/cDnZZW/RlYHuzoKyfVL5YxwkikYi3mPwl9HeEE7E=;
        b=oTlxBTjxb0OLs3LbtbLfBJy+5BE4R1aiDbHvx7Le4Ike9jM0Ec1TgEe8ZTAv3pACeV
         pc8VkakOjvc3fBYd/f0vQMP0EOWw3WZNUaok6ZRd2zuQL4NAor8HNgA/jeKfxWfO9Cxf
         P25OeRVnt7yFQbez6xPQ07sIqlDzOaQ+pGTvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PO/cDnZZW/RlYHuzoKyfVL5YxwkikYi3mPwl9HeEE7E=;
        b=drR1EqmxmK7BCuQ0e1qbLwMdrTix4Pht0jv6JSwScKKSQ2xicHVssHkEpSdsFpxoqm
         kBhwFeAD9b01nDtFCkeGnW/50JxVhsWgO7XMrho0aRN4j8FdmjaGxlUvaBKj3ID0tQWP
         1AOz2LGkqLNeHS72a1pF2gqsCoHRytDlRMRG27aYd5KFpkEYtfYxwNBGZIkEszcu4Ehb
         ayvpMqpOD2QgqCCfx4bKtf5Ykkk1dUBF+jygURXv3sXsG5JDxicrv/rYph/4VjYeJ0El
         xloWteKdIPt31eoYciZCivG4Q02DYkE1n4+NeKyClfmMPaQgd90Oimg7NZd4S1yJZ6rU
         /VyA==
X-Gm-Message-State: ANoB5pmBoKVlxdpGkLbExIl/Z+j8IjYCg/JcFFbu5dpk52G10bocqlE0
	OlZcWWNJ6ayaRp6iO7fwjP1U6A==
X-Google-Smtp-Source: AA0mqf5XVl2scp/GL8QqnK/jwLxKtG6rYycCaa648SfkyfYV/m7xzyJUi6ZoDwIhFKq1LLUDb7xy0w==
X-Received: by 2002:a17:902:f243:b0:189:8046:4335 with SMTP id j3-20020a170902f24300b0018980464335mr12291749plc.152.1669705440997;
        Mon, 28 Nov 2022 23:04:00 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ac4a:f96:259:b58a])
        by smtp.gmail.com with ESMTPSA id y69-20020a62ce48000000b0056d3b8f530csm9140261pfg.34.2022.11.28.23.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 23:04:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: sboyd@kernel.org, angelogioacchino.delregno@collabora.com
Cc: mturquette@baylibre.com, yangyingliang@huawei.com, jose.exposito89@gmail.com, matthias.bgg@gmail.com, linux-clk@vger.kernel.org, rex-bc.chen@mediatek.com, chun-jie.chen@mediatek.com, msp@baylibre.com, nfraprado@collabora.com, linux-arm-kernel@lists.infradead.org, miles.chen@mediatek.com, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 00/10] MTK: Undesired set_rate on main PLLs and GPU DVFS
Message-Id: <166970543840.607733.16874108898291986445.b4-ty@chromium.org>
Date: Tue, 29 Nov 2022 15:03:58 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_230402_769851_9625F907 
X-CRM114-Status: UNSURE (   9.73  )
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

On Mon, 24 Oct 2022 12:22:57 +0200, AngeloGioacchino Del Regno wrote:
> There's no reason to declare CLK_SET_RATE_PARENT on main system PLL
> dividers, as any rate change on those (mainpll, syspll, univpll) will
> change clock rates on critical system peripherals and busses.
> 
> This change was performed only on SoCs that I could test... I'm sure
> that the same can (and should) be done on more MTK clock drivers for
> practically all MTK SoCs, but I don't feel confident in pushing things
> that I couldn't test, so that's done only for MT8173/83/86/92/95 and
> on MT6795.
> While at it, I've also added the much needed clock notifier treatment
> on MT8186 for GPU DVFS, like done on other clock drivers in the past.
> 
> [...]

Applied, thanks!

[01/10] clk: mediatek: clk-mtk: Allow specifying flags on mtk_fixed_factor clocks
        commit: 672c779e4cff5f4a103077e9b398f144c85db802
[02/10] clk: mediatek: mt8186-topckgen: Drop flags for main/univpll fixed factors
        commit: 295de9d0d063cc576c5c6322aeeda64d3579d9e5
[03/10] clk: mediatek: mt8183: Compress top_divs array entries
        commit: 23037ab63336a4a1d98645bf7ee76240ed20bc65
[04/10] clk: mediatek: mt8183: Drop flags for sys/univpll fixed factors
        commit: c01d64ca5166fa88d27c7c4a2a294dd10d20f780
[05/10] clk: mediatek: mt8173: Drop flags for main/sys/univpll fixed factors
        commit: f757c9e951b89c40db41592a22785b5a25c58224
[06/10] clk: mediatek: mt6795-topckgen: Drop flags for main/sys/univpll fixed factors
        commit: 0cf308ee3472019539582ee279b637beb34ad2ff
[07/10] clk: mediatek: mt8192: Drop flags for main/univpll fixed factors
        commit: b56603285f7e323591267bec9a9d6950e9bdb7cb
[08/10] clk: mediatek: mt8195-topckgen: Drop flags for main/univpll fixed factors
        commit: 327eeb6c240ab9293ab730789ea651fbc3fe6123
[09/10] clk: mediatek: mt8186-mfg: Propagate rate changes to parent
        commit: ecc639ddbe0d7bf1c66f6c69ee54ee005484d886
[10/10] clk: mediatek: mt8186-topckgen: Add GPU clock mux notifier
        commit: 3256ea4f6582d2cb9b63ad96451957c217a52582

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>

