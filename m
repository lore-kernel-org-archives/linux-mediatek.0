Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89864C10F1B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 04:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MgAHjBPKfpctKgGxDc5Wt5hmeOw7QmtnTPav7sw6ms=; b=N3AMEa6VXFYgnwWJ2bCAhAhy/N
	qWrY8x1gsZ6P0vc2ydP2uXlmU4PDFbPkvMYwsaHlZnO96sMFvTtT/tdVfy/ar8Kwxw4uk1JXXOp70
	aeivp7uvj8cFJFLpL9LDJ7MJTNKEuqxOmK/Z0Uf885yT8MAZkivRlc6mAhwk0GRk7ddjq4fxMEUB7
	e311o9TwnHogA82kPpZ/6FzhIpwC0hn0eOZ4NWt2JveQjDrJ/+Enq62m5vGw1If+aD4QsOWCSUJ6i
	J59dbcVYh3KasR1wijLWtCiHLXdnXW2tzQ5Q5/NjxaL9SVdYBhYvNoCPTkgzE9+xZrw+g4RS3zfYP
	sOxro1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB79c-005Xm9-1Y; Fri, 30 Dec 2022 04:38:00 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB79Z-005Xjf-AT
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 04:37:58 +0000
Received: by mail-vs1-xe30.google.com with SMTP id k4so16232769vsc.4
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Dec 2022 20:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7MgAHjBPKfpctKgGxDc5Wt5hmeOw7QmtnTPav7sw6ms=;
        b=QLFUHtQDyMevODPY+6iYPWURMALSujLCXV8b2YtZFnflNTjUZu8E6WZS/gi7HObib7
         XHV93RbVPjaVZoFtXYE7ijrHqLzDm/9d7Xl9G2eHRLBzkcc86PsLUFbc2zeAlOOLf/Mn
         O0pkySdK91uRj3DnAWAL6TN0Yzn+ATUn/+pAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7MgAHjBPKfpctKgGxDc5Wt5hmeOw7QmtnTPav7sw6ms=;
        b=AcNwrPf+wcoz2LJSitFZkf3v70GtfahGWNTjCEXU93tCEFrjz7scCCzPQtIP9IYeRc
         BPyjmx0gOCzU/3XICc+bumKdpXaO+uSrEdEEkJaY4Lkq6iw5IQB+adJJhadoCIbE/hhE
         XwPldAm1yYMgHMoiuFymavkS/NJiMHbGsUB7kygoBe3LamCrZSkhmW65VY1au8TPWk7W
         hsjiwermbmG17CbicaQcWeFn2Del8G+ot2WwhGqv0cSBHUPSVmtsRAeEGAKQqiyWLiLL
         Ab0BYiqT9/hwOLUSlAYUHLMPkVcTEoYv6JUbvbfiEDEgxN+A8c7VYQfkwvq5O+xRHDT8
         P+7A==
X-Gm-Message-State: AFqh2kr7ILjKEN+bZRP5uwXvrVub7DrxT55NqAAyiZbHxYWuFV8Y+SCX
	N0Uo0kpCLXL5htUbH2i0HdBHEaYafJ3eGw2jyRAebg==
X-Google-Smtp-Source: AMrXdXtJ9DsOgWpo3oq9cdZhqPVc/WxniGJ0388vj8r1Kf4g7Nx5veR8u/GCEefKItg3gDeGWLA9nGN5uLG06h408kk=
X-Received: by 2002:a05:6102:3e06:b0:3b5:fd8:7948 with SMTP id
 j6-20020a0561023e0600b003b50fd87948mr3951754vsv.85.1672375075819; Thu, 29 Dec
 2022 20:37:55 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 12:37:44 +0800
Message-ID: <CAGXv+5EdiiQwN7yXtp9-K9+kYPgwk3sbtAk+JNFePefuwMyDcA@mail.gmail.com>
Subject: Re: [PATCH v2 05/23] clk: mediatek: clk-mtk: Propagate struct device
 for composites
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com, 
	chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com, 
	nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org, 
	daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com, 
	pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com, 
	ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_203757_442951_9B801B45 
X-CRM114-Status: UNSURE (   7.69  )
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

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Like done for cpumux clocks, propagate struct device for composite
> clocks registered through clk-mtk helpers to be able to get runtime
> pm support for MTK clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Same comment as the previous patches, could we move struct device
to the first parameter?

Otherwise this looks good to me.

ChenYu

