Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B249C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 04:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOR1HCqCWdSbaMEzOVaKKzwSu7f5OFySFkSjJn8FZ2A=; b=uT88kPOsfjINNAt7/hpQ8ezNDy
	CQ99ZVXci0uotkLL7xLDGIlvEQeEi9s9GSE+qN9XYXhERvp1m5xipcSzTOvzWge02po+DyKIcVog8
	GSeOLgy+HGcCPdXesx4lbKvgAuKueszESgrRdmLQfo4sxh0YvUbviUdSNH992GHRU+QpagrLxOzzV
	NM52sXOdbaIqLfXj3HqQzbqefATBHXUJWmmVQure0HvPIyzxSzkSoKPXCD5/GG4UzZL8oVml5QPrP
	5JoqrbeBdGLruzpzY5SL3HVC/5PybMPOzfEXz67TrFpiqgu5p6UsTeCvk5TzN+c+LPVxeURmxfaiD
	j0SMI7OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocfQD-001Z35-Ke; Mon, 26 Sep 2022 04:08:45 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocfQB-001YyA-Ou
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 04:08:45 +0000
Received: by mail-ej1-x635.google.com with SMTP id lh5so11388931ejb.10
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 21:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sOR1HCqCWdSbaMEzOVaKKzwSu7f5OFySFkSjJn8FZ2A=;
        b=jaTx8wpigkGkl6A5tkPzCkLvUK2IHWtK9xhaqrVZA41hzheFEIRPLj2QcrcPOPefHc
         JSstJMgcFxyWDwexkjIT0qyJuCEdOETqE4iQkc26xhSFcMCmWIYnIpI/zLswMWrNbh3R
         XFETvnNFiuhUF8Mo16DRTZGw3gOXuEEWS4r5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sOR1HCqCWdSbaMEzOVaKKzwSu7f5OFySFkSjJn8FZ2A=;
        b=le6TvbdmvqG/QBjGHzqQ+LQm/WAcC/SPSpOqo9zPmSttBpqUo7Rzku8CEwqoE+QC0B
         EAS0M4K6aDPK96zBGgw2UF3X0KAoLfVdh44N7ZBQ2M93lYQjVjB14sO73ZXU2oxXwPb6
         NW1IRInjQ83Bt/srvQnOWLKTG6hA8zXKYTJGms8CjnBkbKK8KDYVLAAgBAtrLzaicIqB
         3A1p43R65yCwPXaGErjsH+Xg0HJJdzSjQ8b4EvaOMj/KRxkn3e0HHOBuYuwSDskldswe
         wAZYF+umm+gWDXyuN9gdzegYIT9uSu/ho4t8DhxJyjUJBN3nDKdbXNANuYCyHeJ97uFI
         b+fw==
X-Gm-Message-State: ACrzQf1tA6wku5DjJ4N7r5n166b+z+mkNRIWP6VhfC3w3geqz0rbcQPJ
	pBALXfzGs8GmRmGGY4I2ac5gIgiWd8UDTF6d8lh33w==
X-Google-Smtp-Source: AMsMyM6AbSZNeSyPM3bn5XK6eCiXpj0PURzOGegzp8trgtGVJOL93SxM/MGKL4DedKUbISaYwJlDjKgnCzZ8mSWa/xg=
X-Received: by 2002:a17:907:80d:b0:73d:1e3f:3d83 with SMTP id
 wv13-20020a170907080d00b0073d1e3f3d83mr15972482ejb.372.1664165320144; Sun, 25
 Sep 2022 21:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220922091841.4099-1-miles.chen@mediatek.com> <20220922091841.4099-2-miles.chen@mediatek.com>
In-Reply-To: <20220922091841.4099-2-miles.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 12:08:28 +0800
Message-ID: <CAGXv+5GitZopbd2FOC=9QxEG7SDYK7zy6JvsBoCXgeiM_j9E9g@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: mediatek: mt2701: use mtk_clk_simple_probe to
 simplify driver
To: Miles Chen <miles.chen@mediatek.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_210843_858926_1108CE07 
X-CRM114-Status: GOOD (  10.08  )
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

On Thu, Sep 22, 2022 at 5:18 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
> mtk_clk_simple_probe was added by Chun-Jie to simply common flow
> of MediaTek clock drivers and ChenYu enhanced the error path of
> mtk_clk_simple_probe and added mtk_clk_simple_remove.
>
> Let's use mtk_clk_simple_probe and mtk_clk_simple_probe in other
> MediaTek clock drivers as well.
>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Just FYI, but you should have your patch subject contain the proper version
tag, and not just on the cover letter. Patchwork gets confused otherwise.

ChenYu

