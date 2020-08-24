Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4266C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 09:51:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 836312071E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 09:51:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cPYJ76XE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qn81eyst"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 836312071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ecPlCTDZKscshdSV51TcEZuvJ3gCLLwuiVHIn98dry4=; b=cPYJ76XEio+MLnU9Ores898/8
	4eSqJDM3YBW3RwpknxyoL0+9IAJGXSFeUbzDL8R36obaaGim4p/gNKKpl62vcw2Qj4NqznZqyKkAa
	GNw7wc9T4u7N2/WGYzBW6/BvWL4mNjxMxZgHvcObF1BgGmvCRPqCDpIw8Cw/3LkCreqplJHLnXXtN
	4TZCo3xIDH3AQpq9NN8YAulL8lKy5MZBq5qL22h7qtxOypbDP+FQZLrKKX3bzBW6cEQhdSw71sNcB
	VECKX+95znz/Pf7bY7CTdjVfOzKpWRp/i2jzWNk9QV4YUDAKXGszBUpn+Z4pDbiSxzkJK9g0EDxzy
	m0xCFZ39g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA98V-0005Zi-Mr; Mon, 24 Aug 2020 09:51:31 +0000
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA98H-0005Vq-Jm
 for linux-mediatek@lists.infradead.org; Mon, 24 Aug 2020 09:51:18 +0000
Received: by mail-ua1-x942.google.com with SMTP id 68so230445ual.3
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2020 02:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lAijYwEhVki3ASVGSGr03ujQoKI91GWpC9DTd+zqR0A=;
 b=qn81eystRutEQfbCLxokhFYJd8I+U2gytbLbne7CogTPMGmSh08XyhDIgI/v2QToR+
 kT+/d/FTJMHoVzz3GQRU0+WI6B5tzZ+g5lv9LH5R/ufdfMDth07OXvmKPldXy8R+wH7Z
 Aq5SkhxScTBiedB2/9jzUCfIpT/3HR3xNLXxDc8IhpGWJrhCkQwS1D8zEMM3mIUSJxFw
 0URvOSFzKErG49kZ5jM9Tiv5+m03GAQWPQAfPQgRvgOFExOanVct6VSB0hB39pWPLrgl
 EJzFdUbXrjRm6hTYef8Xl2JLpe+7wSmFt0+AIvnNwINNSPhjO0CbUMGnZBxP5rfshhka
 ChRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lAijYwEhVki3ASVGSGr03ujQoKI91GWpC9DTd+zqR0A=;
 b=Ihssfkjo0s29KTUvlKVNpTBk15/8z9fEs7fg6neWKRarMr0XptUosDrrY0sgGpLyQ8
 cDufA6wziHHc9d3baI93NDbCkM7NYWg2tAKL72FbgJiaB0ZhuZHvjblVfc/8g15+RYPH
 PdmTUgMOfFQYoCCBAX/yC4d22+2wqvsBMA82xg3BeOkcbpL7t9NZZAgJ+pnHVToZIl02
 R0z2xr4pvEK1dyPz8ga+RmzDpNNo4qEuKmnj658E5cchkgSh9TNlI5FapHofxZyONygH
 qv37chzTUXnz+K56yJ0UgfGHFo943alg4f6Xp3KNd5ISuPtUubsfUTNOFD0TWzXeUvWQ
 8fng==
X-Gm-Message-State: AOAM532+jy00lCLVLW2U55KHxjNFbTtphIYdZldsMCGw+NbnLOG6wAHL
 PeQ4zZBw+I1H3DeVlvl/Ux4WIRd0Hd1xZOJ0zifLWQ==
X-Google-Smtp-Source: ABdhPJzjncwbZlj5jNnq9VPppz4EGIptpW5meuYQu1QoZeXcpK4+nWbBg2mnjp49m9YA3c/5bJZ6ncdZPbElHbfd3mA=
X-Received: by 2002:ab0:3114:: with SMTP id e20mr1857025ual.104.1598262675798; 
 Mon, 24 Aug 2020 02:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200814014346.6496-1-wenbin.mei@mediatek.com>
 <20200814014346.6496-4-wenbin.mei@mediatek.com>
In-Reply-To: <20200814014346.6496-4-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 24 Aug 2020 11:50:38 +0200
Message-ID: <CAPDyKFqrjuHFr0b1xvHFXquELxwMG40wV8_XQF8Sp-HmRNHgmw@mail.gmail.com>
Subject: Re: [v5,3/3] mmc: mediatek: add optional module reset property
To: Wenbin Mei <wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_055117_959760_27CAFD63 
X-CRM114-Status: GOOD (  17.67  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 4.0+" <stable@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 14 Aug 2020 at 03:44, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> This patch fixs eMMC-Access on mt7622/Bpi-64.
> Before we got these Errors on mounting eMMC ion R64:
> [   48.664925] blk_update_request: I/O error, dev mmcblk0, sector 204800 op 0x1:(WRITE)
> flags 0x800 phys_seg 1 prio class 0
> [   48.676019] Buffer I/O error on dev mmcblk0p1, logical block 0, lost sync page write
>
> This patch adds a optional reset management for msdc.
> Sometimes the bootloader does not bring msdc register
> to default state, so need reset the msdc controller.
>
> Cc: <stable@vger.kernel.org> # v5.4+
> Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>

Applied for fixes, but needed to resolve a conflict when applying, thanks!


> ---
>  drivers/mmc/host/mtk-sd.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 39e7fc54c438..fc97d5bf3a20 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -22,6 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/interrupt.h>
> +#include <linux/reset.h>
>
>  #include <linux/mmc/card.h>
>  #include <linux/mmc/core.h>
> @@ -434,6 +435,7 @@ struct msdc_host {
>         struct msdc_save_para save_para; /* used when gate HCLK */
>         struct msdc_tune_para def_tune_para; /* default tune setting */
>         struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
> +       struct reset_control *reset;

I moved this a couple of lines above, since this conflicts with later
changes for mtk-sd.

[...]

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
