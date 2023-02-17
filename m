Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76147C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 04:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biYLXd6zLKOEnttLE3/cOU8elHlE+31ZWmdhQJR3c0g=; b=isaEkT9qCGVShx5hdIyCbaPIyP
	0FmwxybobiEiIGrImxrKu1LTz0t3INARy7Pd1eyVw+yofDuBZGC71ibvYzlZ63lsdHTHL6v7VPVG8
	gqNdv5tly9hmncD/eREtrh3SXYIcnVLmNSoW3BRrqHIOe0zQ58p1ElAl4HI+/hrjDBceky5jXSIfo
	J9Bc32zUeUDhyC2fR5anCdtpdmQDaIUj4+RePq4bx26yPfvR5+X2efeffOnd7Vx+DZPcDj1ZjQApd
	B/nwD8yWpr89q3XPdD3TyINihWhp1WAQ/XWZyBRje3a5ljkQh3VATbx5LPY9wOBhNGTkea3YkGP2y
	eKWVqZ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSs59-00CZCa-Fy; Fri, 17 Feb 2023 04:10:47 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSs4y-00CZ9K-ID
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 04:10:37 +0000
Received: by mail-vs1-xe29.google.com with SMTP id k4so4315127vsc.4
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 20:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=biYLXd6zLKOEnttLE3/cOU8elHlE+31ZWmdhQJR3c0g=;
        b=jXG1EnjySiZNlkImd2oRt2F05M1sX6iZ+1TAE3lOLJ18zaa8kVvrNECMIzjAeVEjdM
         ewMQHA5biBEwJzBbqHS9+OtOnca2urVimkY1pRAtermRsdwgkAILk7H4tPYzM+c1u7+I
         2lg2c1k2PE7GOjl4zEwclFgZOxcMG35sHFHIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biYLXd6zLKOEnttLE3/cOU8elHlE+31ZWmdhQJR3c0g=;
        b=kAaefp2oUDqF3F0SjndMI5aKi0ZBmZ/9rDL/BEifH+OFF6j1aJQHg4HGXCT55vgyY9
         b/Dw6mOh+1kvWP/XlwjYZRdAENN1WAk7C6q582FzBlPOq1pUHJXonarsjREpf3QcH2P8
         JxuqB5gkq4qGeMhqnJ78dlTYJ2GfiI0u2pwyTu9nI78xYWtR4GlDaJT4JMYrMF5ouUdF
         ProECE/+sg7n5tS+zUncqzjaYlobDvRWXAQJSD1x9bgMKd1HNbWzltpo8EFtYjom0hHH
         qnIMgN1jaXQjmxFs7g7A+TaBEUjNMwj90tbVjTx1VYB8JENivzno2bhrIhCQWNwnCx7y
         E4XQ==
X-Gm-Message-State: AO0yUKX3cU5aAu6g5iuUbcqI46EIapp3FTwqq38IYwR5Pk6aH+sFBpYS
	yx1Q0S95nDTLkKAe3HnJRLv5MlWwaSKPff4evNSOnQ==
X-Google-Smtp-Source: AK7set88DOusSbZcPo23P4TEtI/y5yijtupuoFWWF6867RetZ53dzqg0jKJ0+NELE4AX7JEyQJcRvQvZ7O2nrBwZax0=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1524838vso.60.1676607034730; Thu, 16 Feb
 2023 20:10:34 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-31-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-31-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 12:10:23 +0800
Message-ID: <CAGXv+5G+QXoG__8bSDcQxOUDThcQGpaVZoQy7h-BN_GASq8y+Q@mail.gmail.com>
Subject: Re: [PATCH v2 30/47] clk: mediatek: mt7986-apmixed: Use PLL_AO flag
 to set critical clock
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
X-CRM114-CacheID: sfid-20230216_201036_622936_8B1638E0 
X-CRM114-Status: UNSURE (   6.80  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Instead of calling clk_prepare_enable() at probe time, add the PLL_AO
> flag to CLK_APMIXED_ARMPLL clock: this will set CLK_IS_CRITICAL.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

