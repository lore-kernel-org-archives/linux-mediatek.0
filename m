Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B749C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 09:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w68fjacIbYROHj9NrwdwNA0c0aQCtfhI8MuuSuFFTGU=; b=edtCGwTkDiitc1xcvxTFcQqBro
	EEW+eHehU0tkTSclHJKtIVl5aYAJhq/FfHIsd91lSl7Lc4xtcYBbGlxoGy/Kah8lcK6fNCFcVYO8q
	k5bG87qEvEukNihAFqqHa2ON/st0CiQFV2TMdf1mIuFIgvtNStHMWXvV1ueUzgZkFKNhYW3bt1Td8
	q/zukIwM4e82N0VIX5ot+moNqPe0EFrbwVtLQ1CNvADUYK6CittJRaQbtJBafSgCjfuJpvuNvxiPq
	wn5bjvDXDvdFw6rmjLTK/tmuzjw64UQIA57WUyJNY/RFWhyHw31CYgX0YdECNZM18O3a7jEa+HuZl
	tyUHlPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2y6-000gn5-H6; Thu, 09 Feb 2023 09:11:50 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2xt-000ggU-Tt
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 09:11:39 +0000
Received: by mail-vs1-xe31.google.com with SMTP id k4so1437199vsc.4
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w68fjacIbYROHj9NrwdwNA0c0aQCtfhI8MuuSuFFTGU=;
        b=ZIYZaanS4Y+2sOHLh37grO5tgcR4JefyElqlYAUc1JIKKZAgas3J6AID8Itlb6wbKc
         AAfgAJqufU0jImwFeaP/YnfqImuC7ohwXwWBnzxJmM1nhMj8LPnDfRooMWAeeV3d2WS+
         wSs9SJPo19TuBsLQaRpmUwVnQzff9s24CscOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w68fjacIbYROHj9NrwdwNA0c0aQCtfhI8MuuSuFFTGU=;
        b=QV0GJSlgkzVpuhKodt9xoAEeieOBxaNE0b8s2o5NeH+lpjI/FUCHx2QLljEp8pA/ui
         YbJilfnwbjPr+BzuFVBvZaa0/DNrBZuzezywWz9ytd+EgKK2cByG0mne9gq7d1AULOYb
         VTsc/2pqXTwmqQOX44bCBP3QK2TEDhkc+GBLOXMOZazHutRr/caFi6pCPrWoBRKaYJo9
         6XS8ixeu/guDRQe1vynOPT1uyxtHSGoO7kwMKSZmKVFurplvUCYYyX5f6flyhC0ElwwQ
         40tCzxX+zh+cV+1akB97sIS+HrT7Rdbh9ZjHARPsbVJSGs5WPcj6Y+3zV0eAqGbu9UtR
         OeVA==
X-Gm-Message-State: AO0yUKX2mCA2u8ELztSYj0PFRQUaJkIxEoHhldjJ8mNz5YFvR2E1MvAh
	nwNAhRQFgJ9BxfVUt0u+OB/vUW7NY1PHfjR8+0NDeQ==
X-Google-Smtp-Source: AK7set+KPzqBwjxATKFm3ww9TDUL0+dlDvBQLmcuye57In75cyMGFwgEmQXHgRNRnpRNwOctDpjGIdp71O9nke3/6hg=
X-Received: by 2002:a67:d202:0:b0:411:c830:e5b5 with SMTP id
 y2-20020a67d202000000b00411c830e5b5mr364925vsi.65.1675933894598; Thu, 09 Feb
 2023 01:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Feb 2023 17:11:23 +0800
Message-ID: <CAGXv+5Hd+XBqKX5w294KVw56BHkkD3NW9ED_RLDP0OXYDxv=nQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] Enable GPU with DVFS support on MediaTek SoCs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_011137_979473_7DA08B88 
X-CRM114-Status: GOOD (  13.67  )
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

On Wed, Feb 8, 2023 at 6:45 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> We finally have working GPU DVFS on MediaTek SoCs.
> On Panfrost.
> For real.
> ...and the best part is that it's going upstream.
>
> In order to get GPU DVFS working, it was necessary to satisfy a
> specific constraint (which is different, depending on the SoC)
> between two regulators: GPU VCORE and GPU SRAM.
> This was done through adding the mtk-regulator-coupler driver,
> which transparently manages the voltage relation between these
> two vregs, hence completely eliminating the need to manage these
> regulators in the Panfrost driver; this solves the long standing
> issue with devfreq+opp tables not supporting managing voltages
> for two regulators per opp entry out of the box, due to which
> we never got GPU DVFS on those SoCs, often locking them out to
> a low GPU frequency.
>
> This changes. Right now!
>
> Tested on MT8192, MT8195 Chromebooks.
>
> This series depends on [1].
>
> [1]: https://lore.kernel.org/lkml/20230208103709.116896-1-angelogioacchino.delregno@collabora.com/

Whole series is

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Tested on MT8183 Juniper (Kukui-based device), MT8192 Hayato (Asurada-based),
and MT8195 Tomato (Cherry-based).

GPU probed. When running glmark-es2-drm, observed state transitions in
/sys/class/devfreq/13040000.gpu/trans_stat , as well as actual changes to
values for regulators and clocks.

Also observed that sometimes when glmark terminated, the GPU would not be
brought down to the lowest OPP.

