Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F286C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 07:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUSv71/IGUnLZD3B7OqwypzfXMZ43qFnSxJzO/o+ZQY=; b=MySEmUC5R55/nST1uIDpwWDEYb
	x3w+R8jjVrMK9fcjV1MVpuznTHW4Qz+HXo43PbEH+QnPqhi4DRVNSRF0J1h/m4R/plq6kw54iI5W2
	Os3w5wXXM5a1VSrlIT6oKLOHudiXmNe0H7XiBakD9rIEYtuejGfbKK6PHD/1NiYD6IqZ5w5uMThoE
	NYRjzSTh4cievrn7Dtjx9Z2ue/3ERgkzLSN7hBSvyMGRFr8xHf1Zt+uIGDPxE/ViHAp3SGQXlhaXd
	qD3nxeJ0ZceniTNvMluYRtyYVqPgBLxD6EpJQoAiUpfTvk+Vb3NBlB5fIneohtjxuP/4tHYFF8CqF
	c+3ev0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYju-008oYr-5Y; Thu, 16 Feb 2023 07:31:34 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYjq-008oXK-VQ
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 07:31:32 +0000
Received: by mail-vs1-xe35.google.com with SMTP id h10so1015758vsu.11
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Feb 2023 23:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HUSv71/IGUnLZD3B7OqwypzfXMZ43qFnSxJzO/o+ZQY=;
        b=lAuAzQBc6RPfyQw1RL4QShGpRtE4xcMHq/2n0N2BFrMRgDJcfz6frJyd1Dwq+5oJga
         jEseA9/wlXPnu85ei+RhL3vdgtyuNftxH1PEJEjPP9ZeiI/4VmcexikDTe2M11f+pLp6
         09dy0cr/Hn2x+iSW5BoOJ6J6SeutIiZkPajig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUSv71/IGUnLZD3B7OqwypzfXMZ43qFnSxJzO/o+ZQY=;
        b=2nAolaP6jDyc2LU7fovfvqc5q1XPdz4EaGsLG/k0AewtlnGOeirfgD3dyAqnRBvQsX
         XFL5bCzgPkURHP2gpQr/enx47ocU6wnnZ4zrrbjKzIXGSTR/yBIj0i3xHVgddTL5hqDv
         fkkF9GHAlVCz1CVFosUtsNP6jR4c5eWgnENV6qLyLO7Io9YbAQsk2llVBnbRBPKfB79x
         iwA2mXgs2SAV2MroeJn8T+YObXFBcsE2pw4GFIiQkpjq5EL4bBdIUcqIawQJlLe4rhp0
         FlEVV0zU8eTmLtjHLp1RIW5P0CzMMgjqJKAcORpRmtx1GO1/2CcCjg33az/n23DWx63M
         C20Q==
X-Gm-Message-State: AO0yUKWy/+J9ltD/LXp3KYnoS70ZzqeqOtSMQkU961R6ZaHUcEEIurk9
	1EUz+dfBSqXMbO7ajvfbsWga95z9VCp1v01mVoeHsA==
X-Google-Smtp-Source: AK7set+rAe3Uideghnpky0Dpb6VVBSz9U/PEGIpuRQLl1kaAID4ZC3fanb6bymAJ5g+9JkkTYRedPB+bRUySXN1J9m8=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr931762vso.60.1676532688934; Wed, 15 Feb
 2023 23:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 15:31:18 +0800
Message-ID: <CAGXv+5E7Ht4CJkGSK18Fc0Hwc4wbJx6m8Fyyg5KkLsEgfKYSug@mail.gmail.com>
Subject: Re: [PATCH v2 09/47] clk: mediatek: mt2712: Change to use
 module_platform_driver macro
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_233131_036284_5261E7B0 
X-CRM114-Status: UNSURE (   9.61  )
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

On Tue, Feb 14, 2023 at 9:41 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Now that all of the clocks in clk-mt2712.c are using the common
> mtk_clk_simple_{probe,remove}() callbacks we can safely migrate
> to module_platform_driver.
> While at it, also drop all references to `simple` in the specific
> context of mt2712 as that was used in the past only to allow us
> to have two platform_driver(s) in one file.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

