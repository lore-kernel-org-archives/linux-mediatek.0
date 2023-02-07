Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A25C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 08:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTuYq0wh0Ha5e/JZi49gtHl89wWgCPyAt0VAMeZNSPg=; b=4GN5HjzXLqn567qa+0peZDKSow
	A1IFf6EfqFktuTk6OKF2DOPoJRMjdC50Ere5Gu+Lhg7jtQXm5ThRNELkCa8yxiVL3pdnbXNSKkeQb
	BC6rVoxXwDRyJGLrAkxTtw5Rf1Zug3mxoCXXidNwCtl1LdA+rDki6ScUdiavJ+e1j4zy5BOFAkksQ
	9tS+eEawM5R7WBytXSiC45Ss75T58VjeHjzic9isGaDUWbrfG8yMKlsmAUdb7ZemgY24SVI6vH6vX
	n/EUswVcdGoDquyKdhGEobX9HYyY7qg6BpUM9/gg6jdby/LXuAL/D1ilel10xvoThs8yOgMV+ko0N
	m4YXM99g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJ1Z-00BFSc-Gz; Tue, 07 Feb 2023 08:08:21 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJ1M-00BFNq-Rq
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 08:08:10 +0000
Received: by mail-ua1-x936.google.com with SMTP id j21so2620076uap.5
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 00:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bTuYq0wh0Ha5e/JZi49gtHl89wWgCPyAt0VAMeZNSPg=;
        b=Uf0oqSFBef2a1mrodogZRfMbpWJvWhQbsNF0kPiXGDypT3gwD/NJmNxEgccU9mTWz8
         ramu3CsFoylAZoLODo9U9uZPp+hwst32zLAVjX9NBqguoCVhvci7mqNn6hEN3+9bSdOa
         2F3tmPUWUyI84TH12zzVQavTEli3Ric0YeEo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTuYq0wh0Ha5e/JZi49gtHl89wWgCPyAt0VAMeZNSPg=;
        b=IVuxr96uM8n6U9JP/HbHE07B+xCS5ilSQ639JV6qAluQ7U4EbYWyCXEHTlnIwFQI+1
         OYlohq0kQQ1uAHnUCD8c6n4YAVBEVRNKJ2v3LQmm58VkeJeu/Fdm2A39FzlNQwxOK6Rv
         sFCbkIvP8toe7HaZMKzbSH+Gq3bnYxnTnJMBzH8+VZ/7nrPLZDZoJe7T23T0BX9U/tmE
         eAfQUtSVKjsrMr9VgrVenkRs4rF236qCfL8Xh9NDIcw4ghFLmVHYRkjhBr7EeQqxXT8G
         qg9DVmfMtgE11RwVkWOevqnhS8CYKM3CgOuhY16Ywnxw9lgBLm0X1boG4zI6PCTnAdD7
         3MSw==
X-Gm-Message-State: AO0yUKXJAxpF2CX6x/yxKjFXEjtPq+pyH9Mopc7+kNLgW/8bXJlQ/HHF
	JMFTIHgg6Ipijup1N0r1egWIRlJ+N9EXSBjT3GmYug==
X-Google-Smtp-Source: AK7set/7W+6ki8pvexuyDYOumAa8CWiX97wy3VacbLOj5N7vZr1I9k2KRGuurkDuZjWbxhNPTH/KK6+YC18we+S4HoY=
X-Received: by 2002:ab0:2bd5:0:b0:5e6:3536:22e4 with SMTP id
 s21-20020ab02bd5000000b005e6353622e4mr406815uar.55.1675757285570; Tue, 07 Feb
 2023 00:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-17-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 16:07:54 +0800
Message-ID: <CAGXv+5Gb5S0k1c5EqPKoiBBHFyf7QBqyeWZkdAjQDCcTLYU_bw@mail.gmail.com>
Subject: Re: [PATCH v1 16/45] clk: mediatek: mt8167: Convert to mtk_clk_simple_{probe,remove}()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_000808_913593_E5AD47A8 
X-CRM114-Status: UNSURE (   8.68  )
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

On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Convert topckgen and infracfg clock drivers to use the common
> mtk_clk_simple_probe() mechanism and change this from the old
> "static" CLK_OF_DECLARE to be a platform driver, allowing it
> to eventually be built as a module.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Code looks OK, but vdecsys converted to builtin_platform_driver() while
the others to module_platform_driver(). This deserves an explanation.

ChenYu

