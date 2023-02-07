Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA9EC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Eq83+zfltzHzioahkJ/gN8eByDKiNqSvaMwpTmz0cc=; b=P7h+YZ4otSdAoBDTKLnJn+XrH9
	HIFQCvIvGh6+E/mdesTQzXaAp/9q9uhMDu+b1JWnq7jQ4dKQzpjkGquFHxpbw4RfzcEmePdGiIm+7
	PpyYb29LJ1dZBnl22HKFQY3q91POFkdVyfn8gVzMZDXeoGCAubFZGMh1HNHnDEELT3EP4Oz1eiNeh
	1PIUqbWY8cuCZm3NkIoYcrN/a1R01owLPMfZdfgnBvT2WUagSpyo/AnLuBkRAiRlAwUB3ePu8TbsY
	VPnd3XOSCxgpnmbSn/Yy1v5TlCvYCGYY/HcjGthAZFf99b4xgtdPVkmhzZxHoQAKF0VqukolAuMm3
	C5gt+ykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIXk-00BAL8-Oy; Tue, 07 Feb 2023 07:37:32 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIXZ-00BAHj-7y
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 07:37:22 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id i38so7426557vkd.0
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 23:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Eq83+zfltzHzioahkJ/gN8eByDKiNqSvaMwpTmz0cc=;
        b=fofbZd8M7f/nElHNqP5oEVeOB93RlhdFD1P7vohrxMeScOqN8g0wdp9JUBQ3L4hX4y
         dRxmCMtI5Tlp7mRuh2CTRoXdFKlHZmkXiltfO6rRc4bz4Gd9nXS+pyp/gjE+/GBgT9Mx
         uKBGf9AXHgJWnckS66ksBT5JNGUnKjP2F/208=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Eq83+zfltzHzioahkJ/gN8eByDKiNqSvaMwpTmz0cc=;
        b=unkVoX2QqupPvSFm2QeCCGWdZ75b9QIyhKGoDtTBy24OgvObib06FNMRTRz4KIgROO
         STXH5VBcywnmWfJBTAANOPOpHFDg8vGX+Yu19VzBaS9kWrN1hPCSnwKkdIV1E3S7XQhz
         WAkIM/jF5mQQEp/3nppVPMwNxd2wYtlOmieeUT50TDWxbM9WWeHg0lKaL6fR8/PjMxye
         9Ah+J4EvTK37EEfhqYj4Mkah6L9poqW26dQwBl8aMPehUTUT9qD5N/yXSgevI02Y1Wmy
         8cECCr5vX7awYdFNMdUHo90Pv6q7JfuU2dTuvqtqDVDibiA+hTCMctu5E7yNEcrtf6yu
         2PIQ==
X-Gm-Message-State: AO0yUKXtC9UuunAn8k4FjBTX7XiZnmgSNYnzk0SSXhR5YaLZ4QNp52Oz
	aMS53gvhLcjvHBXJMiEuswvgOLBi1nd3fac/iyWmWA==
X-Google-Smtp-Source: AK7set8+oe/35euhPGKOWNpwP1rIWDVm30YdB2iF9lTAcAZMzHT6Ovh83su0kOSRO015TReuBdiXOyyFb2V1TUCsJ0c=
X-Received: by 2002:a1f:1dd3:0:b0:3e8:8f:f3a7 with SMTP id d202-20020a1f1dd3000000b003e8008ff3a7mr266299vkd.30.1675755423013;
 Mon, 06 Feb 2023 23:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-15-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-15-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 15:36:51 +0800
Message-ID: <CAGXv+5FA3TzQc0L6AEi0O_gzDmRjJ=9gZdWhQZQ2wUnVm_T2Mw@mail.gmail.com>
Subject: Re: [PATCH v1 14/45] clk: mediatek: mt8167: Move apmixedsys as
 platform_driver in new file
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
X-CRM114-CacheID: sfid-20230206_233721_307148_FE91DCB9 
X-CRM114-Status: UNSURE (   8.47  )
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
> In preparation for migrating all other MT8167 clocks to the common
> mtk_clk_simple_probe(), move apmixedsys clocks to a different file.
> While at it, also migrate away from the legacy CLK_OF_DECLARE and
> convert this clock driver to be a platform_driver instead.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

`git diff --color-moved=dimmed-zebra --color-moved-ws=ignore-all-space`
agrees this is mostly code movement.

Same comment about clk-provider.h. Otherwise

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

