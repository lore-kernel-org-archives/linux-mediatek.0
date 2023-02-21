Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E333CC6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 07:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vbc5+PWjBMqqOs23vNflMUj0LpSmaqSkZSK7MLtQNdY=; b=k2TbEnSkEzxXEKPYV0HdqOTgWl
	Plryz4gtAQMmrvG9oKtVLCCEK4Rp4jZ5jxjhru6EB8uFuWp66C/vCtWke3IbI9cJcXPJ5AVHXSJDX
	GZG3WsaMRvtjW0lP7SWK3Eb+lTi/qtDcjOHn+QvQ097VHmfWEyi+dw8QQ2gsPYgYiLNDBJETHh15S
	8AEfUlIO8VgiLZ/Km3Du7uHFomSGxpen3Bko6tAS+EQjv+Y9SD/L9Z3KVJZ8/J2h7evhkhYMAGFm+
	WJoWHIwbXsAk1SQmExV2lw1RPjwT2U+WfkF9eKCuS5dgAU1o6St7w2+2dbO8HM7mTY3uK/QZv4KZT
	N1UzHe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMsp-006s2w-NX; Tue, 21 Feb 2023 07:16:15 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMsd-006rxo-4t
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 07:16:04 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id x14so3261744vso.9
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 23:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676963762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vbc5+PWjBMqqOs23vNflMUj0LpSmaqSkZSK7MLtQNdY=;
        b=cxs+VrB7WJHMk4oly9w7lBF4j83z/RT7TkHrzECW44Cfe1Cslqmlk4fnc9EG7a77pj
         jznKiD/o4QH3YFSTyke1HM7vXxIEYGu4VWWMxXbovTuQRAswbR/l7+fj+E8leXh9cpHI
         mvFKY7KDxf8CpIMp41TaVBMxSfo5Amkrmzpfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676963762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vbc5+PWjBMqqOs23vNflMUj0LpSmaqSkZSK7MLtQNdY=;
        b=tYqD61SuGx5d4fnmMX8eoEW0Q3X85P2+GwGjsUOj1moVqvOpJYPSuA+zZpzGx4VqDz
         7c10knqKnC03OGHTMRIq0xLXtaSwSrzjuOeaW5vcc7qRw1XFG6DXwylcNfolBdTJDzK0
         Tkt0IQSCyg+j4NzqGJI4iRMJrsEpQg+ItKjS48luiF0+R8Mtzs/BTQ+GAHp1/jQtEwHD
         K78ELOBYI8HQ1Zrs5Ei7Jb0YVh69FryemNOAOFhq8di9qrf/NFQC43iWZDkKQHV6mj95
         JeBaD9fbDEWfonBbX6XxMbgUJbgtW6BZNHrTQsCQNsku6TqZDmyXbVDikb17MqGseoQm
         bSeQ==
X-Gm-Message-State: AO0yUKXVbs2usS1SW03LiO48APDcYHqQZ6WjiGA3t0x0kYcSiUzFqtjH
	giPJfX73z8QA5QTcUvZFOGhEv2Ssx6K5tzUeSHefPQ==
X-Google-Smtp-Source: AK7set+4HmFRKdGZ8coYddQ0NEYgKqbmpjRUwDPjqAc30x8eIbR6ErTneTgm+HFMA4NKabjwWOVQ3MN4rQeplEurWXA=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr909353vso.44.1676963762165; Mon, 20 Feb
 2023 23:16:02 -0800 (PST)
MIME-Version: 1.0
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com> <20230216130021.64875-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230216130021.64875-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 15:15:51 +0800
Message-ID: <CAGXv+5ErU3yZgDbcSZuwnPbkwD1NzhqwEvLThCeOLO2xRaV8CQ@mail.gmail.com>
Subject: Re: [PATCH v1 9/9] soc: mediatek: Cleanup ifdefs for IS_REACHABLE(CONFIG_MTK_CMDQ)
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, chunkuang.hu@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_231603_193929_A7374FC4 
X-CRM114-Status: UNSURE (   9.57  )
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

On Thu, Feb 16, 2023 at 9:03 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Now that the mtk-cmdq.h header contains inline functions for cases
> in which the driver is not enabled (either module or built-in), we
> can safely go on with cleaning up ifdefs for CMDQ handling.
>
> This also shows in a clearer manner that writing through CMDQ HW is
> optional and used only for performance purposes when/where wanted,
> needed and/or required.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

