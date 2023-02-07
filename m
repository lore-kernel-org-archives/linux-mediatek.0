Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D6DC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 06:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/mLwk8/VVBrhfa6+5lxSIlHkjJ4T6hr1YCCbT0Qg1g=; b=c3ntRecWGZGBRx/RUyHZfOgTCu
	N2YAwzhv4mlTzNJcrUImJJr83ny5xF7Xho0c7+ObmcCWHZQ6QTrvHrIWMIuXrP9gS6nJQiMI29knn
	m7X9pxDMV4A6+NG0uML1nvwOuLlbOezMAG8CoRVqF2H/G1LmjQENHYFP09zxAYxro19hPRn3Hw28R
	14/hsUQy92cjURqIOr7f1/lrzhyl+kQyMoid32U3HNkzFoYSQ8x32fkp8nNKm34gXn81/tiTEn4WZ
	y9ta6nYSY8ORJNvRY9s7+Wbqj5xLdItLtxRhZm8RFY6mhSuUWXe2PjlovzZ4rUSvQOOllRsLkvwaV
	xYZmEAOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHbl-00B0Zj-Fw; Tue, 07 Feb 2023 06:37:37 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHbi-00B0Yf-Ek
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 06:37:35 +0000
Received: by mail-ua1-x932.google.com with SMTP id ay40so1839903uab.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 22:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S/mLwk8/VVBrhfa6+5lxSIlHkjJ4T6hr1YCCbT0Qg1g=;
        b=LY5C6x5ALQg9snkrab2Qwr3cZyZCKjr29UMJ20Do3DosX1QBg1T8SyPYUh5MVRWGG3
         Wp1XhTO8b5Rp9tVRvWtTrvtEKQWHbZ+zHh42Dc5+pWVjr+w8WqGlpssDEbKYqe2DzwUG
         u6jsRw/taNBb9+ptSvVuAMRaVhosHowZ4F7B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/mLwk8/VVBrhfa6+5lxSIlHkjJ4T6hr1YCCbT0Qg1g=;
        b=YnIKwBGd87114HDQifQUyp5rh7CuOXSjWszpKx99tmg+qfQepbpG/Z/siER5sySKH/
         9kbUgEPhubquCMW0eS/gyDQa7KIYj82PwYE5EsMLCyOdIS2I7iW9Ej86pIYJgwRhrfLT
         C6/h0vqQiBbWyHB44958rvTtNwaxBw/FKXLgqFWRiN0JBAoBGdxwHihgLdFPbRDwz0ft
         WfqoDhmoAQp/W2xMQAjHbHMWfYt2lQpLDONXJlzuPpmfTNQKNmFhu2i98VcXHP3J8RHc
         NvaFjm2VTR4DqhXj86/cJL0FsNCIbKhIn2fBHh+GcE1MFOpo9Vsj3yQU8dpTL1nEeE7w
         QW8w==
X-Gm-Message-State: AO0yUKWaSLhbnYlEbITmlhXjgBQhxzU20lGk49P6PbSHkyceCZoKQSk/
	EoobK1CKk8hcpdkz51T2Tz0qhgXl4Zb6+y9ZAC0LbA==
X-Google-Smtp-Source: AK7set+s3/+EOOTwnTt+Fj5G19N6k5DByCBAznUx9q6eZUWFVvTP5z6CKbaJ/gckiNnD/GCrTc7zSZxE0rfrQjty3MA=
X-Received: by 2002:ab0:76c4:0:b0:5f0:4676:e4f1 with SMTP id
 w4-20020ab076c4000000b005f04676e4f1mr411906uaq.44.1675751853046; Mon, 06 Feb
 2023 22:37:33 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-34-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 14:37:22 +0800
Message-ID: <CAGXv+5FjV4WdJcjtT_VXC3W02noPC9+qVGv=FVW6UmPXSeqksQ@mail.gmail.com>
Subject: Re: [PATCH v1 33/45] clk: mediatek: Switch to module_platform_driver()
 where possible
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
X-CRM114-CacheID: sfid-20230206_223734_512278_D176135C 
X-CRM114-Status: GOOD (  10.34  )
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
> Lots of clock drivers have got both .probe() and a .remove() callbacks:
> switch from builtin_platform_driver() to module_platform_driver() so
> that we actually register the .remove() callback.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

[...]

>  drivers/clk/mediatek/clk-mt8195-vpp0.c         | 2 +-
>  drivers/clk/mediatek/clk-mt8195-vpp1.c         | 2 +-

These two conflict with "clk: mediatek: remove MT8195 vppsys/0/1 simple_probe".
Since the rest of the vppsys stuff has been queued up, I'd like to see
that one get merged first so we don't have two drivers matching the same
compatible string.

This conflict also causes the last "clk: mediatek: Add MODULE_DEVICE_TABLE()
where appropriate" to not apply.

ChenYu

