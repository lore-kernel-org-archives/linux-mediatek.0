Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1BDC6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 03:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFRauekI8mX749A11zabMJwKnZcHcXKuDmO4So8v3vo=; b=D+UY6X4iWAowfrMVjJPQbQgKqI
	nGQEc/935PQQcS+0JOovRHdCB5likZC8CRguJP8queKGGuYBn7PB9GjZukMk5prv1RzjSAiQKS7os
	UOpn0V97dZ51tVN9QpsuOJSg0wTSSWagXzakWAcTp9NEYdtSeP1JhJzVVNE9Al2nh6+KYbhz1M3/6
	VQH9mMJN6CGsO4O9Qfx7rqTG+jf8RE/jBSr043ame3JqInyKzbwB53nQ5qgcnHQJp9YEvhKGD/crd
	7TXZRNFOEDfcvE04w0CiSfSKCu5omDKM9HSHW6dahZsYNjxH33MU59tN9NGyTjsvMGCTPRJxlxJbw
	a4vGlIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocegR-001Kl5-T0; Mon, 26 Sep 2022 03:21:27 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocegH-001KhZ-Gn
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 03:21:18 +0000
Received: by mail-ed1-x532.google.com with SMTP id z13so7178843edb.13
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 20:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hFRauekI8mX749A11zabMJwKnZcHcXKuDmO4So8v3vo=;
        b=AixRZnVWOzLnBwZfBtg6on2IFpinSMdiKGTGGn5iUYGSUPE1m3ciQrWBgacohOfZq9
         U71cXJlHnfjd7reOEUfvcUHl9kBuYXKnPwxe4kznA3T3bWB4rtqHA94ugxHWSNSTMvhJ
         pul2qPnhFvHhbaRs4NfMYx2PTEa67sX1Frz+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hFRauekI8mX749A11zabMJwKnZcHcXKuDmO4So8v3vo=;
        b=AC/wPFOyyOj8IihEpPRzzJ0hHLpSeVOFl9ZqUsLDpzDZALZhrxv+CuU3IvNeOvBv+H
         RcuVvbmvT9vDnY+2QL3MfMOU2oERMhz2ugjgRDS9p0jL/5oe7oTM8I0HApROoqBd6Mj+
         me5Ztr7+6cpcgxlsPj+7QpPhSEPM1tRIOs3onoASqylts+MrMG2+ECl+DJixgbYOkbkq
         qv8My/8ERPNchVSBRdeOa8D1UKavXBy3bBCe/k0F1a+8qZlaJtNMaW3e9EON06Zq9PUY
         tRawYHpU3Rwy7t3qzj8BOEkwJniz5oX3yi6E2pLGaOA8NvPth79DfGAfLBqkbUNCD7Bh
         hLxg==
X-Gm-Message-State: ACrzQf0Qpbv8y5zTbP/I50lPfu6Tjhf1qSQ5KJ3Yz2qwxK3lDoInTGwV
	cEZMcEHOLA3YBmGzs/eSZ0N3XrsZp065xxQnQ/emAg==
X-Google-Smtp-Source: AMsMyM68ZDwrrQBoFqZZC3KRonbtxs8Nb2DYXYPzyNANDUSJ7C79zpcMAPR6pS/a5apEOFxLB3kTcuzXbEP655raLi4=
X-Received: by 2002:a05:6402:3904:b0:451:f01c:9217 with SMTP id
 fe4-20020a056402390400b00451f01c9217mr19718052edb.78.1664162473029; Sun, 25
 Sep 2022 20:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com> <20220915072458.18232-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915072458.18232-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 11:21:01 +0800
Message-ID: <CAGXv+5FePqwjXW3A=7qZEayHEKc3JQOm_AFDXNZEJaapHqbxGQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] clk: mediatek: clk-mt8195-topckgen: Register
 mfg_ck_fast_ref as generic mux
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	miles.chen@mediatek.com, rex-bc.chen@mediatek.com, nfraprado@collabora.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, drinkcat@chromium.org, 
	weiyi.lu@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_202117_561058_F8F542F1 
X-CRM114-Status: UNSURE (   7.99  )
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

On Thu, Sep 15, 2022 at 3:25 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This clock was being registered as clk-composite through the helpers
> for the same in the MediaTek clock APIs but, in reality, this isn't
> a composite clock.
>
> Appropriately register this clock with devm_clk_hw_register_mux().
> No functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

