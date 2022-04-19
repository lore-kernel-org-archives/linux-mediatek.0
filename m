Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C036C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbrdSzng5WjZM5dlrivBmwWuK4IdlkECIOyWLhxMTio=; b=k7s7CD7cbutTZ7
	OIKkiJst1dVp1MxucEGfSJz3iUUHCGWce0njn+9uzMHNcb9G8uaAeUNmJXmUSTdZU4aFcJVhSuP6C
	kNGcFgW7rX/JRyAtbwr1p5Uf/LJXtSPqgPougt1gcBLaFwrpYgGVLCV3wexvy9ZVR0yZ5xaqSm4pZ
	Q1/3JWsw6zwbfEN/dy2aXkCz9fWYgCC2v1wm+bFa/ZidE6lQk2cmokcIqIAYBJeaKr2cJhCJloGPC
	Z5VLOWUhPBQ8pFJYRuaDYL7dEBlF8IXHdXhAjnNG2H0lib9p2ttqTH6qu2iUWZixJKgyflLVVapHL
	YmTsqB3CRlySt90rViPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngiVu-00269Y-Ro; Tue, 19 Apr 2022 07:43:06 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngiFj-001yXP-EI
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 07:26:25 +0000
Received: by mail-yb1-xb34.google.com with SMTP id j2so29575925ybu.0
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 00:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+By+13aHrceERiXA8GaEyKGJGM9u84eKKU6Y0YD6p8g=;
 b=fvkANo2FkoqNw6ZvlzaUVbW++TfLInC9ftwHPOqz4I98vSskQfWr3jt9O4B+Fwqpal
 E91c+rV32XQU5elL2iLzNVD+LhrE3Hewf/vgwbuc2y5ut8D9p8el96K5P6328Ghj/Jja
 c1pxvGN01z0hmxF8mDy+R2GBzvbjj+lCpqrfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+By+13aHrceERiXA8GaEyKGJGM9u84eKKU6Y0YD6p8g=;
 b=Y6LiRQC40qsBC2ZxNoziQ2FNrkcayZVDyp7G9uTO8Voo3fxVpPUNbiheEo+ox+BYDU
 11zUfz70wVyL2q5519UbGTlOPLdDZlp6dN4o0lMnrRMRijtmtcLeUjaRTgCbSQgKFNRJ
 D8cK1IAekA8IYEbTuqLaOl5zTwBkCwLXp0HUwnuU8/AAfejTXDzS7wDuC8WGfqdmn62n
 GvHnKyGIUVfs+3Tv3QDrDkYE57j/lnxC2aB7uOx6hn/SUddp5pcdNQN0gZYCTUMUYOVA
 +p5VR59LS5Ze5v0lXq2NSQSFK14s2PIZIliSFooLJs63FgurbWvzSnkPkMj91TUrfFc4
 OewA==
X-Gm-Message-State: AOAM531BoizNlLLtfSBP5NkSy+CJ1Ut1dtRspHr6paLPrspwVBrSzElV
 FhypIa0L2wkG6Rf6WeuwUTam9cu61pbrIoeKl5+/Tg==
X-Google-Smtp-Source: ABdhPJyd6mZNo4xSs1xhZ5G3ywreqo4IEKfjKNlDn371K9W2aVL1vr9zOwSMuV+fUn1XPgz0cHx6O3I15DkvyCvkyFU=
X-Received: by 2002:a25:c708:0:b0:641:6421:a183 with SMTP id
 w8-20020a25c708000000b006416421a183mr14895321ybe.164.1650353181704; Tue, 19
 Apr 2022 00:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
 <20220418132154.7401-4-rex-bc.chen@mediatek.com>
In-Reply-To: <20220418132154.7401-4-rex-bc.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Apr 2022 15:26:10 +0800
Message-ID: <CAGXv+5GQR27+iomwHfwYb0gB_QVTZSy6TaZ+1qViMmNPka3Yjw@mail.gmail.com>
Subject: Re: [PATCH 3/7] clk: mediatek: reset: Merge and revise reset register
 function
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, 
 chun-jie.chen@mediatek.com, yong.liang@mediatek.com, 
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, 
 allen-kh.cheng@mediatek.com, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_002623_560770_8484C05D 
X-CRM114-Status: GOOD (  11.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 18, 2022 at 9:22 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> Merge the reset register function of v1 and v2 into one function.
> - Input the version number to determine which version we will use.
> - Add return value of reset register function for error handling.

Please do this in a separate patch. Also you are adding error messages
for when of_clk_add_provider() fails, which is not mentioned either.

Most of these platform drivers require a good cleanup of their error
handling anyway. It might be a good idea to tackle them later. Or if
they look the same, you could try using coccinelle to do a bulk cleanup.


Thanks
ChenYu

> - Rename reset register function to "mtk_clk_register_rst_ctrl"

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
