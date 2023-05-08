Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DC4C77B7F
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mqn1KEnwyqGdeTv677y/SImyCACSQbNkaaVgC/3IO8U=; b=Z9y0XLbptErWh8qymrjM3jOvK7
	B8W+VKqNGiqSr70UsOQOcSCqNzj1ABCQvoUVPbREHhScI/OLMvFl0KSC/Xur8zMbQFVb6gUKKQ8HY
	1+AkCOTSjhSNjN3PRL+0XGZQrhYuxMCgEePkfnaETPBDXIs1OgGA1p9cOADQTPEoORVKkCJft2JlA
	beTOJ5mhGUwgTNyr53pQdOOMDfQ/A7ojvtGyG1kxoAUSbr0nr7y0PKWRg9kfgI3PYYcwzcjgozcC2
	5hpebzyzfK8sXtKsyQR9Q4bmGloMxIRFCZYw5NbZwXo0B+uCDKUMhD5yCNAqVCHxV0M596w3RFCPS
	xbmvaCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwxC-0003jB-38;
	Mon, 08 May 2023 09:14:46 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwx9-0003hi-0p
	for linux-mediatek@lists.infradead.org;
	Mon, 08 May 2023 09:14:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-30771c68a9eso3640007f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 08 May 2023 02:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683537276; x=1686129276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mqn1KEnwyqGdeTv677y/SImyCACSQbNkaaVgC/3IO8U=;
        b=I3L+5FeYMvJvQuU7Qu76mdUd1ATQsaT9+QYqpPqVQCMhlS/mcRnqixhHa683tVS/4N
         YQOWLHE85n94zlIOvHipGq05bHg0SvQaQ18qsTZ6xtHTrsAawJjB9fRDkmQMpMopgfKh
         RXbVV6hTqiY28pLZJKjxgL1UV50T/rXjFX/DAcHhczTQQ9l1FspCaz165MJpGnIBdGxL
         Efs9wVDZ6Qsghu2p/lelXDhn4FoxqKDDwINEbHU7hNtBNW/eMuE0h6VVPMntkaVPUBNF
         Flo3MPGYfD9+v7IIF6O8g3HA3V1wWT1RndHZVqUjRHRTEDX1FYelWwn9mptOQVzo7HSr
         szYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683537276; x=1686129276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mqn1KEnwyqGdeTv677y/SImyCACSQbNkaaVgC/3IO8U=;
        b=dOkKJE7CyIeYDmNCIZrFNKJP8YUEvtXsR5y6QSxoEFDQB2Sl8HBAoyVTo6Vy7Ng71v
         gyTNW3AeaN/Juutb/dIAsfAAiVN4aRIq3wlfIgHIPmTEogYZWU1zufCw0V8DxL6Cov1Y
         Qg1skcy2wuj6vAkOIKqw9bUIJp2H81fuwJvxhX3vmzxgh0F+tKM9WwbtCBativ6p2ILw
         2kbfRli7pCECYJLlnuiotFGQpussgg0v4gqMqw2H5AHoNU8FI0STcY7R+ZjGNNGhv3B3
         9ytJRTbilTeZJ5Ug7saBWg6zUVT/HuZlAzpcrmeta+MUkkYdDJf2UiqMgKikx92ppCnP
         cQfQ==
X-Gm-Message-State: AC+VfDyn4Xd8F1rxdPVXEOdjV/LjJ2Z8m+F9xcBD6AaMqgv+1l/b3tnE
	mrk7zBXL2pzNiQv+L+qY5MkctA==
X-Google-Smtp-Source: ACHHUZ6YDKha54Cnz2LFGQT9b+BTJJ2/To/WjHC1YJxC5/mfCRn08nzx5DVpzj12Y38H9kkmeh5Brg==
X-Received: by 2002:adf:f4c3:0:b0:2ef:bc0b:e70 with SMTP id h3-20020adff4c3000000b002efbc0b0e70mr6656855wrp.54.1683537275955;
        Mon, 08 May 2023 02:14:35 -0700 (PDT)
Received: from blmsp ([2001:4090:a246:80f3:ef71:25ff:df82:9cc9])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d4c42000000b003063db8f45bsm10662309wrt.23.2023.05.08.02.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 02:14:35 -0700 (PDT)
Date: Mon, 8 May 2023 11:14:34 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
	wenst@chromium.org, chun-jie.chen@mediatek.com,
	mandyjh.liu@mediatek.com, miles.chen@mediatek.com,
	zhaojh329@gmail.com, daniel@makrotopia.org, nfraprado@collabora.com,
	rex-bc.chen@mediatek.com, Garmin.Chang@mediatek.com,
	yangyingliang@huawei.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 1/2] clk: mediatek: mux: Stop forcing CLK_SET_RATE_PARENT
 flag
Message-ID: <20230508091434.ww2o2nsavpineko3@blmsp>
References: <20230505093733.221922-1-angelogioacchino.delregno@collabora.com>
 <20230505093733.221922-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505093733.221922-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_021443_314675_180EE2FF 
X-CRM114-Status: GOOD (  13.24  )
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

Hi Angelo,

On Fri, May 05, 2023 at 11:37:32AM +0200, AngeloGioacchino Del Regno wrote:
> The clk-mux driver was forcing the CLK_SET_RATE_PARENT flag even for
> the GATE_CLK_SET_UPD_FLAGS() macro, as in mtk_clk_register_mux() the
> flag was unconditionally added.
> 
> In preparation for a change on MSDC clock muxes, stop forcing this
> flag and, where necessary, update clock drivers to add it so that
> with this commit we introduce no functional changes for the currently
> supported SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt6765.c          |  8 +++---
>  drivers/clk/mediatek/clk-mt6779.c          |  6 ++---
>  drivers/clk/mediatek/clk-mt8183.c          |  6 +++--
>  drivers/clk/mediatek/clk-mt8186-topckgen.c | 12 ++++-----
>  drivers/clk/mediatek/clk-mt8188-topckgen.c | 24 +++++++++++------
>  drivers/clk/mediatek/clk-mt8192.c          |  6 ++---
>  drivers/clk/mediatek/clk-mt8195-topckgen.c | 30 ++++++++++++++--------
>  drivers/clk/mediatek/clk-mux.c             |  2 +-

After grepping through the files, I think you missed
drivers/clk/mediatek/clk-mt8365.c.

After adding that file to this patch:

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best,
Markus


