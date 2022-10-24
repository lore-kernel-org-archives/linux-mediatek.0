Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD900C67871
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 22:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+gEm7VONyS7UVuTvPLRkcNvl41HQoqLdSHbzsMHTSs=; b=gLNtOrtkewkAuhC+ZWEY7cthoM
	rCWZ5daaSHmXqMTbC1ihTItWlctND1Kn0UHW9ERa+0OX30JpHA7qnK+5v1Bkc6ZNv8dnhpIVYgwjZ
	j34o6YIiCgJZb+6e1HxHdZt83tXaeq8/aelWqp3Pn1ZdAl7N0Ru0XhNpJdsIz4yDBX1MnR49haQNH
	hR+YhBYX50sMipUDaqOaG4joRU5OY1/hyDfjImomPQ+geNWCaQ7U3j0qLfBZwT9ERAEG2nsZ9y6b2
	6gROGledVJvJ5uHir93r6VWl8eXDH4EcPhMZ5qaYisRohN8LdbFQwDU/NAoM0vTVA27Zpl0TwJdYd
	gr0WtFkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5gv-003FCH-80; Mon, 24 Oct 2022 22:13:05 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5gs-003F9B-LR
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 22:13:03 +0000
Received: by mail-ua1-x92e.google.com with SMTP id p4so5322642uao.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 15:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2+gEm7VONyS7UVuTvPLRkcNvl41HQoqLdSHbzsMHTSs=;
        b=L3OSNOGMw4rOVmweIhebxGViBIgNhvyR7qzGaKgUw7RRl//uC1ARvYqlv1B6DAI1BS
         m5BT0qCELCZs/zAsS7JKiewTklsvv+bD/SVebEh2sCIBcm0zyOhHgrqmM58CUBQ2nHAm
         fOPt9JPgaFukt2vCQv1bnnfXkmpIpv6g4q6O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+gEm7VONyS7UVuTvPLRkcNvl41HQoqLdSHbzsMHTSs=;
        b=H5yJvNnjtw4DSwdHP78B9vErjCFCEtdhJi377WzeeFq7neDeCzDfr0XJGuqYxJl9tj
         Mzj3LRi4oH+3M6Ooy2OOydwzrGAUE+tlup6diQDYjs3L2bf+RiNfpMglEonLmsfGOvQ7
         Zhn0MKS2D7XMX8EEucECjhT46QMzf1gq0QqT1HpfpAiyGC0498gbwkWrTTI03EGp3Fdr
         xNAW6UNnluIE6RoVg1X8ZaW63jO/nM9Kl67OT/5XN6uQv8/EMvUptjBdypwIBtxieKk4
         Ek/ZiZRot8gqlS6cH0p5tCEn9hKoCYNBC5jjOmpVEPXVH5EgL12aT2iJThQDXJjbdjd9
         XK5g==
X-Gm-Message-State: ACrzQf0kxdhwbz263lUEoSGpsPx3qxCxX0oFtE2QQ6qYC/tuX/Otvklj
	1TKtAy0GHt0lad6SNx2ZCv+DIpbFVF5P0wvnDKVIBg==
X-Google-Smtp-Source: AMsMyM5HAWHqJDUUEN4IizBWaZrMz7exN/+WucGtaa+xWdXV1aB7+frNt8M+3SYIkfMvqtKI2U2+EXEtnsKLuJ2uOgQ=
X-Received: by 2002:a9f:29a3:0:b0:3d6:4c6f:9d92 with SMTP id
 s32-20020a9f29a3000000b003d64c6f9d92mr20097126uas.43.1666649577519; Mon, 24
 Oct 2022 15:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-11-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Oct 2022 15:12:46 -0700
Message-ID: <CAGXv+5HoMAyLJ=25weerEsHNUt-pZj1E7Aj-mWvM+hoCvovpOA@mail.gmail.com>
Subject: Re: [PATCH 10/10] clk: mediatek: mt8186-topckgen: Add GPU clock mux notifier
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	miles.chen@mediatek.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, 
	yangyingliang@huawei.com, msp@baylibre.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_151302_728424_4E88D283 
X-CRM114-Status: UNSURE (   7.25  )
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

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Following the changes done to MT8183, MT8192, MT8195, register a
> clock notifier for MT8186, allowing safe clockrate updates for the
> MFG PLL.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

