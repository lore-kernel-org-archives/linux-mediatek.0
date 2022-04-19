Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EA1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 05:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ye5VldzWO8pg7DBBZnnOkeaQfFhjyLBxP8YrWgCjKpw=; b=4vIwp7wqgdoMGx
	EtGEnLZbq4F5qsyb9QGKzcbuLCsiqTYm2r1VfeGtfR6lQv8dx91h1c7XX+gHIfrt/ktF3yBnkwAdi
	W5YuNNBlszXrXun6lb9Ic2VfYUAdXjmWjVJZWwQpnt8jZuMq8momFPnRu2oJXBj4fqDA/uuwj81ab
	42Ma3WdAkLnfopQwrWqhGoNhig9hn9hxg6J859NJ31E5SsFVKpNwb+Zmf4CVGV1uVk9A8SWQZnW9F
	Np0q4z4no1+kkVO/WzeHmaSa3tGwZeq7hlhn5RIGetVdZCgU/WEmEkixpZRD7f48Ubt/I50XnZP5x
	p6zOMKdyt7z96r/wMkrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nggjV-001cl3-0h; Tue, 19 Apr 2022 05:49:01 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nggjS-001cjk-Hn
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 05:48:59 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id f38so29212541ybi.3
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Apr 2022 22:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nMJ889Dz0Epk94th8NM3EDZyolTDHRMoctXfRSXxfd0=;
 b=Vx5iJ070v0mFXMFcDOjxZ8J6MVVAEYWG73pK/G8UxwB8GDV0NpdBihuTD+dxl9Tx11
 jA4hOZA9+5GSkKipnXhENUttTKNoejkJjvBQoofj1XjfhYhkbX2W2dxAysPpLeTh3Atn
 61tUCHd474/nb+6j3Muh9EnQYmm9BcBwVWqFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nMJ889Dz0Epk94th8NM3EDZyolTDHRMoctXfRSXxfd0=;
 b=IS1YCvSzXdIfGJv9dXZNBIXWJwn95+vI7V/8ajE5GU7RV/o1VWpKz35rq7lnSb8yjT
 cSubVpta2DKahcQS+8bJuaMsOD5Bfu8W9mQWznSxh5PndTVQeLldY0vxWsEo/EOb4RBN
 bDBQyxkVZ40SAFtIlzoijqTHlpjiWdcVZlSLpNWY6TeTAvkISvdWTbLh/iB8PmfbGJcC
 8u8lUVT+JrgDmXRj20SaJUWbD5tsrSBN74sIHHBhGsTpStW4db/gaOUCfWuBB5q4ItXQ
 knWpb6EdNHfNZQ9yrrUtmwUuzAswhJUKysq6VEz1FRd5ID6de8+t1C1iwJtunI/6dGcb
 DhlQ==
X-Gm-Message-State: AOAM5324i1thUClQsW0xxiD15BxxIT8fkaWz1sqAPpEs4/RBTsvqUb2e
 0SEr9VB74aNryvvN8XNRrXSI6vQnWCqdlEgymzHLWg==
X-Google-Smtp-Source: ABdhPJxCrtHIsV7KofTQzS7x17ALKuUB39G39gb4IwHCx6860d625lxMWoMCGDPQwz11vBINp5tlTNP0b8aQpGFQwm8=
X-Received: by 2002:a25:8d90:0:b0:634:7136:4570 with SMTP id
 o16-20020a258d90000000b0063471364570mr13323397ybl.582.1650347335888; Mon, 18
 Apr 2022 22:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
 <20220418132154.7401-2-rex-bc.chen@mediatek.com>
In-Reply-To: <20220418132154.7401-2-rex-bc.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Apr 2022 13:48:45 +0800
Message-ID: <CAGXv+5FXTft7-E5LnuZdNo8Tq6OKOKwt58GgJD_+z1N5u6B8yw@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: mediatek: reset: Correct the logic of setting
 register
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, 
 chun-jie.chen@mediatek.com, yong.liang@mediatek.com, 
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, 
 allen-kh.cheng@mediatek.com, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_224858_666553_61F8EC42 
X-CRM114-Status: GOOD (  11.09  )
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

Hi,

On Mon, Apr 18, 2022 at 9:22 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>

The subject could be written as "Fix written reset bit offset" to make it
more specific.

> Original assert/deassert bit is BIT(0), but it's more resonable to modify
> them to BIT(id % 32) which is based on id.
>
> This patch will not influence any previous driver because the reset is
> only used for thermal. The id (MT8183_INFRACFG_AO_THERM_SW_RST) is 0.
>
> Fixes: 64ebb57a3df6 ("clk: reset: Modify reset-controller driver")
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
