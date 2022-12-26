Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95605C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 06:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKoRBsCZk8t5IRW6q7FXOzmG70vM+tRWxxCkDHcgI5s=; b=1PUU68obLLQaN5bElq06diBDF4
	k3f5O7AAuOOrW/Dw62/OBPDCYh025qHFRJKRdrhhbpR3JTiSfedS6IF0v8xb26aoyAWZl5seVjsr9
	1ow7xX64f381f8qFpN4weZmbjVgvmBoExJpU+EZX+myAGq9WtE/uMY/KZolIcq+qMDBaA1V1CbOd6
	cO0yJ2WmTvy4pOlSy03NavzxDnl2ZNVDQ2/iWEML5BMv1WNR/YOpc78/Glw0hYeyRVuhoFvpEL4nf
	/MQJzCBt4D+lqg5A6ylj3tP+OvijjhGNzbUvNg4UKRkcl0lNh74nCDhJQ9zr1Vsdf65iduQ7TZOW0
	jGTTsH7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9hP7-002PIJ-FQ; Mon, 26 Dec 2022 06:56:09 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9hP2-002PGs-Sk
	for linux-mediatek@lists.infradead.org; Mon, 26 Dec 2022 06:56:08 +0000
Received: by mail-vs1-xe36.google.com with SMTP id a64so6153766vsc.2
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Dec 2022 22:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nKoRBsCZk8t5IRW6q7FXOzmG70vM+tRWxxCkDHcgI5s=;
        b=Gh5L7i4lMdFGdpQcVXbyK2egNp5Z1yUnv6IBSCJIVgNBy8xEcu7FXNb0L5gzT9eP8z
         C+nRl2MuAO3DcFB2eY31UCof7isEZbIuENKeIinzKjIcHW2xZR/p0Qt8ht2DLvLrlMdA
         NtcVKDhvzKfjPGz17B1xY5nsAyPsyGGHsbTwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKoRBsCZk8t5IRW6q7FXOzmG70vM+tRWxxCkDHcgI5s=;
        b=jl/GByulcekyLprRBEIpeckVcO/SpRTc3MIcIhy7WxmAYaxVQ/2BpEQFjfpJEQf4oj
         PC7XNZfpzS69YhFmd3VZRVpvFPVSZkmLEAPupTNN4wEJU2I4B7bsSkQIBFnPz+EUjzy6
         Vx74km+OBIASLpyhHfhxuDGvEBje5bngG5AIr0lHUGBKq9gtzgwfzYsGLs3SYhsuDHUU
         2JmVEdKAW2S+Al8IBGX+1/Tvg8Uaw4NjP7sdLFdGUdflCL7FfOEqhRa4yu4VlALiKw7O
         YnS3EEPqjU5zuWj40jugM0gEQ6tiIizim6mCoHbZt0or9xF0uHTpe33dU8KPGyAh76Q6
         Ldxw==
X-Gm-Message-State: AFqh2kouqQWufdpa8Qc2TzVwzsGBUk2mq1bH/Zh8OrykYnuiGcaJj7cU
	NcXwlTUKqtVsD9dVzAleLtTK2gn9bW47UCugkzyrng==
X-Google-Smtp-Source: AMrXdXtihqlxHKqphDrGOCSc3OcIsPQPPIjiFqufrI1F9HDNZwbnCYgvr87cVSS4ITP2veDTDo3oR+pGal+18iKFQm8=
X-Received: by 2002:a05:6102:4427:b0:3b0:6da7:39ba with SMTP id
 df39-20020a056102442700b003b06da739bamr2383130vsb.26.1672037763548; Sun, 25
 Dec 2022 22:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Dec 2022 14:55:52 +0800
Message-ID: <CAGXv+5EQDzgT+1VL7MDNGzHXCa4WheemP6Ysn5=3sF6Gft=V0A@mail.gmail.com>
Subject: Re: [PATCH v2 01/23] clk: mediatek: mt8192: Correctly unregister and
 free clocks on failure
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
X-CRM114-CacheID: sfid-20221225_225604_964966_49066C59 
X-CRM114-Status: UNSURE (   6.40  )
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
> If anything fails during probe of the clock controller(s), unregister
> (and kfree!) whatever we have previously registered to leave with a
> clean state and prevent leaks.
>
> Fixes: 710573dee31b ("clk: mediatek: Add MT8192 basic clocks support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

