Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD12AC54E76
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 17:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSsjSZLw2nnMiY4uzIYBeHgb7SrIecIpavNAgqHfew4=; b=qnGD9BfRrLsHqYn5DlxEb9wKGr
	gzP9XYGT0jHE174qTUz9f8OC8ilxF4SsELmO4SGmkTAzzCJnBYbYooSg8G6jiBNtiEvB+CRnzfvXb
	6cD9bdMP8MGAybSq5Q0ZUJaDPsdfU1IIs+gjWIaukNaAKD44O8pycswiKNyWX6K/sqds5AxG4OATF
	28BpjSI9tgajRQNQ59L+3eV624k8jtAeKq+w3VCqv44QiNqBZmwUX6Bzru9I27mbArIs/Opvkbof4
	hQqZmNi7QsuBoOZiCRt6w7UukkJNasweF/FozQqW1JWQS/WY4/0RFT6zNRdVNeUB8QTE3I/m3J2Ry
	SDiDUT3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDqNo-00BQ9n-0k; Fri, 06 Jan 2023 17:19:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDqE7-00B6gv-Am
	for linux-mediatek@lists.infradead.org; Fri, 06 Jan 2023 17:09:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id s9so1837948wru.13
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Jan 2023 09:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LSsjSZLw2nnMiY4uzIYBeHgb7SrIecIpavNAgqHfew4=;
        b=gI+GkFENMZ1YF4920k6ktVFlhiSghkF8wasO8OI39wGNMuhF10+5nC9KSEq9YCtsk8
         pnXEKaD1vYI868EzTmj9lF6ZZIPlP71fSozVJH4v+CM60J2YTCG5nwxNtXOugvZk25ic
         2SgxHHn/nG2E2VRa00sEYKMPIqrhWI1OduxEMe6N3fTzIl1a5C1frS+SOcndNjmRb6qG
         kqiRhEAvIv3zAuuevWyLbf3gxdbMKrTBwA+bzhCTyGnaVwm3utYD0z00sbK8zUudq7vF
         O6NIQyUZ1tJ8ZA1i9qsaRtaMk5I8ZHPryXno8bfi+m4DqIKyUFuLsqEMRyUXktzE8rZE
         A1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSsjSZLw2nnMiY4uzIYBeHgb7SrIecIpavNAgqHfew4=;
        b=B9Qlx/rWaEunF4L4FMwNeycF+p0sI5oOpHuWTWn7wdoRr+DZOenMrB6sJAJMnDng/g
         HzTxA86uX1UnMDzzWFvVWLa38qp+lrEIj0bYqJy7kDT+78n7xf2285ZTNvuMdUqpM1g0
         j7WqCLEBxgp9cKXulAGgRdTiTwHbNtSnVU5T84zjNNlLYtGFbppRWYRKywM/FBtA+GTL
         yRqJ75Lzo87pF1n27Xc4mqsQqFmTYN7353xfdIKEERi0+YfzHGUfxG8KCI7Q8edHRoJk
         RzBqIUess6gOYQDw4K12mINui/M3XTf6a0BrnC+KHKGY8RCI+qL2LyDUR1cfOORrkUzM
         EOkw==
X-Gm-Message-State: AFqh2kq8e0z9ANJHq+oAbpfVyzwLUni/5wFkwohrW8rp/OHqbwehOKI4
	N7NatMKf1Sr0+cyVuvim+zDgtw==
X-Google-Smtp-Source: AMrXdXvP048hXDp25O/bVkFsD7hfVgHLup2HHrx0e83cjxssZRjxMAk2z+wtJBwXQZaVb4ItdMtHkw==
X-Received: by 2002:a5d:56c1:0:b0:288:d139:3690 with SMTP id m1-20020a5d56c1000000b00288d1393690mr21420018wrw.67.1673024993035;
        Fri, 06 Jan 2023 09:09:53 -0800 (PST)
Received: from blmsp ([2001:4091:a245:805c:8713:84e4:2a9e:cbe8])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600001d100b00241d21d4652sm1733540wrx.21.2023.01.06.09.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 09:09:52 -0800 (PST)
Date: Fri, 6 Jan 2023 18:09:51 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	wenst@chromium.org, johnson.wang@mediatek.com,
	miles.chen@mediatek.com, fparent@baylibre.com,
	chun-jie.chen@mediatek.com, sam.shih@mediatek.com,
	y.oudjana@protonmail.com, nfraprado@collabora.com,
	rex-bc.chen@mediatek.com, ryder.lee@kernel.org,
	daniel@makrotopia.org, jose.exposito89@gmail.com,
	yangyingliang@huawei.com, pablo.sun@mediatek.com,
	weiyi.lu@mediatek.com, ikjn@chromium.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 05/23] clk: mediatek: clk-mtk: Propagate struct device
 for composites
Message-ID: <20230106170951.rn7w2lwwdckruuie@blmsp>
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
 <20221223094259.87373-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221223094259.87373-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_090955_400115_0BE7A548 
X-CRM114-Status: GOOD (  15.93  )
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

Hi,

On Fri, Dec 23, 2022 at 10:42:41AM +0100, AngeloGioacchino Del Regno wrote:
> Like done for cpumux clocks, propagate struct device for composite
> clocks registered through clk-mtk helpers to be able to get runtime
> pm support for MTK clocks.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt2701.c          | 4 ++--
>  drivers/clk/mediatek/clk-mt2712.c          | 4 ++--
>  drivers/clk/mediatek/clk-mt6779.c          | 4 ++--
>  drivers/clk/mediatek/clk-mt6795-pericfg.c  | 2 +-
>  drivers/clk/mediatek/clk-mt6795-topckgen.c | 2 +-
>  drivers/clk/mediatek/clk-mt6797.c          | 2 +-
>  drivers/clk/mediatek/clk-mt7622.c          | 5 +++--
>  drivers/clk/mediatek/clk-mt7629.c          | 4 ++--
>  drivers/clk/mediatek/clk-mt8135.c          | 4 ++--
>  drivers/clk/mediatek/clk-mt8167.c          | 4 ++--
>  drivers/clk/mediatek/clk-mt8173.c          | 4 ++--
>  drivers/clk/mediatek/clk-mt8183.c          | 6 +++---
>  drivers/clk/mediatek/clk-mt8186-mcu.c      | 2 +-
>  drivers/clk/mediatek/clk-mt8186-topckgen.c | 4 ++--
>  drivers/clk/mediatek/clk-mt8192.c          | 4 ++--
>  drivers/clk/mediatek/clk-mt8195-topckgen.c | 2 +-
>  drivers/clk/mediatek/clk-mt8365.c          | 5 +++--
>  drivers/clk/mediatek/clk-mt8516.c          | 4 ++--
>  drivers/clk/mediatek/clk-mtk.c             | 9 +++++----
>  drivers/clk/mediatek/clk-mtk.h             | 3 ++-
>  20 files changed, 41 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
> index dcae25778817..bd62acb5d697 100644
> --- a/drivers/clk/mediatek/clk-mt2701.c
> +++ b/drivers/clk/mediatek/clk-mt2701.c
> @@ -684,7 +684,7 @@ static int mtk_topckgen_init(struct platform_device *pdev)
>  								clk_data);
>  
>  	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes),
> -				base, &mt2701_clk_lock, clk_data);
> +				base, &mt2701_clk_lock, clk_data, &pdev->dev);

The patch looks good in general, just a few nitpicks like this where you
could adjust the indentation to the open parenthesis.
'checkpatch.pl --strict' will show you all the locations where it is not
correct here and in other patches.

Best,
Markus

