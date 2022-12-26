Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079EEC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 07:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kc7UX5qQFKgxUp5GIPhkGqMn4OUOgloWMZmKzKsecYc=; b=X/+6UUNkwj+1wjYm2REIZbFd6T
	NWZ7Nlgm6rWGRQ+jdr5GXhpCOe2acEjOuewEpRWcNXrLNZpmIytnfIMGSDNJm2ZuQ7jB3pc78GU9M
	nljaLi538YtbMVxMSzBMc1gFd6zzaYBYlewli4jswzMuVjjLuUd0d2fe113w/oyRl6JLJ5+Ufb12t
	oDuAnGXt4Nc25653zGtKzCkZmXFLGrizHJEoozHezk972ZMHccz/qMVdlghV1opHJ4nSIQiGLWjeU
	BWoycfEAymF45NhIQwQ+BFQcKGMDWvLWCA7F3wO3rPv+rRLprdYunQQGj50sH7fixp7BlLfz6ap0x
	898gYNfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ha1-002Ry8-RH; Mon, 26 Dec 2022 07:07:25 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9hZy-002Rwf-Vj
	for linux-mediatek@lists.infradead.org; Mon, 26 Dec 2022 07:07:24 +0000
Received: by mail-ua1-x934.google.com with SMTP id j1so2230536uan.1
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Dec 2022 23:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kc7UX5qQFKgxUp5GIPhkGqMn4OUOgloWMZmKzKsecYc=;
        b=F36ks6qgrclKiSq119LjQgu9DDYLk5CwlQlwTUbhE5kBes/fyuLFzf2adOZlVDDvZH
         4pwMnuHAkPHbxR/8o/VFR5Yswpv3I4g9VXlfbDbGA015CZQY333kwSZLDrNcrlzxfxCs
         oHpmv6xmktdygibJiDmwyOOUKvYzvkDEUmm1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kc7UX5qQFKgxUp5GIPhkGqMn4OUOgloWMZmKzKsecYc=;
        b=gIGSI5ZlBC+gFrHfkNBR7D+LfU5C1ENKJPGkTkHhsD/xcVz7XHaqVu74+Qa7Nda/Zo
         j8NxvlbF+pe9bizPkLiWXH2J2bhseEMWlhLm2hVaguYRS+KHm9Ho0ZHT7tbyGeloTgjH
         OOZjM2KfbfSxgR6In2VwI7WQztCroK0AP30q2oFmSrNqTT9bicHtGcakGf3mjMvy0fe3
         XYmXGTuq/CzrQ2wrmthZTF2w1qCnPcLJwQzX8Gnj1iE2cD/tnnhj0e5aAMg9PkQex6Rg
         pFiQ7ipVt1Jic8sYV8RT5rLBcyZom59Ur+TaB/frL98LSzaHDIGzeF6Djih+RlwHxfUf
         ADKQ==
X-Gm-Message-State: AFqh2kqLnfBQujzMKQVG0cCURafTcvXJzwoTNrdmEPt3bS/opErsYZ7j
	3Odg6o5WtdIpIuAD6UItsCp5Mks4OJayoG2XyImi3A==
X-Google-Smtp-Source: AMrXdXv2VqQXGVz7UsmxIS87BTXQNUJ4d3yeAlvbMCKPSnAPa13HYbgf2LvkaebhY9B0OY4hysESqwW4AfdqoejLjw4=
X-Received: by 2002:ab0:7411:0:b0:418:b849:8187 with SMTP id
 r17-20020ab07411000000b00418b8498187mr1585399uap.43.1672038441665; Sun, 25
 Dec 2022 23:07:21 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Dec 2022 15:07:10 +0800
Message-ID: <CAGXv+5F8QZGc4oDKJAGbpvubqiewvngURpNhrenS3pcGQNrOYw@mail.gmail.com>
Subject: Re: [PATCH v2 04/23] clk: mediatek: cpumux: Propagate struct device
 where possible
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
X-CRM114-CacheID: sfid-20221225_230723_095224_3CBB6053 
X-CRM114-Status: GOOD (  10.22  )
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
> Take a pointer to a struct device in mtk_clk_register_cpumuxes() and
> propagate the same to mtk_clk_register_cpumux() => clk_hw_register().
> Even though runtime pm is unlikely to be used with CPU muxes, this
> helps with code consistency and possibly opens to commonization of
> some mtk_clk_register_(x) functions.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

As with the gates patch, could we make the |struct device *| parameter the
first one? Also for this case I think we could even drop the
|struct device_node *| parameter.


Regards
ChenYu

