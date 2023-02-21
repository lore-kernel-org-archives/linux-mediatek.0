Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B3FC61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPoBAzOY7l81ilf6DvBo+V6oHlkpvntjBu0BjLr0NvA=; b=JcdqHS30c/nqBdKcculDEdQYji
	G9cv8eolFvpIJdL+xtKVh8VmRHY29S/cLMQ4Nf5EdZ0QePgu3kOwBNRCukvgqmZSFoLuSYXBw1ls/
	J4MWn8rk0QDJLS2ngW6MKOlDoTiHaakOUrx+rv86PJ0D9BJ8EnpiWaCToOSsnsI4qbxEO9Ry5VHqv
	grhzKQ/ZWM5YCqzys32FU3jz65HKcjxomhGWOJvxVwjxcVy3+I3kVNbkJuSMiFStFbD1Ab18Arum9
	JSHdVgrMqqa7jCGFB4/3f2Ikyz003kKcUz1yD+3Ljjq0M4mBJ4OQVXls1V08Gryi0CnKOnCW/xuxB
	1+KM4l8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJf2-006VBt-5X; Tue, 21 Feb 2023 03:49:48 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJeq-006V8L-Dn
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:49:38 +0000
Received: by mail-vk1-xa31.google.com with SMTP id o14so2097007vkf.12
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GPoBAzOY7l81ilf6DvBo+V6oHlkpvntjBu0BjLr0NvA=;
        b=VtoDb0qi3qcRjGlBzBBUqnhe6uQSr398gnTnlzc2iewCSdq22ndDi3pbSxFV/2Y1x6
         yRYsqCfqawFjqoQYIEZxLBRxA/IOSuUZUDKBrnoCpioCqlHVCgx0E07C8y+cMKhmNwGV
         sXzYnlvp06VmHgdJJ7eLnzyLst0kMhc3o29gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPoBAzOY7l81ilf6DvBo+V6oHlkpvntjBu0BjLr0NvA=;
        b=J+Xx+ExlU7y0fNaMy4+mUAQ8zxRpGW8ohmn/0i47M8/YiSKtPvfOYboG617jtDe3zD
         8eScW7b4Uxi8YzjLIasXZZMMJ6G4ncEAx+QyWy/IU82EgYJk7WcWW42lCxP7poKV3CnO
         efNgsD5eCIvBrXZVvmyJE9uxwHn3UmxLGuQBDhKScxhBBn0ol8hjjPP4a9ulqxqKPsct
         68FJ1p0fBqR4v5U0SXkJztSWlD23RcdgrqhH7n2G3Yt/UxY90XCttv3J3bQMmZTj0hg1
         DEpbevk/m5tAMra2buklkDrjkIfq/i4WGCJ3rKKUr4cwvY/ij7GS4Cz38OPYlIt+9NRy
         L1HA==
X-Gm-Message-State: AO0yUKWTNYXMJsqGX67NolV3HpV+NmddbqyuEMpIxE8L5WQqded0qwXt
	hJ7+dgoYwQcvFdbm7J92wlRgM1ExMeKQilihzH7zgg==
X-Google-Smtp-Source: AK7set8Q7PtNTb6fxNMZPD61CAaqHdBZcNpoeaXFEaFzbmDAp9vIZ0gfeB0Nrm2cLOtunr0KW/yTajef/wfpYfrwpM4=
X-Received: by 2002:a1f:a3c8:0:b0:40b:9:82fd with SMTP id m191-20020a1fa3c8000000b0040b000982fdmr811653vke.18.1676951373136;
 Mon, 20 Feb 2023 19:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-29-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-29-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:49:21 +0800
Message-ID: <CAGXv+5EzYrGzXR+YtQdQnp-nP722XtMYFu4fo1KNoqpY3hpAPw@mail.gmail.com>
Subject: Re: [PATCH v3 28/55] clk: mediatek: mt8516: Move apmixedsys clock
 driver to its own file
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
X-CRM114-CacheID: sfid-20230220_194936_468510_795B223C 
X-CRM114-Status: UNSURE (   9.07  )
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

On Mon, Feb 20, 2023 at 11:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for migrating mt8516 clocks to the common simple
> probe mechanism, convert the apmixedsys to be a separated
> platform driver and move it to clk-mt8516-apmixedsys.c.
> While at it, also fix some indentation issues.
>
> During the conversion, error handling was added to the apmixedsys
> probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

