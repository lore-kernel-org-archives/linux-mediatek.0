Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D27C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 07:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soa+SAFtKAZ0dT0XWd2urT+evcY34HAipQoZWgmMXbE=; b=wIxL/QS0fXajU8glZD2CMV7/qF
	RgzTsfVT4PFTYI/RYe1nJu3Fr0RIbd9r3pKPcpVcCMyGoRPEztiHowihb1xFIGXUrP1CpDZo7a3W0
	b+vMCkhzurgNgWoZ0xAp54aTXhMRLCbv/uEvWknOEDtEDuZiH1Rv8t7b/TlR+MeLZzWeQMoTZEXMC
	1FFiHmgQH0VLy3eopAORNwHEtXHvdjpUVNZ0kxVRNziWmhykYLTYcd7kJ+FikWgPWppj3J8euOrii
	hY5zB48yTbO72JV+Y2k7gtAudmrGurlp2U6HqugUgmJyuH2GUvnuM2MRjrM3B4ovKmUY+OIjwwFRo
	axnLAOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9hYA-002RWW-HI; Mon, 26 Dec 2022 07:05:30 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9hXz-002RSv-OW
	for linux-mediatek@lists.infradead.org; Mon, 26 Dec 2022 07:05:21 +0000
Received: by mail-vs1-xe32.google.com with SMTP id b125so3008215vsc.13
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Dec 2022 23:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=soa+SAFtKAZ0dT0XWd2urT+evcY34HAipQoZWgmMXbE=;
        b=AVkrZP9oZ8T5y66+Ca0o04Gd8v5/nPQ6wdjf01cJZw8AOtLBp2xbVGTc+6FIsZe+/4
         asslmG7k7JHTzM7dCd4zA3ZFkilt8rsQ7sdIU9bsWaAp3BJ6gKoIWHvNEnoA831efiuz
         sygRl9HVWNwI99H8FztedcqzRHZVGNhPlepx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soa+SAFtKAZ0dT0XWd2urT+evcY34HAipQoZWgmMXbE=;
        b=A+6EcWRgZHwnBhZgZHv+fmZL9QgMjQTls9Nrbmzg55EhY/iyp76WafrGrQ07I4NxnJ
         dQvS8Oj38gxeZxXzKn/O1GfObKfp+LqQIPbHquTVfsMJ6L7/zVRn7zmNC6IUhm06whVu
         OAl0magROmb01TRNtiiSdteNR519iiDBQTh0uJhEQk+Uf82bzwET4HJvxd7DaVWfsDht
         Lgk81WOkSlat4y4/8o/3gfeK66L5SlZiBCN8how/GQLqEznvIfjNiV2nlkv57iV2qP3L
         LmQHoBX+Db4yYGZgqu5A/TSCT4eqqNmmU4FYQzlFyJdZk7G00zzSXgGuJkP1OPwnutrq
         KUrg==
X-Gm-Message-State: AFqh2krRzMtOkp4FHfWLH0o5kZ6QTdpdkSE6ZhbdyIZoAmeVJy8gqrIL
	UCA4rOcDwWqqEDTMs5jghuqHsOmrHqia1Eso45QWtA==
X-Google-Smtp-Source: AMrXdXsgQsNveB+g3fxLQ8RqpmCH85x9K4V8BIWAdTWcIummB2ZNtDC+Ulay47RwMG6g7adIPRyBPkhBwZ2aDQ6FwOo=
X-Received: by 2002:a05:6102:74b:b0:3ad:3d65:22b with SMTP id
 v11-20020a056102074b00b003ad3d65022bmr2396976vsg.65.1672038316696; Sun, 25
 Dec 2022 23:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Dec 2022 15:05:05 +0800
Message-ID: <CAGXv+5G7DFsapt5y-ujPKTTS7xxR8K1iCZ7La__D2_ZZ+hwU3g@mail.gmail.com>
Subject: Re: [PATCH v2 03/23] clk: mediatek: clk-gate: Propagate struct device
 with mtk_clk_register_gates()
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
X-CRM114-CacheID: sfid-20221225_230519_881279_B34770D5 
X-CRM114-Status: GOOD (  16.52  )
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
> Commit e4c23e19aa2a ("clk: mediatek: Register clock gate with device")
> introduces a helper function for the sole purpose of propagating a
> struct device pointer to the clk API when registering the mtk-gate
> clocks to take advantage of Runtime PM when/where needed and where
> a power domain is defined in devicetree.
>
> Function mtk_clk_register_gates() then becomes a wrapper around the
> new mtk_clk_register_gates_with_dev() function that will simply pass
> NULL as struct device: this is essential when registering drivers
> with CLK_OF_DECLARE instead of as a platform device, as there will
> be no struct device to pass... but we can as well simply have only
> one function that always takes such pointer as a param and pass NULL
> when unavoidable.
>
> This commit removes the mtk_clk_register_gates() wrapper and renames
> mtk_clk_register_gates_with_dev() to the former and all of the calls
> to either of the two functions were fixed in all drivers in order to
> reflect this change.
>
> Since a lot of MediaTek clock drivers are actually registering as a
> platform device, but were still registering the mtk-gate clocks
> without passing any struct device to the clock framework, they've
> been changed to pass a valid one now, as to make all those platforms
> able to use runtime power management where available.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

However, I wonder if we could move the |struct device *| paramter to be
the first one? This matches other APIs better, notably the clk_register()
family.

Regards
ChenYu

