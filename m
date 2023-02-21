Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB10C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cfuibyga3kBcPYS2RK8Q0rhkGtFXfRUtTm1VmlKCtmI=; b=dW9hSN0HtT0iPp+mB4jhGdvwBc
	mWzz//Xm+OQI49fEBrD9ruEEp8SGy+qjJfkN0CEav/ZHF8u1WAROeBgHkLrnKCce7cPh6+z1EdRxs
	NkjckyIPwKPKHmWqyVQQjA+NFsxcjwHBK+pLdX7v42Vr2/lEc/pP3VRuDCagGBsBVH/LDdje1tGQH
	+a4v2nY4Ak4Lv8g9VY5MyeYW+Fwmewie3xnHaKN0xaPAxJPoFY2AdeZBTr3sFPQkqfrgRAD8My4zR
	S8YARJq3sLICsY/kfHiKoyXuyIcjyxCkFGHCAcdtWWcM4qDwjy/UdxgUzBTdy6jZlR5E+fygITlnc
	Mgo7HuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJbF-006U0W-4K; Tue, 21 Feb 2023 03:45:53 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJb1-006TuT-EH
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:45:40 +0000
Received: by mail-ua1-x932.google.com with SMTP id f20so165200uam.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cfuibyga3kBcPYS2RK8Q0rhkGtFXfRUtTm1VmlKCtmI=;
        b=MwOJMAu4C4BwoMTuljZj8PM7bIgbx+3783h0xl3r4CoGbA/Vm1iSJy+Q2khrV+7X45
         TH3CXPm06jtpwFkh08aND5340hknRrlKu/6XiaGgEW05/m6TbgyYIfMZULmKronFDec0
         NswtJhEXJOiuXqBK1DhvPkJmO7KNcHIPuchFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cfuibyga3kBcPYS2RK8Q0rhkGtFXfRUtTm1VmlKCtmI=;
        b=0+ir0tWbLHIrs4pb2DkaRrvCRInjEuC1q/DnmjbBIeMza6QWFmP7K8H1rU7bnjt172
         dAN+9YRZTyAkc8WFoWjBYbxDNXAXcWBFnzanmukBT2cUFeZEaAFpCQ82m1IY7ooQT+x5
         M8Mp12iWBTkMVzakZFXBj0GoRxo279QXlm25k2BdZOSBWbZ3bGCIgICzIDSzKQs8ZCiR
         UwDAddmrvYXmAmSY9PhaFx3EiXuSeu54TfnjsDsnqbgs+8D4cea+Q5vO8dfDnBPpEvlE
         XM84i7gzQ9EAizkeDcXwH9YfqrXyIa3uoh/yBvyc7GxtfBLY+DUhKYTzvqIFxfnbOLa5
         a9vQ==
X-Gm-Message-State: AO0yUKVmRFX0LqyCZHkXROZn1O8hVtce/ApbRbk4hujQ+Uot4nvrkaZ1
	E9RbhSoPjUdbuOfBm8ZfPRdBGsI3DMYn0lVhShqf6g==
X-Google-Smtp-Source: AK7set9sssRYKvNDSP4z192UFAq4Q6RMujJfk6fKp46gtcIEHXpa2JZkEjr830ufkrHiQa368xDo2jzjEb7Un/z/6pU=
X-Received: by 2002:a05:6130:3a7:b0:68d:10f8:b068 with SMTP id
 az39-20020a05613003a700b0068d10f8b068mr630828uab.1.1676951136616; Mon, 20 Feb
 2023 19:45:36 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:45:25 +0800
Message-ID: <CAGXv+5GC6nhgMpYA+Zrajxy8EYgkzL957AzpoCgu4+V6Z9PO9g@mail.gmail.com>
Subject: Re: [PATCH v3 03/55] clk: mediatek: Migrate to mtk_clk_pdev_probe()
 for multimedia clocks
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
X-CRM114-CacheID: sfid-20230220_194539_522069_C7DB00B3 
X-CRM114-Status: GOOD (  10.15  )
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
> Reduce duplication and simplify all MediaTek multimedia clock drivers
> by migrating away from defining custom probe functions for each driver
> and instead use mtk_clk_pdev_probe().
>
> While at it, also add a .remove() callback to all of the multimedia
> clock drivers where missing.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/clk/mediatek/clk-mt2701-mm.c   | 31 +++++---------
>  drivers/clk/mediatek/clk-mt2712-mm.c   | 31 +++++---------
>  drivers/clk/mediatek/clk-mt6779-mm.c   | 24 +++++------
>  drivers/clk/mediatek/clk-mt6795-mm.c   | 55 +++++-------------------
>  drivers/clk/mediatek/clk-mt6797-mm.c   | 31 +++++---------
>  drivers/clk/mediatek/clk-mt8167-mm.c   | 47 +++++----------------
>  drivers/clk/mediatek/clk-mt8173-mm.c   | 58 +++++---------------------
>  drivers/clk/mediatek/clk-mt8183-mm.c   | 24 +++++------
>  drivers/clk/mediatek/clk-mt8186-mm.c   | 56 +++++--------------------
>  drivers/clk/mediatek/clk-mt8192-mm.c   | 29 +++++--------
>  drivers/clk/mediatek/clk-mt8195-vdo0.c | 55 +++++-------------------
>  drivers/clk/mediatek/clk-mt8195-vdo1.c | 57 ++++++-------------------

>  drivers/clk/mediatek/clk-mt8195-vpp0.c | 54 +++++-------------------
>  drivers/clk/mediatek/clk-mt8195-vpp1.c | 54 +++++-------------------

This doesn't apply for these two files. Can you rebase onto clk-next?
Stephen hand applied v6 and edited of the vpp patches, not the final v7
version, so the code is slightly different, even though the functionality
is the same.

ChenYu

