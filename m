Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B973FC636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 09:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z47jquheaISlmvaf1FVEcgmJUQJ8XYLvl0oKGBE77is=; b=A8aeGxZcty5Jz32VR6hV9UIIot
	n8Diihao3gwSC0x5Kjv/hTCKrMgmFYzLgTDhU5HD6u5jJEB/uLkUNyymJ9zlawf/5z6xUYlivme8I
	C4eRgopaG7l70oV8b4N4d9caUbD7k6fNxie+HayoTDw1SdUjZy8eHqfG2eag8dDTA8Dh/ngnu+E5w
	hrj75VKQnWkn6/CMQZ5wHKHWUb6OAqUpYQgxAWojquS72OJWUcBLelwPoTeg4i8kV2dFH2aEt+wNX
	01Kss+GEvblz/82ix7DHwOoiNomkXuHUOeuI18S0OWHzK2kQLBe+7bBsI4F/hEpg5HecdSGumIVl3
	O/MqM/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKTj-00BWnw-Ei; Tue, 07 Feb 2023 09:41:31 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKTa-00BWl9-5Y
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 09:41:23 +0000
Received: by mail-vs1-xe33.google.com with SMTP id v26so7860017vsk.8
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 01:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z47jquheaISlmvaf1FVEcgmJUQJ8XYLvl0oKGBE77is=;
        b=aYa9zIdLtif0FwTqlAZxpxZYrEurh8AKhOhMK3XToKB/QecPRTMdA1Fflvep/53b3L
         yvOUUxfWyt0mZhjXkWfy3hFC+RT/zoBQT/eEZXazsNpTqtgMvvgnkSS3490OHqoyahU+
         Y/grwzdCpJbh9rW94SKE1TcKDpHzazlb3HUHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z47jquheaISlmvaf1FVEcgmJUQJ8XYLvl0oKGBE77is=;
        b=NbLbd180/SD+Pyihw4VYNOQnc+nhgDfhd0Ulmgz/vm7eEjaJenRvjClVzweaHQaWuL
         0c0DOECyAuPAm47fWJ1+CNMPiexAvSSlfSkLnx8r2hNmydryW9ZrqcI4/9A9NgE0gf8l
         UFNn2F/mtLWjFaCGkrKcnG2EGDNFuvej6l/+JSpNe/SXcU1xeFcUhDXPKuF4UdlnU2NJ
         d++ECTGBJpYAxPaGLaMQF4QATTebgPkX1QnfbGCJwt6zM4Ijy2a0WoMdMVppKmqGdFXG
         RID/VuC5FS8ex7Ji9n6GKHs1+wlE2KX5aTqLn+yFNG9tvq5pkNaQ0eZqKewNwnFQUyhf
         hxLw==
X-Gm-Message-State: AO0yUKVYblq41l76rERZiRYG/t8v62kLOo3+qw/qHE+tjoyfaxBS5jA7
	s0aO0VHNuVNKYNWN/HbB+FGncPN5GFvfODK8rLvjxA==
X-Google-Smtp-Source: AK7set/0Pocl3IQY+0CFHfoLLcC5bZPmOMEhu0z0xP0ngcuSbBnObUD0C6IFTIgXY/RCiQll0BfBa+K/EcxnU37xCoU=
X-Received: by 2002:a67:d206:0:b0:3ed:2cd6:deed with SMTP id
 y6-20020a67d206000000b003ed2cd6deedmr644186vsi.65.1675762881149; Tue, 07 Feb
 2023 01:41:21 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-19-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-19-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 17:41:10 +0800
Message-ID: <CAGXv+5GYFv_Eqzbv9w4T6XWjuC-wnSp6Djj74dymChfXj6UXCw@mail.gmail.com>
Subject: Re: [PATCH v1 18/45] clk: mediatek: mt8183: Compress clocks arrays
 entries where possible
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
X-CRM114-CacheID: sfid-20230207_014122_242899_62413F7F 
X-CRM114-Status: UNSURE (   8.28  )
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
> Increase human readability and decrease number of lines by compressing
> the clock array entries where possible, to a maximum of ~90 columns.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt8183.c | 432 ++++++++++--------------------
>  1 file changed, 144 insertions(+), 288 deletions(-)

wdiff agrees. I'd go up to 100 columns though. Should be able to squeeze
out a couple more lines.

