Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFCBC04A95
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 04:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRUKiGGp9HtYjOe4fyj+Bgjh8QBWVByT3GW/OPGOEZo=; b=v7angvSYREturPmghB1EAXiKss
	PQWlZHOruxa1puJMJVmqqLlLOJ1dUmmq5lPLaaEmAZnw28vziEAW47sXWWpeW/SLxkeps3+GAwqWd
	ik3plTRws439rxuaq+Pqs6Qmk8NzTu73XzDeBbst21V7cBFxtfnx3jQFNwYipDGnzgtAJD5jTGNST
	HY9o5Lo56i/54jj/e/U9Uw1l4Tv0jHdmvwAJpk22a5PGSuor6P1S6MY7gh3oDtl+J9m0puwC9aQuW
	AmDh1mNpBxXcYipO/xH2q5xc2r8THZrHxvG+kHZ+HkGU5oRUARMUigGzCUt90il9qmgZfMdvsIAWR
	9BJa1dDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odl6N-0019E5-K8; Thu, 29 Sep 2022 04:24:47 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odl6D-0019Ch-Fu
	for linux-mediatek@lists.infradead.org; Thu, 29 Sep 2022 04:24:39 +0000
Received: by mail-ej1-x62d.google.com with SMTP id b2so298237eja.6
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 21:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oRUKiGGp9HtYjOe4fyj+Bgjh8QBWVByT3GW/OPGOEZo=;
        b=Bw1JDcGREbj17+/4/sFd+PMZLK8ZiDfPeKoHmvDF2GaNMMdXJbhvNsy9e1H9I4FsqD
         j5ZgLciRrvE801bdE6lwdlE7mynvwEHe1hejvDWZnzJSrzhPJoJHfcOoSuAa4+Xdm6fI
         XAsdKg884QdAoTERymBE0zqVpmYhYEb/hdQ7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oRUKiGGp9HtYjOe4fyj+Bgjh8QBWVByT3GW/OPGOEZo=;
        b=2vtHV19xigPlUjy2S+H/XRPfnt5lC/MDAyx6W4H/0Aigz8R7Bwt/3RNvLapEpO6Doi
         rDZjA920Fgkoyah0zK3LuNlPu0XzK6JatywSIPmc6lTf2bPQmkjOZnJvxnG1oC2r/j9A
         55KBoTYpsdz0uQAXuKlLKFyBA1SNHODUmZauGxrA9n58eRg+Hupf82fTFK9Te0jyw+t8
         dTcxzlyNclAJiN2TdQrU71Xmcol9kfRZbeJTxRUElmdru8SYFctVKZiPNxzQFx9wRnI4
         rLzip0kwiEWpsvCTaue6P34fhc/aVpsToe9wnOAkuBLx8YILHEeAS3wOQx8E/vYKYXQQ
         7Zvg==
X-Gm-Message-State: ACrzQf0cwj7yyA2p/xg7kaaJ0wIcBOASCY5FdhTCEsli+2YByEg6mAFk
	Ni2fV+NZiAd90z1EPZBK0naVUm8uQ628dre5iu2mLw==
X-Google-Smtp-Source: AMsMyM6sJ8kAe/ae+WP7oeH7EoX6gvjCULwT3auEOOBJwoosQADkdiNj98RPfn1cGz3sRpqDYTIWOq8vAE3QtzCNzVQ=
X-Received: by 2002:a17:907:7f93:b0:781:dbee:dece with SMTP id
 qk19-20020a1709077f9300b00781dbeedecemr1006728ejc.323.1664425474991; Wed, 28
 Sep 2022 21:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Sep 2022 12:24:23 +0800
Message-ID: <CAGXv+5Gwy-FTUTsE0HwzUvfHPJ4XOfiZrBcK9ToZ2S0PHHnHAA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] MediaTek SoC safe clock muxing and GPU clocks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, matthias.bgg@gmail.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, miles.chen@mediatek.com, 
	rex-bc.chen@mediatek.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, 
	jose.exposito89@gmail.com, drinkcat@chromium.org, weiyi.lu@mediatek.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_212437_534576_C7156E56 
X-CRM114-Status: GOOD (  17.32  )
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

On Tue, Sep 27, 2022 at 6:11 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This series adds a clock notifier for MediaTek clock muxes, required
> in order to achieve stability for GPU DVFS.
>
> The GPU frequency scaling mechanism requires us to switch the GPU
> mux clock to a safe parent which frequency is always less or equal
> to the "current" GPU frequency before reprogramming its dedicated
> "MFG" PLL.
> This is needed because the PLL needs time to reconfigure for its
> output to stabilize (so, for the PLL to lock again): failing to do
> so will lead to instabilities such as glitches, GPU lockups and/or
> full system lockups.
>
> While at it, reparenting of some GPU clocks was also performed, as
> the clock tree was slightly incorrect.
>
> This series was tested, along with mtk-regulator-coupler [1], on
> Chromebooks with different SoCs (MT8183, MT8192, MT8195*), resulting
> in fully working GPU DVFS with the Panfrost driver.
>
> [1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220628120224.81180-1-angelogioacchino.delregno@collabora.com/
>
> * MT8195 does not require mtk-regulator-coupler. This series, along
>   with [1], are required to perform GPU DVFS also on non-Chromebook SoCs.
>
> Changes in v3:
>  - Clarified commit description in patch [05/10]
>
> Changes in v2:
>  - Added comment in clk-mt8195-topckgen to keep the mfg parents
>    documented after removal, as suggested by Chen-Yu
>
> AngeloGioacchino Del Regno (6):
>   clk: mediatek: clk-mt8195-mfg: Reparent mfg_bg3d and propagate rate
>     changes
>   clk: mediatek: clk-mt8195-topckgen: Register mfg_ck_fast_ref as
>     generic mux
>   clk: mediatek: clk-mt8195-topckgen: Add GPU clock mux notifier
>   clk: mediatek: clk-mt8195-topckgen: Drop univplls from mfg mux parents
>   clk: mediatek: clk-mt8192-mfg: Propagate rate changes to parent
>   clk: mediatek: clk-mt8192: Add clock mux notifier for mfg_pll_sel
>
> Chen-Yu Tsai (4):
>   arm64: dts: mt8183: Fix Mali GPU clock
>   clk: mediatek: mt8183: mfgcfg: Propagate rate changes to parent
>   clk: mediatek: mux: add clk notifier functions
>   clk: mediatek: mt8183: Add clk mux notifier for MFG mux


I've queued all the clk patches up here [1] and will send a pull request
to the clock maintainer later this week.

The dts patch needs to go through the soc tree.

ChenYu

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/log/?h=clk-mtk-for-6.1

