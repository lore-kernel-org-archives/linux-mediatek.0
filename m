Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3E7C54EBC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 02:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdQ1c6eIJ8Pfh7VJVWDgTo7nFYYtcTyxyIymvuRY7c8=; b=UK5DynGpx7uwEPllQOdmtbNPtv
	e3ByoEJMbak/WbQn97CRgM0ovQ72xgWaWRr4qQn3l8env52K0DmhVcfXb+ZnqcWsZ2jOOHwoy9W1Q
	NREzDj9CTs7AQcUW+B7Ibf8WdvmCD1gxGdMbGXz+DJfMWtbvnxm+yD6HJXcS1M8GA5xxXq8FSXZYT
	EJd6x0lPr6FrMWk4j7ZaodqDEtFsM7jsITIO9Td9PmDT7U5HVcs3gFSpuLXsN3kcJuaDtg/gmMpJf
	JpmtmQe4eLbXj5bQJapOra44EgMvV1oLmF8mURjjne6DsUOtRkHmz+U6AyHFMy/8Mf8LtFfTjqTSN
	YrvZue6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFQpf-009Gv7-Pa; Wed, 11 Jan 2023 02:27:15 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFQpc-009Gsv-Nf
	for linux-mediatek@lists.infradead.org; Wed, 11 Jan 2023 02:27:14 +0000
Received: by mail-pj1-x102e.google.com with SMTP id bj3so11184838pjb.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jan 2023 18:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WdQ1c6eIJ8Pfh7VJVWDgTo7nFYYtcTyxyIymvuRY7c8=;
        b=OWz6nrL6Wuyi/TWAJns/mDs7pQZjgqFrZ9wUn5e/fzATmgMoVuVRsjAwmOSWW2+K+N
         z8zAIrFngkWZMTl1cShrD0INkGiavt+5wH/F0YAttPa9YJAH62VE9kTl5UuW+bXCLqEc
         H4K73gA1/jtHMuUOJkoIYBm8LvPP/GHCWxY4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdQ1c6eIJ8Pfh7VJVWDgTo7nFYYtcTyxyIymvuRY7c8=;
        b=xaUxvE7UjLimYB+8FXHae2FLqs0AspYSqBquxalrMJAsQY27Gsl+TOaCIflnDDDO4A
         HFcXjHGJX3zhc/5jPH7D/KuLjJVmgOUgN+C72xKST1MIsIMTjTcO9i/H8EvGrFAp7M4r
         vcwd1L/FAVXYxdfR0rKiEHeDy0tgkSTRUZoSQ++EI2jdYdIktou5gIRCKX/pYDdTG4jC
         IHVG9vD8dsgb9uw6FdLVGeixuZWyuuoFgnLhN4BOiP+VXI6z+S/IiX0O6hYSKdbBih8z
         e+QfT5I7s2HFNSq/thsIrfa99UZfdLD6QQciTq5gpiLWLL49wfQbAm3p5aMJGyafYtoA
         q7Hw==
X-Gm-Message-State: AFqh2kqrI+IHM9u3olUz0pboEa6JwgGb8zfrq8gYKkhb2BNKNktkMKqu
	6EfmyXKYCN7mZf1U+2fLzXfydA==
X-Google-Smtp-Source: AMrXdXvXToYtzezykd+4mKc0RKkAYBPN8uoLeLVJ1EmSVDKfwhrNLNUGBwdmAi/c8oZEsXTdioXOUw==
X-Received: by 2002:a05:6a20:548e:b0:ac:19cf:1553 with SMTP id i14-20020a056a20548e00b000ac19cf1553mr96271314pzk.61.1673404028343;
        Tue, 10 Jan 2023 18:27:08 -0800 (PST)
Received: from google.com (2001-b011-0003-1479-d038-ab51-d40d-2b1f.dynamic-ip6.hinet.net. [2001:b011:3:1479:d038:ab51:d40d:2b1f])
        by smtp.gmail.com with ESMTPSA id t2-20020a1709027fc200b00192f9991e51sm8649128plb.251.2023.01.10.18.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 18:27:08 -0800 (PST)
Date: Wed, 11 Jan 2023 10:27:01 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	johnson.wang@mediatek.com, miles.chen@mediatek.com,
	fparent@baylibre.com, chun-jie.chen@mediatek.com,
	sam.shih@mediatek.com, y.oudjana@protonmail.com,
	nfraprado@collabora.com, rex-bc.chen@mediatek.com,
	ryder.lee@kernel.org, daniel@makrotopia.org,
	jose.exposito89@gmail.com, yangyingliang@huawei.com,
	pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com,
	ikjn@chromium.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 09/23] clk: mediatek: mt8173: Remove
 mtk_clk_enable_critical()
Message-ID: <Y74edWvIF6I40ANt@google.com>
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
 <20221223094259.87373-10-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Hk8kguJ=joLXF3OrRXxGvuFAJFKYoK+y7q+wqDBS-wtQ@mail.gmail.com>
 <8bc4330b-0cfe-222b-7b8a-35fd15a30a52@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bc4330b-0cfe-222b-7b8a-35fd15a30a52@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_182712_806834_817B3838 
X-CRM114-Status: GOOD (  25.02  )
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

On Tue, Jan 10, 2023 at 01:32:34PM +0100, AngeloGioacchino Del Regno wrote:
> Il 30/12/22 05:58, Chen-Yu Tsai ha scritto:
> > On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > 
> > > The entire point of mtk_clk_enable_critical() is to raise the refcount
> > > of some clocks so that they won't be turned off during runtime, but
> > > this is the same as what the CLK_IS_CRITICAL flag does.
> > > 
> > > Set CLK_IS_CRITICAL on all of the critical clocks and remove the
> > > aforementioned function as a cleanup.
> > > 
> > > No functional changes.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > 
> > 
> > Looks good to me,
> > 
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > 
> > However, if you move this patch before the previous one ...
> > 
> > > ---
> > >   drivers/clk/mediatek/clk-mt8173.c | 41 ++++++++++++-------------------
> > >   1 file changed, 16 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
> > > index 70cdc0719658..02231f8ba6d9 100644
> > > --- a/drivers/clk/mediatek/clk-mt8173.c
> > > +++ b/drivers/clk/mediatek/clk-mt8173.c
> 
> > > @@ -846,23 +852,8 @@ static const struct mtk_clk_rst_desc clk_rst_desc[] = {
> > >          }
> > >   };
> > > 
> > > -static struct clk_hw_onecell_data *mt8173_top_clk_data;
> > > -static struct clk_hw_onecell_data *mt8173_pll_clk_data;
> > 
> > You wouldn't have to touch these lines twice?
> > 
> 
> That's true, but please,  I prefer not to, as the patches are ordered for
> eas(y/ier) bisectability in case anything happens.

Got it.

